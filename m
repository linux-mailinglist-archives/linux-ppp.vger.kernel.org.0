Return-Path: <linux-ppp+bounces-543-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIg/Odof8GnLOgEAu9opvQ
	(envelope-from <linux-ppp+bounces-543-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 28 Apr 2026 04:47:54 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBBF47CE47
	for <lists+linux-ppp@lfdr.de>; Tue, 28 Apr 2026 04:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BDC43045035
	for <lists+linux-ppp@lfdr.de>; Tue, 28 Apr 2026 02:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F10B2D6E5C;
	Tue, 28 Apr 2026 02:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cfq7YZ6V"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F0F3932E8
	for <linux-ppp@vger.kernel.org>; Tue, 28 Apr 2026 02:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777344290; cv=none; b=IurqsjD9B3COCF1ADPG5OYhwFaSs5d/a4/JP3BfzvIIOtcBSBCUdcrYrZCQ+cVOCpqMiHhwdLk9cI9ETC/QRpfZwu5QgfcM74qLOwHGmsR6jZ5tmbhHWdkBIq8KDykO0J7mB8SohuN+fXiFPUxRSoDau5SdC6kqn74/Up9Vey5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777344290; c=relaxed/simple;
	bh=EAYUATPuVleEjr1jqIxR9Ui4rzGDh9uFzSfV03KVwHM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=JTMmgOgOJTxQRAAGVV8pK4GcFNMBxgW2pf7LukaInXn6/MQfHF9/4W4LdVnd56pfHHkr+KSJ+/ujfLznIVH1cCY0280c4E4YpqpIdLYUkvSMq90dLuXkPyJRRcMVCoYmNVKgZcCcQIGstylMFULX/zUoZIQuiX8OItxzLG11hCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cfq7YZ6V; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777344276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+MmdwINVAVKBRt4VRZUmggKv0c0KtyEJq4NgLTRltRw=;
	b=cfq7YZ6VA8I4SIMWTp0CNdpUe9ovzUiphK9oe8tPMq/Hg/vwSW18PL409kpQq1mWzMfgId
	WH8jtqVULDUWqkhD8B+9TB39rKhM4HdjkSYeixqSp2/PYTzClHuTiCS6UfpUbi6gbOY69Z
	qV5ZuiZznuq8YZaf3ZQ5OA7xtich6vU=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Guillaume Nault <gnault@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	Taegu Ha <hataegu0826@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] ppp: consolidate RX skb queueing
Date: Tue, 28 Apr 2026 10:44:23 +0800
Message-ID: <20260428024426.48605-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 4FBBF47CE47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-543-lists,linux-ppp=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linux.dev,debian.org,gmail.com,linutronix.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email,linux.dev:dkim,linux.dev:mid]

In ppp_input() and ppp_receive_nonmp_frame(), received skbs are queued
for userspace delivery using the same open-coded pattern:

	skb_queue_tail(&pf->rq, skb);
	while (pf->rq.qlen > PPP_MAX_RQLEN &&
	       (skb = skb_dequeue(&pf->rq)))
		kfree_skb(skb);
	wake_up_interruptible(&pf->rwait);

This has a potential race: skb_queue_tail() releases the queue lock,
then qlen is read locklessly before skb_dequeue() re-acquires it.
Another CPU enqueueing concurrently could cause the length check to see
stale data. This race is benign, as it only causes extra skbs to be
freed in the worst case.

Introduce ppp_file_queue_rx_skb() to perform the enqueue, length check,
and trim atomically under a single pf->rq.lock critical section. As both
callers have softirq disabled, plain spin_lock() can be used instead of
_bh()/_irqsave() variants. Since only one skb is enqueued at a time, the
queue can exceed PPP_MAX_RQLEN by at most one frame, so replace the
while-loop with an if-statement. While at it, use skb_queue_len()
instead of open-coding the qlen access.

Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 drivers/net/ppp/ppp_generic.c | 37 ++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 57c68efa5ff8..6ab5011540a0 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -2307,6 +2307,27 @@ static bool ppp_channel_bridge_input(struct channel *pch, struct sk_buff *skb)
 	return !!pchb;
 }
 
+/* Queue up and deliver a received skb to userspace.
+ * Must be called in softirq.
+ */
+static void ppp_file_queue_rx_skb(struct ppp_file *pf, struct sk_buff *skb)
+{
+	spin_lock(&pf->rq.lock);
+	__skb_queue_tail(&pf->rq, skb);
+	/* limit queue length by dropping old frames */
+	if (unlikely(skb_queue_len(&pf->rq) > PPP_MAX_RQLEN)) {
+		struct sk_buff *old = __skb_peek(&pf->rq);
+
+		__skb_unlink(old, &pf->rq);
+		spin_unlock(&pf->rq.lock);
+		kfree_skb(old);
+	} else {
+		spin_unlock(&pf->rq.lock);
+	}
+	/* wake up any process polling or blocking on read */
+	wake_up_interruptible(&pf->rwait);
+}
+
 void
 ppp_input(struct ppp_channel *chan, struct sk_buff *skb)
 {
@@ -2337,12 +2358,7 @@ ppp_input(struct ppp_channel *chan, struct sk_buff *skb)
 	proto = PPP_PROTO(skb);
 	if (!ppp || proto >= 0xc000 || proto == PPP_CCPFRAG) {
 		/* put it on the channel queue */
-		skb_queue_tail(&pch->file.rq, skb);
-		/* drop old frames if queue too long */
-		while (pch->file.rq.qlen > PPP_MAX_RQLEN &&
-		       (skb = skb_dequeue(&pch->file.rq)))
-			kfree_skb(skb);
-		wake_up_interruptible(&pch->file.rwait);
+		ppp_file_queue_rx_skb(&pch->file, skb);
 	} else {
 		ppp_do_recv(ppp, skb, pch);
 	}
@@ -2480,14 +2496,7 @@ ppp_receive_nonmp_frame(struct ppp *ppp, struct sk_buff *skb)
 	npi = proto_to_npindex(proto);
 	if (npi < 0) {
 		/* control or unknown frame - pass it to pppd */
-		skb_queue_tail(&ppp->file.rq, skb);
-		/* limit queue length by dropping old frames */
-		while (ppp->file.rq.qlen > PPP_MAX_RQLEN &&
-		       (skb = skb_dequeue(&ppp->file.rq)))
-			kfree_skb(skb);
-		/* wake up any process polling or blocking on read */
-		wake_up_interruptible(&ppp->file.rwait);
-
+		ppp_file_queue_rx_skb(&ppp->file, skb);
 	} else {
 		/* network protocol frame - give it to the kernel */
 
-- 
2.43.0


