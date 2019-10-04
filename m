Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3D9CCBD30
	for <lists+linux-ppp@lfdr.de>; Fri,  4 Oct 2019 16:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389083AbfJDO3F (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 4 Oct 2019 10:29:05 -0400
Received: from relay-b02.edpnet.be ([212.71.1.222]:52222 "EHLO
        relay-b02.edpnet.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389082AbfJDO3E (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 4 Oct 2019 10:29:04 -0400
X-ASG-Debug-ID: 1570199341-0a7b8d53c210d6db0001-vz1ewb
Received: from zotac.vandijck-laurijssen.be (77.109.104.71.adsl.dyn.edpnet.net [77.109.104.71]) by relay-b02.edpnet.be with ESMTP id npCfC69TkRUdQCFT; Fri, 04 Oct 2019 16:29:01 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.104.71.adsl.dyn.edpnet.net[77.109.104.71]
X-Barracuda-Apparent-Source-IP: 77.109.104.71
Received: from x1.vandijck-laurijssen.be (x1.vandijck-laurijssen.be [IPv6:fd01::1a1d:eaff:fe02:d339])
        by zotac.vandijck-laurijssen.be (Postfix) with ESMTPSA id 02439A2FEFB;
        Fri,  4 Oct 2019 16:29:00 +0200 (CEST)
Date:   Fri, 4 Oct 2019 16:29:00 +0200
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To:     James Carlson <carlsonj@workingcode.com>
Cc:     Levente <leventelist@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>, linux-ppp@vger.kernel.org
Subject: Re: [PATCH 4/9] pppd: include time.h before using time_t
Message-ID: <20191004142900.GC22901@x1.vandijck-laurijssen.be>
X-ASG-Orig-Subj: Re: [PATCH 4/9] pppd: include time.h before using time_t
Mail-Followup-To: James Carlson <carlsonj@workingcode.com>,
        Levente <leventelist@gmail.com>, Paul Mackerras <paulus@ozlabs.org>,
        linux-ppp@vger.kernel.org
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20191003224054.GA26158@blackberry>
 <CACwWb3BoHF0WQ3ve3PQ_7L3LfJsvqC3Z9ZF5zOwd-r-GWv8CuA@mail.gmail.com>
 <20191004104958.GD881@x1.vandijck-laurijssen.be>
 <6fb1fd97-7e97-8088-ef46-2d4003dbd4e6@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6fb1fd97-7e97-8088-ef46-2d4003dbd4e6@workingcode.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Barracuda-Connect: 77.109.104.71.adsl.dyn.edpnet.net[77.109.104.71]
X-Barracuda-Start-Time: 1570199341
X-Barracuda-URL: https://212.71.1.222:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 1886
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.5348 1.0000 0.7500
X-Barracuda-Spam-Score: 0.75
X-Barracuda-Spam-Status: No, SCORE=0.75 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.77097
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On vr, 04 okt 2019 08:52:12 -0400, James Carlson wrote:
> On 10/04/19 06:49, Kurt Van Dijck wrote:
> >> IMHO time_t is defined in sys/types.h
> > 
> > http://www.open-std.org/JTC1/SC22/WG14/www/docs/n1256.pdf
> > chapter 7.23.1.3
> > 
> 
> I believe that covers userland environments, not the kernel.
> 
> At least on Solaris (and its derivatives, such as Illumos), the symbols
> available in the kernel are defined in sys/ (or net/, netinet/, or
> similar for network bits).  The top-level header files are for userland
> libraries.  Userland libraries are not accessible within the kernel.
> 
> In this case, the common net/ppp_defs.h file is used by both user-level
> code (pppd itself) and by several kernel modules.

I see.

> 
> There may be systems on which including <time.h> within a kernel module
> is harmless (I suspect Linux is one), but I have a hard time believing
> that it's correct to do so.

You're right that the kernel code does not __necessarily__ use the same thing.
What matters here is that all kernel code must use the same thing.

> 
> Do you know of a system where either (a) <sys/time.h> does not exist or
> (b) it exists but does not define 'time_t'?  I haven't been able to find
> a system that matches either case.  I tried several flavors of Linux,
> AIX, Solaris, HP/UX, and IBM USS on z/OS.

I don't know a system where (a) or (b) are valid. My point is that such
system could could exist, so I learned not to inspect the header files
looking for a type, but inspect man-pages or specifications when looking
for a type, and so time_t is defined in time.h.

Regardless of those systems, you look for 1 header that suits userspace
and solaris kernel. Isn't that a bit ... strange.

Now that I know that that file is used as include for kernel code, I'd
rather include time.h in the userspace c-files.

Kurt
