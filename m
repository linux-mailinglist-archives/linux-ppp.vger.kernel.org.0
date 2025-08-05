Return-Path: <linux-ppp+bounces-331-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18420B1AC8A
	for <lists+linux-ppp@lfdr.de>; Tue,  5 Aug 2025 04:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5CFC3AB5C9
	for <lists+linux-ppp@lfdr.de>; Tue,  5 Aug 2025 02:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47E61D5CE0;
	Tue,  5 Aug 2025 02:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m432VoHd"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1981DB92C;
	Tue,  5 Aug 2025 02:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754362336; cv=none; b=QhWQWp/4wtt9SGntlL/8HQLj0D7AvtlE88exQTB/DnApkBfBm78jP6TdeZA0ON4DvYJrlRRBRhh3h8EGHn0D173pwVnZWyiQfjLu4hhfjSsIv8h6JPJheWAgF3CSjPSwDRoyaD7bjERveB/3Yzb2EZzmDVHVFV3y5PDaZZ2EPno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754362336; c=relaxed/simple;
	bh=B39fHgK3SYtEtpqd5xgZA2MR5q3y0qn4Y3yBHIZ65MA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=WrD00Dgg2TCnvjsUp2P+u/IPLWk+d3sISgiSMWob8MzzQOg8oN7HrmtA/86S3VnkNEWTBTZDzBaw2P0y9grCGRYF+lNvByI3donPZ8YbWdDxIht579Bhe1eP0v9cN54JlVSgeQq3raKnrOtb+i1B8kh8FzCyfkV+gV7vI/RiUI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m432VoHd; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b424d2eb139so1681701a12.1;
        Mon, 04 Aug 2025 19:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754362334; x=1754967134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j7Q4QjYSNpxpwVDXbSSDs6Eu5iYWm6cjD2TA7Bmfry0=;
        b=m432VoHdxkeUJH8EV5xugFXeep029QXxjiGJT+fUDs2iccyOG8Nk7xeFBZUsPLG9u2
         RShjVdW1l6AZMeSWLXOW8jksOQfdeGFiDAExlZrgFL1BuEtS/UzR6kxZrs9fzQmf0bI6
         z3lfcbzHZ/FueXKd7WLIyfHxRZ/I07FSBw2zQrIXBGzx94iTEbReMBt2j1BMVdMD9lYc
         i1PocVfqpGRkPAfr7XE7OjOS/oJKZxmhNfROWBvF/xG7TkNb36iLskzv+XxV7UUM+A9h
         A07MFsxSrN+6fdMyIrcA/tXvqQFrXaJzfh3wJqHFTOmSQPekiL4PBYMuDm+M+L5kTNul
         IQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754362334; x=1754967134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j7Q4QjYSNpxpwVDXbSSDs6Eu5iYWm6cjD2TA7Bmfry0=;
        b=LzU1kjH9qnYqO7OpvSgcVByMGMMHVPzT8ta08A6GqKIZyYGsDTKnnitL3wpTmJk1bg
         7EB4GaN8urAwBtEWf14cQ14899imsQx1Wvgbp7picofWNKOZLT1nV4vLragPpoQvGo5d
         xt+W0tE4p3AByilroIlIQJz8KDkEpNMuibLPN+8aAUiKa/aDISNEw+PnwtkF2KuvpxV9
         fCQVG54wRSghozUm9C18Oq5WiQ271KsDmt1jtORKQEoJbK6PCp5k3rDrD6+fiAnBeU1x
         7q2V74LtVbIpGZ+rvwZJtottfnmjLsqDJNlVcirLtpen7jnbju69XkAleTQiMYcS+C7I
         B+MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVihkKCbdG/VcZBrR3yACiJVeQrZz7AfhiUkoH+DnooSppUWqUrPNqxR6KQaKOw45jQ27Z18nuWxkeD@vger.kernel.org, AJvYcCVm2qEe4LhcxTv1YHg4POW2BSZzn+7d8G0YPp7MWZyf9r0QkZg/Wy70e1/u1Tvr8GDbPxQcoIUF/IibBPE=@vger.kernel.org, AJvYcCXq4Ok4kQWpYp+n+ETIdvqAKJa248gAL32UtBb61at+0bsu8CWH8ftPEtoaoq62MKVu8ZHo+PpQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzwTbAZkoBeID2k4hXaZvWwLiCztwZo2JWFcrlvNLJk+ZDxi3ej
	OZ7yjtzNvHGQ0g2Uz/OzRWlt+w+UP2CnDXGJYAruiqubFRBeJvdNM4fg
X-Gm-Gg: ASbGnctKbUg/mk1Py/N3znsl8xIUdZm+8VyQOAaDUbMC/ZiRY86J9z6vZg1+QtmCmRE
	ldS/3xfLsgIvrTy0i4EIbjv7dngpmlIEKpFqiXnx2J869ZTJAcG9gBqKKYlsbPCZHLY9BXAwsYa
	fJcfWQjFqsKW44mrvmwArOuL8OhZ0rTtX+HbWtdXAvFAIjHC7DCzJKB7ECZjl+41XuUPxZ3iSR6
	Aoi3/vX24sfjlMuZlU+midjnsCsakF+Tc6JEg8QdPvlfya1dX7aKDL0flxL8nEOqvvz/BPCT3tQ
	NjdtSppFJeB0vQHh2EBn5NSBEuf6Wykb10kLK6lnf/XvZyER29+WdhBeQNL9Sj7Jislw5CfzE/v
	ABjLrWO/RXikJ+4mD7BcGIHckxc6hAQ==
