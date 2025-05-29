Return-Path: <linux-ppp+bounces-295-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8978EAC7BD4
	for <lists+linux-ppp@lfdr.de>; Thu, 29 May 2025 12:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5384F16C090
	for <lists+linux-ppp@lfdr.de>; Thu, 29 May 2025 10:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05825278744;
	Thu, 29 May 2025 10:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ew0s0ZO2"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8DC26B2D7;
	Thu, 29 May 2025 10:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748514916; cv=none; b=pMNTBGvxcyeJZpYAIbJYLNB7U5ykJqMSplz94D5bqRlmbxXmpe8D3GRE5nSD8KxUqLaRdrgi5IVQjbPzggpcu9+i8UGR6WmvbwzBSVtkSgRPsNAfoGpskv9c+TqQQLF96lzyudAvweNPZHHH+lpOPTFn0dLEX+PGnVHyTaBkW3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748514916; c=relaxed/simple;
	bh=hB4q6DbdzCPTadexTJ+gJgVNRa0VS7ElVWA1w8+W7As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4uLunVwIDTTZUFo5XaQGD+vXb7ELe9zaf/QhR97q2/vGlharn5GWdzgUv7aMhM0ktmsMpk76jnS3d5e6kmi6e3POrsv10C+ThjujCotAi5CyuDArM1iqwrj756QwlChxEpHCnLSWPaYr4SObsbX/rNN8jrvfeZcBSJA/+gX1l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ew0s0ZO2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03284C4CEE7;
	Thu, 29 May 2025 10:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748514916;
	bh=hB4q6DbdzCPTadexTJ+gJgVNRa0VS7ElVWA1w8+W7As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ew0s0ZO2G7P5uoFmPJeKrzjjTlhaa3PAclowyFXYt1AOF32x9wQF6XTp5l3mROQjV
	 N26phEsrOanKkp3o7sPHuy9g6A5wfcVm4lE1izS4tAu5viLugH2geL1vDedz0Ob8A1
	 fUenCb+cmuscrMFAuoDZKaIFEpXLZb/kuHPURL0ng5DF7nMtnt0PUtPB4OF9X/3uBB
	 XsWNNJfYl5cwRZnX5DI2Up5tEKX6DGjExo+fGWxnZMHOdTx/mlL52nEiKr7EVTjDaG
	 OWTWn69FJdIAxtYJKNuQkA9LL/7y2YHoS7EkVCdES2ZDz0myBdtneMg3ctH2Q+WzrC
	 wki+c4eM4GPJw==
Date: Thu, 29 May 2025 11:35:11 +0100
From: Simon Horman <horms@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-ppp@vger.kernel.org
Subject: Re: [PATCH net-next] ppp: convert to percpu netstats
Message-ID: <20250529103511.GO1484967@horms.kernel.org>
References: <20250529092109.2303441-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529092109.2303441-1-dqfext@gmail.com>

On Thu, May 29, 2025 at 05:21:08PM +0800, Qingfang Deng wrote:
> Convert to percpu netstats avoid lock contention when reading netstats.
> 
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>

## Form letter - net-next-closed

The merge window for v6.16 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations. We are
currently accepting bug fixes only.

Please repost when net-next reopens after June 8th.

RFC patches sent for review only are obviously welcome at any time.

-- 
pw-bot: defer

