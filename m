Return-Path: <linux-ppp+bounces-109-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6379C094F
	for <lists+linux-ppp@lfdr.de>; Thu,  7 Nov 2024 15:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FA0B1F24A47
	for <lists+linux-ppp@lfdr.de>; Thu,  7 Nov 2024 14:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6637212EE3;
	Thu,  7 Nov 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0ONpL7H"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B13B2E3EB;
	Thu,  7 Nov 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730991089; cv=none; b=DQDq9Oc63cjv+Ii1QC05fpUZUkz8UzAQo7tdJXEMvO4HPF/11lVkGA02BC5uwLMrEfejVm5yG4enIeq9eB4xXslaI8FZafMlBFb8awWaZ9vA6c7KMAMwy6FYGFxeDMsvarKfk+ECeaXOB2NhLET6CXUMC6C6OkEq1ZDYtHqpudQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730991089; c=relaxed/simple;
	bh=UDbLjDFZkSXWs8RR2rQ1qcG0qwDdYETzsAFRQPzaaxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdzUYKRSH1XXgR6jTvNuKgxEwfqU+VPAv7IbUNr5qlFOmRX/fIdUScwHIkAASG9BDrvVZjcELJesUaLUDsBb2GnEV5BvVM/EEPoyns3N+ILj6EYSTSx2q2uXMlgRIsVkmWSZY6yugrIBKXPQN/BkxS00JjnXr4TORS7WWhKoInQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0ONpL7H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3496FC4CECC;
	Thu,  7 Nov 2024 14:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730991089;
	bh=UDbLjDFZkSXWs8RR2rQ1qcG0qwDdYETzsAFRQPzaaxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P0ONpL7HT6MEULaIh/I4FgYG7ge9soJcQdKCiqEX9r/Rg9EIi5htmXMPhQ2oL9JJ5
	 TFFj6fjVpa+sdyhz/XBxpc9UARMq6CIIDlrDMMqKZ/vqNzPkgtlTt/mMRZhpJeZtt0
	 PaGmi+s9kekxVSXYOqJqy+rB1YY9s5Y8w53ThK/iuGeDsU/BVU8sKhNmWxLW9qjK6C
	 eELFgrvCl4hcmv58tDh4DSOlzo/B4wHUk4jfEL81upYJcNM3RZExIj+5WWfL9+MHAx
	 qIpYityeMmGdWaGn3kpz9DIAj9a4a4HsukXtwVLaeE6Cb1loCfW7XPwc4PLIdhH7vw
	 mZbLCfgP7nIkA==
Date: Thu, 7 Nov 2024 14:51:24 +0000
From: Simon Horman <horms@kernel.org>
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: Qingfang Deng <dqfext@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-ppp@vger.kernel.org
Subject: Re: [RFC PATCH net-next] net: ppp: convert to IFF_NO_QUEUE
Message-ID: <20241107145124.GW4507@kernel.org>
References: <20241029103656.2151-1-dqfext@gmail.com>
 <20241104115004.GC2118587@kernel.org>
 <87pln99a28.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pln99a28.fsf@toke.dk>

On Tue, Nov 05, 2024 at 12:47:27PM +0100, Toke Høiland-Jørgensen wrote:
> Simon Horman <horms@kernel.org> writes:
> 
> > + Toke
> >
> > On Tue, Oct 29, 2024 at 06:36:56PM +0800, Qingfang Deng wrote:
> >> When testing the parallel TX performance of a single PPPoE interface
> >> over a 2.5GbE link with multiple hardware queues, the throughput could
> >> not exceed 1.9Gbps, even with low CPU usage.
> >> 
> >> This issue arises because the PPP interface is registered with a single
> >> queue and a tx_queue_len of 3. This default behavior dates back to Linux
> >> 2.3.13, which was suitable for slower serial ports. However, in modern
> >> devices with multiple processors and hardware queues, this configuration
> >> can lead to congestion.
> >> 
> >> For PPPoE/PPTP, the lower interface should handle qdisc, so we need to
> >> set IFF_NO_QUEUE. For PPP over a serial port, we don't benefit from a
> >> qdisc with such a short TX queue, so handling TX queueing in the driver
> >> and setting IFF_NO_QUEUE is more effective.
> >> 
> >> With this change, PPPoE interfaces can now fully saturate a 2.5GbE link.
> >> 
> >> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> >
> > Hi Toke,
> >
> > I'm wondering if you could offer an opinion on this.
> 
> Hi Simon
> 
> Thanks for bringing this to my attention; I'll reply to the parent
> directly :)

Likewise, thanks for following-up on this.

