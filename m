Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF0BCBB85
	for <lists+linux-ppp@lfdr.de>; Fri,  4 Oct 2019 15:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388181AbfJDNVI (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 4 Oct 2019 09:21:08 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:36528 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387917AbfJDNVI (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 4 Oct 2019 09:21:08 -0400
X-Greylist: delayed 1717 seconds by postgrey-1.27 at vger.kernel.org; Fri, 04 Oct 2019 09:21:08 EDT
Received: from [10.49.74.218] (fw-lex.abinitio.com [65.170.40.234])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id x94CqCB2001184
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 4 Oct 2019 08:52:12 -0400
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com x94CqCB2001184
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1570193537;
        bh=xCi5Snao653bHWPzrhv2VxKsj68gB4gxpi3UaCY6+Mc=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=g86yOLDeXoTASNKtWFgCZ0ChABMmLXvCVDPiKV7KgxZmZI4VDKJgIt7IuQw0rh74q
         cjTpEuJuJEFVII0h0gbrBJS1JHJHv4DxfaVAmSMlOgcwcm9uQIaMb3DhoC4TkljhM1
         KxlxCcGFZ/yFtNB0zOXYmpMlOxa3ooLF3PWprFOA=
Subject: Re: [PATCH 4/9] pppd: include time.h before using time_t
To:     Levente <leventelist@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>, linux-ppp@vger.kernel.org
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20191003224054.GA26158@blackberry>
 <CACwWb3BoHF0WQ3ve3PQ_7L3LfJsvqC3Z9ZF5zOwd-r-GWv8CuA@mail.gmail.com>
 <20191004104958.GD881@x1.vandijck-laurijssen.be>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <6fb1fd97-7e97-8088-ef46-2d4003dbd4e6@workingcode.com>
Date:   Fri, 4 Oct 2019 08:52:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20191004104958.GD881@x1.vandijck-laurijssen.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-DCC-URT-Metrics: carlson 1060; Body=3 Fuz1=3 Fuz2=3
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 10/04/19 06:49, Kurt Van Dijck wrote:
>> IMHO time_t is defined in sys/types.h
> 
> http://www.open-std.org/JTC1/SC22/WG14/www/docs/n1256.pdf
> chapter 7.23.1.3
> 

I believe that covers userland environments, not the kernel.

At least on Solaris (and its derivatives, such as Illumos), the symbols
available in the kernel are defined in sys/ (or net/, netinet/, or
similar for network bits).  The top-level header files are for userland
libraries.  Userland libraries are not accessible within the kernel.

In this case, the common net/ppp_defs.h file is used by both user-level
code (pppd itself) and by several kernel modules.

There may be systems on which including <time.h> within a kernel module
is harmless (I suspect Linux is one), but I have a hard time believing
that it's correct to do so.

Do you know of a system where either (a) <sys/time.h> does not exist or
(b) it exists but does not define 'time_t'?  I haven't been able to find
a system that matches either case.  I tried several flavors of Linux,
AIX, Solaris, HP/UX, and IBM USS on z/OS.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
