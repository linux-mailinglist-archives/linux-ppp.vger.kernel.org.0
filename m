Return-Path: <linux-ppp+bounces-101-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F1E9BAF91
	for <lists+linux-ppp@lfdr.de>; Mon,  4 Nov 2024 10:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9803A1C21620
	for <lists+linux-ppp@lfdr.de>; Mon,  4 Nov 2024 09:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5D919D086;
	Mon,  4 Nov 2024 09:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMzzfxJZ"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CED6FC5;
	Mon,  4 Nov 2024 09:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712283; cv=none; b=EycY7FPSaUHgpqZaD+amTZMpkNxYWAKDP4J4K39rCSmWVRWt0Fiw1NzhCligKADN3aBnIyN0cFbOYpxNp06YHMHsusOvE9SotJXNuJgklRylGGgRe3Z8bnmEr1n1Q9o48J86AIt1TNh9KYoIvuvcFanZfakjlwKJiEqzOlKRkh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712283; c=relaxed/simple;
	bh=4gz8IHBQZV8F46VShVQttxMvUopiKKiu3ex0fhQy4m4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=uRLEmfjWqdqfuofg+oXydtiqHxVaF/0QcI/d/ck8ZtK4MF5ZGCgfqc/hN4n+Qoa/qoBhh4pPWmFS8ZgfubVosv7k4+dkT17pNKMFBsAVQKzmLkW47qTggAjkCRl8yPNSFYgY16uKsKC2+OZb8gzvJBwBxgfreJM4HFeTv4hlZhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMzzfxJZ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7f3e30a43f1so54407a12.1;
        Mon, 04 Nov 2024 01:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730712281; x=1731317081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mIlXrl3MrlhhYL1UytgIwTHUlTVB0eSosFO+lhV8MLo=;
        b=AMzzfxJZjhl6ZZVrMcuirmLe565Vbrxlk2eMUo8Et3mU4H5AzP62nHQNiIo9fLNW0N
         rEO0X8LeqwkmTyrQtSBXKeV2eKNLGofWSzab/23dCZkRaBHXbNwpSF89rU/lyn9tjvMl
         DbkaPmQZmPkr7y6ZT72+iUMKVt7rSZ/BOPdp4/wmQlZ/uRxZt7P31GPyNTpL2DF50rB7
         7iith8DXceHWu+MnnqAu8kSQZbyJmlW90zevRUXcPLBBJRhiLutfZ13tMBNjWwjQKl0S
         C3DLwQVEV8ovdQTAcSpWs76x20+tOJiA4vOeqSE8VgxzlAWA+HiZVNmWNxZLZF41aoBE
         j/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730712281; x=1731317081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mIlXrl3MrlhhYL1UytgIwTHUlTVB0eSosFO+lhV8MLo=;
        b=QqjGnzeadMYmsDxAgqcBdiLTKp/CtJ3uto+Yq/ZE1f16Qu38eN4WzrgeTtIzIhhhmD
         mneUqM3/VcnA7hYS4ofHpwW/qdS/o4at39XfcVJWXyrY6kbvGjkO4KLsalA43LzzZ0Nw
         N1kBVWtvozbXz7Qd/rxwjeiCQqI1/itq429NBlTSzcpRg/Hnk9qP5lE6xUnfE4qNgemU
         KYP9kjp61XkHZWT6mBDuzZb885+7HBIr/6gGO2oHK2v2Rwd08XfWdLgVWOpnWPEao0lG
         PeKs7W9M4xJWyU339SsJufMZD/jDicqqGTqBqrIlnmdsIDpk59C8pgntmVybC7AQcZy+
         4Qhg==
X-Forwarded-Encrypted: i=1; AJvYcCUo5VS02XR4wvt+V3j/+fZ16BBvfqOrSR4b118BgU9n8O6F/pU5YG06+n9kiPIUdwmkpRLwlQd6Ao6QEeY=@vger.kernel.org, AJvYcCV+P9k3rUUeEz6/QpBoJIfQUQeIZ5Y6zZEHlBrV5RUFqChzUKagUdDERrw3iUC1pau9lUyVc8au@vger.kernel.org, AJvYcCX2sBSa6+QY3xbEl69FoCcQWk2RVY1RZr4Yxmq+BUQ2fg/44xp2/ej9yEN+yWMhh/RkLwgFn+B+ov5G@vger.kernel.org
X-Gm-Message-State: AOJu0Yx41/nkGl6Y03RcW11JGewLE6bH1xauWzxuf48PVG7mMFKH3vFO
	KdefMymEnIPxF2DTmm0TpLDN+NWEJNDJm/neLfgRGvRN9871wgKw+IYpqjanjEI=
