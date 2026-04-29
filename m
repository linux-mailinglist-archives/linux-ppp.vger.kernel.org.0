Return-Path: <linux-ppp+bounces-547-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KErAE+lh8WnhgQEAu9opvQ
	(envelope-from <linux-ppp+bounces-547-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 29 Apr 2026 03:42:01 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A0148E0BD
	for <lists+linux-ppp@lfdr.de>; Wed, 29 Apr 2026 03:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9151F301D3AC
	for <lists+linux-ppp@lfdr.de>; Wed, 29 Apr 2026 01:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5840325B2FA;
	Wed, 29 Apr 2026 01:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ulrLN2sY"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1812571C7;
	Wed, 29 Apr 2026 01:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777426869; cv=none; b=HZMgV20Ulwfdogbb+urGsOstoRDfDehUyBW/OP+YBo0zRPLvJVGbCs08JnjkJ0Mk5+OeOxzAnKbrenzFXMuBvXvftVI4McKzY+exIYHD2OQDeuyTc/V3o0au1aKdH7MhtzTcJ/uUot65N6NBlSsNzCzV84m/6NnS7FLqHEicr3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777426869; c=relaxed/simple;
	bh=ZufN4XiT3cEF3/MnkweTt+1XxyC1FpruRMf/3bTu5sY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DiAvjZlyaCCYNFc7DeAgQbkLfbEC5jT/ddgjfZJEaCRsH5QEypi85x8fvG6Os75Os3Ie2eMyCuX391i7/t0ib2iAAORXgEAwtBSH5Co+1b8JrzrrVGdtZOQ4R9gPdrdbHFr6morSLMGmXA9N3H+BYapLlrlzYOhpFAni2Vc5R1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ulrLN2sY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA75C2BCB9;
	Wed, 29 Apr 2026 01:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777426868;
	bh=ZufN4XiT3cEF3/MnkweTt+1XxyC1FpruRMf/3bTu5sY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ulrLN2sYRdRw10f88Xd+A0bNorZTVDpY9x4g6DQAONVa/Hf71NRuvJ8ZsRrZI/RU1
	 Vw2TFc2UFO7kKnfqJuOyXC5VQYm3OOo8baS2E12jKin7fjf56BeiM7HTaizAnUjD0E
	 JH47Pjftu5I6fVpUImlOmII/KsTuFs/iTAocACknzCc7pFkH8/4P7RYU5o4GVyMr3G
	 bMX0ceF85/F+o7EGq1nPwVtT32OSaRBPPv86DbylBl8mgTtQOzGaGW7rs5735r10y+
	 +jQN/tXzsrAnjYr+u8D+T1LJeU7vVaBLLm3607wuhgZkEbgY02EOoFeu+fnFh3gyAy
	 keG7QSteAMEGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDC539302C2;
	Wed, 29 Apr 2026 01:40:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] ppp: add PPPOX symbol
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177742682479.1291511.12607684897778641027.git-patchwork-notify@kernel.org>
Date: Wed, 29 Apr 2026 01:40:24 +0000
References: <20260428012830.3069-1-qingfang.deng@linux.dev>
In-Reply-To: <20260428012830.3069-1-qingfang.deng@linux.dev>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, julianbraha@gmail.com,
 ebiggers@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ppp@vger.kernel.org
X-Rspamd-Queue-Id: 52A0148E0BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-547-lists,linux-ppp=lfdr.de,netdevbpf];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 28 Apr 2026 09:28:26 +0800 you wrote:
> Add a dedicated CONFIG_PPPOX symbol to handle the PPPoX generic module,
> avoiding redundant pppox.o definitions in the Makefile.
> 
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
>  drivers/net/ppp/Kconfig  | 6 ++++++
>  drivers/net/ppp/Makefile | 6 +++---
>  2 files changed, 9 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [net-next] ppp: add PPPOX symbol
    https://git.kernel.org/netdev/net-next/c/09942ddedcb9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



