Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D66115AE52A
	for <lists+linux-ppp@lfdr.de>; Tue,  6 Sep 2022 12:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbiIFKT5 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 6 Sep 2022 06:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232059AbiIFKTz (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Tue, 6 Sep 2022 06:19:55 -0400
Received: from relay-b01.edpnet.be (relay-b01.edpnet.be [212.71.1.221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBEC0186F4
        for <linux-ppp@vger.kernel.org>; Tue,  6 Sep 2022 03:19:51 -0700 (PDT)
X-ASG-Debug-ID: 1662459588-15c43430ca14c11c0001-vz1ewb
Received: from srv21.vandijck-laurijssen.be (94.105.120.187.dyn.edpnet.net [94.105.120.187]) by relay-b01.edpnet.be with ESMTP id S4soGJMAMUQXCnR1 for <linux-ppp@vger.kernel.org>; Tue, 06 Sep 2022 12:19:48 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 94.105.120.187.dyn.edpnet.net[94.105.120.187]
X-Barracuda-Apparent-Source-IP: 94.105.120.187
Received: from x1.vandijck-laurijssen.be (x1.vandijck-laurijssen.be [IPv6:fd01::1a1d:eaff:fe02:d339])
        by srv21.vandijck-laurijssen.be (Postfix) with ESMTPSA id 2057B2D4F
        for <linux-ppp@vger.kernel.org>; Tue,  6 Sep 2022 12:19:48 +0200 (CEST)
Date:   Tue, 6 Sep 2022 12:19:46 +0200
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To:     linux-ppp@vger.kernel.org
Subject: RESEND: [PATCH] pppd: add noresolvconf option
Message-ID: <YxcewpV/B4ZyDxmL@x1.vandijck-laurijssen.be>
X-ASG-Orig-Subj: RESEND: [PATCH] pppd: add noresolvconf option
Mail-Followup-To: linux-ppp@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Mailer: git-send-email 2.35.1
X-Barracuda-Connect: 94.105.120.187.dyn.edpnet.net[94.105.120.187]
X-Barracuda-Start-Time: 1662459588
X-Barracuda-URL: https://212.71.1.221:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 2567
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.100594
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

