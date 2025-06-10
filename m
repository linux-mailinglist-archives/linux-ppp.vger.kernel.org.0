Return-Path: <linux-ppp+bounces-296-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F51AD306B
	for <lists+linux-ppp@lfdr.de>; Tue, 10 Jun 2025 10:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5F3B1883FE9
	for <lists+linux-ppp@lfdr.de>; Tue, 10 Jun 2025 08:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F255821CFEC;
	Tue, 10 Jun 2025 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/ybdNK1"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549AE1D555;
	Tue, 10 Jun 2025 08:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544338; cv=none; b=P+9icXUhlYMn9oW8zKcwV2gUjR9mQOOGX6qsnN38G9aaCiHfuiCHTBmwDGQ8QakgfzNW0ZK7FkZDvk8awz+qC945EQLgK8Rhv5q/DH3KwHIet5ayVPV5NHcTukpe+tWg4wY2jl8IwYq9CdTWvlQWpgiVBn8T3fw0C3x1kP+JcNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544338; c=relaxed/simple;
	bh=Yp+B483bGr5JsxmbsBMlSY4r4Owg2LtMYr+J3QjmBEE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Ta3BsKfpIDpmOJz4hAXnNT37Z0Fs7rupKtlKgpSSIoc18d3tPPrrY6jNOzHKPTJmyuAGvhzbHGRptowQ4GIvSAaK7kqal5GAJhxKwYABqGsKu1z+ZSzJgHns3PGmXQXjJ8Dy2si5rnSpZ3XdDRHUrPk5RuAt/gzNv/tuFTXpAAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/ybdNK1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234fcadde3eso61273345ad.0;
        Tue, 10 Jun 2025 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749544337; x=1750149137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Zsy+hT9I5m8iP9tXJhRUDsN9FbpKL0q9AU8+LK8cJo=;
        b=Y/ybdNK1LrzI4BmCu60KFi7vouJYTMB3tpXGrLRK2jP9wh6jSlTAuTv83Q5wh/3d6O
         h05JU0us2LaQnKilhVhst3Wu1jfFxIq/LkuydUapShZh3eu3iu9iz7Me4ZRWG7YtLP9h
         Br+ArZ0K6ro7yUUVqPHv6x0JRZbeUYgNu6lYvNTg2xXPpItHUKh/X8X3MNZA7P7lXbpq
         MKVGlLNN4fg8n9c/0vEUkpx66Mg/czeq4JfBU4l1GPPkWziOY0wc3Km+EuncfsFOTbzK
         4QCCDSXFY4lbLeYXdBbP3mrqHE3UFKTd9hGQpOwbMS7sWqnPuj6ck+HLqQCoj1dJ0ICX
         x/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544337; x=1750149137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Zsy+hT9I5m8iP9tXJhRUDsN9FbpKL0q9AU8+LK8cJo=;
        b=s52diwMs0Ar2dCIOtOSDBr7AcG/IU4X0ZlVXe4kmEyh7yCujcUPLJuFru0dnR4OQzj
         Y/X+bS6siz2432P4ToI5N5fqCPFvIeVh08b0zg7FTOEkhPMNsakqwwYifDEF4mFT3puQ
         jXnZsUGxL91DQYpe35Gmn7gwKk5dKru/nMENZ/N6bAQyAMedIngQ1RzhFReYxqOqN8+d
         rcTM/QveKr+CRtJZKsZZ+F9nnSrvPrQHT5SPqvlGl5fSFK7INH2jOet7gPkULzMw01mT
         KnM5HIduTqX5SJtsE3vF3QFdJlbUyL8X8ms4iXEmd+7yi8i8ZJ9MuaDehqXv1ulpfiXo
         1S0g==
X-Forwarded-Encrypted: i=1; AJvYcCUz+T4hLmsvQAAbtOqn7hrxn7FJFZ5v6MUVgSHelgKbkCsiPoLEjev/6KWMn5OyyUVamWA2SMY5hK0g@vger.kernel.org, AJvYcCW37eXkPuyl3zb0RlGlBsIzl/AfvqqwY1z78BrSj7oEsW7MeCpKenCrlxNuGeGlWV4+I1K5RmO53jw6kxg=@vger.kernel.org, AJvYcCWCMoz437Ukg73ezSgnoMxkOoyqe5QXBQkXNaKHXCfr4Al7/96DKewXq+nAsBlQTY3N3bgG6E1s@vger.kernel.org
X-Gm-Message-State: AOJu0YyrzOF0b4SDsigZ25l3T1Z5c7eZZd3oQEPCyQYk0rsgcxPa6WM8
	SbmdDQFjP6Y0gAa6yhzQrxzNlcGaL8wOOLp1SzQM+zPDcqYNwppgGpSrD7PNu6FfaBDv6Q==
X-Gm-Gg: ASbGncuRNmhm09AApJtuVXpUhV/+QS0RBVyHy+IaCb0xDVcdB4ZRZArXcsFcAh72W0V
	pgQMuu+xHMO08CgwKd/z2ai26Hnmtbyh8kfdgt9VeLOdw3/TP/CqNUO3WXNYnPYeJHcHogtgJs3
	Oj8G0Wd6WiC5ZrDlRejJdPd0mvn11yqKujvYXPyl4Yt+TDY/5Hh/z+3pP+VoKvXtorwQzJRHa9r
	6HWEh6cupy34WZAPpmy549VblLIWz/JSTbw49GaQBb0uGScZ8ooWsChXIdAOWeoRtuCttRPvb/U
	OGa6FtfZ1DwKh7rEa9oLUlxkznbYMxZ4Z3e6hvuaeJS6rBH479ZMWsSZ
X-Google-Smtp-Source: AGHT+IHToBkeQKLwjseAoh6XUM8IfJ5n0alUhBlbLyVmgOB/3nbfZQ9g0uCbffWaw8f6KQ5i7OiNdA==
X-Received: by 2002:a17:902:dace:b0:234:8ec1:4aea with SMTP id d9443c01a7336-23601deb4bemr230726405ad.52.1749544336540;
        Tue, 10 Jun 2025 01:32:16 -0700 (PDT)
Received: from gmail.com ([116.237.168.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fc9ebsm66175635ad.106.2025.06.10.01.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:32:16 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ppp@vger.kernel.org
Subject: [PATCH RESEND net-next] ppp: convert to percpu netstats
Date: Tue, 10 Jun 2025 16:32:10 +0800
Message-ID: <20250610083211.909015-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to percpu netstats to avoid lock contention when reading them.

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


