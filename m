Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0BBDBECAE
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Sep 2019 09:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730959AbfIZHl0 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 26 Sep 2019 03:41:26 -0400
Received: from relay-b02.edpnet.be ([212.71.1.222]:33997 "EHLO
        relay-b02.edpnet.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730760AbfIZHl0 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 26 Sep 2019 03:41:26 -0400
X-ASG-Debug-ID: 1569482489-0a7b8d53c2ae5550002-vz1ewb
Received: from zotac.vandijck-laurijssen.be (77.109.114.181.adsl.dyn.edpnet.net [77.109.114.181]) by relay-b02.edpnet.be with ESMTP id YCaI89YDDoXKb6QN for <linux-ppp@vger.kernel.org>; Thu, 26 Sep 2019 09:21:29 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.114.181.adsl.dyn.edpnet.net[77.109.114.181]
X-Barracuda-Apparent-Source-IP: 77.109.114.181
Received: from x1.vandijck-laurijssen.be (74.250-240-81.adsl-static.isp.belgacom.be [81.240.250.74])
        by zotac.vandijck-laurijssen.be (Postfix) with ESMTPSA id 1C1D6A02932;
        Thu, 26 Sep 2019 09:21:29 +0200 (CEST)
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To:     linux-ppp@vger.kernel.org
Cc:     Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Subject: [PATCH 8/9] make: avoid using host include for cross-compiling
Date:   Thu, 26 Sep 2019 09:21:05 +0200
X-ASG-Orig-Subj: [PATCH 8/9] make: avoid using host include for cross-compiling
Message-Id: <1569482466-9551-9-git-send-email-dev.kurt@vandijck-laurijssen.be>
X-Mailer: git-send-email 1.8.5.rc3
In-Reply-To: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
X-Barracuda-Connect: 77.109.114.181.adsl.dyn.edpnet.net[77.109.114.181]
X-Barracuda-Start-Time: 1569482489
X-Barracuda-URL: https://212.71.1.222:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 954
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: SPAM GLOBAL 0.9529 1.0000 3.8043
X-Barracuda-Spam-Score: 3.80
X-Barracuda-Spam-Status: No, SCORE=3.80 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.76836
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Prepend include paths with the toolchain's sysroot directory.
In case of a non-sysroot-aware toolchain, this does not help,
but does not break either.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 pppd/Makefile.linux | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/pppd/Makefile.linux b/pppd/Makefile.linux
index 8d5ce99..12a986e 100644
--- a/pppd/Makefile.linux
+++ b/pppd/Makefile.linux
@@ -125,7 +125,7 @@ CFLAGS   += -DHAS_SHADOW
 #LIBS     += -lshadow $(LIBS)
 endif
 
-ifneq ($(wildcard /usr/include/crypt.h),)
+ifneq ($(wildcard $(shell $CC --print-sysroot)/usr/include/crypt.h),)
 CFLAGS  += -DHAVE_CRYPT_H=1
 LIBS	+= -lcrypt
 endif
@@ -137,7 +137,7 @@ endif
 
 ifdef NEEDDES
 ifndef USE_CRYPT
-CFLAGS   += -I/usr/include/openssl
+CFLAGS   += -I$(shell $CC --print-sysroot)/usr/include/openssl
 LIBS     += -lcrypto
 else
 CFLAGS   += -DUSE_CRYPT=1
-- 
1.8.5.rc3

