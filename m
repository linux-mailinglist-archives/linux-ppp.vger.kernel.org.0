Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 035B417D2AC
	for <lists+linux-ppp@lfdr.de>; Sun,  8 Mar 2020 09:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgCHIh0 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 8 Mar 2020 04:37:26 -0400
Received: from gbr.mailhost.iitsp.com ([217.147.85.13]:56052 "EHLO
        gbr.mailhost.iitsp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbgCHIh0 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 8 Mar 2020 04:37:26 -0400
X-Greylist: delayed 437 seconds by postgrey-1.27 at vger.kernel.org; Sun, 08 Mar 2020 04:37:25 EDT
X-Virus-Scanned: AllWorldIT Conarx anti-spam firewall
Received: by nkukard-desktop.local (Postfix, from userid 11000)
        id 48Zvg066Qnz1hwBB; Sun,  8 Mar 2020 08:30:04 +0000 (UTC)
From:   Nigel Kukard <nkukard@lbsd.net>
To:     linux-ppp@vger.kernel.org
Cc:     Nigel Kukard <nkukard@lbsd.net>
Subject: [PATCH] pppd: Fixed spelling 'unkown' => 'unknown'
Date:   Sun,  8 Mar 2020 08:29:58 +0000
Message-Id: <20200308082958.191555-1-nkukard@lbsd.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Fixed spelling in pppd/plugins/radius/config.c from 'unkown' to 'unknown'.

Signed-off-by: Nigel Kukard <nkukard@lbsd.net>
---
 pppd/plugins/radius/config.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/pppd/plugins/radius/config.c b/pppd/plugins/radius/config.c
index c5a4eeb..871cea0 100644
--- a/pppd/plugins/radius/config.c
+++ b/pppd/plugins/radius/config.c
@@ -273,7 +273,7 @@ char *rc_conf_str(char *optname)
 	option = find_option(optname, OT_STR);
 
 	if (option == NULL)
-		fatal("rc_conf_str: unkown config option requested: %s", optname);
+		fatal("rc_conf_str: unknown config option requested: %s", optname);
 	return (char *)option->val;
 }
 
@@ -284,7 +284,7 @@ int rc_conf_int(char *optname)
 	option = find_option(optname, OT_INT|OT_AUO);
 
 	if (option == NULL)
-		fatal("rc_conf_int: unkown config option requested: %s", optname);
+		fatal("rc_conf_int: unknown config option requested: %s", optname);
 	return *((int *)option->val);
 }
 
@@ -295,7 +295,7 @@ SERVER *rc_conf_srv(char *optname)
 	option = find_option(optname, OT_SRV);
 
 	if (option == NULL)
-		fatal("rc_conf_srv: unkown config option requested: %s", optname);
+		fatal("rc_conf_srv: unknown config option requested: %s", optname);
 	return (SERVER *)option->val;
 }
 
-- 
2.25.1

