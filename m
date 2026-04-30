Return-Path: <linux-ppp+bounces-553-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIFQLm8i82nIxQEAu9opvQ
	(envelope-from <linux-ppp+bounces-553-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 11:35:43 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F59249FE56
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 11:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CA70300E387
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 09:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A30D39A054;
	Thu, 30 Apr 2026 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Al/tUgIx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OiXgsBrY"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B983932FA
	for <linux-ppp@vger.kernel.org>; Thu, 30 Apr 2026 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541666; cv=none; b=bezYWsBDFQEPvVXV/e8gp2mQ4FkQQLBhaakdncatzAt2+gMUAcvwGMe3Phn0Pcbk8KR9PNjJtLnFk0/nQ/KjBhDpP5sB36cMex7BpXTeNrMrF1ZuD2LiZ9HkeTFR+Af6Pqbh+RXKPBRUwQEq61XgoMqhDT8d/cr3AK8rIJiYQWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541666; c=relaxed/simple;
	bh=6TManpl4gcqzmqAn+8fUAGVRHhuyH7T7ouTpR8dqiSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=icVkcBDoERPe53AmHY3BFoS3jnt6a3ULcrHlpvOqH7jA/u9LEIZ+CsNPpZC+PQBMrsecSYcMZTlJ6SELgrAyLDjMP1ACSl1cZVSl7Iyo840XFjrdN5edHv2wjY485HJbA3cS0bvVEHoDY28aWYHftjyNCOTSg4XSHTL0tFp7oJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Al/tUgIx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OiXgsBrY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777541664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RVHyDFwjO6klzKvDUezrJjMUwHWUlJqJfALG2/aYsdI=;
	b=Al/tUgIxpfzmiDVSGlueEt0G5x4dxbrfRAQeZUqr0ra8pCXbf8wt8noSNOIuDwHiR3nLBN
	cF4LG0OiGK0ZLuGKjvYIUD894XC9HWjW6MxLrbJF6nhIUGDQOPyHIyw5v6sDMZG9RmFqNu
	rXzTcXRdxSzOYavlVCMjE9Yq5ERtYtI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-JeUa9wsFNG2g70tqQEE7Lw-1; Thu, 30 Apr 2026 05:34:22 -0400
X-MC-Unique: JeUa9wsFNG2g70tqQEE7Lw-1
X-Mimecast-MFC-AGG-ID: JeUa9wsFNG2g70tqQEE7Lw_1777541661
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43d1dea12aaso618377f8f.1
        for <linux-ppp@vger.kernel.org>; Thu, 30 Apr 2026 02:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777541661; x=1778146461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RVHyDFwjO6klzKvDUezrJjMUwHWUlJqJfALG2/aYsdI=;
        b=OiXgsBrY+SZzSz1ZH+nyxFo5mHQ96KWjIOiiNG/RxX83uiZbip9eRrJti1ZIPYy4eO
         5Wgt4sFhZAelDNKRXfYeN88aVfBDwT35NSnRqqMnWE2g/Q+2L0ZHM6IYQDsfE+jU+rw/
         V+UsuiIWYO2aMAR52/XPfuXOrO4ASROqG0yeJ0rseO4NEak8N33EuzGHSqV617vcXXCj
         ATfi3NohVHrFdl1ka36Wk64UUtDcfnSg+05qhUztgFZuufTFrkYmFD+cg88wql2QAncK
         OQPVlzk86vYWvqPRfrzYzEmMOWyRtQL7rJ5edu5mLJenYOXHxvC+qt7X1Vh4FZeGUYpG
         Btuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777541661; x=1778146461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RVHyDFwjO6klzKvDUezrJjMUwHWUlJqJfALG2/aYsdI=;
        b=by1d+VFz896Pypue6I5jkfclDaQD4XL9o1EdPNpQlchrUlKaD953E3tn89S2eSNe9n
         dH2BHZIwwD6ecW35a2uu3+fRwLetwQ6eoT/ygWhp/5iVSMn3+ZD1Ag5HrYMPSV840Uu8
         3AzHCCA3Ibq6zY9Wily5e/T/0qTgYWLmzoKUNU5x1Ng8QQglvCW2kJPgrZEnTdubQkMK
         R9an0oa3OWl78Mjgxi5D/cyo+MzRsqSlbR0LQpUC0YcPAsFvT/O16X56jbz9oTH5mzC5
         prXtdTmGk8Je9q8JKxzuYGC/9MsuPQZRIspQXMn02OT2ixfCyY9W8sJUULppAe2psBzA
         Y17g==
X-Gm-Message-State: AOJu0YxpB4sQQmWPnKiozy1H4eHuyQwc+Fc0AyQ9wjZcE7neqK9gTyNU
	In2M8BY0+76T7J0eIeL7IAAPmc/sk9n0x66P8QUxsgjVv2rlmiEAeJTHibdWo+RwegUv1iTi43s
	uSNc5D4i1odW6lfPT61X+6t4WjNKJUocUl04vzAT1qdObuDR0azow2/Z0KnYRZA==
X-Gm-Gg: AeBDiesLjbW2CWhO+YEe+gDoV8m89a/5IUKAkoxJXFYBUAtsBIcj7mznA6aB+Dn43Q+
	TEBTVYATDGO05+GLrB8ahavT8OIuxO/Fp+lrM91qxOm9pD6ylbFWr0+MVWgpBhbwHxoxbAHK98t
	jAUVIulNsKUz1HYdYANtwH5AZ0jv4/DQwXkVO6s8Izs9GddZS3/sADHWhb5DWKQfAMsKEJ6wL9Y
	kdDvvUVZ1pKlEk0azRh5zwtXJz93Vnhl/TJMHzUOP9qiDEuM81norB1J4pxetBy2PET1EYXyQRg
	8D7XNtEOQFwAx2dpLg7FicJ7SkJySLD39sEVNxVFRUGVq6jlmHzULyYu8oQ75t+IJgi9x7P3EVY
	h36UHPZCBXbC+wgYB8BJS9n/LUvHkyr7Uv5BY6s/sl0fBGAEfhERPvcrrmPVrxTYE/g==
X-Received: by 2002:a05:6000:40dd:b0:447:55b5:d532 with SMTP id ffacd0b85a97d-4493ec62a60mr3634737f8f.37.1777541660745;
        Thu, 30 Apr 2026 02:34:20 -0700 (PDT)
X-Received: by 2002:a05:6000:40dd:b0:447:55b5:d532 with SMTP id ffacd0b85a97d-4493ec62a60mr3634660f8f.37.1777541660114;
        Thu, 30 Apr 2026 02:34:20 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c0csm11853942f8f.29.2026.04.30.02.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 02:34:19 -0700 (PDT)
Message-ID: <9d7f1bbc-155d-4c18-bcf7-732ebe4cbf67@redhat.com>
Date: Thu, 30 Apr 2026 11:34:17 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v6 1/2] net: pppoe: implement GRO/GSO support
To: Qingfang Deng <dqfext@gmail.com>,
 Michal Ostrowski <mostrows@earthlink.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, David Ahern <dsahern@kernel.org>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: linux-ppp@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
