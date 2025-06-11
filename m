Return-Path: <linux-ppp+bounces-297-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF2DAD6117
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Jun 2025 23:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 079303AB418
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Jun 2025 21:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD177246BD6;
	Wed, 11 Jun 2025 21:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgdA8olK"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0365246BC9;
	Wed, 11 Jun 2025 21:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749676803; cv=none; b=g9f7xyRybnoiNwWpYNsOMbYyplYuW/aKmJbFYCFULK4h0MNI/FJUgVKdLK6yceHR+mDFK+nxPank0aGftU7Eb6n0FgcvY6iDzPX2bkU3Rrfe5JJtlnXrPINSGrcyw3gJDmlUkh8gcTb/mvseQUhhEtdTh9pJ27vcQzMuMGIN9OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749676803; c=relaxed/simple;
	bh=CPYyCwG0Dux7us0Crce0/S48JKXEZaZ3Ex1aW1zFDmQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZSJ/73u40U6k/RbVxyi8zNo0m4tErnp0Pw7o2bmvN/tLn5gJmO60GVxLdYAU2NsJGyh4rkeUroImTZnlE10c9GiB0JSg5ll22yXrLoF7tugqhJ9FD560pmJ4j2/1415eM00wh6XVsRItbdSeVfjBfwfXCJ0qD4iVucbXukPSg8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgdA8olK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26358C4CEE3;
	Wed, 11 Jun 2025 21:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749676803;
	bh=CPYyCwG0Dux7us0Crce0/S48JKXEZaZ3Ex1aW1zFDmQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cgdA8olK1dLNc/O0SI4XLazPRzFdjnUvf9WN7lKwIHRUhHtSsStYalgtJtNk/i/vt
	 eC8mpNV5fnmAZFiBI5/IwbsjiemEt92iomKfvx84dI2Ndf0icMZY6PB20D5bvUAaUK
	 y/PAMiO9PLF2O1x69xiglYoWCl1K5tjTGm3UTAYAoE5Yx7a+f+kZJYmA3Ht93RZqsn
	 Z+DfDKNGOvRnbHwN4oghmETxXajrI1tbeoX/Kqdjogi9gFlblCJniZaSyED/ia1hrd
	 HDHyGCRh9BhcSHlMV4oMNFfIgC3y8T3RKX75L4oo5Jg1fgfwLMFChavT6YCtc9+Vuz
	 I4qaq4DlL2Ztg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D43380DBE9;
	Wed, 11 Jun 2025 21:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND net-next] ppp: convert to percpu netstats
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174967683325.3488937.12767579212904816682.git-patchwork-notify@kernel.org>
Date: Wed, 11 Jun 2025 21:20:33 +0000
References: <20250610083211.909015-1-dqfext@gmail.com>
In-Reply-To: <20250610083211.909015-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 10 Jun 2025 16:32:10 +0800 you wrote:
> Convert to percpu netstats to avoid lock contention when reading them.
> 
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
>  drivers/net/ppp/ppp_generic.c | 52 +++++++++++++----------------------
>  1 file changed, 19 insertions(+), 33 deletions(-)

Here is the summary with links:
  - [RESEND,net-next] ppp: convert to percpu netstats
    https://git.kernel.org/netdev/net-next/c/1a3e9b7a6b09

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



