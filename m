Return-Path: <linux-ppp+bounces-477-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CClFB1n4zWmrjwYAu9opvQ
	(envelope-from <linux-ppp+bounces-477-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 07:02:17 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 888EB383CEF
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 07:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BF9A3021D08
	for <lists+linux-ppp@lfdr.de>; Thu,  2 Apr 2026 05:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB78317176;
	Thu,  2 Apr 2026 05:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Qlpe3Re6"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D381A681B
	for <linux-ppp@vger.kernel.org>; Thu,  2 Apr 2026 05:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775106133; cv=none; b=G8HET10wuay2882uAJDKC8YQql72uJ6G1HYtUT+S2iWNH4bJbRW9i0F3J8DS4H1mpYpoxoJVx0owiuWdvIH1opo1u/1g8IcgTr2R+mhB/QMCuUrJvoJClGvZk+fMXOlgDv/vQ70X4nJwsYUMEhutLhEoAE9vkX+/HJ82vpWx/2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775106133; c=relaxed/simple;
	bh=kaIriRj9Y96gVgW0M11CaZWr9mXieT69sbGTACNa2Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EIIZWorwsl2+/1TOGdUKP0O/ddhhEPepnD2KYAw+mZ6gD45iH9lUCFhbjbZuVsNDxcI//hgWgyGkKM5AnOlPcsYFCq1TwVdUUPOgnxZ1cnaPgqLRKGOo5CMhYxxYG/RK24QPgvNXHsYGiwt5uPG3jTlV96fnEUwPukzjnJ+BTNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Qlpe3Re6; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775106115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GVUkhJyGAtL71Hz+teyMzQ1MPLUD8PLTuR8Ajua73K8=;
	b=Qlpe3Re6gnDb63O5DY4YR+3DocRmh/nSMOG+THwa4f+b4GuhE/3nmDqLLtcDHaYPxXKyXS
	AaI39Xyuslfqmby0TtwNm1NbuPjWkne5L4wTr5K6Zj/JBHTtMdYB822+SS1e6R/FzNf7uJ
	7byaUgp47amZV9jNdlLvke3u7eEI8O0=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: linux-ppp@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Julian Braha <julianbraha@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>,
	Dianne Skoll <dianne@skoll.ca>,
	Jaco Kroon <jaco@uls.co.za>,
	James Carlson <carlsonj@workingcode.com>
Subject: [PATCH net-next v2] ppp: update Kconfig help message
Date: Thu,  2 Apr 2026 13:00:50 +0800
Message-ID: <20260402050053.144250-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-477-lists,linux-ppp=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linux.dev,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tldp.org:url,skoll.ca:url]
X-Rspamd-Queue-Id: 888EB383CEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Both links of the PPPoE section are no longer valid, and the CVS version
is no longer relevant.

- Replace the TLDP URL with the pppd project homepage.
- Update pppd version requirement for PPPoE.
- Update RP-PPPoE project homepage, and clarify that it's only needed
  for server mode.

Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
v2:
 - replace TLDP URL with pppd homepage
 - update pppd version requirement
 - document that rp-pppoe is only required for server
 https://lore.kernel.org/netdev/20260331033303.5664-1-dqfext@gmail.com/

 drivers/net/ppp/Kconfig | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ppp/Kconfig b/drivers/net/ppp/Kconfig
index f57fba84fe55..753354b4e36c 100644
--- a/drivers/net/ppp/Kconfig
+++ b/drivers/net/ppp/Kconfig
@@ -13,10 +13,9 @@ config PPP
 	  otherwise you can't use it; most Internet access providers these
 	  days support PPP rather than SLIP.
 
-	  To use PPP, you need an additional program called pppd as described
-	  in the PPP-HOWTO, available at
-	  <http://www.tldp.org/docs.html#howto>.  Make sure that you have
-	  the version of pppd recommended in <file:Documentation/Changes>.
+	  To use PPP, you need an additional program called pppd, available at
+	  <https://ppp.samba.org>.  Make sure that you have the version of pppd
+	  recommended in <file:Documentation/Changes>.
 	  The PPP option enlarges your kernel by about 16 KB.
 
 	  There are actually two versions of PPP: the traditional PPP for
@@ -116,11 +115,10 @@ config PPPOE
 	help
 	  Support for PPP over Ethernet.
 
-	  This driver requires the latest version of pppd from the CVS
-	  repository at cvs.samba.org.  Alternatively, see the
-	  RoaringPenguin package (<http://www.roaringpenguin.com/pppoe>)
-	  which contains instruction on how to use this driver (under
-	  the heading "Kernel mode PPPoE").
+	  To work in client mode, pppd version 2.4.2 or later is required.
+	  To work in server mode, the pppoe-server command from the RP-PPPoE
+	  package is also required, available at
+	  <https://dianne.skoll.ca/projects/rp-pppoe/>.
 
 choice
 	prompt "Number of PPPoE hash bits"
-- 
2.43.0


