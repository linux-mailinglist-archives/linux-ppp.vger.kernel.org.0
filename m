Return-Path: <linux-ppp+bounces-393-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMmKBy5njGkdnAAAu9opvQ
	(envelope-from <linux-ppp+bounces-393-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Feb 2026 12:25:34 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4A3123D5F
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Feb 2026 12:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59CA03005A92
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Feb 2026 11:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8952536B064;
	Wed, 11 Feb 2026 11:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c1mZLwyF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fSZZX6cJ"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3E835581D
	for <linux-ppp@vger.kernel.org>; Wed, 11 Feb 2026 11:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770809130; cv=none; b=iH0IXcxLRCnjgPHvPNS/yfnXcH9LlXUH8+oDB/kbVdl/m/fLRlMkb/dlyS0qMZfAz/HsO0JAR8bmnQrO1Sz5dCuJ7jRgHZHRN2jsLYwxZlyndtsSoN5TwkaAUbylXxikbWS7/mZXV6UN9wZopqdK5EfLJVw97jAiNbrD/08RK/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770809130; c=relaxed/simple;
	bh=7d+AXoxTsWN4BbyRET87gH+U/G1P7Vts/X3P1qNoGQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hnyWVFlkcJkGR5ru2IQQhC5Xaf467W7BmDnwjX9/H5crPv/1bZVmpjZTljdk8nsnVFuT8x0txJvMjWNBEWNsLJsUdVA8CAg41RwJoFwB4SR5AyvVty8L1Nz6SVefNIoK4VSaY8aCKP+vzsgRGra66f6JEurEucDDunke9EGwN/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c1mZLwyF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fSZZX6cJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770809126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8I9uY7De/Owfo1cyJYQXzE51IMCqg83AFJdtL17VQAQ=;
	b=c1mZLwyFMtmxMlcDV2fIaU02vwYaOScXQIUP1dL93g28PK3zJgTNPfRWZJyO6EXhSJvrD8
	FDU4fV1d4xIEIj5ZhvXl+ip9nN2eEI6xr/cyYXz8aiRpY8H7sdgD1UalYk6yaKI8RZlTjc
	8xSLFzPzZW+WuSGyV8VvOsqNWanNJSE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-c6lpf7ptO_KLrhu6LZIBgA-1; Wed, 11 Feb 2026 06:25:25 -0500
X-MC-Unique: c6lpf7ptO_KLrhu6LZIBgA-1
X-Mimecast-MFC-AGG-ID: c6lpf7ptO_KLrhu6LZIBgA_1770809125
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43591aacca2so1508826f8f.1
        for <linux-ppp@vger.kernel.org>; Wed, 11 Feb 2026 03:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770809124; x=1771413924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8I9uY7De/Owfo1cyJYQXzE51IMCqg83AFJdtL17VQAQ=;
        b=fSZZX6cJ7JIzrWt6+UvNr2aeA8xSWUad/vWof4Th/4NYVHHOBSAn9THhIz9Nn4n5Yx
         pQF5JrCp0aIurMgx/JAWqh733u5IrDz3jMoltO8t7pOgPYLW6xS7oADvXXH515ppIWwu
         gjJ+DnOwGyiln9FyCLtWqgceiFGIc6Nv2c3DRaaeNG54AM1pmPfKm/zVfCB5lSebenUd
         pCbyIeMx/iQBg1Ogou6J5jv54t3N6dZEx7ZjOricj2u2/l/i57WSO0OWTvyR6lRwdYBt
         ddQyM6099bMOE2KCTk+XDQ1PMPBk8tGj3BYKP7sYFVJN4TyaGsblAEId/xWqzxPAURPR
         oMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770809124; x=1771413924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8I9uY7De/Owfo1cyJYQXzE51IMCqg83AFJdtL17VQAQ=;
        b=hnrpETfG9eq3Xb9N+dbLdJzlSXAaoiYew2UvXC9g6b7CKokCxTv7MMS/H+uxMCAEVY
         hE/XLfq0pbfBLT/hhERP/qY17s1Gfy9UDn7o/VHe+KG3IestvSTDQYmxUgo1YQmTyna9
         10vH2BWB7GZYQu7aYdY0gs9YjYGhiBsWfgyOu9jXJ5+NcPU8oqdRt8uY/qEOxoRGEvC1
         ITYVdxpvW0WP8uk85SOqCeazNVCwNtz5UdnYBDE4unoUULyw9WFKfmaudYoWO0hJJdrO
         hX/7YY1ceTtjRX5g0UPLPWG5vEY/GmILWZDSy6pHqumYucwNpx+Jc7JiI1yYGwOjQ54+
         PlxA==
X-Forwarded-Encrypted: i=1; AJvYcCXgQnpPeetxbk/OphCFxJ6Z3adAqpi1HSd7x3fIAYSGdLtzloTcVHCD6JUlMpXcMQ8FeGJepggG6ZM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8DcO1B9kOTf1fohM/MMmDwYJPKGJkHehxiq8fHk32zm1Cx12m
	nllM3SYrBi3XbKgNxtfvndMj3qTlAogBReJgdpnMOWrs7ai67euf+ftg5zll3d+LdQXwPTrLU2C
	+3skQBCIoH7gDUGz7SB/tEX8QCg8b5Sm9BTDduK0cG4sX7OYC4Z7XSkTH4rQMdQ==
X-Gm-Gg: AZuq6aLOhEuIl71hymay3cN+Myan+zCa8V7IJyOkRGq4fihmwSuGBz6u5U7LjZ5RqvI
	kanYSY6GYH3CFtMLRDx2Uq6fsSr5pB4/mNzIpuDjaBZyzVuucYIwSnCimdVDjCRvQDULx15Gh7+
	qhS6KC3PPoUOGCUPHrvBgcNWEpIWrhORzW7N1usNyRNWN7gylLfIpmCzp1Dp0OlPrbzneB6EeLN
	FnhifQd4DzNstm5q35PiroeLCQMumuJkiaxPqsualY4hpCcAtooeRk3ml+lrXyqSTA3nc8GtBJg
	55eHB5YwcHhsB64SXtkJD9eiyxDJXV6XNc2378WXJPHRAkZF3dybwuJo9m/gp+3iIg3y1RYOkBk
	X+oZHf3wIc4qYjqwbYZ8dlHWe9A==
X-Received: by 2002:a5d:604d:0:b0:436:3563:499b with SMTP id ffacd0b85a97d-43635634b2cmr15873136f8f.2.1770809124566;
        Wed, 11 Feb 2026 03:25:24 -0800 (PST)
X-Received: by 2002:a5d:604d:0:b0:436:3563:499b with SMTP id ffacd0b85a97d-43635634b2cmr15873097f8f.2.1770809124074;
        Wed, 11 Feb 2026 03:25:24 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783dfc55dsm4109270f8f.20.2026.02.11.03.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 03:25:23 -0800 (PST)
Message-ID: <8eeb1478-4dbd-4b03-b675-91df18c8d26b@redhat.com>
Date: Wed, 11 Feb 2026 12:25:22 +0100
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] ppp: don't byte-swap at run time
To: Qingfang Deng <dqfext@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260207064705.208612-1-dqfext@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260207064705.208612-1-dqfext@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-393-lists,linux-ppp=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-ppp@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BC4A3123D5F
X-Rspamd-Action: no action

