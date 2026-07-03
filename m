Return-Path: <linux-ppp+bounces-616-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v3rxCCPkR2qKhAAAu9opvQ
	(envelope-from <linux-ppp+bounces-616-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 03 Jul 2026 18:32:35 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A80704423
	for <lists+linux-ppp@lfdr.de>; Fri, 03 Jul 2026 18:32:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b="t8lsb6V/";
	dmarc=pass (policy=none) header.from=debian.org;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-616-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-ppp+bounces-616-lists+linux-ppp=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E6F7301FFFF
	for <lists+linux-ppp@lfdr.de>; Fri,  3 Jul 2026 16:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5AC83093D8;
	Fri,  3 Jul 2026 16:32:33 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22D530676C;
	Fri,  3 Jul 2026 16:32:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783096353; cv=none; b=LDA49MaCSoO0P3CfXLG+UBsLSoYE8hWbQocUV8Ufo+TwSp9dBZQnP85NF9e9wIhxXVwOhiTjqGFIU0S2wOs9EONjFK4Bg1jetzackFGMiG/VRhpvx5yPg709u4heLhmnJtxGhoUEXvvwr4sSipNST9dJwmgv6j+DEhSDFiGKNQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783096353; c=relaxed/simple;
	bh=iWwxwAJqrUrtoedwvx91WuQ6lfaBcCZ4LuzX89+iq2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkgdJFlyIhQn9XXvQOOpvnscAEpYhsGhcahQEgiPiJAZZ9/MLCSgDLTMZvR3IAOFnj4bQO/GHtr1jfHu9nnqkQ/hQMRQi/XZ6Zmp7IO7+DNbJ7gQpHYbYUXTxBGP5RDPTajgMr116kXxBGM5NVD4MHsJEAej7lg313+Ph7DS06k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=t8lsb6V/; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rnGKoTM+HfxOQZzAszLgDjImXbDy85Rf530KP4A8t00=; b=t8lsb6V//RGmO6WQVIl+7MIMKU
	NwSpU32o2UfagDpWt29euEXX//vsd2UAlupZ4QTm2oukjjygWXRS8IBJbbn3rny8djnOoWDjspDPV
	6k+l3WM/au7rkJ8jMmjKiL64Y3gWlUTyAkyzsZoIApHTJtHMhzk3XF3SHbdUEexfQQuRA3nDOBjkf
	i+TjP4FIvi/hdzg15CDns6NuIm2VFcE25iRfDVys+Bh2wIn2ve3/UkW6EEmUCl5CfmiWYuQRWwsdw
	2W5ihbSwhoAO3p+VO6cJcc3fLT9v3yNVYZ3TCW3DtyhfMzuDrW/8yM/+cfrsuVmJMp+E0lIUQkSAw
	62ClD6ow==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wfgoP-009WtZ-2l;
	Fri, 03 Jul 2026 16:32:22 +0000
Date: Fri, 3 Jul 2026 09:32:16 -0700
From: Breno Leitao <leitao@debian.org>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Norbert Szetei <norbert@doyensec.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Taegu Ha <hataegu0826@gmail.com>, Kees Cook <kees@kernel.org>, linux-ppp@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Guillaume Nault <gnault@redhat.com>, netdev@vger.kernel.org
Subject: Re: [PATCH net v2] ppp: defer channel free to an RCU grace period to
 fix pppol2tp RX UAF
Message-ID: <akfjpBVML_1RFF91@gmail.com>
References: <D9C0245B-608B-4884-8A09-F55BA4A9F948@doyensec.com>
 <de2616b3-6edf-4255-ba77-0674e225ab27@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de2616b3-6edf-4255-ba77-0674e225ab27@linux.dev>
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-616-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:qingfang.deng@linux.dev,m:norbert@doyensec.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:bigeasy@linutronix.de,m:hataegu0826@gmail.com,m:kees@kernel.org,m:linux-ppp@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gnault@redhat.com,m:netdev@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-ppp@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[doyensec.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linutronix.de,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[debian.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9A80704423

On Fri, Jul 03, 2026 at 03:27:00PM +0800, Qingfang Deng wrote:
> Hi,
> 
> On 2026/7/2 2:12, Norbert Szetei wrote:
> > +/* Purge after the grace period: a late ppp_input() may still queue an
> > + * skb on pch->file.rq before the last RCU reader drains.
> > + */
> > +static void ppp_release_channel_free(struct rcu_head *rcu)
> > +{
> > +	struct channel *pch = container_of(rcu, struct channel, rcu);
> > +
> > +	skb_queue_purge(&pch->file.xq);
> > +	skb_queue_purge(&pch->file.rq);
> > +	kfree(pch);
> > +}
> > +
> >   /*
> >    * Drop a reference to a ppp channel and free its memory if the refcount reaches
> >    * zero.
> > @@ -3581,9 +3594,7 @@ static void ppp_release_channel(struct channel *pch)
> >   		pr_err("ppp: destroying undead channel %p !\n", pch);
> >   		return;
> >   	}
> > -	skb_queue_purge(&pch->file.xq);
> > -	skb_queue_purge(&pch->file.rq);
> > -	kfree(pch);
> > +	call_rcu(&pch->rcu, ppp_release_channel_free);
> >   }
> >   static void __exit ppp_cleanup(void)
> 
> AI-review found an issue: https://sashiko.dev/#/patchset/D9C0245B-608B-4884-8A09-F55BA4A9F948%40doyensec.com
> 
> An rcu_barrier() call is needed at the end of ppp_cleanup().

I was initially unclear why rcu_barrier() would be necessary on a kfree path,
but it appears to be required during module unload to ensure that
ppp_release_channel_free() completes before the module's struct rcu_head is
destroyed. Is that the correct understanding?

