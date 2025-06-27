Return-Path: <linux-ppp+bounces-312-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4DFAEB55A
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Jun 2025 12:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 366A81BC1A31
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Jun 2025 10:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3A52980A5;
	Fri, 27 Jun 2025 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G9fk/Hee";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qmu2KWDh"
X-Original-To: linux-ppp@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE912951A0;
	Fri, 27 Jun 2025 10:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751021420; cv=none; b=m2VTMWJoR1yhi6Zzxy96aFZdb0+VLHdNesOLLP3l/feFNqCGdndRapsMSdIpUVVL8wFT4bhO++VQnwvWhN7K1adp7STrw/Uy9Cst0SpGKQIRmayxknr/71gUgC0K1vB7q+mrao6G2J5OZLsN7IfW09gjOzn8yLOac9GcjHq5y50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751021420; c=relaxed/simple;
	bh=PhnPw8VKabqZqcnyP2oegTyX8gAvFTHpI1rkUaCFpPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tdv8+M9gDmxVodfpTF4/rGGL2PRw6rh4vA+XPsuQN9vMAyRBtMHPS/tdGA2rpXj2Efrk/QkQJ9t8xEPdndQ8Epzlxt076bj5+4JveYNDIkcX2f5f777zxA2dEViVy4390AhWQrakqk6I0JTziDiqRHOzGIhOHfDC793HgeeY0Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G9fk/Hee; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qmu2KWDh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 27 Jun 2025 12:50:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751021415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=FwXbVMpAFegirVQ0GOJGpeAUdcJY0/cvIkfdQkC0E1k=;
	b=G9fk/HeeiO4VrpDXW5aZHW+78c/b4lkuJUBS/RrrNij6bf+KDFM+Wu6rb/yMn4yWeFvw7F
	UhGgBCHZR7b2l/ldcmjMK7uBge3nB7VHBq3ReZMIelf/dGFwFcOjHmFJS844mwCNsgYHpb
	fvqN7e4ncbzsoFGlg3kRWnRGJuRm7B74CAPWZZ1ckBioe6e4oest39xyiyYc0AOpidt7QO
	KqInMzniuq767GYyeDBr1fOA9rtxlXs5cOEP6q8iJja5/1pxDso1LVO/oSa/X6iK0S+qQA
	GNvEYWm4Hsnen8VGL0wqo4kgDKXkxkHxmlDJJ6G0VnvdQ+VDb5LZbzhjds9kCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751021415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=FwXbVMpAFegirVQ0GOJGpeAUdcJY0/cvIkfdQkC0E1k=;
	b=qmu2KWDhBpNWlxB6bGhGgx23/Qm9lb/f/nZfIggA3bhXdCqZ+n0bEnTrOAMDWwYIdsgfB4
	If/FYbE6UfowUoCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Cc: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Williams <clrkwllms@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Gao Feng <gfree.wind@vip.163.com>,
	Guillaume Nault <g.nault@alphalink.fr>
Subject: [PATCH net-next] ppp: Replace per-CPU recursion counter with
 lock-owner field
Message-ID: <20250627105013.Qtv54bEk@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

The per-CPU variable ppp::xmit_recursion is protecting against recursion
due to wrong configuration of the ppp channels. The per-CPU variable
relies on disabled BH for its locking. Without per-CPU locking in
local_bh_disable() on PREEMPT_RT this data structure requires explicit
locking.

The ppp::xmit_recursion is used as a per-CPU boolean. The counter is
checked early in the send routing and the transmit path is only entered
if the counter is zero. Then the counter is incremented to avoid
recursion. It used to detect recursion on channel::downl and
ppp::wlock.

Replace the per-CPU ppp:xmit_recursion counter with an explicit owner
field for both structs.
pch_downl_lock() is helper to check for recursion on channel::downl and
either assign the owner field if there is no recursion.
__ppp_channel_push() is moved into ppp_channel_push() and gets the
recursion check unconditionally because it is based on the lock now.
The recursion check in ppp_xmit_process() is based on ppp::wlock which
is acquired by ppp_xmit_lock(). The locking is moved from
__ppp_xmit_process() into ppp_xmit_lock() to check the owner, lock and
then assign the owner in one spot.
The local_bh_disable() in ppp_xmit_lock() can be removed because
ppp_xmit_lock() disables BH as part of the locking.

