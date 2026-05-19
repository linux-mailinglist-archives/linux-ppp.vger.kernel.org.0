Return-Path: <linux-ppp+bounces-587-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAutIqcgDGqiWwUAu9opvQ
	(envelope-from <linux-ppp+bounces-587-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 19 May 2026 10:34:47 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9107A57A353
	for <lists+linux-ppp@lfdr.de>; Tue, 19 May 2026 10:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C73B330E7A35
	for <lists+linux-ppp@lfdr.de>; Tue, 19 May 2026 08:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04D33E1CFB;
	Tue, 19 May 2026 08:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMOH+Gyw"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C263E008D;
	Tue, 19 May 2026 08:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178927; cv=none; b=XWtU/fmB1BwM62umNST8dul+teZgr4JrWHQ4MmF7FpHyARi79jAC+gx/7xi1rVYoJbOu3wcQHNyoTcvLqgrjiJjNWGKWDLo16OTndZYjltgv7FT3n5c1FSPX2dqB0ncLAlA406H9W1aW94ntbymIQZE0nKZxdAPXpxet4bXxJL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178927; c=relaxed/simple;
	bh=YN/NueC/tor3Ym7c9g0Cn60Rx3xpLTXKFWn08HBWXfQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HIh59522TniSxzlypWdKmTKxU7/r8dvhenLBJE93rRwq6LdnYr+qdjrQGSZJFRkA4S4pJr2+/gUMlcHw7BUpgZ94iJURYdNCIuoTPklZKhEqrQWL26kqaAPyV+n+PcyEmy98s1g5DSQ7DsWvhjSjjqzFfRQpR0VSNL9UL5on9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMOH+Gyw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7842EC2BCB3;
	Tue, 19 May 2026 08:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779178927;
	bh=YN/NueC/tor3Ym7c9g0Cn60Rx3xpLTXKFWn08HBWXfQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZMOH+Gyw7gDTDviVnVSr3mxcQk5YJ9y7i8Z3Rgi6WwMww/EjK/ayCGrvSemguUVz9
	 rAPzYK+LLVI2FjJK49r0tfKV1QjRPYHNMkMzjlvxLlWvBdXfZZ2HX4LYAvsoLLCwLb
	 08UOnotz/FCviDYIHMj3t7iwv7Fa3rg9Xi1LySeDJkQM+xuTWbqOgFr1wpOzTvtidD
	 oV0kuOcwfQ9ZRIVlojb1JsVj7YcJGDuIqMA8jCUGGd+K90zdqK0LuezK1VEI/xgRSM
	 ozEZQJf3iAig+r6kEF1yNQmdNzdTDhcqwoIVX1oyVb6ebNmQJSJKh6FY8ocIOgmQKP
	 VohuFQA01+Caw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AC53930DC9;
	Tue, 19 May 2026 08:22:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] selftests: net: add tests for PPPoL2TP
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177917893865.2164934.9404550668175304415.git-patchwork-notify@kernel.org>
Date: Tue, 19 May 2026 08:22:18 +0000
References: <20260514015743.37869-1-qingfang.deng@linux.dev>
In-Reply-To: <20260514015743.37869-1-qingfang.deng@linux.dev>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, fmaurer@redhat.com,
 bigeasy@linutronix.de, petrm@nvidia.com, linux-kernel@vger.kernel.org,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-587-lists,linux-ppp=lfdr.de,netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9107A57A353
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 14 May 2026 09:57:32 +0800 you wrote:
> Add ping, iperf3, and recursion tests for PPPoL2TP.
> 
> Assisted-by: Gemini:gemini-3-flash
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
> v2:
>  - use named veth pair instead of netkit
>  - reset RET prior to the recursion test
> v1: https://lore.kernel.org/netdev/20260508032158.67887-1-qingfang.deng@linux.dev
> 
> [...]

Here is the summary with links:
  - [net-next,v2] selftests: net: add tests for PPPoL2TP
    https://git.kernel.org/netdev/net-next/c/7af2a94f4dcf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



