Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 019B8451A0A
	for <lists+linux-ppp@lfdr.de>; Tue, 16 Nov 2021 00:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352185AbhKOXc2 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 15 Nov 2021 18:32:28 -0500
Received: from myhtic.telent.net ([176.126.240.165]:49870 "EHLO
        mail.telent.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354250AbhKOXaV (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 15 Nov 2021 18:30:21 -0500
X-Greylist: delayed 325 seconds by postgrey-1.27 at vger.kernel.org; Mon, 15 Nov 2021 18:30:21 EST
Received: from noetbook (8.8.e.5.0.d.0.b.3.2.f.c.c.d.6.7.e.d.0.4.a.3.e.d.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:de3a:40de:76dc:cf23:b0d0:5e88])
        by mail.telent.net (Postfix) with ESMTPSA id 2CAE7102CFB
        for <linux-ppp@vger.kernel.org>; Mon, 15 Nov 2021 23:21:53 +0000 (UTC)
From:   Daniel Barlow <dan@telent.net>
To:     linux-ppp@vger.kernel.org
Subject: [PATCH] add ipv6-{up,down}-script options
Date:   Sun, 14 Nov 2021 19:51:53 +0000
Message-ID: <874k8d57jj.fsf@telent.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org


These allow a user to specify the paths to the scripts
usually located at /etc/ppp/ipv6-up and /etc/ppp/ipv6-down,
similarly to the existing ip-up-script and ip-down-script
options

Signed-off-by: Daniel Barlow <dan@telent.net>
---
 NEWS           |  7 +++++++
 pppd/ipv6cp.c  |  8 ++++----
 pppd/main.c    |  4 ++++
 pppd/options.c | 14 ++++++++++++++
 pppd/pppd.h    |  5 +++++
 5 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/NEWS b/NEWS
index 9d6c7fb..53a5e1a 100644
--- a/NEWS
+++ b/NEWS
@@ -1,3 +1,10 @@
+What's new since ppp-2.4.9 (unreleased)
+***************************************
+
+* New pppd options:
+  - ipv6-up-script
+  - ipv6-down-script
+
 What's new in ppp-2.4.9.
 ************************
 
diff --git a/pppd/ipv6cp.c b/pppd/ipv6cp.c
index 8ab440a..cef1e38 100644
--- a/pppd/ipv6cp.c
+++ b/pppd/ipv6cp.c
@@ -1322,7 +1322,7 @@ ipv6cp_up(fsm *f)
      */
     if (ipv6cp_script_state == s_down && ipv6cp_script_pid == 0) {
 	ipv6cp_script_state = s_up;
-	ipv6cp_script(_PATH_IPV6UP);
+	ipv6cp_script(path_ipv6up);
     }
 }
 
@@ -1373,7 +1373,7 @@ ipv6cp_down(fsm *f)
     /* Execute the ipv6-down script */
     if (ipv6cp_script_state == s_up && ipv6cp_script_pid == 0) {
 	ipv6cp_script_state = s_down;
-	ipv6cp_script(_PATH_IPV6DOWN);
+	ipv6cp_script(path_ipv6down);
     }
 }
 
@@ -1411,13 +1411,13 @@ ipv6cp_script_done(void *arg)
     case s_up:
 	if (ipv6cp_fsm[0].state != OPENED) {
 	    ipv6cp_script_state = s_down;
-	    ipv6cp_script(_PATH_IPV6DOWN);
+	    ipv6cp_script(path_ipv6down);
 	}
 	break;
     case s_down:
 	if (ipv6cp_fsm[0].state == OPENED) {
 	    ipv6cp_script_state = s_up;
-	    ipv6cp_script(_PATH_IPV6UP);
+	    ipv6cp_script(path_ipv6up);
 	}
 	break;
     }
diff --git a/pppd/main.c b/pppd/main.c
index b1ac8b4..bdc6faa 100644
--- a/pppd/main.c
+++ b/pppd/main.c
@@ -300,6 +300,10 @@ main(int argc, char *argv[])
     strlcpy(path_ipup, _PATH_IPUP, sizeof(path_ipup));
     strlcpy(path_ipdown, _PATH_IPDOWN, sizeof(path_ipdown));
 
+#ifdef INET6
+    strlcpy(path_ipv6up, _PATH_IPV6UP, sizeof(path_ipv6up));
+    strlcpy(path_ipv6down, _PATH_IPV6DOWN, sizeof(path_ipv6down));
+#endif
     link_stats_valid = 0;
     new_phase(PHASE_INITIALIZE);
 
diff --git a/pppd/options.c b/pppd/options.c
index f3f5e25..c959283 100644
--- a/pppd/options.c
+++ b/pppd/options.c
@@ -131,6 +131,11 @@ int	child_wait = 5;		/* # seconds to wait for children at exit */
 struct userenv *userenv_list;	/* user environment variables */
 int	dfl_route_metric = -1;	/* metric of the default route to set over the PPP link */
 
+#ifdef INET6
+char	path_ipv6up[MAXPATHLEN];   /* pathname of ipv6-up script */
+char	path_ipv6down[MAXPATHLEN]; /* pathname of ipv6-down script */
+#endif
+
 #ifdef MAXOCTETS
 unsigned int  maxoctets = 0;    /* default - no limit */
 int maxoctets_dir = 0;       /* default - sum of traffic */
@@ -328,6 +333,15 @@ option_t general_options[] = {
       "Set pathname of ip-down script",
       OPT_PRIV|OPT_STATIC, NULL, MAXPATHLEN },
 
+#ifdef INET6
+    { "ipv6-up-script", o_string, path_ipv6up,
+      "Set pathname of ipv6-up script",
+      OPT_PRIV|OPT_STATIC, NULL, MAXPATHLEN },
+    { "ipv6-down-script", o_string, path_ipv6down,
+      "Set pathname of ipv6-down script",
+      OPT_PRIV|OPT_STATIC, NULL, MAXPATHLEN },
+#endif
+
 #ifdef HAVE_MULTILINK
     { "multilink", o_bool, &multilink,
       "Enable multilink operation", OPT_PRIO | 1 },
diff --git a/pppd/pppd.h b/pppd/pppd.h
index ab8f674..ce43a28 100644
--- a/pppd/pppd.h
+++ b/pppd/pppd.h
@@ -336,6 +336,11 @@ extern bool	dump_options;	/* print out option values */
 extern bool	dryrun;		/* check everything, print options, exit */
 extern int	child_wait;	/* # seconds to wait for children at end */
 
+#ifdef INET6
+extern char	path_ipv6up[MAXPATHLEN]; /* pathname of ipv6-up script */
+extern char	path_ipv6down[MAXPATHLEN]; /* pathname of ipv6-down script */
+#endif
+
 #if defined(USE_EAPTLS) || defined(USE_PEAP)
 
 #define TLS_VERIFY_NONE     "none"
-- 
2.31.1


