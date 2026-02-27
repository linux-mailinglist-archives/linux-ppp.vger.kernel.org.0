Return-Path: <linux-ppp+bounces-399-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIuyBI36oGlXogQAu9opvQ
	(envelope-from <linux-ppp+bounces-399-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Feb 2026 02:59:41 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 957D51B1B74
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Feb 2026 02:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F162530B2B81
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Feb 2026 01:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988C528B7DA;
	Fri, 27 Feb 2026 01:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atYcGpos"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008A62BDC2A
	for <linux-ppp@vger.kernel.org>; Fri, 27 Feb 2026 01:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772157382; cv=none; b=pwC00O6tTUkjWpQhahR7BCUFSr/SbMQDYl78byPX3tss6c4I/m0mGHBZul19nA3ksPajGuEa0sioI1TOtzWYItaNpgudRqI+dPdh6wLAm25h/ch4lSxNItCHnsVypjIsnx4/MVZ/uu9BiKym7N0xV+Lmbu2NSZlqeC+gR86kABg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772157382; c=relaxed/simple;
	bh=1HhXeYvYf4GxGTaxZljFQCqXOMqTu8REfuaebmkeSnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NL/v94JtdfyUcoJpGjZNdiu2UQYj58GrRzGhf1dO5xWTPX+mKNei6Y+tCr9z+CBCA+i3fAhAIWGjs/vJniaKlXKgu2W+8ccWZi9hJJHD+uLt6ROkf/xFsjtpRZoiaf+pQV977iglu8Ld5+uO2DCWMrCu9MsIq1XDz4T5PlP17Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atYcGpos; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65c5a778923so2496082a12.2
        for <linux-ppp@vger.kernel.org>; Thu, 26 Feb 2026 17:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772157379; x=1772762179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=98c9GitqRTveJJIvXRWURQ+/NJVCMLwh2Wfc0QaY9pU=;
        b=atYcGposZ1q32WNDiTjOXP0fEjPhnp+nqfpoZGgl01TSwLHaNW5eKW200XpraUpiM4
         CJXBgTP0zZRMkBrGlI+sSlvQGDENn9F/EDww04taj8cZE02IG6OOl4UensSyJIJFcHAS
         qmeEIPIgm/KwehNYfnAx+maxqNPj50Dtd/e99wnGJrli5yB2TzBbABxqq8T4rZgE1W6j
         2H4mmwGF70s0paHgKB1vYx4GXydZNgkSXK4nfCZvIV+awL61Dvsu+F+SWQSQQMU8WVjd
         exevrk+DSwkaj2rROiV8Js52lqAUmWavhk2Q0ofOzUhB2Frle9thYYDYW0dejCaRhIba
         okHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772157379; x=1772762179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98c9GitqRTveJJIvXRWURQ+/NJVCMLwh2Wfc0QaY9pU=;
        b=pkL6RPx6EaHG/1p8hRUXjbK9+XvlCAVhcwxW1fn5+RznG3EjhQlQiu/IDSHcqEe72R
         XWP45rZi26ohbGdAg+hn4aOKISuO2Gxr57rO3XZWrT0HVCwLrefgFKrWYynvzhoiUYBK
         q76KFkfOyFBa+ieNDejFBA0f7Z2Rqogye0QRGrhhn+97VpylBcudnTTwHkyNQh2bRE2Q
         VqIN+vB0BGZfvy9N3smm5v51ocYxAmlYLI5w+qst56hKikLjhPwxW192iOpzkVhckNOr
         i4rTKknGuoTQFOyyTPZId5IAyAeHLTkFPA2XQfMnj/rDJKPnKN8IbVl/xpJL1ifzFYum
         8wzw==
X-Gm-Message-State: AOJu0Yy2uSQB0y2fWKwXzu4YUjLCW1MJEHIpdu4kMOwJDqjXTKdmxLSg
	r5Mh1NUvGwCFnmDkX+4BJVILtKLz8eVs7wWyKU/uHQDArewoR7LVLrHJerBlEj2J+X4=
X-Gm-Gg: ATEYQzxGofOktpg63tJb2vIFrfjX9Bo+yBmvso/AEDuFXAYf6d2MqFKnhm2gHId6OLW
	1jZQOOZz6IAU3OtGXR18YWyjWOCmz2pyw4dzQX42gFZJxcr7Vjss01CNWXnMvvLsFPWIGfIUl2g
	QRRJ5CYyd330d4J30E25GcSH7x96vApy7SYxf3WPrgY5WWmhw4JT0fufn4jJUubU2XpJsglTzA0
	NaZFEIIaigmkXGEt2Jh5GBEtjrnFEv92fgegZGYfOw9yaCz+EoMUAFToLS/GI751rjKNOQKp4tB
	kRWxzooiTOEe+HBSGkky0zmYhi8MGCumkYtZuvyvE4BRVvshGZvb78HiR2X/SeRUTDcvp7vZHgF
	/kc+yvNSTTcZ2jDRJvwCVydv9OteyfXh40aNhcRlDeibHsFJsi0q+GdhqsbauqFrCwIpfNfl5
X-Received: by 2002:a17:907:6d0b:b0:b8f:deff:a019 with SMTP id a640c23a62f3a-b937615c4a5mr49484866b.0.1772157378768;
        Thu, 26 Feb 2026 17:56:18 -0800 (PST)
Received: from gmail.com ([2a09:bac1:5500::20a:ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae613ddsm102113466b.33.2026.02.26.17.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 17:56:17 -0800 (PST)
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
Subject: [PATCH net-next] ppp: don't store tx skb in the fastpath
Date: Fri, 27 Feb 2026 09:56:10 +0800
Message-ID: <20260227015610.24874-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-399-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 957D51B1B74
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
  ppp_push() in it. It returns NULL if the skb is consumed
  (dropped/queue) or a new skb to be passed to ppp_push().
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
 Repost as non-RFC:
 - https://lore.kernel.org/linux-ppp/20260210031313.29708-1-dqfext@gmail.com/

 drivers/net/ppp/ppp_generic.c | 107 +++++++++++++++++++---------------
 1 file changed, 61 insertions(+), 46 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index e9b41777be80..559bdc223a5e 100644
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
+static struct sk_buff *ppp_prepare_tx_skb(struct ppp *ppp, struct sk_buff *skb);
+static int ppp_push(struct ppp *ppp, struct sk_buff *skb);
 static void ppp_channel_push(struct channel *pch);
 static void ppp_receive_frame(struct ppp *ppp, struct sk_buff *skb,
 			      struct channel *pch);
@@ -1651,26 +1650,45 @@ static void ppp_setup(struct net_device *dev)
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
+	skb = ppp_prepare_tx_skb(ppp, skb);
+	if (unlikely(!skb))
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
 
@@ -1757,12 +1775,11 @@ pad_compress_skb(struct ppp *ppp, struct sk_buff *skb)
 }
 
 /*
- * Compress and send a frame.
- * The caller should have locked the xmit path,
- * and xmit_pending should be 0.
+ * Compress and prepare to send a frame.
+ * The caller should have locked the xmit path.
  */
-static void
-ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
+static struct sk_buff *
+ppp_prepare_tx_skb(struct ppp *ppp, struct sk_buff *skb)
 {
 	int proto = PPP_PROTO(skb);
 	struct sk_buff *new_skb;
@@ -1784,7 +1801,7 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 					      "PPP: outbound frame "
 					      "not passed\n");
 			kfree_skb(skb);
-			return;
+			return NULL;
 		}
 		/* if this packet passes the active filter, record the time */
 		if (!(ppp->active_filter &&
@@ -1869,42 +1886,38 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 			goto drop;
 		skb_queue_tail(&ppp->file.rq, skb);
 		wake_up_interruptible(&ppp->file.rwait);
-		return;
+		return NULL;
 	}
 
-	ppp->xmit_pending = skb;
-	ppp_push(ppp);
-	return;
+	return skb;
 
  drop:
 	kfree_skb(skb);
 	++ppp->dev->stats.tx_errors;
+	return NULL;
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
@@ -1916,27 +1929,26 @@ ppp_push(struct ppp *ppp)
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
@@ -2005,7 +2017,7 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 	 * performance if we have a lot of channels.
 	 */
 	if (nfree == 0 || nfree < navail / 2)
-		return 0; /* can't take now, leave it in xmit_pending */
+		return 0; /* can't take now, leave it in transmit queue */
 
 	/* Do protocol field compression */
 	if (skb_linearize(skb))
@@ -2199,8 +2211,12 @@ static void __ppp_channel_push(struct channel *pch, struct ppp *ppp)
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
 
@@ -3460,7 +3476,6 @@ static void ppp_destroy_interface(struct ppp *ppp)
 	}
 #endif /* CONFIG_PPP_FILTER */
 
-	kfree_skb(ppp->xmit_pending);
 	free_percpu(ppp->xmit_recursion);
 
 	free_netdev(ppp->dev);
-- 
2.43.0


