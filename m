Return-Path: <linux-ppp+bounces-100-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E85669B4701
	for <lists+linux-ppp@lfdr.de>; Tue, 29 Oct 2024 11:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0ABAEB21CAF
	for <lists+linux-ppp@lfdr.de>; Tue, 29 Oct 2024 10:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B8E20403D;
	Tue, 29 Oct 2024 10:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJtq9rVa"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D11617A58F;
	Tue, 29 Oct 2024 10:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730198225; cv=none; b=GBra8mgvxnOjpFD0tI9bgw7uwA7EA6leMmuGDoep/p7mpUoX6TWa7/CPZVIlvOHsNMdg7nrriZadAxXhOxwFQxdqxHz6S3RvOS1/V/KgKt+5eHNSLoDSd7dBq4Xn9cBga0dtfeFJdBloSH9BGT7v+MURMVsrdFoH8ByGdgpj770=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730198225; c=relaxed/simple;
	bh=kOBytp/Lt6anuC7fpP6HhCnVFgQGH8mYGJqpAcCBNOk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=TSYgf94KJLR7y43z1F4HIdRWSeiQZuFUuhZznGQmRgqg2VEJYtlT5SRB2WwXJ43h8myOxnpUWikqVN8y2NOobYnobe+Ygt0CIJm0UbPEaZvec+17se0rVQlA6mYIWYn846Jt/eCOQQRp35s78Woc3HNrQFm5DCao4f2HpZN6sIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJtq9rVa; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20cb7139d9dso49281865ad.1;
        Tue, 29 Oct 2024 03:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730198222; x=1730803022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RLambK0XxWp1Q4hBIhG2WE8o8TKJ/n0lsc/ax+EbGus=;
        b=mJtq9rVa7QTUCC+KD082k9IDYqtZbkQO9z7lm+Kwz+Y3PrlHYO3KPeDrqNQbdyFeLR
         6iwect+vd9Lom1XLZp5STFsdVqOOI65rH9a2nstltgoZ+E5zZho3dA+/Ogva/yZoRcQx
         RX1yR8tNhMtiyHip6m1zgugeYArKwW7QL5B5DhppSKqy5fhPlZIaFsZiPr28kfUjnndr
         qYU/H67VDv08B6cuIfA9jbcMoak/8wtgZlCaiL7CrlrzU3HEwcpkqcxq0nlO4x3t8OCZ
         QXqBY78/nZfO/7aXmBOGVJ5oHOzLILrfAYqSK/uQR9K0GfWfyeNIoDt/t+AC2W04hQW7
         qmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730198222; x=1730803022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RLambK0XxWp1Q4hBIhG2WE8o8TKJ/n0lsc/ax+EbGus=;
        b=MqIfsqVVRSoUoDK1nYxg2i5XTB+P7snYOankocjEa4nT04wWHhdtgo191+mJwHDD2U
         O4gbiUfb25Ux2kr7ByaKtyVjgsKo0qkXO9T8VzNCad5NfU2sarm2weiBpvbOEFCBgAR6
         l0dvx5MQC26Jp6ZejOrPWsWWHlWcsKjFVIzffekMq5qRqhkSApLp0JpND8O3JJsqhr+s
         C9BkzIrpvy+ffJyC0YFlLdA7FP+sTfaY3gZ7LDz3E8v7ea+mgYpb8WuIQFTzgrCUz9K2
         MGJX34hVkj0vTIiXoJKYf8QbDeh5QYVqqwhAVf07ATky+OqPUhzSZIWXFbqezSxrY1Qt
         2ZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxUuqH6NX1e8J1FOwVWtzOWhR+G9JdJXDB+UAhSSSflX1mnaFdcqf0sFUU4Je9LK3cjqZVPgyY@vger.kernel.org, AJvYcCXVz4H4lav6TtOUeZFAiAbwnHDZUG+yAAbGkYmnfxnUzzxmjjMjb/A2jqkH3h40ZhF0RsmfUhXEe1YYis8=@vger.kernel.org, AJvYcCXmviu6hdOJ9qraWWC1HMqKUX8Fx6kM7qM8Mhi+pYlk6SfkQPnCsvU6bY80Anq0gfcXy6uzkMtPXC6m@vger.kernel.org
X-Gm-Message-State: AOJu0YxQg+A5xSWmtoDM4fr7gOWyDp+fQNDQS7B0a6JOWRgmkKl5QDTj
	WkBdfcvHHQjqUZHQAdLUgHcu0CE/UB+6D57G5wiAFMRYNdVk/7qV
X-Google-Smtp-Source: AGHT+IHiXa4d27z2FOjbGp5IFdaZIOMI36s5YDC/SXxzZOVwa5rX8jbYu/NHjS5UgCIN5reQlpDXow==
X-Received: by 2002:a17:903:4404:b0:20c:b810:13a5 with SMTP id d9443c01a7336-210c68ca8a8mr118983775ad.21.1730198222254;
        Tue, 29 Oct 2024 03:37:02 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:6369:78::c:365])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf6d6e7sm63085255ad.71.2024.10.29.03.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:37:01 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ppp@vger.kernel.org