References: <20260326081127.61229-1-dqfext@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260326081127.61229-1-dqfext@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0F59249FE56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-553-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,earthlink.net,lunn.ch,davemloft.net,google.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

On 3/26/26 9:11 AM, Qingfang Deng wrote:
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

AFAICS, when the computed len is >= 64K, and the above min() will
truncate it, later pppoe_rcv() will drop the packet.

I think you should prevent such case at GRO time, flushing the chain
when it grows too big.

> +	phdr->length = cpu_to_be16(len);
> +
> +	return INDIRECT_CALL_INET(ptype->callbacks.gro_complete,
> +				  ipv6_gro_complete, inet_gro_complete,
> +				  skb, nhoff + PPPOE_SES_HLEN);
> +}
> +
> +static struct sk_buff *pppoe_gso_segment(struct sk_buff *skb,
> +					 netdev_features_t features)
> +{
> +	unsigned int pppoe_hlen = sizeof(struct pppoe_hdr) + 2;
> +	struct sk_buff *segs = ERR_PTR(-EINVAL);
> +	u16 mac_offset = skb->mac_header;
> +	struct packet_offload *ptype;
> +	u16 mac_len = skb->mac_len;
> +	struct pppoe_hdr *phdr;
> +	__be16 orig_type, type;
> +	int len, nhoff;
> +
> +	skb_reset_network_header(skb);
> +	nhoff = skb_network_header(skb) - skb_mac_header(skb);
> +
> +	if (unlikely(!pskb_may_pull(skb, pppoe_hlen)))
> +		goto out;
> +
> +	phdr = (struct pppoe_hdr *)skb_network_header(skb);
> +	type = pppoe_hdr_proto(phdr);
> +	ptype = gro_find_complete_by_type(type);
> +	if (!ptype)
> +		goto out;
> +
> +	orig_type = skb->protocol;
> +	__skb_pull(skb, pppoe_hlen);
> +	segs = ptype->callbacks.gso_segment(skb, features);
> +	if (IS_ERR_OR_NULL(segs)) {
> +		skb_gso_error_unwind(skb, orig_type, pppoe_hlen, mac_offset,
> +				     mac_len);
> +		goto out;
> +	}
> +
> +	skb = segs;
> +	do {
> +		phdr = (struct pppoe_hdr *)(skb_mac_header(skb) + nhoff);
> +		len = skb->len - (nhoff + sizeof(*phdr));
> +		phdr->length = cpu_to_be16(len);
> +		skb->network_header = (u8 *)phdr - skb->head;

I understand is quite late for the following question, but...
The network headers points to the pppoe hdr. Should it point to the
actual IP hdr?

Why not? A comment in the code or in the commit message would be
appreciated.

/P


