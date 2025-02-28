Return-Path: <linux-ppp+bounces-267-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B959A490A5
	for <lists+linux-ppp@lfdr.de>; Fri, 28 Feb 2025 05:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB8093A12C9
	for <lists+linux-ppp@lfdr.de>; Fri, 28 Feb 2025 04:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC811AF0B0;
	Fri, 28 Feb 2025 04:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ov1dLN/b"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CC316F841
	for <linux-ppp@vger.kernel.org>; Fri, 28 Feb 2025 04:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740718552; cv=none; b=lVFBv4lmkrtOLHEfpuCI3XZ7rVZphIv8j/3F8oM3kxwanwLhi+M56zhAmlyt7JvecKYAO8iqrdZUOPHfvpph+9M7zp4TrRZF1XRvm3LDrwskuTgFjpuOyzpqt6gXw8viMS75GGVoMy9lR3ZvXUbxfOGEOLxFdWpGwoHwJO3JPLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740718552; c=relaxed/simple;
	bh=Oyl75bEPYRCX3+JQYAFY+KMkLUcjc1Apw/AyJ7p6sFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHE7iHiRLabyUAjX0DaJoWGx0D/HRcLIc8feAjSMZP8eYwXFKZq1S1HHLcRnxGKKtOcGrfjLZiM1tnifgqovQSgWNq/+3zfE9Xe/bBllzS14Zqb2HyOYVbG3PJK1mDrLMAJDm643BoSo/UxvGZjjMSQ/gNwReXNE0Q1oUSn0cYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ov1dLN/b; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 28 Feb 2025 12:55:41 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740718549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SFH/CqJL4UtfGWPxwRoIS4R5TULoVqXuJV5xQ2LtJhc=;
	b=ov1dLN/bUvjED2SjAV4KH0ECQ1auhmOEqu2GjUfcbRzWJMMx5PPb0vVmG34IcYYT412OYp
	/d951uvU/pF3XqsdnHL1Ljl7og/zEU9Zw7+r+3CaIVTY0lyP2UoKxyPFPCKwKI/2KYLWjJ
	+BHmQVYM1WPu1rRW1FptChqRHigQRY8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: Jakub Kicinski <kuba@kernel.org>
Cc: horms@kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	ricardo@marliere.net, viro@zeniv.linux.org.uk, dmantipov@yandex.ru, 
	aleksander.lobakin@intel.com, linux-ppp@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mrpre@163.com, syzbot+853242d9c9917165d791@syzkaller.appspotmail.com
Subject: Re: [PATCH net-next v4 1/1] ppp: Fix KMSAN warning by initializing
 2-byte header
Message-ID: <wm7gi3hafgaruhnjaz5bqdv7yrduf6cum3gljylypzqkvw2ctw@b2zb75i2hpid>
References: <20250226013658.891214-1-jiayuan.chen@linux.dev>
 <20250226013658.891214-2-jiayuan.chen@linux.dev>
 <20250227174812.50d2eabe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227174812.50d2eabe@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Thu, Feb 27, 2025 at 05:48:12PM -0800, Jakub Kicinski wrote:
> On Wed, 26 Feb 2025 09:36:58 +0800 Jiayuan Chen wrote:
> > The PPP driver adds an extra 2-byte header to enable socket filters to run
> Could you add:
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> 
> And combine the cover letter with the commit message?
> For a single-patch postings cover letter is not necessary.
> 
> > +		*(__be16 *)skb_push(skb, 2) = htons(PPP_FILTER_OUTBOUND_TAG);
> >  		if (ppp->pass_filter &&
> >  		    bpf_prog_run(ppp->pass_filter, skb) == 0) {
> >  			if (ppp->debug & 1)
> 
> The exact same problem seems to be present in ppp_receive_nonmp_frame()
> please fix them both.
> -- 
> pw-bot: cr
Thanks, Jakub! I'll do that.

I was previously worried that the commit message would be too long,
so I put the detailed information in the cover letter instead. I'll make
the commit message more concise.

