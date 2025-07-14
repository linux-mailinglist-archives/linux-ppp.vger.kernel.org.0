Return-Path: <linux-ppp+bounces-321-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 749D1B04835
	for <lists+linux-ppp@lfdr.de>; Mon, 14 Jul 2025 22:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B85634A4A30
	for <lists+linux-ppp@lfdr.de>; Mon, 14 Jul 2025 20:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD1A1FDA97;
	Mon, 14 Jul 2025 20:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K+6jtWUQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jKjvCY6y"
X-Original-To: linux-ppp@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C425113D521;
	Mon, 14 Jul 2025 20:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752523304; cv=none; b=G6ZrJhjGqXGEM8q2wjNtM0WRtt4uBkUp5RuURmc2LZXjNLFcjpxsy2mTRBfeAzqn/VfOxAkP7sb5fF628XLiCBNryhFIuGzUWo2KqCSjMZsLhaC5GM+eMcouovq8oUdk0+yRaSw/jY6Jzca9O8e9xId1NDYf1Y95ZlpO5QPsW+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752523304; c=relaxed/simple;
	bh=vs6qWu/FTmbTZd+Yh8UP8EH3Xetm4byJJi5/nqmH0lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SlOIWK/nvEE9eYuaCtJ0TVJC4PVGoyD44SMOTZemJ9BIY1D3q8fXpgJbtI0PPEUG2X2ONz+YU3FmeeFjkYFUjZjY3DF2Kr1jxpiwRPlkHfwVSJ0evEWk92P50Jp33J5BLhAPSC3Ev1FcAp88AfXHzkMbwAlI7Vx7wLBHa3ND/BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K+6jtWUQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jKjvCY6y; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 14 Jul 2025 22:01:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752523300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WujoBz/ivNEq8+/anje0cyqqPJBCrI0GjQBhwezCpek=;
	b=K+6jtWUQ34ruL+JXL1bv6YpUg23hk0jRvBSc6xr2sD7qnj/oqxNuDV0WjwPotA/g4AgYy2
	CZfrkXCBPdYzYJIiRcLus/cwSJCu9ZekD+XOi4DKwfW2Xg2rCnKQL3b7kMJc8cVn+zEkMl
	xsIpgt9y52mBBx8oj0qROfPJcrU36tjXTcMBSIfsz6OZK/UhpXV7HWD9UnRAXv5fmdrPWy
	RqbPfdayn4tAiMTP/QFrfEzJuBfNmWGWQlmc2vXGRCXWuEHuL7nwYhdbW1QvaY0DjDO1jM
	azKQiuTlFzr3UG9jTughG/5nOm+Lutt6ZcQvkBG/8RiGdqlhVkgW10wGySZHPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752523300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WujoBz/ivNEq8+/anje0cyqqPJBCrI0GjQBhwezCpek=;
	b=jKjvCY6yDtXaKKTTYCLCqa4BjOwyWSzCWqwtQZDYzXa9eDpkYEtIjDLqhK3XKxNg4XeUdZ
	O6JNhE7OH57H7sBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Guillaume Nault <gnault@redhat.com>
Cc: netdev@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	linux-ppp@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Williams <clrkwllms@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH net-next v2 1/1] ppp: Replace per-CPU recursion counter
 with lock-owner field
Message-ID: <20250714200139.tgfgVP1L@linutronix.de>
References: <20250710162403.402739-1-bigeasy@linutronix.de>
 <20250710162403.402739-2-bigeasy@linutronix.de>
 <aHUsB04j+uFrUkpd@debian>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aHUsB04j+uFrUkpd@debian>

On 2025-07-14 18:10:47 [+0200], Guillaume Nault wrote:
> On Thu, Jul 10, 2025 at 06:24:03PM +0200, Sebastian Andrzej Siewior wrote:
> > The per-CPU variable ppp::xmit_recursion is protecting against recursion
> > due to wrong configuration of the ppp channels. The per-CPU variable
> 
> I'd rather say that it's the ppp unit that is badly configured: it's
> the ppp unit that can creates the loop (as it creates a networking
> interface).

I can reword this.

> > index def84e87e05b2..0edc916e0a411 100644
> > --- a/drivers/net/ppp/ppp_generic.c
> > +++ b/drivers/net/ppp/ppp_generic.c
> > @@ -119,6 +119,11 @@ struct ppp_link_stats {
> >  	u64 tx_bytes;
> >  };
> >  
> > +struct ppp_xmit_recursion {
> > +	struct task_struct *owner;
> > +	local_lock_t bh_lock;
> > +};
> > +
> 
> This hunk conflicts with latest changes in net-next.

Thank you.

> Apart from the two minor comments above, the patch looks good to me.
> Thanks!

Okay. As of the people involved while this detection was added and
polished, do you have an opinion on v1?
	https://lore.kernel.org/all/20250627105013.Qtv54bEk@linutronix.de/

Sebastian

