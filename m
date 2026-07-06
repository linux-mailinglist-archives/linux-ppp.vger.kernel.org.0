Return-Path: <linux-ppp+bounces-620-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WuKfFueUS2q/VwEAu9opvQ
	(envelope-from <linux-ppp+bounces-620-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Mon, 06 Jul 2026 13:43:35 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B894D710019
	for <lists+linux-ppp@lfdr.de>; Mon, 06 Jul 2026 13:43:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=xxeVSsXj;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=eaLAHws8;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-620-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-ppp+bounces-620-lists+linux-ppp=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50383377D3BD
	for <lists+linux-ppp@lfdr.de>; Mon,  6 Jul 2026 09:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0384C77D5;
	Mon,  6 Jul 2026 09:29:36 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A529414DCC;
	Mon,  6 Jul 2026 09:29:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330175; cv=none; b=sTG2jIs9u/k0mY2cGKWNNV4FKfvUORd+uakUqUzWNTGERxGZqll8QDOV9hdxVJT7xBAF7fGmLsCGMx6t0FcSCvRkd6ATB/u9I/86ca8eFWHH/tWbUZJp087AC9S6qp4BCldPg1PrEMhZJNVXEOwK6yopWwB8oAizAdVF/oq+aCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330175; c=relaxed/simple;
	bh=JPB4Ms/3eH3V+i81pMEkiYfy3gOCTrbnmZe6oSsaViw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyOU4GlltQSNKnpg+GOgWS7N3r0Z2i6G3iUWcOhON4WeuTk7X0jY0659Ec7Ygf1LFzX0zu5u/dbScF1g3I3WLmkfLQuSGMMfzJ/1259auTbc50iFW90pARJ6B9hBOCTE0yFq+AHSswDTXFWB1dK6TYFOxQJv04P1Y6KdxjHckcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xxeVSsXj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eaLAHws8; arc=none smtp.client-ip=193.142.43.55
Date: Mon, 6 Jul 2026 11:29:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783330168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cCcLZepvm4b8pYaezu8ngLtA5fS9bUMBOmMVNu03xBw=;
	b=xxeVSsXjSFqPcOq0HVzsUmQYNJDJzl24WpDMo5GkQ68mJgbLAxwbu3hfeyNOVS68/CA1Kp
	EPhiqNGEWQAv567jxgrw6BnY1TcT/TTyfFpOnchbGyJb1Gp4KUn+SGOIN7JYX1x+Nj/xfY
	LrUdG8PwTS3lkNDO2xn0nrtTFx6qHRIBdXiFhZNsbtiTyAksxrgs8Kf/vKad9Psa7o5pXR
	hE/aowlFonkWPlzCkboAkiOuGw05jnV642MSm9xF+AXIorMLAay0X7O/kHWV7Eggt9DLum
	w4On59vnU7MbkZwKn9LlT2OUUe5QtmUmvSpnJZQwqZCBJkfdyUTNEVonrTKojg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783330168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cCcLZepvm4b8pYaezu8ngLtA5fS9bUMBOmMVNu03xBw=;
	b=eaLAHws8CrHTCsFAG6LX6kdZCh8OF7U9jFSumI1QwuDAgSWkwU/7L23aBefukCq6zfK257
	u6YFS4dd3qh47PBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Breno Leitao <leitao@debian.org>, Norbert Szetei <norbert@doyensec.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Taegu Ha <hataegu0826@gmail.com>, Kees Cook <kees@kernel.org>,
	linux-ppp@vger.kernel.org, linux-kernel@vger.kernel.org,
	Guillaume Nault <gnault@redhat.com>, netdev@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org
Subject: Re: [PATCH net v2] ppp: defer channel free to an RCU grace period to
 fix pppol2tp RX UAF
Message-ID: <20260706092926.PIlrhRKz@linutronix.de>
References: <D9C0245B-608B-4884-8A09-F55BA4A9F948@doyensec.com>
 <de2616b3-6edf-4255-ba77-0674e225ab27@linux.dev>
 <akfjpBVML_1RFF91@gmail.com>
 <87111f02-5b7a-4185-8364-2faba650578b@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87111f02-5b7a-4185-8364-2faba650578b@linux.dev>
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
	TAGGED_FROM(0.00)[bounces-620-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linux-ppp@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:qingfang.deng@linux.dev,m:leitao@debian.org,m:norbert@doyensec.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hataegu0826@gmail.com,m:kees@kernel.org,m:linux-ppp@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gnault@redhat.com,m:netdev@vger.kernel.org,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:atomlin@atomlin.com,m:linux-modules@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[debian.org,doyensec.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,vger.kernel.org,suse.com,atomlin.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B894D710019

+ MODULE maintainer

On 2026-07-05 10:57:44 [+0800], Qingfang Deng wrote:
> On 7/4/2026 at 12:32 AM, Breno Leitao wrote:
> > On Fri, Jul 03, 2026 at 03:27:00PM +0800, Qingfang Deng wrote:
> > > AI-review found an issue: https://sashiko.dev/#/patchset/D9C0245B-608B-4884-8A09-F55BA4A9F948%40doyensec.com
> > > 
> > > An rcu_barrier() call is needed at the end of ppp_cleanup().
> > 
> > I was initially unclear why rcu_barrier() would be necessary on a kfree path,
> > but it appears to be required during module unload to ensure that
> > ppp_release_channel_free() completes before the module's struct rcu_head is
> > destroyed. Is that the correct understanding?
> 
> It's required to ensure that all ppp_release_channel_free() callback
> complete before the text segment of the module is unloaded.

So either a rcu_barrier() in ppp's module_exit() callback or a
synchronize_rcu() instead of the call_rcu(). And all this because the
module RCU callbacks pending which can be invoked after the module has
been removed. There is a synchronize_rcu() during module exit but this
is after the module code is gone.

I'm curious how many modules have a call_rcu() within their code but
don't have anything to enforce its completion before module removal is
complete? Wouldn't something like


diff --git a/kernel/module/main.c b/kernel/module/main.c
index 46dd8d25a6058..8eae1ea2d6eb4 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -858,6 +858,9 @@ SYSCALL_DEFINE2(delete_module, const char __user *, name_user,
 		goto out;
 
 	mutex_unlock(&module_mutex);
+
+	/* Ensure all rcu callbacks issued by the module have completed */
+	rcu_barrier();
 	/* Final destruction now no one is using it. */
 	if (mod->exit != NULL)
 		mod->exit();

make sense?

Sebastian

