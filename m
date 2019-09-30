Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4F7C20D3
	for <lists+linux-ppp@lfdr.de>; Mon, 30 Sep 2019 14:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729914AbfI3MqQ (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 30 Sep 2019 08:46:16 -0400
Received: from relay-b02.edpnet.be ([212.71.1.222]:40140 "EHLO
        relay-b02.edpnet.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729649AbfI3MqP (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 30 Sep 2019 08:46:15 -0400
X-ASG-Debug-ID: 1569847572-0a7b8d53c1daf120001-vz1ewb
Received: from zotac.vandijck-laurijssen.be (77.109.119.18.adsl.dyn.edpnet.net [77.109.119.18]) by relay-b02.edpnet.be with ESMTP id R9mTj3NG8JA9lN3m for <linux-ppp@vger.kernel.org>; Mon, 30 Sep 2019 14:46:12 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.119.18.adsl.dyn.edpnet.net[77.109.119.18]
X-Barracuda-Apparent-Source-IP: 77.109.119.18
Received: from x1.vandijck-laurijssen.be (74.250-240-81.adsl-static.isp.belgacom.be [81.240.250.74])
        by zotac.vandijck-laurijssen.be (Postfix) with ESMTPSA id 25919A18D5C
        for <linux-ppp@vger.kernel.org>; Mon, 30 Sep 2019 14:46:12 +0200 (CEST)
Date:   Mon, 30 Sep 2019 14:46:11 +0200
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To:     linux-ppp@vger.kernel.org
Subject: [PATCH 3/9 v2] radius: make rc_own_bind_ipaddress available through
 radiusclient.h
Message-ID: <20190930124611.GB27078@x1.vandijck-laurijssen.be>
X-ASG-Orig-Subj: [PATCH 3/9 v2] radius: make rc_own_bind_ipaddress available through
 radiusclient.h
Mail-Followup-To: linux-ppp@vger.kernel.org
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <1569482466-9551-4-git-send-email-dev.kurt@vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1569482466-9551-4-git-send-email-dev.kurt@vandijck-laurijssen.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Barracuda-Connect: 77.109.119.18.adsl.dyn.edpnet.net[77.109.119.18]
X-Barracuda-Start-Time: 1569847572
X-Barracuda-URL: https://212.71.1.222:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 698
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: SPAM GLOBAL 0.9840 1.0000 4.1576
X-Barracuda-Spam-Score: 4.66
X-Barracuda-Spam-Status: No, SCORE=4.66 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=BSF_RULE7568M
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.76962
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
        0.50 BSF_RULE7568M          Custom Rule 7568M
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

This commit adds a missing function declaration to the header file and
removes the compiler warning.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 pppd/plugins/radius/radiusclient.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pppd/plugins/radius/radiusclient.h b/pppd/plugins/radius/radiusclient.h
index 51b959a..cff0c26 100644
--- a/pppd/plugins/radius/radiusclient.h
+++ b/pppd/plugins/radius/radiusclient.h
@@ -440,6 +440,7 @@ UINT4 rc_get_ipaddr __P((char *));
 int rc_good_ipaddr __P((char *));
 const char *rc_ip_hostname __P((UINT4));
 UINT4 rc_own_ipaddress __P((void));
+UINT4 rc_own_bind_ipaddress __P((void));
 
 
 /*	sendserver.c		*/
