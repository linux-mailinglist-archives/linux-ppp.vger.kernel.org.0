Return-Path: <linux-ppp+bounces-376-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH4oIRLUgWmnKQMAu9opvQ
	(envelope-from <linux-ppp+bounces-376-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 03 Feb 2026 11:55:14 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A1CD7FD2
	for <lists+linux-ppp@lfdr.de>; Tue, 03 Feb 2026 11:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7568D300D0D7
	for <lists+linux-ppp@lfdr.de>; Tue,  3 Feb 2026 10:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827A432862B;
	Tue,  3 Feb 2026 10:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XakpJmOu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bhemfROC"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDABB32860C
	for <linux-ppp@vger.kernel.org>; Tue,  3 Feb 2026 10:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770116112; cv=none; b=eXQhogoLYY1YO1Lg6p4wyxQ53bVV3veJ8+XponC5zfLmJvSNRekcBtKcXPYISBypE7tsJigBXUW+crzYwIg9ICBpi4cE9vweFYsZB2eUfWMltT/BBreQygUETs7gD2UWGelY+c/xouNONbQATxzCpBDiX9DRuoEWCBRniyqrLnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770116112; c=relaxed/simple;
	bh=wsT1DCBVScKEpY7lkQ5lAK6GmXaE2h8dBINyYKRIc8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=retTXHMlNY1MmdYVAnp2Wn3iFtGuKNjY3+a6LxUcsNLW3p1RnpILkGuYf/KhIclEFIAIF7bY74jYYUMnBLl7rHjHxrGRaq6UwhfXAgd+iba/BobYpURQYypptVn3gRMTtPGPCUFjOXVqpNfylIaz5ktcB0YL66xG1ZLpOJ1H/M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XakpJmOu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bhemfROC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770116109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zdSIwol8eIwonvoR4fHbLrzSsymY7+cYRfeKmjVX+w=;
	b=XakpJmOut3UNC6muQc/uNnCVojmfVwROZ3WvMHWEXGRNPbwRSpCOy5lWcFXy/+S6Zn99uZ
	+vu9fmhanmV2264ZaV7XllQyaHGQ6opNVpQWc6uR5vNt5a4o52UmAs0096WHhMajs5krFb
	8MgCBX7Ipz6TVMCxxISssjkUi+dW7NA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-0sRY8HMyNlWM9Jgp9-hlnw-1; Tue, 03 Feb 2026 05:55:08 -0500
X-MC-Unique: 0sRY8HMyNlWM9Jgp9-hlnw-1
X-Mimecast-MFC-AGG-ID: 0sRY8HMyNlWM9Jgp9-hlnw_1770116107
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-480717a8e05so54529005e9.3
        for <linux-ppp@vger.kernel.org>; Tue, 03 Feb 2026 02:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770116107; x=1770720907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3zdSIwol8eIwonvoR4fHbLrzSsymY7+cYRfeKmjVX+w=;
        b=bhemfROCsxFA63pJLCnMytTaHS4WP6idd7ylHy4w3WKTT4L2sJQEgx9MZ/Bw3xAhEC
         h5KLuTDSc8PVvUaAhSkQOeT3yiug961YwbiRVNU2gBgchviAXx3pCnxVqg9uSyOjIAZa
         nILxk9mWZVTSW5OUIuapm9dx1gSh4jzksvVRSnt/eFukH5Z0+Sb2ohcSi6L3i/IKvVfH
         E5TgLzcwl1dpiICV9QVRDjkdRX1EsweSUphBqLrduS7ApFMCZDM0jWzmMM01HENooT6b
         HNoo3N5E6W3u48YwOKd4hUhmlGfnc4xhq1ecdhApYG8kYGdkDRVsU0/2EzDyhYeBtnU6
         VrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770116107; x=1770720907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zdSIwol8eIwonvoR4fHbLrzSsymY7+cYRfeKmjVX+w=;
        b=IVFBgGAAVocmkcWaGN9012aQyXlxBqubb5UajdBTnV666ZzukxuIyLfaut2XluKILB
         VBdqGO1c3EuJNb7oMyPwgWdY5U129o5/K8F7WyfN7e9a+YzzE4QFOvKNJF5ZG+f85o3l
         VgM1Sr8WXJ32YUSA1J64X6qPODd0gK0Mcq++gzDgJ0DB//oTdVp79Aiy8MKRQNGIOmE1
         t4y8r0gVsfUsCKE1KHDCwP/exyTLrdGP4tlNkb1gAccdItroSRI8BmNsW11rN3MnjwMK
         Y1N2cAyehFGND2TzPv6PmtcIy9u8mFw+3Z+yelVM+HZE1LPWisKA7ntfSl0+0A8bjGCn
         pNPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUakPXmQTGKitVcBXEcd2n+QutW/0uA56BCw/ygi5yvVZ2h9jt/CO8tnu4VqKn6/j3vdiQxYOMPjQs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqvz1BP5yRQZRHWszY2kDTppT0KCfCytgO2Vz7QDQMZG7ugQ1r
	EoKOvPPMvdk3/IXxGiGl1eEjJp723h2G1mhM4EkFg3J2FIaU2knZTF9WwdodFnD0oUxac4uaPf4
	3VuoVoYEx8pEVXAdt3gF5RhBk4bzvTc1FDAcEKUYp6mMz9HoRlOa716PenR+Oww==
X-Gm-Gg: AZuq6aIl0+6d0WKkXcbVIIpEAJL0fBfLAg1aaI8YSn5G3vDd5ztXyLVv6bXvxYVzDwn
	DbI90KU7Ex42qNa68CccIlSPu1+yNj9pkBwfGCRDED0hzQJZwnd1FAEUkBmsXb+XPyQznOdV5Me
	21kfR3VanLeleGHstMmRQW7xEweAXftFKbKNlb1US1mea4N423dDYjiIkrbTYri0KhSL38V1g4j
	wWIvdDVKRpmrcVPUihni8snRikaqiQxQqC4FK/pder015cEBNjVtQpdETuClDyvm0Gv0kDSVW/6
	e+Vid6PdZdf2Y7eHgUvTWz5ra7lGFTjcn+OWM05oFN9hVWpfiR5YiXNvaKOYuYtEV03vQqIsfYD
	EJqKLJeq0VkI=
X-Received: by 2002:a05:600c:45c5:b0:47d:403e:9cd5 with SMTP id 5b1f17b1804b1-482db45fcb4mr193220615e9.11.1770116107133;
        Tue, 03 Feb 2026 02:55:07 -0800 (PST)
X-Received: by 2002:a05:600c:45c5:b0:47d:403e:9cd5 with SMTP id 5b1f17b1804b1-482db45fcb4mr193220235e9.11.1770116106669;
        Tue, 03 Feb 2026 02:55:06 -0800 (PST)
Received: from [192.168.88.32] ([150.228.93.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830515381esm58912085e9.11.2026.02.03.02.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 02:55:06 -0800 (PST)
Message-ID: <03c714f3-edd5-43fb-a0be-8c4a43bf6101@redhat.com>
Date: Tue, 3 Feb 2026 11:55:02 +0100
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4] ppp: enable TX scatter-gather
To: Qingfang Deng <dqfext@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
References: <20260129012902.941-1-dqfext@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260129012902.941-1-dqfext@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-376-lists,linux-ppp=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-ppp@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 28A1CD7FD2
X-Rspamd-Action: no action

On 1/29/26 2:29 AM, Qingfang Deng wrote:
> PPP channels using chan->direct_xmit prepend the PPP header to a skb and
> call dev_queue_xmit() directly. In this mode the skb does not need to be
> linear, but the PPP netdevice currently does not advertise
> scatter-gather features, causing unnecessary linearization and
> preventing GSO.
> 
> Enable NETIF_F_SG and NETIF_F_FRAGLIST on PPP devices. In case a linear
> buffer is required (PPP compression, multilink, and channels without
> direct_xmit), call skb_linearize() explicitly.
> 
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
> v3 -> v4:
>  Always expose SG and FRAGLIST, and linearize the skb if necessary.
>  - https://lore.kernel.org/linux-ppp/20260123014214.225278-1-dqfext@gmail.com/
> 
>  drivers/net/ppp/ppp_generic.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index f9f0f16c41d1..f8814d7be6f1 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -1641,6 +1641,8 @@ static void ppp_setup(struct net_device *dev)
>  	dev->flags = IFF_POINTOPOINT | IFF_NOARP | IFF_MULTICAST;
>  	dev->priv_destructor = ppp_dev_priv_destructor;
>  	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
> +	dev->features = NETIF_F_SG | NETIF_F_FRAGLIST;
> +	dev->hw_features = dev->features;
>  	netif_keep_dst(dev);
>  }
>  
> @@ -1710,6 +1712,10 @@ pad_compress_skb(struct ppp *ppp, struct sk_buff *skb)
>  		ppp->xcomp->comp_extra + ppp->dev->hard_header_len;
>  	int compressor_skb_size = ppp->dev->mtu +
>  		ppp->xcomp->comp_extra + PPP_HDRLEN;
> +
> +	if (skb_linearize(skb))
> +		return NULL;
> +
>  	new_skb = alloc_skb(new_skb_size, GFP_ATOMIC);
>  	if (!new_skb) {
>  		if (net_ratelimit())
> @@ -1797,6 +1803,10 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
>  	case PPP_IP:
>  		if (!ppp->vj || (ppp->flags & SC_COMP_TCP) == 0)
>  			break;
> +
> +		if (skb_linearize(skb))
> +			goto drop;
> +
>  		/* try to do VJ TCP header compression */
>  		new_skb = alloc_skb(skb->len + ppp->dev->hard_header_len - 2,
>  				    GFP_ATOMIC);
> @@ -1894,19 +1904,26 @@ ppp_push(struct ppp *ppp)
>  	}
>  
>  	if ((ppp->flags & SC_MULTILINK) == 0) {
> +		struct ppp_channel *chan;
>  		/* not doing multilink: send it down the first channel */
>  		list = list->next;
>  		pch = list_entry(list, struct channel, clist);
>  
>  		spin_lock(&pch->downl);
> -		if (pch->chan) {
> -			if (pch->chan->ops->start_xmit(pch->chan, skb))
> -				ppp->xmit_pending = NULL;
> -		} else {
> -			/* channel got unregistered */
> +		chan = pch->chan;
> +		if (unlikely(!chan || (!chan->direct_xmit && skb_linearize(skb)))) {
> +			/* channel got unregistered, or it requires a linear
> +			 * skb but linearization failed
> +			 */
>  			kfree_skb(skb);
>  			ppp->xmit_pending = NULL;
> +			goto out;

I'm sorry for missing this point before, but AFAICS channels with
chan->direct_xmit == 0 do not support GSO packets at all, and here such
packets will be transmitted after linearization (but still as GSO).

I think that while transmitting over !chan->direct_xmit you additionally
need to check for GSO packet. If ppp features are recomputed depending
on the channels configuration, you could chose to drop such packets.
Otherwise you will need to segment them before transmission, and that
looks error prone in case of multilink.

/P



>  		}
> +
> +		if (chan->ops->start_xmit(chan, skb))
> +			ppp->xmit_pending = NULL;
> +
> +out:
>  		spin_unlock(&pch->downl);
>  		return;
>  	}
> @@ -1991,6 +2008,8 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
>  		return 0; /* can't take now, leave it in xmit_pending */
>  
>  	/* Do protocol field compression */
> +	if (skb_linearize(skb))
> +		goto err_linearize;
>  	p = skb->data;
>  	len = skb->len;
>  	if (*p == 0 && mp_protocol_compress) {
> @@ -2149,6 +2168,7 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
>  
>   noskb:
>  	spin_unlock(&pch->downl);
> + err_linearize:
>  	if (ppp->debug & 1)
>  		netdev_err(ppp->dev, "PPP: no memory (fragment)\n");
>  	++ppp->dev->stats.tx_errors;


