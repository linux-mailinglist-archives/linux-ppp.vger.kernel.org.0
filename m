Return-Path: <linux-ppp+bounces-305-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6525DAE755A
	for <lists+linux-ppp@lfdr.de>; Wed, 25 Jun 2025 05:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8DC65A479C
	for <lists+linux-ppp@lfdr.de>; Wed, 25 Jun 2025 03:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7EF21E98E6;
	Wed, 25 Jun 2025 03:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LChGkOqb"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EE21E5201;
	Wed, 25 Jun 2025 03:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750822837; cv=none; b=C9LXTv0X+8fWr5l7foGZqNkzkvb5eEA/U71lwIDaJ1NYGGj7bG+ETXhwrEgcRmjeFt1lHTmza1yg9Kw/+okqZsyo3qR2dH8hyofIa5uMfmDwCaYAjHx3TZgXtS5BKGbpF6eCBMH5g9u4u2Xcx+KmxYLAeGFgUOScoYpFr6tYnEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750822837; c=relaxed/simple;
	bh=hYUNfqwe+K6kc7dnp7yEcTWB6x4Tb4qeUxw2GboxFfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqUdTctB768g5YfWBseKSonajcdEqcaJBVzbgR7IiK2qi3reRyr0TXmdutNl1H/J7R1fliQAo8Cyn2LgeS15HB4OyLIEqj/sjVgruzWsKIN9sG7Kk5BHQl9zI1OpHUpaMhFVO1Q8hmJ+uM0pCo5Qpabh5Et6JAZpLkKR4Gll/4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LChGkOqb; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b34a8f69862so1141483a12.2;
        Tue, 24 Jun 2025 20:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750822835; x=1751427635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iUJ9YFNjaHHQEh+V8ymue/86vfSoA5y6eI9d+EESUo=;
        b=LChGkOqbUQxWdU4txUh4Awtfy/h3NPQJNfkWkT9l6gIF9GPPgToL/BQKd0lzXfs1sZ
         dh9DTVkxgVx+StKqmCMIQKXKaJnKRhdBv1KtpK2WIMh0Atczw0bkFsGWnSzJLBRaSa9l
         HX04wO4kyw5oFdutqkRmLFUs5wd7n5BIVbiLC8CHt6Yy33USIzUahERwK84fsEHfv3WC
         JkUFiydpbLSQ79ACHOhfJbWtocLfc8ulwEzA42Xj7LE18i7oL130qfGzMwfDIS9lHtb6
         G4YeTWhOT4b84QB2wOeX+/Kkbu/1uG134HlKVCyubytaHhvSjSwMsOGFJOjer4DgBTCZ
         DdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750822835; x=1751427635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2iUJ9YFNjaHHQEh+V8ymue/86vfSoA5y6eI9d+EESUo=;
        b=kLYwOS7wTopXxoHL9sDkNI78+1Gy1FQrNsAgNk2c35MZvBoVXYVS+QlHuZUFBRYqu+
         Uo+Zho7MkCzk9tlDpkOKHqR/XUFMH+pt3CyWoKVFec0Kt0cDShLtNcEMNJC4iKzREaKl
         PRYn7lKhv+vhqh1yGktaIes7AKUhfwYHFUz+8ddiZy8UXlT51NakgAjMFedWjRpa8Pn9
         H7vpQ1jW9+PBUBIcqL/ANguDGuVcBk5C2/RTZz0M3c3zDaRHLuuYyX4eFfOwtMOaAeKD
         2eJuILBRvdRAmd+XwGn+nZimMCS76qiAZRi5Q2HsJ/cxJUdBsBrBEDMRtGM+xrPunU01
         sdhw==
X-Forwarded-Encrypted: i=1; AJvYcCV0qPasqIrEnlH/+eZjV6sCns0W7uDssYijhbLw2/6eZrObSkNUohnRnNlle5c4O8Lwaa3BVCJQ@vger.kernel.org, AJvYcCVuflrjHoBPJqeh0onguEGqbjeEQYI0y2ksM+KTMubHh2NCnKFBOxt1IYnLOL1imLH7MzcxQBVGK+qQ@vger.kernel.org, AJvYcCXgLVpHd7jlyaTWZB+sY0watmnWcp185d15ode0ss0YE8oG7Rqu1Dwmp90xlUm1fUA+eQqREM5gTOqmlhY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8b1h5zu77SXBLxueoPCL5GGcrEaCouMNwdLXvJDTfeCWqBUIU
	uUIle1Xwfa7xMMYDpYTPoVxRpfHLDFd4xVE8DiqQ6dpmcsEC8Zs/8GTl
X-Gm-Gg: ASbGncuJ/3rdkKT1NYER0rl17vv2yBRryMkImZYBWQpCMBfqsltalAEYAnhBjHKY0hs
	yhR6JMHAbH4wPlFxuPrXsvN4z4r/nKzpHqBEebUeW+VnF7yO8bHqa55XKxB2U0EVyGIZhoopzC6
	Ht6RZUDAqb1FxoGYXZ8bjoD9ZLTuvvE3VsibUIe05qOwY1yquLg/RS3QqKMRyVlLEIGXuxPnslJ
	KIJuzRnriQ656IHCJVlgcBMF4KS9NoFQQ4+ke6g8k2JEZz9j3q+ijdBaWgnkcfVudAv7Qbiw1OR
	Zid4mRnCEZX/WVS4BVAkJjKtOjBvuZoO1W9jTJdYLx8zQ4LCVuGnpzul