X-Google-Smtp-Source: AGHT+IH0AIrbdXl4v8Z8wDXK5WQkxv3BeCjzVOsoUPNnfDrFhIv0ayQDAJNh09caGZUM7CuxIW/RjQ==
X-Received: by 2002:a17:90b:1b11:b0:31e:cdbc:8d4c with SMTP id 98e67ed59e1d1-3214fbb3a9dmr2492729a91.0.1754362334150;
        Mon, 04 Aug 2025 19:52:14 -0700 (PDT)
Received: from localhost.localdomain ([223.166.86.22])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422dc7cfe9sm9987383a12.17.2025.08.04.19.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 19:52:13 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2] ppp: remove rwlock usage
Date: Tue,  5 Aug 2025 10:49:33 +0800
Message-ID: <20250805024933.754-1-dqfext@gmail.com>
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
- Writers use spin_lock() to update, followed by synchronize_rcu()
  where required.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
v2:
- Replace spin_lock_bh() / spin_unlock_bh() with spin_lock() / spin_unlock()
  as locking only occurs in process context.
- Use rcu_read_lock() / rcu_read_unlock() instead of _bh() variants in
  ppp_dev_name() and ppp_unit_number().
- Move synchronize_rcu() into the if condition.

 drivers/net/ppp/ppp_generic.c | 121 ++++++++++++++++++----------------
 1 file changed, 64 insertions(+), 57 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 8c98cbd4b06d..911e09543cb7 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -178,11 +178,11 @@ struct channel {
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
@@ -644,34 +644,34 @@ static struct bpf_prog *compat_ppp_get_filter(struct sock_fprog32 __user *p)
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
@@ -685,25 +685,25 @@ static int ppp_unbridge_channels(struct channel *pch)
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
 
@@ -2154,10 +2154,9 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 #endif /* CONFIG_PPP_MULTILINK */
 
 /* Try to send data out on a channel */
-static void __ppp_channel_push(struct channel *pch)
+static void __ppp_channel_push(struct channel *pch, struct ppp *ppp)
 {
 	struct sk_buff *skb;
-	struct ppp *ppp;
 
 	spin_lock(&pch->downl);
 	if (pch->chan) {
@@ -2176,7 +2175,6 @@ static void __ppp_channel_push(struct channel *pch)
 	spin_unlock(&pch->downl);
 	/* see if there is anything from the attached unit to be sent */
 	if (skb_queue_empty(&pch->file.xq)) {
-		ppp = pch->ppp;
 		if (ppp)
 			__ppp_xmit_process(ppp, NULL);
 	}
@@ -2185,19 +2183,21 @@ static void __ppp_channel_push(struct channel *pch)
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
@@ -2299,6 +2299,7 @@ void
 ppp_input(struct ppp_channel *chan, struct sk_buff *skb)
 {
 	struct channel *pch = chan->ppp;
+	struct ppp *ppp;
 	int proto;
 
 	if (!pch) {
@@ -2310,18 +2311,19 @@ ppp_input(struct ppp_channel *chan, struct sk_buff *skb)
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
@@ -2330,11 +2332,11 @@ ppp_input(struct ppp_channel *chan, struct sk_buff *skb)
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
@@ -2343,20 +2345,22 @@ ppp_input_error(struct ppp_channel *chan, int code)
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
@@ -2904,7 +2908,6 @@ int ppp_register_net_channel(struct net *net, struct ppp_channel *chan)
 
 	pn = ppp_pernet(net);
 
-	pch->ppp = NULL;
 	pch->chan = chan;
 	pch->chan_net = get_net_track(net, &pch->ns_tracker, GFP_KERNEL);
 	chan->ppp = pch;
@@ -2915,7 +2918,7 @@ int ppp_register_net_channel(struct net *net, struct ppp_channel *chan)
 #endif /* CONFIG_PPP_MULTILINK */
 	init_rwsem(&pch->chan_sem);
 	spin_lock_init(&pch->downl);
-	rwlock_init(&pch->upl);
+	spin_lock_init(&pch->upl);
 
 	spin_lock_bh(&pn->all_channels_lock);
 	pch->file.index = ++pn->last_channel_index;
@@ -2944,13 +2947,15 @@ int ppp_channel_index(struct ppp_channel *chan)
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
@@ -2962,12 +2967,14 @@ char *ppp_dev_name(struct ppp_channel *chan)
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
@@ -3490,9 +3497,9 @@ ppp_connect_channel(struct channel *pch, int unit)
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
 
@@ -3517,13 +3524,13 @@ ppp_connect_channel(struct channel *pch, int unit)
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
+	spin_unlock(&pch->upl);
  out:
 	mutex_unlock(&pn->all_ppp_mutex);
 	return ret;
@@ -3538,11 +3545,11 @@ ppp_disconnect_channel(struct channel *pch)
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
+		synchronize_rcu();
 		/* remove it from the ppp unit's list */
 		ppp_lock(ppp);
 		list_del(&pch->clist);
-- 
2.43.0


