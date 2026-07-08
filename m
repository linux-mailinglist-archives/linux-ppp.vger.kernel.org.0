Return-Path: <linux-ppp+bounces-626-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ThQKKcIUTmrdCgIAu9opvQ
	(envelope-from <linux-ppp+bounces-626-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Jul 2026 11:13:38 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E69B72383E
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Jul 2026 11:13:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=BmEmoPDU;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=8LVnaRQu;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-626-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-ppp+bounces-626-lists+linux-ppp=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BFBA303ED52
	for <lists+linux-ppp@lfdr.de>; Wed,  8 Jul 2026 09:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AD8407CC7;
	Wed,  8 Jul 2026 09:11:52 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140043EDE46;
	Wed,  8 Jul 2026 09:11:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501912; cv=none; b=daZN94+1pQThtMOmeK2bnDMJrcnj8n3N3RleIAJ9T+TScXjzZbnOY1dFlYucBCYlB6EIg2iKh6xXhmkSfxOkEVgab+IlI8WgsPuersJ02TmihkdlgwETRGe3oVKB08vBEB12Pt+9cGj2/mMnpIa2ErHTSg3L/M/87j9f07nj5+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501912; c=relaxed/simple;
	bh=l6JFG91mW4G/R7fCfssf6gK5hHZ7Nor2KNHzJAv9e7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOZnMQ66C11Y0ZV6GR/zDaKWP9iB+ZwLKr9g8wZVGmcPg9xL8x5e88Yf1sFHSHWRKgpm/Kw5whcwCICdPX4BHGmBa1axs7gy4R+cWtUUdror/aBHcrOgB7uZcudp3mmXjsIYqyDpoP6hZGcfUhHVC3gZpkmam+MK9dWwKxKRuaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BmEmoPDU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8LVnaRQu; arc=none smtp.client-ip=193.142.43.55
Date: Wed, 8 Jul 2026 11:11:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783501909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h20LA5YHcmtZeGTDYEJk05BGftpy3fA0SNQGNgHnfeQ=;
	b=BmEmoPDUE7RTx+O7SGa8Sfj20DHd8nsSSyeAnXbAkrIXfNnYd52ncDrPcrhUZsZLL3n4KJ
	NV7mHh5snAJuqdcw1CV/pMqodej5EzEsCN5rjJ+smi9c4NG+LFQN8KsGRMEqj//80ybY2h
	l7AT/M6Rp4TNGdMXh6aSUmCGQReGIms9I+Q8lbvK911eMGhpBjBHNSjTLvIekjc+alr+8A
	1uE1nfoo3m06k9+3z8FnWkTGLeoBJT32QZBN+TsCZgMdQucW9Jz213gLfGUTdSjLyUzamE
	XEE7AagAEnUQyJc8y6ZT75pQLlW4xqxbV/8rtdSJIPDnLszkLhyyTlvP4LMJzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783501909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h20LA5YHcmtZeGTDYEJk05BGftpy3fA0SNQGNgHnfeQ=;
	b=8LVnaRQujGpEmXl1EKf5Dzy+QxRHLNbyF7X+jFHRdO/pk9s+Ca4LFbi8rLef0/CvI57MFy
	NQfpOW0HMJW4qZDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>,
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
Message-ID: <20260708091147.O1d41Vi0@linutronix.de>
References: <D9C0245B-608B-4884-8A09-F55BA4A9F948@doyensec.com>
 <de2616b3-6edf-4255-ba77-0674e225ab27@linux.dev>
 <akfjpBVML_1RFF91@gmail.com>
 <87111f02-5b7a-4185-8364-2faba650578b@linux.dev>
 <20260706092926.PIlrhRKz@linutronix.de>
 <0dfe59c2-bf60-40fe-90e6-d6e1003709d0@suse.com>
 <7ff3af97-1c10-4f46-84ae-ffbf757f7e9e@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7ff3af97-1c10-4f46-84ae-ffbf757f7e9e@paulmck-laptop>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-626-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linux-ppp@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:paulmck@kernel.org,m:petr.pavlu@suse.com,m:qingfang.deng@linux.dev,m:leitao@debian.org,m:norbert@doyensec.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hataegu0826@gmail.com,m:kees@kernel.org,m:linux-ppp@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gnault@redhat.com,m:netdev@vger.kernel.org,m:mcgrof@kernel.org,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:atomlin@atomlin.com,m:linux-modules@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[suse.com,linux.dev,debian.org,doyensec.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,vger.kernel.org,atomlin.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linutronix.de:from_mime,linutronix.de:dkim,linutronix.de:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E69B72383E

On 2026-07-07 09:39:01 [-0700], Paul E. McKenney wrote:
> Alternatives include:
> 
> o	Provide a patch like that above, but only execute the
> 	rcu_barrier() in some debug mode.  If your code works when
> 	that debug is enabled but does not otherwise, you add the
> 	rcu_barrier().
> 
> o	If debug is enabled, make rcu_do_batch() check the function
> 	before invoking it.  If the function is not mapped, issue a
> 	diagnostic, and don't try to invoke the function.  (But is
> 	there a sufficiently cheap way to check for the function not
> 	being mapped?)

In both cases you would see a backtrace and the name of the last
unloaded module. And since we don't see a lot of these reports, people
either don't run into this because it does not exist or RCU is quick
enough.

> 
> 							Thanx, Paul

Sebastian

