Return-Path: <linux-ppp+bounces-614-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 746ECHtkR2p4XgAAu9opvQ
	(envelope-from <linux-ppp+bounces-614-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 03 Jul 2026 09:27:55 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3956FF88E
	for <lists+linux-ppp@lfdr.de>; Fri, 03 Jul 2026 09:27:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=wxnTB1je;
	dmarc=pass (policy=none) header.from=linux.dev;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-614-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-ppp+bounces-614-lists+linux-ppp=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F2B130074F0
	for <lists+linux-ppp@lfdr.de>; Fri,  3 Jul 2026 07:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66B03546C1;
	Fri,  3 Jul 2026 07:27:46 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09EB348C55;
	Fri,  3 Jul 2026 07:27:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063666; cv=none; b=KD/f/akkkaOhFjedo8/Q6HH8h4Yg7G4RpYNS0KBOnGKT97ggiJXMJfyFYaSifQBKLLLrAc7cQGFixvD1mO9c3EJ2lwJ8qvDIV3/81A00QX8ddI/syMqGjSt3nPPscRho581eQNcgp2fGsshl/jDCz7Dt/eObGah5ZQFe+LrvbwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063666; c=relaxed/simple;
	bh=Ol2r02z849sHO076/l5rhr6sDWIOhUOJQgfcHd2d/Ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uYFB1SU+usID316waVhxXWCexjus1LDkMhWhrEUmvhYjhWKQIiFXKgVTZXBRoGjaeja0G6cBoH+bXfnXNp5jzrtiQP5rwkt9eu8PgHMLRMMRiMBsPxRsLP0dzWZWchO4vVpE0YFyjwdFTscjkj+ye5FBz4ZD1UQQqj3VARp2djA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wxnTB1je; arc=none smtp.client-ip=95.215.58.172
Message-ID: <de2616b3-6edf-4255-ba77-0674e225ab27@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783063661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XYPGG7oSyvpEIFDIsiAE2WqgUhJkjiEWYW22I8750Tc=;
	b=wxnTB1jeUQocK9BJWSWnjlsQalb4qukGei3yxMDTzYi/kReANBZ5285tIel93bEksGwYwQ
	eJ4Z5DVLh0u9YcH6KUJMPB72vge4kJMe4XJEuqDiHMjcQjQWxlmDl6i0VUUV5KDsWzq0e9
	vdLYeL7a+o95A2opkTviuEFAOZx976g=
Date: Fri, 3 Jul 2026 15:27:00 +0800
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net v2] ppp: defer channel free to an RCU grace period to
 fix pppol2tp RX UAF
To: Norbert Szetei <norbert@doyensec.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Breno Leitao <leitao@debian.org>, Taegu Ha <hataegu0826@gmail.com>,
 Kees Cook <kees@kernel.org>, linux-ppp@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guillaume Nault <gnault@redhat.com>,
 netdev@vger.kernel.org
References: <D9C0245B-608B-4884-8A09-F55BA4A9F948@doyensec.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <D9C0245B-608B-4884-8A09-F55BA4A9F948@doyensec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-614-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:norbert@doyensec.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:bigeasy@linutronix.de,m:leitao@debian.org,m:hataegu0826@gmail.com,m:kees@kernel.org,m:linux-ppp@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gnault@redhat.com,m:netdev@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linutronix.de,debian.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:from_mime,linux.dev:dkim,linux.dev:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD3956FF88E

Hi,

On 2026/7/2 2:12, Norbert Szetei wrote:
> +/* Purge after the grace period: a late ppp_input() may still queue an
> + * skb on pch->file.rq before the last RCU reader drains.
> + */
> +static void ppp_release_channel_free(struct rcu_head *rcu)
> +{
> +	struct channel *pch = container_of(rcu, struct channel, rcu);
> +
> +	skb_queue_purge(&pch->file.xq);
> +	skb_queue_purge(&pch->file.rq);
> +	kfree(pch);
> +}
> +
>   /*
>    * Drop a reference to a ppp channel and free its memory if the refcount reaches
>    * zero.
> @@ -3581,9 +3594,7 @@ static void ppp_release_channel(struct channel *pch)
>   		pr_err("ppp: destroying undead channel %p !\n", pch);
>   		return;
>   	}
> -	skb_queue_purge(&pch->file.xq);
> -	skb_queue_purge(&pch->file.rq);
> -	kfree(pch);
> +	call_rcu(&pch->rcu, ppp_release_channel_free);
>   }
>   
>   static void __exit ppp_cleanup(void)

AI-review found an issue: 
https://sashiko.dev/#/patchset/D9C0245B-608B-4884-8A09-F55BA4A9F948%40doyensec.com

An rcu_barrier() call is needed at the end of ppp_cleanup().

Regards,

Qingfang


