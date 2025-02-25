Return-Path: <linux-ppp+bounces-259-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCE4A4398C
	for <lists+linux-ppp@lfdr.de>; Tue, 25 Feb 2025 10:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B73E7A4E52
	for <lists+linux-ppp@lfdr.de>; Tue, 25 Feb 2025 09:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA91E260A3A;
	Tue, 25 Feb 2025 09:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTg4IHMt"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FDB25A2D4;
	Tue, 25 Feb 2025 09:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740475975; cv=none; b=uucsJGPmPxMLsqSooFfzSa+gGodm0o6v/Bf7DmK3ujS6Ez9MYEzDC3Mv/ogXBrCNhnugrgp1OaKIMN1sZQMpSpQZ2hZXrK/uz1NWP2pNDAQokhX6BCnfqofBsLcYJluillEfcmhj1MusEO3EXqvaMt+WS+eb5CgersiGUyuBlcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740475975; c=relaxed/simple;
	bh=3vyiDv0/EKdVyd0wOgOhy6MPHW+txdIZfyH6UME8zuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ce7k2/nAhyZJ+DG7lQQvo7TZNS5r7oAa0gczATR/FVKtZ7LCMYMJHXL1PhUsrTKTOrPNlgF2qKODCS5FG0ZYzceg6RjcXy/avWLVTTQx420WFRJRWY4UfcC3EyaUb9NaKKz3E1dHHakG1ewgpKzrt5CxUKr2ETHTxs3bcublbxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTg4IHMt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76A3C4CEDD;
	Tue, 25 Feb 2025 09:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740475974;
	bh=3vyiDv0/EKdVyd0wOgOhy6MPHW+txdIZfyH6UME8zuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WTg4IHMtfkQSENr4GaeEwK1qPGxq3SFQ/VcVeBODoOfGifDu6oqkyV4sRbbvwI+CV
	 sptFLJvB0E3/pfZAnyYHQKelDBdRO7dzUW7ZRYTDOgznpfLguKeM+JRWMkRR6vTOQG
	 cIyLDMlmUdvK4Pg+4rVk2oQposlfnB+dOk4bfxmelSbJ6PnOsZWekKemFedP6KQieN
	 Np8OyE/kBmXxWeFMy2K26KTCQRBKi7jK5EIRyPvXM+n+VqKBRMowy0uKsTxNT3HvEZ
	 fYZWGRU79xZceC46eUNXrbiobrgXENzeq1WagvLjarHei4cq2jXBEMKTTZjEBD/h8M
	 lEn2j9rVap0lA==
Date: Tue, 25 Feb 2025 09:32:49 +0000
From: Simon Horman <horms@kernel.org>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, ricardo@marliere.net,
	viro@zeniv.linux.org.uk, dmantipov@yandex.ru,
	aleksander.lobakin@intel.com, linux-ppp@vger.kernel.org,
	linux-kernel@vger.kernel.org, mrpre@163.com,
	syzbot+853242d9c9917165d791@syzkaller.appspotmail.com
Subject: Re: [PATCH net-next v1 1/1] ppp: Fix KMSAN warning by initializing
 2-byte header
Message-ID: <20250225093249.GI1615191@kernel.org>
References: <20250218133145.265313-1-jiayuan.chen@linux.dev>
 <20250218133145.265313-2-jiayuan.chen@linux.dev>
 <20250220152703.619bf1c9@kernel.org>
 <rqdpj4pdxkiad7amqp7qzsrdtgy3i5beqpz7gsrjy4dwkmwg2x@3bsn7svbawic>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rqdpj4pdxkiad7amqp7qzsrdtgy3i5beqpz7gsrjy4dwkmwg2x@3bsn7svbawic>

On Fri, Feb 21, 2025 at 09:48:33AM +0800, Jiayuan Chen wrote:
> On Thu, Feb 20, 2025 at 03:27:03PM -0800, Jakub Kicinski wrote:
> > On Tue, 18 Feb 2025 21:31:44 +0800 Jiayuan Chen wrote:
> > > -		*(u8 *)skb_push(skb, 2) = 1;
> > > +		*(u16 *)skb_push(skb, 2) = 1;
> > 
> > This will write the 1 to a different byte now, on big endian machines.
> > Probably doesn't matter but I doubt it's intentional?
> > -- 
> > pw-bot: cr
> You are correct that I assigned the value in a way that produces different
> data on big-endian and little-endian systems, although it doesn't cause
> any issues.
> I think it's better to assign it correctly according to the corresponding
> header and add more comments to avoid confusion for other developers in
> the future.

I agree correctness is good.

Perhaps I am over-thinking things, but does the following approach
achieve both of the following?

a) Initialise both bytes.
b) Place the 1 consistently on both big and little endian hosts,
   as is the case without this patch (which I assume is correct).

	*(__be16 *)skb_push(skb, 2) = cpu_to_be16(1);

