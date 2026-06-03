Return-Path: <linux-ppp+bounces-601-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oAUQHV/HH2pGpwAAu9opvQ
	(envelope-from <linux-ppp+bounces-601-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 03 Jun 2026 08:19:11 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D660F6349AB
	for <lists+linux-ppp@lfdr.de>; Wed, 03 Jun 2026 08:19:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=bpzC9ZIO;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-601-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-ppp+bounces-601-lists+linux-ppp=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D8BF303D56C
	for <lists+linux-ppp@lfdr.de>; Wed,  3 Jun 2026 06:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8123F8712;
	Wed,  3 Jun 2026 06:18:11 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADA438B7B1
	for <linux-ppp@vger.kernel.org>; Wed,  3 Jun 2026 06:18:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780467491; cv=none; b=Zv9h8PPVY3VHpveuaKE6Ovn73FMd3sGIbZbGJzMURRbs9g8eo0ATqVxQHVSfT3bmrmOlf93S1Q0pJAZCp4nfLN4wxYte3z62xLEqy+InR16s6ATJ6Iw3YL2miBigVx4XjewBXS9fVvEK+85/0N5e8EfcZhkFBZwpoqKSov74gtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780467491; c=relaxed/simple;
	bh=igLi0aFoIR8oOPtljlYZro0h7CIA1d9Odeoh220PwZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jBuw3u+juFhrbP95flfVLeA6vKWrRM69NwGUnBEJn2UPzWIz2xu1wN6SNgUnkN2VEnrGHY1HnZP55DZ3InbIMO3PVljm3Jw2sHce2jQCA55NHcXyYzN3OO2YOgYBbRuVUlXS8gvfU/TlX8huOFKsTfFIiwTmwV2wUDgGWIEQadI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bpzC9ZIO; arc=none smtp.client-ip=95.215.58.177
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780467477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d4V0CNKpI15eY3bq0nYf9RGoV7ytpy50VKiOWNIpJgQ=;
	b=bpzC9ZIOM3QPg7VNwMnc84WZLdWNo3xVDuFgBhS5IkRTbD7lg9wbbMT3O6QX7G9xW6F3pF
	eiwJEPvdewTqfZaiskbrMtpNfH9tve5TGKpxvYwqO7NOfq7xBAQATSDVB6qtSdOmrb0O4E
	50eNlLQ25KVQto/DnZoISegdndDtxR4=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Matthieu Baerts <matttbe@kernel.org>
Subject: [PATCH net-next] selftests: net: do not detect PPPoX loopback
Date: Wed,  3 Jun 2026 14:17:44 +0800
Message-ID: <20260603061746.23452-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-601-lists,linux-ppp=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:shuah@kernel.org,m:qingfang.deng@linux.dev,m:linux-ppp@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matttbe@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,linux.dev:from_mime,linux.dev:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D660F6349AB

By default, pppd attempts to detect loopbacks on the underlying
interface using a pseudo-randomly generated magic number and checks if
the same value is received. The seed for the PRNG is a hash of hostname
XOR current time XOR pid, which is likely to collide on NIPA, causing
false positives. Disable magic number generation.

Reported-by: Matthieu Baerts <matttbe@kernel.org>
Fixes: 7af2a94f4dcf ("selftests: net: add tests for PPPoL2TP")
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 tools/testing/selftests/net/ppp/pppoe-server-options | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/ppp/pppoe-server-options b/tools/testing/selftests/net/ppp/pppoe-server-options
index 66c8c9d319e9..cd586be7061b 100644
--- a/tools/testing/selftests/net/ppp/pppoe-server-options
+++ b/tools/testing/selftests/net/ppp/pppoe-server-options
@@ -1,2 +1,3 @@
 noauth
 noipdefault
+nomagic
-- 
2.43.0


