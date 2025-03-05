Return-Path: <linux-ppp+bounces-279-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B77A4F372
	for <lists+linux-ppp@lfdr.de>; Wed,  5 Mar 2025 02:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2374E1890574
	for <lists+linux-ppp@lfdr.de>; Wed,  5 Mar 2025 01:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7967215C140;
	Wed,  5 Mar 2025 01:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iufN0Lw6"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5D61419A9;
	Wed,  5 Mar 2025 01:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741137612; cv=none; b=msIqpbtyT0NVZ2XIhQi0TFjRrCM2NAkPkB5GUT7b7xT722OQ4wkC70rnw2S53hpc43tsqPO3Z7e0/ZKjbuoMJS3Uir8FzcAXFVIv92o1ktXqvF5BCmAnaaqCD9JfcLmsOlmnHf5Hp4UbqD21DjPXVzHHGEIpwVHfQC7xxyaiZao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741137612; c=relaxed/simple;
	bh=MSS/JdgW92nxdpIvMZcx07EC8dF0EuO/iKJG8Zc6ngA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WfDKhpGr8mG4u67NK2xHmQOglXNz8Uq3nJFIPrB1AKmifaVeyQd/bWiWkq/KXrEfH53iCgCRaffgszx4dUcWbeceD50NxJBEdwcB/y8iu1Q8BzD+Qciv9M+t4N9IlEhxJwr0JL01rVZ4AOvZjwQESpHpO09oTZ12z+H/2k/s6s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iufN0Lw6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2AB2C4CEE5;
	Wed,  5 Mar 2025 01:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741137610;
	bh=MSS/JdgW92nxdpIvMZcx07EC8dF0EuO/iKJG8Zc6ngA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iufN0Lw6kEiZz7LNwlF48sD/y8MXg4QoxzugimDaFaMdcswdunyiin9dNLG/KKU6P
	 SoMXr9mBpH+qvdFwnbJ3Z45sbhTT+jWZb9wACwZxDS7634FEYrP6zHxQo9tfopess1
	 CuirDuTRsE6AYRDbS5vxs2P0DgCkeCTBCMkIvw61NI9+emzS/066dN0aD3PuCMYLQj
	 uZIRD7SrH4V6ccb/wW5dm/z34s5t09UtscKuPa1vyG45T74N8cbnvZ4/+M/1GfMqRP
	 F3Ro6jYgnByVQlkk4HaHLaYEYkCfKcSrXxjXr5y2HuIfdklbRVj7mmVXx06DlG43F7
	 zSeXM1iMd/D8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF7E380CFEB;
	Wed,  5 Mar 2025 01:20:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] ppp: use IFF_NO_QUEUE in virtual interfaces
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174113764348.356990.15690869237633709247.git-patchwork-notify@kernel.org>
Date: Wed, 05 Mar 2025 01:20:43 +0000
References: <20250301135517.695809-1-dqfext@gmail.com>
In-Reply-To: <20250301135517.695809-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: toke@redhat.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mostrows@earthlink.net, jchapman@katalix.com, horms@kernel.org,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat,  1 Mar 2025 21:55:16 +0800 you wrote:
> For PPPoE, PPTP, and PPPoL2TP, the start_xmit() function directly
> forwards packets to the underlying network stack and never returns
> anything other than 1. So these interfaces do not require a qdisc,
> and the IFF_NO_QUEUE flag should be set.
> 
> Introduces a direct_xmit flag in struct ppp_channel to indicate when
> IFF_NO_QUEUE should be applied. The flag is set in ppp_connect_channel()
> for relevant protocols.
> 
> [...]

Here is the summary with links:
  - [net-next] ppp: use IFF_NO_QUEUE in virtual interfaces
    https://git.kernel.org/netdev/net-next/c/95d0d094ba26

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



