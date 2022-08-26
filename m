Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 701105A257F
	for <lists+linux-ppp@lfdr.de>; Fri, 26 Aug 2022 12:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245537AbiHZKHz (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 26 Aug 2022 06:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245368AbiHZKHX (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 26 Aug 2022 06:07:23 -0400
X-Greylist: delayed 847 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 26 Aug 2022 03:06:12 PDT
Received: from relay-b01.edpnet.be (relay-b01.edpnet.be [212.71.1.221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B718B13D2D
        for <linux-ppp@vger.kernel.org>; Fri, 26 Aug 2022 03:06:12 -0700 (PDT)
X-ASG-Debug-ID: 1661507521-15c43430cdccab80001-vz1ewb
Received: from srv21.vandijck-laurijssen.be (77.109.105.105.adsl.dyn.edpnet.net [77.109.105.105]) by relay-b01.edpnet.be with ESMTP id G3gAQw8Rpb0F7t0t for <linux-ppp@vger.kernel.org>; Fri, 26 Aug 2022 11:52:01 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.105.105.adsl.dyn.edpnet.net[77.109.105.105]
X-Barracuda-Apparent-Source-IP: 77.109.105.105
Received: from x1.vandijck-laurijssen.be (x1.vandijck-laurijssen.be [IPv6:fd01::1a1d:eaff:fe02:d339])
        by srv21.vandijck-laurijssen.be (Postfix) with ESMTPSA id 242391B0170;
        Fri, 26 Aug 2022 11:52:01 +0200 (CEST)
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To:     linux-ppp@vger.kernel.org
Cc:     Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Subject: [PATCH] pppd: add noresolvconf option
Date:   Fri, 26 Aug 2022 11:51:40 +0200
X-ASG-Orig-Subj: [PATCH] pppd: add noresolvconf option
Message-Id: <20220826095140.6974-1-dev.kurt@vandijck-laurijssen.be>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Barracuda-Connect: 77.109.105.105.adsl.dyn.edpnet.net[77.109.105.105]
X-Barracuda-Start-Time: 1661507521
X-Barracuda-URL: https://212.71.1.221:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 2567
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.100342
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On embedded systems, it is easier to avoid the resolv.conf conflicts
than to fix them.
'noresolvconf' option on top of 'usepeerdns' lets pppd request DNS information
and forward the info to the scripts, but will not write resolv.conf.
The ip-up/ip-down scripts can then deal with the info and no conflict ever
existed.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 pppd/ipcp.c | 6 +++++-
 pppd/pppd.8 | 5 ++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/pppd/ipcp.c b/pppd/ipcp.c
index 0dc251e..ade2064 100644
--- a/pppd/ipcp.c
+++ b/pppd/ipcp.c
@@ -93,6 +93,7 @@ struct notifier *ip_down_notifier = NULL;
 static int default_route_set[NUM_PPP];	/* Have set up a default route */
 static int proxy_arp_set[NUM_PPP];	/* Have created proxy arp entry */
 static bool usepeerdns;			/* Ask peer for DNS addrs */
+static bool resolvconf = 1;		/* deploy peer DNS addrs */
 static bool usepeerwins;		/* Ask peer for WINS addrs */
 static int ipcp_is_up;			/* have called np_up() */
 static int ipcp_is_open;		/* haven't called np_finished() */
@@ -221,6 +222,8 @@ static option_t ipcp_option_list[] = {
 
     { "usepeerdns", o_bool, &usepeerdns,
       "Ask peer for DNS address(es)", 1 },
+    { "noresolvconf", o_bool, &resolvconf,
+      "Ask for DNS but Don't deploy resolv.conf", OPT_A2CLR},
 
     { "usepeerwins", o_bool, &usepeerwins,
       "Ask peer for WINS address(es)", 1 },
@@ -1846,7 +1849,8 @@ ipcp_up(fsm *f)
 	script_setenv("DNS2", ip_ntoa(go->dnsaddr[1]), 0);
     if (usepeerdns && (go->dnsaddr[0] || go->dnsaddr[1])) {
 	script_setenv("USEPEERDNS", "1", 0);
-	create_resolv(go->dnsaddr[0], go->dnsaddr[1]);
+	if (resolvconf)
+	    create_resolv(go->dnsaddr[0], go->dnsaddr[1]);
     }
 
     if (go->winsaddr[0])
diff --git a/pppd/pppd.8 b/pppd/pppd.8
index 79b5bea..00d2489 100644
--- a/pppd/pppd.8
+++ b/pppd/pppd.8
@@ -1190,7 +1190,10 @@ by the peer (if any) are passed to the /etc/ppp/ip\-up script in the
 environment variables DNS1 and DNS2, and the environment variable
 USEPEERDNS will be set to 1.  In addition, pppd will create an
 /etc/ppp/resolv.conf file containing one or two nameserver lines with
-the address(es) supplied by the peer.
+the address(es) supplied by the peer, unless \fBresolvconf\fB is turned off.
+.TP
+.B noresolvconf
+Do not create /etc/ppp/resolv.conf with the DNS server addresses supplied by the peer.
 .TP
 .B usepeerwins
 Ask the peer for up to 2 WINS server addresses.  The addresses supplied
-- 
2.35.1

