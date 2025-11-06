Return-Path: <linux-ppp+bounces-366-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8875C3BB7F
	for <lists+linux-ppp@lfdr.de>; Thu, 06 Nov 2025 15:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B66851B20B3F
	for <lists+linux-ppp@lfdr.de>; Thu,  6 Nov 2025 14:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CACD7303A1B;
	Thu,  6 Nov 2025 14:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z1cc9OOq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MX8E8WqG"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073EA34216C
	for <linux-ppp@vger.kernel.org>; Thu,  6 Nov 2025 14:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762438744; cv=none; b=EOHPb7NsVIc2mqTOgIoARIl17HRsscDjDEPmUug/ZhV1EdeVZqkYCrIt0rGgb6xpiNnPM9I10by02v/OXQTpzVHYVfVKMWPAdV4jGvoONbFDoemvDHvkIPnKNzQMU+7KEt184qM0CvFpyvfv78UcD18CZEqZLZl3yik5XRIkMYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762438744; c=relaxed/simple;
	bh=ecXPWFAbT2zz2E6hGr3lsgOC2vwHjsIE0/qnPxMclIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=f7yTQi+fpQnQqMSyopbsG4I6wQRTiRZzkt8On6oZws5zZvp3fz7JSrRjRYSeG+nRf1h7qZpQbc4g+DRutPh07QWgnsWpNvo/CaRhRkFddDQtA4LRnvwSh2l7qP8zxOfIL53rzjB1FPHXUlOFh3DqS4gK7tahhyoYF9bOl6Uu+zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z1cc9OOq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MX8E8WqG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762438740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2558/5DuSGeHTSysEKVn43dBQXRVp9ibyTXm/MgXyNU=;
	b=Z1cc9OOqo23nTkSiBS9XnJMGHjMCY1/vTmvAMXYs/zowtj+c7gkztKUO8Jzmqsf1zqHxAC
	Hug9JlxEZ103/dgg7Jk9x/JZIKgrOUH8DwKk/lRV7qZHgTPHutR6m0ytFZA3oYveblHJmy
	yvLI+Y4KFZquNDXHQ+5nu0fzys+nTAI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-Zl_ewEj1PNKTCCXKEsG0jA-1; Thu, 06 Nov 2025 09:18:59 -0500
X-MC-Unique: Zl_ewEj1PNKTCCXKEsG0jA-1
X-Mimecast-MFC-AGG-ID: Zl_ewEj1PNKTCCXKEsG0jA_1762438738
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-477212937eeso6273825e9.2
        for <linux-ppp@vger.kernel.org>; Thu, 06 Nov 2025 06:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762438738; x=1763043538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2558/5DuSGeHTSysEKVn43dBQXRVp9ibyTXm/MgXyNU=;
        b=MX8E8WqGP2A//cTJpXEtpNVFwQeSFR9cfCKP3ixLcaqQhj3ezDsbRJ+E1PUiK+jA3o
         Oyt9bhYwgaIXTI8irjV40OVI0IBHK0n/SFaYq6iSouNrrgNDrRLHD+cCa+w8POzDx4cw
         d70ZIgh1phTfn0Qorcr4Kqy9lVDHfJGFP8AbX0I9cS1tBadZfDoPo6jDgQxWQRTebLsf
         sVBZiE2eIoMlK0SmmS91IHNHCBX1hvUM4bK6+1QJxWnG69qb+uZefR9tdVYF+DUlmykK
         KZAe2R2etXJ06Oi0lUQ6i619ANnow7W1p1wjpVw0uyngyaJ4+Ad/+lMks3bY0mVgxnph
         DjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762438738; x=1763043538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2558/5DuSGeHTSysEKVn43dBQXRVp9ibyTXm/MgXyNU=;
        b=eQlNe01jYt6/wTTd5Z+bc1yQpgDmtyv/N0Ci3NR1xeJXapfmWPDI78GheuoC8QTvWL
         cS7EiCvSvGmtAegenAXypevO6N79epykhzcy98APHEk6QthU/fzIQ7vAHeYjOE3YIade
         4FLUdDX1BmbnzmtrrX438yRUdA4OR6D6VDNi7Fdip85gxahXYxkystlK6TnjM2cZc3xj
         SnEpAOAqN0bipUGIvZHNly5oINruFFdzKHijOF3vQscHwx2F2KqyS4RYHo03HcBbAfNx
         NkhPUeXdGh8yiGSzEvWEBP826BvbmK7xMUW2vZXsOuyBF6KDdibID3+tBLRLLxOXboQx
         p1cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiIOmCRrzoKoT/bmKYxaI2xIM8o+EuIjk2S0WGNs2SSIrXR0BkTGfczm0Tgmb4DbiJqbI7XJTJBMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5HV+G6j0WpukIKAy/SRbAJe+pRvggelXDdmKfUpH5yGQo3YXe
	yyQuxUOP0pBCpkIWZEXwrhnt9SjqMbC4WmyBDELqKbgZDfhNglKV6HCsLt8mIhNZl4USaMalbOT
	H3+UAgHZAzhfZV/9cpTwJRz5Hnp7uDanRE/qZTZ8AMGFeT7JkYvR7Jq/H0tED64NrKAFLUQ==
