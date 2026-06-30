Return-Path: <linux-ppp+bounces-605-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E82wL0PCQ2qKgwoAu9opvQ
	(envelope-from <linux-ppp+bounces-605-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 30 Jun 2026 15:18:59 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CEE6E4C1B
	for <lists+linux-ppp@lfdr.de>; Tue, 30 Jun 2026 15:18:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=iKPYUg0R;
	dkim=pass header.d=redhat.com header.s=google header.b=hws1hk0W;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-605-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-ppp+bounces-605-lists+linux-ppp=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B3A5302514A
	for <lists+linux-ppp@lfdr.de>; Tue, 30 Jun 2026 13:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6AED3FBEC1;
	Tue, 30 Jun 2026 13:06:13 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC0040F8CF
	for <linux-ppp@vger.kernel.org>; Tue, 30 Jun 2026 13:06:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824773; cv=none; b=VaFOQtsZmAqfx4nD3M9apPDJVJ0bibHUJ6OBf/z1hQYnHYAvqmfws5YuuO6ohaI21Nbu2sdShWI2i+973E+V0ZpBGRcoJMEuuVGPORuI6AnXtfvL7RbHU53+66+41P8IwM1QgD/vEOoYeR93QpQim66QcSbNs0XQbOZN+Q8h/YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824773; c=relaxed/simple;
	bh=kwLoIgJ4mjBh6gocsmylxJ2gWtKi7jMK7o3NqE2cR5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5164eCvTIfOmjk//pWy9PH42sJrZXIkuIH62eTYomMbBGtJpUMCoS+JNK6LX2YmnoV/RrsGzJWYOfIYxE9/td8fRxbKTtco6LTTxbbWNUGOhsBTwXk34O8qMTdEHFx6f/45ZuReZJpV6Seqkx4Dj+G3GXL4oq3JeKvxPdE5GPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iKPYUg0R; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hws1hk0W; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782824771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=er/2EyZNp8d3L3Qi54fsC/81NaaUIUspqwclquc99Bk=;
	b=iKPYUg0RooW8Vc1MjDrdKHTDfqJ15Dzwn0fwpjnxD0Rhq9RU/lCiJVKnGFupOehqa6gicT
	u8w5JuiSTgfsk6ixok7XVYu5z7NsefHAYe9Z3N+kM6dGTe933EHRqLJu3ujANoASU83ZGI
	HZbSx21FmqDqQ5P7W3JmbhBVinvShuA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-Dt0eGeaAO2ikBu_eX_llxQ-1; Tue, 30 Jun 2026 09:06:09 -0400
X-MC-Unique: Dt0eGeaAO2ikBu_eX_llxQ-1
X-Mimecast-MFC-AGG-ID: Dt0eGeaAO2ikBu_eX_llxQ_1782824769
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-493bb6a4336so5664595e9.3
        for <linux-ppp@vger.kernel.org>; Tue, 30 Jun 2026 06:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782824768; x=1783429568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=er/2EyZNp8d3L3Qi54fsC/81NaaUIUspqwclquc99Bk=;
        b=hws1hk0WUHU9Q0/byhVxHqic1hv+LU6fAz4cxkXkCggjhOExhqtDgJSiZRZ+V5iYBo
         IrSUcMFBgF2fqqygFeL8J58yLInPam/MLGpBz46it4FgsaBKSSCf70Y2O/O48St4YfBu
         pXJ3eOYOwQScC8/LiCLqleEijNeJai7RjkkDkulyaYThqUpWGSTDjOw5S0DBET0/yTnf
         zieaHZTOZ4wO0ofLUX0q31qnSKQFBoglWK2RvYp+j2+inlRJlwA/b8nNiIabJb0NxBRa
         DR+q5hmfnEn2vZeV3S6E62NMq4fUAVpgLKK525jo2HbAiLoIAqw6rNj4w1QYqFM1OduJ
         Y+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824768; x=1783429568;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=er/2EyZNp8d3L3Qi54fsC/81NaaUIUspqwclquc99Bk=;
        b=jqy0iLDdcRwVq4KO4QKsoakLgGPAYYP1ACaaF77MLueU3hQOFC/c7Hqj5pOrqgaqDW
         K/8+sH4Kj4g/aWpnb7St05hsOKxibvcHBMfjKfxX+4NQUplyw0QhbBoZa3/E7xWGnq3/
         WGMvcTWezSXVTL6wnjgWpo/IZF7ZlKUl8IB7heMNE34Z/6ny7WwdVf0eRJM9f0QGgsqb
         LDkYF6eRhNSwLtuB1gqWrWHpkMxfAwIxxu5i4jPg5aofnFFKVo3Ecm6kA01mbX/tRGn7
         JKeX4Z8QTS7zGtmTzJaeS8z0rP8C5P6FH/Uiq2vGEWkW749daxeh16UuPFUrfho0w7fi
         kpiw==
X-Forwarded-Encrypted: i=1; AFNElJ+4ZQvZcCTUo3k2sjqFruMyX2TyNDR0U4DCXTD4V8zGKoztNiWnPKw7y0IOL9i5If6gfIGbCBqLtDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzXKKB4rlyEs1YWy11kG0bCZKdD3wJkBAiJYj0TOv+36E/ztVW
	1pkC/0mx5Z43B4Un24l3TwE/5F5OEGssWqHm4xiGGurMqNGcHhunxG77viY1gJySowoBfhaSNS2
	mJr150lgQcy8/C7fspgtE3j8I0wlk7zQgJ3stcTX2vli5uGmd+UWw5XRSCdUnTg==
X-Gm-Gg: AfdE7cmdO2StHRdroGhSosqf5/cuKoxKptD118KatyrcDNCN1oCpUU4nhJsUg28j25P
	nD9sSmt5hDWNUtkkWNrKCK8cOwJP9sEo2TTenLJh+EFykoEgh5kTPcoIyAI+k++qS5bRrH19uus
	SgVmhcLXrRCm8QOT3g+eotP5SIIJ4SPBL5pXohaps/O5ZkpgTi/R8UfLv9+061IdjfMZzRHNfyR
	j9to1ltFwA+xCwZ9WGo+nuBPlmVKKMgW5M3VIA5l2EjURoP+MzSJaL8URkadhcZz3CGtzYf0JH4
	Y9AM3q6F9wrVboq4Eoc+KTRb4QEsYJhEoA2T4atUZ0+g7dwivj7YPsKAIOBry1z7STdLaCQYTYR
	GMwQX0lhaADngO59cihVlJsXH2hDaOHstI0NtMnJC7XmQE4Gi/Ph6XlY9zr0VlS409hfOTvAVUt
	o+JnGnCLqSWw==
X-Received: by 2002:a05:600c:c4a8:b0:492:6efc:7c60 with SMTP id 5b1f17b1804b1-493b82b556emr51783625e9.28.1782824768529;
        Tue, 30 Jun 2026 06:06:08 -0700 (PDT)
X-Received: by 2002:a05:600c:c4a8:b0:492:6efc:7c60 with SMTP id 5b1f17b1804b1-493b82b556emr51782755e9.28.1782824767973;
        Tue, 30 Jun 2026 06:06:07 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:2eb7:f61a:75:4534? ([2a0d:3344:5521:6b10:2eb7:f61a:75:4534])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bb4f174esm30770175e9.2.2026.06.30.06.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:06:07 -0700 (PDT)
Message-ID: <f81d25c6-4b14-4e48-a230-2d41a036a065@redhat.com>
Date: Tue, 30 Jun 2026 15:06:05 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] ppp: fix use-after-free reads in the stats ioctls.
To: Norbert Szetei <norbert@doyensec.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-ppp@vger.kernel.org,
 linux-kernel@vger.kernel.org, Qingfang Deng <qingfang.deng@linux.dev>