X-Google-Smtp-Source: AGHT+IGS1W8dpUuqdO8azqyMFNLzZzGu6oo0ee2bhCoduGNYNk6YdCAXXCJ2jKgpFf7Pcpu5mHWgcA==
X-Received: by 2002:a17:90b:4fc9:b0:311:d670:a10d with SMTP id 98e67ed59e1d1-315f2689f95mr1661580a91.26.1750822835378;
        Tue, 24 Jun 2025 20:40:35 -0700 (PDT)
Received: from gmail.com ([116.237.168.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1241f4asm9640143a12.44.2025.06.24.20.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 20:40:35 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guillaume Nault <gnault@redhat.com>
Subject: [PATCH net-next 3/3] ppp: synchronize netstats updates
Date: Wed, 25 Jun 2025 11:40:20 +0800
Message-ID: <20250625034021.3650359-4-dqfext@gmail.com>
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

The PPP receive path can now run concurrently across CPUs (after converting
rlock to rwlock in an earlier patch). This may lead to data races on
net_device->stats.

Convert all stats updates in both transmit and receive paths to use the
DEV_STATS_INC() macro, which updates stats atomically.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/ppp_generic.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index f0f8a75e3aef..4e787d1823c1 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1478,7 +1478,7 @@ ppp_start_xmit(struct sk_buff *skb, struct net_device *dev)
 
  outf:
 	kfree_skb(skb);
-	++dev->stats.tx_dropped;
+	DEV_STATS_INC(dev, tx_dropped);
 	return NETDEV_TX_OK;
 }
 
@@ -1851,7 +1851,7 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 
  drop:
 	kfree_skb(skb);
-	++ppp->dev->stats.tx_errors;
+	DEV_STATS_INC(ppp->dev, tx_errors);
 }
 
 /*
@@ -2134,7 +2134,7 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 	spin_unlock(&pch->downl);
 	if (ppp->debug & 1)
 		netdev_err(ppp->dev, "PPP: no memory (fragment)\n");
-	++ppp->dev->stats.tx_errors;
+	DEV_STATS_INC(ppp->dev, tx_errors);
 	++ppp->nxseq;
 	return 1;	/* abandon the frame */
 }
@@ -2296,7 +2296,7 @@ ppp_input(struct ppp_channel *chan, struct sk_buff *skb)
 	if (!ppp_decompress_proto(skb)) {
 		kfree_skb(skb);
 		if (pch->ppp) {
-			++pch->ppp->dev->stats.rx_length_errors;
+			DEV_STATS_INC(pch->ppp->dev, rx_length_errors);
 			ppp_receive_error(pch->ppp);
 		}
 		goto done;
@@ -2367,7 +2367,7 @@ ppp_receive_frame(struct ppp *ppp, struct sk_buff *skb, struct channel *pch)
 static void
 ppp_receive_error(struct ppp *ppp)
 {
-	++ppp->dev->stats.rx_errors;
+	DEV_STATS_INC(ppp->dev, rx_errors);
 	if (ppp->vj)
 		slhc_toss(ppp->vj);
 }
@@ -2634,7 +2634,7 @@ ppp_receive_mp_frame(struct ppp *ppp, struct sk_buff *skb, struct channel *pch)
 	 */
 	if (seq_before(seq, ppp->nextseq)) {
 		kfree_skb(skb);
-		++ppp->dev->stats.rx_dropped;
+		DEV_STATS_INC(ppp->dev, rx_dropped);
 		ppp_receive_error(ppp);
 		return;
 	}
@@ -2670,7 +2670,7 @@ ppp_receive_mp_frame(struct ppp *ppp, struct sk_buff *skb, struct channel *pch)
 		if (pskb_may_pull(skb, 2))
 			ppp_receive_nonmp_frame(ppp, skb);
 		else {
-			++ppp->dev->stats.rx_length_errors;
+			DEV_STATS_INC(ppp->dev, rx_length_errors);
 			kfree_skb(skb);
 			ppp_receive_error(ppp);
 		}
@@ -2776,7 +2776,7 @@ ppp_mp_reconstruct(struct ppp *ppp)
 		if (lost == 0 && (PPP_MP_CB(p)->BEbits & E) &&
 		    (PPP_MP_CB(head)->BEbits & B)) {
 			if (len > ppp->mrru + 2) {
-				++ppp->dev->stats.rx_length_errors;
+				DEV_STATS_INC(ppp->dev, rx_length_errors);
 				netdev_printk(KERN_DEBUG, ppp->dev,
 					      "PPP: reconstructed packet"
 					      " is too long (%d)\n", len);
@@ -2831,7 +2831,7 @@ ppp_mp_reconstruct(struct ppp *ppp)
 					      "  missed pkts %u..%u\n",
 					      ppp->nextseq,
 					      PPP_MP_CB(head)->sequence-1);
-			++ppp->dev->stats.rx_dropped;
+			DEV_STATS_INC(ppp->dev, rx_dropped);
 			ppp_receive_error(ppp);
 		}
 
-- 
2.43.0


