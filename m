Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2086BECA7
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Sep 2019 09:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbfIZHkV (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 26 Sep 2019 03:40:21 -0400
Received: from relay-b01.edpnet.be ([212.71.1.221]:39817 "EHLO
        relay-b01.edpnet.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730670AbfIZHkV (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 26 Sep 2019 03:40:21 -0400
X-ASG-Debug-ID: 1569482482-0a7ff54e982113c0002-vz1ewb
Received: from zotac.vandijck-laurijssen.be (77.109.114.181.adsl.dyn.edpnet.net [77.109.114.181]) by relay-b01.edpnet.be with ESMTP id MjvIqFAiMDCINyfy for <linux-ppp@vger.kernel.org>; Thu, 26 Sep 2019 09:21:24 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.114.181.adsl.dyn.edpnet.net[77.109.114.181]
X-Barracuda-Apparent-Source-IP: 77.109.114.181
Received: from x1.vandijck-laurijssen.be (74.250-240-81.adsl-static.isp.belgacom.be [81.240.250.74])
        by zotac.vandijck-laurijssen.be (Postfix) with ESMTPSA id E0677A02924;
        Thu, 26 Sep 2019 09:21:23 +0200 (CEST)
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To:     linux-ppp@vger.kernel.org
Cc:     Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Subject: [PATCH 1/9] magic: remove K&R style of arguments
Date:   Thu, 26 Sep 2019 09:20:58 +0200
X-ASG-Orig-Subj: [PATCH 1/9] magic: remove K&R style of arguments
Message-Id: <1569482466-9551-2-git-send-email-dev.kurt@vandijck-laurijssen.be>
X-Mailer: git-send-email 1.8.5.rc3
In-Reply-To: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
X-Barracuda-Connect: 77.109.114.181.adsl.dyn.edpnet.net[77.109.114.181]
X-Barracuda-Start-Time: 1569482484
X-Barracuda-URL: https://212.71.1.221:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 2054
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.8447 1.0000 2.6542
X-Barracuda-Spam-Score: 2.65
X-Barracuda-Spam-Status: No, SCORE=2.65 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.76836
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

The __P() macro does not exist in libmusl e.g.
I swicthed magic.{c,h} to using the std-c argument style, which had
already been used in some functions.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 pppd/magic.c | 15 +++++++--------
 pppd/magic.h |  6 +++---
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/pppd/magic.c b/pppd/magic.c
index 2fb23ff..3f3ce32 100644
--- a/pppd/magic.c
+++ b/pppd/magic.c
@@ -53,8 +53,8 @@
 
 static const char rcsid[] = RCSID;
 
-extern long mrand48 __P((void));
-extern void srand48 __P((long));
+extern long mrand48 (void);
+extern void srand48 (long);
 
 /*
  * magic_init - Initialize the magic number generator.
@@ -64,7 +64,7 @@ extern void srand48 __P((long));
  * and current time, currently.
  */
 void
-magic_init()
+magic_init(void)
 {
     long seed;
     struct timeval t;
@@ -78,7 +78,7 @@ magic_init()
  * magic - Returns the next magic number.
  */
 u_int32_t
-magic()
+magic(void)
 {
     return (u_int32_t) mrand48();
 }
@@ -102,20 +102,19 @@ random_bytes(unsigned char *buf, int len)
  */
 
 double
-drand48()
+drand48(void)
 {
     return (double)random() / (double)0x7fffffffL; /* 2**31-1 */
 }
 
 long
-mrand48()
+mrand48(void)
 {
     return random();
 }
 
 void
-srand48(seedval)
-long seedval;
+srand48(long seedval)
 {
     srandom((int)seedval);
 }
diff --git a/pppd/magic.h b/pppd/magic.h
index c81213b..9d399e3 100644
--- a/pppd/magic.h
+++ b/pppd/magic.h
@@ -42,8 +42,8 @@
  * $Id: magic.h,v 1.5 2003/06/11 23:56:26 paulus Exp $
  */
 
-void magic_init __P((void));	/* Initialize the magic number generator */
-u_int32_t magic __P((void));	/* Returns the next magic number */
+void magic_init (void);	/* Initialize the magic number generator */
+u_int32_t magic (void);	/* Returns the next magic number */
 
 /* Fill buffer with random bytes */
-void random_bytes __P((unsigned char *buf, int len));
+void random_bytes (unsigned char *buf, int len);
-- 
1.8.5.rc3

