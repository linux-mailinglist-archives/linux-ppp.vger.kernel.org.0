Return-Path: <linux-ppp+bounces-72-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E802392E37C
	for <lists+linux-ppp@lfdr.de>; Thu, 11 Jul 2024 11:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AE5828514B
	for <lists+linux-ppp@lfdr.de>; Thu, 11 Jul 2024 09:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3024156C6A;
	Thu, 11 Jul 2024 09:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5k3seFW"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DFB4D10A;
	Thu, 11 Jul 2024 09:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720690230; cv=none; b=ZfYwxjQRQ8A+VKcqYBWN33J51POAiLTSqgvppPu6SALpPV9kq53If2JwQ+/PV1LqQ6aWusLLDFuwwBxWZw59T8OqVLQpRDyLyBoq/7n93K0shnWagcZyLIpuRGAONi6P9/kCCNydP5Oyx5NteqcqHQAM/4D3eVm0bou/EdyNG1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720690230; c=relaxed/simple;
	bh=ywTLkqqfVbJW2/u8jHvqCMmKnHQSfF+3TqjTSfRYTAM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mYlIzf64cGvikC8n84ocf1yVJdFGCm7Wl2rJq8QaXTrlKKkCubR39gAvD+H1JR8TUd/Li9PZ21Sm81y1sGZFV953j0L+eWxdCMrl/yrLw4S4alA0eSu6HcCW6BN1xw4RaxcJOS39q6hpBnm+yJgnKUvZpUG8v8zKf74nM6QqfAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5k3seFW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6687DC4AF07;
	Thu, 11 Jul 2024 09:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720690230;
	bh=ywTLkqqfVbJW2/u8jHvqCMmKnHQSfF+3TqjTSfRYTAM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Z5k3seFWMMehZTHC4JmQLebKblw8m/s9jkchzTJwE3wV+nPaS2oUutFseywG8X9Ub
	 LMnMqyireBHqPAcUY+oEgOyYqTtjBPajcfSX6g7UsaPdJtz7+CH6IxxmK1NalZfUuT
	 vzN8boYjrrNrALSA6uLGdsQcUg16Y054W+ZNZ94/G/BWkZFEGvvvcQj326sfzqJkzC
	 ZNRD5Znfo8tSsIsQPmxnAa4K9Fqdj0uyCCVfIeEV9Khl6aQa5DFawqUe0vGb7tGcnp
	 WxwPKotwWpfL63HFXI2PsYptxed0CKO/sXodOfAi/UhcLIUgmzFvmW/zAgLpnja9jf
	 W9KfefsVe/mNg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4F186C433E9;
	Thu, 11 Jul 2024 09:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] ppp: reject claimed-as-LCP but actually malformed
 packets
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172069023031.13694.683839579477276296.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jul 2024 09:30:30 +0000
References: <20240708115615.134770-1-dmantipov@yandex.ru>
In-Reply-To: <20240708115615.134770-1-dmantipov@yandex.ru>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: horms@kernel.org, davem@davemloft.net, ricardo@marliere.net,
 edumazet@google.com, pabeni@redhat.com, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, lvc-project@linuxtesting.org,
 syzbot+ec0723ba9605678b14bf@syzkaller.appspotmail.com

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon,  8 Jul 2024 14:56:15 +0300 you wrote:
> Since 'ppp_async_encode()' assumes valid LCP packets (with code
> from 1 to 7 inclusive), add 'ppp_check_packet()' to ensure that
> LCP packet has an actual body beyond PPP_LCP header bytes, and
> reject claimed-as-LCP but actually malformed data otherwise.
> 
> Reported-by: syzbot+ec0723ba9605678b14bf@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=ec0723ba9605678b14bf
> Fixes: 44073187990d ("ppp: ensure minimum packet size in ppp_write()")
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> 
> [...]

Here is the summary with links:
  - [net,v2] ppp: reject claimed-as-LCP but actually malformed packets
    https://git.kernel.org/netdev/net/c/f2aeb7306a89

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