X-Gm-Gg: ASbGncvMANmtgtjIyMWsEhbPoTaQIXUkBltPeP13cPDeCOa0OzlRBmBnMD4IhjQYE0L
	8B408zALcdONd4M91ooIQWXvC+thDmE80kLXq7Ydr/y9U0j9Jnh60Z03XaMImP8DQB+fQ86MiNW
	ffAkUpjQE3rtGQZ3Oruxu1WQA6D3aWTy2aFsmEZq+VLEDbXxBAYhJpDpC7FI9D+a1IobwKG9XR1
	lOERZIzrl1ksFUmxTI7WncLBncfyxAaG+upQIBS2EXOycjzVDLSxlwyiUXyZw1i3nPLJzt+NovE
	XkkEomHGWsVJGi4nLC6J3gVgRAEoYb5AJhN4bC36Gu1gbzpEBse6qJmLg4V5VkYpoJhdtyLowPN
	Tnw==
X-Received: by 2002:a05:600c:1552:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-4775ce3f136mr88569285e9.32.1762438737994;
        Thu, 06 Nov 2025 06:18:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFn0NuCZ5fprkStyYtobcANdwvR7UeicN84jVnofOHneho0o5wIY1CsG7J8Q2tZQ79l336p/Q==
X-Received: by 2002:a05:600c:1552:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-4775ce3f136mr88568195e9.32.1762438736530;
        Thu, 06 Nov 2025 06:18:56 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb403849sm5669190f8f.1.2025.11.06.06.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:18:56 -0800 (PST)
Message-ID: <d9b8ec8a-f541-4356-8c42-e29adced59c0@redhat.com>
Date: Thu, 6 Nov 2025 15:18:54 +0100
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] ppp: enable TX scatter-gather
To: Qingfang Deng <dqfext@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251103031501.404141-1-dqfext@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251103031501.404141-1-dqfext@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/25 4:15 AM, Qingfang Deng wrote:
> When chan->direct_xmit is true, and no compressors are in use, PPP
> prepends its header to a skb, and calls dev_queue_xmit directly. In this
> mode the skb does not need to be linearized.
> Enable NETIF_F_SG and NETIF_F_FRAGLIST, and add
> ppp_update_dev_features() to conditionally disable them if a linear skb
> is required. This is required to support PPPoE GSO.

It's unclear to me why IFF_NO_QUEUE is necessary to avoid the
linearization.
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
> v1 -> v2:
>  Changes dev->features under the TX spinlock to avoid races.
>  - https://lore.kernel.org/netdev/20250912095928.1532113-1-dqfext@gmail.com/
> 
>  drivers/net/ppp/ppp_generic.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index 854e1a95d29a..389542f0af5f 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -498,6 +498,17 @@ static ssize_t ppp_read(struct file *file, char __user *buf,
>  	return ret;
>  }
>  
> +static void ppp_update_dev_features(struct ppp *ppp)
> +{
> +	struct net_device *dev = ppp->dev;
> +
> +	if (!(dev->priv_flags & IFF_NO_QUEUE) || ppp->xc_state ||
> +	    ppp->flags & (SC_COMP_TCP | SC_CCP_UP))
> +		dev->features &= ~(NETIF_F_SG | NETIF_F_FRAGLIST);
> +	else
> +		dev->features |= NETIF_F_SG | NETIF_F_FRAGLIST;
> +}
> +
>  static bool ppp_check_packet(struct sk_buff *skb, size_t count)
>  {
>  	/* LCP packets must include LCP header which 4 bytes long:
> @@ -824,6 +835,7 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	case PPPIOCSFLAGS:
>  		if (get_user(val, p))
>  			break;
> +		rtnl_lock();
>  		ppp_lock(ppp);
>  		cflags = ppp->flags & ~val;
>  #ifdef CONFIG_PPP_MULTILINK
> @@ -834,6 +846,12 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  		ppp_unlock(ppp);
>  		if (cflags & SC_CCP_OPEN)
>  			ppp_ccp_closed(ppp);
> +
> +		ppp_xmit_lock(ppp);
> +		ppp_update_dev_features(ppp);
> +		ppp_xmit_unlock(ppp);
> +		netdev_update_features(ppp->dev);
> +		rtnl_unlock();
>  		err = 0;
>  		break;
>  
> @@ -1650,6 +1668,8 @@ static void ppp_setup(struct net_device *dev)
>  	dev->flags = IFF_POINTOPOINT | IFF_NOARP | IFF_MULTICAST;
>  	dev->priv_destructor = ppp_dev_priv_destructor;
>  	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
> +	dev->features = NETIF_F_SG | NETIF_F_FRAGLIST;
> +	dev->hw_features = dev->features;
>  	netif_keep_dst(dev);
>  }
>  
> @@ -3112,13 +3132,17 @@ ppp_set_compress(struct ppp *ppp, struct ppp_option_data *data)
>  	if (data->transmit) {
>  		state = cp->comp_alloc(ccp_option, data->length);
>  		if (state) {
> +			rtnl_lock();
>  			ppp_xmit_lock(ppp);
>  			ppp->xstate &= ~SC_COMP_RUN;
>  			ocomp = ppp->xcomp;
>  			ostate = ppp->xc_state;
>  			ppp->xcomp = cp;
>  			ppp->xc_state = state;
> +			ppp_update_dev_features(ppp);
>  			ppp_xmit_unlock(ppp);
> +			netdev_update_features(ppp->dev);
> +			rtnl_unlock();

Instead of dynamically changing the features, what about always exposing
SG and FRAGLIST and linearize the skb as need for compression's sake?

/P


