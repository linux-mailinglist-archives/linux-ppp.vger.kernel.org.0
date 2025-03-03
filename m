Return-Path: <linux-ppp+bounces-275-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC75A4B682
	for <lists+linux-ppp@lfdr.de>; Mon,  3 Mar 2025 04:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 613D716BCA5
	for <lists+linux-ppp@lfdr.de>; Mon,  3 Mar 2025 03:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166E11C8604;
	Mon,  3 Mar 2025 03:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBNQPlqo"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637511DC9B8;
	Mon,  3 Mar 2025 03:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740972439; cv=none; b=hJSTtGy1rY2CdcqElAY8yCY4Nh+5w1IWsQRy3oB8sEo7dkwjPN5FJlJLMu1QPHTESC2nXpjOi8Y5qXP2FzIpalMmad3dPsPuA5tpLevC13ZjAM+1w5O8T7R3GtBimzaZ8SbEqxIlOAnhTsz3XXFzPfoCb0j97UBzh6J/HbXA7pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740972439; c=relaxed/simple;
	bh=/Q3E18RDSL74fEbfG3cOtyOZqOkQfDlYC6M+XiPoTek=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QlubRv5CoGTtDLOImEZn32OJmm7NUIy33NEcvfCwyLAtMvj/0ulsEZw3yAd/escXP6a/WosUs85IAITOKuH5GIsw7210ROeddgf+wVaKGl6ISo13V4aBpmMc1KzaVJgVglPVDodPxi65U8YV+t7S5/OME43B+9KUAc/R6/T3v1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBNQPlqo; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2fe9759e5c1so6232148a91.0;
        Sun, 02 Mar 2025 19:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740972436; x=1741577236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=poR0CzZHYpWqnYgTQWKtFsUT3XvDqMig+H5pMLgNcZ0=;
        b=gBNQPlqoLI37WN+JvMsa+H5ps1fUZtuZgR8y2N+24s1XwzuhsdxZKaU+SV15mpY9xn
         FbEqSt/vCFTqNX1p0AcwWm3C1aXvJEBuZhLcoKSMlGy61tLOLVFuPRWedXEu7WTsglRH
         rMC1DtB7HmSx8cPLrTsqNgog/uOYJ6CxO+g1y1vAg6cvuiOVsE3a57IybRiLHWiW9nuf
         N247hEZOeH2z+kWwwXuE5bn43NjuUxZ0Cu9lKGKKfUO2VUVdO4mk4pXxBi1JqoypMFui
         hdgF/IA7QWdX/5JLvuIG/3eICWLOHsnIyzGYfmInjFK1HsHeo4YLD0Uqwam8Nxd8AR0x
         b62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740972436; x=1741577236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=poR0CzZHYpWqnYgTQWKtFsUT3XvDqMig+H5pMLgNcZ0=;
        b=qg2dVpE3VGJNSvy6M+HfT5gSLSbG5dVwJBTdzBopucDOx7RitX8qjCJGPVl0mRT2/1
         T8EAGOuWIO3MgIcWPD7NvXlDdGtcmLJ4D6E6ENbAGwu0yiNSuZDMZOeZuHEd7Nw3SGmw
         qH7loZq46G2LVvJIWa2HhrNkEHVJe1ZVXUKVK5aTh6nfRU52/U9NB+FVaqkWyGNp9KQu
         IzoQG1rR5FlxUgcIREItoLe2Cusxl41AaIzU4cAZHTu4AjeX8x1OZDG3naB7k3nPfgKc
         521goghwESSQgoyseT5OO/NOd9jAeffgqa2LsdBnULsghSZ56uiM2gd7ntxsZVOX9emY
         3wSA==
