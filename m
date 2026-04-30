Return-Path: <linux-ppp+bounces-554-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNzvNeYo82mwxgEAu9opvQ
	(envelope-from <linux-ppp+bounces-554-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 12:03:18 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DF70A4A0712
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 12:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52DF03014FD0
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 10:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874803AEF3B;
	Thu, 30 Apr 2026 10:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Krbq/ftc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TEdrVywR"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A143FE367
	for <linux-ppp@vger.kernel.org>; Thu, 30 Apr 2026 10:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543303; cv=none; b=rDVsc1huYRagLGE36HESry2DJKFrhBH3EMSgNnskCuFzpdQorOJ6Tu1vtJeY/stQLWlbkDCYgS17xPyM4beYIJzW8GmR/5QARP8f7sD6ZmbU3CHyxILjHSXUhc6ZW0vSWhql6Zk5yEc9lvhq4zeMchI8T2XCq/mRixcjWYpwOqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543303; c=relaxed/simple;
	bh=XuzriXIH4ZVyXTd2Jo14EGNEA6R0lhMFbzpoWHiIR+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LLCCFVLFiWHxfYVLjCIHxa6oB14/Ih9tu1/Si5WZxUMjvACVERG9avBCpfBrfQCBJvLAEExb21gmHAqHMlVkM8Z1CkugDmwII22poz1yKQ6wWvhBbjeti66/uJJegiFlNWMCYgvkUXpELaFLv7rqnfwgfbluTQwHqXZFMYKMD/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Krbq/ftc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TEdrVywR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777543301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N07/Ak0OajH65jWxaz0uv/NFa2E5T7TXDwVpUO3pEZk=;
	b=Krbq/ftcrBBNZT+IpYguvVDKmlTE7cw7CLpfUCo7RqO3TRQfphQZ6c3VufLexKgXYQmX/y
	XLaqIrJjJY1xpVc37DKIQX1wsauVyV05erEdwEbR0s34DcKjwulyk8mjWvbx0HJhm6ODru
	sTzQETjh9s34l/8/iuHxmgf8u8ChWyw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-7f2wEo92Mh2Lt55Dbrtdjw-1; Thu, 30 Apr 2026 06:01:39 -0400
X-MC-Unique: 7f2wEo92Mh2Lt55Dbrtdjw-1
X-Mimecast-MFC-AGG-ID: 7f2wEo92Mh2Lt55Dbrtdjw_1777543298
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-488ba2f4094so5185085e9.1
        for <linux-ppp@vger.kernel.org>; Thu, 30 Apr 2026 03:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777543298; x=1778148098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N07/Ak0OajH65jWxaz0uv/NFa2E5T7TXDwVpUO3pEZk=;
        b=TEdrVywRV9zBrU2rwMrU6+AfqntNQrTNdtb7hEW/X5860scw1NpD1Z771lvjJHs61Z
         Q/V+Dyi+sg70FkBZPPQFSi00EOgI/sdjl6wcRbzruc+PtLXVsgPYfsOl86We1pmWzU+t
         DLWmZedZcNszw9EMMAUZgusUWSruO42jx6Imxvmv5fh0fal6yukUyNNTTpCmio2VDvlT
         prdY9fJoLiPKcjenr4S1bM/D5d7UStGl2xuHYBfT2vSLWnW0GB4kDPkepu71CpdIxnDr
         jOl55ml8HITE1UMP6giZxWDfwYYXzqkUwGQv9zokhyz11HbXT261+8eFXKdTf0JMaZQh
         Nkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777543298; x=1778148098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N07/Ak0OajH65jWxaz0uv/NFa2E5T7TXDwVpUO3pEZk=;
        b=GPlKXjwvMLqy+H+zM6+ld7IPoPo0FzoTgDmvpk4MOdk8f5gK7yK6PD9uKUIwP1OXc0
         tbdHDhsyTwBgVXMy33XSamijs0RjtGSZMhBUkLvc2gzIR1Ixm47dqb7B6jWn2F4wF0zU
         Hh9xqchIdA9T3MgqU89qdTprJnnjcGplZkRfhuTijuu3tztTwMAGLGon0f7SQV3temqp
         axlZjVqVu0EhelIbHFjgsEAYqYxEFCOJk1/CdIWQgbunUMUWKin57qAptHULpHeWUBVX
         JVphn5rHlU7JIip55r5KOjV/7gHInevrjN5uWCx3L2I9t84svCmDLoKpbfbdvzx0IYPJ
         XywQ==
X-Gm-Message-State: AOJu0Yw2IvSPZxpNJOz4O4cMH6xUaimOiB61CxElvP1hmHwA4MCmbPgQ
	0BlzaNIhpfI0a0Atb/mOlHEHjJQsPxJZpol7JftdLoQ7L3sxm2LCst6FaBk1EwHwP9XXklOVA2D
	kIII4pTr2b0cErTGzL7BE+CGB7ePDt2OR6kyH/kx+e17/dBYXvBM1FuR7G2pYxg==
X-Gm-Gg: AeBDievhjmI66dKvnPedhzrl8ZZfPisoI+5K8QTjp1vHPoSIxOPAcROMndwYDWHTNKK
	YsF3kGwCDuVODhjQLM/wWnswF6IooArFteNqheVOqHQxTEGaDX25aiIg2xbmC4vcSE0lRHc/vRN
	FTfC2CkeZR27i15g/LS9suZWlRMScAWE/9b8SEYgam041GAsjW1A7rv5+fP+vvvturCshbpNOPS
	gSH41Cu8tRCP3arrs2QvMt2Kp9z1cxG2n68xPjut8SGlzsGOPu+3DzH2ZIPg+rewiJkakA/RY2/
	gMfbWqO9QVquJmm0OZfcTmJ2wYayi3HLWR7eUtZuL/gWYFgDbHwN94ZT0G038xt8Li9Lmpo57Hi
	jGN3uyOhoZoysUSfqEL6udAwJwERheIkgkSExEWNZsJfD74Cz75egYFn2+MuxrSWELA==
X-Received: by 2002:a05:600c:4fc5:b0:488:9e43:9690 with SMTP id 5b1f17b1804b1-48a83e7206emr39045335e9.10.1777543293587;
        Thu, 30 Apr 2026 03:01:33 -0700 (PDT)
X-Received: by 2002:a05:600c:4fc5:b0:488:9e43:9690 with SMTP id 5b1f17b1804b1-48a83e7206emr39044565e9.10.1777543292809;
        Thu, 30 Apr 2026 03:01:32 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b65sm89540355e9.3.2026.04.30.03.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 03:01:32 -0700 (PDT)
Message-ID: <5fb1048c-1b3d-4136-9f10-0525ef063e58@redhat.com>
Date: Thu, 30 Apr 2026 12:01:30 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 1/2] net: pppoe: implement GRO/GSO support
To: Qingfang Deng <qingfang.deng@linux.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, David Ahern <dsahern@kernel.org>,
 Simon Horman <horms@kernel.org>, Kees Cook <kees@kernel.org>,
 Guillaume Nault <gnault@redhat.com>, Eric Woudstra <ericwouds@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: linux-ppp@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>
