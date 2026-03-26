Return-Path: <linux-ppp+bounces-444-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFdZG93rxGmj5AQAu9opvQ
	(envelope-from <linux-ppp+bounces-444-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 09:18:37 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3A733124E
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 09:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B80E331598EB
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 08:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14793A3825;
	Thu, 26 Mar 2026 08:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqMBHLlp"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4CC38E130
	for <linux-ppp@vger.kernel.org>; Thu, 26 Mar 2026 08:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774512696; cv=none; b=gka7CWkDBR3r0oHz8hrUpB04EwLVVm4xQPSsj5I98VPHH62yyvl70CDa+Lma1qFWUZjEckHvcmt7tGW8XGcnDfKs/lci9Rov8ZIdyLdHxjOS2guK6vRxP047AONx44bGovRGKUA1kxVVcxQh4rGaixKdVuXkEWGKed3zvKkFluw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774512696; c=relaxed/simple;
	bh=EvxXQimjXAOMmSFs+4UnS8/nBTY3STdp53eYLynS4AA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UdbpTsRPbnz6SUEbjqT4HTRFyc4Fu6I9soLWq+glD9DjoxoehD0tiADBv2OiSRxsSEKhG1d0RQ4e7DzURCe/VuZCso3ih1I2QQhOaibDb0prbiF6SEpBk40swb1tyAGsYeQ02h8uqgMnE2KGbHdHWf3A2KbUEl+1v49RNgAx8YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqMBHLlp; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66a5d76d9e2so1031497a12.1
        for <linux-ppp@vger.kernel.org>; Thu, 26 Mar 2026 01:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774512693; x=1775117493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ob2iVz8uVGsDEvY9PNtextI3OvEOyQwfspIkDeq9Ucg=;
        b=OqMBHLlpCXCQr7Xf3juhkkSvjZSdS/5Qc244A8HzCCJ6XPpwry1jl51r3/VG/OpTwo
         xZFquvznsdNS2WHytv5rbtNHTfqDw/uMEXM4mOYAu2adIZ5BAMI5n+rPQtMB0sq9j/Af
         MeWX4b7CVasZ0O0i+ZdjhGrjGv6xHU3jOO7BD2Yu7+TYkIEymxie+aI0KciTO43ZRtVF
         jotsdoPpy1TBO4eMjifRPi31KRkR8gCc+HiELuPViWdLpnacxmqngSOzCUZ8xksKa/cy
         Gkqzf/GGCN4pXjxWU3DKGnS2RCpm2TOh4W3w20TH5UJzqPsh9u15YXNZOafVtRUsUNBI
         +VEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774512693; x=1775117493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ob2iVz8uVGsDEvY9PNtextI3OvEOyQwfspIkDeq9Ucg=;
        b=L4GhifBVk1Basy2fH0qOP0IYOJA8P5jNTB3V5wjc79hBOv4E08DHKC4lrMieJYu8iH
         9tGqZOAjcgTlXrvEBSUrfftNo5OLM91dNvgZZwi0Qng/a406/4FtmAACpO4N+a3Hs3Vv
         shol2KOlxtRJGqrKfFoC/y9c2Jmrb1iwgpJFjRHtXx5BPcAWAi5E+mvcg+vxc+KpfMnU
         pkJVKWUWUn7ulU2NTaGLhs9VHD2DraVQ/3Bl17AbeJLiArFkT8oaTJKKvoWSevErTgui
         n512y0TpuHFmijPWUihoJu5RkDv5HcQRc+JbXhiEsKjvQtfUcq1uMkKA5OI4iUvvfCqx
         ssEA==
X-Gm-Message-State: AOJu0YyhYacroIx2g7DansJj/cRBiI2JNlWJa+Kknw2rJpL4ahwFQV4q
	SoHCM4K52YBGEnPiF/z3ki1ekhkaqvxSG2iPafps4P55wHBtxfmmn982
X-Gm-Gg: ATEYQzzkBPZAuMoAWS/bsfXdhyQMkmc/g2sExpVuL0Pt3pabzh/gSVwZJj2kzOc2j4a
	8RbAu1KOijhbKJOmHTKcnOq+Nnth8mOKfte7/14KtAP2PfEDW6w8AlyM8r6kf6rgGn0SF1NU5Kx
	AkHaRGX9SiopS2t6GEfmE2/Zu77gZcSHvJQ2s9O//95izYURB0w8a7cV4WAU3tjGsK2RGb0iYJF
	Z6TpwjiX6DzwTTkE9l87Ke30+eIS0wSiuN76UJAcn7wVl28Hg5k7Xt0pQR4FGNB4pzBts+nItrU
	gDBKuNk45CX70Kn6dF0JRYsmLxiWwtN3ZlO/aEt6LACQEy04TIjxQeA0eoKGOcezMlBileJ6cnl
	2H3CEh9f7RK9xCecZj0nCKHp4tgqBDlSjxguElJhk3/l6atusnuRfsdxZVoDcJYiP1Ua8uQ0oPN
	Fgrg==
X-Received: by 2002:a17:907:1b1a:b0:b98:5547:3dda with SMTP id a640c23a62f3a-b9a54271af1mr405508666b.44.1774512692968;
        Thu, 26 Mar 2026 01:11:32 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:4e23:270f::3e4:5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20267436sm82174666b.26.2026.03.26.01.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:11:32 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Michal Ostrowski <mostrows@earthlink.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-ppp@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>
Subject: [RFC PATCH net-next v6 1/2] net: pppoe: implement GRO/GSO support
Date: Thu, 26 Mar 2026 16:11:17 +0800
Message-ID: <20260326081127.61229-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-444-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[earthlink.net,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DC3A733124E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Felix Fietkau <nbd@nbd.name>

Only handles packets where the pppoe header length field matches the exact
packet length. Significantly improves rx throughput.

When running NAT traffic through a MediaTek MT7621 devices from a host
behind PPPoE to a host directly connected via ethernet, the TCP throughput
that the device is able to handle improves from ~130 Mbit/s to ~630 Mbit/s,
using fraglist GRO.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
v6:
 - avoid phdr->length field overflow 
 - restore skb_is_gso() check
 - do not register GRO if INET=n
 - do not check for PPP_IPV6 if IPV6=n
 - tail call gro_complete
 https://lore.kernel.org/netdev/20260305013852.3769-1-dqfext@gmail.com/

---
 drivers/net/ppp/pppoe.c | 166 +++++++++++++++++++++++++++++++++++++++-
 net/ipv4/af_inet.c      |   2 +
 net/ipv6/ip6_offload.c  |   2 +
 3 files changed, 169 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index 1ac61c273b28..7522a8ce52fc 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -77,6 +77,7 @@
 #include <net/net_namespace.h>
 #include <net/netns/generic.h>
 #include <net/sock.h>
+#include <net/gro.h>
 
 #include <linux/uaccess.h>
 
@@ -403,7 +404,7 @@ static int pppoe_rcv(struct sk_buff *skb, struct net_device *dev,
 	if (skb->len < len)
 		goto drop;
 
-	if (pskb_trim_rcsum(skb, len))
+	if (!skb_is_gso(skb) && pskb_trim_rcsum(skb, len))
 		goto drop;
 
 	ph = pppoe_hdr(skb);
@@ -1097,6 +1098,165 @@ static struct pernet_operations pppoe_net_ops = {
 	.size = sizeof(struct pppoe_net),
 };
 
+static u16
+compare_pppoe_header(const struct pppoe_hdr *phdr,
+		     const struct pppoe_hdr *phdr2)
+{
+	__be16 proto = *(const __be16 *)(phdr + 1);
+	__be16 proto2 = *(const __be16 *)(phdr2 + 1);
+
+	return (__force u16)((phdr->sid ^ phdr2->sid) | (proto ^ proto2));
+}
+
+static __be16 pppoe_hdr_proto(const struct pppoe_hdr *phdr)
+{
+	__be16 proto = *(const __be16 *)(phdr + 1);
+
+	switch (proto) {
+	case cpu_to_be16(PPP_IP):
+		return cpu_to_be16(ETH_P_IP);
+#if IS_ENABLED(CONFIG_IPV6)
+	case cpu_to_be16(PPP_IPV6):
+		return cpu_to_be16(ETH_P_IPV6);
+#endif
+	default:
+		return 0;
+	}
+}
+
+static struct sk_buff *pppoe_gro_receive(struct list_head *head,
+					 struct sk_buff *skb)
+{
+	const struct packet_offload *ptype;
+	unsigned int hlen, off_pppoe;
+	const struct pppoe_hdr *phdr;
+	struct sk_buff *pp = NULL;
+	struct sk_buff *p;
+	int flush = 1;
+	__be16 type;
+
+	off_pppoe = skb_gro_offset(skb);
+	hlen = off_pppoe + PPPOE_SES_HLEN;
+	phdr = skb_gro_header(skb, hlen, off_pppoe);
+	if (unlikely(!phdr))
+		goto out;
+
+	/* filter for session packets (type:1, ver:1, code:0) */
+	if (*(const __be16 *)phdr != cpu_to_be16(0x1100))
+		goto out;
+
+	/* ignore packets with padding or invalid length */
+	if (skb_gro_len(skb) != be16_to_cpu(phdr->length) + sizeof(*phdr))
+		goto out;
+
+	type = pppoe_hdr_proto(phdr);
+	ptype = gro_find_receive_by_type(type);
+	if (!ptype)
+		goto out;
+
+	flush = 0;
+
+	list_for_each_entry(p, head, list) {
+		const struct pppoe_hdr *phdr2;
+
+		if (!NAPI_GRO_CB(p)->same_flow)
+			continue;
+
+		phdr2 = (const struct pppoe_hdr *)(p->data + off_pppoe);
+		if (compare_pppoe_header(phdr, phdr2))
+			NAPI_GRO_CB(p)->same_flow = 0;
+	}
+
+	skb_gro_pull(skb, PPPOE_SES_HLEN);
+	skb_gro_postpull_rcsum(skb, phdr, PPPOE_SES_HLEN);
+
+	pp = indirect_call_gro_receive_inet(ptype->callbacks.gro_receive,
+					    ipv6_gro_receive, inet_gro_receive,
+					    head, skb);
+
+out:
+	skb_gro_flush_final(skb, pp, flush);
+
+	return pp;
+}
+
+static int pppoe_gro_complete(struct sk_buff *skb, int nhoff)
+{
+	struct pppoe_hdr *phdr = (struct pppoe_hdr *)(skb->data + nhoff);
+	__be16 type = pppoe_hdr_proto(phdr);
+	struct packet_offload *ptype;
+	unsigned int len;
+
+	ptype = gro_find_complete_by_type(type);
+	if (!ptype)
+		return -ENOENT;
+
+	len = skb->len - (nhoff + sizeof(*phdr));
+	len = min(len, 0xFFFFU);
+	phdr->length = cpu_to_be16(len);
+
+	return INDIRECT_CALL_INET(ptype->callbacks.gro_complete,
+				  ipv6_gro_complete, inet_gro_complete,
+				  skb, nhoff + PPPOE_SES_HLEN);
+}
+
+static struct sk_buff *pppoe_gso_segment(struct sk_buff *skb,
+					 netdev_features_t features)
+{
+	unsigned int pppoe_hlen = sizeof(struct pppoe_hdr) + 2;
+	struct sk_buff *segs = ERR_PTR(-EINVAL);
+	u16 mac_offset = skb->mac_header;
+	struct packet_offload *ptype;
+	u16 mac_len = skb->mac_len;
+	struct pppoe_hdr *phdr;
+	__be16 orig_type, type;
+	int len, nhoff;
+
+	skb_reset_network_header(skb);
+	nhoff = skb_network_header(skb) - skb_mac_header(skb);
+
+	if (unlikely(!pskb_may_pull(skb, pppoe_hlen)))
+		goto out;
+
+	phdr = (struct pppoe_hdr *)skb_network_header(skb);
+	type = pppoe_hdr_proto(phdr);
+	ptype = gro_find_complete_by_type(type);
+	if (!ptype)
+		goto out;
+
+	orig_type = skb->protocol;
+	__skb_pull(skb, pppoe_hlen);
+	segs = ptype->callbacks.gso_segment(skb, features);
+	if (IS_ERR_OR_NULL(segs)) {
+		skb_gso_error_unwind(skb, orig_type, pppoe_hlen, mac_offset,
+				     mac_len);
+		goto out;
+	}
+
+	skb = segs;
+	do {
+		phdr = (struct pppoe_hdr *)(skb_mac_header(skb) + nhoff);
+		len = skb->len - (nhoff + sizeof(*phdr));
+		phdr->length = cpu_to_be16(len);
+		skb->network_header = (u8 *)phdr - skb->head;
+		skb->protocol = orig_type;
+		skb_reset_mac_len(skb);
+	} while ((skb = skb->next));
+
+out:
+	return segs;
+}
+
+static struct packet_offload pppoe_packet_offload __read_mostly = {
+	.type = cpu_to_be16(ETH_P_PPP_SES),
+	.priority = 20,
+	.callbacks = {
+		.gro_receive = pppoe_gro_receive,
+		.gro_complete = pppoe_gro_complete,
+		.gso_segment = pppoe_gso_segment,
+	},
+};
+
 static int __init pppoe_init(void)
 {
 	int err;
@@ -1113,6 +1273,8 @@ static int __init pppoe_init(void)
 	if (err)
 		goto out_unregister_pppoe_proto;
 
+	if (IS_ENABLED(CONFIG_INET))
+		dev_add_offload(&pppoe_packet_offload);
 	dev_add_pack(&pppoes_ptype);
 	dev_add_pack(&pppoed_ptype);
 	register_netdevice_notifier(&pppoe_notifier);
@@ -1132,6 +1294,8 @@ static void __exit pppoe_exit(void)
 	unregister_netdevice_notifier(&pppoe_notifier);
 	dev_remove_pack(&pppoed_ptype);
 	dev_remove_pack(&pppoes_ptype);
+	if (IS_ENABLED(CONFIG_INET))
+		dev_remove_offload(&pppoe_packet_offload);
 	unregister_pppox_proto(PX_PROTO_OE);
 	proto_unregister(&pppoe_sk_proto);
 	unregister_pernet_device(&pppoe_net_ops);
diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index f98e46ae3e30..e6a0c18cc189 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -1539,6 +1539,7 @@ struct sk_buff *inet_gro_receive(struct list_head *head, struct sk_buff *skb)
 
 	return pp;
 }
+EXPORT_INDIRECT_CALLABLE(inet_gro_receive);
 
 static struct sk_buff *ipip_gro_receive(struct list_head *head,
 					struct sk_buff *skb)
@@ -1624,6 +1625,7 @@ int inet_gro_complete(struct sk_buff *skb, int nhoff)
 out:
 	return err;
 }
+EXPORT_INDIRECT_CALLABLE(inet_gro_complete);
 
 static int ipip_gro_complete(struct sk_buff *skb, int nhoff)
 {
diff --git a/net/ipv6/ip6_offload.c b/net/ipv6/ip6_offload.c
index bd7f780e37a5..32ba4739cef9 100644
--- a/net/ipv6/ip6_offload.c
+++ b/net/ipv6/ip6_offload.c
@@ -297,6 +297,7 @@ INDIRECT_CALLABLE_SCOPE struct sk_buff *ipv6_gro_receive(struct list_head *head,
 
 	return pp;
 }
+EXPORT_INDIRECT_CALLABLE(ipv6_gro_receive);
 
 static struct sk_buff *sit_ip6ip6_gro_receive(struct list_head *head,
 					      struct sk_buff *skb)
@@ -359,6 +360,7 @@ INDIRECT_CALLABLE_SCOPE int ipv6_gro_complete(struct sk_buff *skb, int nhoff)
 out:
 	return err;
 }
+EXPORT_INDIRECT_CALLABLE(ipv6_gro_complete);
 
 static int sit_gro_complete(struct sk_buff *skb, int nhoff)
 {
-- 
2.43.0


