Return-Path: <linux-ppp+bounces-354-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95574B43F77
	for <lists+linux-ppp@lfdr.de>; Thu,  4 Sep 2025 16:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83C741CC11DD
	for <lists+linux-ppp@lfdr.de>; Thu,  4 Sep 2025 14:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACB730F817;
	Thu,  4 Sep 2025 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bay/nHaU"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0EA30F537;
	Thu,  4 Sep 2025 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996827; cv=none; b=UPxBOZcrz4w6ePvMLpebrHzSqLrw/8BiiHw5mpv2ul0wNXqIRBKZVEe+YOo292sH9XAutSWrxdeeIuhQld8tapt3HYF7uyM3Lx0MUma6aNWfUnaDuUVdfBRp/jasfa7EpHJo3WuhzMioFnv5HwwKhdWy6NaE08UWAEY03vIcmio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996827; c=relaxed/simple;
	bh=gleAdAzOsFym2Hc2Y991GAiL8VjCRYJCg0dJDfkRH1k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gE7ZVkk5U+o7QtFw4mNxq4Rfn73uPv+0Rvc3UOUUgJUYl2EQYLSL3ze+owrj3DWN0KFDdL5PXpg83rQ2BTtYu041qg/RqdM7c2axCkuZaCyq5Ztkm3/s9wXsaS51DiaVat1Aw+eEVGrLaTmPdXP0aj8VKmzbrimjn22ZaBTOmCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bay/nHaU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5CFC4CEF0;
	Thu,  4 Sep 2025 14:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756996827;
	bh=gleAdAzOsFym2Hc2Y991GAiL8VjCRYJCg0dJDfkRH1k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bay/nHaUrPXGlEeQHEzz/corxIf+8xCkDfWs5y2juEB5tGI5OCgHgRx9PGrVN9gnE
	 xMbjOiWGJB+Z5Uvyvbc3vb3Rf13xpbhMeCgMcCxTV67f7z/z8/4VNmldiuX78aqB35
	 3M9k+7I9K5BB3bK3qT3+w3jsNblDrrJlhxLVHnwWg1HcXz+nVn/FJavjLUaCYsvN8+
	 ab7C2OdAMMP3vjeX48zCY5MrAFw9ihIsEDVTdA9DSM8sFyZ1VQzeUBZYsImM+Ur+kj
	 4Tccqz4qr/B1yNxhpwMZtMYMU0wKZydPSScU9d1hyQP1X3bhBHziOa+k/nnX6t7+Tb
	 vU0csO2wmHeGg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DE0383BF69;
	Thu,  4 Sep 2025 14:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] ppp: fix memory leak in pad_compress_skb
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175699683199.1834386.17531266818421769906.git-patchwork-notify@kernel.org>
Date: Thu, 04 Sep 2025 14:40:31 +0000
References: <20250903100726.269839-1-dqfext@gmail.com>
In-Reply-To: <20250903100726.269839-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, paulus@ozlabs.org, Matt_Domsch@dell.com,
 akpm@osdl.org, Brice.Goglin@ens-lyon.org, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  3 Sep 2025 18:07:26 +0800 you wrote:
> If alloc_skb() fails in pad_compress_skb(), it returns NULL without
> releasing the old skb. The caller does:
> 
>     skb = pad_compress_skb(ppp, skb);
>     if (!skb)
>         goto drop;
> 
> [...]

Here is the summary with links:
  - [net] ppp: fix memory leak in pad_compress_skb
    https://git.kernel.org/netdev/net/c/4844123fe0b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



