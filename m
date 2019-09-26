Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A60DABECAF
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Sep 2019 09:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730760AbfIZHl0 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 26 Sep 2019 03:41:26 -0400
Received: from relay-b02.edpnet.be ([212.71.1.222]:33999 "EHLO
        relay-b02.edpnet.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730755AbfIZHl0 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 26 Sep 2019 03:41:26 -0400
X-ASG-Debug-ID: 1569482489-0a7b8d53c1ae5030001-vz1ewb
Received: from zotac.vandijck-laurijssen.be (77.109.114.181.adsl.dyn.edpnet.net [77.109.114.181]) by relay-b02.edpnet.be with ESMTP id ELdPLELAwpX4f4cp for <linux-ppp@vger.kernel.org>; Thu, 26 Sep 2019 09:21:29 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.114.181.adsl.dyn.edpnet.net[77.109.114.181]
X-Barracuda-Apparent-Source-IP: 77.109.114.181
Received: from x1.vandijck-laurijssen.be (74.250-240-81.adsl-static.isp.belgacom.be [81.240.250.74])
        by zotac.vandijck-laurijssen.be (Postfix) with ESMTPSA id 09915A02930;
        Thu, 26 Sep 2019 09:21:29 +0200 (CEST)
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To:     linux-ppp@vger.kernel.org
Cc:     Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Subject: [PATCH 7/9] pppoe: remove the use of cdefs
Date:   Thu, 26 Sep 2019 09:21:04 +0200
X-ASG-Orig-Subj: [PATCH 7/9] pppoe: remove the use of cdefs
Message-Id: <1569482466-9551-8-git-send-email-dev.kurt@vandijck-laurijssen.be>
X-Mailer: git-send-email 1.8.5.rc3
In-Reply-To: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
X-Barracuda-Connect: 77.109.114.181.adsl.dyn.edpnet.net[77.109.114.181]
X-Barracuda-Start-Time: 1569482489
X-Barracuda-URL: https://212.71.1.222:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 1097
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.6857 1.0000 1.2635
X-Barracuda-Spam-Score: 1.76
X-Barracuda-Spam-Status: No, SCORE=1.76 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=BSF_RULE7568M
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.76836
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
        0.50 BSF_RULE7568M          Custom Rule 7568M
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 pppd/plugins/rp-pppoe/config.h | 3 ---
 pppd/plugins/rp-pppoe/pppoe.h  | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/pppd/plugins/rp-pppoe/config.h b/pppd/plugins/rp-pppoe/config.h
index 5703087..a708859 100644
--- a/pppd/plugins/rp-pppoe/config.h
+++ b/pppd/plugins/rp-pppoe/config.h
@@ -101,9 +101,6 @@
 /* Define if you have the <netpacket/packet.h> header file.  */
 #define HAVE_NETPACKET_PACKET_H 1
 
-/* Define if you have the <sys/cdefs.h> header file.  */
-#define HAVE_SYS_CDEFS_H 1
-
 /* Define if you have the <sys/dlpi.h> header file.  */
 /* #undef HAVE_SYS_DLPI_H */
 
diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
index 813dcf3..55f0ca3 100644
--- a/pppd/plugins/rp-pppoe/pppoe.h
+++ b/pppd/plugins/rp-pppoe/pppoe.h
@@ -39,10 +39,6 @@
 #error Unknown method for accessing raw Ethernet frames
 #endif
 
-#ifdef HAVE_SYS_CDEFS_H
-#include <sys/cdefs.h>
-#endif
-
 #ifdef HAVE_SYS_SOCKET_H
 #include <sys/socket.h>
 #endif
-- 
1.8.5.rc3