Cc: Gao Feng <gfree.wind@vip.163.com>
Cc: Guillaume Nault <g.nault@alphalink.fr>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/net/ppp/ppp_generic.c | 94 ++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 50 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index def84e87e05b2..d7b10d60c5d08 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -132,7 +132,7 @@ struct ppp {
 	int		n_channels;	/* how many channels are attached 54 */
 	spinlock_t	rlock;		/* lock for receive side 58 */
 	spinlock_t	wlock;		/* lock for transmit side 5c */
-	int __percpu	*xmit_recursion; /* xmit recursion detect */
+	struct task_struct *wlock_owner;/* xmit recursion detect */
 	int		mru;		/* max receive unit 60 */
 	unsigned int	flags;		/* control bits 64 */
 	unsigned int	xstate;		/* transmit state bits 68 */
@@ -186,6 +186,7 @@ struct channel {
 	struct ppp_channel *chan;	/* public channel data structure */
 	struct rw_semaphore chan_sem;	/* protects `chan' during chan ioctl */
 	spinlock_t	downl;		/* protects `chan', file.xq dequeue */
+	struct task_struct *downl_owner;/* xmit recursion detect */
 	struct ppp	*ppp;		/* ppp unit we're connected to */
 	struct net	*chan_net;	/* the net channel belongs to */
 	netns_tracker	ns_tracker;
@@ -391,6 +392,24 @@ static const int npindex_to_ethertype[NUM_NP] = {
 #define ppp_unlock(ppp)		do { ppp_recv_unlock(ppp); \
 				     ppp_xmit_unlock(ppp); } while (0)
 
+static bool pch_downl_lock(struct channel *pch, struct ppp *ppp)
+{
+	if (pch->downl_owner == current) {
+		if (net_ratelimit())
+			netdev_err(ppp->dev, "recursion detected\n");
+		return false;
+	}
+	spin_lock(&pch->downl);
+	pch->downl_owner = current;
+	return true;
+}
+
+static void pch_downl_unlock(struct channel *pch)
+{
+	pch->downl_owner = NULL;
+	spin_unlock(&pch->downl);
+}
+
 /*
  * /dev/ppp device routines.
  * The /dev/ppp device is used by pppd to control the ppp unit.
@@ -1246,7 +1265,6 @@ static int ppp_dev_configure(struct net *src_net, struct net_device *dev,
 	struct ppp *ppp = netdev_priv(dev);
 	int indx;
 	int err;
-	int cpu;
 
 	ppp->dev = dev;
 	ppp->ppp_net = src_net;
@@ -1262,14 +1280,6 @@ static int ppp_dev_configure(struct net *src_net, struct net_device *dev,
 	spin_lock_init(&ppp->rlock);
 	spin_lock_init(&ppp->wlock);
 
-	ppp->xmit_recursion = alloc_percpu(int);
-	if (!ppp->xmit_recursion) {
-		err = -ENOMEM;
-		goto err1;
-	}
-	for_each_possible_cpu(cpu)
-		(*per_cpu_ptr(ppp->xmit_recursion, cpu)) = 0;
-
 #ifdef CONFIG_PPP_MULTILINK
 	ppp->minseq = -1;
 	skb_queue_head_init(&ppp->mrq);
@@ -1281,15 +1291,11 @@ static int ppp_dev_configure(struct net *src_net, struct net_device *dev,
 
 	err = ppp_unit_register(ppp, conf->unit, conf->ifname_is_set);
 	if (err < 0)
-		goto err2;
+		return err;
 
 	conf->file->private_data = &ppp->file;
 
 	return 0;
-err2:
-	free_percpu(ppp->xmit_recursion);
-err1:
-	return err;
 }
 
 static const struct nla_policy ppp_nl_policy[IFLA_PPP_MAX + 1] = {
@@ -1660,7 +1666,6 @@ static void ppp_setup(struct net_device *dev)
 /* Called to do any work queued up on the transmit side that can now be done */
 static void __ppp_xmit_process(struct ppp *ppp, struct sk_buff *skb)
 {
-	ppp_xmit_lock(ppp);
 	if (!ppp->closing) {
 		ppp_push(ppp);
 
@@ -1678,27 +1683,21 @@ static void __ppp_xmit_process(struct ppp *ppp, struct sk_buff *skb)
 	} else {
 		kfree_skb(skb);
 	}
-	ppp_xmit_unlock(ppp);
 }
 
 static void ppp_xmit_process(struct ppp *ppp, struct sk_buff *skb)
 {
-	local_bh_disable();
-
-	if (unlikely(*this_cpu_ptr(ppp->xmit_recursion)))
+	if (ppp->wlock_owner == current)
 		goto err;
 
-	(*this_cpu_ptr(ppp->xmit_recursion))++;
+	ppp_xmit_lock(ppp);
+	ppp->wlock_owner = current;
 	__ppp_xmit_process(ppp, skb);
-	(*this_cpu_ptr(ppp->xmit_recursion))--;
-
-	local_bh_enable();
-
+	ppp->wlock_owner = NULL;
+	ppp_xmit_unlock(ppp);
 	return;
 
 err:
-	local_bh_enable();
-
 	kfree_skb(skb);
 
 	if (net_ratelimit())
@@ -1903,7 +1902,9 @@ ppp_push(struct ppp *ppp)
 		list = list->next;
 		pch = list_entry(list, struct channel, clist);
 
-		spin_lock(&pch->downl);
+		if (!pch_downl_lock(pch, ppp))
+			goto free_out;
+
 		if (pch->chan) {
 			if (pch->chan->ops->start_xmit(pch->chan, skb))
 				ppp->xmit_pending = NULL;
@@ -1912,7 +1913,7 @@ ppp_push(struct ppp *ppp)
 			kfree_skb(skb);
 			ppp->xmit_pending = NULL;
 		}
-		spin_unlock(&pch->downl);
+		pch_downl_unlock(pch);
 		return;
 	}
 
@@ -1923,6 +1924,7 @@ ppp_push(struct ppp *ppp)
 		return;
 #endif /* CONFIG_PPP_MULTILINK */
 
+free_out:
 	ppp->xmit_pending = NULL;
 	kfree_skb(skb);
 }
@@ -2041,8 +2043,10 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 			pch->avail = 1;
 		}
 