On 2/7/26 7:47 AM, Qingfang Deng wrote:
> @@ -312,7 +312,26 @@ static inline struct ppp_net *ppp_pernet(struct net *net)
>  }
>  
>  /* Translates a PPP protocol number to a NP index (NP == network protocol) */
> -static inline int proto_to_npindex(int proto)
> +static __always_inline int proto_to_npindex(__be16 proto)

This has just 2 callers; does the compiler inline it anyway?!?

> +{
> +	switch (proto) {
> +	case htons(PPP_IP):
> +		return NP_IP;
> +	case htons(PPP_IPV6):
> +		return NP_IPV6;
> +	case htons(PPP_IPX):
> +		return NP_IPX;
> +	case htons(PPP_AT):
> +		return NP_AT;
> +	case htons(PPP_MPLS_UC):
> +		return NP_MPLS_UC;
> +	case htons(PPP_MPLS_MC):
> +		return NP_MPLS_MC;
> +	}
> +	return -EINVAL;
> +}
> +
> +static __always_inline int proto_to_npindex_user(int proto)

This is slowpath and definitely does not need the inline annotation

>  {
>  	switch (proto) {
>  	case PPP_IP:
> @@ -332,44 +351,44 @@ static inline int proto_to_npindex(int proto)
>  }
>  
>  /* Translates an NP index into a PPP protocol number */
> -static const int npindex_to_proto[NUM_NP] = {
> -	PPP_IP,
> -	PPP_IPV6,
> -	PPP_IPX,
> -	PPP_AT,
> -	PPP_MPLS_UC,
> -	PPP_MPLS_MC,
> +static const __be16 npindex_to_proto[NUM_NP] = {
> +	htons(PPP_IP),
> +	htons(PPP_IPV6),
> +	htons(PPP_IPX),
> +	htons(PPP_AT),
> +	htons(PPP_MPLS_UC),
> +	htons(PPP_MPLS_MC),
>  };
>  
>  /* Translates an ethertype into an NP index */
> -static inline int ethertype_to_npindex(int ethertype)
> +static inline int ethertype_to_npindex(__be16 ethertype)

This has a single caller, please drop the inline annotation.

I'm not sure the code churn is justified by the gain; please include
also actual perf figures in the commit message.

If you are willing to invest a significant amount of time in this area,
I suggest to implement first some self-tests and than reconsider the
locking schema: I suspect RCU usage could avoid some lock(s) in the
datapath.

/P


