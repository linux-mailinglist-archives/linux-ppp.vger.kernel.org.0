Return-Path: <linux-ppp+bounces-563-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bS6MH5St+ml5RgMAu9opvQ
	(envelope-from <linux-ppp+bounces-563-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 06 May 2026 04:55:16 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4674D5C55
	for <lists+linux-ppp@lfdr.de>; Wed, 06 May 2026 04:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E11CD301983F
	for <lists+linux-ppp@lfdr.de>; Wed,  6 May 2026 02:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6992923C51D;
	Wed,  6 May 2026 02:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="w00Y0kG4"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907B22036E9
	for <linux-ppp@vger.kernel.org>; Wed,  6 May 2026 02:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778036113; cv=none; b=gjyr9NOr63rKgzmT2IFTLMwQMgQRTtGdH9EITEYgVD2GRjyFt4XjnL6zi62AAdpwCy0tt+6rhH/GDIna2peTSnufDe1QeYbQnOnO0cpXRShSt2dAqY3BAOUaode4rTciIedIB3O1ES4U1lvEoSOaBVHceKLm6OrT9ydUlXZ9Qz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778036113; c=relaxed/simple;
	bh=JdEAyxCJZ5++nKooF6LFXwVbsX4GYl00OAoHEELZrbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hW1hUDRVqI9oBot6LHlN8kt3Vcl5jyAu0VXb9hcVXgx/olrwx2L9wB9i76U0dsHFVlREasq0rb7cFElbjy+rsF3Iw7EsgczGXciX3Kw0iROPCnsSz1++rzJ52Yw5D5JVKf+GQUEDl0XtirRSkscm97kL31Mlj/BgQ/Y9yM4DTCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=w00Y0kG4; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <10c0d8f6-4f3c-4f35-a3cc-19ceb82dd750@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778036107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gp4JzgH2pt3Dzh+cDIL4drktCo5KZW8uwvAsJAFLDZU=;
	b=w00Y0kG4RKFQWdvbgNqwWY4lbc8XNBBenZh2PjgW59/jjSmgnvPgCrdvW4LFr5AdN2ih84
	AsQB3uY734KZ8F1TuUq07QYVMGiI0Ihta6PocQjKnzKjOUvxXMMDuM+QqRQQOcr2rfb4RO
	rV4ovfr570T0CJkV1sznfIAO7JIHeFE=
Date: Wed, 6 May 2026 10:54:50 +0800
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next] ppp: consolidate RX skb queueing
To: Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Guillaume Nault <gnault@redhat.com>,
 Breno Leitao <leitao@debian.org>, Taegu Ha <hataegu0826@gmail.com>,
 Kees Cook <kees@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260428024426.48605-1-qingfang.deng@linux.dev>
 <410c814a-399a-4eb9-a39a-d1e5fecd6b33@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <410c814a-399a-4eb9-a39a-d1e5fecd6b33@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 9D4674D5C55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-563-lists,linux-ppp=lfdr.de];
	FREEMAIL_TO(0.00)[redhat.com,lunn.ch,davemloft.net,google.com,kernel.org,debian.org,gmail.com,linutronix.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


On 2026/4/30 16:54, Paolo Abeni wrote:
>
> On 4/28/26 4:44 AM, Qingfang Deng wrote:
>> In ppp_input() and ppp_receive_nonmp_frame(), received skbs are queued
>> for userspace delivery using the same open-coded pattern:
>>
>> 	skb_queue_tail(&pf->rq, skb);
>> 	while (pf->rq.qlen > PPP_MAX_RQLEN &&
>> 	       (skb = skb_dequeue(&pf->rq)))
>> 		kfree_skb(skb);
>> 	wake_up_interruptible(&pf->rwait);
>>
>> This has a potential race: skb_queue_tail() releases the queue lock,
>> then qlen is read locklessly before skb_dequeue() re-acquires it.
>> Another CPU enqueueing concurrently could cause the length check to see
>> stale data. This race is benign, as it only causes extra skbs to be
>> freed in the worst case.
>>
>> Introduce ppp_file_queue_rx_skb() to perform the enqueue, length check,
>> and trim atomically under a single pf->rq.lock critical section. As both
>> callers have softirq disabled, plain spin_lock() can be used instead of
>> _bh()/_irqsave() variants. Since only one skb is enqueued at a time, the
>> queue can exceed PPP_MAX_RQLEN by at most one frame, so replace the
>> while-loop with an if-statement. While at it, use skb_queue_len()
>> instead of open-coding the qlen access.
>>
>> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
>> ---
>>   drivers/net/ppp/ppp_generic.c | 37 ++++++++++++++++++++++-------------
>>   1 file changed, 23 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
>> index 57c68efa5ff8..6ab5011540a0 100644
>> --- a/drivers/net/ppp/ppp_generic.c
>> +++ b/drivers/net/ppp/ppp_generic.c
>> @@ -2307,6 +2307,27 @@ static bool ppp_channel_bridge_input(struct channel *pch, struct sk_buff *skb)
>>   	return !!pchb;
>>   }
>>   
>> +/* Queue up and deliver a received skb to userspace.
>> + * Must be called in softirq.
>> + */
>> +static void ppp_file_queue_rx_skb(struct ppp_file *pf, struct sk_buff *skb)
>> +{
>> +	spin_lock(&pf->rq.lock);
>> +	__skb_queue_tail(&pf->rq, skb);
>> +	/* limit queue length by dropping old frames */
>> +	if (unlikely(skb_queue_len(&pf->rq) > PPP_MAX_RQLEN)) {
>> +		struct sk_buff *old = __skb_peek(&pf->rq);
>> +
>> +		__skb_unlink(old, &pf->rq);
>> +		spin_unlock(&pf->rq.lock);
>> +		kfree_skb(old);
>> +	} else {
>> +		spin_unlock(&pf->rq.lock);
> Note that after __skb_queue_tail(), skb_queue_len(&pf->rq) could be ==
> PPP_MAX_RQLEN + 2, due to the slightly different check in
> ppp_prepare_tx_skb().

The check in ppp_prepare_tx_skb() is for demand dialing mode. As the 
name and comment suggest, when waiting for traffic a ppp interface is 
not able to receive packets, until we see a tx packet and then do the 
actual dial-up to resume normal operation, so that can't happen.

>
> I think the above it could/should be simplified to:
> 	while (unlikely(skb_queue_len(&pf->rq) > PPP_MAX_RQLEN))
> 		kfree_skb(__skb_dequeue(&pf->rq));
> 	spin_unlock(&pf->rq.lock);
>
> And possibly it would make sense to consolidate the test in
> ppp_prepare_tx_skb(), too for consistency - in that case an `if`
> statement should become enough.
I could consolidate this, but it tail-drops the skb instead of 
head-dropping.

