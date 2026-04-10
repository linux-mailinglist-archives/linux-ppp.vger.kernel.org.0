Return-Path: <linux-ppp+bounces-510-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO8dAWVw2Gk5dQgAu9opvQ
	(envelope-from <linux-ppp+bounces-510-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Apr 2026 05:37:09 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA073D1DC9
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Apr 2026 05:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6BE830053CF
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Apr 2026 03:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD39317166;
	Fri, 10 Apr 2026 03:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K46P6kqD"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716F52FCBF5
	for <linux-ppp@vger.kernel.org>; Fri, 10 Apr 2026 03:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775792210; cv=none; b=WsXJB2adacnmb0bTlj1rrlDvTpc2dt6OLeWHgNda32i2CPtozj8hkWyjyoMbmbH0BZDZBOTglOTAjQO8HJJKvkPbo9QNnl/AwmfROWgmVREabu/0XF654aBBMrs/Yx1Z4nb/T1C+Y4Hmk0XU3RqMoW6UGPKhO3huWg3/+UClLeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775792210; c=relaxed/simple;
	bh=46s0zmSrXROxnV/qZLcH3+jwugkT2yfc4Pu51qKdWmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fBuGF9IngOKjs2Kyev5IlIj3DPUZTNen3kiVvJahZRmmGfQ8fFDkt3xNHuFHKngkaf22T8tq3+jYOz1kwRCQ/gKBRXoTTCaC2wIRB186qfzMc/74UZp7dIY9QK7SFho8mQRQKZAy/Ze+CXkshhabnrQxYsZTpVNZXLtGQ1F6Hs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K46P6kqD; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775792206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tbnFhmrFEAWz4PWgWi++rOMzr2GDxUKrSjinMM3dV2M=;
	b=K46P6kqDlvbFn9TpGMQb2BWVzYDzmzAXcqzF+0Fo6VRz6suKxRKkl3QHpmEO1G040+9IE4
	4mgciCHrGUT3xB89Yaz62k6ntcP9MVQHYsmhqAuIXnpOlL1FnwiNmibBYVxch1Cp7GScQO
	Pkh5ERXb/Aw6gxsSl5M7N8619Q8KEh0=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: linux-ppp@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Guillaume Nault <gnault@redhat.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>,
	Jaco Kroon <jaco@uls.co.za>,
	James Carlson <carlsonj@workingcode.com>,
	Marcin Szycik <marcin.szycik@linux.intel.com>
Subject: [PATCH net v4 1/2] flow_dissector: do not dissect PPPoE PFC frames
Date: Fri, 10 Apr 2026 11:36:20 +0800
Message-ID: <20260410033627.93786-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-510-lists,linux-ppp=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: 4DA073D1DC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RFC 2516 Section 7 states that Protocol Field Compression (PFC) is NOT
RECOMMENDED for PPPoE. In practice, pppd does not support negotiating
PFC for PPPoE sessions, and the flow dissector driver has assumed an
uncompressed frame until the blamed commit.

During the review process of that commit [1], support for PFC is
suggested. However, having a compressed (1-byte) protocol field means
the subsequent PPP payload is shifted by one byte, causing 4-byte
misalignment for the network header and an unaligned access exception
on some architectures.

The exception can be reproduced by sending a PPPoE PFC frame to an
ethernet interface of a MIPS board, with RPS enabled, even if no PPPoE
session is active on that interface:

$ 0   : 00000000 80c40000 00000000 85144817
$ 4   : 00000008 00000100 80a75758 81dc9bb8
$ 8   : 00000010 8087ae2c 0000003d 00000000
$12   : 000000e0 00000039 00000000 00000000
$16   : 85043240 80a75758 81dc9bb8 00006488
$20   : 0000002f 00000007 85144810 80a70000
$24   : 81d1bda0 00000000
$28   : 81dc8000 81dc9aa8 00000000 805ead08
Hi    : 00009d51
Lo    : 2163358a
epc   : 805e91f0 __skb_flow_dissect+0x1b0/0x1b50
ra    : 805ead08 __skb_get_hash_net+0x74/0x12c
Status: 11000403        KERNEL EXL IE
Cause : 40800010 (ExcCode 04)
BadVA : 85144817
PrId  : 0001992f (MIPS 1004Kc)
Call Trace:
[<805e91f0>] __skb_flow_dissect+0x1b0/0x1b50
[<805ead08>] __skb_get_hash_net+0x74/0x12c
[<805ef330>] get_rps_cpu+0x1b8/0x3fc
[<805fca70>] netif_receive_skb_list_internal+0x324/0x364
[<805fd120>] napi_complete_done+0x68/0x2a4
[<8058de5c>] mtk_napi_rx+0x228/0xfec
[<805fd398>] __napi_poll+0x3c/0x1c4
[<805fd754>] napi_threaded_poll_loop+0x234/0x29c
[<805fd848>] napi_threaded_poll+0x8c/0xb0
[<80053544>] kthread+0x104/0x12c
[<80002bd8>] ret_from_kernel_thread+0x14/0x1c

Code: 02d51821  1060045b  00000000 <8c640000> 3084000f  2c820005  144001a2  00042080  8e220000

To reduce the attack surface and maintain performance, do not process
PPPoE PFC frames. While at it, avoid byte-swapping at runtime, restoring
the original behavior.

[1] https://patch.msgid.link/20220630231016.GA392@debian.home
Fixes: 46126db9c861 ("flow_dissector: Add PPPoE dissectors")
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
Changes in v4: no new changes
 Link to v3: https://lore.kernel.org/r/20260409031107.616630-1-qingfang.deng@linux.dev
Changes in v3:
 Make ppp_proto_is_valid() private and fix kdoc warning, avoiding
 gotchas if some out-of-tree modules use this function.
 Link to v1: https://lore.kernel.org/r/20260407045743.174446-1-qingfang.deng@linux.dev

 include/linux/ppp_defs.h  | 13 -------------
 net/core/flow_dissector.c | 39 +++++++++++++++++++++++----------------
 2 files changed, 23 insertions(+), 29 deletions(-)

diff --git a/include/linux/ppp_defs.h b/include/linux/ppp_defs.h
index b7e57fdbd413..45c0947fa404 100644
--- a/include/linux/ppp_defs.h
+++ b/include/linux/ppp_defs.h
@@ -12,17 +12,4 @@
 
 #define PPP_FCS(fcs, c) crc_ccitt_byte(fcs, c)
 
-/**
- * ppp_proto_is_valid - checks if PPP protocol is valid
- * @proto: PPP protocol
- *
- * Assumes proto is not compressed.
- * Protocol is valid if the value is odd and the least significant bit of the
- * most significant octet is 0 (see RFC 1661, section 2).
- */
-static inline bool ppp_proto_is_valid(u16 proto)
-{
-	return !!((proto & 0x0101) == 0x0001);
-}
-
 #endif /* _PPP_DEFS_H_ */
diff --git a/net/core/flow_dissector.c b/net/core/flow_dissector.c
index 1b61bb25ba0e..64b843800370 100644
--- a/net/core/flow_dissector.c
+++ b/net/core/flow_dissector.c
@@ -1035,6 +1035,21 @@ static bool is_pppoe_ses_hdr_valid(const struct pppoe_hdr *hdr)
 	return hdr->ver == 1 && hdr->type == 1 && hdr->code == 0;
 }
 
