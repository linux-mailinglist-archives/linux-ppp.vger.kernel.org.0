Return-Path: <linux-ppp+bounces-406-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H7TGe+gqmlLUgEAu9opvQ
	(envelope-from <linux-ppp+bounces-406-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 06 Mar 2026 10:39:59 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF44221E167
	for <lists+linux-ppp@lfdr.de>; Fri, 06 Mar 2026 10:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B60A309BE88
	for <lists+linux-ppp@lfdr.de>; Fri,  6 Mar 2026 09:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CF53469E7;
	Fri,  6 Mar 2026 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTWv0hZk"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A25C346A07
	for <linux-ppp@vger.kernel.org>; Fri,  6 Mar 2026 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772789825; cv=none; b=X0BMR50NYTqvQVguawEDuxg7NBR32GdXwTOOwQC7fWCD23YaHVSiBArUChn5hhriBRaHLRGUbM9CuMemTXHi3OqgJdsGTMmGtd8AxuS1yvixATsTEfeN3W2NpO9nPP+AkZ1r5EJ7kIp7qhxNrh5Ld5kNp6Cn0/WgxODoToLoFfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772789825; c=relaxed/simple;
	bh=oI5ujbYMbFooXz90mdQQs9sXMQo+W0ZVUqf5SsCXQJc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=YIZj6QzDzeE4BwsklsZGn0l8UUFSncbNT7jlC3TH53xyaQxKaXfilZLVAuXKHap2exHFDPPFEWrmTRy/+h5Yj/VvR/I+ipY3VzsJ+Q1dy8wO9rkSszH/iwdMn4AM9t0AWASIPUePu4stYKkZyyBXmYMfpjeJVJX2uvimWLyskl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTWv0hZk; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65f94011dfaso2709494a12.0
        for <linux-ppp@vger.kernel.org>; Fri, 06 Mar 2026 01:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772789821; x=1773394621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zqVb5538Vi/uzDMhI/FkC3xZPwoiIXF6a6BljR75nUA=;
        b=eTWv0hZke7Pegzj7pL/D0CTCKi0sCFKxieEsJsu3w0LzbE0g+lhOgd7IgtjB97ymZ+
         Ri2IvE6vHwu1fPV9YHNdfUvM0fnr7pz16juvanrZyNJ7U+2MtcDQ96iS/30CsJ6b3sJt
         l7cEFelfG6+Srk3v4D7MmFejKPjeexf8AN4Lju22C3kCwZtHqbhpZtY+h4rFOwa5+qgS
         PoX0C846vNMq4qTEqqlGYwGK5dbej29NmLIpZ8wP93v5UjA+IHdbkT3l2M3qqd2433j8
         MsNCE/Ml8GlxSlAV0t7n2WlYnCeT3dQr7yEJ+PZq8H7AVvqJRWbtxAh5EMxMdr63SiX0
         Hz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772789821; x=1773394621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zqVb5538Vi/uzDMhI/FkC3xZPwoiIXF6a6BljR75nUA=;
        b=ZhPmRxI1Oe27/4h9RbyiB9cdW1nMeHWvS2fa5aQaAHWWF4i7I4f+5Z2hm6pmJzMUjH
         jqMNMliHyQr9D+fdwyi3mpaS0q9s0HROb52igWVxwTBdhKqzQCoraEYkAF5acrCCOA3s
         W98rwc0BiQ6LsrFEDZJIsVV9IZXpgrNOLGU/ZrVSRRtJjshrg2gg7fGlaB1/nPkp8+/V
         4iTdSKz28IzVk2+YuEHNnIi/hc4SfvI4eq41hGK66z6Yn0+7aHQqewJUExa0T4JC4T6H
         oxmSpM/NImbjBC2KUVXHJlfQhWc5/Tbi1Jm9JkGEzbmT0CZTvMLX3FCOjUkKsWUZKZIq
         M0lw==
X-Forwarded-Encrypted: i=1; AJvYcCUJVspUVxAWA7FdvfTwvVgnlJuiMSgtM2gVD7hUIjat8msbfzBCI6pfxf2Z6OqPUfS+fWe6mG5z844=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiU3QF8zuWzQGA6rCyyfxdAfIDn3EfTtwta0bpDR0M+m9+UZm1
	RQUVl3f0ZkMUM9W+Fjj2KB2fw8TlPINMnxYjP53hniEKURR5kNTEGQv4TuzXDcwoV3w=
X-Gm-Gg: ATEYQzxD9E2/RgyBgMIyPAeWdL842w+YKf5jh8UYvNW972zFlm7lEXVnBd5/6E8cE3c
	HDs2UXE6MOBuwp6QLAsQIWWjViLtNfyD+cv03eBD9ho5s8dD23uOQMoInBpFtBYr+D3+s27yJV/
	u7HlgzVEFRJgiTqJ3t6BbHT4YyJY5F7LPkNBYl0OeoJSxZXlvjf9TtaQnldJd+x2AfCBcDE+Bgs
	mMDksk6Qw5I3GNoRurJUjhKtAtisnxi0sPtOVH5HOPE/uMu7ZuecdIRveReoTWF6oO+nGS/KGgg
	X1EIP/CziJJv2Zl91bDMNDr4zrmByiawIgDYVEqMiuvKy5r0nTK8JBIfKTrZLxCP4RCQPaY7t6Z
	+4zFR6xaDMi4n+070MIpgscz8mW1AVi9g3Nue6VBUz3NMcBZXaImMFieu52U7TiMPHHJ52VablU
	AjuFM=
X-Received: by 2002:a05:6402:278d:b0:661:85be:6085 with SMTP id 4fb4d7f45d1cf-6619d4565d5mr757171a12.5.1772789820917;
        Fri, 06 Mar 2026 01:37:00 -0800 (PST)
Received: from gmail.com ([2a09:bac5:4e22:2705::3e3:31])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3e62bb1sm307369a12.9.2026.03.06.01.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 01:36:59 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mitchell Blank Jr <mitch@sfgoth.com>,
	Simon Horman <horms@kernel.org>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] ppp: simplify input error handling