References: <20260428064717.74794-1-qingfang.deng@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260428064717.74794-1-qingfang.deng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DF70A4A0712
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-554-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,nbd.name,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On 4/28/26 8:47 AM, Qingfang Deng wrote:
> diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
> index bdd61c504a1c..363204e0c49a 100644
> --- a/drivers/net/ppp/pppoe.c
> +++ b/drivers/net/ppp/pppoe.c
> @@ -77,6 +77,7 @@
>  #include <net/net_namespace.h>
>  #include <net/netns/generic.h>
>  #include <net/sock.h>
> +#include <net/gro.h>
>  
>  #include <linux/uaccess.h>
>  
> @@ -409,7 +410,7 @@ static int pppoe_rcv(struct sk_buff *skb, struct net_device *dev,
>  	if (ppp_skb_is_compressed_proto(skb))
>  		goto drop;
>  
> -	if (pskb_trim_rcsum(skb, len))
> +	if (!skb_is_gso(skb) && pskb_trim_rcsum(skb, len))
>  		goto drop;
>  
>  	ph = pppoe_hdr(skb);
> @@ -1103,6 +1104,164 @@ static struct pernet_operations pppoe_net_ops = {
>  	.size = sizeof(struct pppoe_net),
>  };
>  
> +static u16
> +compare_pppoe_header(const struct pppoe_hdr *phdr,
> +		     const struct pppoe_hdr *phdr2)
> +{
> +	__be16 proto = *(const __be16 *)(phdr + 1);
> +	__be16 proto2 = *(const __be16 *)(phdr2 + 1);
> +
> +	return (__force u16)((phdr->sid ^ phdr2->sid) | (proto ^ proto2));
> +}
> +
> +static __be16 pppoe_hdr_proto(const struct pppoe_hdr *phdr)
> +{
> +	__be16 proto = *(const __be16 *)(phdr + 1);
> +
> +	switch (proto) {
> +	case cpu_to_be16(PPP_IP):
> +		return cpu_to_be16(ETH_P_IP);
> +#if IS_ENABLED(CONFIG_IPV6)
> +	case cpu_to_be16(PPP_IPV6):
> +		return cpu_to_be16(ETH_P_IPV6);
> +#endif
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static struct sk_buff *pppoe_gro_receive(struct list_head *head,
> +					 struct sk_buff *skb)
> +{
> +	const struct packet_offload *ptype;
> +	unsigned int hlen, off_pppoe;
> +	const struct pppoe_hdr *phdr;
> +	struct sk_buff *pp = NULL;
> +	struct sk_buff *p;
> +	int flush = 1;
> +	__be16 type;
> +
> +	off_pppoe = skb_gro_offset(skb);
> +	hlen = off_pppoe + PPPOE_SES_HLEN;
> +	phdr = skb_gro_header(skb, hlen, off_pppoe);
> +	if (unlikely(!phdr))
> +		goto out;
> +
> +	/* filter for session packets (type:1, ver:1, code:0) */
> +	if (*(const __be16 *)phdr != cpu_to_be16(0x1100))
> +		goto out;
> +
> +	/* ignore packets with padding or invalid length */
> +	if (skb_gro_len(skb) != be16_to_cpu(phdr->length) + sizeof(*phdr))
> +		goto out;
> +
> +	type = pppoe_hdr_proto(phdr);
> +	ptype = gro_find_receive_by_type(type);
> +	if (!ptype)
> +		goto out;
> +
> +	flush = 0;
> +
> +	list_for_each_entry(p, head, list) {
> +		const struct pppoe_hdr *phdr2;
> +
> +		if (!NAPI_GRO_CB(p)->same_flow)
> +			continue;
> +
> +		phdr2 = (const struct pppoe_hdr *)(p->data + off_pppoe);
> +		if (compare_pppoe_header(phdr, phdr2))
> +			NAPI_GRO_CB(p)->same_flow = 0;
> +	}
> +
> +	skb_gro_pull(skb, PPPOE_SES_HLEN);
> +	skb_gro_postpull_rcsum(skb, phdr, PPPOE_SES_HLEN);
> +
> +	pp = indirect_call_gro_receive_inet(ptype->callbacks.gro_receive,
> +					    ipv6_gro_receive, inet_gro_receive,
> +					    head, skb);
> +
> +out:
> +	skb_gro_flush_final(skb, pp, flush);
> +
> +	return pp;
> +}
> +
> +static int pppoe_gro_complete(struct sk_buff *skb, int nhoff)
> +{
> +	struct pppoe_hdr *phdr = (struct pppoe_hdr *)(skb->data + nhoff);
> +	__be16 type = pppoe_hdr_proto(phdr);
> +	struct packet_offload *ptype;
> +	unsigned int len;
> +
> +	ptype = gro_find_complete_by_type(type);
> +	if (!ptype)
> +		return -ENOENT;
> +
> +	len = skb->len - (nhoff + sizeof(*phdr));
> +	len = min(len, 0xFFFFU);
> +	phdr->length = cpu_to_be16(len);

Whoops, I wrongly replied to v6, but comments still apply here:

https://lore.kernel.org/netdev/9d7f1bbc-155d-4c18-bcf7-732ebe4cbf67@redhat.com/T/#m6c92ba4367355abf1bdb001f102c4847853ac4f3


/P


