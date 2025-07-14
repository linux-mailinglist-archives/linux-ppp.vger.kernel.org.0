Return-Path: <linux-ppp+bounces-319-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A770B039E3
	for <lists+linux-ppp@lfdr.de>; Mon, 14 Jul 2025 10:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBB541883399
	for <lists+linux-ppp@lfdr.de>; Mon, 14 Jul 2025 08:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AF0236A9F;
	Mon, 14 Jul 2025 08:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHIhWMZp"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E485918D;
	Mon, 14 Jul 2025 08:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752483109; cv=none; b=GnKgIk+rTsDl2tjQELCZVS+W8QTl7ARfoNaAABumO/iEI3I55CReIVyjlB401jW+TZNu+q1Qlipp7Md/DYl1Lb/33GDzLe3ulMD/JasE4XNPEcPzZXV+PwSXQG0tS4gnARPTElhgd4XVX0NGsBhQig/hUXFlL3uiD8CmLWXJXAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752483109; c=relaxed/simple;
	bh=0bq0K8OfL6M4aPku/VfCBSkagDTz0F+sbz+md0m69d8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=QvVHOfDoz0ivGVW10ZBJRJb/IfAfndBPrv3r57Zk1dbyo8g/4WgCXYx0nR3F0Uqb8mmvyAIMmYlApt04kbokmDwlHXye+p6nR1MV7mKKZqf8Ro87tEJlZosITaqkf9wtGdFrTNf+rwUXBlIh04vUOKL4NDeYZ2cyG5GbV+vw84o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHIhWMZp; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-74b54cead6cso2686542b3a.1;
        Mon, 14 Jul 2025 01:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752483107; x=1753087907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vjcaN3TK1/ipyAXF0Ozg91NsiOrwTAt3igwqT0Oz2yU=;
        b=YHIhWMZp/DHs8nNagj9U4jBf9KZL2HWgA2cs+gW1keNjzRiZbDRVI3nQf6CA9076ST
         H7Vc8sAwVm+zExI4Exhb4rcM2AKbE1GhbsPPGWWKvdHhpLi7VnjrYhfptq6oIDp6mI/i
         IaENOaLpWe+LMJkre3CA/3rehU2EuX70QvVsx/BjXPZKww0DZnKJS1ymzL/5yW+XUpB7
         npOCrH6xaBotFerSDzPQTeJCGenHAlcjaaroAOiqJ/qfl0OyuKUo8ZLXP01n0rjn2jWD
         q/IAE7rqv4ecYzFpl8UfX2FSWnLMnFlIgBG8GOIpEspF18dmDD6HzrT+8/W1AC6HTg0d
         gRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752483107; x=1753087907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vjcaN3TK1/ipyAXF0Ozg91NsiOrwTAt3igwqT0Oz2yU=;
        b=a1f7X+NXoyAOjzHFAztl7xb56gGF2AIeWO2x9t970p6K8vdIQx3QY4Qt/d0+bqnGRV
         GQzTSvesIOf8mGNFLG9QTz4m+yMAEA0ce+XxfkPXtmb9o/SikFHXCMEABrpsAb02T6W/
         Zpdc5ImUGWyeqB/32oiYl3rKo6PX7F543uLwi1EFjw44/9SNMf7J94nJ+9c8phEEPL81
         3Kccj2npqzfeiXhtTa6WWbiUQOg1tIdBiQHtyAtnyAHQD04KR/hqiFup1vyxvyXYOd5k
         IXwnHOSOKupp/MZQ+076anlPoKrpoH3n4Hx49+QAzVG8j49hDzoQA/1wucW1mqZEkvBr
         uSTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJtkz4nMNXDgmq6kH82YgJqoiEFZCwTK/1obepcB8TtTDsLpWYGri+ge4L6UPEH1caKY0TcyzUx61ydB8=@vger.kernel.org, AJvYcCUTUPUGWORSFqQx+fHhzoiofG2NTwoGhoVuiwxyuBZeteD0znUj15M6e1gKGZslr9Sn6P3TUQlj@vger.kernel.org, AJvYcCVzF9+obct164S1zwN0wFK0gIXzagOUjYT6C/+LOp7j6PfAjLUzAnUcmLB9w2L8S5/CitKY7NBsc93L@vger.kernel.org
