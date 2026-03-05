Return-Path: <linux-ppp+bounces-405-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMUTMMZ3qWl77wAAu9opvQ
	(envelope-from <linux-ppp+bounces-405-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 05 Mar 2026 13:32:06 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EF87A211B55
	for <lists+linux-ppp@lfdr.de>; Thu, 05 Mar 2026 13:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35116304CEBA
	for <lists+linux-ppp@lfdr.de>; Thu,  5 Mar 2026 12:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D4239F195;
	Thu,  5 Mar 2026 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luusVf07"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E079839E18E;
	Thu,  5 Mar 2026 12:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772713806; cv=none; b=rZFnJF9unuVWhEQLjJbu5XbYBkRQjYBbAA5rEaYI/i3rht04c1vs7EeB0KA9l8ubbMG+7icpyvHM2XkxK3+QxAHFYCNZsW2pCPlx4g3prLqehewz4dJJjvnUmbK5WlMEvKxtpI1uRRls8SDY+Og494fJVWiaeEONm/pWSGbVWxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772713806; c=relaxed/simple;
	bh=poAVede96LP674ONf99lCG+hUDcd0+e+s87wP69kF9Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gQJ8lO0miFjc4aSjjxsY5SCUH0OiMmTd2KlxKN/81Lnvbgd34Q+EpU2FeMOhoozHQ259Y58N4YicR1joFiJdUgJHpytE1Cm3qj8ajtIAqyuMHTLzpuu/m18FA/UF5ZZb59nSkgEank99yogdsh3Xe7+2wEyQXD2LxmZuvfSz59E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luusVf07; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC70C116C6;
	Thu,  5 Mar 2026 12:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772713805;
	bh=poAVede96LP674ONf99lCG+hUDcd0+e+s87wP69kF9Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=luusVf07NiDcoQhwc99vd2+fvyN6Fl1AZCVHOypvi7SIHn2jWjKvxn44Pvi1FQs4H
	 zLVkSAYNtRmJUSfZFFZsThrADjHaiqAU5OvdEReKjGJzeVDxeJh+Ua8VBwDw5mvPmL
	 OpfoAGhKyq1gqEbWSoXCpjgr5sCEyFzY5bXBgJGbP4qfmqHmKZbaast8JWCYh54fwT
	 MiLLwQPPwbA2gcn4LE8Y0Zg5a5LWFInKE+ne2HxYKAlZp6eKtCnQDvz/wjgI8R+aVv
	 /c52NtvaT2nEXn0HK9s2mvQOE/urzFAVGealsY85x5K3FZ7bJib6YuJdXy0C2vBoYg
	 Mi2QZl2TNpgQA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F193808200;
	Thu,  5 Mar 2026 12:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] ppp: don't store tx skb in the fastpath
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177271380555.2685064.10682910363153938001.git-patchwork-notify@kernel.org>
Date: Thu, 05 Mar 2026 12:30:05 +0000
References: <20260303093219.234403-1-dqfext@gmail.com>
In-Reply-To: <20260303093219.234403-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-ppp@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 vadim.fedorenko@linux.dev
X-Rspamd-Queue-Id: EF87A211B55
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-405-lists,linux-ppp=lfdr.de,netdevbpf];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue,  3 Mar 2026 17:32:19 +0800 you wrote:
> Currently, ppp->xmit_pending is used in ppp_send_frame() to pass a skb
> to ppp_push(), and holds the skb when a PPP channel cannot immediately
> transmit it. This state is redundant because the transmit queue
> (ppp->file.xq) can already handle the backlog. Furthermore, during
> normal operation, an skb is queued in file.xq only to be immediately
> dequeued, causing unnecessary overhead.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] ppp: don't store tx skb in the fastpath
    https://git.kernel.org/netdev/net-next/c/70836c8d0fe0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



