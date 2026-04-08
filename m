Return-Path: <linux-ppp+bounces-496-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEtcBsG01Wn78wcAu9opvQ
	(envelope-from <linux-ppp+bounces-496-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Apr 2026 03:52:01 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CB13B61C2
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Apr 2026 03:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 02C3030117E6
	for <lists+linux-ppp@lfdr.de>; Wed,  8 Apr 2026 01:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0548035EDA4;
	Wed,  8 Apr 2026 01:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pmYOaKOu"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8344135DA6D
	for <linux-ppp@vger.kernel.org>; Wed,  8 Apr 2026 01:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775613114; cv=none; b=BK3g6KDioae46wc07WLGa8T3P3qNbthEMYegkzP28jSkSpH7dj1/jmDrwMFUC0Stq8TRrPpmnWVfEHbmE78b/YhyiV0f6Ry+zUT590yuBtdgtg9sICWXykO0/mYU/O2V0eyfvD4PGsDWbHG/Meiq4gPRFkiFjpikZ7MvctpdwN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775613114; c=relaxed/simple;
	bh=y/3DO+ORwS5VbmuGQpenBxZoTjBDdKCHAGR259B6XoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gwjpzoJTuwiMW6eleadFQjHnmGR7FxUkMQISJqeFIDWpw2f0VE6AUwRTVxVVT/blEBiKFnX81Fr1aNqubPT67iH1XyyCTlpZ6S9CKY2nFJ+DIfsbvn8VvpYsGzYGQZfKSCANyaTZGCW8L1c+CcHCGBjWrcp6oUNhzb7Ir4uK7EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pmYOaKOu; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775613111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aIh3ARqFq/vGHnNpbOy4uDjZQT9ulz9JUvqqrKVvG9g=;
	b=pmYOaKOuWVio+2g5SXSZBwPgoo2UpZiZ+T/LYffORRFfwfoeckC7Vvfsi6bgTWUR0Lg/wt
	5liZKQ/2rJhtcl2hFnV4QqAr0PdTinNI84ZQydUyLDHYrldrUBFRvybZ2yFubYD4AzvTa7
	TKWqqNMT330BH5wLj5dQsw8gDwQv7hg=
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
Subject: [PATCH net-next 2/2] pppox: convert pppox_sk() to use container_of()
Date: Wed,  8 Apr 2026 09:51:34 +0800
Message-ID: <20260408015138.280687-2-qingfang.deng@linux.dev>
In-Reply-To: <20260408015138.280687-1-qingfang.deng@linux.dev>
References: <20260408015138.280687-1-qingfang.deng@linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-496-lists,linux-ppp=lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B3CB13B61C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use container_of() macro instead of direct pointer casting to get the
pppox_sock from a sock pointer. This improves type safety and removes
the requirement that sk must be the first struct member.

Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 include/linux/if_pppox.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/if_pppox.h b/include/linux/if_pppox.h
index 636772693f9a..4f8d9e02cd7f 100644
--- a/include/linux/if_pppox.h
+++ b/include/linux/if_pppox.h
@@ -38,7 +38,6 @@ struct pptp_opt {
 #include <net/sock.h>
 
 struct pppox_sock {
-	/* struct sock must be the first member of pppox_sock */
 	struct sock sk;
 	struct ppp_channel chan;
 	struct pppox_sock __rcu	*next;	  /* for hash table */
@@ -54,7 +53,7 @@ struct pppox_sock {
 
 static inline struct pppox_sock *pppox_sk(struct sock *sk)
 {
-	return (struct pppox_sock *)sk;
+	return container_of(sk, struct pppox_sock, sk);
 }
 
 struct module;
-- 
2.43.0