X-Gm-Message-State: AOJu0YyFTQ6c8vu/L3xwlKQ+WoPr9iByzNbbkgjhLz3cNc8OPhZAN6iH
	QRD9ouuR4tm40Su3MIZjIsYM3J54sDox1D1IAbx92ynyaQlsG/s1Ntk0
X-Gm-Gg: ASbGncvhF9nq0sTQMADIRrDstfRjRty0y8L9A+wQp3m4bIThHad1g9y7z+mwwQSk+/U
	FdUAjwnuOgBvWB49t9HhfNBvp/FKg6sVVAqmOE1I91T8DpxKFO+SigZ4l4fX5pUVh8uMZiuf+5s
	dFDPXeE4cUvQsbFhqhMQonZki2sQMntwRsJmcEwB4+en90cliujqHLUaz9DoFfh1V7DKaDsiWpV
	DaoCK8zEd1dm6qxL4RdzKqmWtfldBkVEmSc/pQj389orKzYbE+fFvzPzmrAatwedYxrpzX50e0B
	86gsOFkFTPpvTwDjY4ltOG2pzLb9Rjfe7WtH8hGYebCyfZlhz0wl6VYEgA0mmvjnO2jbbADjyDX
	fS2aIAlCiXTIaTZMx
X-Google-Smtp-Source: AGHT+IGko9sPPq3tXLjmbCsU5NO6smqzZADUbzSqc4BdMPjej/nHJb87Y3cnK2TKEX4mxx3ILkMxPQ==
X-Received: by 2002:a05:6a21:398f:b0:21c:f778:6736 with SMTP id adf61e73a8af0-2312030f117mr21623496637.27.1752483107014;
        Mon, 14 Jul 2025 01:51:47 -0700 (PDT)
