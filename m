Return-Path: <linux-ppp+bounces-625-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1edNJhsDTmqIBgIAu9opvQ
	(envelope-from <linux-ppp+bounces-625-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Jul 2026 09:58:19 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B13D722DE3
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Jul 2026 09:58:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b="hJEuMYy/";
	dkim=pass header.d=linutronix.de header.s=2020e header.b=hOymlkcG;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-625-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-ppp+bounces-625-lists+linux-ppp=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE42C304E735
	for <lists+linux-ppp@lfdr.de>; Wed,  8 Jul 2026 07:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7983FBB5E;
	Wed,  8 Jul 2026 07:49:22 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461263FADF7;
	Wed,  8 Jul 2026 07:49:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496959; cv=none; b=o1poZhEqH/XSvnG1++dePw7EuQ8qTYsxgYxEUUNIjuMaL+zmseoN756mlUWw5IdQFGupRR2w6/RJISp8pA2iiTR0j9u/AVwdkmdrBI1Wu++h/qfP3T0SEntW0xiz85Ghim/R+Fvvi4VzYdcBahdynLoG8CpYOr1p/9dWYillqeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496959; c=relaxed/simple;
	bh=KEf4o7R7ZogucJeIjRsnOJwG+bKMIbkuRzlX3TWvFa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTw4GZa85ENGdpQVuwm3O0SMFKj+HIg6XCwc/LJWVcfH4MM7vjYBfrHLmXsuD51VPLeHrgMFyx02/CLfhSplOlSZuCVhn6crlWxCgc8gi/DHbcMJOtt8yJJYgxToq/MOzMWULIYa1TSKCxW2+54y04dd8x/HM+CcZXlHOInfJdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hJEuMYy/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hOymlkcG; arc=none smtp.client-ip=193.142.43.55
Date: Wed, 8 Jul 2026 09:49:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783496945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q/MW1MNnBl7YATXC2WRzPF6J/dhdpeXEHWQTTfhE+8s=;
	b=hJEuMYy/5qoHZcEgqMxU1DpTpcKT/FZzz6iZo004DGHcv6lq59xZiRwApY4crju1VxHxsd
	amr1gtjfk6Em43kW+dv3mHa4fGwXS4r0YYHdHmaEIN3R7u1ognTg/OhVsyp0YQcXBDnT0K
	XDyz1kbjokykibY3ZJBntyypKLdHnXEnQvFSER7t3rtGUnWqGlado6GVZnwSti5fWSUfmc
	2SWEgWtDSIhC6BpL35hUXmWO/B6D/ZUPy5FzYXzbFVtKyuMi5IflVi9cYV4swFTUghTlmn
	U7hJRjVZKRoSZ96BIHSnOT/j09nohLH0zplmR15bxM0hbrvOjwMa4ESc+1A8HA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783496945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q/MW1MNnBl7YATXC2WRzPF6J/dhdpeXEHWQTTfhE+8s=;
	b=hOymlkcG3Mc9Q9C3Zzp0LGrlXG1OoASkQtelud0hLlqpgfb67BQ+HIem9JkHJRJqTCRisT
	PwwxTYmh5hXyBCCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Qingfang Deng <qingfang.deng@linux.dev>,
	Breno Leitao <leitao@debian.org>,
	Norbert Szetei <norbert@doyensec.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Taegu Ha <hataegu0826@gmail.com>, Kees Cook <kees@kernel.org>,
	linux-ppp@vger.kernel.org, linux-kernel@vger.kernel.org,
	Guillaume Nault <gnault@redhat.com>, netdev@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH net v2] ppp: defer channel free to an RCU grace period to
 fix pppol2tp RX UAF
Message-ID: <20260708074904.xnpi0mlh@linutronix.de>
References: <D9C0245B-608B-4884-8A09-F55BA4A9F948@doyensec.com>
 <de2616b3-6edf-4255-ba77-0674e225ab27@linux.dev>
 <akfjpBVML_1RFF91@gmail.com>
 <87111f02-5b7a-4185-8364-2faba650578b@linux.dev>
 <20260706092926.PIlrhRKz@linutronix.de>
 <0dfe59c2-bf60-40fe-90e6-d6e1003709d0@suse.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0dfe59c2-bf60-40fe-90e6-d6e1003709d0@suse.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-625-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linux-ppp@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:petr.pavlu@suse.com,m:qingfang.deng@linux.dev,m:leitao@debian.org,m:norbert@doyensec.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hataegu0826@gmail.com,m:kees@kernel.org,m:linux-ppp@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gnault@redhat.com,m:netdev@vger.kernel.org,m:mcgrof@kernel.org,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:atomlin@atomlin.com,m:linux-modules@vger.kernel.org,m:paulmck@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,debian.org,doyensec.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,vger.kernel.org,atomlin.com];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linutronix.de:from_mime,linutronix.de:dkim,linutronix.de:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B13D722DE3

On 2026-07-07 17:32:10 [+0200], Petr Pavlu wrote:
> > --- a/kernel/module/main.c
> > +++ b/kernel/module/main.c
> > @@ -858,6 +858,9 @@ SYSCALL_DEFINE2(delete_module, const char __user *, name_user,
> >  		goto out;
> >  
> >  	mutex_unlock(&module_mutex);
> > +
> > +	/* Ensure all rcu callbacks issued by the module have completed */
> > +	rcu_barrier();
> >  	/* Final destruction now no one is using it. */
> >  	if (mod->exit != NULL)
> >  		mod->exit();
> > 
> > make sense?
> 
> This is discussed in Documentation/RCU/rcubarrier.rst and
> Documentation/RCU/Design/Requirements/Requirements.rst. The latter
> contains:

I am aware of this. It is just not the first time I stumble about this.
But maybe with the AI review these days there won't be a miss.

> I don't know if the last part about unacceptable latencies is still
> relevant. I haven't done any measurements myself.

There is a synchronize_rcu() later on. I think I could replace it with a
call_rcu() so we might end up even. I was thinking about about it last
time I was touching modules but somehow I stopped where I stopped.
The question is just, is it worth doing it or is it reasonable to expect
that it is done correctly.

Sebastian