Date: Fri,  6 Mar 2026 17:36:49 +0800
Message-ID: <20260306093649.1048232-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BF44221E167
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
	TAGGED_FROM(0.00)[bounces-406-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Currently, ppp_input_error() indicates an error by allocating a 0-length
skb and calling ppp_do_recv(). It takes an error code argument, which is
stored in skb->cb, but not used by ppp_receive_frame().

Simplify the error handling by removing the unused parameter and the
unnecessary skb allocation. Instead, call ppp_receive_error() directly
from ppp_input_error() under the recv lock, and the length check in
ppp_receive_frame() can be removed.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/ppp_async.c   |  2 +-
 drivers/net/ppp/ppp_generic.c | 31 ++++++++++---------------------
 drivers/net/ppp/ppp_synctty.c |  2 +-
 include/linux/ppp_channel.h   |  2 +-
 net/atm/pppoatm.c             |  2 +-
 5 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ppp/ppp_async.c b/drivers/net/ppp/ppp_async.c
index b4cf2d09c6bd..93a7b0f6c4e7 100644
--- a/drivers/net/ppp/ppp_async.c
+++ b/drivers/net/ppp/ppp_async.c
@@ -491,7 +491,7 @@ static void ppp_async_process(struct tasklet_struct *t)
 	/* process received packets */
 	while ((skb = skb_dequeue(&ap->rqueue)) != NULL) {
 		if (skb->cb[0])
-			ppp_input_error(&ap->chan, 0);
+			ppp_input_error(&ap->chan);
 		ppp_input(&ap->chan, skb);
 	}
 
diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 2081da6c2144..6344c5eb0f98 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -2383,12 +2383,10 @@ ppp_input(struct ppp_channel *chan, struct sk_buff *skb)
 	rcu_read_unlock_bh();
 }
 
-/* Put a 0-length skb in the receive queue as an error indication */
 void
