Return-Path: <linux-ppp+bounces-521-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DaokN2sc3GlmMwkAu9opvQ
	(envelope-from <linux-ppp+bounces-521-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Mon, 13 Apr 2026 00:27:55 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 368D83E6453
	for <lists+linux-ppp@lfdr.de>; Mon, 13 Apr 2026 00:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3D0F300CBDF
	for <lists+linux-ppp@lfdr.de>; Sun, 12 Apr 2026 22:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC596309F19;
	Sun, 12 Apr 2026 22:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t1pPF2M/"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C809B1E2614;
	Sun, 12 Apr 2026 22:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776032871; cv=none; b=l5lrQ9fyqlKw2ecWHCEiY5gyeiFQJqyOj37pEC/i49c6aZkDIUOukBl+iFLN+4Iswx6IVJNMBM/6zMgSAe0yKz0XXeVdTdU5kPcB8aOE2cfzc9Fq6nCYH3hzZLm3MkoAcH7L3oUrIdIZeCDu4OOZRtwBHsdVBcZQmpMxuU+exkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776032871; c=relaxed/simple;
	bh=Fz4/YEesOLCpOIFkRABmBeVfvVdn/hU6bt9tAfBF+5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rlNzuBPuFOQsUG83qMtWEihNZA1zJK/VlhS5nJEm4W/ufmWvsGFhbKAfLAeh3x+O8g0MTov7fw/ZCcOmxHfNXAjV+UtWtFTqDBju0f5UMQkbQFdifnpr6LrytDMtFFXwsMADUrd5s3n9L1v+uOOzq9CuJgPHhriv8nMCdG+WPlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t1pPF2M/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1E1C19424;
	Sun, 12 Apr 2026 22:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776032871;
	bh=Fz4/YEesOLCpOIFkRABmBeVfvVdn/hU6bt9tAfBF+5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t1pPF2M/V18UZu6YWCwTMSYIZ7EsRIP5vEqXiyCvGQe3MZCEk7hc2oujFko9lO0s/
	 NeF0akQ5Ost2O8Ri386PpQapJIa9v1PXuM85BuBDDvImyaEJmoMgbub8D2fxuso4fD
	 v5/1Bx3gfqWuPiU6pI2KhNtd+3logOMTcHIWn5PRAjibSdOJcbKmGuM2F1zk5W+9ci
	 rtshMxqDLDIPeh0U9jTf12cQEDi8WcTR3YkLTYcyE73mEfk4w90gkP7smAQB187apm
	 XAhD/QDpJGJ0aZ/Ala0UC5Ua4NP92Oi1tNe+EGcuB8a8Fo2xm7SslOz+c+YqyDCUHg
	 /oNO1cZkKp4QQ==
From: Jakub Kicinski <kuba@kernel.org>
To: qingfang.deng@linux.dev
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	yuehaibing@huawei.com,
	kuniyu@google.com,
	kees@kernel.org,
	bigeasy@linutronix.de,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tparkin@katalix.com,
	jchapman@katalix.com,
	gnault@redhat.com
Subject: Re: [PATCH net-next] ppp: tear down bridge before clearing pch->chan
Date: Sun, 12 Apr 2026 15:27:49 -0700
Message-ID: <20260412222749.3108795-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410093859.69237-1-qingfang.deng@linux.dev>
References: <20260410093859.69237-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-521-lists,linux-ppp=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 368D83E6453
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
ppp: tear down bridge before clearing pch->chan

This commit moves ppp_unbridge_channels() before pch->chan is cleared
and removes the NULL check for pchb->chan in ppp_channel_bridge_input(),
relying on synchronize_rcu() inside ppp_unbridge_channels() for safety.

> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index b097d1b38ac9c..3a609d48a4248 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -2285,17 +2285,11 @@ static bool ppp_channel_bridge_input(struct channel *pch, struct sk_buff *skb)
>  		goto out_rcu;
>  
>  	spin_lock_bh(&pchb->downl);
> -	if (!pchb->chan) {
> -		/* channel got unregistered */
> -		kfree_skb(skb);
> -		goto outl;
> -	}
>  
>  	skb_scrub_packet(skb, !net_eq(pch->chan_net, pchb->chan_net));
>  	if (!pchb->chan->ops->start_xmit(pchb->chan, skb))

Could removing this check lead to a NULL pointer dereference if both channels
in a bridge (A and B) are unregistered concurrently?

If Thread 1 unregisters A and calls ppp_unbridge_channels(A), it clears
both A->bridge and B->bridge to NULL, then blocks on synchronize_rcu().

If Thread 2 unregisters B and calls ppp_unbridge_channels(B), it finds
B->bridge is already NULL and returns -EINVAL early, bypassing its own
synchronize_rcu() call.

Thread 2 would then proceed to set B->chan = NULL while an RCU reader
(Thread 3) might still be active here, leading to a crash when it tries
to access pchb->chan->ops->start_xmit.

[ ... ]

> @@ -2997,6 +2991,8 @@ ppp_unregister_channel(struct ppp_channel *chan)
>  	 * the channel's start_xmit or ioctl routine before we proceed.
>  	 */
>  	ppp_disconnect_channel(pch);
> +	ppp_unbridge_channels(pch);
> +

Does moving ppp_unbridge_channels() here introduce a re-bridging race window?

At this point, the channel is still in the pn->all_channels list. After
ppp_unbridge_channels(pch) completes, pch->bridge is NULL.

Could a concurrent PPPIOCBRIDGECHAN ioctl from another channel find this
channel via ppp_find_channel() and successfully establish a new bridge
with it, since ppp_bridge_channels() only verifies that pch->bridge is NULL?

If so, ppp_unregister_channel() would then unconditionally set pch->chan = NULL
and remove it from the list without tearing down the newly formed bridge.
This regression could crash the peer channel when it processes a packet.

>  	down_write(&pch->chan_sem);
>  	spin_lock_bh(&pch->downl);
>  	pch->chan = NULL;
-- 
pw-bot: cr

