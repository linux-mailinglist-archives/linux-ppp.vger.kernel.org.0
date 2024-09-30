Return-Path: <linux-ppp+bounces-97-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FC59899F0
	for <lists+linux-ppp@lfdr.de>; Mon, 30 Sep 2024 07:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2665AB212EB
	for <lists+linux-ppp@lfdr.de>; Mon, 30 Sep 2024 05:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8C723BE;
	Mon, 30 Sep 2024 05:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b="mIHu1NUo"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DE31362
	for <linux-ppp@vger.kernel.org>; Mon, 30 Sep 2024 05:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727672717; cv=none; b=SSxhnhjv3CqQ6iFpe4f5XhDF6KTtQ7y6SARSFKQMf0QusSrHUXZKSXHDPIOkO2t9UStgf1RcflJnUYWm7/1QqCovhyHjBWgFcc/ju7AmR4lGKGWqCbfn/1fIp/6v8wlSXHbgqBLdxZnYOzX4/DCt++MWhlybv0sMS7y6d27B7no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727672717; c=relaxed/simple;
	bh=+IVcehI6dxKZMbJDhNvWBhbZHpQUOxswe8wd1BWZ0bA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqVF2TV713N+NqJw4ywvql6CUYfUo6+rZa4TSUafjhfol2yaadjd2FsaSQfC315DQDN2XHzq3X4mytHhLxzMWkuPyhkuu6o1hwWLlccq+G6A6wsYbry2/8QXkot1MDUXMxYcBqTYyWATjTO31sseFIGxYdmI8cOC/rEFxsWlJvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=mIHu1NUo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1727672711;
	bh=rtLcxgzDItRYezb4H4PT2uwUnfX8bPpmQI3rA+Q+sIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mIHu1NUon+eBoebpfRYK6fJXmkrTuwHeoF6nfTk0mKlEv4jFfCDbKkTg7WezW4bh1
	 NDjNOR1+PvjCs2TblEuv6BWkc9S9EVAKdAt6YltTgkMrTexM4YiqLl8MP4EetRI4Kr
	 NaM+Hs28kjLk+sh2nm3gjkh2bmDovQGLMoULnNEha0hUoHLso7EfnPPQ4+5qiuwK1i
	 WxZWzxpZOtFJmrd9YRW27aMBEmIoUE++4zQgnUNaLonQCAzcLuuM4UuTPe3x75fsqv
	 pX5pz/Fvh3QttoGtCO2CFh5GaKavJN7aMTGjpiBSPydsy51OHQbTwkFnEdoJJzB/1P
	 PmB1RcC/WZutw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4XH8CC4mrNz4wc3; Mon, 30 Sep 2024 15:05:11 +1000 (AEST)
Date: Mon, 30 Sep 2024 15:05:07 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: James Carlson <carlsonj@workingcode.com>
Cc: ppp Linux <linux-ppp@vger.kernel.org>
Subject: Re: patch to bring Solaris back up to date
Message-ID: <Zvoxg9_Yoyk4-2kP@cleo.paulus.ozlabs.org>
References: <c9ad04a2-e9ee-4953-afd6-9412711c4f35@workingcode.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9ad04a2-e9ee-4953-afd6-9412711c4f35@workingcode.com>

On Sat, Sep 21, 2024 at 05:04:49PM -0400, James Carlson wrote:
> The attached patch for review brings the Solaris support back up to
> date. Here is a summary of the changes it contains:
> 
> - Updated readmes
> - Disabled MPPE support for Solaris
> - Fixed compilation error in ccp.c with MPPE disabled
> - Use OS-provided drivers and associated include files
> - Tested on OpenIndiana Hipster (Illumos)
> 
> -- 
> James Carlson     42.703N 71.076W FN42lq08    <carlsonj@workingcode.com>

Thanks James, and I apologize for my slow response.

Basically the patch looks good to me.  I do need a Signed-off-by line
from you, or at least your permission to add one like the one below
for you.  Let me know if you want me to add that for you and edit the
description, or if you would prefer to resubmit it.  In the former
case I would edit the description to look like this:

------------------------------------------------------
Bring Solaris port back up to date

- Updated READMEs
- Disabled MPPE support for Solaris
- Fixed compilation error in ccp.c with MPPE disabled
- Use OS-provided drivers and associated include files
- Tested on OpenIndiana Hipster (Illumos)

Signed-off-by: James Carlson <carlsonj@workingcode.com>
------------------------------------------------------

Thanks,
Paul.

