Return-Path: <linux-ppp+bounces-558-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG9oCOCC82kY4wEAu9opvQ
	(envelope-from <linux-ppp+bounces-558-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 18:27:12 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A214A5AB3
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 18:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CA113033AAB
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 16:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F333B46AF1E;
	Thu, 30 Apr 2026 16:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L3ovhBWz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bj0/7EFE"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E844611E8
	for <linux-ppp@vger.kernel.org>; Thu, 30 Apr 2026 16:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777566184; cv=none; b=PGYnknBeqzJMOxzcKDfse2scWhOrhHFq+7hRB6g8Z0S65KuzHx389ZXyKeVWK5tcRtF/Y0W7i5eftMSWA0fpojZWqVRIIoRxVIhG90Vv9ZwMKkuBkb4EhY6HLZq5U6RG7X7dMTvxhsWbSQ+lS38xo/xVS2zc3+Yccuf6k+ZqBbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777566184; c=relaxed/simple;
	bh=K7FRDzKZeTlPZwWQB7S+4RIlk3DjCL2AwjuZeyo+tC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HwjWACiXhOMaevdOV3zAsgvaKFRM9ukLJkYuqC4OjzpNOEF9XyKPtP2xr0jrML3mkFQXUT71vHA4iDkCHpmPOMeZx+EMJjv5dmB2vpLoi9fRwLgaq7hJ+qe6z6uhscaT5jgCormciQmDK4Ssd1BuAlRtVP+cWcflgwgsouhevpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L3ovhBWz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bj0/7EFE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777566182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mGVTGRbGFblsakPRXn91Stl9dK67n1p85hK2XKk8RFw=;
	b=L3ovhBWzLsAoAS+dzOQS8gbosnv7oYx3pppsbooEJan2UJg0dpd2mzGR5mizh1HYY2j9py
	Wqyn+BTs5b7FguHi2H7L5E21iH6bbVaHIAGjGGnZ+cvnFaey0zaJwnaji3NjK27cLGSF7t
	cYk6HLZXQFA/fsv1F0frqj2FW+u+i4I=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-ujsz8rXGMuyA73VyNPQrjw-1; Thu, 30 Apr 2026 12:22:59 -0400
X-MC-Unique: ujsz8rXGMuyA73VyNPQrjw-1
X-Mimecast-MFC-AGG-ID: ujsz8rXGMuyA73VyNPQrjw_1777566179
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d812c898cso26710281cf.1
        for <linux-ppp@vger.kernel.org>; Thu, 30 Apr 2026 09:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777566179; x=1778170979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mGVTGRbGFblsakPRXn91Stl9dK67n1p85hK2XKk8RFw=;
        b=Bj0/7EFEXTw8wZ8OGSi8eHMpTaVpDFwz1UNDMnFacZl9tvvxi0p5rH0KGsbICO/ycB
         f95vDPPU06xNBCDQ9LXtFhuMWSg8egFnT5jXQ9rKeG+sI1Tm9y1erTcJPnIcQrduOkhH
         WHRauEr6oP2d+uHjxxttUFG63Wmr0+sSskiB/7qMLAvg51gHo42dV0CqF+AgpMwQDUBt
         AvQNYJgNKyzrSBfRZA9U+z2XqxORVErQGDt/KiRcSRcDvQudWjEx9iq62XCCgz2LtZc/
         Ydt5tx9W1FSMx+KI5hhZsI+l/S7AyKa7yn/vzvvrv+zIjCZn94WO9m0JKMXGRKiVxXZ0
         0/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777566179; x=1778170979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGVTGRbGFblsakPRXn91Stl9dK67n1p85hK2XKk8RFw=;
        b=E9449yozwMjy/7eF494BphEGsY32Y4WbTe9GK5veGfBBrmriR4C5l/f+Mm5t3ysky1
         xPUtmRNonNAmKDqEpiHZAZW1JoBl4ePr5SEFDD22Z8V/+nSXwwmIXNghIABQmypqO7Wu
         Ki/qrEF9EJ6oUP/TygxzmXH3KSrniJF+uKKPmcFOjUDyXIZeyyyvqR7bBb2sMg2kckw2
         PIIFpLgHJNwdp27SDlgHMXUrA1l7KWATMvpakIVhJpv+V/g+XKDB/w/TI6eAAjPKsI6V
         31mteNZI1WNjmnyD5nz14UFMKG4DVL1CgAeqQE2M6b9+arPM98SJS1KK5mOkcipkjMKM
         Ohow==
X-Forwarded-Encrypted: i=1; AFNElJ9/CqvL4dUK1WD1P5p2GMDdAqW8GaCj9mjZ2nmbslNfBkWD/Iu2gUvDU1ijPnvQY5HvZAKf1wIuoog=@vger.kernel.org
X-Gm-Message-State: AOJu0YznpfA9PL0GGfr/R8w/PyXGKQ0AKKsQIHKGJtYoZRWcR3eMNwEM
	xc0iHWzjNdJ5BzfSV/wMeUl/rCmkK36d1XA83oDAmPCSbKhhupTqcFXJWmMjR9dOOpo6g0wcfaW
	1k8m1MR00ifisCbYKJaao98cosqib6PzZlVY5321JfU8gbFwiyR6DfOmK+YK7pw==
X-Gm-Gg: AeBDietDi4IxiMhkjH3b+gxCip+Zjr3/Qrm8E7ARcOL9c3maCYLpKKMNk3VyB00aeEg
	EvSmdZN3sjOAy9NReJLXqsA0/dx7Q1w9vCskAs/BA/5wNx2gcAH5nBJgxImE6Gh4L7BmX/hwTi1
	r46aPwytG8KnMblt3O5t1re0feLN43wMF2Kkg0UjILuwgZ7WlHe/4iyEWsqtbberOoLfN7bPz/R
	xvYX5hP1v02+pon2TLvBtRIVifUqmwfMcIsFrg4tjAXDJQyn9bCe+jca49AP/eD/DtKeXiOmEvz
	wre06hnJFZ+cvXMpCqATb/dQlwPQiHPvJt4JsRcCYMURc5VxGOMfd2+FarU21t6QjsilFiwPVLf
	rW20F1cCD3NJQzuv3VMYOPL7TSViEPKTrfKp1J2lTD//Iv+9AHGRZeLEOgrG/xgz/HQ==
X-Received: by 2002:ac8:7d05:0:b0:50d:84a7:72d0 with SMTP id d75a77b69052e-5102ad9b157mr48846771cf.36.1777566178707;
        Thu, 30 Apr 2026 09:22:58 -0700 (PDT)
X-Received: by 2002:ac8:7d05:0:b0:50d:84a7:72d0 with SMTP id d75a77b69052e-5102ad9b157mr48846331cf.36.1777566178268;
        Thu, 30 Apr 2026 09:22:58 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.27])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5103b71c304sm1685121cf.29.2026.04.30.09.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 09:22:57 -0700 (PDT)
