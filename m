Return-Path: <linux-ppp+bounces-602-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BaIgNmtsI2pdtwEAu9opvQ
	(envelope-from <linux-ppp+bounces-602-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Sat, 06 Jun 2026 02:40:11 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C8464C095
	for <lists+linux-ppp@lfdr.de>; Sat, 06 Jun 2026 02:40:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="ga8GN/7u";
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-602-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-ppp+bounces-602-lists+linux-ppp=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A18E1301C5B3
	for <lists+linux-ppp@lfdr.de>; Sat,  6 Jun 2026 00:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C94923394D;
	Sat,  6 Jun 2026 00:40:08 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B796233134;
	Sat,  6 Jun 2026 00:40:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780706408; cv=none; b=ux0KsHX9rcUD475s7IBwm8FN5L1eMdHJoRqScN6jj/c7aMht89eKfEo4Xz2kRh39YlJ8mawn7Jl2bYjbl2QPyl6bfZzdjinBgeuXZg3FFWoF816ql/wgUfzHACyPZVceYdj9QuDXDtd2TE2GdxToBVqptx/e72XmXl+qDAP0YEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780706408; c=relaxed/simple;
	bh=tQdR+hjJ0yRSIfMVMlI1NP/oKMERt6ndMwPbnVlrvuI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JJrRbGD8vVUS1hPts9azMR/DIZX6ubJxIgeef3C0ywI3+kab17q1152p8nOOle2m7RkDAG47RNxqyhg5lNNfUqvwQWOIqmUZJpeVRJW5caUTBgrK37owgxLNjAe7X19XQUP83NWCdxkR6R0Q8EQsesRMAVAIxZyA+5uCDl4FozA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ga8GN/7u; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84F21F00898;
	Sat,  6 Jun 2026 00:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780706407;
	bh=HcD+V9Q59ikLK7b0LhQsfLRO42Oh60ODLNOq3l1Ezgg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ga8GN/7u3NJfk/RBdYfz39H1Znfesk9aAsfEDyQM8RqOBag/37B2Kc8tP3cP41rXK
	 67QpPxIeuLV+kVyfitjd19Lksao1zmLOJB+Zb/Rb+2HZ0TeZO7Icsg8uCQGn2ztYbM
	 k5moKy9222y9MzLb1+nA/pIxmN/DZtMy2DAo5TSXxkh+56hcN2fe8/OT5X6kjDF1pE
	 perjPECWEyJnSWghtcMgqsfBYANFOGVT4FehYIc7zLsy6YLalT4/9r9Jp/x8joI6Gd
	 Is3fwsguulWctQ4OyJwOLSXECAtze0pgmNLnqB6sDFCr49k+tfgXKuvwOCy6xj/Top
	 jUTX+S36rz1Bg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568533930C06;
	Sat,  6 Jun 2026 00:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: net: do not detect PPPoX loopback
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178070640715.3971808.7329061490220298966.git-patchwork-notify@kernel.org>
Date: Sat, 06 Jun 2026 00:40:07 +0000
References: <20260603061746.23452-1-qingfang.deng@linux.dev>
In-Reply-To: <20260603061746.23452-1-qingfang.deng@linux.dev>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 matttbe@kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail,linux.dev:server fail,vger.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-602-lists,linux-ppp=lfdr.de,netdevbpf];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:qingfang.deng@linux.dev,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:shuah@kernel.org,m:linux-ppp@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matttbe@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68C8464C095

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  3 Jun 2026 14:17:44 +0800 you wrote:
> By default, pppd attempts to detect loopbacks on the underlying
> interface using a pseudo-randomly generated magic number and checks if
> the same value is received. The seed for the PRNG is a hash of hostname
> XOR current time XOR pid, which is likely to collide on NIPA, causing
> false positives. Disable magic number generation.
> 
> Reported-by: Matthieu Baerts <matttbe@kernel.org>
> Fixes: 7af2a94f4dcf ("selftests: net: add tests for PPPoL2TP")
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: net: do not detect PPPoX loopback
    https://git.kernel.org/netdev/net-next/c/2eb9a81a7f73

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