Received: from gmail.com ([116.237.168.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6c5660sm9571052a12.48.2025.07.14.01.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 01:51:43 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next] ppp: remove rwlock usage
Date: Mon, 14 Jul 2025 16:51:38 +0800
Message-ID: <20250714085139.2220182-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In struct channel, the upl lock is implemented using rwlock_t,
protecting access to pch->ppp and pch->bridge.

As previously discussed on the list, using rwlock in the network fast
path is not recommended.
This patch replaces the rwlock with a spinlock for writers, and uses RCU
for readers.

- pch->ppp and pch->bridge are now declared as __rcu pointers.
- Readers use rcu_dereference_bh() under rcu_read_lock_bh().
- Writers use spin_lock_bh() to update, followed by synchronize_rcu()
  where required.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/ppp_generic.c | 121 ++++++++++++++++++----------------
 1 file changed, 65 insertions(+), 56 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 4cf9d1822a83..bfa60a03ee4a 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -173,11 +173,11 @@ struct channel {
 	struct ppp_channel *chan;	/* public channel data structure */
 	struct rw_semaphore chan_sem;	/* protects `chan' during chan ioctl */
 	spinlock_t	downl;		/* protects `chan', file.xq dequeue */
-	struct ppp	*ppp;		/* ppp unit we're connected to */
+	struct ppp __rcu *ppp;		/* ppp unit we're connected to */
 	struct net	*chan_net;	/* the net channel belongs to */
 	netns_tracker	ns_tracker;
 	struct list_head clist;		/* link in list of channels per unit */
-	rwlock_t	upl;		/* protects `ppp' and 'bridge' */
+	spinlock_t	upl;		/* protects `ppp' and 'bridge' */
 	struct channel __rcu *bridge;	/* "bridged" ppp channel */
 #ifdef CONFIG_PPP_MULTILINK
 	u8		avail;		/* flag used in multilink stuff */
@@ -639,34 +639,34 @@ static struct bpf_prog *compat_ppp_get_filter(struct sock_fprog32 __user *p)
  */
 static int ppp_bridge_channels(struct channel *pch, struct channel *pchb)
 {
-	write_lock_bh(&pch->upl);
-	if (pch->ppp ||
+	spin_lock_bh(&pch->upl);
+	if (rcu_dereference_protected(pch->ppp, lockdep_is_held(&pch->upl)) ||
 	    rcu_dereference_protected(pch->bridge, lockdep_is_held(&pch->upl))) {
-		write_unlock_bh(&pch->upl);
+		spin_unlock_bh(&pch->upl);
 		return -EALREADY;
 	}
 	refcount_inc(&pchb->file.refcnt);
 	rcu_assign_pointer(pch->bridge, pchb);
-	write_unlock_bh(&pch->upl);
+	spin_unlock_bh(&pch->upl);
 
-	write_lock_bh(&pchb->upl);
-	if (pchb->ppp ||
+	spin_lock_bh(&pchb->upl);
+	if (rcu_dereference_protected(pchb->ppp, lockdep_is_held(&pch->upl)) ||
 	    rcu_dereference_protected(pchb->bridge, lockdep_is_held(&pchb->upl))) {
-		write_unlock_bh(&pchb->upl);
+		spin_unlock_bh(&pchb->upl);
 		goto err_unset;
 	}
 	refcount_inc(&pch->file.refcnt);
 	rcu_assign_pointer(pchb->bridge, pch);
-	write_unlock_bh(&pchb->upl);
+	spin_unlock_bh(&pchb->upl);
 
 	return 0;
 
 err_unset:
-	write_lock_bh(&pch->upl);
+	spin_lock_bh(&pch->upl);
 	/* Re-read pch->bridge with upl held in case it was modified concurrently */
 	pchb = rcu_dereference_protected(pch->bridge, lockdep_is_held(&pch->upl));
 	RCU_INIT_POINTER(pch->bridge, NULL);
-	write_unlock_bh(&pch->upl);
+	spin_unlock_bh(&pch->upl);
 	synchronize_rcu();
 
 	if (pchb)
@@ -680,25 +680,25 @@ static int ppp_unbridge_channels(struct channel *pch)
 {
 	struct channel *pchb, *pchbb;
 
-	write_lock_bh(&pch->upl);
+	spin_lock_bh(&pch->upl);
 	pchb = rcu_dereference_protected(pch->bridge, lockdep_is_held(&pch->upl));
 	if (!pchb) {
-		write_unlock_bh(&pch->upl);
+		spin_unlock_bh(&pch->upl);
 		return -EINVAL;
 	}
 	RCU_INIT_POINTER(pch->bridge, NULL);
-	write_unlock_bh(&pch->upl);
+	spin_unlock_bh(&pch->upl);
 
 	/* Only modify pchb if phcb->bridge points back to pch.
 	 * If not, it implies that there has been a race unbridging (and possibly
 	 * even rebridging) pchb.  We should leave pchb alone to avoid either a
 	 * refcount underflow, or breaking another established bridge instance.
 	 */
-	write_lock_bh(&pchb->upl);
+	spin_lock_bh(&pchb->upl);
 	pchbb = rcu_dereference_protected(pchb->bridge, lockdep_is_held(&pchb->upl));
 	if (pchbb == pch)
 		RCU_INIT_POINTER(pchb->bridge, NULL);
-	write_unlock_bh(&pchb->upl);
+	spin_unlock_bh(&pchb->upl);
 
 	synchronize_rcu();
 
@@ -2139,10 +2139,9 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 #endif /* CONFIG_PPP_MULTILINK */
 
 /* Try to send data out on a channel */
-static void __ppp_channel_push(struct channel *pch)
+static void __ppp_channel_push(struct channel *pch, struct ppp *ppp)
 {
 	struct sk_buff *skb;
-	struct ppp *ppp;
 
 	spin_lock(&pch->downl);
 	if (pch->chan) {
@@ -2161,7 +2160,6 @@ static void __ppp_channel_push(struct channel *pch)
 	spin_unlock(&pch->downl);
 	/* see if there is anything from the attached unit to be sent */
 	if (skb_queue_empty(&pch->file.xq)) {
-		ppp = pch->ppp;
 		if (ppp)
 			__ppp_xmit_process(ppp, NULL);
 	}
@@ -2169,15 +2167,18 @@ static void __ppp_channel_push(struct channel *pch)
 
 static void ppp_channel_push(struct channel *pch)
 {
-	read_lock_bh(&pch->upl);
-	if (pch->ppp) {
-		(*this_cpu_ptr(pch->ppp->xmit_recursion))++;
-		__ppp_channel_push(pch);
-		(*this_cpu_ptr(pch->ppp->xmit_recursion))--;
+	struct ppp *ppp;
+
+	rcu_read_lock_bh();
+	ppp = rcu_dereference_bh(pch->ppp);
+	if (ppp) {
+		(*this_cpu_ptr(ppp->xmit_recursion))++;
+		__ppp_channel_push(pch, ppp);
+		(*this_cpu_ptr(ppp->xmit_recursion))--;
 	} else {
-		__ppp_channel_push(pch);
+		__ppp_channel_push(pch, NULL);
 	}
-	read_unlock_bh(&pch->upl);
+	rcu_read_unlock_bh();
 }
 
 /*
@@ -2279,6 +2280,7 @@ void
 ppp_input(struct ppp_channel *chan, struct sk_buff *skb)
 {
 	struct channel *pch = chan->ppp;
+	struct ppp *ppp;
 	int proto;
 
 	if (!pch) {
@@ -2290,18 +2292,19 @@ ppp_input(struct ppp_channel *chan, struct sk_buff *skb)
 	if (ppp_channel_bridge_input(pch, skb))
 		return;
 
-	read_lock_bh(&pch->upl);
+	rcu_read_lock_bh();
+	ppp = rcu_dereference_bh(pch->ppp);
 	if (!ppp_decompress_proto(skb)) {
 		kfree_skb(skb);
-		if (pch->ppp) {
-			++pch->ppp->dev->stats.rx_length_errors;
-			ppp_receive_error(pch->ppp);
+		if (ppp) {
+			++ppp->dev->stats.rx_length_errors;
+			ppp_receive_error(ppp);
 		}
 		goto done;
 	}
 
 	proto = PPP_PROTO(skb);
-	if (!pch->ppp || proto >= 0xc000 || proto == PPP_CCPFRAG) {
+	if (!ppp || proto >= 0xc000 || proto == PPP_CCPFRAG) {
 		/* put it on the channel queue */
 		skb_queue_tail(&pch->file.rq, skb);
 		/* drop old frames if queue too long */
@@ -2310,11 +2313,11 @@ ppp_input(struct ppp_channel *chan, struct sk_buff *skb)
 			kfree_skb(skb);
 		wake_up_interruptible(&pch->file.rwait);
 	} else {
-		ppp_do_recv(pch->ppp, skb, pch);
+		ppp_do_recv(ppp, skb, pch);
 	}
 
 done:
-	read_unlock_bh(&pch->upl);
+	rcu_read_unlock_bh();
 }
 
 /* Put a 0-length skb in the receive queue as an error indication */
@@ -2323,20 +2326,22 @@ ppp_input_error(struct ppp_channel *chan, int code)
 {
 	struct channel *pch = chan->ppp;
 	struct sk_buff *skb;
+	struct ppp *ppp;
 
 	if (!pch)
 		return;
 
-	read_lock_bh(&pch->upl);
-	if (pch->ppp) {
+	rcu_read_lock_bh();
+	ppp = rcu_dereference_bh(pch->ppp);
+	if (ppp) {
 		skb = alloc_skb(0, GFP_ATOMIC);
 		if (skb) {
 			skb->len = 0;		/* probably unnecessary */
 			skb->cb[0] = code;
-			ppp_do_recv(pch->ppp, skb, pch);
+			ppp_do_recv(ppp, skb, pch);
 		}
 	}
-	read_unlock_bh(&pch->upl);
+	rcu_read_unlock_bh();
 }
 
 /*
@@ -2884,7 +2889,6 @@ int ppp_register_net_channel(struct net *net, struct ppp_channel *chan)
 
 	pn = ppp_pernet(net);
 
-	pch->ppp = NULL;
 	pch->chan = chan;
 	pch->chan_net = get_net_track(net, &pch->ns_tracker, GFP_KERNEL);
 	chan->ppp = pch;
@@ -2895,7 +2899,7 @@ int ppp_register_net_channel(struct net *net, struct ppp_channel *chan)
 #endif /* CONFIG_PPP_MULTILINK */
 	init_rwsem(&pch->chan_sem);
 	spin_lock_init(&pch->downl);
-	rwlock_init(&pch->upl);
+	spin_lock_init(&pch->upl);
 
 	spin_lock_bh(&pn->all_channels_lock);
 	pch->file.index = ++pn->last_channel_index;
@@ -2924,13 +2928,15 @@ int ppp_channel_index(struct ppp_channel *chan)
 int ppp_unit_number(struct ppp_channel *chan)
 {
 	struct channel *pch = chan->ppp;
+	struct ppp *ppp;
 	int unit = -1;
 
 	if (pch) {
-		read_lock_bh(&pch->upl);
-		if (pch->ppp)
-			unit = pch->ppp->file.index;
-		read_unlock_bh(&pch->upl);
+		rcu_read_lock_bh();
+		ppp = rcu_dereference_bh(pch->ppp);
+		if (ppp)
+			unit = ppp->file.index;
+		rcu_read_unlock_bh();
 	}
 	return unit;
 }
@@ -2942,12 +2948,14 @@ char *ppp_dev_name(struct ppp_channel *chan)
 {
 	struct channel *pch = chan->ppp;
 	char *name = NULL;
+	struct ppp *ppp;
 
 	if (pch) {
-		read_lock_bh(&pch->upl);
-		if (pch->ppp && pch->ppp->dev)
-			name = pch->ppp->dev->name;
-		read_unlock_bh(&pch->upl);
+		rcu_read_lock_bh();
+		ppp = rcu_dereference_bh(pch->ppp);
+		if (ppp && ppp->dev)
+			name = ppp->dev->name;
+		rcu_read_unlock_bh();
 	}
 	return name;
 }
@@ -3470,9 +3478,9 @@ ppp_connect_channel(struct channel *pch, int unit)
 	ppp = ppp_find_unit(pn, unit);
 	if (!ppp)
 		goto out;
-	write_lock_bh(&pch->upl);
+	spin_lock_bh(&pch->upl);
 	ret = -EINVAL;
-	if (pch->ppp ||
+	if (rcu_dereference_protected(pch->ppp, lockdep_is_held(&pch->upl)) ||
 	    rcu_dereference_protected(pch->bridge, lockdep_is_held(&pch->upl)))
 		goto outl;
 
@@ -3497,13 +3505,13 @@ ppp_connect_channel(struct channel *pch, int unit)
 		ppp->dev->hard_header_len = hdrlen;
 	list_add_tail(&pch->clist, &ppp->channels);
 	++ppp->n_channels;
-	pch->ppp = ppp;
+	rcu_assign_pointer(pch->ppp, ppp);
 	refcount_inc(&ppp->file.refcnt);
 	ppp_unlock(ppp);
 	ret = 0;
 
  outl:
-	write_unlock_bh(&pch->upl);
+	spin_unlock_bh(&pch->upl);
  out:
 	mutex_unlock(&pn->all_ppp_mutex);
 	return ret;
@@ -3518,10 +3526,11 @@ ppp_disconnect_channel(struct channel *pch)
 	struct ppp *ppp;
 	int err = -EINVAL;
 
-	write_lock_bh(&pch->upl);
-	ppp = pch->ppp;
-	pch->ppp = NULL;
-	write_unlock_bh(&pch->upl);
+	spin_lock_bh(&pch->upl);
+	ppp = rcu_replace_pointer(pch->ppp, NULL, lockdep_is_held(&pch->upl));
+	spin_unlock_bh(&pch->upl);
+	synchronize_rcu();
+
 	if (ppp) {
 		/* remove it from the ppp unit's list */
 		ppp_lock(ppp);
-- 
2.43.0


