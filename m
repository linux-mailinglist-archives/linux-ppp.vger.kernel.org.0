Return-Path: <linux-ppp+bounces-622-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kSxzOfNeTGrAjgEAu9opvQ
	(envelope-from <linux-ppp+bounces-622-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 07 Jul 2026 04:05:39 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB96716B8C
	for <lists+linux-ppp@lfdr.de>; Tue, 07 Jul 2026 04:05:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=EdF7Qsgn;
	dmarc=pass (policy=none) header.from=linux.dev;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-622-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-ppp+bounces-622-lists+linux-ppp=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2F873031EAB
	for <lists+linux-ppp@lfdr.de>; Tue,  7 Jul 2026 02:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7672917BCA;
	Tue,  7 Jul 2026 02:05:37 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C101E5702
	for <linux-ppp@vger.kernel.org>; Tue,  7 Jul 2026 02:05:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783389937; cv=none; b=VL5JtybUXSJrHev8etGySduzeVK65oET00HEN/DJk5I/iAarmxceduK3RfIwYHXheLQxmouieHwVjyXP6gQveTBKL8SFoalzrUVQp3ilwWO9WX3Ye+VL336VzvNa7+qWfEj2avT7KeWSLIwN9kftNFfO8mSEkAlimff5qN1FLJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783389937; c=relaxed/simple;
	bh=CxakYhcTC8qBau/fxdIwtdXstC43wajWnY+nfADNZWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8lF2bHCZZ+qqOfsRY3AwUW/W6qWK7xgePFKtwhrg4OD37cOQhg4AIfpJJXr0kUH4oVg0Ejwk1DMf8fPUR2o7N2d8vrD+RotTbLx+3q4fqZJElM/80fKBebp7tNWtxiX70s3Xc1aTeRbdS7T7w3fBzwR7kQjiPRmEroLB1AmbCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EdF7Qsgn; arc=none smtp.client-ip=95.215.58.180
Message-ID: <45dd60a1-231d-4837-9280-786c5d0dbc72@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783389933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ynz9q6tQQnN+EtjSzOMxhstbYYQHChNYPvl8qjxy068=;
	b=EdF7QsgnX8LnqtSvbL07KGokgaang2C56R+9LPeRuc7ovgzc8HjGNt4KMWjtLFUdQsa068
	RerDrPK10VyvpwN/sVoQmYxp5wskwwXafzgU4VCrNn4/tKpyqLUuNuLC6AfY6i9Atz2MY0
	baoTVPAple0Mljx05j92PxXypJwcwvE=
Date: Tue, 7 Jul 2026 10:05:18 +0800
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net v3] ppp: defer channel free to an RCU grace period to
 fix pppol2tp RX UAF
To: Norbert Szetei <norbert@doyensec.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Yue Haibing <yuehaibing@huawei.com>, Guillaume Nault <gnault@redhat.com>,
 Kees Cook <kees@kernel.org>, Taegu Ha <hataegu0826@gmail.com>,
 linux-ppp@vger.kernel.org, linux-kernel@vger.kernel.org
References: <E793FCF2-58DE-4387-A983-C7B4BC3158BD@doyensec.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <E793FCF2-58DE-4387-A983-C7B4BC3158BD@doyensec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-622-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:norbert@doyensec.com,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:yuehaibing@huawei.com,m:gnault@redhat.com,m:kees@kernel.org,m:hataegu0826@gmail.com,m:linux-ppp@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,huawei.com,gmail.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:from_mime,linux.dev:email,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EB96716B8C

On 2026/7/6 17:01, Norbert Szetei wrote:
> pppol2tp_recv() runs in the L2TP UDP-encap softirq RX path:
>
>   l2tp_udp_encap_recv() -> l2tp_recv_common() -> pppol2tp_recv()
>     -> ppp_input(&po->chan)
>
> It runs under rcu_read_lock() holding only an l2tp_session reference and
> takes NO reference on the internal PPP channel (struct channel,
> chan->ppp) that ppp_input() dereferences.
>
> The pppox socket is SOCK_RCU_FREE, so 'po' and the embedded ppp_channel
> are RCU-safe.  But the internal struct channel is a separate allocation
> that ppp_release_channel() frees with a plain kfree():
>
>   close(data socket) -> pppol2tp_release() -> pppox_unbind_sock()
>     -> ppp_unregister_channel() -> ppp_release_channel() -> kfree(pch)
>
> For a channel that is bound (PPPIOCGCHAN) but not attached to a ppp unit
> (no PPPIOCCONNECT, pch->ppp == NULL) and not bridged, teardown skips
> both ppp_disconnect_channel()'s synchronize_net() and
> ppp_unbridge_channels()'s synchronize_rcu(), so the kfree() has no grace
> period.  rcu_read_lock() in pppol2tp_recv() does not protect against a
> plain kfree(), so an in-flight ppp_input() on one CPU can dereference
> the channel just freed by close() on another CPU.
>
> The bug is reachable by an unprivileged user.
>
> Defer the channel free to an RCU callback via call_rcu() so the grace
> period fences any in-flight ppp_input(). The disconnect and unbridge
> teardown paths already fence with synchronize_net()/synchronize_rcu();
> call_rcu() does the same here without stalling the close() path.
>
> Fixes: ee40fb2e1eb5 ("l2tp: protect sock pointer of struct pppol2tp_session with RCU")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Norbert Szetei <norbert@doyensec.com>
> ---
> v3:
> - Added rcu_barrier() at the end of ppp_cleanup() to ensure all
>    ppp_release_channel_free() callbacks complete before the module's
>    text segment is unloaded (Documentation/RCU/rcubarrier.rst).
> v2: https://lore.kernel.org/linux-ppp/D9C0245B-608B-4884-8A09-F55BA4A9F948@doyensec.com/
> - Moved skb_queue_purge() to a dedicated RCU callback to prevent leaking
>    skbs added by an in-flight ppp_input() during the grace period (Sebastian).
> - Retained call_rcu() to avoid introducing synchronous multi-millisecond
>    latency into the teardown path.
> v1: https://lore.kernel.org/netdev/C954A7EA-AA98-4E3C-80B5-42C34B3183A3@doyensec.com/
>
>   drivers/net/ppp/ppp_generic.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index 57c68efa5ff8..717c1d3aa953 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -184,6 +184,7 @@ struct channel {
>   	struct list_head clist;		/* link in list of channels per unit */
>   	spinlock_t	upl;		/* protects `ppp' and 'bridge' */
>   	struct channel __rcu *bridge;	/* "bridged" ppp channel */
> +	struct rcu_head rcu;		/* for RCU-deferred free of the channel */
>   #ifdef CONFIG_PPP_MULTILINK
>   	u8		avail;		/* flag used in multilink stuff */
>   	u8		had_frag;	/* >= 1 fragments have been sent */
> @@ -3562,6 +3563,18 @@ ppp_disconnect_channel(struct channel *pch)
>   	return err;
>   }
>   
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
> @@ -3596,6 +3607,7 @@ static void __exit ppp_cleanup(void)
>   	device_destroy(&ppp_class, MKDEV(PPP_MAJOR, 0));
>   	class_unregister(&ppp_class);
>   	unregister_pernet_device(&ppp_net_ops);
> +	rcu_barrier(); /* wait for RCU callbacks before module unload */
>   }
>   
>   /*
Reviewed-by: Qingfang Deng <qingfang.deng@linux.dev>

