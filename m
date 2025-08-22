Return-Path: <linux-ppp+bounces-343-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C632B30AC9
	for <lists+linux-ppp@lfdr.de>; Fri, 22 Aug 2025 03:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14B281D04520
	for <lists+linux-ppp@lfdr.de>; Fri, 22 Aug 2025 01:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAAB1494C3;
	Fri, 22 Aug 2025 01:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8XtuCN8"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F320E2F29;
	Fri, 22 Aug 2025 01:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755825963; cv=none; b=m7W07tTfz7klUMfW170Uvm/wkFBPfbYh6AiFGPQGu96mddkv7YwKuKaWQmduBUwX6bx9jf4VMrSIXAPa9InN56WYEvcMKY+wLUGHABisTKR6sa5YIy3nc6XcTusvSxHw1RL5enxbkKkbWP3YYXXbzguKB5B0K5+utGzs6FkGv6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755825963; c=relaxed/simple;
	bh=Q1ChcoVPFplndhe/E4yXkh3gD0+obpGbBqkI81iI9lg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=GAM+OmwaqQBcaWMVHy7J7Bf/ozxdejDvqkYTTOQbgD5ByzCl9PokS2ch+W3XXEqkoC9RiRTtVT3vp8GVaP8IOhyEPuCIB2CCRIQIkyXz4Uwx6RI3wmS1ZYRaKmeXOL//s4mEE3ew2mnDBHNdD+g/ggNo0qIJvH5AMrquk80l4wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8XtuCN8; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76e434a0118so2120525b3a.0;
        Thu, 21 Aug 2025 18:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755825961; x=1756430761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zFQYxM2IUxTyS+5luh+0mf1dBxu9Yu43EoNRs15I0m4=;
        b=B8XtuCN8Eq7xEtX1YP6xQcwIacIfyiFo7BXz1LBRtDYl5vj+oXGFb3/soq1tAyUTxg
         YbPfuTllefN3Ob9K9cGQuwk//tWTsA4THwe24igKdHUVu2UANG/Eh34Dzw8nCjmjnV4k
         AmuMRdoqXhEGE2b/I08pIAkF/oSMePoMn+3H/+80FYge+knTvdCkTqVRGzxZ2vRAoU2y
         pp/8i2hjMW5OoHXFNvvrFeemOBr7qZyXiy98vqtXNNK/ovjeMKtUTMaM+o7zSMIGrvvx
         I/+cKP1StggCJSvYFQCQLuTrw5eydpa1KUdN2/1wLLpsd4wvNzy8ak3uHU72BpC/o3CJ
         D4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755825961; x=1756430761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFQYxM2IUxTyS+5luh+0mf1dBxu9Yu43EoNRs15I0m4=;
        b=c7fCLZP5MNctZNIV9kpgoMZVmdORGbwHAOd0wq/Xc1VhxrTUAdRXcnrxV+cHIAz4sq
         xJQXPr/ekjx3zjsOZ8K9FaHmGpcqvIHDXRZhdl6RypF12dq8p+Ep4uyAwYgZLI0uoZxz
         HPGBXiStJPmmGj/DIDjMP+wuGx7QeDa9ShCdT3HWcgK42i/sG7Co6jHmHdyICpbUcIzY
         mtEeJq2rf/3Nc+eiKbzZOj4fbxN7W595PUWTIGHyNsYomoGlvnrK/1yw2dEMVglHoJRY
         yEYem3P3bikyPXnavYAOvpgdopHZNh2Krv9i3JFV/DMmyI1t1L1xyfy/pzCtjw8TYSQA
         pcfg==
X-Forwarded-Encrypted: i=1; AJvYcCW8NANK1uRKY6RcRYs3xscy6cLYa1kbjK6rWEwAZi5GkyGwZdvzYP9X7TtUIXBLYvlE4p/qu13eoCZBpIc=@vger.kernel.org, AJvYcCXTslxI7cQvb7ixzo9euXriMhMYo+K0fsrjWNwaAaNusH0MXyjGGnEJXBRkNgnc3oxWeuaFhRCk@vger.kernel.org, AJvYcCXjzTLaD74kkf7NSQIobU/iWhPKtlTXCdMYr+KSdP+n8IFqRY5PVvPu21cUlawBhImCauBLS3VMcO6k@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxy22ax617WtGQcLy3u18UJhzgvEcdpYN7n3puQWqbWciFQLzr
	KUMxZ/kUC9INehPoLvioJFLRN5p7g58BkA/FZIPCp1h9mSyiOa2lndez
