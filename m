Return-Path: <linux-ppp+bounces-291-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2D2A83F16
	for <lists+linux-ppp@lfdr.de>; Thu, 10 Apr 2025 11:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BD0D16D06F
	for <lists+linux-ppp@lfdr.de>; Thu, 10 Apr 2025 09:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C8825E826;
	Thu, 10 Apr 2025 09:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhUzfkxE"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D601CCB4B;
	Thu, 10 Apr 2025 09:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278001; cv=none; b=SaEef8Jz3ExIfpWWMu286OWvNrnfENBD3xK/Pw6/q+BjnuhfQGGN+Sb4zyAfNve072RQGQVMFyeGF+0KXgWxKJub8FIbtHBDyQk9PaifzDEnKgZSpEYQUs93VsInFrh2q3fjZg7MkUBf7oFjf7NWtKA0YvODR+QyF6FFRXmYzLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278001; c=relaxed/simple;
	bh=MAu1DECHj25V6I4N9Am9XeeLIjxrKp5jFnmeWvx2Sno=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pIhg5HTWOQV0x0cq8dhNcX5/G6+RSv8V39Uj4MX8yPIbGxWtEQr6S08vnhSgxC0La8TQkkumJXYiJHl9GNt4Pv6jqbnmiApJeevWvdvY58O6idOCtu/MZmxNZldnmUeNljxlUuH4Hisw38l5gzbGd9kepJak00OVuGfRTfW0d38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhUzfkxE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00225C4CEDD;
	Thu, 10 Apr 2025 09:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744278001;
	bh=MAu1DECHj25V6I4N9Am9XeeLIjxrKp5jFnmeWvx2Sno=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QhUzfkxEOHibgUPVAWs1AGISKVnTO3FCXXkAJQdhSom1zG9/DzQFT99SR2hD8pd/5
	 85o7+gv6v8vHX5Qsjbh94hNbd5ncG131xPxm7VR/8PLzAVJKDTE5bp3ZkK1DTR7kY1
	 rQQVHsJ726ZrJLem8b9U5wSaqbrysrRHo7GklQUgNdKYmOsguL+Uu6CFMlj/a5kS31
	 1FPpUwpOhWolFW2O7n9vgCFYpOU4y+rqvWwLTK1hyO6DIODa5EEPDD92X1LNBOQ5AU
	 30N3bUyY/+Ei68ISlj6MEQmyGwHIOHIJlSvI5I/RsAsNtNaKZ0N//2IQH5WoKfd6os
	 PlbQtgNw1GqzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AF957380CEF4;
	Thu, 10 Apr 2025 09:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: ppp: Add bound checking for skb d on
 ppp_sync_txmung
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174427803852.3591786.2538899437111580046.git-patchwork-notify@kernel.org>
Date: Thu, 10 Apr 2025 09:40:38 +0000
References: <20250408-bound-checking-ppp_txmung-v2-1-94bb6e1b92d0@arnaud-lcm.com>
In-Reply-To: <20250408-bound-checking-ppp_txmung-v2-1-94bb6e1b92d0@arnaud-lcm.com>
To: Arnaud Lecomte <contact@arnaud-lcm.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org,
 syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 08 Apr 2025 17:55:08 +0200 you wrote:
> Ensure we have enough data in linear buffer from skb before accessing
> initial bytes. This prevents potential out-of-bounds accesses
> when processing short packets.
> 
> When ppp_sync_txmung receives an incoming package with an empty
> payload:
> (remote) gef➤  p *(struct pppoe_hdr *) (skb->head + skb->network_header)
> $18 = {
> 	type = 0x1,
> 	ver = 0x1,
> 	code = 0x0,
> 	sid = 0x2,
>         length = 0x0,
> 	tag = 0xffff8880371cdb96
> }
> 
> [...]

Here is the summary with links:
  - [v2] net: ppp: Add bound checking for skb d on ppp_sync_txmung
    https://git.kernel.org/netdev/net/c/aabc6596ffb3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



