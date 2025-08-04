Return-Path: <linux-ppp+bounces-328-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D80EEB19B84
	for <lists+linux-ppp@lfdr.de>; Mon,  4 Aug 2025 08:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8023A3A7B0E
	for <lists+linux-ppp@lfdr.de>; Mon,  4 Aug 2025 06:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE313227E9B;
	Mon,  4 Aug 2025 06:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/EXta6e"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ADC126BF7;
	Mon,  4 Aug 2025 06:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754288415; cv=none; b=MBpERKs9f94UlZysvIidwCHyKCyI1c4ZYGddPCYbmyJ0JIJcNBJAKB/QJRVfvzANBCDwpLzPNHIjckDr+MYtVk0Dz66PMniUCssJ7k4MW3BVOkrad/6No2aIvEvKbI6fpYCmCTWuQ/3CXL4gMpLCUiEle3YQh5Wn8yCiXUCSVMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754288415; c=relaxed/simple;
	bh=OsQwmzZ7HuqGa56xbd02be6tTxlQxMMk2IpavQDSQj0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=LtNDCvOvniqnsKSBm0UoBuYgS8ptBSkNmk7gGfULeYMmK2B0ivTXtvWRkdJJ4xrbaz95xutlo2PxvdREL4ixF6dYwWhaYifpvUEdyu1ei9vBD5UoZ2yktFQjbplCtI5leIG9/WZ2n4c7zg04GkYD76JDWMo0H8pkIe34AvbKI2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/EXta6e; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b3aa2a0022cso3803150a12.1;
        Sun, 03 Aug 2025 23:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754288413; x=1754893213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hyZ1wfZ/5Dw8tz+IpwNXS+3J6yYJpD7tWXtFv8hA0v8=;
        b=Q/EXta6ezdpdCbi9iXaSaU+/0l0Or2wjgC7S435bbK0WziPUmJB0D98HLlWU7Ar34G
         bQXcF49kdtBTbU+F9L30vf531JsWvZWBUIrMRBNrDK1cY8PmKVhnX+p8qMdjcqCpClDd
         bvCzoXMbA64LH7VS5MUmxWagdUlFBKB1AtyY9HCJEmq5aSyIEjimkHvt7mfw5cZCUE1h
         G9rWhyLnN6eGk7CEpJ2XYPPBHyvgzVOb/xR3mGBV9QjbgPfDnOJRcLGfbuKg7vSER0Fi
         fv7rNaU8/vZSF7Ecwe3lKPt4TSbeP3RDXHVtEiIrDKZb4B7obvDBqpXdB0zQMOkHzhLZ
         ymnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754288413; x=1754893213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hyZ1wfZ/5Dw8tz+IpwNXS+3J6yYJpD7tWXtFv8hA0v8=;
        b=GfKPKSh22VinBsuxGRONKsXbbCRBob6jrjOa86fdf4cDUyrBROavMMCpXL9KA0RbGD
         i7taFqWEbVZhU8VmfNPLdd3tqiQjqE+1jm+WyLPkhhP/ZaO8glMd4DGOJcmrLIJAuESk
         3fC3GeYltsL0nYjAyhxN8uz7QHJwHtPJ2jDqyyNmTamOYs+YsTSkkncA38WbYQ9mUFbx
         DrKJSZIx7KgNT5nzOu9y3qoWulqBhSui6UApUzuThNz+UtTGlXAx46UWMk/jarQmXEPQ
         wogIdKkvAdNOs/CjcgkfDbegm4dAaeiaprOm2OASrIjaHb3+0u0qaerjMJIHotadsw09
         EYBA==
X-Forwarded-Encrypted: i=1; AJvYcCWlqKhnf+qwNMvUAXJH5YMawxOr5k0RjbT8kX9YgIBZ4K5lzozzuPVM+6D9R+IoB04wB3eZvway@vger.kernel.org, AJvYcCX9pgeOiM6hvMyc/7b8mePZlnSp8gjIyMM1ifQErOdavZQM4wY8iHxClAA0ojhFbVGYRNbV+GonKilT7zI=@vger.kernel.org, AJvYcCXujR+q5uwXyEChNcACUJf+aSrn3FFAXjHOzm8HV9s3BNIcTVjDzndcGHJx/DSdFEZVU96kO+2kro1a@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk6IcIUgRWDdqyNvSlcJ067x+QjJzJEa/nGET6MiX5+S8AbQx5
	jd1bLI8U7FunJg3kosUCF8H2T3pMQuPvGI27IYLIEDACf155R28gwMpJ
X-Gm-Gg: ASbGncsoE9R8dzpZ+8hNZD0uvnHRn5K8vVT2SY5eK+9Qdk0PVGyRb0nTu4GAgLfxICd
	L4tpEQDRePddKAZnMTcKybAC2KmjULa3H901vOfycUO0k+G4+q+tISd7TriHv83mKdo8thjpXpN
	VcX4CSZAs+L65m1t6cCig/g+lZodJltSkAH/KQ4a4GmQ8tUePYLwqIcd/QWtTOZ2bRQY7P/fFW9
	S7TwfSag8pivijhud/24z02Lm9AVPWLcXBxY1H2CyHPQIm1+e7g7p80CoSu3YbZ5f+rcBazrXOo
	wPERc+Ctd5xHRMWuh3ntmc4fE95KAaXTipsCPmkGzd1DHRi6tQehZKzKMhDnt2XfULKL3IzvJFz
	OtgefgYDWu2zBtJEDaFTQ1GZqsxEIDR4pz8hrqt4=
X-Google-Smtp-Source: AGHT+IEhqEUt21jPzfLLMUs7AWlflbVbt0empXSHfpqARw3gkjI7B2Twzxa1Y1/w/LNFQFvScgSbLA==
X-Received: by 2002:a17:902:f612:b0:240:92f9:7b85 with SMTP id d9443c01a7336-24246e5fb31mr99692585ad.0.1754288413259;
        Sun, 03 Aug 2025 23:20:13 -0700 (PDT)
Received: from DESKTOP-09S19U2.localdomain ([223.166.87.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8ac02c9sm100000605ad.184.2025.08.03.23.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 23:20:12 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] ppp: remove rwlock usage
Date: Mon,  4 Aug 2025 14:20:03 +0800
Message-ID: <20250804062004.29617-1-dqfext@gmail.com>
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
 drivers/net/ppp/ppp_generic.c | 122 ++++++++++++++++++----------------
 1 file changed, 65 insertions(+), 57 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 8c98cbd4b06d..ad32abb4bd09 100644
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
+	if (rcu_dereference_protected(pchb->ppp, lockdep_is_held(&pchb->upl)) ||
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
@@ -685,25 +685,25 @@ static int ppp_unbridge_channels(struct channel *pch)
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
+		rcu_read_lock_bh();
+		ppp = rcu_dereference_bh(pch->ppp);
+		if (ppp)
+			unit = ppp->file.index;
+		rcu_read_unlock_bh();
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
+		rcu_read_lock_bh();
+		ppp = rcu_dereference_bh(pch->ppp);
+		if (ppp && ppp->dev)
+			name = ppp->dev->name;
+		rcu_read_unlock_bh();
 	}
 	return name;
 }
@@ -3490,9 +3497,9 @@ ppp_connect_channel(struct channel *pch, int unit)
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
+	spin_unlock_bh(&pch->upl);
  out:
 	mutex_unlock(&pn->all_ppp_mutex);
 	return ret;
@@ -3538,10 +3545,11 @@ ppp_disconnect_channel(struct channel *pch)
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


