Return-Path: <linux-ppp+bounces-102-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B80A99BB405
	for <lists+linux-ppp@lfdr.de>; Mon,  4 Nov 2024 12:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00BF7B23545
	for <lists+linux-ppp@lfdr.de>; Mon,  4 Nov 2024 11:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760A81B0F2C;
	Mon,  4 Nov 2024 11:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTWqpI5B"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C60618A6B5;
	Mon,  4 Nov 2024 11:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730721009; cv=none; b=BPDgiIX1OfAJm4PDD1dsLCV3p7SNDnryGemci2Vlnu8mT+xPo381c86rY+TfNlcr3RpGLbAW3QAoSVJUYEk8eLr8a7wv+c463AaCEoXprySYKacr+027vTb+YGkAvdd3xRv73b89fnYTaJepx2UD73Y5enyTdDs4w9ID/79hg6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730721009; c=relaxed/simple;
	bh=7bAXGSIMkDmiiArsenU5Ko1NFwTmYvJcvE7RrpL1XVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olMnjII0yHoKYZXL5XLMfHbUeHSjRaN0MNM1a/53dMvRJYag8ul6cZdopQKUwny6WNadyccGcExPc49p5tQYtfaofaiaBlnHTLZ2SUMtEmdasdpA9Nn+Cm4ELXhtY256oSizQy+fjHRsp46OhDMb0+IM0HNZ/Jru4LZqNFxTj1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTWqpI5B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C34C4CECE;
	Mon,  4 Nov 2024 11:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730721008;
	bh=7bAXGSIMkDmiiArsenU5Ko1NFwTmYvJcvE7RrpL1XVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZTWqpI5BAjfaPnVDNQPwae5G5vgeb83Sgz22Qw8kSaHF3mvvIw7lMuZQpshUbHmKd
	 zIpAorhnt7H0r7MQgS+z2E48aJPOMUGPg8utBDy55yUqcNcLeVjGK09lRjhNNgPVFO
	 DRR+/YdNtvmpcf/ShPy3Gkod++4MJmRpzW4PkRIWfoYQyBnIhsiT2ZTPY96Jj/F/0i
	 qgwgzXuoIZnuQ2lq4G0Vx1fIP4zpTU5N60LyFU6+kjJA3MLp8+8JrniMiHhk3pYiH4
	 yWhlGla8muTvIkfNlqFhLHHq3+D+EexV4Mn8hftA6sCNWI3JPaKAya/lfDCDP38Odu
	 vbsGBQssmUR6w==
Date: Mon, 4 Nov 2024 11:50:04 +0000
From: Simon Horman <horms@kernel.org>
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: Qingfang Deng <dqfext@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-ppp@vger.kernel.org
Subject: Re: [RFC PATCH net-next] net: ppp: convert to IFF_NO_QUEUE
Message-ID: <20241104115004.GC2118587@kernel.org>
References: <20241029103656.2151-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029103656.2151-1-dqfext@gmail.com>

+ Toke

On Tue, Oct 29, 2024 at 06:36:56PM +0800, Qingfang Deng wrote:
> When testing the parallel TX performance of a single PPPoE interface
> over a 2.5GbE link with multiple hardware queues, the throughput could
> not exceed 1.9Gbps, even with low CPU usage.
> 
> This issue arises because the PPP interface is registered with a single
> queue and a tx_queue_len of 3. This default behavior dates back to Linux
> 2.3.13, which was suitable for slower serial ports. However, in modern
> devices with multiple processors and hardware queues, this configuration
> can lead to congestion.
> 
> For PPPoE/PPTP, the lower interface should handle qdisc, so we need to
> set IFF_NO_QUEUE. For PPP over a serial port, we don't benefit from a
> qdisc with such a short TX queue, so handling TX queueing in the driver
> and setting IFF_NO_QUEUE is more effective.
> 
> With this change, PPPoE interfaces can now fully saturate a 2.5GbE link.
> 
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>

Hi Toke,

I'm wondering if you could offer an opinion on this.

