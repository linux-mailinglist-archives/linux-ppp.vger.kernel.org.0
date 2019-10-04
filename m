Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F982CBDD8
	for <lists+linux-ppp@lfdr.de>; Fri,  4 Oct 2019 16:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389118AbfJDOtW (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 4 Oct 2019 10:49:22 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:38396 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388969AbfJDOtW (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 4 Oct 2019 10:49:22 -0400
Received: from [10.49.74.218] (fw-lex.abinitio.com [65.170.40.234])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id x94EnHlZ013202
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 4 Oct 2019 10:49:17 -0400
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com x94EnHlZ013202
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1570200557;
        bh=MQpmwvPhuhWjKMz2K20/mO8ifz+UB/IqARN0Ry0zCT8=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=dT/WkeBZ+FFLDos10EFJTwpyHEgU7AaOzg2ta799CWIP27KuECnrJu8TeKpWHpEgV
         1iRNWqqL8z+lsYy597gXUGo8BEQ7tgb3fm4YjcLnnG/0OXBck3ZluAnaITUL1W7ipL
         SgDwBecZNTJT/LLN06900IlvPtGbLWJfeKqjCIKI=
Subject: Re: [PATCH 4/9] pppd: include time.h before using time_t
To:     Levente <leventelist@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>, linux-ppp@vger.kernel.org
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20191003224054.GA26158@blackberry>
 <CACwWb3BoHF0WQ3ve3PQ_7L3LfJsvqC3Z9ZF5zOwd-r-GWv8CuA@mail.gmail.com>
 <20191004104958.GD881@x1.vandijck-laurijssen.be>
 <6fb1fd97-7e97-8088-ef46-2d4003dbd4e6@workingcode.com>
 <20191004142900.GC22901@x1.vandijck-laurijssen.be>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <f274b8fb-d472-c66d-5bc7-6af229a5f1b1@workingcode.com>
Date:   Fri, 4 Oct 2019 10:49:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20191004142900.GC22901@x1.vandijck-laurijssen.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-DCC-x.dcc-servers-Metrics: carlson 104; Body=3 Fuz1=3 Fuz2=3
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 10/04/19 10:29, Kurt Van Dijck wrote:
> I don't know a system where (a) or (b) are valid. My point is that such
> system could could exist, so I learned not to inspect the header files
> looking for a type, but inspect man-pages or specifications when looking
> for a type, and so time_t is defined in time.h.

I didn't just go trolling a grepping for time_t.  sys/time.h is pretty
well-established in UNIX, and I think you're punting when you point to
ANSI C alone as the authority here.

As for documentation, how does SUSv2 seem?

https://pubs.opengroup.org/onlinepubs/7908799/xsh/systime.h.html

> Now that I know that that file is used as include for kernel code, I'd
> rather include time.h in the userspace c-files.

My point is that include/net/ isn't strictly userspace.

If you feel the need, then go ahead and include <time.h> in user level
files.  This just isn't one of those.

If you must do this in ppp_def.h, then it needs to be guarded against
*all* of the systems where including a top-level header file inside a
kernel module is the wrong thing to do, not just "ifndef SOLARIS".  Do
you know which systems those are?  I can tell you that Solaris/Illumos
is at least one such system, but I can't tell you that it's *all* of them.

I think this include is out of place here.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
