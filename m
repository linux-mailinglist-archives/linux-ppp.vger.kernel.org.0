Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24AA6BECA8
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Sep 2019 09:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730746AbfIZHkW (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 26 Sep 2019 03:40:22 -0400
Received: from relay-b01.edpnet.be ([212.71.1.221]:39823 "EHLO
        relay-b01.edpnet.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730696AbfIZHkW (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 26 Sep 2019 03:40:22 -0400
X-ASG-Debug-ID: 1569482489-0a7ff54e962117c0002-vz1ewb
Received: from zotac.vandijck-laurijssen.be (77.109.114.181.adsl.dyn.edpnet.net [77.109.114.181]) by relay-b01.edpnet.be with ESMTP id HdEU3dT8woqG2yaO for <linux-ppp@vger.kernel.org>; Thu, 26 Sep 2019 09:21:29 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.114.181.adsl.dyn.edpnet.net[77.109.114.181]
X-Barracuda-Apparent-Source-IP: 77.109.114.181
Received: from x1.vandijck-laurijssen.be (74.250-240-81.adsl-static.isp.belgacom.be [81.240.250.74])
        by zotac.vandijck-laurijssen.be (Postfix) with ESMTPSA id 2F27DA02934;
        Thu, 26 Sep 2019 09:21:29 +0200 (CEST)
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To:     linux-ppp@vger.kernel.org
Cc:     Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Subject: [PATCH 9/9] pppd: refactor setjmp/longjmp with pipe pair in event wait loop
Date:   Thu, 26 Sep 2019 09:21:06 +0200
X-ASG-Orig-Subj: [PATCH 9/9] pppd: refactor setjmp/longjmp with pipe pair in event wait loop
Message-Id: <1569482466-9551-10-git-send-email-dev.kurt@vandijck-laurijssen.be>
X-Mailer: git-send-email 1.8.5.rc3
In-Reply-To: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
X-Barracuda-Connect: 77.109.114.181.adsl.dyn.edpnet.net[77.109.114.181]
X-Barracuda-Start-Time: 1569482489
X-Barracuda-URL: https://212.71.1.221:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 3515
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.8576 1.0000 2.7842
X-Barracuda-Spam-Score: 3.28
X-Barracuda-Spam-Status: No, SCORE=3.28 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=BSF_RULE7568M
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.76836
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
        0.50 BSF_RULE7568M          Custom Rule 7568M
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

setjmp/longjmp isn't supported by all compilers.
Having a pipe pair to wake an event wait loop from within a signal handler
is rather portable and common enough.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 pppd/main.c | 41 +++++++++++++++++++++++++----------------
 pppd/tty.c  |  1 -
 2 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/pppd/main.c b/pppd/main.c
index b0d772b..41be532 100644
--- a/pppd/main.c
+++ b/pppd/main.c
@@ -80,7 +80,6 @@
 #include <netdb.h>
 #include <utmp.h>
 #include <pwd.h>
-#include <setjmp.h>
 #include <sys/param.h>
 #include <sys/types.h>
 #include <sys/wait.h>
@@ -180,7 +179,7 @@ int got_sighup;
 
 static sigset_t signals_handled;
 static int waiting;
-static sigjmp_buf sigjmp;
+static int sigpipe[2];
 
 char **script_env;		/* Env. variable values for scripts */
 int s_env_nalloc;		/* # words avail at script_env */
@@ -598,19 +597,21 @@ static void
 handle_events()
 {
     struct timeval timo;
+    unsigned char buf[16];
 
     kill_link = open_ccp_flag = 0;
-    if (sigsetjmp(sigjmp, 1) == 0) {
-	sigprocmask(SIG_BLOCK, &signals_handled, NULL);
-	if (got_sighup || got_sigterm || got_sigusr2 || got_sigchld) {
-	    sigprocmask(SIG_UNBLOCK, &signals_handled, NULL);
-	} else {
-	    waiting = 1;
-	    sigprocmask(SIG_UNBLOCK, &signals_handled, NULL);
-	    wait_input(timeleft(&timo));
-	}
-    }
+
+    /* alert via signal pipe */
+    waiting = 1;
+    /* flush signal pipe */
+    for (; read(sigpipe[0], buf, sizeof(buf)) > 0; );
+    add_fd(sigpipe[0]);
+    /* wait if necessary */
+    if (!(got_sighup || got_sigterm || got_sigusr2 || got_sigchld))
+	wait_input(timeleft(&timo));
     waiting = 0;
+    remove_fd(sigpipe[0]);
+
     calltimeout();
     if (got_sighup) {
 	info("Hangup (SIGHUP)");
@@ -645,6 +646,14 @@ setup_signals()
 {
     struct sigaction sa;
 
+    /* create pipe to wake up event handler from signal handler */
+    if (pipe(sigpipe) < 0)
+	fatal("Couldn't create signal pipe: %m");
+    fcntl(sigpipe[0], F_SETFD, fcntl(sigpipe[0], F_GETFD) | FD_CLOEXEC);
+    fcntl(sigpipe[1], F_SETFD, fcntl(sigpipe[1], F_GETFD) | FD_CLOEXEC);
+    fcntl(sigpipe[0], F_SETFL, fcntl(sigpipe[0], F_GETFL) | O_NONBLOCK);
+    fcntl(sigpipe[1], F_SETFL, fcntl(sigpipe[1], F_GETFL) | O_NONBLOCK);
+
     /*
      * Compute mask of all interesting signals and install signal handlers
      * for each.  Only one signal handler may be active at a time.  Therefore,
@@ -1431,7 +1440,7 @@ hup(sig)
 	kill_my_pg(sig);
     notify(sigreceived, sig);
     if (waiting)
-	siglongjmp(sigjmp, 1);
+	write(sigpipe[1], &sig, sizeof(sig));
 }
 
 
@@ -1452,7 +1461,7 @@ term(sig)
 	kill_my_pg(sig);
     notify(sigreceived, sig);
     if (waiting)
-	siglongjmp(sigjmp, 1);
+	write(sigpipe[1], &sig, sizeof(sig));
 }
 
 
@@ -1466,7 +1475,7 @@ chld(sig)
 {
     got_sigchld = 1;
     if (waiting)
-	siglongjmp(sigjmp, 1);
+	write(sigpipe[1], &sig, sizeof(sig));
 }
 
 
@@ -1501,7 +1510,7 @@ open_ccp(sig)
 {
     got_sigusr2 = 1;
     if (waiting)
-	siglongjmp(sigjmp, 1);
+	write(sigpipe[1], &sig, sizeof(sig));
 }
 
 
diff --git a/pppd/tty.c b/pppd/tty.c
index c9a0b33..7ece675 100644
--- a/pppd/tty.c
+++ b/pppd/tty.c
@@ -83,7 +83,6 @@
 #include <netdb.h>
 #include <utmp.h>
 #include <pwd.h>
-#include <setjmp.h>
 #include <sys/param.h>
 #include <sys/types.h>
 #include <sys/wait.h>
-- 
1.8.5.rc3

