Return-Path: <linux-ppp+bounces-298-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B7DAE33FC
	for <lists+linux-ppp@lfdr.de>; Mon, 23 Jun 2025 05:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A4753A7FBF
	for <lists+linux-ppp@lfdr.de>; Mon, 23 Jun 2025 03:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685CD19CC11;
	Mon, 23 Jun 2025 03:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlRqNVAH"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FE610E5;
	Mon, 23 Jun 2025 03:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750649681; cv=none; b=NM+5/4Pg2hNK9UkxYmowVkqq77qopSh3A1RfgAFxB8L30/neYJzP//5p8CawuEAV/M7/+Gi8lXJV4rc0aJA1UNYa5agd2cDUfrsKh0hXjkyUR2LQwrCiic66womAWwr7mkSQOij1sdhqdfaO6TaAOmAGeRgYpmKJdpqqkP0dG40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750649681; c=relaxed/simple;
	bh=lXjmMI9CtZtHxfiUJTvqITe5Oo1TwGCPB0imDz+0oTg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=iHolZRkXNBP+e47Il4iS4RnkUGIaJeBku2nnzqs6G60NiSn8lB+0bsuWSTmwUWIYARWHJQSCNy88zt+P8vSr3vAELsLvZhCeQmjsH6PVLlDo4ae0hbNye9ClYRKpbvPmI89zGGU++NQb1xUeq/aNET86G8iGEJaomnPVcxf8hjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlRqNVAH; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b31d489a76dso3064937a12.1;
        Sun, 22 Jun 2025 20:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750649679; x=1751254479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eql3VwMROrHW2B+HlytVrn2bj3G0w8gtwYP0PNEmI3k=;
        b=YlRqNVAHYIeu1HKIbkVeMJM09NOvXKFbVDTOPfOUxB7V2JOvqJwfWXD+yoXlnExtap
         QEU8XoU5kll0wTYQUMxohbNynX4A6QBwMRQ65BhR11t30n2ep7GdcnjJKUy9NySsBPZ9
         Udl2ddFTR43MUIQIB1ky8kpZA3Hd4T2Y4mxWGEhNgj7TFN4uOlVUrUsqKA0vdWFDK//0
         Jv3Rq35/dvrCLsICdaiYZHUVQcE7daltG04ch00k1lMKyykXTXvGDaLaxSMOVnqJq56t
         p9pMVQIQka3FO4zCzSOtWmXyAWtNtglFRAmmXFE+Ce9FPTJulbp+yv1PkOBHFYsKe7A9
         nbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750649679; x=1751254479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eql3VwMROrHW2B+HlytVrn2bj3G0w8gtwYP0PNEmI3k=;
        b=h1WDwDSq8jZMzU/AwT+E3u340X+Ul2Of8Etct+wWd9OcMNIwFztuvnWHVslpXbDW7E
         SjMBVE2E0hyjZ2hIjrQHUwrglpxJwJQ8Vr3H77LZcAx2WsAPkus9i2fSKr28pefrwIBR
         K0AJuu/4xSZsRYT7q7wBaf4ThJmlo+K/LxrGlaA0wl86pbjc5aNTG7ps4y3NVs3U1O5N
         aqZpOE8ZieaZ5fU+kP2sDa/SflA6maWHUx0X8SXbGvSgJyLOt1pvYbE+tmcr1rTGD4Fm
         y3LvMJfIcWfzDux1+vi6HH4sPynBymwG2a0P3qnEynTb8+mJRZNJ2Z3dbGwNWM+IT/+I
         erTg==
X-Forwarded-Encrypted: i=1; AJvYcCURKO3oINduIAyHaWHjM0s6rJ/h+ReJL4PmqyKlv6qDMWWcg+dbL2n1heFMjaCQZj5v8on+doQ9@vger.kernel.org, AJvYcCW34awe0QzZJ+gdHTaN064N4g3yfqUW27Ezdp4m4loanKyqgu053J8k4PocxhzFggE7D2Uhl2y834tLbtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjtbsQZr51eF53O83VQ+5lKbry9KIjPtBf0SKQVEUduJsEqjky
	iSOnvChgROE8vSMmJhR+43S7yKVEyxTSJTcE67LrjqLK5x24QBEohbY7vvHAyUBE
X-Gm-Gg: ASbGncsZJh3iq9C9AM2jylWXWjTjq6vh5TL2kcdDTRObfLXHw37zedt0OjJOKOPDIee
	aAv1J2Hx/+VkjAlmTb3qTUs3j0L5ZtajgFo4uYHmifC+cReAW4BVmw6zMCgWGheycnxpKjm6Liu
	G2ipCbwS36DEzWmUYkfe5u7MQV4tHBYdBwtaYDpB1hr2UNP7iVRMMamf10k6gNUV3ojOgqu3vnv
	J4f26j606x/7ZA16MVPRiomOL8u43C2idzQhNJyS2q4R1H+NmJqYGm7adRGJXdh43paysQmKNMI
	YossmyvF6uomghstyuzVaQJNXNTl2UNXQdHUhTrykPPeLeogTKSObuW7
X-Google-Smtp-Source: AGHT+IEhgRl++Fx55uLO7+/lhP80b0zMUkWLxP10oWJZffLh24Wy9vh5iBElL4IOt7Ew0kK0YE6TSQ==
X-Received: by 2002:a17:902:ebcd:b0:235:f70:fd37 with SMTP id d9443c01a7336-237d9848159mr165547735ad.19.1750649678995;
        Sun, 22 Jun 2025 20:34:38 -0700 (PDT)
Received: from gmail.com ([116.237.168.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8397243sm71818625ad.20.2025.06.22.20.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 20:34:38 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: linux-ppp@vger.kernel.org,
	Michal Ostrowski <mostrows@earthlink.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] pppoe: drop PACKET_OTHERHOST before skb_share_check()
Date: Mon, 23 Jun 2025 11:34:31 +0800
Message-ID: <20250623033431.408810-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align with ip_rcv() by dropping PACKET_OTHERHOST packets before
calling skb_share_check(). This avoids unnecessary skb processing
for packets that will be discarded anyway.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/pppoe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index 68e631718ab0..410effa42ade 100644
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
@@ -418,6 +415,9 @@ static int pppoe_rcv(struct sk_buff *skb, struct net_device *dev,
 	struct pppoe_net *pn;
 	int len;
 
+	if (skb->pkt_type == PACKET_OTHERHOST)
+		goto drop;
+
 	skb = skb_share_check(skb, GFP_ATOMIC);
 	if (!skb)
 		goto out;
-- 
2.43.0


