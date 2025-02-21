Return-Path: <linux-ppp+bounces-247-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EF5A3ECB2
	for <lists+linux-ppp@lfdr.de>; Fri, 21 Feb 2025 07:12:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7E45175D79
	for <lists+linux-ppp@lfdr.de>; Fri, 21 Feb 2025 06:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF1D1FC7E6;
	Fri, 21 Feb 2025 06:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IvHr7DYp"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0287033EA;
	Fri, 21 Feb 2025 06:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740118368; cv=none; b=lpiqJ+OGuw3glUN/wA5qTZzOaAWqdnTLzaHOwF7suqIAM8xQaimdvMOUifJ/CYmQWTfx9MRc8/KfFE2ZjAP90LtEENvXkvopai/0x7k4WrHizU4WyjUNdSGTGriQ5ZhvbsQSYGXZDskF0DGy4WVpJZqNDbY9j8AB0FWmj0qjDew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740118368; c=relaxed/simple;
	bh=BUrcvTp+Y3/YvlrmZlKJhjdFs5pFY7u9HZJVscHLqY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWOe8TwH1PuaUzCoBBeF0ftFnY/krTxRChOrkYgL+plg2bOUPNVFoc05qFaaFZlijf3144hGxBcdUyzVY7cb0J1R2JBoQSQnIizEKcMgyEcGLxp1/NJ8A7GfXutCEjBkJNRHVJuAmhCNaANX4O809ZYU6JCNpzAZaR8kj3wswts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IvHr7DYp; arc=none smtp.client-ip=95.215.58.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740118364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTyRHMFg3xvOC3n3ff331CFtxOFXphnga1of86At6ZY=;
	b=IvHr7DYpZ1DpXah52GHF4TTh0dcXaByCPuACFWvTyC0RAVUtbfGAYysetEtYt2rl4ulrmO
	AVavo6qZO1OfGXNKt4P6rUO14za2+e6gvEbVe3Tf2YC4PUtpXNydbk+e+QGwzSCNfoHZ7X
	wgyXr5bo0ZPw2hRJbViS5qa38yqNOfE=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org,
	netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ricardo@marliere.net,
	jiayuan.chen@linux.dev,
	viro@zeniv.linux.org.uk,
	dmantipov@yandex.ru,
	aleksander.lobakin@intel.com,
	linux-ppp@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mrpre@163.com,
	syzbot+853242d9c9917165d791@syzkaller.appspotmail.com
Subject: [PATCH net-next v2 1/1] ppp: Fix KMSAN warning by initializing 2-byte header
Date: Fri, 21 Feb 2025 14:12:19 +0800
Message-ID: <20250221061219.295590-2-jiayuan.chen@linux.dev>
In-Reply-To: <20250221061219.295590-1-jiayuan.chen@linux.dev>
References: <20250221061219.295590-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The ppp program adds a 2-byte pseudo-header for socket filters, which is
normally skipped by regular BPF programs generated by libpcap, causing no
issues.

However, for abnormal BPF programs that use these uninitialized 2 bytes,
a KMSAN warning is triggered.

Reported-by: syzbot+853242d9c9917165d791@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/bpf/000000000000dea025060d6bc3bc@google.com/
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 drivers/net/ppp/ppp_generic.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 4583e15ad03a..ac95196c85df 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1762,10 +1762,16 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 
 	if (proto < 0x8000) {
 #ifdef CONFIG_PPP_FILTER
-		/* check if we should pass this packet */
-		/* the filter instructions are constructed assuming
-		   a four-byte PPP header on each packet */
-		*(u8 *)skb_push(skb, 2) = 1;
+		/* Check if we should pass this packet.
+		 * BPF filter instructions assume each PPP packet has a 4-byte
+		 * header (e.g., those generated by libpcap), and then default
+		 * to skipping the first 2 bytes at the beginning of the
+		 * instruction. However, we still need to initialize these
+		 * 2-byte new headers to prevent crafted BPF programs from
+		 * reading them which would cause reading of uninitialized
+		 * data. Here, we set the headers according to the RFC 1662.
+		 */
+		*(u16 *)skb_push(skb, 2) = htons(0xff03);
 		if (ppp->pass_filter &&
 		    bpf_prog_run(ppp->pass_filter, skb) == 0) {
 			if (ppp->debug & 1)
-- 
2.47.1


