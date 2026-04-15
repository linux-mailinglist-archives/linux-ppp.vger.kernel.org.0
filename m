Return-Path: <linux-ppp+bounces-531-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPi/HDVY32n1RwAAu9opvQ
	(envelope-from <linux-ppp+bounces-531-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 15 Apr 2026 11:19:49 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C38654027AD
	for <lists+linux-ppp@lfdr.de>; Wed, 15 Apr 2026 11:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7D843121241
	for <lists+linux-ppp@lfdr.de>; Wed, 15 Apr 2026 09:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601DF31960B;
	Wed, 15 Apr 2026 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WPd509RE"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635C03290A0
	for <linux-ppp@vger.kernel.org>; Wed, 15 Apr 2026 09:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244592; cv=none; b=CF+yzgv9tkXbkWcH4BONfE54885VAoYpIR6Ni2lkFTy8yyvyWPIDZHEZQvfEjOc2BrAyozxWNSzkhAA/Bg6B7QmptXuCC3/HqIakUH0WEOGsYBQ/PslREnSlsRI+yhriqb8EVk3bjixlbhS59OHPURCqLNf2g9iA2qJ1h/sZu5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244592; c=relaxed/simple;
	bh=j4lFk/+qPXA6eEIINMAlpfhUyBqIoNeTBMMGZLESU/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hfECMuCpkYSWHm/+M/CclL+4PbjrTQ/+oWjVFveRrAM9pdl2k3uxgDIJpGmpNCIkZDGRuzoOps9At1Pm5Ok5iVc8LVtcpSsqAy9CpIyeSGi39ymwF6fodzdf62VhuQeljWEZiZ4wMRHPweiHgoIlAD+fahY/LXDG6l+tkFVpOeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WPd509RE; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776244588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jm2OTrB1IC4L+3C9wJ4DJw6F0AdGiQYFZiRAbNrcD70=;
	b=WPd509RE6lp2b+OTbhpEbapnpR6N34LbMIueBdCgb89IWwy8E36ChS4JYQznXoYCxzK5P9
	CX/JFhBZhiopRUiFRhRodcYoKPgpsYrWClgOxKD9zJpsGwL8SbVJKGd/dl1SXhGD6z1Ldb
	ZlIyXqUpwHGiNqSneD9lsRycMMMhHMc=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Guillaume Nault <gnault@redhat.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>,
	linux-ppp@vger.kernel.org,
	Jaco Kroon <jaco@uls.co.za>,
	James Carlson <carlsonj@workingcode.com>,
	Dianne Skoll <dianne@skoll.ca>,
	Denys Fedoryshchenko <nuclearcat@nuclearcat.com>
Subject: [RFC PATCH net-next] pppoe: drop getsockname() syscall
Date: Wed, 15 Apr 2026 17:16:12 +0800
Message-ID: <20260415091614.266198-1-qingfang.deng@linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-531-lists,linux-ppp=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linux.dev,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email,linux.dev:dkim,linux.dev:mid]
X-Rspamd-Queue-Id: C38654027AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The getsockname syscall is not used by pppd. It also has two flaws:
1. It does not hold the socket lock, so if the struct is being changed
   in pppoe_connect() simultaneously, it may see partial updates.
2. If the lower network device is renamed, this operation still returns
   the original name.

Given it is unused and buggy, remove the syscall.

Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
Note: sent as RFC, since net-next is closed.

 drivers/net/ppp/pppoe.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index d546a7af0d54..0d64a16715e2 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -688,22 +688,6 @@ static int pppoe_connect(struct socket *sock, struct sockaddr_unsized *uservaddr
 	goto end;
 }
 
-static int pppoe_getname(struct socket *sock, struct sockaddr *uaddr,
-		  int peer)
-{
-	int len = sizeof(struct sockaddr_pppox);
-	struct sockaddr_pppox sp;
-
-	sp.sa_family	= AF_PPPOX;
-	sp.sa_protocol	= PX_PROTO_OE;
-	memcpy(&sp.sa_addr.pppoe, &pppox_sk(sock->sk)->pppoe_pa,
-	       sizeof(struct pppoe_addr));
-
-	memcpy(uaddr, &sp, len);
-
-	return len;
-}
-
 static int pppoe_ioctl(struct socket *sock, unsigned int cmd,
 		unsigned long arg)
 {
@@ -1049,7 +1033,7 @@ static const struct proto_ops pppoe_ops = {
 	.connect	= pppoe_connect,
 	.socketpair	= sock_no_socketpair,
 	.accept		= sock_no_accept,
-	.getname	= pppoe_getname,
+	.getname	= sock_no_getname,
 	.poll		= datagram_poll,
 	.listen		= sock_no_listen,
 	.shutdown	= sock_no_shutdown,
-- 
2.43.0