X-Forwarded-Encrypted: i=1; AJvYcCU4zdJ93/Qj9/rCYwTJigT79xggDasrWSyaoeilX7u+7MNxF6K7t8FCMPxGaMZ2ieV6OyjT/OpAGBa7tjg=@vger.kernel.org, AJvYcCULrt/Mehk0QHOOUaXHn1wnjOdS/y+a7ZO60YLhSGFVjj9dJQeOZamdewQrDcoaqhFRtgEH08v3iS8n@vger.kernel.org, AJvYcCVZkl68UjJBBI4v2c8308WAeX+MkIkh0N0rEx78Fhr2b3ZagkdAV63+a7fdpk6WhbLwfMwnulzy@vger.kernel.org
X-Gm-Message-State: AOJu0YwsV3RK27MZI838X9ZOud/mvPYNZs/oIRL/Ht4QsfOtjity5wvf
	uIZFNjaiHBFpA4SIZ236VQ10YSHFKV7BRna5zOYdq4YRtyp15wft
X-Gm-Gg: ASbGncuE012pAsv4AXTXOMuQOE1MzLqyNm4XPnN8tr9vEIOjwiX53hUkcbAdVjWaQs9
	7mqtTHbfm9enyDEs0dr8KlN9WLl8Y9jeOuT2nCNqfUUV28wDYcKGvojuevgiDBLDxu97yRWDlH6
	+GAlJFjgZIiRKFLsFzC9tI+7NX0DAInOzwvNXP4RJlnduAm6JBmHYZOlBUlDvo3fMgvWFXnqUzW
	XHLJ7oPneHkKkbQbkLVv7JcPD1gRXDVQ7jy8NUTCORlHdc7tnMGlDYpnRpJ1paHnBJuyx4vmiSW
	oacj2Ng+AmC/jIm/etClNkoMFZnjlx/6n+w7Hg==
X-Google-Smtp-Source: AGHT+IFfDlt66Ok/ZMoXTRpcCYrajfhI4gB9evz9JXwaRXdL8ion3BaaHmQHLq4upSLbThKcMfbvQg==
X-Received: by 2002:a05:6a21:3287:b0:1f0:e40a:4266 with SMTP id adf61e73a8af0-1f2f4e4e22fmr18419882637.39.1740972436310;
        Sun, 02 Mar 2025 19:27:16 -0800 (PST)
