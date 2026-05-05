Return-Path: <linux-ppp+bounces-562-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK09G/vR+WlHEQMAu9opvQ
	(envelope-from <linux-ppp+bounces-562-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 05 May 2026 13:18:19 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3664CC66D
	for <lists+linux-ppp@lfdr.de>; Tue, 05 May 2026 13:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A11CB302B91A
	for <lists+linux-ppp@lfdr.de>; Tue,  5 May 2026 11:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B9F3859CE;
	Tue,  5 May 2026 11:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YzDLcxWe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WWk9pip1"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB063845C1
	for <linux-ppp@vger.kernel.org>; Tue,  5 May 2026 11:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777979803; cv=none; b=V1xx1spvez7Y2DsICcaeWs8NhdGQdrf4geQFhsfJN35ujhprTFLnI/04GQvil2mgH2K0bkCE1dGDaA/6uv9HSH+fHxLK0MDWp5G7MxJNHq8naSssmhkTYF9tF5cwYmdkfVfZoMT7yyFt3ojRZsK4R+KrFledmh34wWj0QHbHjgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777979803; c=relaxed/simple;
	bh=bjXwy8ZUBPC6//gkl3zE6N9hnucx6t+HiWYx6T30AZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=S0uygkhZsC20beoa4yZave0BTPBM82MTpt5qhW+LoYLikWXvTaacorJun7METFdMgTd91lh6NV4JdxoPobkinZ+UwUSh46OUozsdlgRVJij6IcdOWuj5+rpRpexARYniG8udq74lGZ9ql0AlBWTZ/12ntlqM7bIjP+99wFcAJqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YzDLcxWe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WWk9pip1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777979801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gKLj022WQBJqvFpf4FNV0Kj7LtHJ8BU+/iBu6AWWa9I=;
	b=YzDLcxWeVVqmf3b2lLuNqr0z0lpQM3es8kEILlXFFNwOhO6voBUusm8LXps966irF0Dtl5
	s+j6iaadwvUqHgsIa4rvWR3kETuWQ9fCLxplNnXwZ83ZJxq+tARK1BmpUibhZjIX+1PVn0
	OqcFRl0WeULpNatMRhd8/akNFElJLEI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-a-ZYNOp1P2qg9mGrFhBgVw-1; Tue, 05 May 2026 07:16:39 -0400
X-MC-Unique: a-ZYNOp1P2qg9mGrFhBgVw-1
X-Mimecast-MFC-AGG-ID: a-ZYNOp1P2qg9mGrFhBgVw_1777979799
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48d104d1d8aso12186365e9.3
        for <linux-ppp@vger.kernel.org>; Tue, 05 May 2026 04:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777979798; x=1778584598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gKLj022WQBJqvFpf4FNV0Kj7LtHJ8BU+/iBu6AWWa9I=;
        b=WWk9pip1l/z7+Odnip4EIiEwh0y4bj0VGw+pbSwbDoulge7EN8r41BRAr3LwNhxSbn
         Juw4pmxkTggs82uAPaJOGoBVrGp25geF76ID5L2EJ1Kl9CMEvFBdj2WH4jxvnHxnND0A
         WQFhfvVK/aza0PDzR7MfFPxxZLeci49co1rfH6gYZTe/9SDDonwFbwj1UJOHKSQaWwkU
         SA4zaGL/1KklarCHFCmSEpW1ewP0p7z481AX3h8y8te9wAN5t0wGpvfnjjY+WXwWNFr7
         t8kvvgdewtY3OWr+Bo4xNvJjiTgnvpNknXKcrFukYrAPQCg/A3GDRFRD6t9wxa1z4qat
         E5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777979798; x=1778584598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gKLj022WQBJqvFpf4FNV0Kj7LtHJ8BU+/iBu6AWWa9I=;
        b=aZF9fW9TiHmdJwy5ZPMpuqNh+RYes5HhqjjCbZ6cBRuZJHnz6AMIyDH8L+16uMEv3f
         DV56srZ/RSkM6LwLqSvbHTbkf+SUWBPQrIwqWQtVu7vtN1e9E/nB2qS1WpIV+W/gfIj7
         XTRFKUAynnLyvl+rNEE5tnypPy7MXU9JT3yMTjwvr8p4gTog5iCmpEuDvbOVPM+eLvPC
         H+k6h/MMrzE/A3CDZak5qIHg5fhVEtRtSs7jAT+3wOHdRekRB4/RtZb9SYOXZKwyFfoE
         8RxugAuMiRm/w9yTEVL7nGPnmxC3S+zZGJPjn11PlGyQbpSDtQBL5EXcNRO/1mhpNv21
         9i+w==
X-Forwarded-Encrypted: i=1; AFNElJ9yzpb63CEF8Y+rX9aQbF74JJhuEeimAYnUP2345DLh9MvGa6MXz7gSpHp9nOmsuDACGxw3Ocud6eE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Z1a7FHc0IZI/gxaGpco5PoKa/vkkPC0jG+7jrZqUW4C0lNm8
	GhKk9ISOv09iU46l2LkhaCsoYg2YGeAe+UZeLjrRjEmdUI7rep2JGJ8rOn/7nGQGUWcUYnPgIVA
	pVKHuB0z3hQaxYh3nfo9KJTzYpVo7LVa9Qt14Su3NUthjCadwwpne0QaigQ4bDQ==
X-Gm-Gg: AeBDieteDzXPYn6IFaBiI9ws5aNKpErZk6EEY6eqFZwYMFHOXxwokeqhxxsSuHe4+sq
	5P8wPrHkah1fnqG9oj0QPrqcMmFc3eUYkeLbP710OaZ7rHfYiAqPj2LAucgaRIVXUdy2ZQiMqoL
	yU+N3/vR0ZWgwLqfhntySABzPt5DRODa1TvaFZqoM/WaGHMlhQxdy5TTCa6K5n1YDgrqg3BDR5+
	FvOf/uZO82Xr5CS14c5gUBDKQGka+LYXIfvhWuVNz2PP83wxDfsZTaITMq1yJhtTWyrkhxWOJM/
	frv99r7/ws2Mw0lqRJZQrscHV3P/4aVvs2iv56PXjAFomcK3+mcg7Uzgq6jQo0nIHjrZyl2jOYu
	eWZyc0XP0xwGvAZod/aV5SkpQ9gpbMOaIRidIoM0g32iahnXWDcakLgasB8uCNH3MIak=
X-Received: by 2002:a05:600c:5296:b0:488:8bdd:cfcc with SMTP id 5b1f17b1804b1-48d17fe008emr38457105e9.0.1777979798475;
        Tue, 05 May 2026 04:16:38 -0700 (PDT)
X-Received: by 2002:a05:600c:5296:b0:488:8bdd:cfcc with SMTP id 5b1f17b1804b1-48d17fe008emr38456175e9.0.1777979797935;
        Tue, 05 May 2026 04:16:37 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.155.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d14786d8csm17752945e9.0.2026.05.05.04.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 04:16:37 -0700 (PDT)
Message-ID: <590d7931-02b0-45d6-8f43-ef909c9bde89@redhat.com>
Date: Tue, 5 May 2026 13:16:34 +0200
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
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260430090532.244758-2-qingfang.deng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: BB3664CC66D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-562-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,lunn.ch,davemloft.net,google.com,kernel.org,suse.com,linuxfoundation.org,sfgoth.com,gmail.com,katalix.com,linutronix.de,redhat.com,arndb.de,linux.intel.com,debian.org,vger.kernel.org,lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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

On 4/30/26 11:05 AM, Qingfang Deng wrote:
> Historically, PPP maintained two separate structures for a channel:
> 'struct channel' was internal to ppp_generic.c, while 'struct ppp_channel'
> was the public interface that drivers were required to embed. This
> duplication was redundant and forced drivers to manage the lifecycle of
> the public structure.
> 
> Unify these two structures into a single 'struct ppp_channel', which is
> now internal to ppp_generic.c. Drivers now use a 'ppp_channel_conf'
> structure to specify registration parameters and receive an opaque
> pointer to the allocated channel.
> 
> Key changes:
> - ppp_register_channel() and ppp_register_net_channel() now return
>   a 'struct ppp_channel *' instead of taking a pointer to a driver-
>   embedded structure.
> - 'struct ppp_channel_ops' methods now take the driver's 'private'
>   pointer directly as their first argument, simplifying driver logic.
> - ppp_unregister_channel() now takes the opaque pointer.
> - Multilink-specific fields are unified and handled via the new
>   configuration structure.
> 
> This cleanup simplifies the driver interface and makes the channel
> lifecycle management more robust by centralizing allocation in the PPP
> generic layer.
> 
> Assisted-by: Gemini:gemini-3-flash
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
>  drivers/net/ppp/ppp_async.c      |  51 +++++-----
>  drivers/net/ppp/ppp_generic.c    | 161 +++++++++++++++----------------
>  drivers/net/ppp/ppp_synctty.c    |  51 +++++-----
>  drivers/net/ppp/pppoe.c          |  34 ++++---
>  drivers/net/ppp/pppox.c          |   4 +-
>  drivers/net/ppp/pptp.c           |  40 ++++----
>  drivers/tty/ipwireless/network.c |  30 +++---
>  include/linux/if_pppox.h         |   2 +-
>  include/linux/ppp_channel.h      |  49 ++++++----
>  net/atm/pppoatm.c                |  61 ++++++------
>  net/l2tp/l2tp_ppp.c              |  34 ++++---
>  11 files changed, 271 insertions(+), 246 deletions(-)

This patch is IMHO a bit too big and should be split. Also this kind of
refactor looks very invasive and potentially regression prone. I think
it should include a signficant self-test coverage increase.

> @@ -391,9 +396,9 @@ ppp_async_init(void)
>   * The following routines provide the PPP channel interface.
>   */
>  static int
> -ppp_async_ioctl(struct ppp_channel *chan, unsigned int cmd, unsigned long arg)
> +ppp_async_ioctl(void *private, unsigned int cmd, unsigned long arg)
>  {
> -	struct asyncppp *ap = chan->private;
> +	struct asyncppp *ap = private;
>  	void __user *argp = (void __user *)arg;
>  	int __user *p = argp;
>  	int err, val;

Minor nit: reverse christmas tree above

> @@ -2985,16 +2983,13 @@ char *ppp_dev_name(struct ppp_channel *chan)
>   * This must be called in process context.
>   */
>  void
> -ppp_unregister_channel(struct ppp_channel *chan)
> +ppp_unregister_channel(struct ppp_channel *pch)
>  {
> -	struct channel *pch = chan->ppp;
>  	struct ppp_net *pn;
>  
>  	if (!pch)
>  		return;		/* should never happen */
>  
> -	chan->ppp = NULL;
> -

Sashiko says:

Could this specific ordering introduce a race condition that might lead
to a use-after-free?
If userspace has a file descriptor attached to this channel, it can
concurrently invoke the PPPIOCCONNECT ioctl. Because
ppp_disconnect_channel()
clears pch->ppp and removes the channel from its current unit before
pch->file.dead is set to 1, the concurrent ioctl could observe
pch->file.dead == 0.
This would allow ppp_connect_channel() to successfully attach the dying
channel to a new PPP unit. Once ppp_unregister_channel() completes and
frees the channel, the new PPP unit would retain a pointer to the freed
memory in its channels list, which might be accessed during a later
packet transmission via ppp_push().

> @@ -215,7 +210,8 @@ static void pppoatm_push(struct atm_vcc *atmvcc, struct sk_buff *skb)
>  		    !memcmp(skb->data, &pppllc[LLC_LEN],
>  		    sizeof(pppllc) - LLC_LEN)) {
>  			pvcc->encaps = e_vc;
> -			pvcc->chan.mtu += LLC_LEN;
> +			ppp_channel_update_mtu(pvcc->chan,
> +					       atmvcc->qos.txtp.max_sdu - PPP_HDRLEN);

Does the above introduce a functional change? At very least some comment
needed. Also possibly better move the update_mtu wrapper to a pre-req patch.

> @@ -221,7 +221,7 @@ static void pppol2tp_recv(struct l2tp_session *session, struct sk_buff *skb, int
>  		struct pppox_sock *po;
>  
>  		po = pppox_sk(sk);
> -		ppp_input(&po->chan, skb);
> +		ppp_input(po->chan, skb);

Sashiko says:

Does decoupling the channel lifetime from the driver structure introduce
a use-after-free when receiving packets?
Previously, the struct ppp_channel was embedded in struct pppox_sock,
meaning its lifecycle was safely tied to the socket's refcount. Now that
po->chan is dynamically allocated and freed during pppox_unbind_sock()
via ppp_unregister_channel(), it seems possible for pppol2tp_recv() to
access freed memory.
Since pppol2tp_recv() runs locklessly in softirq context while holding
only rcu_read_lock() and a socket reference, can it observe the
PPPOX_BOUND state and dereference po->chan just after it was freed on
another CPU?

/P


