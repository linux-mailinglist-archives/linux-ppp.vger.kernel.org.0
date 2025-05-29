Return-Path: <linux-ppp+bounces-294-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCA3AC7AEE
	for <lists+linux-ppp@lfdr.de>; Thu, 29 May 2025 11:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00C5F3B030D
	for <lists+linux-ppp@lfdr.de>; Thu, 29 May 2025 09:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D0221CA0E;
	Thu, 29 May 2025 09:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+N9N7HY"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DF0A55;
	Thu, 29 May 2025 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748510478; cv=none; b=gWv+OVOGA/GMCVa/ZUgRp5VtV6AIJn3E8Zng+4RLx3ABUYg7EgpBJ/d/4CIwvymHBSBUrSvuYufhZkb5+lwL3kjey3GvCTVk7r6NXssVcgXpkLPLzEuOpmk+6LubQd6FRQxd1xtKcZ8qO1bvjW02Z8zm7g33eoC+u/9396Zk91M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748510478; c=relaxed/simple;
	bh=W0yFPNzghD/m0qo6z45ZC+KVhcSO5Hmul2+Wqtljfgg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=PQQ+z/DaoaLarjwhPszb3nnTes1RSH3AYMOKY/UDyEH8zx0U0xGoKyvOYtnyVFEDK7nKXCbBxHP2uI/TxUc7sDZ76CFEjZ+1wdlOf/3fSCumocMVxcXpFA+Lui1lR42rrRjTEQaNq+gTD/b9r3Kb/7RaFjc8rXoEIc1gn136Jgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+N9N7HY; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2351227b098so1322835ad.2;
        Thu, 29 May 2025 02:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748510474; x=1749115274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Djk6LW+XO5QLh/AdYQk9jVpJ0pUwmyCcPNNU/gRWDR8=;
        b=g+N9N7HYdlqNQxQfFNUUiP6NZXG50gxucLXJqY63dINwSd6urXGFT5x8IMpzZnVfSD
         +ro5Ql8aST8nivN09slQqtksvQQHzwltSNYN4fiRtRyYbjcFGwDhKLN5exeB3hlEh6rE
         dfZVihsrr1y17i+lhAdSnCc/DyxUd1fFiWkmV55tpjIzLEOj8OiL9YYleoQrGiFXKQpe
         Y8ne9jMgE+ADjfzhvJkJj1dToQYOEG5LEARxsY1xzQotaoN094J3ado3PImH5wsTfOQy
         vEwQJJyxaJQMmV/jv+g/nI57Qncd6xkP0zolVq/COdv/TJvqKgswnEjFk99/EeD/e/dO
         j/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748510474; x=1749115274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Djk6LW+XO5QLh/AdYQk9jVpJ0pUwmyCcPNNU/gRWDR8=;
        b=bvGwjwGcwwmPoN9G0upnLnb+zxwi8O/+xEqIFUFbZjaA+SMvjGcJU6nzbJ526QedUw
         qwTblIrSdLXg7h3zTSFELzvWX+xeEAtwjYcqPhqi3ZQtykbdhhittFhR2WK6y8f7Yra2
         gxilCzWydPOqVf8hXl4x3C5Wk98SM0fC+/wlgD2DeJKZhaZt2VDJR7ZuTbNWnQ83lELv
         4kS2WEBQx2PPFrN3Td86ZeELn7H19ukY4gl3fhXqCnmp/+xe4U1est1Cl7k6Vm/F1qHM
         yJC7ZkUGoIK0AtRwZzi86PTuehkefeR3HRQQa7LnOu+SO7b4/LsUVLbQVggT0CdEFJFz
         oRyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXtX80vv9ptekH06Q2Tx8YwNEz7pW4KuYvForjBZVfAxJX3YMP+gIey5qe189RLznZN94sqZvrfjRm22U=@vger.kernel.org, AJvYcCWSdUFuZZqLvMJmzw7j09lY0+8E5R34aGLSNR/+/2POuGE8IthI3yLADtbtj56R3AtQYLCRHe85Nho5@vger.kernel.org, AJvYcCXvgnBcAqyqtyGorqgiIKKEFmiR1Nx3FN8XHyhvlPhYASdclf3hw6eAR2S9YjLrhpTYXVVS17bb@vger.kernel.org