References: <CF6F0CC7-C448-406B-8E24-2025AD585D18@doyensec.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <CF6F0CC7-C448-406B-8E24-2025AD585D18@doyensec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-605-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:norbert@doyensec.com,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:linux-ppp@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qingfang.deng@linux.dev,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[pabeni@redhat.com,linux-ppp@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,doyensec.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49CEE6E4C1B

Adding Qingfang.

On 6/28/26 2:44 PM, Norbert Szetei wrote:
> ppp_get_stats() (SIOCGPPPSTATS) and the SIOCGPPPCSTATS handler, both
> reached from ppp_net_siocdevprivate(), dereference state that other
> ioctls free under the ppp lock, without taking it:
> 
>   - ppp_get_stats() reads ppp->vj; PPPIOCSMAXCID frees it with
>     slhc_free() under ppp_lock().
>   - SIOCGPPPCSTATS calls ->comp_stat()/->decomp_stat() on
>     ppp->xc_state / ppp->rc_state; PPPIOCSCOMPRESS and ppp_ccp_closed()
>     free those.
> 
> A concurrent stats ioctl can then read freed memory (slab-use-after-
> free), and the freed contents are copied back to userspace. This is 
> reachable by a local user who has CAP_NET_ADMIN privileges and 
> read/write access to /dev/ppp.
> 
> Take the lock the freeing path holds around each access: the receive
> lock in ppp_get_stats() (PPPIOCSMAXCID frees ppp->vj under ppp_lock(),
> which includes it) and ppp_lock() around the SIOCGPPPCSTATS callbacks.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Norbert Szetei <norbert@doyensec.com>
> ---
>  drivers/net/ppp/ppp_generic.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index 57c68efa5ff8..847c5e1793c8 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -1505,10 +1505,13 @@ ppp_net_siocdevprivate(struct net_device *dev, struct ifreq *ifr,
> 
>  	case SIOCGPPPCSTATS:
>  		memset(&cstats, 0, sizeof(cstats));
> +		/* protect against PPPIOCSCOMPRESS/ppp_ccp_closed() freeing the state */
> +		ppp_lock(ppp);
>  		if (ppp->xc_state)
>  			ppp->xcomp->comp_stat(ppp->xc_state, &cstats.c);
>  		if (ppp->rc_state)
>  			ppp->rcomp->decomp_stat(ppp->rc_state, &cstats.d);
> +		ppp_unlock(ppp);

It looks like that this fix addresses the reported races, but I don't
like stats blocking the TX and RX path. Perhaps you should consider
switching to proper RCU for the relevant structs, and likely 2 separate
patches, one for xc_state/rc_state and the other for vj.

/P


