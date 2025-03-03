Return-Path: <linux-ppp+bounces-274-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 285A8A4B680
	for <lists+linux-ppp@lfdr.de>; Mon,  3 Mar 2025 04:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BF9F3A985B
	for <lists+linux-ppp@lfdr.de>; Mon,  3 Mar 2025 03:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F921D6DDC;
	Mon,  3 Mar 2025 03:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mub9XnSV"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7772E1D5CF2;
	Mon,  3 Mar 2025 03:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740972434; cv=none; b=GxspD/vwZMUqnxsZak42RHkOikzm8iVgsxBglVV4GjMvX488Wt4W0JfyJZij+19eBcX359Mb873EMyU+DGa3y/oZ4A9w4aVz9/56ENXkc9rwWkpdtgrOpOhz2GL7RnMMlJcuA3pvLyZqmpRRsgS/dd5G01aA+MpEBD+dirfVS7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740972434; c=relaxed/simple;
	bh=alqNxORKFBkOMfK7DdKpC0M9XXoCppPzAlZwVlJOzAI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dn6QNulYcB5MrmBj8WYx1nOOgsmdMr231d+dxy+OIMLb94wjcBs1rfuS9Jzz2NlIzzWTf1ZAkbwdMre3YNuIe1v23wytEGXSiYfiqsRnTFrzZdWbJADTw5YYH6BNI/NmXtmDvsb1D5FyjqMIK5ggYEgU1ur9sajeBHNH0GIwcaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mub9XnSV; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22334203781so76905065ad.0;
        Sun, 02 Mar 2025 19:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740972433; x=1741577233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NK/rjgMAYBmWO2Q1oj86nUOeumwfRTzawLjmmd1Yqlw=;
        b=Mub9XnSVunkPk/YXWgRZFqocT+j7NzrIYdQwB/+1tFvmsmyagr27/PDsoHIZpiXpfn
         BnyX5cqLVsTCWx54LPtJZX+OkjR52rPs4NNZ5qxRXLPkHwRh/4/0ZUHtMQhm15wwaVzb
         KINLAiraMt/0nTT/hbavynlyYY0kQisg9t/FcRwdE+XC6GNNt6IqfThWQzL7P03M2Qny
         ttLJu3eFUmoamBvam/B2qUuz7SUo/MSGBrJm63vHDB9BMNm+xsXuaHAkycFyiI8PyHsb
         HXBX+3r7MoxZvEx0icpFvgfjXX7rdQzcH/cpQpiOWZki53rhtDpF4Q67l13rqXNWOc5G
         ZzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740972433; x=1741577233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NK/rjgMAYBmWO2Q1oj86nUOeumwfRTzawLjmmd1Yqlw=;
        b=LTVG4Z2+eK/QDPMB5oN/JKXQ76Dm8JbHqPL5q56FjwE/CPpxncJmotmUGUS40epDl5
         puKMRAOikg+2Q5gb5p5FvmfIFckmfuNkBWeansXw2q8rSPoBmYBIhc9N0MNUGK4Zbmdr
         mJbQ9se+iBaYusC5uCDc4cfSren5QFmdau80s9P+hcjw6d9C7bO9mJ432lqDQCU+tu52
         FPNRILjRywfO0dsAUILA6o7qUvwNuWq2I7V17obhGzAI476+7I34JMWtmwUWf3r8AeDn
         cgpzgot+9zN9jO2oaBfzctTux1b4jI27cs4zpT0bRWvoR2WXT9Bu3WShryvOADLe+KKm
         duNA==
X-Forwarded-Encrypted: i=1; AJvYcCUCBEmPGe4ACl2SiLg82KF7bedp5vhKq8XpTI7pKlsU8pWFSkpgdSYoMF2Qsl8x4SZlRSnOIk97g3LKXR0=@vger.kernel.org, AJvYcCVZYO5v1uuCUXylUo1LM4F2qb14p1eQxt1UIiUrIy19Z4VREGBn3qSmbJ+n3MFyEZ7NueBtT3CTCWUH@vger.kernel.org, AJvYcCXS8pFLIepBzXHHrxYFf/I/xOAvszU1i2TRtvZKJ9C3stf389/csAOoO9TdvdU7PktGp0cdl4e8@vger.kernel.org
X-Gm-Message-State: AOJu0Yybi7KC2Q89j6CYGuguv8ICd6Ri6oyrTyON9vnONlW2zUegAlM2
	OTaxZ2z8geqVKEYyVikdC2KYqXTgH41RwMb9u7J+exzjHaXU0krD
