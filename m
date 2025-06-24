Return-Path: <linux-ppp+bounces-300-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5494AE7357
	for <lists+linux-ppp@lfdr.de>; Wed, 25 Jun 2025 01:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A218717FA04
	for <lists+linux-ppp@lfdr.de>; Tue, 24 Jun 2025 23:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7293626B094;
	Tue, 24 Jun 2025 23:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tN5zKH1A"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422932236F8;
	Tue, 24 Jun 2025 23:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750808382; cv=none; b=EInIIH3CPF6YWYIcoHjaXDIcyZ8L7Yk9BsAVA4ShZdcLexpGORVh/S1V9g++Smqw186iQGcoo0OwzYUGlhYqasBpy+yDMyW3UwKcoc/1fyf94yQJe/QuXR9uu4tcsrQqo8B5EXcx4eu2SuoVM2Jhawd1Yhi3ByJ+22GJ1VzDzq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750808382; c=relaxed/simple;
	bh=Ctn9ZO/Vaog3ZEn6cNs81uaFrkS/cOiLHfLO1oAws+s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Buqsm2FwUKQpjQbbpANLZnjS9ixLYA1wPTFhYmILzu7CdI9mM6ctse6f8OSjop7R3TRbrq84XGd9qSlQCpbeAnV55iZ+0k3KZkJUxL0rPFIA4GwJZ0vR569dO9+OxPRT0iFl1U89GC6YD9AJttHsmPnnzWDKjEHbfqRnQ0vLt44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tN5zKH1A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78ADC4CEE3;
	Tue, 24 Jun 2025 23:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750808381;
	bh=Ctn9ZO/Vaog3ZEn6cNs81uaFrkS/cOiLHfLO1oAws+s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tN5zKH1AjWnJSvlpUNZ9VJDVzwvmJT3itb3/6yG4f4xEOqrczD0iUbTN1JANEhV4g
	 Cpqq8b+IS6wI8xiD+2DLYHzlc93l+iqLNbbsvBylL5+jAV/voplaA0FDlh5DKrL+Nx
	 4zzRA+2fOisS0fofIUwi9ZQirTmEOCcyAqx8DSz0Bimc6lM2cPBayKRhdZQS/OxSKn
	 P2gPAx5Mm1FSxy2NfTlJt3FcFmfBQKQ7HaqdNLR96v3BnxZ8/VWg4py4AGpvAoNkV2
	 jyrDXWk83OvwX+lGEHSWiWb5TGve23irnEgnUnToSuSk2tTE84uGyzNoCzVMudspuB
	 g1w3wGcVcuYog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCED39FEB73;
	Tue, 24 Jun 2025 23:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] pppoe: drop PACKET_OTHERHOST before
 skb_share_check()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175080840824.4073187.6601306669663226829.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 23:40:08 +0000
References: <20250623033431.408810-1-dqfext@gmail.com>
In-Reply-To: <20250623033431.408810-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-ppp@vger.kernel.org, mostrows@earthlink.net, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 23 Jun 2025 11:34:31 +0800 you wrote:
> Align with ip_rcv() by dropping PACKET_OTHERHOST packets before
> calling skb_share_check(). This avoids unnecessary skb processing
> for packets that will be discarded anyway.
> 
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
>  drivers/net/ppp/pppoe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [net-next] pppoe: drop PACKET_OTHERHOST before skb_share_check()
    https://git.kernel.org/netdev/net-next/c/7eebd219feda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



