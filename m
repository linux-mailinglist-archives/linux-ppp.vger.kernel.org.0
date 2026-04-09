Return-Path: <linux-ppp+bounces-505-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMLaAgAZ12ldKwgAu9opvQ
	(envelope-from <linux-ppp+bounces-505-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 09 Apr 2026 05:12:00 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 365963C5FA3
	for <lists+linux-ppp@lfdr.de>; Thu, 09 Apr 2026 05:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 18BCC3019393
	for <lists+linux-ppp@lfdr.de>; Thu,  9 Apr 2026 03:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1762B36F42D;
	Thu,  9 Apr 2026 03:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="t0MXfqE6"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F7A2BD030;
	Thu,  9 Apr 2026 03:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775704290; cv=none; b=CaJ+AUHCf0WEkEQOwD+2L6P5O86pfUrOoQHN9ST3kQJDPMntKu4Lgd5kH6ei7FygfQ8zDk+lt4n+0iUgbZFGZjlMgupyo34AhqMo5FWbPhZN7o8dm1L4DaR9dh/PDVWpiRtsusnvX4tUI2xJyVm1H3YDq6W9uZ1z/EhrQz5rXN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775704290; c=relaxed/simple;
	bh=u+ofVgFYlIIA4dK5MTz51iYII9YuqUbVQmVZ8NyRVdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hNmMqfSB0jRnb2qHfm8ECfIyZAo3N4TjLzAxcWNifCpTeeL/jQoUNnD6hwRbs+/Ua+kbOpWCQHW6FjElE+MdJTYDzufggzXMbEPfy/99MpGQStfbMP0eBmIsg0q3Vx7PwDtU8o+8h7aShEywVUUSa/xo0oFztElOX5eo8dxcae4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=t0MXfqE6; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775704286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IVxHTlgXIaRT3RCJ9lceVoj0EL96Eiqshlb13XnKKOI=;
	b=t0MXfqE6DPvuAFDmNTAZYrZ+dGdbeddzNP/B5sNG1ijdwWwvJl0jjRkcNL7z+L1LWaF3oB
	c0Vsj1xlfL6pWz6ojyprO3wGmqxYTjQNXvcI6xin945bgWk7mLwxoTRO5wtfEdOCrClBqY
	KDryxb4zTnUz0LxPu8kET4j65TEd3kI=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: linux-ppp@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Ostrowski <mostrows@gmail.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Kees Cook <kees@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>,
	Jaco Kroon <jaco@uls.co.za>,
	James Carlson <carlsonj@workingcode.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Marcin Szycik <marcin.szycik@linux.intel.com>,
	Guillaume Nault <gnault@redhat.com>
Subject: [PATCH net v3 2/2] pppoe: drop PFC frames
Date: Thu,  9 Apr 2026 11:11:02 +0800
Message-ID: <20260409031107.616630-2-qingfang.deng@linux.dev>
In-Reply-To: <20260409031107.616630-1-qingfang.deng@linux.dev>
References: <20260409031107.616630-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-505-lists,linux-ppp=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,linux.dev,linutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.dev:dkim,linux.dev:email,linux.dev:mid]
X-Rspamd-Queue-Id: 365963C5FA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RFC 2516 Section 7 states that Protocol Field Compression (PFC) is NOT
RECOMMENDED for PPPoE. In practice, pppd does not support negotiating
PFC for PPPoE sessions, and the current PPPoE driver assumes an
uncompressed (2-byte) protocol field. However, the generic PPP layer
function ppp_input() is not aware of the negotiation result, and still
accepts PFC frames.

If a peer with a broken implementation or an attacker sends a frame with
a compressed (1-byte) protocol field, the subsequent PPP payload is
shifted by one byte. This causes the network header to be 4-byte
misaligned, which may trigger unaligned access exceptions on some
architectures.

To reduce the attack surface, drop PPPoE PFC frames. Introduce
ppp_skb_is_compressed_proto() helper function to be used in both
ppp_generic.c and pppoe.c to avoid open-coding.

Fixes: 224cf5ad14c0 ("ppp: Move the PPP drivers")
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
Changes in v3:
 Fix kdoc warning
 Link to v2: https://lore.kernel.org/netdev/20260408024245.312732-1-qingfang.deng@linux.dev/

 drivers/net/ppp/ppp_generic.c |  2 +-
 drivers/net/ppp/pppoe.c       |  8 +++++++-
 include/linux/ppp_defs.h      | 16 ++++++++++++++++
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index cb29a6968c63..eb1503b389ef 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -2251,7 +2251,7 @@ ppp_do_recv(struct ppp *ppp, struct sk_buff *skb, struct channel *pch)
  */
 static void __ppp_decompress_proto(struct sk_buff *skb)
 {
-	if (skb->data[0] & 0x01)
+	if (ppp_skb_is_compressed_proto(skb))
 		*(u8 *)skb_push(skb, 1) = 0x00;
 }
 
diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index 1ac61c273b28..4cd10c908711 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -393,7 +393,7 @@ static int pppoe_rcv(struct sk_buff *skb, struct net_device *dev,
 	if (skb_mac_header_len(skb) < ETH_HLEN)
 		goto drop;
 
-	if (!pskb_may_pull(skb, sizeof(struct pppoe_hdr)))
+	if (!pskb_may_pull(skb, PPPOE_SES_HLEN))
 		goto drop;
 
 	ph = pppoe_hdr(skb);
@@ -403,6 +403,12 @@ static int pppoe_rcv(struct sk_buff *skb, struct net_device *dev,
 	if (skb->len < len)
 		goto drop;
 
+	/* skb->data points to the PPP protocol header after skb_pull_rcsum.
+	 * Drop PFC frames.
+	 */
+	if (ppp_skb_is_compressed_proto(skb))
+		goto drop;
+
 	if (pskb_trim_rcsum(skb, len))
 		goto drop;
 
diff --git a/include/linux/ppp_defs.h b/include/linux/ppp_defs.h
index 45c0947fa404..6e9587ce651c 100644
--- a/include/linux/ppp_defs.h
+++ b/include/linux/ppp_defs.h
@@ -8,8 +8,24 @@
 #define _PPP_DEFS_H_
 
 #include <linux/crc-ccitt.h>
+#include <linux/skbuff.h>
 #include <uapi/linux/ppp_defs.h>
 
 #define PPP_FCS(fcs, c) crc_ccitt_byte(fcs, c)
 
+/**
+ * ppp_skb_is_compressed_proto - checks if PPP protocol in a skb is compressed
+ * @skb: skb to check
+ *
+ * Check if the PPP protocol field is compressed (the least significant
+ * bit of the most significant octet is 1). skb->data must point to the PPP
+ * protocol header.
+ *
+ * Return: Whether the PPP protocol field is compressed.
+ */
+static inline bool ppp_skb_is_compressed_proto(const struct sk_buff *skb)
+{
+	return unlikely(skb->data[0] & 0x01);
+}
+
 #endif /* _PPP_DEFS_H_ */
-- 
2.43.0