+/**
+ * ppp_proto_is_valid - checks if PPP protocol is valid
+ * @proto: PPP protocol
+ *
+ * Assumes proto is not compressed.
+ * Protocol is valid if the value is odd and the least significant bit of the
+ * most significant octet is 0 (see RFC 1661, section 2).
+ *
+ * Return: Whether the PPP protocol is valid.
+ */
+static bool ppp_proto_is_valid(__be16 proto)
+{
+	return (proto & htons(0x0101)) == htons(0x0001);
+}
+
 /**
  * __skb_flow_dissect - extract the flow_keys struct and return it
  * @net: associated network namespace, derived from @skb if NULL
@@ -1361,7 +1376,7 @@ bool __skb_flow_dissect(const struct net *net,
 			struct pppoe_hdr hdr;
 			__be16 proto;
 		} *hdr, _hdr;
-		u16 ppp_proto;
+		__be16 ppp_proto;
 
 		hdr = __skb_header_pointer(skb, nhoff, sizeof(_hdr), data, hlen, &_hdr);
 		if (!hdr) {
@@ -1374,27 +1389,19 @@ bool __skb_flow_dissect(const struct net *net,
 			break;
 		}
 
-		/* least significant bit of the most significant octet
-		 * indicates if protocol field was compressed
-		 */
-		ppp_proto = ntohs(hdr->proto);
-		if (ppp_proto & 0x0100) {
-			ppp_proto = ppp_proto >> 8;
-			nhoff += PPPOE_SES_HLEN - 1;
-		} else {
-			nhoff += PPPOE_SES_HLEN;
-		}
+		ppp_proto = hdr->proto;
+		nhoff += PPPOE_SES_HLEN;
 
-		if (ppp_proto == PPP_IP) {
+		if (ppp_proto == htons(PPP_IP)) {
 			proto = htons(ETH_P_IP);
 			fdret = FLOW_DISSECT_RET_PROTO_AGAIN;
-		} else if (ppp_proto == PPP_IPV6) {
+		} else if (ppp_proto == htons(PPP_IPV6)) {
 			proto = htons(ETH_P_IPV6);
 			fdret = FLOW_DISSECT_RET_PROTO_AGAIN;
-		} else if (ppp_proto == PPP_MPLS_UC) {
+		} else if (ppp_proto == htons(PPP_MPLS_UC)) {
 			proto = htons(ETH_P_MPLS_UC);
 			fdret = FLOW_DISSECT_RET_PROTO_AGAIN;
-		} else if (ppp_proto == PPP_MPLS_MC) {
+		} else if (ppp_proto == htons(PPP_MPLS_MC)) {
 			proto = htons(ETH_P_MPLS_MC);
 			fdret = FLOW_DISSECT_RET_PROTO_AGAIN;
 		} else if (ppp_proto_is_valid(ppp_proto)) {
@@ -1412,7 +1419,7 @@ bool __skb_flow_dissect(const struct net *net,
 							      FLOW_DISSECTOR_KEY_PPPOE,
 							      target_container);
 			key_pppoe->session_id = hdr->hdr.sid;
-			key_pppoe->ppp_proto = htons(ppp_proto);
+			key_pppoe->ppp_proto = ppp_proto;
 			key_pppoe->type = htons(ETH_P_PPP_SES);
 		}
 		break;
-- 
2.43.0


