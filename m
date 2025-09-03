Return-Path: <linux-ppp+bounces-351-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F21BB41ED4
	for <lists+linux-ppp@lfdr.de>; Wed,  3 Sep 2025 14:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D426188FF4C
	for <lists+linux-ppp@lfdr.de>; Wed,  3 Sep 2025 12:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D827A2F746E;
	Wed,  3 Sep 2025 12:23:09 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCEA2EC08C;
	Wed,  3 Sep 2025 12:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756902189; cv=none; b=kV47OL682yzyAOOw2VaYLxuug9BdkxReayrP7d9UjCimLDXPt3opAcTGgOoC5epPIEXXkk4HFxOIxfSWYPM4e6kKF2O3u+B38UOE7/SelPtw/3ccGz5zaELqpvjbtmmTN2asD8aCjk6sWbwT6W3BqQWFdPs+pgIwbw8Bx+UQPFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756902189; c=relaxed/simple;
	bh=6gXCLTKnLdRshoxRtnriRuLuY+Z1EkEan+F1BMcekzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kkeVh6ho/2JQCiKQlQnpSrSJ+w+IkwXiGRgLz63TYif1StAj+d/TTmb+754FY54lCx6cXAbLgUSTaMb1fvwJR4sBtJI/uES7tJA62GXv89/5zLbSfCWKcC9liqrK1xI7NdVWX3UQkH62ksBGW/HyN1Edx1v0LbpKqJ0I3i+98o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4cH1rv3Ybmz1R93Y;
	Wed,  3 Sep 2025 20:19:59 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id E96181A0188;
	Wed,  3 Sep 2025 20:22:58 +0800 (CST)
Received: from [10.174.179.113] (10.174.179.113) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 3 Sep 2025 20:22:57 +0800
Message-ID: <289a62a2-e277-41b3-a78f-4ff7a0a23881@huawei.com>
Date: Wed, 3 Sep 2025 20:22:56 +0800
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] ppp: fix memory leak in pad_compress_skb
To: Qingfang Deng <dqfext@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Paul
 Mackerras <paulus@ozlabs.org>, Matt Domsch <Matt_Domsch@dell.com>, Andrew
 Morton <akpm@osdl.org>, Brice Goglin <Brice.Goglin@ens-lyon.org>,
	<linux-ppp@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20250903100726.269839-1-dqfext@gmail.com>
Content-Language: en-US
From: Yue Haibing <yuehaibing@huawei.com>
In-Reply-To: <20250903100726.269839-1-dqfext@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500002.china.huawei.com (7.185.36.57)

On 2025/9/3 18:07, Qingfang Deng wrote:
> If alloc_skb() fails in pad_compress_skb(), it returns NULL without
> releasing the old skb. The caller does:
> 
>     skb = pad_compress_skb(ppp, skb);
>     if (!skb)
>         goto drop;
> 
> drop:
>     kfree_skb(skb);
> 
> When pad_compress_skb() returns NULL, the reference to the old skb is
> lost and kfree_skb(skb) ends up doing nothing, leading to a memory leak.
> 
> Align pad_compress_skb() semantics with realloc(): only free the old
> skb if allocation and compression succeed.  At the call site, use the
> new_skb variable so the original skb is not lost when pad_compress_skb()
> fails.
> 
> Fixes: b3f9b92a6ec1 ("[PPP]: add PPP MPPE encryption module")
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
>  drivers/net/ppp/ppp_generic.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index 65795d099166..f9f0f16c41d1 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -1744,7 +1744,6 @@ pad_compress_skb(struct ppp *ppp, struct sk_buff *skb)
>  		 */
>  		if (net_ratelimit())
>  			netdev_err(ppp->dev, "ppp: compressor dropped pkt\n");
> -		kfree_skb(skb);
>  		consume_skb(new_skb);
>  		new_skb = NULL;
>  	}
> @@ -1845,9 +1844,10 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
>  					   "down - pkt dropped.\n");
>  			goto drop;
>  		}
> -		skb = pad_compress_skb(ppp, skb);
> -		if (!skb)
> +		new_skb = pad_compress_skb(ppp, skb);
> +		if (!new_skb)
>  			goto drop;
> +		skb = new_skb;
>  	}
>  
>  	/*

Reviewed-by: Yue Haibing <yuehaibing@huawei.com>

