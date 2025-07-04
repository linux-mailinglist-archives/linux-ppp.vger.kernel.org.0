Return-Path: <linux-ppp+bounces-314-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC602AF9744
	for <lists+linux-ppp@lfdr.de>; Fri,  4 Jul 2025 17:48:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 184EA7BB01C
	for <lists+linux-ppp@lfdr.de>; Fri,  4 Jul 2025 15:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840CC1D416E;
	Fri,  4 Jul 2025 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="syCl377n";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0y9LCHTD"
X-Original-To: linux-ppp@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2B01A5BB1;
	Fri,  4 Jul 2025 15:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751644091; cv=none; b=GYSeTdUpE0p4ZIZn1k/Q3/+OtO5W2AnHIc5ObzQ8G134XSQ7Gv0jMOufgKqdALepFeBwAuWzIRwBikmgApS1iNB+PoknI1rwWaoS47G2LtSnYXxXDbCGk0Zzr9athtBahyYUgVj8id+RoD+PEE7cq91kO4lkLi7fjFaiWJEHsew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751644091; c=relaxed/simple;
	bh=RdGJjNv2wblzAbd2+QjjKHxAMv732coO3B9agM0VebU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ga4d2mjxpCFN6doBYWNPm5pZYJQR9B8cKPZm+4MJWtUZhR9c9CLg7s7yZBkD3ESrCDWBSk3zFA+a4QiHBxSMGfRFtUJ84gWPu91lysz8a8amTa80h8RY27rAC1f1cpZ54S0TdTMzXuUV8Mj5a6/HgbqWUCfesPPzQXf+tsK4guI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=syCl377n; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0y9LCHTD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 4 Jul 2025 17:48:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751644088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RdGJjNv2wblzAbd2+QjjKHxAMv732coO3B9agM0VebU=;
	b=syCl377nyDvfkILocmeZExoZRf3uJ1bR56PF+GVyKuv3XQQUUbw4lZkhncVWzE5S7QcJbt
	9z9BZTltkwAN65qrsYrrrglhrWHj8tmOSF0/qYTGE5ZlXkoxkHbZMw+mKuenns94wJ/1CI
	tcKZm5i9nTzsUEFwP0mkXdGwaDegLd+QRlkcMxx3n2SY1s+fjUNQsYCpONsmDNtoHRdwzx
	AlR/TlM4vj2tkFDh3uU9PzKqmyPOfVZbBmxPXfhgBD5o6gAbLnVsU/q+Je0l33EQMKLKjY
	4P61+dHwG1e5BWgtGqCi9yGtI1QETnnwTN5p7igqEndJqs9zaokr9dFFTAjeAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751644088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RdGJjNv2wblzAbd2+QjjKHxAMv732coO3B9agM0VebU=;
	b=0y9LCHTDYvWkIxYD4f7w0hdJ/blng58wXCrdel++I/DAbarbpjkiwR6tkvyJdbvkKns5Wt
	l4eB1N4s7UoT3nBQ==
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
Message-ID: <20250704154806.twigjkbU@linutronix.de>
References: <20250627105013.Qtv54bEk@linutronix.de>
 <9bffa021-2f33-4246-a8d4-cce0affe9efe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9bffa021-2f33-4246-a8d4-cce0affe9efe@redhat.com>

On 2025-07-03 09:55:21 [+0200], Paolo Abeni wrote:
> Is there any special reason to not use local_lock here? I find this
> patch quite hard to read and follow, as opposed to the local_lock usage
> pattern. Also the fact that the code change does not affect RT enabled
> build only is IMHO a negative thing.

Adding a local_lock_t to "protect" the counter isn't that simple. I
still have to check for the owner of the lock before the lock is
acquired to avoid recursion on that local_lock_t. I need to acquire the
lock before checking the counter because another task might have
incremented the counter (so acquiring the lock would not deadlock). This
is similar to the recursion detection in openvswitch. That means I would
need to add the local_lock_t and an owner field next to the recursion
counter.

I've been looking at the counter and how it is used and it did not look
right. The recursion, it should detect, was described in commit
55454a565836e ("ppp: avoid dealock on recursive xmit"). There are two
locks that can be acquired due to recursion and that one counter is
supposed to catch both cases based on current code flow.

It is also not obvious why ppp_channel_push() makes the difference
depending on pch->ppp while ->start_xmit callback is invoked based on
pch->chan.
It looked more natural to avoid the per-CPU usage and detect the
recursion based on the lock that might be acquired recursively. I hope
this makes it easier to understand what is going on here.
While looking through the code I wasn't sure if
ppp_channel_bridge_input() requires the same kind of check for recursion
but adding it based on the lock, that is about to be acquired, would be
easier.

> /P
Sebastian