Received: from gmail.com ([116.237.135.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73632e76e1dsm3768873b3a.89.2025.03.02.19.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 19:27:15 -0800 (PST)
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
Subject: [RFC PATCH net-next 3/3] ppp: synchronize netstats update
Date: Mon,  3 Mar 2025 11:27:02 +0800
Message-ID: <20250303032704.2299737-3-dqfext@gmail.com>
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

As the receive path can be run concurrently, synchronize netstats update
by using percpu vars for normal stats and atomic ops for error stats.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/ppp_generic.c | 74 +++++++++++++++--------------------
 1 file changed, 32 insertions(+), 42 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 15e270e9bf36..b133f370a258 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -95,18 +95,6 @@ struct ppp_file {
 #define PF_TO_PPP(pf)		PF_TO_X(pf, struct ppp)
 #define PF_TO_CHANNEL(pf)	PF_TO_X(pf, struct channel)
 
-/*
- * Data structure to hold primary network stats for which
- * we want to use 64 bit storage.  Other network stats
- * are stored in dev->stats of the ppp strucute.
- */
-struct ppp_link_stats {
-	u64 rx_packets;
-	u64 tx_packets;
-	u64 rx_bytes;
-	u64 tx_bytes;
-};
-
 /*
  * Data structure describing one ppp unit.
  * A ppp unit corresponds to a ppp network interface device
@@ -150,7 +138,6 @@ struct ppp {
 	struct bpf_prog *active_filter; /* filter for pkts to reset idle */
 #endif /* CONFIG_PPP_FILTER */
 	struct net	*ppp_net;	/* the net we belong to */
-	struct ppp_link_stats stats64;	/* 64 bit network stats */
 };
 
 /*
@@ -1484,7 +1471,7 @@ ppp_start_xmit(struct sk_buff *skb, struct net_device *dev)
 
  outf:
 	kfree_skb(skb);
-	++dev->stats.tx_dropped;
+	DEV_STATS_INC(dev, tx_dropped);
 	return NETDEV_TX_OK;
 }
 
@@ -1534,29 +1521,22 @@ ppp_net_siocdevprivate(struct net_device *dev, struct ifreq *ifr,
 static void
 ppp_get_stats64(struct net_device *dev, struct rtnl_link_stats64 *stats64)
 {
-	struct ppp *ppp = netdev_priv(dev);
-
-	ppp_recv_lock(ppp);
-	stats64->rx_packets = ppp->stats64.rx_packets;
-	stats64->rx_bytes   = ppp->stats64.rx_bytes;
-	ppp_recv_unlock(ppp);
-
-	ppp_xmit_lock(ppp);
-	stats64->tx_packets = ppp->stats64.tx_packets;
-	stats64->tx_bytes   = ppp->stats64.tx_bytes;
-	ppp_xmit_unlock(ppp);
-
 	stats64->rx_errors        = dev->stats.rx_errors;
 	stats64->tx_errors        = dev->stats.tx_errors;
 	stats64->rx_dropped       = dev->stats.rx_dropped;
 	stats64->tx_dropped       = dev->stats.tx_dropped;
 	stats64->rx_length_errors = dev->stats.rx_length_errors;
+	dev_fetch_sw_netstats(stats64, dev->tstats);
 }
 
 static int ppp_dev_init(struct net_device *dev)
 {
 	struct ppp *ppp;
 
+	dev->tstats = netdev_alloc_pcpu_stats(struct pcpu_sw_netstats);
+	if (!dev->tstats)
+		return -ENOMEM;
+
 	netdev_lockdep_set_classes(dev);
 
 	ppp = netdev_priv(dev);
@@ -1586,6 +1566,7 @@ static void ppp_dev_uninit(struct net_device *dev)
 
 	ppp->file.dead = 1;
 	wake_up_interruptible(&ppp->file.rwait);
+	free_percpu(dev->tstats);
 }
 
 static void ppp_dev_priv_destructor(struct net_device *dev)
@@ -1791,8 +1772,7 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 #endif /* CONFIG_PPP_FILTER */
 	}
 
-	++ppp->stats64.tx_packets;
-	ppp->stats64.tx_bytes += skb->len - PPP_PROTO_LEN;
+	dev_sw_netstats_tx_add(ppp->dev, 1, skb->len - PPP_PROTO_LEN);
 
 	switch (proto) {
 	case PPP_IP:
@@ -1868,7 +1848,7 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 
  drop:
 	kfree_skb(skb);
-	++ppp->dev->stats.tx_errors;
+	DEV_STATS_INC(ppp->dev, tx_errors);
 }
 
 /*
@@ -2151,7 +2131,7 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 	spin_unlock(&pch->downl);
 	if (ppp->debug & 1)
 		netdev_err(ppp->dev, "PPP: no memory (fragment)\n");
-	++ppp->dev->stats.tx_errors;
+	DEV_STATS_INC(ppp->dev, tx_errors);
 	++ppp->nxseq;
 	return 1;	/* abandon the frame */
 }
@@ -2313,7 +2293,7 @@ ppp_input(struct ppp_channel *chan, struct sk_buff *skb)
 	if (!ppp_decompress_proto(skb)) {
 		kfree_skb(skb);
 		if (pch->ppp) {
-			++pch->ppp->dev->stats.rx_length_errors;
+			DEV_STATS_INC(pch->ppp->dev, rx_length_errors);
 			ppp_receive_error(pch->ppp);
 		}
 		goto done;
@@ -2384,7 +2364,7 @@ ppp_receive_frame(struct ppp *ppp, struct sk_buff *skb, struct channel *pch)
 static void
 ppp_receive_error(struct ppp *ppp)
 {
-	++ppp->dev->stats.rx_errors;
+	DEV_STATS_INC(ppp->dev, rx_errors);
 	if (ppp->vj)
 		slhc_toss(ppp->vj);
 }
@@ -2469,8 +2449,7 @@ ppp_receive_nonmp_frame(struct ppp *ppp, struct sk_buff *skb)
 		break;
 	}
 
