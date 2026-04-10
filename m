Return-Path: <linux-ppp+bounces-513-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCwYG5+P2GksfQgAu9opvQ
	(envelope-from <linux-ppp+bounces-513-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Apr 2026 07:50:23 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE1B3D2618
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Apr 2026 07:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 280413015440
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Apr 2026 05:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E3B331A56;
	Fri, 10 Apr 2026 05:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X0V4Gu/z"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA521A304A
	for <linux-ppp@vger.kernel.org>; Fri, 10 Apr 2026 05:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775800216; cv=none; b=j7Hq/TLLM7ZKfnuKSmZ6Q2Gyz4j0uIjgK7d5kim7CoqaRrojOFoT5ax9y5UiJdpMfUUfwtYuTHLcJJ+pc6SbzJxiMAO6b0DawMHHh9nJ3qKBSHT9bdkWIV8AywT3Z47ZWLmWliO/ZyJOKTpOv5IAG90UtRucGSzhMRsCtQBC9yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775800216; c=relaxed/simple;
	bh=zPqjh1z6xmTB9lPHSqZ2VvUqMptfElhRPcqqbSlPndQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JaAlLMjnew56bnKnAZnGtVzkOnaRMXIF9Q+nuGF3Y1EkNPiXzG+tMvTJS4NBlJPSMbjpuZmYoa0YGuXJhYfFOcTOeY/jpU6JTS5NKS1lcL7lva67ERZdkj8TdKIifqqbPyKECjRVVOB/5JqqJp6EgxZGi3epuwHsIfYLAWbTen4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X0V4Gu/z; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775800213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sY29MFK4dUmAkfKCpdegdk2ruSANehnlXZ1ZNUYSz+o=;
	b=X0V4Gu/zGLKPs5pkelr9HzGpJ3vdwcz042miYoIDaT/CvPRZPseWrJ/tXAstif7IdSsqWH
	eWi56Pw+f+6Z+kEcIh+91TktD6U+krgqLmMZCUIK+i/Gr2vKgeZnXo1yhv4AhkpuPtu55O
	9C01GO2fY9U4/LFJoKlSLz408dMM30E=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-ppp@vger.kernel.org,
	Qingfang Deng <qingfang.deng@linux.dev>
Subject: [PATCH net-next v2 2/2] pppox: convert pppox_sk() to use container_of()
Date: Fri, 10 Apr 2026 13:49:50 +0800
Message-ID: <20260410054954.114031-2-qingfang.deng@linux.dev>
In-Reply-To: <20260410054954.114031-1-qingfang.deng@linux.dev>
References: <20260410054954.114031-1-qingfang.deng@linux.dev>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-513-lists,linux-ppp=lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:dkim,linux.dev:email,linux.dev:mid]
X-Rspamd-Queue-Id: BEE1B3D2618
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use container_of() macro instead of direct pointer casting to get the
pppox_sock from a sock pointer.

Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
Changes in v2:
 Do not remove the comment, as the struct is allocated from sk_alloc and
 still require sock to be the first member.

 Link to v1: https://lore.kernel.org/r/20260408015138.280687-2-qingfang.deng@linux.dev

 include/linux/if_pppox.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/if_pppox.h b/include/linux/if_pppox.h
index 636772693f9a..594d6dc3f4c9 100644
--- a/include/linux/if_pppox.h
+++ b/include/linux/if_pppox.h
@@ -54,7 +54,7 @@ struct pppox_sock {
 
 static inline struct pppox_sock *pppox_sk(struct sock *sk)
 {
-	return (struct pppox_sock *)sk;
+	return container_of(sk, struct pppox_sock, sk);
 }
 
 struct module;
-- 
2.43.0