Message-ID: <40a6d40e-4312-4a1b-bf90-9e009b29de68@redhat.com>
Date: Thu, 30 Apr 2026 18:22:54 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v6 1/2] net: pppoe: implement GRO/GSO support
To: Pablo Neira Ayuso <pablo@netfilter.org>, Qingfang Deng <dqfext@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, David Ahern <dsahern@kernel.org>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org
References: <20260326081127.61229-1-dqfext@gmail.com>
 <9d7f1bbc-155d-4c18-bcf7-732ebe4cbf67@redhat.com>
 <CALW65jYB1jWS5LnSxRCrEeCpPfhA8saqbYYfU-LkPh_25gWfsw@mail.gmail.com>
 <afN7_oBICMZ_45Zh@chamomile>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <afN7_oBICMZ_45Zh@chamomile>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 98A214A5AB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-558-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[netfilter.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 4/30/26 5:57 PM, Pablo Neira Ayuso wrote:
> On Thu, Apr 30, 2026 at 11:47:57PM +0800, Qingfang Deng wrote:
>> On Thu, Apr 30, 2026 at 5:34 PM Paolo Abeni <pabeni@redhat.com> wrote:
>>>
>>> AFAICS, when the computed len is >= 64K, and the above min() will
>>> truncate it, later pppoe_rcv() will drop the packet.
>>
>> pppoe_rcv() does _not_ drop such packets.
>> The drop condition is "skb->len < ntohs(ph->length)", not the other way around.
>>
>>>> +     skb = segs;
>>>> +     do {
>>>> +             phdr = (struct pppoe_hdr *)(skb_mac_header(skb) + nhoff);
>>>> +             len = skb->len - (nhoff + sizeof(*phdr));
>>>> +             phdr->length = cpu_to_be16(len);
>>>> +             skb->network_header = (u8 *)phdr - skb->head;
>>>
>>> I understand is quite late for the following question, but...
>>> The network headers points to the pppoe hdr. Should it point to the
>>> actual IP hdr?
> 
> This is the same with double-tagged-vlan, the network header also
> points to the inner vlan in the skb payload. Changing this would
> require to revisit all users in the tree that are already assuming
> this.

Ah right, the relevant GRO stage is running on top of an ethernet device
and the RX path there resets the NH just after the ethernet one.

I got lost in the relevant hooking.

This patch (and v7) LGTM, thanks.

Paolo


