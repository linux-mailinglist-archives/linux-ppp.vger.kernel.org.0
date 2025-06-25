Return-Path: <linux-ppp+bounces-304-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8993DAE7556
	for <lists+linux-ppp@lfdr.de>; Wed, 25 Jun 2025 05:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09CBB189C639
	for <lists+linux-ppp@lfdr.de>; Wed, 25 Jun 2025 03:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5911E3DD7;
	Wed, 25 Jun 2025 03:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnChaHOH"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9CC1DDC1E;
	Wed, 25 Jun 2025 03:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750822835; cv=none; b=SPPc3JebkkOd1xy7Le7mm4BeqLL49IG/G2WwiL/mGphAwAmkq4YbfuDuVz3wwLtHQemjcbQQ5I5y8pn3zur4iAQ8BnIhZ7FM0zMKttHpoDkljJFEnsFo6JE3hTDPU6c/cPQwObvO6w87zeAPFquY/gwC/eRomQJvys8+nY1kdic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750822835; c=relaxed/simple;
	bh=m9UCB1P/GvtFbY2gFYHNB4ATzSNqAcgF/+6urrrDPmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ghPvKWns2ofdDuI0O8TqAY1s+LPUJ06pScIG59kmVv2hN+3741dP4Z7q9WMBIGiTNjg1ACi0jnDwbwlmcQYaH+rUrQr4B0Ms9lKQA6dIQcdHJ4VK6on5eaiJ9ZE3+zLi0qHeHAmEpLraJqfgYqiajPyeuJcFrhpqJWFqeWzd9dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnChaHOH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2352400344aso15338965ad.2;
        Tue, 24 Jun 2025 20:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750822832; x=1751427632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xybhSY03PxXHOqVRCd6iZj51mdLSivNqZ6hUhbRTzh4=;
        b=VnChaHOH++K8unXnMxc3Fq0zryBaoaiEBMD1I0cTk/pgL6s/oHIe9RUuEnIbtdEoKl
         QIyNbs1ayf7PjJ3lTP24YKrKxpt9M8NQHWge6Fd6kwdL5yLa/Bz4kWA5TnnghyZJL8mV
         foyeD4Ua7hr49ezQsguC/VUwPnRU3zBb4Whqrin219p2kW4OwT3Zm1JQuMFFHKqakJhz
         ftIaiYT2BjXl0IfOtz9fcG8VmPUNSLxAPsQPHVNCjHT26AvW23nH8zdT4IEbH1EN5BiI
         cZw9UzjKVme+i1sai+hfno0S1K/55nDI+QPr4q79+gdvVl4lbRQFKJ40M3MdcMWmmcCM
         rHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750822832; x=1751427632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xybhSY03PxXHOqVRCd6iZj51mdLSivNqZ6hUhbRTzh4=;
        b=E1Nhgd0XV5fTSi6x99Mu0eWWvgmuz2xNAOQWEqbnY0YsUBHFaPfXu/BL8I9kZp87ab
         Nr4rGkZ8dx19uqI2faxzaZIImvXtZ6BNqCnLSPVQS0pm8vFC3nOaxNeeF7u6Qd/MoZz/
         V7oSHNaQgzjfV3iMXxQ//IuECMyIX3X6CEJQU7M2nj7/vg9mpDRujlEDcIUuoFp6Flkj
         vzzIvWdTxqnCzpbPBTslbSOkNf2bBa0l2e5C5W26qO46sb01uvxYx7PDqeQsW/oENj7J
         Mt3lCQ1P0CMUTtzqhL8qeKlSKaF+CjNMKFitwhDBQHDE/NbNH/CwRo4uNwwegppNYuB2
         AncA==
X-Forwarded-Encrypted: i=1; AJvYcCV1bqz9hWN1w/LSJRPfrLRulB8K+gOw2NXMJvgwlxocAYh0gZSpmFDJ3wiRwvgsuknmPFf40ubo@vger.kernel.org, AJvYcCWUWopcchlRpQTwJzLTckQUa3rEtDOr9sobQ5ydLtgIUWgvBdkHhXVAern6+QVZatt52MJ3O9w9cr1Z@vger.kernel.org, AJvYcCXdunyqBJgT0fQKDWYGMjGdAiYM4o95wROR4aNWvTDebjpHo48OH8CwRxfBVOB7kHAXSVhhuWDnik+navI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC/qRg1BFNjkucoeqOo+VU1dCu5gLnl5FGgLU2fd/Wc+d5a3cF
	b9SMIyQPO3hxPBurJvaxi6yF9Ki4ZNyAYnPV969G+9SIiC1OhYhdOj3T
X-Gm-Gg: ASbGncsEHbm6ZVcaanof0oR4/9arNItXUaXsUhgfhsm/hPHREdhCGbvX+VgxiKg4eb9
	RFFTSUueU9fzGkZQLrxAyrKw/BUhfIBb5zV309+od1A3oWc/krWMxri8FT9rZCALvqMIklVG3St
	ufb65HoP4G7SS8EWU09+RUIe3BTK+fja7Ra57RwNa/g3AbBhHXYZwUrMtSplrlOTLSRYqcuA3p+
	WXbPOtxaVeJakPuadcw9JU/P3X8bN6vswtTrA5+CzRklBf5kts1pPJ1IQ40QYiOZ6wlCt/+w0SP
	rwwbyCoTtF0ttfSY3+qbL+uG+yyzCvR4lQ1zzDWRgST5x/obVhIc1dCz
X-Google-Smtp-Source: AGHT+IHM1TQj+OvrL4n8l0wjjKtrm5DykckFXUshmPrZnyb+H2mzphLep5vhAuTZLoOQZ1IExpUthA==
X-Received: by 2002:a17:902:e74d:b0:22e:72fe:5f9c with SMTP id d9443c01a7336-2382478a93amr23416585ad.42.1750822832551;
        Tue, 24 Jun 2025 20:40:32 -0700 (PDT)
Received: from gmail.com ([116.237.168.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1241f4asm9640143a12.44.2025.06.24.20.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 20:40:32 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Ostrowski <mostrows@earthlink.net>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guillaume Nault <gnault@redhat.com>
Subject: [PATCH net-next 2/3] pppoe: bypass sk_receive_skb for PPPOX_BOUND sockets
Date: Wed, 25 Jun 2025 11:40:19 +0800
Message-ID: <20250625034021.3650359-3-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250625034021.3650359-1-dqfext@gmail.com>
References: <20250625034021.3650359-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a PPPoE session socket is in PPPOX_BOUND state, the RX path is
fully synchronous and does not require socket receive queueing or
callbacks. Avoid calling sk_receive_skb(), which acquires the socket
lock and adds overhead.

Call ppp_input() directly to reduce lock contention and improve
performance on RX path.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/pppoe.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index 410effa42ade..ba30d7afe9ff 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -413,6 +413,7 @@ static int pppoe_rcv(struct sk_buff *skb, struct net_device *dev,
 	struct pppoe_hdr *ph;
 	struct pppox_sock *po;
 	struct pppoe_net *pn;
+	struct sock *sk;
 	int len;
 
 	if (skb->pkt_type == PACKET_OTHERHOST)
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


