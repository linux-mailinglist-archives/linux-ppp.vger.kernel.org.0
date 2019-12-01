Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD38210E182
	for <lists+linux-ppp@lfdr.de>; Sun,  1 Dec 2019 12:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfLALV1 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 1 Dec 2019 06:21:27 -0500
Received: from ozlabs.org ([203.11.71.1]:37401 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726138AbfLALV1 (ORCPT <rfc822;linux-ppp@vger.kernel.org>);
        Sun, 1 Dec 2019 06:21:27 -0500
Received: by ozlabs.org (Postfix, from userid 1003)
        id 47Qm5t6xNDz9sRD; Sun,  1 Dec 2019 22:21:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
        t=1575199282; bh=scIvbf4w04HHu9pXs7xkmL+l2plZbMMoC4JQZjZOU3o=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=LyJ5YJC9aBOpH3y+D1yjOIb042oWLRi1/50TK1p6LiLFmbbjpVGV/iatAzyTm/OmX
         24RDbAJlMYt3b1xk/e+jkfmzUU8u3yJ8bVcaUfVF+wRGBqPF6akYnGkoyJHSWAMwDp
         qVemIZ/uKDII/uLUcLBFW1iLjKhckKUtsztNXvBN8n/P/jP1TCIrfixvC+NkViZiZD
         nX/5FQAYHuuBLTy1OQ7OrQxp/yCdgg8fSaCS4qTzqwkjpvbYiiZhMyco+7mnJRUreK
         XrPJT/PQesyGAZI/LwAyIfvWbHH7dvtUwRSkWeAXULlZUgYpjGg0rTHcBKTj2egB4t
         j/PUPUnpZCczA==
Date:   Sun, 1 Dec 2019 22:21:15 +1100
From:   Paul Mackerras <paulus@ozlabs.org>
To:     James Carlson <carlsonj@workingcode.com>,
        Levente <leventelist@gmail.com>, linux-ppp@vger.kernel.org
Subject: Re: [PATCH] time.h: include header before using time_t
Message-ID: <20191201112115.GA29870@blackberry>
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20191003224054.GA26158@blackberry>
 <CACwWb3BoHF0WQ3ve3PQ_7L3LfJsvqC3Z9ZF5zOwd-r-GWv8CuA@mail.gmail.com>
 <20191004104958.GD881@x1.vandijck-laurijssen.be>
 <6fb1fd97-7e97-8088-ef46-2d4003dbd4e6@workingcode.com>
 <20191004142900.GC22901@x1.vandijck-laurijssen.be>
 <f274b8fb-d472-c66d-5bc7-6af229a5f1b1@workingcode.com>
 <20191004174046.GA868@x1.vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004174046.GA868@x1.vandijck-laurijssen.be>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Fri, Oct 04, 2019 at 07:40:46PM +0200, Kurt Van Dijck wrote:
> On vr, 04 okt 2019 10:49:17 -0400, James Carlson wrote:
> > On 10/04/19 10:29, Kurt Van Dijck wrote:
> > > Now that I know that that file is used as include for kernel code, I'd
> > > rather include time.h in the userspace c-files.
> > 
> > My point is that include/net/ isn't strictly userspace.
> > 
> > If you feel the need, then go ahead and include <time.h> in user level
> > files.  This just isn't one of those.
> > 
> > If you must do this in ppp_def.h, then it needs to be guarded against
> > *all* of the systems where including a top-level header file inside a
> > kernel module is the wrong thing to do, not just "ifndef SOLARIS".  Do
> > you know which systems those are?  I can tell you that Solaris/Illumos
> > is at least one such system, but I can't tell you that it's *all* of them.
> > 
> > I think this include is out of place here.
> ack
> 
> I think you confirm 4x what I said, but I probably expressed myself
> badly, so "show me code!", I created this patch.
> It (1) works for me and (2) does not mix userspace headers in kernel
> space anywhere.
> Would this work for you?
> 
> ---
> commit 567d505b1b8eff3d1579e849a4272d114f047bf3
> Author: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> Date:   Fri Oct 4 19:24:22 2019
> 
>     time.h: include header before using time_t
>     
>     Since include/net/ppp_defs.h is used in both kernelspace and userland
>     makes it hard to put time.h include there.
>     This commit fixes the problems in userspace code individually and leaves
>     ppp_defs.h as-is.
>     
>     Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> 
> diff --git a/pppd/plugins/rp-pppoe/pppoe-discovery.c b/pppd/plugins/rp-pppoe/pppoe-discovery.c
> index 8b2e946..f19c6d8 100644
> --- a/pppd/plugins/rp-pppoe/pppoe-discovery.c
> +++ b/pppd/plugins/rp-pppoe/pppoe-discovery.c
> @@ -15,6 +15,7 @@
>  #include <unistd.h>
>  #include <errno.h>
>  #include <string.h>
> +#include <time.h>
>  
>  #include "pppoe.h"
>  
> diff --git a/pppd/sha1.c b/pppd/sha1.c
> index f4f975c..4e51cee 100644
> --- a/pppd/sha1.c
> +++ b/pppd/sha1.c
> @@ -17,6 +17,7 @@
>  /* #define SHA1HANDSOFF * Copies data before messing with it. */
>  
>  #include <string.h>
> +#include <time.h>
>  #include <netinet/in.h>	/* htonl() */
>  #include <net/ppp_defs.h>
>  #include "sha1.h"

I applied this patch.

Paul.
