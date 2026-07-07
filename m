Return-Path: <linux-ppp+bounces-624-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QUhpNy4tTWq8wAEAu9opvQ
	(envelope-from <linux-ppp+bounces-624-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 07 Jul 2026 18:45:34 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7BE71DFB3
	for <lists+linux-ppp@lfdr.de>; Tue, 07 Jul 2026 18:45:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mR7lrv4q;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-624-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-ppp+bounces-624-lists+linux-ppp=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C27D0300A766
	for <lists+linux-ppp@lfdr.de>; Tue,  7 Jul 2026 16:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595E2435A83;
	Tue,  7 Jul 2026 16:39:03 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011604314BD;
	Tue,  7 Jul 2026 16:39:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442343; cv=none; b=ldMsu+Y0oByvxCfXZ0jikUTkgEsWkjVgo0xPb5jlA/Oh+0Fjr375I98txEnLZgGv7O75zzm27fm/+/9B5xk0rql9tsosBux6AOryI1nkCoTvlhpyrIr6tWVjJtriy0wg0Iuq1MYXqPSJ4y/ONDHVhHHHEiOn79Rz2Zqz3/wD2+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442343; c=relaxed/simple;
	bh=UsnAi76uOSA/XPHHYDSeZk1k/YxpguYAv8uXw+bn09k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2Oj60CsVNpuNR9NEaebibRTU/COQBDr25uJGceymPhhAF0g4ZDFWonaAI9gN5YquhidXRka/H+P5xw3QwL5X7d9BxCltZP8kkxGWiuRyUipdbRYs9PkX38/jxDbzl7R1E+YsEOIy+O1gSGWLIiUTxgx40Rt9WEHziL02b5V89U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mR7lrv4q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF16B1F00A3A;
	Tue,  7 Jul 2026 16:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783442341;
	bh=K+JEjuBM0OYzZSHnI6spcjojqKR6WTBMaW+xSWEmd5s=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=mR7lrv4qGTf6jmHqXm72+Kj48QsW7RImC8W8FkWZP7dj6uJwQ0NeNflCYzTab78Cu
	 HNFz6KWxc3f/LJ+AEyCPmb+YB599UcadmZ7hMPT9EByIBqSQMSPZXa45p9ypHIGO3P
	 iCpy/5bvaoZ0eIVVKGZT2m112eqoEsdLR3054RjVb2MMS5jtTcqFSyF0Zec3+iWjhQ
	 OULDrDo0USxPj/0oh6E0lpAT3blLxHdnsvlrT25nGyAOt/XpR27waRfBa5HTpNfIMo
	 LIZ5rjrPIgGUQcMyORsGikAjj2ifpBUEXFffI/MSYYgvtqmJufWzF6hn9W7DzTjNe4
	 Hspf77jT/EjOQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 57847CE0AD3; Tue,  7 Jul 2026 09:39:01 -0700 (PDT)
Date: Tue, 7 Jul 2026 09:39:01 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Qingfang Deng <qingfang.deng@linux.dev>,
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
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org
Subject: Re: [PATCH net v2] ppp: defer channel free to an RCU grace period to
 fix pppol2tp RX UAF
Message-ID: <7ff3af97-1c10-4f46-84ae-ffbf757f7e9e@paulmck-laptop>
Reply-To: paulmck@kernel.org
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dfe59c2-bf60-40fe-90e6-d6e1003709d0@suse.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-624-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[paulmck@kernel.org,linux-ppp@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:petr.pavlu@suse.com,m:bigeasy@linutronix.de,m:qingfang.deng@linux.dev,m:leitao@debian.org,m:norbert@doyensec.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hataegu0826@gmail.com,m:kees@kernel.org,m:linux-ppp@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gnault@redhat.com,m:netdev@vger.kernel.org,m:mcgrof@kernel.org,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:atomlin@atomlin.com,m:linux-modules@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linutronix.de,linux.dev,debian.org,doyensec.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,vger.kernel.org,atomlin.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[paulmck@kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulmck@kernel.org,linux-ppp@vger.kernel.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,paulmck-laptop:mid,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C7BE71DFB3

On Tue, Jul 07, 2026 at 05:32:10PM +0200, Petr Pavlu wrote:
> On 7/6/26 11:29 AM, Sebastian Andrzej Siewior wrote:
> > + MODULE maintainer
> 
> + Paul E. McKenney
> 
> > 
> > On 2026-07-05 10:57:44 [+0800], Qingfang Deng wrote:
> >> On 7/4/2026 at 12:32 AM, Breno Leitao wrote:
> >>> On Fri, Jul 03, 2026 at 03:27:00PM +0800, Qingfang Deng wrote:
> >>>> AI-review found an issue: https://sashiko.dev/#/patchset/D9C0245B-608B-4884-8A09-F55BA4A9F948%40doyensec.com
> >>>>
> >>>> An rcu_barrier() call is needed at the end of ppp_cleanup().
> >>>
> >>> I was initially unclear why rcu_barrier() would be necessary on a kfree path,
> >>> but it appears to be required during module unload to ensure that
> >>> ppp_release_channel_free() completes before the module's struct rcu_head is
> >>> destroyed. Is that the correct understanding?
> >>
> >> It's required to ensure that all ppp_release_channel_free() callback
> >> complete before the text segment of the module is unloaded.
> > 
> > So either a rcu_barrier() in ppp's module_exit() callback or a
> > synchronize_rcu() instead of the call_rcu(). And all this because the
> > module RCU callbacks pending which can be invoked after the module has
> > been removed. There is a synchronize_rcu() during module exit but this
> > is after the module code is gone.
> > 
> > I'm curious how many modules have a call_rcu() within their code but
> > don't have anything to enforce its completion before module removal is
> > complete? Wouldn't something like
> > 
> > 
> > diff --git a/kernel/module/main.c b/kernel/module/main.c
> > index 46dd8d25a6058..8eae1ea2d6eb4 100644
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

There was some discussion of doing exactly this back in the day, but
at that time there were many modules that didn't do call_rcu() at all,
let alone call_rcu() with a function defined in that module.  And yes,
there were performance concerns.

Now rcu_barrier() has seen some performance work in the meantime, but
careful benchmarking would be required to justify the above patch.

That said, some automation would be very good, given that this sort of
bug happens from time to time.

> This is discussed in Documentation/RCU/rcubarrier.rst and
> Documentation/RCU/Design/Requirements/Requirements.rst. The latter
> contains:
> 
> | Loadable Modules
> | ~~~~~~~~~~~~~~~~
> | 
> | The Linux kernel has loadable modules, and these modules can also be
> | unloaded. After a given module has been unloaded, any attempt to call
> | one of its functions results in a segmentation fault. The module-unload
> | functions must therefore cancel any delayed calls to loadable-module
> | functions, for example, any outstanding mod_timer() must be dealt
> | with via timer_shutdown_sync() or similar.
> | 
> | Unfortunately, there is no way to cancel an RCU callback; once you
> | invoke call_rcu(), the callback function is eventually going to be
> | invoked, unless the system goes down first. Because it is normally
> | considered socially irresponsible to crash the system in response to a
> | module unload request, we need some other way to deal with in-flight RCU
> | callbacks.
> | 
> | RCU therefore provides rcu_barrier(), which waits until all
> | in-flight RCU callbacks have been invoked. If a module uses
> | call_rcu(), its exit function should therefore prevent any future
> | invocation of call_rcu(), then invoke rcu_barrier(). In theory,
> | the underlying module-unload code could invoke rcu_barrier()
> | unconditionally, but in practice this would incur unacceptable
> | latencies.
> 
> I don't know if the last part about unacceptable latencies is still
> relevant. I haven't done any measurements myself.

Actual measurements would most definitely be needed!

Alternatives include:

o	Provide a patch like that above, but only execute the
	rcu_barrier() in some debug mode.  If your code works when
	that debug is enabled but does not otherwise, you add the
	rcu_barrier().

o	If debug is enabled, make rcu_do_batch() check the function
	before invoking it.  If the function is not mapped, issue a
	diagnostic, and don't try to invoke the function.  (But is
	there a sufficiently cheap way to check for the function not
	being mapped?)

o	Make the page-fault code check this possibility.  (But it would
	need to know that rcu_do_batch() was involved, which could no
	doubt be arranged.)

o	Make call_rcu() keep track of the fact that it was passed a
	function defined in a module, and set a flag that caused the
	module-exit code for that module to do rcu_barrier().  The
	trick here would be doing this without unacceptable increases
	to call_rcu() overheads.

o	Some sort of static analysis that determines that call_rcu()
	was passed a function defined in a module and either issues
	needed diagnostics or (somehow) letting the module-unload
	code know that rcu_barrier() is needed.

o	One challenge for many of these alternatives is that the module is
	already gone.  Maybe a KASAN-like trick that tracks the module's
	old memory for some time afterwards?  Or maybe the user usually
	knows which module was just now unloaded?  (Except for modules
	being dependent on each other...)

o	Your ideas here!!!

							Thanx, Paul

