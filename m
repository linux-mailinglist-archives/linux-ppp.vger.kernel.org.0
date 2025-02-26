Return-Path: <linux-ppp+bounces-263-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDB6A4523E
	for <lists+linux-ppp@lfdr.de>; Wed, 26 Feb 2025 02:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD743AAC61
	for <lists+linux-ppp@lfdr.de>; Wed, 26 Feb 2025 01:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4951D1990C1;
	Wed, 26 Feb 2025 01:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kp7NLbUb"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE5B197A8F
	for <linux-ppp@vger.kernel.org>; Wed, 26 Feb 2025 01:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533844; cv=none; b=BDB4x8AVSFQg6Q0ZcpfLu706qN55BiQGGvQtALnph7wBs5Cm3JLIepcJ8b18we0bNfxxswWe/9RtFCsCTzocOGBT1orSqki9G6nZtxsO1ZrR6Zn5VqCL/O7Fpx8wzKsAdnKDjVNO8EAtLj4VrHQzKS9RLZ9U4rndbTj7ojBEEUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533844; c=relaxed/simple;
	bh=6jMqSHCB1b/d3tIPznfvnPv5y2TPzXfyEbziUHnLOwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZsfHP7IqCck+pFMu+aclPoJTBzEgDQS01nfKZ8JLspCq7WurTQK2kcRDk5GV4YRSeEZ+NYyI8ouwaM0nTwdp4BJdLlK9citauIlDRMrxaa/9BFdF9TrKikZAxkr4TFKALcayapOqjDjcFsAEJh8Wh4vSH1mrvPZL+ScctM/CXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kp7NLbUb; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740533840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c6lV2O/MV07x2xCD5gRyXKU/naKq49lc8wVecRpyzJY=;
	b=kp7NLbUbFkijnU8Nd3tRXnRzRt88xeE3r6qyYDNVsdcLu//PHlllllF9cw62u2LxU+5zBp
	ECjKglKSRLHKZdKCdpmRA7RKSee9ZF81DFTevlbWlk7M0DsneewFBlbRtrXhJhTBYJ1e9j
	Gyr3tKio/MAG0NQGh5i0tQCoI+cqNus=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: horms@kernel.org,
	kuba@kernel.org
Cc: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	ricardo@marliere.net,
	viro@zeniv.linux.org.uk,
	dmantipov@yandex.ru,
	aleksander.lobakin@intel.com,
	linux-ppp@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mrpre@163.com,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	syzbot+853242d9c9917165d791@syzkaller.appspotmail.com
Subject: [PATCH net-next v4 1/1] ppp: Fix KMSAN warning by initializing 2-byte header
Date: Wed, 26 Feb 2025 09:36:58 +0800
Message-ID: <20250226013658.891214-2-jiayuan.chen@linux.dev>
In-Reply-To: <20250226013658.891214-1-jiayuan.chen@linux.dev>
References: <20250226013658.891214-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The PPP driver adds an extra 2-byte header to enable socket filters to run
correctly. However, the driver only initializes the first byte, which
indicates the direction. For normal BPF programs, this is not a problem
since they only read the first byte.

Nevertheless, for carefully crafted BPF programs, if they read the second
byte, this will trigger a KMSAN warning for reading uninitialized data.

Reported-by: syzbot+853242d9c9917165d791@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/bpf/000000000000dea025060d6bc3bc@google.com/
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 drivers/net/ppp/ppp_generic.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 4583e15ad03a..b4433badf03c 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -72,6 +72,10 @@
 #define PPP_PROTO_LEN	2
 #define PPP_LCP_HDRLEN	4
 
+/* These are fields recognized by libpcap */
+#define PPP_FILTER_OUTBOUND_TAG 0x0100
+#define PPP_FILTER_INBOUND_TAG  0x0000
+
 /*
  * An instance of /dev/ppp can be associated with either a ppp
  * interface unit or a ppp channel.  In both cases, file->private_data
@@ -1762,10 +1766,15 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 
 	if (proto < 0x8000) {
 #ifdef CONFIG_PPP_FILTER
-		/* check if we should pass this packet */
-		/* the filter instructions are constructed assuming
-		   a four-byte PPP header on each packet */
-		*(u8 *)skb_push(skb, 2) = 1;
+		/* Check if we should pass this packet.
+		 * The filter instructions are constructed assuming
+		 * a four-byte PPP header on each packet. The first byte
+		 * indicates the direction, and the second byte is meaningless,
+		 * but we still need to initialize it to prevent crafted BPF
+		 * programs from reading them which would cause reading of
+		 * uninitialized data.
+		 */
+		*(__be16 *)skb_push(skb, 2) = htons(PPP_FILTER_OUTBOUND_TAG);
 		if (ppp->pass_filter &&
 		    bpf_prog_run(ppp->pass_filter, skb) == 0) {
 			if (ppp->debug & 1)
-- 
2.47.1