+		if (!pch_downl_lock(pch, ppp))
+			continue;
+
 		/* check the channel's mtu and whether it is still attached. */
-		spin_lock(&pch->downl);
 		if (pch->chan == NULL) {
 			/* can't use this channel, it's being deregistered */
 			if (pch->speed == 0)
@@ -2050,7 +2054,7 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 			else
 				totspeed -= pch->speed;
 
-			spin_unlock(&pch->downl);
+			pch_downl_unlock(pch);
 			pch->avail = 0;
 			totlen = len;
 			totfree--;
@@ -2101,7 +2105,7 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 		 */
 		if (flen <= 0) {
 			pch->avail = 2;
-			spin_unlock(&pch->downl);
+			pch_downl_unlock(pch);
 			continue;
 		}
 
@@ -2146,14 +2150,14 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 		len -= flen;
 		++ppp->nxseq;
 		bits = 0;
-		spin_unlock(&pch->downl);
+		pch_downl_unlock(pch);
 	}
 	ppp->nxchan = i;
 
 	return 1;
 
  noskb:
-	spin_unlock(&pch->downl);
+	pch_downl_unlock(pch);
 	if (ppp->debug & 1)
 		netdev_err(ppp->dev, "PPP: no memory (fragment)\n");
 	++ppp->dev->stats.tx_errors;
@@ -2163,12 +2167,15 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 #endif /* CONFIG_PPP_MULTILINK */
 
 /* Try to send data out on a channel */
-static void __ppp_channel_push(struct channel *pch)
+static void ppp_channel_push(struct channel *pch)
 {
 	struct sk_buff *skb;
 	struct ppp *ppp;
 
+	read_lock_bh(&pch->upl);
 	spin_lock(&pch->downl);
+	pch->downl_owner = current;
+
 	if (pch->chan) {
 		while (!skb_queue_empty(&pch->file.xq)) {
 			skb = skb_dequeue(&pch->file.xq);
@@ -2182,24 +2189,13 @@ static void __ppp_channel_push(struct channel *pch)
 		/* channel got deregistered */
 		skb_queue_purge(&pch->file.xq);
 	}
+	pch->downl_owner = NULL;
 	spin_unlock(&pch->downl);
 	/* see if there is anything from the attached unit to be sent */
 	if (skb_queue_empty(&pch->file.xq)) {
 		ppp = pch->ppp;
 		if (ppp)
-			__ppp_xmit_process(ppp, NULL);
-	}
-}
-
-static void ppp_channel_push(struct channel *pch)
-{
-	read_lock_bh(&pch->upl);
-	if (pch->ppp) {
-		(*this_cpu_ptr(pch->ppp->xmit_recursion))++;
-		__ppp_channel_push(pch);
-		(*this_cpu_ptr(pch->ppp->xmit_recursion))--;
-	} else {
-		__ppp_channel_push(pch);
+			ppp_xmit_process(ppp, NULL);
 	}
 	read_unlock_bh(&pch->upl);
 }
@@ -3424,8 +3420,6 @@ static void ppp_destroy_interface(struct ppp *ppp)
 #endif /* CONFIG_PPP_FILTER */
 
 	kfree_skb(ppp->xmit_pending);
-	free_percpu(ppp->xmit_recursion);
-
 	free_netdev(ppp->dev);
 }
 
-- 
2.50.0