X-Gm-Gg: ASbGncvx6Nb/HMnIZFG3sQHdwp9S5pLhPqBT4I4X6Sw3Nju/75pRj6xQ1QoD9yeQ92l
	y52rwPR7uBZwy+7dV7KXcF9f/6T0UlE77fwrnTUVwC2ZUGrviy4tW1kB2JD8kfdCSBOQFfzsAy1
	vKYQSMoKJm9utEFTIWr4icaRJ5FKAjGR4FISS27KPFKBj8cqiM/tydcWYYBmeUJqJoGT+ZjwHew
	7OMMbew20Li+J+mRKgMRNoZg+USZL4OsyPLey1hQ8/CErtaskBlOjuVzhLKFhutl7Wy6lrZZNir
	11hUTDJbWVf540pBIMFCJw082Jn0/mx+q4L6ng==
X-Google-Smtp-Source: AGHT+IEtKpD/BJwVd8J4fWmn45DHzqYqC+VNko2x1rZ9JOP8hZGZUr5MI4WsFhQSkBsz+A+s/p2OpA==
X-Received: by 2002:a05:6a00:cd1:b0:736:4d05:2e35 with SMTP id d2e1a72fcca58-7364d0530cfmr5249636b3a.3.1740972432585;
        Sun, 02 Mar 2025 19:27:12 -0800 (PST)
Received: from gmail.com ([116.237.135.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73632e76e1dsm3768873b3a.89.2025.03.02.19.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 19:27:12 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Ostrowski <mostrows@earthlink.net>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 2/3] pppoe: call ppp_input directly when PPPOX_BOUND
Date: Mon,  3 Mar 2025 11:27:01 +0800
Message-ID: <20250303032704.2299737-2-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303032704.2299737-1-dqfext@gmail.com>
References: <20250303032704.2299737-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bh_lock_sock() in sk_receive_skb() is causing unnecessary lock
contensions. When PPP is connected, call ppp_input directly.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/pppoe.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index 2ea4f4890d23..26f86c9730bb 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -372,9 +372,6 @@ static int pppoe_rcv_core(struct sock *sk, struct sk_buff *skb)
 	 * can't change.
 	 */
 
-	if (skb->pkt_type == PACKET_OTHERHOST)
-		goto abort_kfree;
-
 	if (sk->sk_state & PPPOX_BOUND) {
 		ppp_input(&po->chan, skb);
 	} else if (sk->sk_state & PPPOX_RELAY) {
@@ -416,8 +413,12 @@ static int pppoe_rcv(struct sk_buff *skb, struct net_device *dev,
 	struct pppoe_hdr *ph;
 	struct pppox_sock *po;
 	struct pppoe_net *pn;
+	struct sock *sk;
 	int len;
 
+	if (skb->pkt_type == PACKET_OTHERHOST)
+		goto drop;
+
 	skb = skb_share_check(skb, GFP_ATOMIC);
 	if (!skb)
 		goto out;
@@ -448,7 +449,14 @@ static int pppoe_rcv(struct sk_buff *skb, struct net_device *dev,
 	if (!po)
 		goto drop;
 
-	return sk_receive_skb(sk_pppox(po), skb, 0);
+	sk = sk_pppox(po);
+	if (sk->sk_state & PPPOX_BOUND) {
+		ppp_input(&po->chan, skb);
+		sock_put(sk);
+		return NET_RX_SUCCESS;
+	}
+
+	return sk_receive_skb(sk, skb, 0);
 
 drop:
 	kfree_skb(skb);
-- 
2.43.0