X-Gm-Message-State: AOJu0YxT10ABwQV+pIzLhh4ke/5X5kUlQAoDS+lK3/ZicMcNu+SzyPYS
	A29hOwlkJ+Gx6os3zRLzO7sLLaQgIK1cmLU+YkWGMhe3oGY9SRt0MHIYEZlLg5HH
X-Gm-Gg: ASbGncte5IxImMVwfmDYzBVzCYTqTYR+ZsfUwll2r4iYzkdX+rDUHe0pHhBo0OHWkRh
	7Vo2ylJSde967DRE4aHUtO+CTbg5SfUuy7TV7jJl3btBREneMIAXr8taA2NHR7+frE+VCxKZLf2
	hPqWeYdSeue4chZs6dScFRXB/23VLPwqS3pYjFNxQGQmgr51DrVhLzlycyHzWsJCko02vL4i+IB
	uYNnek8YFw21hie833EgCD0UYKFPNcr6kSUIlmI6NwszGSHIElc9b9zScwIXwfyrbJHymkpPFAr
	DXxsUDoFKHvYmHN9In6iP3+qTXHDGdWtXTtecsxSoRwK
X-Google-Smtp-Source: AGHT+IEZAUO3tp5oDgeovkd9SC7gidqYnhtj88gpaWIQvUE4IfAzWCtycTZiA3Z/G1IQ/VEy1VCQUg==
X-Received: by 2002:a17:903:32cd:b0:235:779:edf0 with SMTP id d9443c01a7336-2350779f25amr22782445ad.50.1748510473960;
        Thu, 29 May 2025 02:21:13 -0700 (PDT)
Received: from gmail.com ([116.237.135.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d19bfesm8425835ad.253.2025.05.29.02.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 02:21:13 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ppp@vger.kernel.org
Subject: [PATCH net-next] ppp: convert to percpu netstats
Date: Thu, 29 May 2025 17:21:08 +0800
Message-ID: <20250529092109.2303441-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to percpu netstats avoid lock contention when reading netstats.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/ppp_generic.c | 52 +++++++++++++----------------------
 1 file changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index a27357bd674e..330c0cd89c15 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -107,18 +107,6 @@ struct ppp_file {
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
@@ -162,7 +150,6 @@ struct ppp {
 	struct bpf_prog *active_filter; /* filter for pkts to reset idle */
 #endif /* CONFIG_PPP_FILTER */
 	struct net	*ppp_net;	/* the net we belong to */
-	struct ppp_link_stats stats64;	/* 64 bit network stats */
 };
 
 /*
@@ -1539,23 +1526,12 @@ ppp_net_siocdevprivate(struct net_device *dev, struct ifreq *ifr,
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
@@ -1650,6 +1626,7 @@ static void ppp_setup(struct net_device *dev)
 	dev->type = ARPHRD_PPP;
 	dev->flags = IFF_POINTOPOINT | IFF_NOARP | IFF_MULTICAST;
 	dev->priv_destructor = ppp_dev_priv_destructor;
+	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
 	netif_keep_dst(dev);
 }
 
@@ -1796,8 +1773,7 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 #endif /* CONFIG_PPP_FILTER */
 	}
 
-	++ppp->stats64.tx_packets;
-	ppp->stats64.tx_bytes += skb->len - PPP_PROTO_LEN;
+	dev_sw_netstats_tx_add(ppp->dev, 1, skb->len - PPP_PROTO_LEN);
 
 	switch (proto) {
 	case PPP_IP:
@@ -2474,8 +2450,7 @@ ppp_receive_nonmp_frame(struct ppp *ppp, struct sk_buff *skb)
 		break;
 	}
 
-	++ppp->stats64.rx_packets;
-	ppp->stats64.rx_bytes += skb->len - 2;
+	dev_sw_netstats_rx_add(ppp->dev, skb->len - PPP_PROTO_LEN);
 
 	npi = proto_to_npindex(proto);
 	if (npi < 0) {
@@ -3303,14 +3278,25 @@ static void
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


