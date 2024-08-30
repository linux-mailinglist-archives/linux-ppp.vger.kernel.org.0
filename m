Return-Path: <linux-ppp+bounces-79-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D75CB9662A0
	for <lists+linux-ppp@lfdr.de>; Fri, 30 Aug 2024 15:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07E1D1C2417A
	for <lists+linux-ppp@lfdr.de>; Fri, 30 Aug 2024 13:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C20A192D90;
	Fri, 30 Aug 2024 13:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=email.cz header.i=@email.cz header.b="JP4g0csI"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mxe.seznam.cz (mxe.seznam.cz [77.75.78.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE08D1ACDE8
	for <linux-ppp@vger.kernel.org>; Fri, 30 Aug 2024 13:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.78.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725023323; cv=none; b=G85D3kMfGtKGx4WA2Tm6R30iHb/Z/Hr6F/siO53jqmyo574Nqmo8J2Q0oCzwCsu0geJtNxyfjfRe9BUdYkmEBWMkGZtmBSk1p+xYUgl9jduWRp6DRXLYWWiCpfo6PSKkOcKYfg8/SOcw6NHiMRUpVnhhTSpAgzwMwlX7/kOfxo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725023323; c=relaxed/simple;
	bh=yGfgH6RJABxaoppIW0MMXscMNnNety+Rrn51vXscCvY=;
	h=From:To:Subject:Date:Message-Id:Mime-Version:Content-Type; b=ookU6MCSBrSh1TN9eLD2mAqYkc8206nYqwTh70mWOlHSFGmLctFRFaV12T8xQtdPubTWj2ulb1TAKpiXs+ZzSjMxXdA6MBowKqoGGfOQM7mnR0BZbAvV7IteM/wB6R8idjBumzH/aqzUIU0Kbfk6m8awq79Zn1wR9+15loIlMTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz; spf=pass smtp.mailfrom=email.cz; dkim=pass (2048-bit key) header.d=email.cz header.i=@email.cz header.b=JP4g0csI; arc=none smtp.client-ip=77.75.78.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=email.cz
Received: from email.seznam.cz
	by smtpc-mxe-85b96b7dcc-v4qq7
	(smtpc-mxe-85b96b7dcc-v4qq7 [2a02:598:128:8a00::1000:aa2])
	id 4d44950fb3b027a54dca1b17;
	Fri, 30 Aug 2024 15:08:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz;
	s=szn20221014; t=1725023316;
	bh=hUeDYg+kc6wVPTHsNpaHUDVM5F1QLBdxqDqqQVqigjY=;
	h=Received:From:To:Subject:Date:Message-Id:Mime-Version:X-Mailer:
	 Content-Type:Content-Transfer-Encoding;
	b=JP4g0csIe5l6xSQHeoKM5DtR6YOtrJSAGjm4sgqfCnjNp20mUtwN1N1aVyejJ6TOB
	 YZIvKSJvEmyRuTDeizllbN5H5Ub/LfFu6RL3OcgSJ0NqaiBMajF9aDp6/ef3TimnJ+
	 2g/jfoeG/wf0Sw4i/n3OkO5ztlDNF2Fle50h2AoFKcdkJK4++eMu4waVumalftxoDP
	 uFsjKg3DPszu4tIE2kZDejZS0dfSY+NyEOgatdQT5vDzyZwgoZbGWw4cnkdsInwelG
	 wT/S1/rGZBB/EzSP1DYitfk43RR5lAdXPzoLa3Cg3UlPZ0K7hJLIVm8rTSN9llhdbs
	 9l8BhEYoBZuLw==
Received: from 215-143.ktuo.cz (215-143.ktuo.cz [82.144.143.215])
	by email.seznam.cz (szn-UNKNOWN-unknown) with HTTP;
	Fri, 30 Aug 2024 15:08:34 +0200 (CEST)
From: "Tomas Paukrt" <tomaspaukrt@email.cz>
To: <linux-ppp@vger.kernel.org>
Subject: [PATCH] pppd: Add ipv6-pre-up-script option
Date: Fri, 30 Aug 2024 15:08:34 +0200 (CEST)
Message-Id: <286.Zbtj.66y80nIB5gy.1cqSHI@seznam.cz>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (szn-mime-2.1.61)
X-Mailer: szn-UNKNOWN-unknown
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

This option allow a user to specify the path to a script
that will be run before the interface is brought up,
similarly to the existing ip-pre-up script.

Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 pppd/ipv6cp.c       | 21 ++++++++++++++-------
 pppd/main.c         |  1 +
 pppd/options.c      |  4 ++++
 pppd/pathnames.h    |  1 +
 pppd/pppd-private.h |  1 +
 5 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/pppd/ipv6cp.c b/pppd/ipv6cp.c
index a36b1d9..9b0ef9d 100644
--- a/pppd/ipv6cp.c
+++ b/pppd/ipv6cp.c
@@ -322,7 +322,7 @@ struct protent ipv6cp_protent =3D {
 };
 
 static void ipv6cp_clear_addrs (int, eui64_t, eui64_t);
-static void ipv6cp_script (char *);
+static void ipv6cp_script (char *, int);
 static void ipv6cp_script_done (void *);
 
 /*
@@ -1235,6 +1235,7 @@ ipv6_demand_conf(int u)
 	eui64_magic_nz(wo->ourid);
     }
 
+    ipv6cp_script(path_ipv6preup, 1);
     if (!sif6up(u))
 	return 0;
     if (!sif6addr(u, wo->ourid, wo->hisid))
@@ -1342,6 +1343,9 @@ ipv6cp_up(fsm *f)
 	sifnpmode(f->unit, PPP_IPV6, NPMODE_PASS);
 
     } else {
+	/* run the pre-up script, if any, and wait for it to finish */
+	ipv6cp_script(path_ipv6preup, 1);
+
 	/* bring the interface up for IPv6 */
 	if (!sif6up(f->unit)) {
 	    if (debug)
@@ -1381,7 +1385,7 @@ ipv6cp_up(fsm *f)
      */
     if (ipv6cp_script_state =3D=3D s_down && ipv6cp_script_pid =3D=3D 0) =
{
 	ipv6cp_script_state =3D s_up;
-	ipv6cp_script(path_ipv6up);
+	ipv6cp_script(path_ipv6up, 0);
     }
 }
 
@@ -1432,7 +1436,7 @@ ipv6cp_down(fsm *f)
     /* Execute the ipv6-down script */
     if (ipv6cp_script_state =3D=3D s_up && ipv6cp_script_pid =3D=3D 0) {=

 	ipv6cp_script_state =3D s_down;
-	ipv6cp_script(path_ipv6down);
+	ipv6cp_script(path_ipv6down, 0);
     }
 }
 
@@ -1470,13 +1474,13 @@ ipv6cp_script_done(void *arg)
     case s_up:
 	if (ipv6cp_fsm[0].state !=3D OPENED) {
 	    ipv6cp_script_state =3D s_down;
-	    ipv6cp_script(path_ipv6down);
+	    ipv6cp_script(path_ipv6down, 0);
 	}
 	break;
     case s_down:
 	if (ipv6cp_fsm[0].state =3D=3D OPENED) {
 	    ipv6cp_script_state =3D s_up;
-	    ipv6cp_script(path_ipv6up);
+	    ipv6cp_script(path_ipv6up, 0);
 	}
 	break;
     }
