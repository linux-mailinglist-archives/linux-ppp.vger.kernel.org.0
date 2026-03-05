Return-Path: <linux-ppp+bounces-404-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aABRHrneqGlmyAAAu9opvQ
	(envelope-from <linux-ppp+bounces-404-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 05 Mar 2026 02:39:05 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B365209EF3
	for <lists+linux-ppp@lfdr.de>; Thu, 05 Mar 2026 02:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 72E7A301A7A5
	for <lists+linux-ppp@lfdr.de>; Thu,  5 Mar 2026 01:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428C7225791;
	Thu,  5 Mar 2026 01:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZp8/3Gd"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51E11E1A17
	for <linux-ppp@vger.kernel.org>; Thu,  5 Mar 2026 01:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674743; cv=none; b=qsTLgoTraAiDW0k8aDCWLpMDNwEEsHshsGxmnH7M87FzqrlubbU0NlLpgM2ySML2gEHtgfR+3UvARmzHg8BWaXG1k+2/+cVDv6z8sEMs8MzA5cVka8YPXnc1NU2V/AuquFSSTlR4RNHZ1qEb8rr8wIGnAjg3GuJFn/v5wKhdT8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674743; c=relaxed/simple;
	bh=vxfBLb7BQUWoM9Ys6hCqlQ6NnkecLhqabKld5ofnj9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tC75KImsZn6jsnCFIrdC/N83VT22Qr5nkjyJLYrOwGMm9Ec/C3qVS+kc1x0OQ3JWmIX1l5hf9wrMycMGpFnSRvAsA5CRM12yTkKSFi5/WuHf+4WCP8VrWveD0mz9E1kSZnTNR0/6u1n+eROfj9oJmddZnow7krNHeM3UeQN8AR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZp8/3Gd; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b935b8dcab7so1167219466b.1
        for <linux-ppp@vger.kernel.org>; Wed, 04 Mar 2026 17:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772674740; x=1773279540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MPe/PdNhewixqGNFlxS/EUh6KoFNNg0LbtLcJ3DSR9g=;
        b=DZp8/3GddCQljKBUYChKQDSDTUlVdhFVrAtc2YOU2/5W1s9q/PEtsZVHheFFXUUgTu
         x/rahm+znTuJD6QzGSPidF8Ix/v21RH9In1WTmOoaHToOtuxakx3P1HEE1wp4R16thS2
         IErh/6Tcc87ltwlG+hI1iJ7SIKHSvMHQzK8yZVKGTRA+7SjbHm245pavm31Jm+zkr7W0
         z++YUQmYmSvZhoc0G2DMj62LWa0TLhXruuT1i5FlrcRckSebpF5PAO9Lyzw353d+2gcJ
         DNAVk4K/Y6BWrjYsD8gDtSqx00TXDRAbSkmTu7XhZcTIbKIJLcBmB+H6GVjOdISUTt9/
         Yggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772674740; x=1773279540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPe/PdNhewixqGNFlxS/EUh6KoFNNg0LbtLcJ3DSR9g=;
        b=b0UM23NL0B7byDyH5oDFwolKVvrlENT9cetx6iKaHEXP0I3tsGhxiyU2JRn/72ncQY
         SNgC0qunSID2BIXun8xGL96IVuK+vgR30cvsfBP42TXxLoeHzaT1zs6Wdl8o2gI6r4S4
         6UhzIDMlHqbfPQoC9SULB0O5V8WHBLtw4L6l5/1IF/wA+zkzCsVZeelFo7SaSEWyr1Hu
         ucRPHHjYqJ+/HzyFA2R11qKznltADEg0rM5UJoypbJhNniO6c4rpN6j1Lmfns+pFoTqI
         SNEBLSmE3jedW0SsGHJqRtLrz/N2wYni/6pdPPh43qrhXvO57cp1UwEvVpYAZTbD1AK2
         cZ+Q==
X-Gm-Message-State: AOJu0YzmhVnMc7sosmrnpOM0wSIp5ePt1N5CCER93+bZSyoeiNLhUvl7
	q+qTVGfixedxnq0UuUb3QXBBvn8wSW/AxvnNJOxIgbiIpHTL/2uM7VCVJBI4p/ywSUjwnQ==
X-Gm-Gg: ATEYQzy9EjSuio/upUJx4uO8QFMkB+qlLWLcxsaRRH0iwwV34sNNvzO3NxtdXnZ3MRH
	Onsl4WJIqZhhfL39Lc3qoKpBnYfN/81E/EKVcWGHSE8w0Bb1MOsdDYE/lyvhrJ6RfRXV75uZ1aa
	UZAScWkkGGlGHf+hqgXjEytGm0zWIlktHmFvUtZHX4n/RHXkFeky1dmrXRL4/p64jk7s51J0dB5
	wKIe4GvypH9e/gunWCZSNzXgUOi7nTcfZ4Y2NkEJ3OAM944sNlKRx21ZOKmJjEKwPQKGQV5FBW0
	9Dp4iutYwBj9VPpxi8GwUhN/gjp7AWAQwqzyObykrrV/PkZf6GkURjJYd56lcsGoGYuZrrpjXvx
	smeuoc2n5ab02UtfJ+zamxiJ4SrkRENr01XtrPxfhLcaISF+9GX9AZkTtkCKS2xeSU3xLubDQRq
	SkWgw=
X-Received: by 2002:a17:907:5c3:b0:b8e:d260:cb20 with SMTP id a640c23a62f3a-b93f11c5470mr240587366b.18.1772674739524;
        Wed, 04 Mar 2026 17:38:59 -0800 (PST)
Received: from gmail.com ([2a09:bac5:4e22:2705::3e3:31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b93cc1e538fsm345604466b.15.2026.03.04.17.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 17:38:58 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: linux-ppp@vger.kernel.org,
	Michal Ostrowski <mostrows@earthlink.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH net-next v5] net: pppoe: implement GRO/GSO support
Date: Thu,  5 Mar 2026 09:38:52 +0800
Message-ID: <20260305013852.3769-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1B365209EF3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-404-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[vger.kernel.org,earthlink.net,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nbd.name:email]
X-Rspamd-Action: no action

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
v5: 
 - remove skb_is_gso() check from pppoe_rcv(), as the pppoe length
   field is updated in pppoe_gro_complete() to indicate the gso size.
 - fix length check in pppoe_gro_receive().
 - remove unnecessary check after pppoe_hdr_proto().
 - remove some unnecessary const qualifiers.
 https://lore.kernel.org/all/20260228032317.146855-1-dqfext@gmail.com/

 drivers/net/ppp/pppoe.c | 163 ++++++++++++++++++++++++++++++++++++++++
 net/ipv4/af_inet.c      |   2 +
 net/ipv6/ip6_offload.c  |   2 +
 3 files changed, 167 insertions(+)

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index 1ac61c273b28..7908262ff2cd 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -77,6 +77,7 @@
 #include <net/net_namespace.h>
 #include <net/netns/generic.h>
 #include <net/sock.h>
+#include <net/gro.h>
 
 #include <linux/uaccess.h>
 
@@ -1097,6 +1098,166 @@ static struct pernet_operations pppoe_net_ops = {
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
+	case cpu_to_be16(PPP_IPV6):
+		return cpu_to_be16(ETH_P_IPV6);
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
+	hlen = off_pppoe + sizeof(*phdr);
+	phdr = skb_gro_header(skb, hlen + 2, off_pppoe);
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
+	skb_gro_pull(skb, sizeof(*phdr) + 2);
+	skb_gro_postpull_rcsum(skb, phdr, sizeof(*phdr) + 2);
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
+	int len, err;
+
+	ptype = gro_find_complete_by_type(type);
+	if (!ptype)
+		return -ENOENT;
+
+	err = INDIRECT_CALL_INET(ptype->callbacks.gro_complete,
+				 ipv6_gro_complete, inet_gro_complete,
+				 skb, nhoff + sizeof(*phdr) + 2);
+	if (err)
+		return err;
+
+	len = skb->len - (nhoff + sizeof(*phdr));
+	phdr->length = cpu_to_be16(len);
+
+	return 0;
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
@@ -1113,6 +1274,7 @@ static int __init pppoe_init(void)
 	if (err)
 		goto out_unregister_pppoe_proto;
 
+	dev_add_offload(&pppoe_packet_offload);
 	dev_add_pack(&pppoes_ptype);
 	dev_add_pack(&pppoed_ptype);
 	register_netdevice_notifier(&pppoe_notifier);
@@ -1132,6 +1294,7 @@ static void __exit pppoe_exit(void)
 	unregister_netdevice_notifier(&pppoe_notifier);
 	dev_remove_pack(&pppoed_ptype);
 	dev_remove_pack(&pppoes_ptype);
+	dev_remove_offload(&pppoe_packet_offload);
 	unregister_pppox_proto(PX_PROTO_OE);
 	proto_unregister(&pppoe_sk_proto);
 	unregister_pernet_device(&pppoe_net_ops);
diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index babcd75a08e2..aa3324d819b3 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -1532,6 +1532,7 @@ struct sk_buff *inet_gro_receive(struct list_head *head, struct sk_buff *skb)
 
 	return pp;
 }
+EXPORT_INDIRECT_CALLABLE(inet_gro_receive);
 
 static struct sk_buff *ipip_gro_receive(struct list_head *head,
 					struct sk_buff *skb)
@@ -1617,6 +1618,7 @@ int inet_gro_complete(struct sk_buff *skb, int nhoff)
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


