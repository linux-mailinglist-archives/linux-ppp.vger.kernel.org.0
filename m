Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BABE3CC3FA
	for <lists+linux-ppp@lfdr.de>; Fri,  4 Oct 2019 22:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730447AbfJDUKz (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 4 Oct 2019 16:10:55 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:45576 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730340AbfJDUKy (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 4 Oct 2019 16:10:54 -0400
Received: from [10.49.74.218] (fw-lex.abinitio.com [65.170.40.234])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id x94KAcVK012602
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 4 Oct 2019 16:10:39 -0400
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com x94KAcVK012602
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1570219839;
        bh=Og/JFHboIDb6e7z7foc1QC7BzxRyCe9sgPt0+Eq1vn4=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=F7LLsFp6j83UVcbylB5aWdcxWs/k307IaR92BkX3pO52/5qHB6b0YqnvA5m54GSQH
         6TIpoYfgRS9GgpWEqO86a0mJDVG5N21lcc/vniHoUWrUK2Ba0RmK+k3ajtX+XjtgXp
         s0wu6N57XDsTS76VYmdd9n/QybPlaIvF113Yslq8=
Subject: Re: [PATCH] time.h: include header before using time_t
To:     Levente <leventelist@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>, linux-ppp@vger.kernel.org
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20191003224054.GA26158@blackberry>
 <CACwWb3BoHF0WQ3ve3PQ_7L3LfJsvqC3Z9ZF5zOwd-r-GWv8CuA@mail.gmail.com>
 <20191004104958.GD881@x1.vandijck-laurijssen.be>
 <6fb1fd97-7e97-8088-ef46-2d4003dbd4e6@workingcode.com>
 <20191004142900.GC22901@x1.vandijck-laurijssen.be>
 <f274b8fb-d472-c66d-5bc7-6af229a5f1b1@workingcode.com>
 <20191004174046.GA868@x1.vandijck-laurijssen.be>
 <d5c7a914-6e48-e4a7-3d6b-11807872ea5b@workingcode.com>
 <20191004183323.GB868@x1.vandijck-laurijssen.be>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <2342bac3-8759-d98b-631e-3c0d760e1126@workingcode.com>
Date:   Fri, 4 Oct 2019 16:10:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20191004183323.GB868@x1.vandijck-laurijssen.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-DCC-uptempo.net-Metrics: carlson 1093; Body=3 Fuz1=3 Fuz2=3
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 10/04/19 14:33, Kurt Van Dijck wrote:
> On vr, 04 okt 2019 13:52:11 -0400, James Carlson wrote:
> headers under sys/ are, AFAIK, not delivered by the kernel, but by the
> toolchain. sys/time.h may have less issues than time.h, it has the same
> disease.

I've never heard of this problem.  I'm afraid I don't know what you're
referring to.

I've never heard of a compiler (or other tool chain component) that
delivers files to /usr/include/sys.  That'd be somewhat surprising to
me, but I guess it's a wide world out there.

As the name says, the stuff under sys/ is part of the _system_.  On
UNIX, the standard parts of it are described in the Single UNIX
Standard, maintained by The Open Group.  That's the documentation
pointer I provided previously.

Are there systems where system header files aren't installed by default?
 Sure.  That's somewhat commonplace.  But on such a machine you can't
compile things (including pppd) until you install the (presumably
optional) header files.

If you look closely, you'll see that pppd/main.c already includes
<sys/time.h> and it's not guarded by any conditional compilation because
it's a *STANDARD HEADER FILE*.  If there were problems of some sort with
this include file, I'd expect they'd have surfaced by now.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
