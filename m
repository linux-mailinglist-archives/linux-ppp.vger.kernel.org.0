Return-Path: <linux-ppp+bounces-270-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4928DA49BAF
	for <lists+linux-ppp@lfdr.de>; Fri, 28 Feb 2025 15:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09F9D3BDB14
	for <lists+linux-ppp@lfdr.de>; Fri, 28 Feb 2025 14:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5993826E62D;
	Fri, 28 Feb 2025 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Lp3Khf6/"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B47026E17C
	for <linux-ppp@vger.kernel.org>; Fri, 28 Feb 2025 14:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740752093; cv=none; b=StvPsNQymrtSuXQ4QVVV7bQhiUtZsuRAWGJBQ1Bh0/Tnvj3NhC77KkpS5a1NdJAXyGPcFdOvinOAayx5ZVSvqF1yq4ls/Sv7d+WGD1mxFZbIB0imMEvqGuHhHbzgY/5HwNn6M7Rlb2QdhurMrO4lIpsgUAaiceF3Vqv3L2yft1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740752093; c=relaxed/simple;
	bh=quiR16689GxKD0zMbG7akYA4bL0qENBpHq/iOV0l6G4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dnnb1rVctmtcuJKENTifIx2QUPKfx1ov6ZbUIEHYs93lfJGggTDfN2MZ/ckRwsOZHZiqTZWwVx1bQgFQnbuQkE1MUs6Q73NTAR8jCboNgQqwAzIfq1LDeZxLI/P4N2YyXvfrEaKLrhqCh56Aqe3g6opnQXL8UpceoKsNYeB2pBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Lp3Khf6/; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740752088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wRV6mcPluzpyEsyiWY9Lu/xX/hlkANEaDVySV+3Bifk=;
	b=Lp3Khf6/5IRYZ1u1KG+iVCEuwSEmIiuPmFyHMKNUZCZg9a35PlRiIR4Jl1YQx5sScto8kY
	xfOUBuSfBSz51sSzZ2fDfZpLHbabzEun/joZvOGwKcyvPDWsdtEo8QNu7Jfbop1EQ8YPcv
	rrpE4q3OEPmmnp4cAmRhgLZm+0KH/Cc=
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
	Paul Mackerras <paulus@samba.org>,
	syzbot+853242d9c9917165d791@syzkaller.appspotmail.com
Subject: [PATCH net-next v5] ppp: Fix KMSAN uninit-value warning with bpf
Date: Fri, 28 Feb 2025 22:14:08 +0800
Message-ID: <20250228141408.393864-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Syzbot caught an "KMSAN: uninit-value" warning [1], which is caused by the
ppp driver not initializing a 2-byte header when using socket filter.

The following code can generate a PPP filter BPF program:
'''
struct bpf_program fp;
pcap_t *handle;
handle = pcap_open_dead(DLT_PPP_PPPD, 65535);
pcap_compile(handle, &fp, "ip and outbound", 0, 0);
bpf_dump(&fp, 1);
'''
Its output is:
'''
(000) ldh [2]
(001) jeq #0x21 jt 2 jf 5
(002) ldb [0]
(003) jeq #0x1 jt 4 jf 5
(004) ret #65535
(005) ret #0
'''
Wen can find similar code at the following link:
https://github.com/ppp-project/ppp/blob/master/pppd/options.c#L1680
The maintainer of this code repository is also the original maintainer
of the ppp driver.

As you can see the BPF program skips 2 bytes of data and then reads the
'Protocol' field to determine if it's an IP packet. Then it read the first
byte of the first 2 bytes to determine the direction.

The issue is that only the first byte indicating direction is initialized
in current ppp driver code while the second byte is not initialized.

For normal BPF programs generated by libpcap, uninitialized data won't be
used, so it's not a problem. However, for carefully crafted BPF programs,
such as those generated by syzkaller [2], which start reading from offset
0, the uninitialized data will be used and caught by KMSAN.

[1] https://syzkaller.appspot.com/bug?extid=853242d9c9917165d791
[2] https://syzkaller.appspot.com/text?tag=ReproC&x=11994913980000

Cc: Paul Mackerras <paulus@samba.org>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+853242d9c9917165d791@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/bpf/000000000000dea025060d6bc3bc@google.com/
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 drivers/net/ppp/ppp_generic.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 4583e15ad03a..1420c4efa48e 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -72,6 +72,17 @@
 #define PPP_PROTO_LEN	2
 #define PPP_LCP_HDRLEN	4
 
+/* The filter instructions generated by libpcap are constructed
+ * assuming a four-byte PPP header on each packet, where the last
+ * 2 bytes are the protocol field defined in the RFC and the first
+ * byte of the first 2 bytes indicates the direction.
+ * The second byte is currently unused, but we still need to initialize
+ * it to prevent crafted BPF programs from reading them which would
+ * cause reading of uninitialized data.
+ */
+#define PPP_FILTER_OUTBOUND_TAG 0x0100
+#define PPP_FILTER_INBOUND_TAG  0x0000
+
 /*
  * An instance of /dev/ppp can be associated with either a ppp
  * interface unit or a ppp channel.  In both cases, file->private_data
@@ -1762,10 +1773,10 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 
 	if (proto < 0x8000) {
 #ifdef CONFIG_PPP_FILTER
-		/* check if we should pass this packet */
-		/* the filter instructions are constructed assuming
-		   a four-byte PPP header on each packet */
-		*(u8 *)skb_push(skb, 2) = 1;
+		/* check if the packet passes the pass and active filters.
+		 * See comment for PPP_FILTER_OUTBOUND_TAG above.
+		 */
+		*(__be16 *)skb_push(skb, 2) = htons(PPP_FILTER_OUTBOUND_TAG);
 		if (ppp->pass_filter &&
 		    bpf_prog_run(ppp->pass_filter, skb) == 0) {
 			if (ppp->debug & 1)
@@ -2482,14 +2493,13 @@ ppp_receive_nonmp_frame(struct ppp *ppp, struct sk_buff *skb)
 		/* network protocol frame - give it to the kernel */
 
 #ifdef CONFIG_PPP_FILTER
-		/* check if the packet passes the pass and active filters */
-		/* the filter instructions are constructed assuming
-		   a four-byte PPP header on each packet */
 		if (ppp->pass_filter || ppp->active_filter) {
 			if (skb_unclone(skb, GFP_ATOMIC))
 				goto err;
-
-			*(u8 *)skb_push(skb, 2) = 0;
+			/* Check if the packet passes the pass and active filters.
+			 * See comment for PPP_FILTER_INBOUND_TAG above.
+			 */
+			*(__be16 *)skb_push(skb, 2) = htons(PPP_FILTER_INBOUND_TAG);
 			if (ppp->pass_filter &&
 			    bpf_prog_run(ppp->pass_filter, skb) == 0) {
 				if (ppp->debug & 1)
-- 
2.47.1


