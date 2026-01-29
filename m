Return-Path: <linux-ppp+bounces-374-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBABHfW4emkr9gEAu9opvQ
	(envelope-from <linux-ppp+bounces-374-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 29 Jan 2026 02:33:41 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D665EAACC5
	for <lists+linux-ppp@lfdr.de>; Thu, 29 Jan 2026 02:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AF2630048D0
	for <lists+linux-ppp@lfdr.de>; Thu, 29 Jan 2026 01:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B028213DDAA;
	Thu, 29 Jan 2026 01:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGmsQxXp"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E1019755B
	for <linux-ppp@vger.kernel.org>; Thu, 29 Jan 2026 01:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769650150; cv=none; b=POjfNjeu6Xf67+U0aqAjYJ35NxUrqiqUdjEBAdJ6N7VCyTfutfBRKHBK0HQcrLpGi940zrPSqSLaS2tvkPOrJL9ZioBxlwHv2vF/S88LhRz2pNqNPA3wS5lPiyLlBUODNw9NZNwiZUfjjGS5hahqgCsH1h1ll/KfnlWiXP4UIzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769650150; c=relaxed/simple;
	bh=MoBOphXc78MTKLid5zGiMU4m+2RBEI6B8y9JnvhBT0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=syZSwfDwD2l+uwSGmTJt08KlCU/w28QKCIFgXPILpfIa7EvIx/feuSfsk6OiwbwnHMfHWgmKJxtzEjhCiZ8QBIFyvcp+HNajvBXRRdFSM818zEtCU2rjdB9GB7CzPDrKNqa8+9UiOHbKRKZCzEzzz6RkwchUlKT1v5t+EF0vqOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGmsQxXp; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1233bc1117fso1099804c88.0
        for <linux-ppp@vger.kernel.org>; Wed, 28 Jan 2026 17:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769650148; x=1770254948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fz0HF8QIciQ8W/jFc7CcxIuPePjE9HmoHDdQJI7gnFg=;
        b=bGmsQxXpjC9buvm2ON6Jfd3Re50mmEqwBVKtBNnMBW7fFxwrWkfSN5IfBNM8zeSzRn
         dbkwJZ+A/ikbcBQBFGIMUKMul/W+Y/8fE7nT5rnra/8fUE9sugv44UiuQ52JroRLh6DG
         FTpXPMdq1zPE8mh7ra/fGoEgeEI7hMybrBD5ZZX3pB03L0wPR6410P3Uji3Dp61IMQ5T
         NajZaBJUk1Y52dksS/6hiy+DtAvje3nv1y8c/zn47mKcqvvbIUQb2so6Fio85Wpk82Oj
         t0Me679qXVAD3yiyuY/K/3J1NkBQBljkMAXQqX3HeFR1qEpwB9tJ7adJHptLtD7UlS/L
         EtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769650148; x=1770254948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fz0HF8QIciQ8W/jFc7CcxIuPePjE9HmoHDdQJI7gnFg=;
        b=wxhRhBGa/0KdO2CZLhDyJXLfF1NShIQLyzirZmGvAyT8p77nkbcc3t3TcwUZ7KTMFp
         A5ojJ4LqCa8Y7wVcitufzttWaeqwdsTra7vKkq5ZIb/ixmJj+McDC2d0KNsVbXXoqnHN
         iz7afAgToXvj171Od3egJmSmjQ2qwOBSN86S4sJKp/5W+GUW+b5W1tVAup5jrxsgY8W6
         AGBt+af/PTpIgmpjn6Kw+RIxqZ41259O38zMqsPIQ1KbVytv+UDAlNZ/QB2+T3EUAGqO
         wHb5wUwxj2rGEYlxFju+MKbEtIY/j7epR6/Iazimqd4cf9mr2DM/UQ8Kh4sXkQ5MLbbJ
         1kLw==
X-Forwarded-Encrypted: i=1; AJvYcCWTyINlIRBeMGWE1ei0hsFWGlH+wK7+PurM0AQarQXq46F/Ij803Dq1GAGIEMm6MjCC5iyJRyc3q4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIENjtR1DOi1dOnL4z++P79eTDii1MtTl4wUEC8vD9ALCpdphu
	YUqtRF9FLwe7UfK4DRxhoDUnKyBCtyPGIup8F9genibUZkRqb1Lwyj5B
X-Gm-Gg: AZuq6aLW/maw2pFsnMA8kO9ZblVXlgfrx3b/J2f9SG3wvzC+jNfyAlipt8q1qzOqPW4
	WS7U6YzJsNE9/ZMEar9yMclF7ZIrgbf/18VeFY+w+7YQomgM/KMwAYmK+bHIIvykEDOE3PSwijO
	ofOBRFseyDD2QKjmZ/MEDlZxAqFSdelISnvH/nuzGje2zLQVd0D6LGAOAZPhdJENuQQfOzza7vy
	Xkd24HY+VhuyvtzP54jCbj95mvP9YL1jnMwUk0KjVl5THoFlwj5wWfPZnORIY9z1a938vE/oyLn
	7s5Lp/255F51ZwFOdbadqAEMlCtJ33AeBwpCr1DJg+FgbdLGI8wHzc61MarytaYcnSoTR6RXSou
	IdDL3dGSz9rmDC2iMX85/JhB804t6QMHHI7gWM/K5HYiYArroNMKy5wkZKG02IWg=
X-Received: by 2002:a05:7022:f90:b0:11b:ca88:c4f1 with SMTP id a92af1059eb24-124b1060aa3mr729929c88.20.1769650148153;
        Wed, 28 Jan 2026 17:29:08 -0800 (PST)
Received: from gmail.com ([2a09:bac5:1f0b:28::4:34a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9efd3b8sm4488034c88.17.2026.01.28.17.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 17:29:07 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: [PATCH net-next v4] ppp: enable TX scatter-gather
Date: Thu, 29 Jan 2026 09:29:02 +0800
Message-ID: <20260129012902.941-1-dqfext@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-374-lists,linux-ppp=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D665EAACC5
X-Rspamd-Action: no action

PPP channels using chan->direct_xmit prepend the PPP header to a skb and
call dev_queue_xmit() directly. In this mode the skb does not need to be
linear, but the PPP netdevice currently does not advertise
scatter-gather features, causing unnecessary linearization and
preventing GSO.

Enable NETIF_F_SG and NETIF_F_FRAGLIST on PPP devices. In case a linear
buffer is required (PPP compression, multilink, and channels without
direct_xmit), call skb_linearize() explicitly.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
v3 -> v4:
 Always expose SG and FRAGLIST, and linearize the skb if necessary.
 - https://lore.kernel.org/linux-ppp/20260123014214.225278-1-dqfext@gmail.com/

 drivers/net/ppp/ppp_generic.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index f9f0f16c41d1..f8814d7be6f1 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1641,6 +1641,8 @@ static void ppp_setup(struct net_device *dev)
 	dev->flags = IFF_POINTOPOINT | IFF_NOARP | IFF_MULTICAST;
 	dev->priv_destructor = ppp_dev_priv_destructor;
 	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
+	dev->features = NETIF_F_SG | NETIF_F_FRAGLIST;
+	dev->hw_features = dev->features;
 	netif_keep_dst(dev);
 }
 
@@ -1710,6 +1712,10 @@ pad_compress_skb(struct ppp *ppp, struct sk_buff *skb)
 		ppp->xcomp->comp_extra + ppp->dev->hard_header_len;
 	int compressor_skb_size = ppp->dev->mtu +
 		ppp->xcomp->comp_extra + PPP_HDRLEN;
+
+	if (skb_linearize(skb))
+		return NULL;
+
 	new_skb = alloc_skb(new_skb_size, GFP_ATOMIC);
 	if (!new_skb) {
 		if (net_ratelimit())
@@ -1797,6 +1803,10 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 	case PPP_IP:
 		if (!ppp->vj || (ppp->flags & SC_COMP_TCP) == 0)
 			break;
+
+		if (skb_linearize(skb))
+			goto drop;
+
 		/* try to do VJ TCP header compression */
 		new_skb = alloc_skb(skb->len + ppp->dev->hard_header_len - 2,
 				    GFP_ATOMIC);
@@ -1894,19 +1904,26 @@ ppp_push(struct ppp *ppp)
 	}
 
 	if ((ppp->flags & SC_MULTILINK) == 0) {
+		struct ppp_channel *chan;
 		/* not doing multilink: send it down the first channel */
 		list = list->next;
 		pch = list_entry(list, struct channel, clist);
 
 		spin_lock(&pch->downl);
-		if (pch->chan) {
-			if (pch->chan->ops->start_xmit(pch->chan, skb))
-				ppp->xmit_pending = NULL;
-		} else {
-			/* channel got unregistered */
+		chan = pch->chan;
+		if (unlikely(!chan || (!chan->direct_xmit && skb_linearize(skb)))) {
+			/* channel got unregistered, or it requires a linear
+			 * skb but linearization failed
+			 */
 			kfree_skb(skb);
 			ppp->xmit_pending = NULL;
+			goto out;
 		}
+
+		if (chan->ops->start_xmit(chan, skb))
+			ppp->xmit_pending = NULL;
+
+out:
 		spin_unlock(&pch->downl);
 		return;
 	}
@@ -1991,6 +2008,8 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 		return 0; /* can't take now, leave it in xmit_pending */
 
 	/* Do protocol field compression */
+	if (skb_linearize(skb))
+		goto err_linearize;
 	p = skb->data;
 	len = skb->len;
 	if (*p == 0 && mp_protocol_compress) {
@@ -2149,6 +2168,7 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 
  noskb:
 	spin_unlock(&pch->downl);
+ err_linearize:
 	if (ppp->debug & 1)
 		netdev_err(ppp->dev, "PPP: no memory (fragment)\n");
 	++ppp->dev->stats.tx_errors;
-- 
2.43.0


