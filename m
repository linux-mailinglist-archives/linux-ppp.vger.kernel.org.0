Return-Path: <linux-ppp+bounces-495-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UON8Iofl1GluygcAu9opvQ
	(envelope-from <linux-ppp+bounces-495-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 07 Apr 2026 13:07:51 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E093F3AD7E0
	for <lists+linux-ppp@lfdr.de>; Tue, 07 Apr 2026 13:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B978307EB5A
	for <lists+linux-ppp@lfdr.de>; Tue,  7 Apr 2026 11:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B722D3A784A;
	Tue,  7 Apr 2026 11:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QlIxtOTQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rZcB61Kc"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF323AC0C2
	for <linux-ppp@vger.kernel.org>; Tue,  7 Apr 2026 11:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559926; cv=none; b=BCfFwLoBP4tH5SgzhnBXSsXWcueDu2znkkrAKXz1lx0wZ8otPdOSMwUD2xz0a3e+oVlw1TQqH3m+ZIKYBlOkAYlZt98jsiKXCATziwZXXfEOEpkQ48O7eodwH5Vr4/axgz0pxA4BXo4jgSZAMpI8aJPAIecqmACsdjVqawN6CTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559926; c=relaxed/simple;
	bh=AASHIeM6Gd/EK8pPUVGREs94mOWAxENDbLt05y2wNeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qF+4T3QYsYrMELdPXvl38pzJ33KKR1pkVYigQWCwDMAYVYjj6KLdkeYo2Hyh0z7ZzBP70Lzm7b98rsOtmhlWyh6MHQ1BXveYg5lyybkl4oA+XgWqWR+klz10ybxVh1KZtVRvmtKK6BM8O9+7aTpcKUPvbhHcdLGLd/CSQ9RxR30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QlIxtOTQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rZcB61Kc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775559924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nbK7CgYMpXwezHmMj9q3jIIWcerGUMg8y8tq/mmBKaU=;
	b=QlIxtOTQUIIaQa4+ufBYzZ0rr6Vgs2GsJ2I8C1vgTZv5U6ZPgf+FRysLdeKZvQbN33/KtK
	w3qwjbxl036NkN+JR6fi1VG62zLc5HT52VmRZ5O1NWVkbRqI1/HVX1mJLF94R9wN5lWScn
	A8AKtXkShQz0F6Ppwg0Lzm0Q/7bzJ/Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-lB6AxiJKOxS8w6u8oKPnlQ-1; Tue, 07 Apr 2026 07:05:23 -0400
X-MC-Unique: lB6AxiJKOxS8w6u8oKPnlQ-1
X-Mimecast-MFC-AGG-ID: lB6AxiJKOxS8w6u8oKPnlQ_1775559921
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-488c0fcc6deso2262095e9.2
        for <linux-ppp@vger.kernel.org>; Tue, 07 Apr 2026 04:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775559919; x=1776164719; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nbK7CgYMpXwezHmMj9q3jIIWcerGUMg8y8tq/mmBKaU=;
        b=rZcB61Kc8NPGgYbMzb/JYMGXuNdvI5f5gUsLxbyal5GzR7v165QukGPFpNhy0ofZ1E
         XDx+krKgaeJKQXA/e4Xf5jHfnabAs4abVfIi3+jtvO7sqmMKUSmIIeCDIK3QPLDVvYyT
         pIaf7RK2m+m83coHckxLAGV22SSJ2XVKw8+gWS29ikT5+XRR9gNZPZ3nmSZj4qLu2v99
         xoHGXI3podZuvwWKPOIzVurcOMnxeyTZfccZAV3Q0nNxYde7lo967WpRetGZQoDbC3jA
         zO7N52JlG2tuol+Fnk1Kw6V+Bq5jeUUdYEoeRMgaJQUZCUmlcPA/fO+S+gjCniyd6TwY
         XHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775559919; x=1776164719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbK7CgYMpXwezHmMj9q3jIIWcerGUMg8y8tq/mmBKaU=;
        b=pJvhZXXDDaK8fIwieChit7eM8IWWzYKhZjkZZVSDikTc99dc2UQk1d0X1/NoDtGTVn
         J5bvHUuaM36N6P/fay3eFR28ZUEzaBu6SFH8HkFStm+wWpBh4HQYCnlNLSAbz8BKGvMe
         AjZMuL6tVSaqnrvkYhUiMdl60W9sdQUIQPtcuB9LpeAU+3d29Ik/k9Q5fM9xYeA53ZNP
         mtC1ACQ+WNQyP0frS5Qc4Tx34nUrJ9lB+Pn+hnYItfSA61uj9gBop9ZWxynLk6FDnqXR
         k6ojvogKX98hUoDXIaPazmVRZr35y5h1OaO6kqk7cJFE52H0rfQ8MZUmPl0AgaVrFGC9
         r+Xg==
X-Gm-Message-State: AOJu0YzssgtExsFWSwGtSC+OTRDwCL+8HL8vi09o6MnPFeGWss6suqp1
	Qc2KZRlNzH89eIphBzFB1BYfuc/MKBHDDaVPR2EH3gvhfvXQQckUzgUfe7g4rtnTD2Tg/cjfCJR
	7piaSdeFjte7ncTfSB6aBydGWPiKce5vn90Y408gPvYWBGe55SMvbLu7DtFfZyw==
X-Gm-Gg: AeBDiesSl/KgpelrrnuW4bx8EPPGiJXgV/NRAUzIeSrOY5N+SBCdWgixizT2osfEbYR
	UAabFu6qw8Kfiq0EJ5Mq5+yo+ZdPnW/ecuIX+evHIDFtJKo5nKOvk7PiHH3aUR3Mo5JXBPZEUd/
	X7vFr72wKUixiRJlnREGsQKYMDJHvToId4eeIJeuBfVINGl4i04XK3uDfSEjTCOVGeWZ2jSRQ3J
	8mwwOirFyV5Uvhcu5GKOM0c02Vyu2MQZTeCpK/j9TGNKLMDLDsN8IJusQ2YIdiR3V73L9QwDFOf
	3H4Fd4JFmnU/UOfm8/Q0wXEhF+UhwdY/uTYPczSPNp4aieeHL1eS6Ons8wtSBBb043UfB2jzPL9
	+KiOYLjsPQJmEYkedOhsfxRGKc7XiSz2LLMB9r4obWXFzOrKtowx+8+d95g==
X-Received: by 2002:a05:600c:8207:b0:488:c282:e77e with SMTP id 5b1f17b1804b1-488c282e7ecmr4113765e9.28.1775559919400;
        Tue, 07 Apr 2026 04:05:19 -0700 (PDT)
X-Received: by 2002:a05:600c:8207:b0:488:c282:e77e with SMTP id 5b1f17b1804b1-488c282e7ecmr4113325e9.28.1775559918924;
        Tue, 07 Apr 2026 04:05:18 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d1b19esm165793205e9.6.2026.04.07.04.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:05:18 -0700 (PDT)
Message-ID: <5428a986-98f0-425d-858d-5ef766992d0e@redhat.com>
Date: Tue, 7 Apr 2026 13:05:16 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] pppoe: drop PFC frames
To: qingfang.deng@linux.dev, Simon Horman <horms@kernel.org>
Cc: linux-ppp@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
 Jaco Kroon <jaco@uls.co.za>, James Carlson <carlsonj@workingcode.com>,
 Wojciech Drewek <wojciech.drewek@intel.com>,
 Guillaume Nault <gnault@redhat.com>
References: <20260403083926.68320-1-qingfang.deng@linux.dev>
 <20260406144828.GH395680@kernel.org>
 <e3ada3f0bb0c389d592657b37c462944e633a0d6@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <e3ada3f0bb0c389d592657b37c462944e633a0d6@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-495-lists,linux-ppp=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-ppp@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email]
X-Rspamd-Queue-Id: E093F3AD7E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 5:19 AM, qingfang.deng@linux.dev wrote:
> April 6, 2026 at 10:48 PM, Simon Horman wrote:
>> I think it would be best to add/use a #define rather than
>> open coding the magic value 0x01. And perhaps expanding
>> the comment to note that skb->data[0] is the first byte
>> of the PPP protocol would be nice too.
> 
> The field does not have a canonical name. As per RFC1661, the LSB of the 
> first octet is used to test if the protocol field is compressed, and the 
> same code snippet is used in ppp_generic.c.
> 
> I could instead add a helper function:
> 
> static inline bool ppp_skb_is_compressed_proto(const struct sk_buff *skb)
> {
> 	return skb->data[0] & 0x01;
> }
> 
> What do you think?

The helper LGTM, and could be re-used in ppp_generic.c, too.

/P


