Return-Path: <linux-ppp+bounces-353-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EA9B43C10
	for <lists+linux-ppp@lfdr.de>; Thu,  4 Sep 2025 14:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67DBB1C2484B
	for <lists+linux-ppp@lfdr.de>; Thu,  4 Sep 2025 12:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C672C2FDC30;
	Thu,  4 Sep 2025 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="vYr2V7Ga"
X-Original-To: linux-ppp@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156822FC009;
	Thu,  4 Sep 2025 12:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756990294; cv=none; b=HjS4qxXrcmbOAuRW8m30bAPOxubLltdoBshns1TwlNKDSpvGUBC7maBZeZ3c8ZShRI9ssDdYZoPBf+UB9pQveOYY0zsH2bhsi9s/gav9PoLBTMJMulJgIId1L65heY+EJOAvswfSOfXBNRYpDZnLDe0SFKld1RWrIAkNEovK3eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756990294; c=relaxed/simple;
	bh=mjmuP3eTd5TQVyMcuIqiR9BfXcdv96nsp1pWUeopX8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=haswuUlpZUKHYavrPWtasrPmizrC5Ij19zs3WNt2/3vgkxfnhVLFNesSoehyCl5NFCNXzT00agHYtgDpd0a6Aff/Tc7R5/8HBDct7tq/WuN3dPlBiWXFoitQwrmhgj2OOfFkkPtCWU4735Lt3mM4i6mmp1yM3s4oy4Eph+csjnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=vYr2V7Ga; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AkSI/H68/3rO9+rnbUFWKGs+2zxiUh31b/gspJbDwFk=; b=vYr2V7Gato0bSRMSrst4zVigSs
	QfWDIDzkzN1M4B0Vqh2Ef4jFKVI4fARxoVjrgmJxefFY23HAFxo+U2L0A6mAa71Z8ONnJYgBndXh8
	CaGwFQPXfEbwPu4SreDuKvfKgrkSwS9fciVJUr47akLzlsOs1C/jLS3p1nAQ8sGI7Yuo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uu9Qy-007DDO-Qf; Thu, 04 Sep 2025 14:51:24 +0200
Date: Thu, 4 Sep 2025 14:51:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
Subject: Re: [RFC PATCH net-next] ppp: enable TX scatter-gather
Message-ID: <bcf9c1c9-996a-4fd4-902c-3bf797ca688d@lunn.ch>
References: <20250904021328.24329-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904021328.24329-1-dqfext@gmail.com>

> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index f9f0f16c41d1..3bf37871a1aa 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -1710,6 +1710,12 @@ pad_compress_skb(struct ppp *ppp, struct sk_buff *skb)
>  		ppp->xcomp->comp_extra + ppp->dev->hard_header_len;
>  	int compressor_skb_size = ppp->dev->mtu +
>  		ppp->xcomp->comp_extra + PPP_HDRLEN;
> +	/* Until we fix the compressor need to make sure data portion is
> +	 * linear.
> +	 */
> +	if (skb_linearize(skb))
> +		return NULL;

The word 'fix' suggest something is broken. I don't think that is
true, its just a limitation of the compressor. Please avoid 'fix'.

	Andrew

