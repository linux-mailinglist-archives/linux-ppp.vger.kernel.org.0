Return-Path: <linux-ppp+bounces-512-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id i0ypOJiP2GksfQgAu9opvQ
	(envelope-from <linux-ppp+bounces-512-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Apr 2026 07:50:16 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A083D260A
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Apr 2026 07:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A258C301186A
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Apr 2026 05:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEF3231830;
	Fri, 10 Apr 2026 05:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="N8sAclcM"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09751A304A
	for <linux-ppp@vger.kernel.org>; Fri, 10 Apr 2026 05:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775800213; cv=none; b=T4SWtocc4mW9IMZcgjOTz3FBG/QHFmI2AyjKerspOmNtdJDMiNB1L38yymFHWJsvl5+3Gi+hB6STw8g3rTXd4fweCeJtV1/YQKWBelXHng7YU0RjLjsTLuQSQ1U6+8FiWNwnUR0nlY/gjicsKSNPl8Mf2awlxNhJcnKJLC2viUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775800213; c=relaxed/simple;
	bh=lJY14HAgjlbDC5MMgj0Y9Z8jZCb6/15Ltu9d7vK6pco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bCexVmTEln8jubGDwXZL+373r9DI0rmy7oQn6iIs7r2LZ4WmMs0uhLObuuxcgCd8xnMaAlcSiLlecTEkhdonpAbc4czCdkXDr0oYdIZJ8mp4vHQfA7t6UR852LI3u/NbpCm93FKCRecvVV9g0XJgqNfJYYZLjBxZNfC7JUDeFzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=N8sAclcM; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775800209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aXAjkhsgn8oMAhQg8wQ1MCqTT2QGwagc/KA0hb1OpXU=;
	b=N8sAclcMYqNkU9hC+N3b6T/pvE3OyrA3cR+86pu/K7A5gXhql9qGKB9AgaarHZpPsbv92/
	v/qffi4SLSg0iugkMFWTMABIlm26HTc9NXhPGcJKdTlPJcAsD0eJU8WBFi1IEz3GsGktEy
	Kd6W/uf5yFF8g5HUdSraqnL71hzKcO4=
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
	Dawid Osuchowski <dawid.osuchowski@linux.intel.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-ppp@vger.kernel.org
Subject: [PATCH net-next v2 1/2] pppox: remove sk_pppox() helper
Date: Fri, 10 Apr 2026 13:49:49 +0800
Message-ID: <20260410054954.114031-1-qingfang.deng@linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-512-lists,linux-ppp=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linux.dev,gmail.com,linux.intel.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:dkim,linux.dev:email,linux.dev:mid]
X-Rspamd-Queue-Id: 31A083D260A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The sk member can be directly accessed from struct pppox_sock without
relying on type casting. Remove the sk_pppox() helper and update all
call sites to use po->sk directly.

Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
Changes in v2: none
 Link to v1: https://lore.kernel.org/r/20260408015138.280687-1-qingfang.deng@linux.dev

 drivers/net/ppp/pppoe.c  | 10 +++++-----
 drivers/net/ppp/pptp.c   |  6 +++---
 include/linux/if_pppox.h |  5 -----
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index 1ac61c273b28..d546a7af0d54 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -231,7 +231,7 @@ static inline struct pppox_sock *get_item(struct pppoe_net *pn, __be16 sid,
 	struct pppox_sock *po;
 
 	po = __get_item(pn, sid, addr, ifindex);
-	if (po && !refcount_inc_not_zero(&sk_pppox(po)->sk_refcnt))
+	if (po && !refcount_inc_not_zero(&po->sk.sk_refcnt))
 		po = NULL;
 
 	return po;
@@ -273,7 +273,7 @@ static void pppoe_flush_dev(struct net_device *dev)
 			if (!po)
 				break;
 
-			sk = sk_pppox(po);
+			sk = &po->sk;
 
 			/* We always grab the socket lock, followed by the
 			 * hash_lock, in that order.  Since we should hold the
@@ -413,7 +413,7 @@ static int pppoe_rcv(struct sk_buff *skb, struct net_device *dev,
 	if (!po)
 		goto drop;
 
-	return __sk_receive_skb(sk_pppox(po), skb, 0, 1, false);
+	return __sk_receive_skb(&po->sk, skb, 0, 1, false);
 
 drop:
 	kfree_skb(skb);
@@ -425,7 +425,7 @@ static void pppoe_unbind_sock_work(struct work_struct *work)
 {
 	struct pppox_sock *po = container_of(work, struct pppox_sock,
 					     proto.pppoe.padt_work);
-	struct sock *sk = sk_pppox(po);
+	struct sock *sk = &po->sk;
 
 	lock_sock(sk);
 	if (po->pppoe_dev) {
@@ -469,7 +469,7 @@ static int pppoe_disc_rcv(struct sk_buff *skb, struct net_device *dev,
 	po = get_item(pn, ph->sid, eth_hdr(skb)->h_source, dev->ifindex);
 	if (po)
 		if (!schedule_work(&po->proto.pppoe.padt_work))
-			sock_put(sk_pppox(po));
+			sock_put(&po->sk);
 
 abort:
 	kfree_skb(skb);
diff --git a/drivers/net/ppp/pptp.c b/drivers/net/ppp/pptp.c
index b18acd810561..cc8c102122d8 100644
--- a/drivers/net/ppp/pptp.c
+++ b/drivers/net/ppp/pptp.c
@@ -62,7 +62,7 @@ static struct pppox_sock *lookup_chan(u16 call_id, __be32 s_addr)
 		if (opt->dst_addr.sin_addr.s_addr != s_addr)
 			sock = NULL;
 		else
-			sock_hold(sk_pppox(sock));
+			sock_hold(&sock->sk);
 	}
 	rcu_read_unlock();
 
@@ -164,7 +164,7 @@ static int pptp_xmit(struct ppp_channel *chan, struct sk_buff *skb)
 	struct iphdr  *iph;
 	int    max_headroom;
 
-	if (sk_pppox(po)->sk_state & PPPOX_DEAD)
+	if (po->sk.sk_state & PPPOX_DEAD)
 		goto tx_drop;
 
 	rt = pptp_route_output(po, &fl4);
@@ -375,7 +375,7 @@ static int pptp_rcv(struct sk_buff *skb)
 	if (po) {
 		skb_dst_drop(skb);
 		nf_reset_ct(skb);
-		return sk_receive_skb(sk_pppox(po), skb, 0);
+		return sk_receive_skb(&po->sk, skb, 0);
 	}
 drop:
 	kfree_skb(skb);
diff --git a/include/linux/if_pppox.h b/include/linux/if_pppox.h
index 8bbf676c2a85..636772693f9a 100644
--- a/include/linux/if_pppox.h
+++ b/include/linux/if_pppox.h
@@ -57,11 +57,6 @@ static inline struct pppox_sock *pppox_sk(struct sock *sk)
 	return (struct pppox_sock *)sk;
 }
 
-static inline struct sock *sk_pppox(struct pppox_sock *po)
-{
-	return (struct sock *)po;
-}
-
 struct module;
 
 struct pppox_proto {
-- 
2.43.0


