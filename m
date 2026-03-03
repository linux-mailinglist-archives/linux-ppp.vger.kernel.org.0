Return-Path: <linux-ppp+bounces-402-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHiKOXirpmn9SgAAu9opvQ
	(envelope-from <linux-ppp+bounces-402-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 03 Mar 2026 10:35:52 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6071EBF20
	for <lists+linux-ppp@lfdr.de>; Tue, 03 Mar 2026 10:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47D9B30B8E4E
	for <lists+linux-ppp@lfdr.de>; Tue,  3 Mar 2026 09:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705D038D014;
	Tue,  3 Mar 2026 09:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lELUDFdi"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D767D38C409
	for <linux-ppp@vger.kernel.org>; Tue,  3 Mar 2026 09:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772530351; cv=none; b=Hk9uyMCEwxZU04vlLlXVujkk74tAVMVNCDbFStk9myW63ZcOcI0uxXYHDlcDi5KIs+M7TQ0sDTcocATC7u5NGQl6gztrF3q+4OeKdMCMD9Mk5zE10chz/FdWmWDVIl6B4Hk19clFxbf0Wae+RtSF6j5blAkI7oc6ktNNbl5k+o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772530351; c=relaxed/simple;
	bh=RQ9l9g84UJ+UUH5VkiqwiFF6l6vtQR6LMjld9KuFHkE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=reeZWZhJOM5MXM7nYzvYE5BjFXKg07gF/ALrzaCEOYoeKY4qrw0RD7aH2BN5Po1x1dtEqyoAD7SXrtsXnqxttxcn8KfT+OlIkYr+dk83Xp8GJYmD68+2++CaVWCPoF3Yal63iaBa9StuiJg1yYIXuF/qW5TE35ncJ1b3e26AXeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lELUDFdi; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9373af81cdso749788566b.2
        for <linux-ppp@vger.kernel.org>; Tue, 03 Mar 2026 01:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772530347; x=1773135147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=znhZ0PkaDuaW4b4kj/ELs7z36u7IZ6zTiGIdB0ckJAI=;
        b=lELUDFdiicEYsjKohPaaB0VQXsd/7VccaF3i/qo+ZYInhCyh+xn3j7rqxJ6o/vJ6rG
         vrQlY01MwFPcv2fA7X9ZP7T6b0A1aG0h/rQ2KsJ62eoXh6wqIDoaq9/ax/5IUV5DnJOt
         bQXl1OFvnl8gqDPwsb90evaSpCprdTmZmaQtqBBNpflv/Exmf2DCSMs0EoN9Qc49IFWm
         WcYMwLkxF7+6RY6vi/jsu/4wynVQ0F8zoOeSuP9T1JiyQMfguZiG231hKAXuQXaCc1DN
         LOt7QuPRHwtyNh1KnnviTslcLnOWypj4KY5ZHmXSs62Q7UXcMVNcMLC3hjt7Yjz+LOAZ
         ijWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772530347; x=1773135147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znhZ0PkaDuaW4b4kj/ELs7z36u7IZ6zTiGIdB0ckJAI=;
        b=mjZW+DhavHLZgTTIk4Ya4GgC+CXWiKOx+DfHf/DxVXqzWznpsohUGQT3cy0SHYhyDN
         Iw1GPPxWtozqKFuB6HTAxR3oK3ask0cp89vxSnElmlUEsTZAUWkMbVKmer7MVIng4xc9
         1UygXGMlY9s74cYuiX1BX9YsZZ1/4U7hbhapvpdR6vKGCfl3wzKeTfuGhyRlqHwR3mbY
         gcrQ8SknrzM+ypALuALD+Ywxy0dE0gUFZVmSzso8Dx6nk99bS6OSgaddZxyZmP7WbXZs
         6tIZMwifsofeMkIRwtiPkMqoHebcmyeuOmZFI7Eahb0EQKkBC9NwBf1e4dm7fE0xAhSK
         BmYQ==
X-Gm-Message-State: AOJu0Yw2N2yhR4q8w4TuAgU92I4XRzzA+jPdhUhNuYjSQHQUw4Cio/0P
	3tf76GJvhQvgi8yT8KsxCXUFVz4eTYfpidzySQrolFsLHeQS3YL/8sGG73wdaeRcloQ=
X-Gm-Gg: ATEYQzz9Njo1epsPw9IISFWmMMMzLZE0Qrkc2bWT3p6kajZCnvcI4niThYFZBSWMAj5
	F8+C6y2Y/fSPDELbOhe5DlJSpu4J+31ZhI0hCJ988UkJRuCm3iK8UNGGbPU+IKqOgTRNvn8lIKY
	wmkrfp2MjMEx3JaHUYABMv4BKmaNklmDDV7eRUAiuQ8sXgs4blu6cw5NPbgwlOJETzuGgrQU2ck
	eBT8Z5tyoN+xBZEmIfL8QVcBQKg6Gs5kwwKnCwiRsbx6wZT0BR0ce/5S3GTXFkiW8x2CBCB82jG
	sbitpUadDuTIFKErvJYXuzT3FvPyotKOhNTHpxSKucks/iorEOAYaunngMVmuSOAmkpZnMTKHxd
	fAX62W/BLGhbyUHhkrC3MQbjr2XiTo3Lgs8IRjXc/+eaxl6+j/sOfcemSV4EfrOnXDiABVehL
X-Received: by 2002:a17:907:3f0a:b0:b88:317a:3f40 with SMTP id a640c23a62f3a-b937651bfe7mr1074781166b.38.1772530346654;
        Tue, 03 Mar 2026 01:32:26 -0800 (PST)
Received: from gmail.com ([2a09:bac1:5500::3e3:31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae8fee1sm573303866b.45.2026.03.03.01.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:32:25 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: linux-ppp@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: [PATCH net-next v2] ppp: don't store tx skb in the fastpath
Date: Tue,  3 Mar 2026 17:32:19 +0800
Message-ID: <20260303093219.234403-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4A6071EBF20
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-402-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Currently, ppp->xmit_pending is used in ppp_send_frame() to pass a skb
to ppp_push(), and holds the skb when a PPP channel cannot immediately
transmit it. This state is redundant because the transmit queue
(ppp->file.xq) can already handle the backlog. Furthermore, during
normal operation, an skb is queued in file.xq only to be immediately
dequeued, causing unnecessary overhead.

Refactor the transmit path to avoid stashing the skb when possible:
- Remove ppp->xmit_pending.
- Rename ppp_send_frame() to ppp_prepare_tx_skb(), and don't call
  ppp_push() in it. It returns 1 if the skb is consumed
  (dropped/handled) or 0 if it can be passed to ppp_push().
- Update ppp_push() to accept the skb. It returns 1 if the skb is
  consumed, or 0 if the channel is busy.
- Optimize __ppp_xmit_process():
  - Fastpath: If the queue is empty, attempt to send the skb directly
    via ppp_push(). If busy, queue it.
  - Slowpath: If the queue is not empty, process the backlog in
    file.xq. Split dequeuing loop into a separate function
    ppp_xmit_flush() so ppp_channel_push() uses that directly instead of
    passing a NULL skb to __ppp_xmit_process().

This simplifies the states and reduces locking in the fastpath.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
v2: make ppp_prepare_tx_skb() return int and update the skb when required,
    getting rid of the null check

 - https://lore.kernel.org/linux-ppp/20260227015610.24874-1-dqfext@gmail.com/

 drivers/net/ppp/ppp_generic.c | 111 ++++++++++++++++++++--------------
 1 file changed, 65 insertions(+), 46 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index e9b41777be80..2081da6c2144 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -134,7 +134,6 @@ struct ppp {
 	int		debug;		/* debug flags 70 */
 	struct slcompress *vj;		/* state for VJ header compression */
 	enum NPmode	npmode[NUM_NP];	/* what to do with each net proto 78 */
-	struct sk_buff	*xmit_pending;	/* a packet ready to go out 88 */
 	struct compressor *xcomp;	/* transmit packet compressor 8c */
 	void		*xc_state;	/* its internal state 90 */
 	struct compressor *rcomp;	/* receive decompressor 94 */
@@ -264,8 +263,8 @@ struct ppp_net {
 static int ppp_unattached_ioctl(struct net *net, struct ppp_file *pf,
 			struct file *file, unsigned int cmd, unsigned long arg);
 static void ppp_xmit_process(struct ppp *ppp, struct sk_buff *skb);
-static void ppp_send_frame(struct ppp *ppp, struct sk_buff *skb);
-static void ppp_push(struct ppp *ppp);
+static int ppp_prepare_tx_skb(struct ppp *ppp, struct sk_buff **pskb);
+static int ppp_push(struct ppp *ppp, struct sk_buff *skb);
 static void ppp_channel_push(struct channel *pch);
 static void ppp_receive_frame(struct ppp *ppp, struct sk_buff *skb,
 			      struct channel *pch);
@@ -1651,26 +1650,44 @@ static void ppp_setup(struct net_device *dev)
  */
 
 /* Called to do any work queued up on the transmit side that can now be done */
+static void ppp_xmit_flush(struct ppp *ppp)
+{
+	struct sk_buff *skb;
+
+	while ((skb = skb_dequeue(&ppp->file.xq))) {
+		if (unlikely(!ppp_push(ppp, skb))) {
+			skb_queue_head(&ppp->file.xq, skb);
+			return;
+		}
+	}
+	/* If there's no work left to do, tell the core net code that we can
+	 * accept some more.
+	 */
+	netif_wake_queue(ppp->dev);
+}
+
 static void __ppp_xmit_process(struct ppp *ppp, struct sk_buff *skb)
 {
 	ppp_xmit_lock(ppp);
-	if (!ppp->closing) {
-		ppp_push(ppp);
-
-		if (skb)
+	if (unlikely(ppp->closing)) {
+		kfree_skb(skb);
+		goto out;
+	}
+	if (unlikely(ppp_prepare_tx_skb(ppp, &skb)))
+		goto out;
+	/* Fastpath: No backlog, just send the new skb. */
+	if (likely(skb_queue_empty(&ppp->file.xq))) {
+		if (unlikely(!ppp_push(ppp, skb))) {
 			skb_queue_tail(&ppp->file.xq, skb);
-		while (!ppp->xmit_pending &&
-		       (skb = skb_dequeue(&ppp->file.xq)))
-			ppp_send_frame(ppp, skb);
-		/* If there's no work left to do, tell the core net
-		   code that we can accept some more. */
-		if (!ppp->xmit_pending && !skb_peek(&ppp->file.xq))
-			netif_wake_queue(ppp->dev);
-		else
 			netif_stop_queue(ppp->dev);
-	} else {
-		kfree_skb(skb);
+		}
+		goto out;
 	}
+
+	/* Slowpath: Enqueue the new skb and process backlog */
+	skb_queue_tail(&ppp->file.xq, skb);
+	ppp_xmit_flush(ppp);
+out:
 	ppp_xmit_unlock(ppp);
 }
 
@@ -1757,13 +1774,15 @@ pad_compress_skb(struct ppp *ppp, struct sk_buff *skb)
 }
 
 /*
- * Compress and send a frame.
- * The caller should have locked the xmit path,
- * and xmit_pending should be 0.
+ * Compress and prepare to send a frame.
+ * The caller should have locked the xmit path.
+ * Returns 1 if the skb was consumed, 0 if it can be passed to ppp_push().
+ * @pskb is updated if a compressor is in use.
  */
-static void
-ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
+static int
+ppp_prepare_tx_skb(struct ppp *ppp, struct sk_buff **pskb)
 {
+	struct sk_buff *skb = *pskb;
 	int proto = PPP_PROTO(skb);
 	struct sk_buff *new_skb;
 	int len;
@@ -1784,7 +1803,7 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 					      "PPP: outbound frame "
 					      "not passed\n");
 			kfree_skb(skb);
-			return;
+			return 1;
 		}
 		/* if this packet passes the active filter, record the time */
 		if (!(ppp->active_filter &&
@@ -1832,6 +1851,7 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 			}
 			consume_skb(skb);
 			skb = new_skb;
+			*pskb = skb;
 			cp = skb_put(skb, len + 2);
 			cp[0] = 0;
 			cp[1] = proto;
@@ -1858,6 +1878,7 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 		if (!new_skb)
 			goto drop;
 		skb = new_skb;
+		*pskb = skb;
 	}
 
 	/*
@@ -1869,42 +1890,38 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 			goto drop;
 		skb_queue_tail(&ppp->file.rq, skb);
 		wake_up_interruptible(&ppp->file.rwait);
-		return;
+		return 1;
 	}
 
-	ppp->xmit_pending = skb;
-	ppp_push(ppp);
-	return;
+	return 0;
 
  drop:
 	kfree_skb(skb);
 	++ppp->dev->stats.tx_errors;
+	return 1;
 }
 
 /*
- * Try to send the frame in xmit_pending.
+ * Try to send the frame.
  * The caller should have the xmit path locked.
+ * Returns 1 if the skb was consumed, 0 if not.
  */
-static void
-ppp_push(struct ppp *ppp)
+static int
+ppp_push(struct ppp *ppp, struct sk_buff *skb)
 {
 	struct list_head *list;
 	struct channel *pch;
-	struct sk_buff *skb = ppp->xmit_pending;
-
-	if (!skb)
-		return;
 
 	list = &ppp->channels;
 	if (list_empty(list)) {
 		/* nowhere to send the packet, just drop it */
-		ppp->xmit_pending = NULL;
 		kfree_skb(skb);
-		return;
+		return 1;
 	}
 
 	if ((ppp->flags & SC_MULTILINK) == 0) {
 		struct ppp_channel *chan;
+		int ret;
 		/* not doing multilink: send it down the first channel */
 		list = list->next;
 		pch = list_entry(list, struct channel, clist);
@@ -1916,27 +1933,26 @@ ppp_push(struct ppp *ppp)
 			 * skb but linearization failed
 			 */
 			kfree_skb(skb);
-			ppp->xmit_pending = NULL;
+			ret = 1;
 			goto out;
 		}
 
-		if (chan->ops->start_xmit(chan, skb))
-			ppp->xmit_pending = NULL;
+		ret = chan->ops->start_xmit(chan, skb);
 
 out:
 		spin_unlock(&pch->downl);
-		return;
+		return ret;
 	}
 
 #ifdef CONFIG_PPP_MULTILINK
 	/* Multilink: fragment the packet over as many links
 	   as can take the packet at the moment. */
 	if (!ppp_mp_explode(ppp, skb))
-		return;
+		return 0;
 #endif /* CONFIG_PPP_MULTILINK */
 
-	ppp->xmit_pending = NULL;
 	kfree_skb(skb);
+	return 1;
 }
 
 #ifdef CONFIG_PPP_MULTILINK
@@ -2005,7 +2021,7 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 	 * performance if we have a lot of channels.
 	 */
 	if (nfree == 0 || nfree < navail / 2)
-		return 0; /* can't take now, leave it in xmit_pending */
+		return 0; /* can't take now, leave it in transmit queue */
 
 	/* Do protocol field compression */
 	if (skb_linearize(skb))
@@ -2199,8 +2215,12 @@ static void __ppp_channel_push(struct channel *pch, struct ppp *ppp)
 	spin_unlock(&pch->downl);
 	/* see if there is anything from the attached unit to be sent */
 	if (skb_queue_empty(&pch->file.xq)) {
-		if (ppp)
-			__ppp_xmit_process(ppp, NULL);
+		if (ppp) {
+			ppp_xmit_lock(ppp);
+			if (!ppp->closing)
+				ppp_xmit_flush(ppp);
+			ppp_xmit_unlock(ppp);
+		}
 	}
 }
 
@@ -3460,7 +3480,6 @@ static void ppp_destroy_interface(struct ppp *ppp)
 	}
 #endif /* CONFIG_PPP_FILTER */
 
-	kfree_skb(ppp->xmit_pending);
 	free_percpu(ppp->xmit_recursion);
 
 	free_netdev(ppp->dev);
-- 
2.43.0


