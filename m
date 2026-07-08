Return-Path: <linux-ppp+bounces-629-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DmbNNSpXTmrBKwIAu9opvQ
	(envelope-from <linux-ppp+bounces-629-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Jul 2026 15:56:58 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38749727007
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Jul 2026 15:56:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=kts+Lrlw;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=o23ljR+q;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-629-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-ppp+bounces-629-lists+linux-ppp=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 046AC3008D1B
	for <lists+linux-ppp@lfdr.de>; Wed,  8 Jul 2026 13:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B863A5E64;
	Wed,  8 Jul 2026 13:56:56 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016F2362143;
	Wed,  8 Jul 2026 13:56:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519016; cv=none; b=fCbO+pYdXlgtym5vpApBv9I/QfUpe788mgk99WBJwZ313Z51wrOS5UkOSWY5Ai8VQAfJ4cuzSaWcLO1Q0cRkUDUpsb12qqUQrjUzLXw27WN2+td6EZycPJl3PpihkhDhKHYz9+ZhebZgrTP9D9YCnMd++Bw+Cx24l78M+cZQraE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519016; c=relaxed/simple;
	bh=ypqZAI1oU5JGm8/KBes9kuxTMKNdF+eggwaTNnsX/60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHISI0RShFWAxcdAn9gq18QvVNSIUOMqbDdic4RMk18tcNjkkJLh4UPiU2yCRaWDOZ7l8ECesjctEY3FlmSaKnUjXMD/xRA64CL0w1qZzlDLOQdHUoihBOQWtb1d54zMP3HCN0A+H1ZrI72aOivKdSwN7JwaVjBfnn0Q5i1ox/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kts+Lrlw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=o23ljR+q; arc=none smtp.client-ip=193.142.43.55
Date: Wed, 8 Jul 2026 15:56:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783519013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/V/epasgT8Yu7gP0faBZj8vgD9Xn8KwZKX1Je5vr8BI=;
	b=kts+LrlwbgtCLiPMljMBa4w+f9wrnW0MQWCXjB2ngOMBoLe5/NNKbDXJzDGwxIKL3m4ETj
	Q+5xZkLq1PabsFGyLadLSreAwYAvtDsfaTtYcmG1fKlHszCi0v993Um+SuxLN2S2x/SG5N
	uuWO4DEn/QehpKSv2uGL/naFZZzNWXTIN3uHjN3sLIn79/gq2rSUBNnzvVA6AXmrzHkjXY
	IsIxiNJE9vXEayEPOk3/3pAwJwnFUHg99zlWvyiBc0YwTQ36LybduUc4dCZJfpXr6MSq6c
	X4OnDTjKUI6QXfOW6uWJucw8w4bqz99kBSasUSBu9vLJSXFVKN1Rv8bpOsjI1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783519013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/V/epasgT8Yu7gP0faBZj8vgD9Xn8KwZKX1Je5vr8BI=;
	b=o23ljR+qd4kbANJJhPpv5c1eR9QZj4D3ewIVk6k6zz8twCFj9c2oXOOhLT4ekS1eS8AQaf
	tEKZOZlN3UZ79rCw==
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
Message-ID: <20260708135651.zl03TEfr@linutronix.de>
References: <D9C0245B-608B-4884-8A09-F55BA4A9F948@doyensec.com>
 <de2616b3-6edf-4255-ba77-0674e225ab27@linux.dev>
 <akfjpBVML_1RFF91@gmail.com>
 <87111f02-5b7a-4185-8364-2faba650578b@linux.dev>
 <20260706092926.PIlrhRKz@linutronix.de>
 <0dfe59c2-bf60-40fe-90e6-d6e1003709d0@suse.com>
 <20260708074904.xnpi0mlh@linutronix.de>
 <bef05178-4856-4b62-9c3b-62bf636c239d@suse.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bef05178-4856-4b62-9c3b-62bf636c239d@suse.com>
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
	TAGGED_FROM(0.00)[bounces-629-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[linux.dev,debian.org,doyensec.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,vger.kernel.org,atomlin.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:petr.pavlu@suse.com,m:qingfang.deng@linux.dev,m:leitao@debian.org,m:norbert@doyensec.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hataegu0826@gmail.com,m:kees@kernel.org,m:linux-ppp@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gnault@redhat.com,m:netdev@vger.kernel.org,m:mcgrof@kernel.org,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:atomlin@atomlin.com,m:linux-modules@vger.kernel.org,m:paulmck@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linux-ppp@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38749727007

On 2026-07-08 15:04:32 [+0200], Petr Pavlu wrote:
> As RCU usage in modules is now more common, I see an argument for the
> module loader to invoke rcu_barrier() during module unload to make RCU
> usage easier. In general, module unloading is a rare operation, so even
> if it becomes somewhat slower, I don't expect it to be a significant
> issue.

Okay.

> One problem is that I'm not sure where the new rcu_barrier() call should
> be placed. The prototype adds it before calling the module's exit
> function. Would this actually fit all modules? From a quick look, I can
> see that various modules call it at different points during their exit.

I don't know why you would use call_rcu() in your module_exit()
(pointing to the same module). But you could have call_rcu() invoking
kmem_cache_free() and destroying that cache (kmem_cache_destroy()) in
your exit path. From that perspective it would make sense to flush all
calls before invoking module_exit().

> -- 
> Thanks,
> Petr

Sebastian

