Return-Path: <linux-ppp+bounces-426-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGZ0DMLkuWlePQIAu9opvQ
	(envelope-from <linux-ppp+bounces-426-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 18 Mar 2026 00:33:22 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA252B4623
	for <lists+linux-ppp@lfdr.de>; Wed, 18 Mar 2026 00:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9E6D3047046
	for <lists+linux-ppp@lfdr.de>; Tue, 17 Mar 2026 23:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F2333987F;
	Tue, 17 Mar 2026 23:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3Ey/kIg"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D679A31A56D;
	Tue, 17 Mar 2026 23:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773790213; cv=none; b=pU1r3jPjYISSU0ZNCu5rA870TooOC8soTAuEZTBIjbPagF2C8rKkoookmfHmrJlKUIDqg4BkZ7yOUX+7TPXyhqprfELcrnZg+hA9HlyfCG6yfsErK1+iSBz7BPVzViCdxJkqhNHRsQzu3RfoYi6Dm48vSCF6IpTsV5CVy18jarE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773790213; c=relaxed/simple;
	bh=R0B0JN2T96Ej4WALfTP/jxDOu9BQUqGiEft9Bf4XhLE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dzs0xvGexAtiyR6D8d3a1opiqxjUgi0h6A4A9pqOzqSBaUq+v6ZbjxEgFNtY5/T+1C7bWDdAwwb6/B/V+q8TJnkLwcoslk+H67wZCY+9/YDcoKGXQ4ZFNSgqCIjjd5CQ9r6Rdxb3m96OOmd/2UERCsxJGv84Zr1VONMD1E04W+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3Ey/kIg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71282C4CEF7;
	Tue, 17 Mar 2026 23:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773790213;
	bh=R0B0JN2T96Ej4WALfTP/jxDOu9BQUqGiEft9Bf4XhLE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=l3Ey/kIgnjISSLaApZaC51j0zWpLoHz9u+ZC7J9jIrmzW/BMT6l9osJB8+J2RkQX7
	 2elXqQ0mt5LXNZW0/q8+duQFzIHKisaRKBg1T2Qk8yVRAXWLDIZ2Cx1rkjhfERo1Lt
	 agWOwVyVm7/H7EWNgHQ4vXyiZWM5/t/j4uwmmFticXpbyTZ+9lNBmIYNA0lvkk1bDW
	 ZZmDVZcanaVeKHw1dtVk5aukcHgaQt+CdlTBqZxD1fktA1maIwTVprvCuAb4qiacOc
	 n6/hywqLUTqhX19PNwL+JABvrIzteIk0c6YLeq+JfNUYGtcEsDPfwcmt0CzsUL6tw5
	 svO2IfzuLtNhQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA0873808200;
	Tue, 17 Mar 2026 23:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] ppp: require callers of ppp_dev_name() to hold
 RCU
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177379020554.55920.7311741308449112878.git-patchwork-notify@kernel.org>
Date: Tue, 17 Mar 2026 23:30:05 +0000
References: <20260316092824.479149-1-dqfext@gmail.com>
In-Reply-To: <20260316092824.479149-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-ppp@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, jchapman@katalix.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-426-lists,linux-ppp=lfdr.de,netdevbpf];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7DA252B4623
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Mar 2026 17:28:23 +0800 you wrote:
> ppp_dev_name() holds the RCU read lock internally to protect pch->ppp.
> However, as it returns netdev->name to the caller, the caller should
> also hold either RCU or RTNL lock to prevent the netdev from being
> freed.
> 
> The only two references of the function is in the L2TP driver, both of
> which already hold RCU. So remove the internal RCU lock and document
> that callers must hold RCU.
> 
> [...]

Here is the summary with links:
  - [net-next] ppp: require callers of ppp_dev_name() to hold RCU
    https://git.kernel.org/netdev/net-next/c/bb8539e0e609

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