-ppp_input_error(struct ppp_channel *chan, int code)
+ppp_input_error(struct ppp_channel *chan)
 {
 	struct channel *pch = chan->ppp;
-	struct sk_buff *skb;
 	struct ppp *ppp;
 
 	if (!pch)
@@ -2397,12 +2395,9 @@ ppp_input_error(struct ppp_channel *chan, int code)
 	rcu_read_lock_bh();
 	ppp = rcu_dereference_bh(pch->ppp);
 	if (ppp) {
-		skb = alloc_skb(0, GFP_ATOMIC);
-		if (skb) {
-			skb->len = 0;		/* probably unnecessary */
-			skb->cb[0] = code;
-			ppp_do_recv(ppp, skb, pch);
-		}
+		ppp_recv_lock(ppp);
+		ppp_receive_error(ppp);
+		ppp_recv_unlock(ppp);
 	}
 	rcu_read_unlock_bh();
 }
@@ -2414,20 +2409,14 @@ ppp_input_error(struct ppp_channel *chan, int code)
 static void
 ppp_receive_frame(struct ppp *ppp, struct sk_buff *skb, struct channel *pch)
 {
-	/* note: a 0-length skb is used as an error indication */
-	if (skb->len > 0) {
-		skb_checksum_complete_unset(skb);
+	skb_checksum_complete_unset(skb);
 #ifdef CONFIG_PPP_MULTILINK
-		/* XXX do channel-level decompression here */
-		if (PPP_PROTO(skb) == PPP_MP)
-			ppp_receive_mp_frame(ppp, skb, pch);
-		else
+	/* XXX do channel-level decompression here */
+	if (PPP_PROTO(skb) == PPP_MP)
+		ppp_receive_mp_frame(ppp, skb, pch);
+	else
 #endif /* CONFIG_PPP_MULTILINK */
-			ppp_receive_nonmp_frame(ppp, skb);
-	} else {
-		kfree_skb(skb);
-		ppp_receive_error(ppp);
-	}
+		ppp_receive_nonmp_frame(ppp, skb);
 }
 
 static void
diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
index c2063961f395..b7f243b416f8 100644
--- a/drivers/net/ppp/ppp_synctty.c
+++ b/drivers/net/ppp/ppp_synctty.c
@@ -483,7 +483,7 @@ static void ppp_sync_process(struct tasklet_struct *t)
 	while ((skb = skb_dequeue(&ap->rqueue)) != NULL) {
 		if (skb->len == 0) {
 			/* zero length buffers indicate error */
-			ppp_input_error(&ap->chan, 0);
+			ppp_input_error(&ap->chan);
 			kfree_skb(skb);
 		}
 		else
diff --git a/include/linux/ppp_channel.h b/include/linux/ppp_channel.h
index f73fbea0dbc2..ca8ad03eeef0 100644
--- a/include/linux/ppp_channel.h
+++ b/include/linux/ppp_channel.h
@@ -55,7 +55,7 @@ extern void ppp_input(struct ppp_channel *, struct sk_buff *);
 
 /* Called by the channel when an input error occurs, indicating
    that we may have missed a packet. */
-extern void ppp_input_error(struct ppp_channel *, int code);
+extern void ppp_input_error(struct ppp_channel *);
 
 /* Attach a channel to a given PPP unit in specified net. */
 extern int ppp_register_net_channel(struct net *, struct ppp_channel *);
diff --git a/net/atm/pppoatm.c b/net/atm/pppoatm.c
index 2574aae3e066..e3c422dc533a 100644
--- a/net/atm/pppoatm.c
+++ b/net/atm/pppoatm.c
@@ -228,7 +228,7 @@ static void pppoatm_push(struct atm_vcc *atmvcc, struct sk_buff *skb)
 
 error:
 	kfree_skb(skb);
-	ppp_input_error(&pvcc->chan, 0);
+	ppp_input_error(&pvcc->chan);
 }
 
 static int pppoatm_may_send(struct pppoatm_vcc *pvcc, int size)
-- 
2.43.0


