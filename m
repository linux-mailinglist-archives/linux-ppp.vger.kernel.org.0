Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B045BECA5
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Sep 2019 09:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730709AbfIZHkV (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 26 Sep 2019 03:40:21 -0400
Received: from relay-b01.edpnet.be ([212.71.1.221]:39821 "EHLO
        relay-b01.edpnet.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728263AbfIZHkV (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 26 Sep 2019 03:40:21 -0400
X-ASG-Debug-ID: 1569482489-0a7ff54e962117c0001-vz1ewb
Received: from zotac.vandijck-laurijssen.be (77.109.114.181.adsl.dyn.edpnet.net [77.109.114.181]) by relay-b01.edpnet.be with ESMTP id 3TJlTvbneHNX4uZx for <linux-ppp@vger.kernel.org>; Thu, 26 Sep 2019 09:21:29 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.114.181.adsl.dyn.edpnet.net[77.109.114.181]
X-Barracuda-Apparent-Source-IP: 77.109.114.181
Received: from x1.vandijck-laurijssen.be (74.250-240-81.adsl-static.isp.belgacom.be [81.240.250.74])
        by zotac.vandijck-laurijssen.be (Postfix) with ESMTPSA id D1CA8A0292C;
        Thu, 26 Sep 2019 09:21:28 +0200 (CEST)
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To:     linux-ppp@vger.kernel.org
Cc:     Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Subject: [PATCH 5/9] pppd: fix GLIBC version test for non-glibc toolchains
Date:   Thu, 26 Sep 2019 09:21:02 +0200
X-ASG-Orig-Subj: [PATCH 5/9] pppd: fix GLIBC version test for non-glibc toolchains
Message-Id: <1569482466-9551-6-git-send-email-dev.kurt@vandijck-laurijssen.be>
X-Mailer: git-send-email 1.8.5.rc3
In-Reply-To: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
X-Barracuda-Connect: 77.109.114.181.adsl.dyn.edpnet.net[77.109.114.181]
X-Barracuda-Start-Time: 1569482489
X-Barracuda-URL: https://212.71.1.221:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 637
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.7175 1.0000 1.5049
X-Barracuda-Spam-Score: 1.50
X-Barracuda-Spam-Status: No, SCORE=1.50 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.76836
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Non-glibc toolchains have their include files arranged more similar
to newer glibc's than to older.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 pppd/sys-linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pppd/sys-linux.c b/pppd/sys-linux.c
index 46e1ed4..a3f7fa6 100644
--- a/pppd/sys-linux.c
+++ b/pppd/sys-linux.c
@@ -102,7 +102,7 @@
 #define MAX_ADDR_LEN 7
 #endif
 
-#if __GLIBC__ >= 2
+#if !defined(__GLIBC__) || __GLIBC__ >= 2
 #include <asm/types.h>		/* glibc 2 conflicts with linux/types.h */
 #include <net/if.h>
 #include <net/if_arp.h>
-- 
1.8.5.rc3