X-Google-Smtp-Source: AGHT+IEcYc29+Dxj/QCvjwDqhRoseRb4CmlrS5rROvDba/aymfB7XmX65vWbOCGBAyWTiBG2YzTvrQ==
X-Received: by 2002:a05:6a21:328e:b0:1db:e96f:4472 with SMTP id adf61e73a8af0-1dbe96f45aemr385474637.31.1730712280701;
        Mon, 04 Nov 2024 01:24:40 -0800 (PST)
Received: from gmail.com ([2a09:bac5:6369:78::c:365])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93da983e2sm7093269a91.11.2024.11.04.01.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 01:24:40 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: ppp: remove ppp->closing check
Date: Mon,  4 Nov 2024 17:24:34 +0800
Message-ID: <20241104092434.2677-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ppp->closing was used to test if an interface is closing down. But upon
.ndo_uninit() where ppp->closing is set to 1, dev_close() is already
called to bring down an interface and a synchronize_net() guarantees
that no pending TX/RX can take place, so the check is unnecessary.
Remove the check.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/ppp_generic.c | 38 ++++++++++++-----------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 4583e15ad03a..4ff94005f6c1 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -136,7 +136,6 @@ struct ppp {
 	unsigned long	last_xmit;	/* jiffies when last pkt sent 9c */
 	unsigned long	last_recv;	/* jiffies when last pkt rcvd a0 */
 	struct net_device *dev;		/* network interface device a4 */
-	int		closing;	/* is device closing down? a8 */
 #ifdef CONFIG_PPP_MULTILINK
 	int		nxchan;		/* next channel to send something on */
 	u32		nxseq;		/* next sequence number to send */
@@ -1569,10 +1568,6 @@ static void ppp_dev_uninit(struct net_device *dev)
 	struct ppp *ppp = netdev_priv(dev);
 	struct ppp_net *pn = ppp_pernet(ppp->ppp_net);
 
-	ppp_lock(ppp);
-	ppp->closing = 1;
-	ppp_unlock(ppp);
-
 	mutex_lock(&pn->all_ppp_mutex);
 	unit_put(&pn->units_idr, ppp->file.index);
 	mutex_unlock(&pn->all_ppp_mutex);
@@ -1651,23 +1646,19 @@ static void ppp_setup(struct net_device *dev)
 static void __ppp_xmit_process(struct ppp *ppp, struct sk_buff *skb)
 {
 	ppp_xmit_lock(ppp);
-	if (!ppp->closing) {
-		ppp_push(ppp);
+	ppp_push(ppp);
 
-		if (skb)
-			skb_queue_tail(&ppp->file.xq, skb);
-		while (!ppp->xmit_pending &&
-		       (skb = skb_dequeue(&ppp->file.xq)))
-			ppp_send_frame(ppp, skb);
-		/* If there's no work left to do, tell the core net
-		   code that we can accept some more. */
-		if (!ppp->xmit_pending && !skb_peek(&ppp->file.xq))
-			netif_wake_queue(ppp->dev);
-		else
-			netif_stop_queue(ppp->dev);
-	} else {
-		kfree_skb(skb);
-	}
+	if (skb)
+		skb_queue_tail(&ppp->file.xq, skb);
+	while (!ppp->xmit_pending &&
+	       (skb = skb_dequeue(&ppp->file.xq)))
+		ppp_send_frame(ppp, skb);
+	/* If there's no work left to do, tell the core net
+	   code that we can accept some more. */
+	if (!ppp->xmit_pending && !skb_peek(&ppp->file.xq))
+		netif_wake_queue(ppp->dev);
+	else
+		netif_stop_queue(ppp->dev);
 	ppp_xmit_unlock(ppp);
 }
 
@@ -2208,10 +2199,7 @@ static inline void
 ppp_do_recv(struct ppp *ppp, struct sk_buff *skb, struct channel *pch)
 {
 	ppp_recv_lock(ppp);
-	if (!ppp->closing)
-		ppp_receive_frame(ppp, skb, pch);
-	else
-		kfree_skb(skb);
+	ppp_receive_frame(ppp, skb, pch);
 	ppp_recv_unlock(ppp);
 }
 
-- 
2.43.0


