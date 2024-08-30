Return-Path: <linux-ppp+bounces-78-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDE196629D
	for <lists+linux-ppp@lfdr.de>; Fri, 30 Aug 2024 15:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A64ABB21709
	for <lists+linux-ppp@lfdr.de>; Fri, 30 Aug 2024 13:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCD41A2860;
	Fri, 30 Aug 2024 13:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=email.cz header.i=@email.cz header.b="vc1KZE3V"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mxe.seznam.cz (mxe.seznam.cz [77.75.78.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA848196C6C
	for <linux-ppp@vger.kernel.org>; Fri, 30 Aug 2024 13:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.78.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725023261; cv=none; b=jqFTzlG44fGiolWM6Aw4vxJsM7cjKQ1t4pNeAtAcGxwOowrXPRGJb3QbvIjMQm2mX2waI2c1PHIC/0JZ0hRCmDCk4NL1PjKdIxLcMuiXg1CQI3kh+DELFcrk7gVHp/tBhoPVHNXvLWuokwtEoJkOe93+7lcvWLbnz5J7HSy3KQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725023261; c=relaxed/simple;
	bh=yKJ3qToKtdkBRu7mSNsUmg9x8BqoWHNuq9BPVlOy0rs=;
	h=From:To:Subject:Date:Message-Id:Mime-Version:Content-Type; b=Nvn06j0tN7AnLGcf4YxgnS6kprbjLsMTV5KMDDqztfTR/yGcDgdGsk9yyTWi8cGdl/SMaItqUzXzu5ZD0sJnUPMWiBkFTNomhsbZJzQpMGFfcIJZZL05deeqVhbzLGlooW3MzFDhvB5M18e08l77BBz8zmzMbbIEmWpy2Sp1gy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz; spf=pass smtp.mailfrom=email.cz; dkim=pass (2048-bit key) header.d=email.cz header.i=@email.cz header.b=vc1KZE3V; arc=none smtp.client-ip=77.75.78.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=email.cz
Received: from email.seznam.cz
	by smtpc-mxe-7df5484c66-k4bzx
	(smtpc-mxe-7df5484c66-k4bzx [2a02:598:64:8a00::1000:ad2])
	id 17f6d733e90265991778592b;
	Fri, 30 Aug 2024 15:07:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz;
	s=szn20221014; t=1725023252;
	bh=FQFq33860+YKLo2mpelnecM9jmBBQnmC/sJTi5dnuuM=;
	h=Received:From:To:Subject:Date:Message-Id:Mime-Version:X-Mailer:
	 Content-Type:Content-Transfer-Encoding;
	b=vc1KZE3VmdVIJqgVp10UjsC36uVaG73IczsUxA4YiZeXu+DAgW69c5nYGeWFQT7zW
	 IUyZEJtL/RS5hWPvii2gK3/YkZynUJ0xyR+/T1vc4Zx6ngjptr8UsXsc4qGZXsGXWL
	 FEE+JE0uzu4IuoFVUZ+tKgboHIuOga+peCZoNmA22SYLGry1QZESaLq6RJoOgpYiSZ
	 qsEjMRzIdJDiYSj71vqx0rzGieE1mC/kazj4hb49vmjdptdoz/X5IohQ4VvIAcWIgm
	 hlvXgIACJEgob3RwgWdMCnFsQvtAe9UL3B7muVrCb9O1JvNRS9vfw4WkS02nmV5LTV
	 Ns2WQZ7CQgKJQ==
Received: from 215-143.ktuo.cz (215-143.ktuo.cz [82.144.143.215])
	by email.seznam.cz (szn-UNKNOWN-unknown) with HTTP;
	Fri, 30 Aug 2024 15:07:30 +0200 (CEST)
From: "Tomas Paukrt" <tomaspaukrt@email.cz>
To: <linux-ppp@vger.kernel.org>
Subject: [PATCH] pppd: Add ip-pre-up-script option 
Date: Fri, 30 Aug 2024 15:07:30 +0200 (CEST)
Message-Id: <281.Zbtf.5ze4maPTbwf.1cqSGI@seznam.cz>
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

This option allow a user to specify the path to the script
usually located at /etc/ppp/ip-pre-up, similarly to the
existing ip-up-script and ip-down-script options.

Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 pppd/ipcp.c         | 4 ++--
 pppd/main.c         | 1 +
 pppd/options.c      | 4 ++++
 pppd/pppd-private.h | 1 +
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/pppd/ipcp.c b/pppd/ipcp.c
index 1cf7f79..190ff6a 100644
--- a/pppd/ipcp.c
+++ b/pppd/ipcp.c
@@ -1766,7 +1766,7 @@ ip_demand_conf(int u)
     }
     if (!sifaddr(u, wo->ouraddr, wo->hisaddr, GetMask(wo->ouraddr)))
 	return 0;
-    ipcp_script(PPP_PATH_IPPREUP, 1);
+    ipcp_script(path_ippreup, 1);
     if (!sifup(u))
 	return 0;
     if (!sifnpmode(u, PPP_IP, NPMODE_QUEUE))
@@ -1932,7 +1932,7 @@ ipcp_up(fsm *f)
 	ifindex =3D if_nametoindex(ifname);
 
 	/* run the pre-up script, if any, and wait for it to finish */
-	ipcp_script(PPP_PATH_IPPREUP, 1);
+	ipcp_script(path_ippreup, 1);
 
 	/* check if preup script renamed the interface */
 	if (!if_indextoname(ifindex, ifname)) {
diff --git a/pppd/main.c b/pppd/main.c
index 8310c98..c42b69f 100644
--- a/pppd/main.c
+++ b/pppd/main.c
@@ -367,6 +367,7 @@ main(int argc, char *argv[])
 
     strlcpy(path_ipup, PPP_PATH_IPUP, MAXPATHLEN);
     strlcpy(path_ipdown, PPP_PATH_IPDOWN, MAXPATHLEN);
+    strlcpy(path_ippreup, PPP_PATH_IPPREUP, MAXPATHLEN);
 
 #ifdef PPP_WITH_IPV6CP
     strlcpy(path_ipv6up, PPP_PATH_IPV6UP, MAXPATHLEN);
diff --git a/pppd/options.c b/pppd/options.c
index 227e615..2cdfaf2 100644
--- a/pppd/options.c
+++ b/pppd/options.c
@@ -123,6 +123,7 @@ int	connect_delay =3D 1000;	/* wait this many ms after=
 connect script */
 int	req_unit =3D -1;		/* requested interface unit */
 char	path_ipup[MAXPATHLEN];	/* pathname of ip-up script */
 char	path_ipdown[MAXPATHLEN];/* pathname of ip-down script */
+char	path_ippreup[MAXPATHLEN]; /* pathname of ip-pre-up script */
 char	req_ifname[IFNAMSIZ];	/* requested interface name */
 bool	multilink =3D 0;		/* Enable multilink operation */
 char	*bundle_name =3D NULL;	/* bundle name for multilink */
@@ -337,6 +338,9 @@ struct option general_options[] =3D {
     { "ip-down-script", o_string, path_ipdown,
       "Set pathname of ip-down script",
       OPT_PRIV|OPT_STATIC, NULL, MAXPATHLEN },
+    { "ip-pre-up-script", o_string, path_ippreup,
+      "Set pathname of ip-pre-up script",
+      OPT_PRIV|OPT_STATIC, NULL, MAXPATHLEN },
 
 #ifdef PPP_WITH_IPV6CP
     { "ipv6-up-script", o_string, path_ipv6up,
diff --git a/pppd/pppd-private.h b/pppd/pppd-private.h
index 46ce0c8..a38f58a 100644
--- a/pppd/pppd-private.h
+++ b/pppd/pppd-private.h
@@ -194,6 +194,7 @@ extern int	max_data_rate;	/* max bytes/sec through cha=
rshunt */
 extern int	req_unit;	/* interface unit number to use */
 extern char	path_ipup[]; 	/* pathname of ip-up script */
 extern char	path_ipdown[];	/* pathname of ip-down script */
+extern char	path_ippreup[];	/* pathname of ip-pre-up script */
 extern char	req_ifname[]; /* interface name to use (IFNAMSIZ) */
 extern bool	multilink;	/* enable multilink operation (options.c) */
 extern bool	noendpoint;	/* don't send or accept endpt. discrim. */
-- 
2.7.4
 