X-Gm-Gg: ASbGncsbbje1lWB9QSAvTHNQK2ct7X7sLvTSCTfCX374SHcWXNiJqLeqSioh/zDdaIY
	odT5wiu387UQEHu7bQ+7Vk1r9tK1ppwM9EfAy51+7z1fkHtYIAYgTaz/hHHIFK6+X+XFUIY/W9w
	1AegCoru24gFi6Gee7/uv1FbWn/GHFL7BjwjT2LnaoHkoWoJzJavrqvfUvEWe+Twe9f8yvPqTJ/
	21PSBfq2HJLJkSwc23CUsEVXGvc+9QaGv5ePArt9PfxO2CaB3L6I6yFDE5SvKqFfOmoxOxBLiK6
	FAgfM3ZkwCzSS9NE6ypsmyPlQcr8dOenZw8qADdoaKDq4am4b+zJnnPLRWBnLsiXyEudTrVB/2T
	8UXMs1MCheTX5XA==
X-Google-Smtp-Source: AGHT+IEz8wYoaZMolKodUNaoefJ0urG+V0inntplMOnkIZd8XlTuUJtWej3QR51gnpvRq0ASby4hig==
X-Received: by 2002:a05:6a20:918a:b0:243:15b9:7790 with SMTP id adf61e73a8af0-24340eb9569mr1894042637.52.1755825961025;
        Thu, 21 Aug 2025 18:26:01 -0700 (PDT)
