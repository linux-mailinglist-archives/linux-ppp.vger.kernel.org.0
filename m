Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03316CC1FF
	for <lists+linux-ppp@lfdr.de>; Fri,  4 Oct 2019 19:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388558AbfJDRwW (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 4 Oct 2019 13:52:22 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:42514 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388513AbfJDRwW (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 4 Oct 2019 13:52:22 -0400
Received: from [10.49.74.218] (fw-lex.abinitio.com [65.170.40.234])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id x94HqBtV031426
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 4 Oct 2019 13:52:11 -0400
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com x94HqBtV031426
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1570211531;
        bh=1atNweuBzOPWrT9f+59ez89RWCivAxHBICDJjC/FgoI=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=LF6bxQT+6NQbpxg2ss84j2BVKhEq7yJY+Va5c6WI+AujhMlTkyVl+FKfe+lY5J8Hm
         VB7bNf0KqXHCzU2IgKCy8RNKTF6K2YojAEAKIqc2jaaPnZOcjnv7a/Hng0P0yrR0wP
         0lOSo5wu/ggK1g/x3Sw6wuw5awogTRMygqLftl0Q=
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
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <d5c7a914-6e48-e4a7-3d6b-11807872ea5b@workingcode.com>
Date:   Fri, 4 Oct 2019 13:52:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20191004174046.GA868@x1.vandijck-laurijssen.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-DCC-uptempo.net-Metrics: carlson 1093; Body=3 Fuz1=3 Fuz2=3
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 10/04/19 13:40, Kurt Van Dijck wrote:
> I think you confirm 4x what I said, but I probably expressed myself
> badly, so "show me code!", I created this patch.
> It (1) works for me and (2) does not mix userspace headers in kernel
> space anywhere.
> Would this work for you?

That seems ok, in as much as it compiles on Solaris.  But I'm still a
little confused about your apparent opposition to <sys/time.h> at the
point where time_t is actually used.

<sys/time.h> is part of the UNIX standards.  It's documented to define
time_t (among other things).  It's on-point for a header file that may
be used in kernel context.  What's the concern?

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
