Return-Path: <linux-ppp+bounces-344-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E80A8B34FD6
	for <lists+linux-ppp@lfdr.de>; Tue, 26 Aug 2025 02:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A01DD3A6AFA
	for <lists+linux-ppp@lfdr.de>; Tue, 26 Aug 2025 00:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620312C15AE;
	Mon, 25 Aug 2025 23:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EF+gcWJ1"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D3124DD11;
	Mon, 25 Aug 2025 23:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756166398; cv=none; b=Iqk0PWHyVVDssP/nKXiEwV50gspa1MbLELR66Pfzio3w6TxgpFC4B0CpgZJtRYkPUpDaZAPgwqTw0MDYhpdNh1OH9Q0TYs1vk2ntyC1Y3zf8k/vCSrBX7lX7G7epY1QT+LlRMpbsCo7rs+bdgOTq5a1NmK/SV3I2IZjpXIz0nSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756166398; c=relaxed/simple;
	bh=Kx+uNVzxjyH1EYgEofeMMEKSp9G6uluyOGjSNvMaTS8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bJ0jOyHsOfT8hDvMI2OzritER6pJCz0sCWsCBiCOVKlZUPh4w/M87Z8r1FIuCMmOnm4f4Uw6bwT+cBKvo0TQ7PafngTyK4+LOiZEoq9ZxAkOy5cP+aNo1ov/WeqJlorTfERPRauBd1kTNowgQ4vwbBXxZbrjP+MhW8tVFnTGPVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EF+gcWJ1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F82C4CEED;
	Mon, 25 Aug 2025 23:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756166398;
	bh=Kx+uNVzxjyH1EYgEofeMMEKSp9G6uluyOGjSNvMaTS8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EF+gcWJ1rDIWjlt9l5+pFp1CJdtRyLSVhbdU9C38/gIIls9Lmv7vsEgShWXPmJuk2
	 UkeRrRyP2/vaHdtB0B+s4DC8+mAregliJJCn5mb//faLOcO4Vw/PqwnT6idbDs6pZu
	 QVUymI6FUjSXAh6x/0ey3UD6Ox/lRq6C+PgSwUCnnApUFe8P9pPPSsx3aK5eqF7kuL
	 4r1L0lBqrrd+GOSIy9FOTVzeu7vR0DDjv7BSbT/KKol5INV3Sg0LwC2DwTMUkEdGvy
	 T5OZk1Noq+X+EBsZ+F4qgWYEGW0fOVEybHRaTQkIScJ439TEQep3SwqT8dXLJJFedO
	 qy6vrUoGy5GIg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B13383BF70;
	Tue, 26 Aug 2025 00:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] ppp: remove rwlock usage
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175616640601.3599990.16967946967905767902.git-patchwork-notify@kernel.org>
Date: Tue, 26 Aug 2025 00:00:06 +0000
References: <20250822012548.6232-1-dqfext@gmail.com>
In-Reply-To: <20250822012548.6232-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 22 Aug 2025 09:25:47 +0800 you wrote:
> In struct channel, the upl lock is implemented using rwlock_t,
> protecting access to pch->ppp and pch->bridge.
> 
> As previously discussed on the list, using rwlock in the network fast
> path is not recommended.
> This patch replaces the rwlock with a spinlock for writers, and uses RCU
> for readers.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] ppp: remove rwlock usage
    https://git.kernel.org/netdev/net-next/c/b8844aab519a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



