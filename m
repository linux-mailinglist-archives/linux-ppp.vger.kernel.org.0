Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A248EFE323
	for <lists+linux-ppp@lfdr.de>; Fri, 15 Nov 2019 17:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbfKOQrT (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 15 Nov 2019 11:47:19 -0500
Received: from [31.15.61.139] ([31.15.61.139]:56558 "EHLO smtp.transmode.se"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727585AbfKOQrT (ORCPT <rfc822;linux-ppp@vger.kernel.org>);
        Fri, 15 Nov 2019 11:47:19 -0500
X-Greylist: delayed 353 seconds by postgrey-1.27 at vger.kernel.org; Fri, 15 Nov 2019 11:47:18 EST
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com [10.210.71.11])
        by smtp.transmode.se (Postfix) with ESMTP id CC6181186FC6;
        Fri, 15 Nov 2019 17:40:33 +0100 (CET)
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com [127.0.0.1])
        by gentoo-jocke.infinera.com (8.15.2/8.14.9) with ESMTP id xAFGeXDk018990;
        Fri, 15 Nov 2019 17:40:33 +0100
Received: (from jocke@localhost)
        by gentoo-jocke.infinera.com (8.15.2/8.15.2/Submit) id xAFGeXgg018989;
        Fri, 15 Nov 2019 17:40:33 +0100
From:   Joakim Tjernlund <joakim.tjernlund@infinera.com>
To:     linux-ppp@vger.kernel.org
Cc:     Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [PATCH 1/2] Change IPv6 route prefix to 128
Date:   Fri, 15 Nov 2019 17:40:30 +0100
Message-Id: <20191115164031.18940-1-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Adding a /10 route isn't useful. Covert to /128 host route so
one can actually ping the remote side.

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---
 pppd/sys-linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/pppd/sys-linux.c b/pppd/sys-linux.c
index 89263ed..42c9db4 100644
--- a/pppd/sys-linux.c
+++ b/pppd/sys-linux.c
@@ -2767,8 +2767,8 @@ int sif6addr (int unit, eui64_t our_eui64, eui64_t his_eui64)
     /* Route to remote host */
     memset(&rt6, 0, sizeof(rt6));
     IN6_LLADDR_FROM_EUI64(rt6.rtmsg_dst, his_eui64);
-    rt6.rtmsg_flags = RTF_UP;
-    rt6.rtmsg_dst_len = 10;
+    rt6.rtmsg_flags = RTF_UP | RTF_HOST;
+    rt6.rtmsg_dst_len = 128;
     rt6.rtmsg_ifindex = ifr.ifr_ifindex;
     rt6.rtmsg_metric = 1;
 
-- 
2.23.0

