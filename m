Return-Path: <linux-ppp+bounces-316-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEE4AFC766
	for <lists+linux-ppp@lfdr.de>; Tue,  8 Jul 2025 11:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADB183B5FE3
	for <lists+linux-ppp@lfdr.de>; Tue,  8 Jul 2025 09:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63CA2676D9;
	Tue,  8 Jul 2025 09:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="N7zAcvCh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BkSmsZcx"
X-Original-To: linux-ppp@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023FE26656F;
	Tue,  8 Jul 2025 09:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751968204; cv=none; b=t0uTPgv6E+Wy77e4thCaBA9ar14TIv/azK3l/87HGoiSA/Sx0C0U/MMojzLUrZta0q4VGjXZmICvje1Ps+4rzwdYprPBRfOIbrRDN8yhjZfZywF9OAe9l7i6ciCwW3jXqexioC7PnPg/2u0nyAF49q5AY2CIykq4SzL9EhPegZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751968204; c=relaxed/simple;
	bh=a0Z9PfKfII98R7YGk4/s8F9FpfkBpu8y+L25NxNZzG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7m4IN7FxVmHoH7756zMf0VWgN0R1bOV3rwx8wmbVHJhEk+i5zI/s7ZDVetD+5HGccon8RuWggfhPOwLWfRTlYIj3whFsAaJ/8/KjjFOyOJMmaDQN7JtAj3CNM0f/Ln93pu+OKLsUQPV5qni6hUv3GNgwzUrM489Axf+CYGuJYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=N7zAcvCh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BkSmsZcx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 8 Jul 2025 11:49:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751968201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VuW917uep+A/nkbFezjMxXDYk2Q/n07Yq/IsuY9f8ek=;
	b=N7zAcvChEgp7fViiM5aiPukmkcHV5BLHrqg8ggWSy4AHDecucujIU6irH3DVGRCn7ZKQ0i
	U6UHmKcGayOHCZ30JXPNEhPh8+38DUv/QsSb2hRFta2Tp7+AjGoqIUDbc4DdwEuCzXqARr
	cLiuFC7Q5yrzJyseEk5zT95Fjm5pYABf/f8CGCi7shG3eQlKWWVNeOBAaL60WJcEaAqP5+
	xwmICliLklNi0GUuwhit9+WAiSY26Z46UxmECZlt9wkyWIWHcin9aRW1GxV9T+SI3Vc/EG
	xaAdOnGx2UQ2f2nl6hjkCf0b5zRyUhpf/iQrsKiD/GV86b0k+mhhivMSEqBHDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751968201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VuW917uep+A/nkbFezjMxXDYk2Q/n07Yq/IsuY9f8ek=;
	b=BkSmsZcx6xnrvhUEP8tv10ymf9hwpIlnzDWRsxk0HNdl2rg6tsy8n1/V4Jn8nzcqeueRBW
	FPhoCBixz9SBDeBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Paolo Abeni <pabeni@redhat.com>
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Williams <clrkwllms@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Gao Feng <gfree.wind@vip.163.com>,
	Guillaume Nault <g.nault@alphalink.fr>
Subject: Re: [PATCH net-next] ppp: Replace per-CPU recursion counter with
 lock-owner field
Message-ID: <20250708094959.zByWzNMQ@linutronix.de>
References: <20250627105013.Qtv54bEk@linutronix.de>
 <9bffa021-2f33-4246-a8d4-cce0affe9efe@redhat.com>
 <20250704154806.twigjkbU@linutronix.de>
 <1eb149e6-68e7-4932-8090-34ee568c5832@redhat.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1eb149e6-68e7-4932-8090-34ee568c5832@redhat.com>

On 2025-07-08 10:28:24 [+0200], Paolo Abeni wrote:
> Hi,
Hi,

> I'm sorry for the latency, OoO here in between.

All good. I appreciate someone looking at it.

> On 7/4/25 5:48 PM, Sebastian Andrzej Siewior wrote:
> > On 2025-07-03 09:55:21 [+0200], Paolo Abeni wrote:
> >> Is there any special reason to not use local_lock here? I find this
> >> patch quite hard to read and follow, as opposed to the local_lock usage
> >> pattern. Also the fact that the code change does not affect RT enabled
> >> build only is IMHO a negative thing.
> > 
> > Adding a local_lock_t to "protect" the counter isn't that simple. I
> > still have to check for the owner of the lock before the lock is
> > acquired to avoid recursion on that local_lock_t. I need to acquire the
> > lock before checking the counter because another task might have
> > incremented the counter (so acquiring the lock would not deadlock). This
> > is similar to the recursion detection in openvswitch. That means I would
> > need to add the local_lock_t and an owner field next to the recursion
> > counter.
> 
> IMHO using a similar approach to something already implemented is a
> plus, and the OVS code did not look that scaring. Also it had the IMHO
> significant advantage of keeping the changes constrained to the RT build.

I intended to improve the code and making it more understandable of what
happens here and why. Additionally it would also fit with RT and not
just make this change to fit with RT.

> > I've been looking at the counter and how it is used and it did not look
> > right. The recursion, it should detect, was described in commit
> > 55454a565836e ("ppp: avoid dealock on recursive xmit"). There are two
> > locks that can be acquired due to recursion and that one counter is
> > supposed to catch both cases based on current code flow.
> > 
> > It is also not obvious why ppp_channel_push() makes the difference
> > depending on pch->ppp while ->start_xmit callback is invoked based on
> > pch->chan.
> > It looked more natural to avoid the per-CPU usage and detect the
> > recursion based on the lock that might be acquired recursively. I hope
> > this makes it easier to understand what is going on here.
> 
> Actually I'm a bit lost. According to 55454a565836e a single recursion
> check in ppp_xmit_process() should be enough, and I think that keeping
> the complexity constraint there be better.

Okay. I didn't think that this complicated the code flow.

> > While looking through the code I wasn't sure if
> > ppp_channel_bridge_input() requires the same kind of check for recursion
> > but adding it based on the lock, that is about to be acquired, would be
> > easier.
> 
> (still lost in PPP, but) The xmit -> input path transition should have
> already break the recursion (via the backlog). Recursion check in tx
> should be sufficient.
> 
> All in all I think it would be safer the local lock based approach.

Okay. I disagree but let me do as you suggested.

Thank you.

> Thanks,
> 
> Paolo

Sebastian

