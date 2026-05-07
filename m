Return-Path: <linux-ppp+bounces-568-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNZ3Of4//GnfNQAAu9opvQ
	(envelope-from <linux-ppp+bounces-568-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 07 May 2026 09:32:14 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E6C4E4101
	for <lists+linux-ppp@lfdr.de>; Thu, 07 May 2026 09:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 018043020113
	for <lists+linux-ppp@lfdr.de>; Thu,  7 May 2026 07:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CDC318EF0;
	Thu,  7 May 2026 07:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L6ZlA7Rm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IesSLbRa"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656BC2D739B
	for <linux-ppp@vger.kernel.org>; Thu,  7 May 2026 07:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778139129; cv=none; b=YVN5aDc9T4qBQcGOXVVpqK8MMb5ep1QNTyPwo2IeFnAax9O8nyH/6KstBaPAUYOqTJbebA9/MxMNguOL0Gl0LiAGvPyAcP4V2waf6RVbYy39G2x6BS+uXgbegwONHNe2PaEejF8ZyiYq4iNWRy32yBEd96oUudzKnMhsCxfnLjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778139129; c=relaxed/simple;
	bh=HsGMEhUZAT9fbCcg+Bq391eAyCLcB/mx8L0Lh4WnyEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bf4APB1Tlawi6bQ0obOOgUI1cUTTC44UknEp67HhJSB1zi14Pin5a6rQt5eFz937cmshsFUqEtb9OTWborxxt8ibLfltK0NoAw1UGx6dE4T+6spRCbySZVV3nOdLbc6Wvf92DLE8qmbTgPBUh1/szL3LnJDIJuZ52246bx6YTEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L6ZlA7Rm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IesSLbRa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778139127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jxWlRoeKkA2ok8M69esj27UbK+Xcl6hGq3Av3kN5L/s=;
	b=L6ZlA7Rmfb6BR05j83xs3svlxx000JY5q1uMmj8PbA+7bIQ6kz/Svie9vUMHijPVDQggl6
	DVsnaty7kV9WXYZNnlOVfl8gGEqv/5C4IqDS6iGgBcb1IQ06gIM7Xq3XMNU7FbFQhdWsMZ
	tTYXeaxCePNCJVZyCOyYsNgco8wRh3g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-_p3f-NY3PEe_XI9xedoWiA-1; Thu, 07 May 2026 03:32:06 -0400
X-MC-Unique: _p3f-NY3PEe_XI9xedoWiA-1
X-Mimecast-MFC-AGG-ID: _p3f-NY3PEe_XI9xedoWiA_1778139125
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-488f973ddfeso3330265e9.3
        for <linux-ppp@vger.kernel.org>; Thu, 07 May 2026 00:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778139125; x=1778743925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jxWlRoeKkA2ok8M69esj27UbK+Xcl6hGq3Av3kN5L/s=;
        b=IesSLbRaRtf3Pr3V0TR2LoAoJSIwaPP3HTW9SKdqbOKsYdtkUIlrG+IUlCzOrzRe2a
         D0SdRIIeINclRFRCbrYtBrl9f447fONgSyAMXfCnUlPNB1x/t3cffoVf/DuryWWKZ6nF
         +10hAuuwJE2deY7lS5TI/Tc13Sp3q9IISJCCHZcs40nSLANF29yR4D7zhXAWavSuEoi8
         XQSkEIV4U/cEVPHpvOUdZYUzzy29AenCPEYmzxtKE8cB1NDi8wB6kmVqHQstX+m3FHei
         Bt8KBvX1LW59ujMQK/s9XjU92mk7MRBzgwcDPEUJbpucKclQorhP5p0znOWWzJHkKok1
         pk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778139125; x=1778743925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxWlRoeKkA2ok8M69esj27UbK+Xcl6hGq3Av3kN5L/s=;
        b=n9UNJFIGhh6VeQ/XQ9y40efXo5RL0OkFWpyR6YgF/Zh61n3oCIpQCTVj9phERbrDDp
         CAPvpl7fvj3dDYiYx7OLuGHI0ohLizalsmWzQIs8KWeOAhtOl7N1B25GXd0p2ULFdBjP
         U1RkLlBByKo+rqlyD6Xz79ttZcdxfhKOi4054t4fMsSqG7KkmeZqi/YhGROQb+T+skT7
         0sKQ1kuw9yMTzryb/Rp1G70SFHCT32C6f1egVM3l4/Cp2FRTt9cxgqNW5J30qkZcIHN0
         +FJjHr+Bx1TqWHxGZilVSTl1eTlxS33uPWjOAUcRf5t2dXAS6fWvu7gtghWwxPAND6tX
         Tl0A==
X-Forwarded-Encrypted: i=1; AFNElJ+nFL0rnFB4v810XbNRlrRi0zkAhudez9lNDv8glarvVprytHpsNy0GSTzaZhsos8l3tQiYoI9CcQE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfj8VetGMBqIAaISQT6ceAR42/3uJwy00luJHiO1EckuIs0oWi
	4kWAQL5tSnqa7eUzwjj1iSBovJuAO8bOvMGdyLpU2oPFMgeruo8tV6P3XbTLRomcfzGnAEI7AKK
	nSn+P7TR+GAxVnPW/cAs/GZQPZVuenEfbGj+TSCwKdqMG4EACg0VYtuHX/2fTAQ==
X-Gm-Gg: AeBDiesV+F26S9grlLvkWj/z6yDcRe/5ACkbDfBjuPyVopOrGidHelfVvwDN7nd/3v4
	2we1GAuavGXdYkANohpadMgDOgGPsIlx7oUstVgsSXvpQ+7F8c9USG8YNOiaEJ9eaf6uCwkOw83
	GKioDO0va30mdg4hpXyy5cuPrvH/G3H7KZMGQQbz4pR/mxMSDtIxY2N1dKb/pHjLq4DvTEcclN4
	Uec8lqLkhW/GqriezW6c7lI5Q0pjpxdCJ97bQydmIK1kQeGL3D+jtU5JNgWaBG/r2PPfz9ZGytO
	nYtR4LdNIj2h0AWbUed7cnnxqInh5W/UK/T1IxyH9e6c+/r3Fz33V105vKZFvZ/6K88+HCcmzfd
	hrwcjzGSpPQe1WKsugBVUdW8MkDg1EH6m5j+OuvIaGDEmkzMO0/FjaF/KycSUNV4g/IfJrwlyDI
	aM
X-Received: by 2002:a05:600c:a411:b0:488:af48:af11 with SMTP id 5b1f17b1804b1-48e51e08ce3mr81023485e9.1.1778139124641;
        Thu, 07 May 2026 00:32:04 -0700 (PDT)
X-Received: by 2002:a05:600c:a411:b0:488:af48:af11 with SMTP id 5b1f17b1804b1-48e51e08ce3mr81023035e9.1.1778139124218;
        Thu, 07 May 2026 00:32:04 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530a67dcsm50966955e9.2.2026.05.07.00.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 00:32:03 -0700 (PDT)
Message-ID: <11416095-4393-4a28-a7ac-db090960c9a7@redhat.com>
Date: Thu, 7 May 2026 09:32:01 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] ppp: unify two channel structs
To: Qingfang Deng <qingfang.deng@linux.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 David Sterba <dsterba@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Mitchell Blank Jr <mitch@sfgoth.com>,
 Chas Williams <3chas3@gmail.com>, Simon Horman <horms@kernel.org>,
 James Chapman <jchapman@katalix.com>, Kees Cook <kees@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Taegu Ha <hataegu0826@gmail.com>, Guillaume Nault <gnault@redhat.com>,
 Eric Woudstra <ericwouds@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Dawid Osuchowski <dawid.osuchowski@linux.intel.com>,
 Breno Leitao <leitao@debian.org>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net
