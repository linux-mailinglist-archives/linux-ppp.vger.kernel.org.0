Return-Path: <linux-ppp+bounces-608-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DW+DNw8dRWrm7AoAu9opvQ
	(envelope-from <linux-ppp+bounces-608-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 01 Jul 2026 15:58:39 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 451866EE723
	for <lists+linux-ppp@lfdr.de>; Wed, 01 Jul 2026 15:58:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=SdSnjSSF;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=fAJuQoq0;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-608-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-ppp+bounces-608-lists+linux-ppp=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E93BB328C291
	for <lists+linux-ppp@lfdr.de>; Wed,  1 Jul 2026 13:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE0A48B360;
	Wed,  1 Jul 2026 13:25:58 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9412F48A2AB;
	Wed,  1 Jul 2026 13:25:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912358; cv=none; b=COo89c6dOz+M1zW8V8OZbCkT9X2fQ8/18omka6D38+AES9w9ZsBLo8ht184BQUXTkhSEcf5QOXPiapC+KTH9pNv6mH95Z6/pENT8llycevGtFqrNBfc8NbK4M249SxPMeCYCx12IHQldR3vVhuR3FzR3o7vNcZgXz0FdJX9y5zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912358; c=relaxed/simple;
	bh=NzxsqCAtzVU7RmhJCNfZp8xAI/JohnMV2JBAzupUGMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvNWRQOaxWz6er+WEhJyIhXyu/8qGfoMqk1t5WIEIHAx9o1K0D68bwb+B4gC8eZhstkWhXkystGGoj2oqL6H+K0GsmhkQA4NmY71RIAWAhPV/4rwyiK1k9DlZtcAJlx5Tc1LjOhlNKkWKVHp9ITd+ltLWQVe9k5e+H+mIhFgc1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SdSnjSSF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fAJuQoq0; arc=none smtp.client-ip=193.142.43.55
Date: Wed, 1 Jul 2026 15:25:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782912353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p5tvw0PQQuW5o2Q8BsrzMKMcdDlvVDRDrGdUnUiTGio=;
	b=SdSnjSSF3IKLwtXqZNRRa1CwTfRuDiBkUc2l9Bt4gieoVpaWLRxjDKovzS8j7Tp60TKhs3
	RTuCJp5Sv/yta8eAhJGGBXHgIrjcuyPA8hBN1/67zm79z1tvyXRCK78vVER07z6dU3j7gZ
	hmMQc5rgbhKNdlf6XmiW6+RITTL17V9M4ZHZbTi8+OnLpl6bBfHb3SfHS5sJkpOn7SQkhH
	92PuOyNqk9cpwemkaD272JM+VetT1Lb/MRn5Xz5DXUuY42a4UyLACAOl9+Z7MI3SDzpY/q
	1BJ7kMPSxfW2KIfQVRhlgAv7SGrsguZB/IgyRk+tYqcofg+T5ASmvELyymYqkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782912353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p5tvw0PQQuW5o2Q8BsrzMKMcdDlvVDRDrGdUnUiTGio=;
	b=fAJuQoq01NNysWrdOEgdPZnx9qAMCd9b52+cAbasYEdiSD/GgAPqDxVPPricKLy4eFoHv4
	DPd/L1HjMngyElBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Norbert Szetei <norbert@doyensec.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Taegu Ha <hataegu0826@gmail.com>,
	Yue Haibing <yuehaibing@huawei.com>, Kees Cook <kees@kernel.org>,
	linux-ppp@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] ppp: defer channel free to an RCU grace period to
 fix pppol2tp RX UAF
Message-ID: <20260701132552.nFP2AZrJ@linutronix.de>
References: <C954A7EA-AA98-4E3C-80B5-42C34B3183A3@doyensec.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <C954A7EA-AA98-4E3C-80B5-42C34B3183A3@doyensec.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-608-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linux-ppp@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:norbert@doyensec.com,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:qingfang.deng@linux.dev,m:hataegu0826@gmail.com,m:yuehaibing@huawei.com,m:kees@kernel.org,m:linux-ppp@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linux.dev,gmail.com,huawei.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:dkim,linutronix.de:mid,linutronix.de:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 451866EE723

On 2026-07-01 14:14:39 [+0200], Norbert Szetei wrote:
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -184,6 +184,7 @@ struct channel {
>  	struct list_head clist;		/* link in list of channels per unit */
>  	spinlock_t	upl;		/* protects `ppp' and 'bridge' */
>  	struct channel __rcu *bridge;	/* "bridged" ppp channel */
> +	struct rcu_head	rcu;		/* for RCU-deferred free of the channel */
>  #ifdef CONFIG_PPP_MULTILINK
>  	u8		avail;		/* flag used in multilink stuff */
>  	u8		had_frag;	/* >= 1 fragments have been sent */
> @@ -3583,7 +3584,7 @@ static void ppp_release_channel(struct channel *pch)
>  	}
>  	skb_queue_purge(&pch->file.xq);
>  	skb_queue_purge(&pch->file.rq);
> -	kfree(pch);
> +	kfree_rcu(pch, rcu);

From looking at ppp_input(), what ensures that the skb in-flight is not
added skb_queue which is purged above?

>  }

Sebastian