@@ -1488,7 +1492,7 @@ ipv6cp_script_done(void *arg)
  * interface-name tty-name speed local-LL remote-LL.
  */
 static void
-ipv6cp_script(char *script)
+ipv6cp_script(char *script, int wait)
 {
     char strspeed[32], strlocal[64], strremote[64];
     char *argv[8];
@@ -1506,7 +1510,10 @@ ipv6cp_script(char *script)
     argv[6] =3D ipparam;
     argv[7] =3D NULL;
 
-    ipv6cp_script_pid =3D run_program(script, argv, 0, ipv6cp_script_done=
,
+    if (wait)
+      run_program(script, argv, 0, NULL, NULL, 1);
+    else
+      ipv6cp_script_pid =3D run_program(script, argv, 0, ipv6cp_script_do=
ne,
 				    NULL, 0);
 }
 
diff --git a/pppd/main.c b/pppd/main.c
index c42b69f..53250e7 100644
--- a/pppd/main.c
+++ b/pppd/main.c
@@ -372,6 +372,7 @@ main(int argc, char *argv[])
 #ifdef PPP_WITH_IPV6CP
     strlcpy(path_ipv6up, PPP_PATH_IPV6UP, MAXPATHLEN);
     strlcpy(path_ipv6down, PPP_PATH_IPV6DOWN, MAXPATHLEN);
+    strlcpy(path_ipv6preup, PPP_PATH_IPV6PREUP, MAXPATHLEN);
 #endif
     link_stats_valid =3D 0;
     link_stats_print =3D 1;
diff --git a/pppd/options.c b/pppd/options.c
index 2cdfaf2..8c3e74b 100644
--- a/pppd/options.c
+++ b/pppd/options.c
@@ -138,6 +138,7 @@ int	dfl_route_metric =3D -1;	/* metric of the default =
route to set over the PPP li
 #ifdef PPP_WITH_IPV6CP
 char	path_ipv6up[MAXPATHLEN];   /* pathname of ipv6-up script */
 char	path_ipv6down[MAXPATHLEN]; /* pathname of ipv6-down script */
+char	path_ipv6preup[MAXPATHLEN]; /* pathname of ipv6-pre-up script */
 #endif
 
 unsigned int  maxoctets =3D 0;    /* default - no limit */
@@ -349,6 +350,9 @@ struct option general_options[] =3D {
     { "ipv6-down-script", o_string, path_ipv6down,
       "Set pathname of ipv6-down script",
       OPT_PRIV|OPT_STATIC, NULL, MAXPATHLEN },
+    { "ipv6-pre-up-script", o_string, path_ipv6preup,
+      "Set pathname of ipv6-pre-up script",
+      OPT_PRIV|OPT_STATIC, NULL, MAXPATHLEN },
 #endif
 
 #ifdef PPP_WITH_MULTILINK
diff --git a/pppd/pathnames.h b/pppd/pathnames.h
index d08e8ef..b488236 100644
--- a/pppd/pathnames.h
+++ b/pppd/pathnames.h
@@ -119,6 +119,7 @@
 #ifdef PPP_WITH_IPV6CP
 #define PPP_PATH_IPV6UP         PPP_PATH_CONFDIR "/ipv6-up"
 #define PPP_PATH_IPV6DOWN       PPP_PATH_CONFDIR "/ipv6-down"
+#define PPP_PATH_IPV6PREUP      PPP_PATH_CONFDIR "/ipv6-pre-up"
 #endif
 
 #define PPP_PATH_PPPDB          PPP_PATH_VARRUN  "/pppd2.tdb"
diff --git a/pppd/pppd-private.h b/pppd/pppd-private.h
index a38f58a..bcee1fd 100644
--- a/pppd/pppd-private.h
+++ b/pppd/pppd-private.h
@@ -211,6 +211,7 @@ extern int  option_priority;    /* priority of current=
 options */
 #ifdef PPP_WITH_IPV6CP
 extern char	path_ipv6up[]; /* pathname of ipv6-up script */
 extern char	path_ipv6down[]; /* pathname of ipv6-down script */
+extern char	path_ipv6preup[]; /* pathname of ipv6-pre-up script */
 #endif
 
 #if defined(PPP_WITH_EAPTLS) || defined(PPP_WITH_PEAP)
-- 
2.7.4
 