-	++ppp->stats64.rx_packets;
-	ppp->stats64.rx_bytes += skb->len - 2;
+	dev_sw_netstats_rx_add(ppp->dev, skb->len - PPP_PROTO_LEN);
 
 	npi = proto_to_npindex(proto);
 	if (npi < 0) {
@@ -2653,7 +2632,7 @@ ppp_receive_mp_frame(struct ppp *ppp, struct sk_buff *skb, struct channel *pch)
 	 */
 	if (seq_before(seq, ppp->nextseq)) {
 		kfree_skb(skb);
-		++ppp->dev->stats.rx_dropped;
+		DEV_STATS_INC(ppp->dev, rx_dropped);
 		ppp_receive_error(ppp);
 		return;
 	}
@@ -2689,7 +2668,7 @@ ppp_receive_mp_frame(struct ppp *ppp, struct sk_buff *skb, struct channel *pch)
 		if (pskb_may_pull(skb, 2))
 			ppp_receive_nonmp_frame(ppp, skb);
 		else {
-			++ppp->dev->stats.rx_length_errors;
+			DEV_STATS_INC(ppp->dev, rx_length_errors);
 			kfree_skb(skb);
 			ppp_receive_error(ppp);
 		}
@@ -2795,7 +2774,7 @@ ppp_mp_reconstruct(struct ppp *ppp)
 		if (lost == 0 && (PPP_MP_CB(p)->BEbits & E) &&
 		    (PPP_MP_CB(head)->BEbits & B)) {
 			if (len > ppp->mrru + 2) {
-				++ppp->dev->stats.rx_length_errors;
+				DEV_STATS_INC(ppp->dev, rx_length_errors);
 				netdev_printk(KERN_DEBUG, ppp->dev,
 					      "PPP: reconstructed packet"
 					      " is too long (%d)\n", len);
@@ -2850,7 +2829,7 @@ ppp_mp_reconstruct(struct ppp *ppp)
 					      "  missed pkts %u..%u\n",
 					      ppp->nextseq,
 					      PPP_MP_CB(head)->sequence-1);
-			++ppp->dev->stats.rx_dropped;
+			DEV_STATS_INC(ppp->dev, rx_dropped);
 			ppp_receive_error(ppp);
 		}
 
@@ -3299,14 +3278,25 @@ static void
 ppp_get_stats(struct ppp *ppp, struct ppp_stats *st)
 {
 	struct slcompress *vj = ppp->vj;
+	int cpu;
 
 	memset(st, 0, sizeof(*st));
-	st->p.ppp_ipackets = ppp->stats64.rx_packets;
+	for_each_possible_cpu(cpu) {
+		struct pcpu_sw_netstats *p = per_cpu_ptr(ppp->dev->tstats, cpu);
+		u64 rx_packets, rx_bytes, tx_packets, tx_bytes;
+
+		rx_packets = u64_stats_read(&p->rx_packets);
+		rx_bytes = u64_stats_read(&p->rx_bytes);
+		tx_packets = u64_stats_read(&p->tx_packets);
+		tx_bytes = u64_stats_read(&p->tx_bytes);
+
+		st->p.ppp_ipackets += rx_packets;
+		st->p.ppp_ibytes += rx_bytes;
+		st->p.ppp_opackets += tx_packets;
+		st->p.ppp_obytes += tx_bytes;
+	}
 	st->p.ppp_ierrors = ppp->dev->stats.rx_errors;
-	st->p.ppp_ibytes = ppp->stats64.rx_bytes;
-	st->p.ppp_opackets = ppp->stats64.tx_packets;
 	st->p.ppp_oerrors = ppp->dev->stats.tx_errors;
-	st->p.ppp_obytes = ppp->stats64.tx_bytes;
 	if (!vj)
 		return;
 	st->vj.vjs_packets = vj->sls_o_compressed + vj->sls_o_uncompressed;
-- 
2.43.0