References: <20260430090532.244758-1-qingfang.deng@linux.dev>
 <20260430090532.244758-2-qingfang.deng@linux.dev>
 <590d7931-02b0-45d6-8f43-ef909c9bde89@redhat.com>
 <c9993ee6-4023-4331-a1c1-4e30952146fe@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <c9993ee6-4023-4331-a1c1-4e30952146fe@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 62E6C4E4101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-568-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,lunn.ch,davemloft.net,google.com,kernel.org,suse.com,linuxfoundation.org,sfgoth.com,gmail.com,katalix.com,linutronix.de,redhat.com,arndb.de,linux.intel.com,debian.org,vger.kernel.org,lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email]
X-Rspamd-Action: no action

On 5/7/26 7:53 AM, Qingfang Deng wrote:
> On 2026/5/5 19:16, Paolo Abeni wrote:
>> On 4/30/26 11:05 AM, Qingfang Deng wrote:
>>> Historically, PPP maintained two separate structures for a channel:
>>> 'struct channel' was internal to ppp_generic.c, while 'struct ppp_channel'
>>> was the public interface that drivers were required to embed. This
>>> duplication was redundant and forced drivers to manage the lifecycle of
>>> the public structure.
>>>
>>> Unify these two structures into a single 'struct ppp_channel', which is
>>> now internal to ppp_generic.c. Drivers now use a 'ppp_channel_conf'
>>> structure to specify registration parameters and receive an opaque
>>> pointer to the allocated channel.
>>>
>>> Key changes:
>>> - ppp_register_channel() and ppp_register_net_channel() now return
>>>    a 'struct ppp_channel *' instead of taking a pointer to a driver-
>>>    embedded structure.
>>> - 'struct ppp_channel_ops' methods now take the driver's 'private'
>>>    pointer directly as their first argument, simplifying driver logic.
>>> - ppp_unregister_channel() now takes the opaque pointer.
>>> - Multilink-specific fields are unified and handled via the new
>>>    configuration structure.
>>>
>>> This cleanup simplifies the driver interface and makes the channel
>>> lifecycle management more robust by centralizing allocation in the PPP
>>> generic layer.
>>>
>>> Assisted-by: Gemini:gemini-3-flash
>>> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
>>> ---
>>>   drivers/net/ppp/ppp_async.c      |  51 +++++-----
>>>   drivers/net/ppp/ppp_generic.c    | 161 +++++++++++++++----------------
>>>   drivers/net/ppp/ppp_synctty.c    |  51 +++++-----
>>>   drivers/net/ppp/pppoe.c          |  34 ++++---
>>>   drivers/net/ppp/pppox.c          |   4 +-
>>>   drivers/net/ppp/pptp.c           |  40 ++++----
>>>   drivers/tty/ipwireless/network.c |  30 +++---
>>>   include/linux/if_pppox.h         |   2 +-
>>>   include/linux/ppp_channel.h      |  49 ++++++----
>>>   net/atm/pppoatm.c                |  61 ++++++------
>>>   net/l2tp/l2tp_ppp.c              |  34 ++++---
>>>   11 files changed, 271 insertions(+), 246 deletions(-)
>> This patch is IMHO a bit too big and should be split. Also this kind of
>> refactor looks very invasive and potentially regression prone. I think
>> it should include a signficant self-test coverage increase.
> This is indeed too big. But how do I split it without breaking the build?

This is indeed a good question, but I'm really unable to give you a good
answer without allocating to this topic much more time than I have
available.

I think that the (indeed smallish) mtu changes could easily go in a
separate patch.

You could try introducing the struct and/or variables renaming
separately, with no actual functional change, i.e.

- one patch to rename ppp_channel -> ppp_channel_conf
- one patch to rename channel -> ppp_channel
(possibly adjust accordingly the variables name if can done mechanically)

no idea if the end result would be more palatable, but possibly worth a try.

/P


