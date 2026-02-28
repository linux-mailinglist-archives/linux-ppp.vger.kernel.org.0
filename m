Return-Path: <linux-ppp+bounces-400-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id V7zGDLNfomk02gQAu9opvQ
	(envelope-from <linux-ppp+bounces-400-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Sat, 28 Feb 2026 04:23:31 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7521C01DD
	for <lists+linux-ppp@lfdr.de>; Sat, 28 Feb 2026 04:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1E7E303276A
	for <lists+linux-ppp@lfdr.de>; Sat, 28 Feb 2026 03:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5DA285CB6;
	Sat, 28 Feb 2026 03:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqx+oLir"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAEB27AC48
	for <linux-ppp@vger.kernel.org>; Sat, 28 Feb 2026 03:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772249007; cv=none; b=WOs5d612kZR7jYWTpx0RljT8xAlJggLNPQ679nmdyfVxPu+fq9a/XNRZK8KJkcaRqiPD8G3w9g3dyXS6+drHYbNcO59gNeu75a+YTVJVlD3mkfYfHFlgLKk4BmNeNH85L1kiGmL6Q0p8NAKr+zcKltBzEOLnCK5W8ubIw+DUZIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772249007; c=relaxed/simple;
	bh=2VJAOsbOXN64VK52QrdpFYnvXwbZL9fJZhXNnjkZROU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mPdc33Nf5HUTrmNjhCaTgmF6/15UkIO9EU2lUlJo9awx2RGyXXOrMfDAOretScUk3ofx+dczYHMOu5PjpwAAJWiGuzExkiV/4FLmThH/4rfaPXaQ8rokKa7kyqtYZ+g3OSLPYiUGTR2bROTTCLBl80jzym3K8X9eA8mOESoIi3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqx+oLir; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9359c0ec47so290757166b.0
        for <linux-ppp@vger.kernel.org>; Fri, 27 Feb 2026 19:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772249004; x=1772853804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S0ZchPbAREZAzkXthv+xzhxFLPbamh8n6hQVVuKvb3g=;
        b=aqx+oLirmtrf047cB/nsQNydvCa9ehfIZ5e07rBt6fA1TDKxq9SjxYYSy2CbojBupo
         UM31OsRTK/ZYmlaRT8sfhM97046NV3lD5oPIj+PKWjMlR9Jsut5c3gbD6VPzP/fUkpaG
         idHlPRYVCtnNp0K4bSct8qzOj6OG9rvPJjgOdgx06YId0NG2nnfJtgYDc0LJgE3t3NQ1
         Nf2dPqVWdyJRyuoSfyQgE/Sl1nYpsW/fQ7GM4j7NsHMenUt/wREGdheCJSWcddUdJEBn
         u2reGIOvGZpUXFeDULeRQU9A8Rd7h8vurve6kW71fR8tiCB7mf2906fGQZAr2wGF1wCa
         Lh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772249004; x=1772853804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0ZchPbAREZAzkXthv+xzhxFLPbamh8n6hQVVuKvb3g=;
        b=Wu9bZOnVpdh4B3GaB8HUGYS2IFW9bgYyejMrvkp+plymR4vpkngPLoZv6nHgRl3772
         cPW7ePE1kCiplqH6pOGMVAh5IB88akd7JvgSG56k+Vf5oUKMdff5zyEtm/XX0HAnzE4i
         Nt/dtFb++BlelQmuVjTLOIHNA0Nmb8+LDhKDd+Ot8XLtF3vjhuraQVhhQ1KgWyNvd00P
         7ebkpc9eVq9BERt/YQp6H4TarpfBg89TByllu1PuuMYEMvn8yocmSuPiJbWOHemKKQpt
         iVx2/uUBvMJ6EUz5fS2F8xJMJPqtC7xvDC6BygMhDBCfOvbH6oVfrFLQR1KRZdBvfe78
         kxHA==
X-Gm-Message-State: AOJu0YxpG4ZLamztdudrnXoL89o9Waiy0o35ebYD312lisXWmVNiqK9N
	3Gxg4xdIOvPNl8iGIT/HLmhd32Shi0qH+97lBqT/QJlJD2jSa3FiNionyx9XrBe4eas=
X-Gm-Gg: ATEYQzw+BY3BRPGUyQdxIL37crfjwETKfqU/LwOCcTV1YQmhgWoO0KFW6lrCzLho1z9
	b/4SM2RmAXrfdp5Zd4x1NhUYPJiQL03lHFG393TiIApCV04hBGS1nAkyKhRGbUuV62SyG7Nw5us
	vGGhpauicDi7o1bBTNOVAUhNGSUQwXOnHmlw9P/KHY/bi7RTDshvFGlRtnlpqWCJtL8sH4OCko4
	XUWnSDCLzJIGvEtqcKXy8dyPt4nsJnYQd7BzukVrNYwvu9KJ3r+81H+AuwWO0zarAJb0gwT2RL+
	d0DZf/OdFSMzLH4BqxRPN/1NBKKdUQdacnPJTtFDNsRBjNXWvercvG6OuGjmb1DC4XVmuJ7fn1A
	5zjcKB2y2t35K9npQeyrtyE5CAjoM3/3MT+oW3KK1oRg0FYVMOcPuz29ahc17Lkz0c+JcDRWA
X-Received: by 2002:a17:907:3d51:b0:b8f:96f3:de05 with SMTP id a640c23a62f3a-b93765878e0mr300835866b.60.1772249003792;
        Fri, 27 Feb 2026 19:23:23 -0800 (PST)
Received: from gmail.com ([2a09:bac1:5520::20a:ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac70b01sm203031266b.23.2026.02.27.19.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 19:23:23 -0800 (PST)
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
Subject: [PATCH net-next v4] net: pppoe: implement GRO/GSO support
Date: Sat, 28 Feb 2026 11:23:17 +0800
Message-ID: <20260228032317.146855-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-400-lists,linux-ppp=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7E7521C01DD
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
v4:
  - fetch ppp proto without using tag_type
  - filter for session packets (type:1, ver:1, code:0)
  - constify some parameters
v3: https://lore.kernel.org/netdev/20250811095734.71019-1-nbd@nbd.name/
  - increase priority value
  - implement GSO support
  - use INDIRECT_CALL_INET
  - update pppoe length field
  - remove unnecessary network_offsets update

 drivers/net/ppp/pppoe.c | 168 +++++++++++++++++++++++++++++++++++++++-
 net/ipv4/af_inet.c      |   2 +
 net/ipv6/ip6_offload.c  |   2 +
 3 files changed, 171 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index 1ac61c273b28..920d9015b4b4 100644
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
@@ -1097,6 +1098,169 @@ static struct pernet_operations pppoe_net_ops = {
 	.size = sizeof(struct pppoe_net),
 };
 
+static u16
+compare_pppoe_header(const struct pppoe_hdr *phdr,
+		     const struct pppoe_hdr *phdr2)
+{
+	const __be16 proto = *(const __be16 *)(phdr + 1);
+	const __be16 proto2 = *(const __be16 *)(phdr2 + 1);
+
+	return (__force u16)((phdr->sid ^ phdr2->sid) | (proto ^ proto2));
+}
+
+static __be16 pppoe_hdr_proto(const struct pppoe_hdr *phdr)
+{
+	const __be16 proto = *(const __be16 *)(phdr + 1);
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
+	if (skb_gro_len(skb) != be16_to_cpu(phdr->length) + hlen)
+		goto out;
+
+	type = pppoe_hdr_proto(phdr);
+	if (!type)
+		goto out;
+
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
@@ -1113,6 +1277,7 @@ static int __init pppoe_init(void)
 	if (err)
 		goto out_unregister_pppoe_proto;
 
+	dev_add_offload(&pppoe_packet_offload);
 	dev_add_pack(&pppoes_ptype);
 	dev_add_pack(&pppoed_ptype);
 	register_netdevice_notifier(&pppoe_notifier);
@@ -1132,6 +1297,7 @@ static void __exit pppoe_exit(void)
 	unregister_netdevice_notifier(&pppoe_notifier);
 	dev_remove_pack(&pppoed_ptype);
 	dev_remove_pack(&pppoes_ptype);
+	dev_remove_offload(&pppoe_packet_offload);
 	unregister_pppox_proto(PX_PROTO_OE);
 	proto_unregister(&pppoe_sk_proto);
 	unregister_pernet_device(&pppoe_net_ops);
diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index 8036e76aa1e4..b98e0b180955 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -1537,6 +1537,7 @@ struct sk_buff *inet_gro_receive(struct list_head *head, struct sk_buff *skb)
 
 	return pp;
 }
+EXPORT_INDIRECT_CALLABLE(inet_gro_receive);
 
 static struct sk_buff *ipip_gro_receive(struct list_head *head,
 					struct sk_buff *skb)
@@ -1622,6 +1623,7 @@ int inet_gro_complete(struct sk_buff *skb, int nhoff)
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


