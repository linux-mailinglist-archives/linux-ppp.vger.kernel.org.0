Return-Path: <linux-ppp+bounces-632-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HKvVD4QAVmr4xgAAu9opvQ
	(envelope-from <linux-ppp+bounces-632-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 14 Jul 2026 11:25:24 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F0E752D20
	for <lists+linux-ppp@lfdr.de>; Tue, 14 Jul 2026 11:25:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PsGKVE7t;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-632-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-ppp+bounces-632-lists+linux-ppp=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18EC53118378
	for <lists+linux-ppp@lfdr.de>; Tue, 14 Jul 2026 09:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C861043B494;
	Tue, 14 Jul 2026 09:20:28 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712D33F9F5E
	for <linux-ppp@vger.kernel.org>; Tue, 14 Jul 2026 09:20:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784020828; cv=none; b=kLE2caR1M6lkMP1qOE3x+38Yxnf8PtZgywmtsmhPoEXAO7bH8ko9MK8vb1JyPkJozCgxNXX2ii2jO8tH2yXkIeQDtlcfVk5WrTO1tS3q7GNTcsxJhBsCfbxfDemg0yPeuBOUc7RrsyMxZIKNmqhZIKudhs988R0LuVbtbscNIVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784020828; c=relaxed/simple;
	bh=OCV1B9VbTSNjGsQNpthWNwwEWnGtFvT3CLnsOet80zc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b6AU5dqeVV6c4jPsydMr3IXlttJjawC9QVijmn5TP55hJ4CnitmIsVV/c7x26sVvqIJKsu4DxA1DnP8qaISx/1lZNWkjGrcPOaSf8yLth8omSSIEwUf6Z1sw4sJ2L4eKTKh5VMrsVcPgCVRdd4gluKjMJmU1vU73UYA/h054e4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsGKVE7t; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ce98cb8165so7482155ad.1
        for <linux-ppp@vger.kernel.org>; Tue, 14 Jul 2026 02:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784020827; x=1784625627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hlifX6J54QjjC62YkcEDfxBxc7vnj6pmy8TqFHFnjI=;
        b=PsGKVE7tufKw3YAZumWCasbTsMfYxHqbzFKVvESJmhns6Vxv1QBkhP8u/mCFyGvDK1
         OaRbf2ONGLXi7JYtICXuTnIyp4TJe6n+zQ1OM3nnx2c28mXebBBNpMz6ryPhimY2PvSo
         BHn37J4wdcNNX3gQ0ruRswgYHW6MmSmtUarlJ2JB1WeANc7KDlurounxIvVn+BYD1YF/
         l+U3uOQ7+mQ9OSDdPheGSg6/FfIFKQqFeZIjtpeSIdaFCb3x7TUbstBki6A9v8NPxTg7
         7Y13iSS81ldTd3LZOnJ57osXcZi1k908jsaCd7ZAECGzn2Cnhv08D8kTCZKInAkbhhnd
         oAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784020827; x=1784625627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hlifX6J54QjjC62YkcEDfxBxc7vnj6pmy8TqFHFnjI=;
        b=dUlDXsKRwh/x+epx3Al9y9If10vD8cKFmEhG7zFFMQsvMrAMd+aDCH1SuJwGNMk2Bf
         C8V3ncM0aJXCkgKNppZKwX5WW+tqxEsKK3F9vRyDfCfuz9lrvhh55Hg36gYpfq1DR/cl
         sYqeGs4nPYQsuy/4fn6avNDcYFbEfSjDUMP6TEFWRm3vLURVHr9jPeaBRC9FBo0be7s/
         PSidTxCf2VTQqHuux2Gz0GWYdzrT2xlCRm2JrR9ynVLGgixV3oQfDHgF1ExfvcIWHTVP
         3hGhfOuPynORiYZLikCrZbIm0iQfqFQBbHKDseR293UWEF8TY6mns3Jh0evyIeJgOroQ
         OriQ==
X-Forwarded-Encrypted: i=1; AHgh+Ron6Z6fFhV/LIZBtKG7iTX4cdPoGl3EPXgLw3r93YAVwt6oYduNB5PUITrqI/HQraq09M6+yZnekas=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIY6tiJzhKRXTVPjY2src5U515CT5kj7Y2YoTAzU93Tt6i2Axy
	soZrMdG+QtdCvJhNKiC/QlE/1TAZCmvfwManGJI4JLchWdoN2vU66ZPz
X-Gm-Gg: AfdE7ckq19K3a8f3L/k+8cjb+qHhhQtZ1xPp7f++mLelUUmte6d1iSw+sYUEZJX1clL
	ay7amODRB5tlva6sm03wVEUJ9aG2AeLQnK7p8/jMYSplTm2wjpBH5cUpeCvSjLfbQOiyvUCH0yS
	fuSmBLQgcLNa21daZbfvKYTyaBPn8WG7v3CzaBGPtTpdWsA9iyNowccMJH3ZZohk+Ocpr4x7EE0
	U7j2ckYfq4fJ66GUuhHwk+24LOczU4vaM8WqQRPW+rNHN69uOB2A+/3JFibdGd3M2wLvn7v/Oqa
	gSn+nyRrAbwM4Z1KPaC/RbwukOrJ6Q/xhSv6Z4MD+FRKbj94iYRvkmStRKwu6o10RpgM10N+Q3e
	gToRElpIL1BmuiUnTPE30Wmig9QG6+Yl0od9QNQu+2t8dq/nG8lEiMMneaNGyI5BzQm09B0042w
	JLDp1mL7KDDxNizqJt8yxM
X-Received: by 2002:a17:903:1b6b:b0:2ca:5023:f983 with SMTP id d9443c01a7336-2ce8298a455mr168113075ad.29.1784020826551;
        Tue, 14 Jul 2026 02:20:26 -0700 (PDT)
Received: from c79ofce.localdomain ([204.3.140.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e5d0sm114940275ad.42.2026.07.14.02.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 02:20:25 -0700 (PDT)
From: Zhixing Chen <running910@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Qingfang Deng <qingfang.deng@linux.dev>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	Zhixing Chen <running910@gmail.com>
Subject: [PATCH net-next] ppp: reuse ppp_get_stats64() for ioctl stats
Date: Tue, 14 Jul 2026 17:19:41 +0800
Message-Id: <20260714091941.33783-1-running910@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-632-lists,linux-ppp=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:qingfang.deng@linux.dev,m:linux-ppp@vger.kernel.org,m:netdev@vger.kernel.org,m:running910@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[running910@gmail.com,linux-ppp@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[running910@gmail.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6F0E752D20

ppp_get_stats() open-codes the per-cpu tstats aggregation even though
ppp_get_stats64() already collects the packet, byte and error counters
needed by the legacy SIOCGPPPSTATS ioctl path.

Reuse ppp_get_stats64() when filling struct ppp_stats. This keeps the
ioctl stats path consistent with the netdev stats64 path and removes the
open-coded per-cpu stats aggregation from the ioctl path.

Signed-off-by: Zhixing Chen <running910@gmail.com>
---

This is meant as a small cleanup. The ioctl path and the netdev stats64
path already use the same underlying counters, so this just makes the
ioctl path reuse ppp_get_stats64() instead of open-coding the per-cpu
aggregation locally.

---
 drivers/net/ppp/ppp_generic.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 57c68efa5ff8..53e6d40193fd 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -3303,26 +3303,17 @@ find_compressor(int type)
 static void
 ppp_get_stats(struct ppp *ppp, struct ppp_stats *st)
 {
+	struct rtnl_link_stats64 stats64 = {};
 	struct slcompress *vj = ppp->vj;
-	int cpu;
 
 	memset(st, 0, sizeof(*st));
-	for_each_possible_cpu(cpu) {
-		struct pcpu_sw_netstats *p = per_cpu_ptr(ppp->dev->tstats, cpu);
-		u64 rx_packets, rx_bytes, tx_packets, tx_bytes;
-
-		rx_packets = u64_stats_read(&p->rx_packets);
-		rx_bytes = u64_stats_read(&p->rx_bytes);
-		tx_packets = u64_stats_read(&p->tx_packets);
-		tx_bytes = u64_stats_read(&p->tx_bytes);
-
-		st->p.ppp_ipackets += rx_packets;
-		st->p.ppp_ibytes += rx_bytes;
-		st->p.ppp_opackets += tx_packets;
-		st->p.ppp_obytes += tx_bytes;
-	}
-	st->p.ppp_ierrors = ppp->dev->stats.rx_errors;
-	st->p.ppp_oerrors = ppp->dev->stats.tx_errors;
+	ppp_get_stats64(ppp->dev, &stats64);
+	st->p.ppp_ipackets = stats64.rx_packets;
+	st->p.ppp_ibytes = stats64.rx_bytes;
+	st->p.ppp_opackets = stats64.tx_packets;
+	st->p.ppp_obytes = stats64.tx_bytes;
+	st->p.ppp_ierrors = stats64.rx_errors;
+	st->p.ppp_oerrors = stats64.tx_errors;
 	if (!vj)
 		return;
 	st->vj.vjs_packets = vj->sls_o_compressed + vj->sls_o_uncompressed;
-- 
2.34.1


