Return-Path: <linux-ppp+bounces-327-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D782CB08E84
	for <lists+linux-ppp@lfdr.de>; Thu, 17 Jul 2025 15:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F33B1C21C43
	for <lists+linux-ppp@lfdr.de>; Thu, 17 Jul 2025 13:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1903A2F5C42;
	Thu, 17 Jul 2025 13:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hX/AAyQm"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9732E717F;
	Thu, 17 Jul 2025 13:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752760189; cv=none; b=g0qlWOSH+qIEkSGOeLtS5scobac95X03cwbe70LZMOesgzXCNbQvBE93aqK8w3RLMjMCL58tu3XbSqiA8EKz5wIsXz6Zy6U7BSqiRfCIJ+Da8rEa3lw1sTzKhFigNynT8mubOQzK/auMTufcE6ZVQnPnACy/3oHMPrey19vjw2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752760189; c=relaxed/simple;
	bh=K/3Scayq19Es8s/9Jdt6wD8T2mCtzA3U01d434/zRbI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Fk4r8zFXMCzEjdORupLMR/uayhlJf4R/lDpcQ/ZQQ2YmA4LyZeItyt+DbgGQa6EDTEuuS1zrMay6MQgviCRkP+O3Wd7EfQdx1mwMwAoNduGqdyPlkirJlm3iI+AhmXm95WaIIVj+OJQPFBSX3dOpJixPFvE+4yM6Cs8UUNg4qoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hX/AAyQm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69821C4CEE3;
	Thu, 17 Jul 2025 13:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752760188;
	bh=K/3Scayq19Es8s/9Jdt6wD8T2mCtzA3U01d434/zRbI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hX/AAyQmLCMys0JUo5EB5pbM/q4c8Ra9qlQj7B0dZlYeqfnEW1gL+jPuQSjsRcVau
	 Y/kbqh8XE4KR6H/vUCOs1nt75N7O4pdpCb9jYOCVboF5At2eZed+tKAY51+v1v+YZY
	 ZPkDvGBVFsolRgdqJ/3QOrpSX/PflWb4J5xEiNnGJoDQQs3wPOqREktS1nqwjYGuG3
	 HZMK24O1MsvOJf2hY6gz58CC+/h/FZMwF0FihahO0e1VH0EPh+3MK0exr7q5nZRzoL
	 kS/9IdW8/wghxyUF/qGdHF6wRpZ81EOQgM2DLmrUbYczgDJo4fAilx1LzmAtjK4AAH
	 ymRLrc41EZSnQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE0C383BF47;
	Thu, 17 Jul 2025 13:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/1] ppp: Replace per-CPU recursion counter
 with
 lock-owner field
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175276020851.1941871.13592848433216998317.git-patchwork-notify@kernel.org>
Date: Thu, 17 Jul 2025 13:50:08 +0000
References: <20250715150806.700536-1-bigeasy@linutronix.de>
In-Reply-To: <20250715150806.700536-1-bigeasy@linutronix.de>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: netdev@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 linux-ppp@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
 clrkwllms@kernel.org, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, rostedt@goodmis.org, tglx@linutronix.de,
 gnault@redhat.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 15 Jul 2025 17:08:05 +0200 you wrote:
> This is another approach to avoid relying on local_bh_disable() for
> locking of per-CPU in ppp.
> 
> I redid it with the per-CPU lock and local_lock_nested_bh() as discussed
> in v1. The xmit_recursion counter has been removed since it served the
> same purpose as the owner field. Both were updated and checked.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/1] ppp: Replace per-CPU recursion counter with lock-owner field
    https://git.kernel.org/netdev/net-next/c/d4f6460a4bc5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