> ---
>  drivers/net/ppp/ppp_generic.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index 4b2971e2bf48..5470e0fe1f9b 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -236,8 +236,8 @@ struct ppp_net {
>  /* Get the PPP protocol number from a skb */
>  #define PPP_PROTO(skb)	get_unaligned_be16((skb)->data)
>  
> -/* We limit the length of ppp->file.rq to this (arbitrary) value */
> -#define PPP_MAX_RQLEN	32
> +/* We limit the length of ppp->file.rq/xq to this (arbitrary) value */
> +#define PPP_MAX_QLEN	32
>  
>  /*
>   * Maximum number of multilink fragments queued up.
> @@ -920,8 +920,6 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  				break;
>  		} else {
>  			ppp->npmode[i] = npi.mode;
> -			/* we may be able to transmit more packets now (??) */
> -			netif_wake_queue(ppp->dev);
>  		}
>  		err = 0;
>  		break;
> @@ -1639,6 +1637,7 @@ static void ppp_setup(struct net_device *dev)
>  	dev->tx_queue_len = 3;
>  	dev->type = ARPHRD_PPP;
>  	dev->flags = IFF_POINTOPOINT | IFF_NOARP | IFF_MULTICAST;
> +	dev->priv_flags |= IFF_NO_QUEUE;
>  	dev->priv_destructor = ppp_dev_priv_destructor;
>  	netif_keep_dst(dev);
>  }
> @@ -1654,17 +1653,15 @@ static void __ppp_xmit_process(struct ppp *ppp, struct sk_buff *skb)
>  	if (!ppp->closing) {
>  		ppp_push(ppp);
>  
> -		if (skb)
> -			skb_queue_tail(&ppp->file.xq, skb);
> +		if (skb) {
> +			if (ppp->file.xq.qlen > PPP_MAX_QLEN)
> +				kfree_skb(skb);
> +			else
> +				skb_queue_tail(&ppp->file.xq, skb);
> +		}
>  		while (!ppp->xmit_pending &&
>  		       (skb = skb_dequeue(&ppp->file.xq)))
>  			ppp_send_frame(ppp, skb);
> -		/* If there's no work left to do, tell the core net
> -		   code that we can accept some more. */
> -		if (!ppp->xmit_pending && !skb_peek(&ppp->file.xq))
> -			netif_wake_queue(ppp->dev);
> -		else
> -			netif_stop_queue(ppp->dev);
>  	} else {
>  		kfree_skb(skb);
>  	}
> @@ -1850,7 +1847,7 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
>  	 * queue it up for pppd to receive.
>  	 */
>  	if (ppp->flags & SC_LOOP_TRAFFIC) {
> -		if (ppp->file.rq.qlen > PPP_MAX_RQLEN)
> +		if (ppp->file.rq.qlen > PPP_MAX_QLEN)
>  			goto drop;
>  		skb_queue_tail(&ppp->file.rq, skb);
>  		wake_up_interruptible(&ppp->file.rwait);
> @@ -2319,7 +2316,7 @@ ppp_input(struct ppp_channel *chan, struct sk_buff *skb)
>  		/* put it on the channel queue */
>  		skb_queue_tail(&pch->file.rq, skb);
>  		/* drop old frames if queue too long */
> -		while (pch->file.rq.qlen > PPP_MAX_RQLEN &&
> +		while (pch->file.rq.qlen > PPP_MAX_QLEN &&
>  		       (skb = skb_dequeue(&pch->file.rq)))
>  			kfree_skb(skb);
>  		wake_up_interruptible(&pch->file.rwait);
> @@ -2472,7 +2469,7 @@ ppp_receive_nonmp_frame(struct ppp *ppp, struct sk_buff *skb)
>  		/* control or unknown frame - pass it to pppd */
>  		skb_queue_tail(&ppp->file.rq, skb);
>  		/* limit queue length by dropping old frames */
> -		while (ppp->file.rq.qlen > PPP_MAX_RQLEN &&
> +		while (ppp->file.rq.qlen > PPP_MAX_QLEN &&
>  		       (skb = skb_dequeue(&ppp->file.rq)))
>  			kfree_skb(skb);
>  		/* wake up any process polling or blocking on read */
> -- 
> 2.34.1
> 
> 

