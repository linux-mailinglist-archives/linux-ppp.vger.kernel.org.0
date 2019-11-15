Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16F05FE324
	for <lists+linux-ppp@lfdr.de>; Fri, 15 Nov 2019 17:47:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727585AbfKOQrU (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 15 Nov 2019 11:47:20 -0500
Received: from [31.15.61.139] ([31.15.61.139]:58556 "EHLO smtp.transmode.se"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727678AbfKOQrT (ORCPT <rfc822;linux-ppp@vger.kernel.org>);
        Fri, 15 Nov 2019 11:47:19 -0500
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com [10.210.71.11])
        by smtp.transmode.se (Postfix) with ESMTP id AC183118C801;
        Fri, 15 Nov 2019 17:40:35 +0100 (CET)
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com [127.0.0.1])
        by gentoo-jocke.infinera.com (8.15.2/8.14.9) with ESMTP id xAFGeZ8E018994;
        Fri, 15 Nov 2019 17:40:35 +0100
Received: (from jocke@localhost)
        by gentoo-jocke.infinera.com (8.15.2/8.15.2/Submit) id xAFGeZd5018993;
        Fri, 15 Nov 2019 17:40:35 +0100
From:   Joakim Tjernlund <joakim.tjernlund@infinera.com>
To:     linux-ppp@vger.kernel.org
Cc:     Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [PATCH 2/2] Change IPv6 interface prefix to 128
Date:   Fri, 15 Nov 2019 17:40:31 +0100
Message-Id: <20191115164031.18940-2-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115164031.18940-1-joakim.tjernlund@infinera.com>
References: <20191115164031.18940-1-joakim.tjernlund@infinera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

/10 covers the whole Link Local range which is too big.

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---
 pppd/sys-linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/pppd/sys-linux.c b/pppd/sys-linux.c
index 42c9db4..8e65250 100644
--- a/pppd/sys-linux.c
+++ b/pppd/sys-linux.c
@@ -2757,7 +2757,7 @@ int sif6addr (int unit, eui64_t our_eui64, eui64_t his_eui64)
     memset(&ifr6, 0, sizeof(ifr6));
     IN6_LLADDR_FROM_EUI64(ifr6.ifr6_addr, our_eui64);
     ifr6.ifr6_ifindex = ifr.ifr_ifindex;
-    ifr6.ifr6_prefixlen = 10;
+    ifr6.ifr6_prefixlen = 128;
 
     if (ioctl(sock6_fd, SIOCSIFADDR, &ifr6) < 0) {
 	error("sif6addr: ioctl(SIOCSIFADDR): %m (line %d)", __LINE__);
@@ -2805,7 +2805,7 @@ int cif6addr (int unit, eui64_t our_eui64, eui64_t his_eui64)
     memset(&ifr6, 0, sizeof(ifr6));
     IN6_LLADDR_FROM_EUI64(ifr6.ifr6_addr, our_eui64);
     ifr6.ifr6_ifindex = ifr.ifr_ifindex;
-    ifr6.ifr6_prefixlen = 10;
+    ifr6.ifr6_prefixlen = 128;
 
     if (ioctl(sock6_fd, SIOCDIFADDR, &ifr6) < 0) {
 	if (errno != EADDRNOTAVAIL) {
-- 
2.23.0

