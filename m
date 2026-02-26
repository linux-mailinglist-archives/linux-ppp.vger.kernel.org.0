Return-Path: <linux-ppp+bounces-398-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qODzD3wloGkDfwQAu9opvQ
	(envelope-from <linux-ppp+bounces-398-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Feb 2026 11:50:36 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA851A490B
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Feb 2026 11:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F0D7303C510
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Feb 2026 10:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5B731326C;
	Thu, 26 Feb 2026 10:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uv3fsZ35"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC204302750;
	Thu, 26 Feb 2026 10:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772103001; cv=none; b=LFBZad4JMsfZElDL1dvzvB1xSGA3K1RxUuXXce8/KO7FPJbWbXMyu+HGq1iCauiEPK0O439vGpQMQ7U1KUrZxEPMHKUJc7oZmLL9gO/sYWyhRe/ZnNkqTYnqABGNTFB+FRfywzb3omZBjIDx5MOLhUgrRFg8mpon95w1oHKxgjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772103001; c=relaxed/simple;
	bh=yBc1ONjHVs8fE3/TzFTUJPx1TRYa2MebbGxJxD4lnw0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cQLhM9fkFj1Czl3W4tT3X5O8c2NgBljLXwT54quDAsjDmzIV28lQLV0fSTWuWg594oOIsWui5yH6GBGOyLJm0p/J0sxDe40mReuzXCc9xYU2cce2UmJfAQ6suiXvD74taENkmOp9BvpMUr8MyjqRtUGeFldwvvUChdl6VTvTw3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uv3fsZ35; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8545C116C6;
	Thu, 26 Feb 2026 10:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772103000;
	bh=yBc1ONjHVs8fE3/TzFTUJPx1TRYa2MebbGxJxD4lnw0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uv3fsZ35yUo/v/j9AAL5Jti6YW9lsK7HJ7Nd/eC0ueYnm/1hWn3u5tcOq3OTvpDdX
	 g/1iRxEe3qccmgsMi8CAeAp5l2SvultSb1cFnyacQnCsHgUOK7kDr9BkdKtrenKUx/
	 b8iVtZILxaohKqfdRMbkWGPHwhh99nh0RANUYjxHwuqU6bhOZMB5Q+6B0B8VDCJzwW
	 x0Jv35UGiSJl1fUm+TDdcoIyodkJB0rL3rj9anMR1ETzu9IYnXjPbMq3kkCstt+wzl
	 oN/hi4Pz7u6CvXhUJ/bvuq5pi90VqMEPp9UrGhY1pqqXX5pGqWyQQX6uB0OtUBNSnh
	 OagBVMbIGTc4Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CDF73930903;
	Thu, 26 Feb 2026 10:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] pppoe: remove kernel-mode relay support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177210300529.1158350.17223286559184798154.git-patchwork-notify@kernel.org>
Date: Thu, 26 Feb 2026 10:50:05 +0000
References: <20260224015053.42472-1-dqfext@gmail.com>
In-Reply-To: <20260224015053.42472-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-ppp@vger.kernel.org, mostrows@earthlink.net, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mostrows@gmail.com,
 dianne@skoll.ca, paulus@ozlabs.org, jaco@uls.co.za, carlsonj@workingcode.com,
 arnd@arndb.de, gnault@redhat.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-398-lists,linux-ppp=lfdr.de,netdevbpf];
	FREEMAIL_CC(0.00)[vger.kernel.org,earthlink.net,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,skoll.ca,ozlabs.org,uls.co.za,workingcode.com,arndb.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AFA851A490B
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 24 Feb 2026 09:50:52 +0800 you wrote:
> The kernel-mode PPPoE relay feature and its two associated ioctls
> (PPPOEIOCSFWD and PPPOEIOCDFWD) are not used by any existing userspace
> PPPoE implementations. The most commonly-used package, RP-PPPoE [1],
> handles the relaying entirely in userspace.
> 
> This legacy code has remained in the driver since its introduction in
> kernel 2.3.99-pre7 for over two decades, but has served no practical
> purpose.
> 
> [...]

Here is the summary with links:
  - [net-next] pppoe: remove kernel-mode relay support
    https://git.kernel.org/netdev/net-next/c/15c9ed1d8286

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