Received: from gmail.com ([223.166.87.36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fbc711sm5830756a12.2.2025.08.21.18.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 18:26:00 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3] ppp: remove rwlock usage
Date: Fri, 22 Aug 2025 09:25:47 +0800
Message-ID: <20250822012548.6232-1-dqfext@gmail.com>
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
- Writers use spin_lock() to update.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
v3:
  Rebase patch, and remove synchronize_rcu() from ppp_bridge_channels()
  because synchronize_net() is present.
v2:
- Replace spin_lock_bh() / spin_unlock_bh() with spin_lock() / spin_unlock()
  as locking only occurs in process context.
- Use rcu_read_lock() / rcu_read_unlock() instead of _bh() variants in
  ppp_dev_name() and ppp_unit_number().
- Move synchronize_rcu() into the if condition.

 drivers/net/ppp/ppp_generic.c | 120 ++++++++++++++++++----------------
 1 file changed, 63 insertions(+), 57 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 824c8dc4120b..65795d099166 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -179,11 +179,11 @@ struct channel {
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
@@ -645,34 +645,34 @@ static struct bpf_prog *compat_ppp_get_filter(struct sock_fprog32 __user *p)
  */
 static int ppp_bridge_channels(struct channel *pch, struct channel *pchb)
 {
-	write_lock_bh(&pch->upl);
-	if (pch->ppp ||
+	spin_lock(&pch->upl);
+	if (rcu_dereference_protected(pch->ppp, lockdep_is_held(&pch->upl)) ||
 	    rcu_dereference_protected(pch->bridge, lockdep_is_held(&pch->upl))) {
-		write_unlock_bh(&pch->upl);
+		spin_unlock(&pch->upl);
 		return -EALREADY;
 	}
 	refcount_inc(&pchb->file.refcnt);
 	rcu_assign_pointer(pch->bridge, pchb);
-	write_unlock_bh(&pch->upl);
+	spin_unlock(&pch->upl);
 
-	write_lock_bh(&pchb->upl);
-	if (pchb->ppp ||
+	spin_lock(&pchb->upl);
+	if (rcu_dereference_protected(pchb->ppp, lockdep_is_held(&pchb->upl)) ||
 	    rcu_dereference_protected(pchb->bridge, lockdep_is_held(&pchb->upl))) {
-		write_unlock_bh(&pchb->upl);
+		spin_unlock(&pchb->upl);
 		goto err_unset;
 	}
 	refcount_inc(&pch->file.refcnt);
 	rcu_assign_pointer(pchb->bridge, pch);
-	write_unlock_bh(&pchb->upl);
+	spin_unlock(&pchb->upl);
 
 	return 0;
 
 err_unset:
-	write_lock_bh(&pch->upl);
+	spin_lock(&pch->upl);
 	/* Re-read pch->bridge with upl held in case it was modified concurrently */
 	pchb = rcu_dereference_protected(pch->bridge, lockdep_is_held(&pch->upl));
 	RCU_INIT_POINTER(pch->bridge, NULL);
-	write_unlock_bh(&pch->upl);
+	spin_unlock(&pch->upl);
 	synchronize_rcu();
 
 	if (pchb)
@@ -686,25 +686,25 @@ static int ppp_unbridge_channels(struct channel *pch)
 {
 	struct channel *pchb, *pchbb;
 
-	write_lock_bh(&pch->upl);
+	spin_lock(&pch->upl);
 	pchb = rcu_dereference_protected(pch->bridge, lockdep_is_held(&pch->upl));
 	if (!pchb) {
-		write_unlock_bh(&pch->upl);
+		spin_unlock(&pch->upl);
 		return -EINVAL;
 	}
 	RCU_INIT_POINTER(pch->bridge, NULL);
-	write_unlock_bh(&pch->upl);
+	spin_unlock(&pch->upl);
 
 	/* Only modify pchb if phcb->bridge points back to pch.
 	 * If not, it implies that there has been a race unbridging (and possibly
 	 * even rebridging) pchb.  We should leave pchb alone to avoid either a
 	 * refcount underflow, or breaking another established bridge instance.
 	 */
-	write_lock_bh(&pchb->upl);
+	spin_lock(&pchb->upl);
 	pchbb = rcu_dereference_protected(pchb->bridge, lockdep_is_held(&pchb->upl));
 	if (pchbb == pch)
 		RCU_INIT_POINTER(pchb->bridge, NULL);
-	write_unlock_bh(&pchb->upl);
+	spin_unlock(&pchb->upl);
 
 	synchronize_rcu();
 
@@ -2158,10 +2158,9 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 #endif /* CONFIG_PPP_MULTILINK */
 
 /* Try to send data out on a channel */
-static void __ppp_channel_push(struct channel *pch)
+static void __ppp_channel_push(struct channel *pch, struct ppp *ppp)
 {
 	struct sk_buff *skb;
-	struct ppp *ppp;
 
 	spin_lock(&pch->downl);
 	if (pch->chan) {
@@ -2180,7 +2179,6 @@ static void __ppp_channel_push(struct channel *pch)
 	spin_unlock(&pch->downl);
 	/* see if there is anything from the attached unit to be sent */
 	if (skb_queue_empty(&pch->file.xq)) {
-		ppp = pch->ppp;
 		if (ppp)
 			__ppp_xmit_process(ppp, NULL);
 	}
@@ -2189,19 +2187,21 @@ static void __ppp_channel_push(struct channel *pch)
 static void ppp_channel_push(struct channel *pch)
 {
 	struct ppp_xmit_recursion *xmit_recursion;
+	struct ppp *ppp;
 
-	read_lock_bh(&pch->upl);
-	if (pch->ppp) {
-		xmit_recursion = this_cpu_ptr(pch->ppp->xmit_recursion);
-		local_lock_nested_bh(&pch->ppp->xmit_recursion->bh_lock);
+	rcu_read_lock_bh();
+	ppp = rcu_dereference_bh(pch->ppp);
+	if (ppp) {
+		xmit_recursion = this_cpu_ptr(ppp->xmit_recursion);
+		local_lock_nested_bh(&ppp->xmit_recursion->bh_lock);
 		xmit_recursion->owner = current;
-		__ppp_channel_push(pch);
+		__ppp_channel_push(pch, ppp);
 		xmit_recursion->owner = NULL;
-		local_unlock_nested_bh(&pch->ppp->xmit_recursion->bh_lock);
+		local_unlock_nested_bh(&ppp->xmit_recursion->bh_lock);
 	} else {
-		__ppp_channel_push(pch);
+		__ppp_channel_push(pch, NULL);
 	}
-	read_unlock_bh(&pch->upl);
+	rcu_read_unlock_bh();
 }
 
 /*
@@ -2303,6 +2303,7 @@ void
 ppp_input(struct ppp_channel *chan, struct sk_buff *skb)
 {
 	struct channel *pch = chan->ppp;
+	struct ppp *ppp;
 	int proto;
 
 	if (!pch) {
@@ -2314,18 +2315,19 @@ ppp_input(struct ppp_channel *chan, struct sk_buff *skb)
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
@@ -2334,11 +2336,11 @@ ppp_input(struct ppp_channel *chan, struct sk_buff *skb)
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
@@ -2347,20 +2349,22 @@ ppp_input_error(struct ppp_channel *chan, int code)
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
@@ -2908,7 +2912,6 @@ int ppp_register_net_channel(struct net *net, struct ppp_channel *chan)
 
 	pn = ppp_pernet(net);
 
-	pch->ppp = NULL;
 	pch->chan = chan;
 	pch->chan_net = get_net_track(net, &pch->ns_tracker, GFP_KERNEL);
 	chan->ppp = pch;
@@ -2919,7 +2922,7 @@ int ppp_register_net_channel(struct net *net, struct ppp_channel *chan)
 #endif /* CONFIG_PPP_MULTILINK */
 	init_rwsem(&pch->chan_sem);
 	spin_lock_init(&pch->downl);
-	rwlock_init(&pch->upl);
+	spin_lock_init(&pch->upl);
 
 	spin_lock_bh(&pn->all_channels_lock);
 	pch->file.index = ++pn->last_channel_index;
@@ -2948,13 +2951,15 @@ int ppp_channel_index(struct ppp_channel *chan)
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
+		rcu_read_lock();
+		ppp = rcu_dereference(pch->ppp);
+		if (ppp)
+			unit = ppp->file.index;
+		rcu_read_unlock();
 	}
 	return unit;
 }
@@ -2966,12 +2971,14 @@ char *ppp_dev_name(struct ppp_channel *chan)
 {
 	struct channel *pch = chan->ppp;
 	char *name = NULL;
+	struct ppp *ppp;
 
 	if (pch) {
-		read_lock_bh(&pch->upl);
-		if (pch->ppp && pch->ppp->dev)
-			name = pch->ppp->dev->name;
-		read_unlock_bh(&pch->upl);
+		rcu_read_lock();
+		ppp = rcu_dereference(pch->ppp);
+		if (ppp && ppp->dev)
+			name = ppp->dev->name;
+		rcu_read_unlock();
 	}
 	return name;
 }
@@ -3494,9 +3501,9 @@ ppp_connect_channel(struct channel *pch, int unit)
 	ppp = ppp_find_unit(pn, unit);
 	if (!ppp)
 		goto out;
-	write_lock_bh(&pch->upl);
+	spin_lock(&pch->upl);
 	ret = -EINVAL;
-	if (pch->ppp ||
+	if (rcu_dereference_protected(pch->ppp, lockdep_is_held(&pch->upl)) ||
 	    rcu_dereference_protected(pch->bridge, lockdep_is_held(&pch->upl)))
 		goto outl;
 
@@ -3521,13 +3528,13 @@ ppp_connect_channel(struct channel *pch, int unit)
 		ppp->dev->hard_header_len = hdrlen;
 	list_add_tail_rcu(&pch->clist, &ppp->channels);
 	++ppp->n_channels;
-	pch->ppp = ppp;
+	rcu_assign_pointer(pch->ppp, ppp);
 	refcount_inc(&ppp->file.refcnt);
 	ppp_unlock(ppp);
 	ret = 0;
 
  outl:
-	write_unlock_bh(&pch->upl);
+	spin_unlock(&pch->upl);
  out:
 	mutex_unlock(&pn->all_ppp_mutex);
 	return ret;
@@ -3542,10 +3549,9 @@ ppp_disconnect_channel(struct channel *pch)
 	struct ppp *ppp;
 	int err = -EINVAL;
 
-	write_lock_bh(&pch->upl);
-	ppp = pch->ppp;
-	pch->ppp = NULL;
-	write_unlock_bh(&pch->upl);
+	spin_lock(&pch->upl);
+	ppp = rcu_replace_pointer(pch->ppp, NULL, lockdep_is_held(&pch->upl));
+	spin_unlock(&pch->upl);
 	if (ppp) {
 		/* remove it from the ppp unit's list */
 		ppp_lock(ppp);
-- 
2.43.0