Subject: [RFC PATCH net-next] net: ppp: convert to IFF_NO_QUEUE
Date: Tue, 29 Oct 2024 18:36:56 +0800
Message-Id: <20241029103656.2151-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When testing the parallel TX performance of a single PPPoE interface
over a 2.5GbE link with multiple hardware queues, the throughput could
not exceed 1.9Gbps, even with low CPU usage.

This issue arises because the PPP interface is registered with a single
queue and a tx_queue_len of 3. This default behavior dates back to Linux
2.3.13, which was suitable for slower serial ports. However, in modern
devices with multiple processors and hardware queues, this configuration
can lead to congestion.

For PPPoE/PPTP, the lower interface should handle qdisc, so we need to
set IFF_NO_QUEUE. For PPP over a serial port, we don't benefit from a
qdisc with such a short TX queue, so handling TX queueing in the driver
and setting IFF_NO_QUEUE is more effective.

With this change, PPPoE interfaces can now fully saturate a 2.5GbE link.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/ppp_generic.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 4b2971e2bf48..5470e0fe1f9b 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -236,8 +236,8 @@ struct ppp_net {
 /* Get the PPP protocol number from a skb */
 #define PPP_PROTO(skb)	get_unaligned_be16((skb)->data)
 
-/* We limit the length of ppp->file.rq to this (arbitrary) value */
-#define PPP_MAX_RQLEN	32
+/* We limit the length of ppp->file.rq/xq to this (arbitrary) value */
+#define PPP_MAX_QLEN	32
 
 /*
  * Maximum number of multilink fragments queued up.
@@ -920,8 +920,6 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 				break;
 		} else {
 			ppp->npmode[i] = npi.mode;
-			/* we may be able to transmit more packets now (??) */
-			netif_wake_queue(ppp->dev);
 		}
 		err = 0;
 		break;
@@ -1639,6 +1637,7 @@ static void ppp_setup(struct net_device *dev)
 	dev->tx_queue_len = 3;
 	dev->type = ARPHRD_PPP;
 	dev->flags = IFF_POINTOPOINT | IFF_NOARP | IFF_MULTICAST;
+	dev->priv_flags |= IFF_NO_QUEUE;
 	dev->priv_destructor = ppp_dev_priv_destructor;
 	netif_keep_dst(dev);
 }
@@ -1654,17 +1653,15 @@ static void __ppp_xmit_process(struct ppp *ppp, struct sk_buff *skb)
 	if (!ppp->closing) {
 		ppp_push(ppp);
 
-		if (skb)
-			skb_queue_tail(&ppp->file.xq, skb);
+		if (skb) {
+			if (ppp->file.xq.qlen > PPP_MAX_QLEN)
+				kfree_skb(skb);
+			else
+				skb_queue_tail(&ppp->file.xq, skb);
+		}
 		while (!ppp->xmit_pending &&
 		       (skb = skb_dequeue(&ppp->file.xq)))
 			ppp_send_frame(ppp, skb);
-		/* If there's no work left to do, tell the core net
-		   code that we can accept some more. */
-		if (!ppp->xmit_pending && !skb_peek(&ppp->file.xq))
-			netif_wake_queue(ppp->dev);
-		else
-			netif_stop_queue(ppp->dev);
 	} else {
 		kfree_skb(skb);
 	}
@@ -1850,7 +1847,7 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 	 * queue it up for pppd to receive.
 	 */
 	if (ppp->flags & SC_LOOP_TRAFFIC) {
-		if (ppp->file.rq.qlen > PPP_MAX_RQLEN)
+		if (ppp->file.rq.qlen > PPP_MAX_QLEN)
 			goto drop;
 		skb_queue_tail(&ppp->file.rq, skb);
 		wake_up_interruptible(&ppp->file.rwait);
@@ -2319,7 +2316,7 @@ ppp_input(struct ppp_channel *chan, struct sk_buff *skb)
 		/* put it on the channel queue */
 		skb_queue_tail(&pch->file.rq, skb);
 		/* drop old frames if queue too long */
-		while (pch->file.rq.qlen > PPP_MAX_RQLEN &&
+		while (pch->file.rq.qlen > PPP_MAX_QLEN &&
 		       (skb = skb_dequeue(&pch->file.rq)))
 			kfree_skb(skb);
 		wake_up_interruptible(&pch->file.rwait);
@@ -2472,7 +2469,7 @@ ppp_receive_nonmp_frame(struct ppp *ppp, struct sk_buff *skb)
 		/* control or unknown frame - pass it to pppd */
 		skb_queue_tail(&ppp->file.rq, skb);
 		/* limit queue length by dropping old frames */
-		while (ppp->file.rq.qlen > PPP_MAX_RQLEN &&
+		while (ppp->file.rq.qlen > PPP_MAX_QLEN &&
 		       (skb = skb_dequeue(&ppp->file.rq)))
 			kfree_skb(skb);
 		/* wake up any process polling or blocking on read */
-- 
2.34.1


