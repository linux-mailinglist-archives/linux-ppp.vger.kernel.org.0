Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D78315F538
	for <lists+linux-ppp@lfdr.de>; Fri, 14 Feb 2020 19:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390673AbgBNSZs (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 14 Feb 2020 13:25:48 -0500
Received: from carlson.workingcode.com ([50.78.21.49]:40094 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387833AbgBNSZq (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 14 Feb 2020 13:25:46 -0500
Received: from [50.78.21.49] (carlson [50.78.21.49])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id 01EIPiHx013576
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Fri, 14 Feb 2020 13:25:44 -0500
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com 01EIPiHx013576
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1581704744;
        bh=qSPoHhbkYmYFbQl69ZUmytw0muKp34xwDIJ7kX+WUEU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=euepGCpq9DTDzd7+5fI6BPxoxO0dhIxW9m998iOnUgZ2zOj6RQmcAoPA6PoyUsOSk
         4qe/OWiNiftoTicY6IY4yrV0Wwaq51soQ+oWIRjzYuwfWd4L7pILhYhho6djdj/D3s
         O5fPMYfeqZk9RK8zmUlD4rEpDC7IdNLYhMI6arlI=
Subject: Re: Porting source to OSX
To:     igal avraham <igal38@gmail.com>
Cc:     linux-ppp@vger.kernel.org
References: <e49785c8-43cd-7186-2e51-4949ec9a57dc@workingcode.com>
 <836660BD-A8FA-4750-87A0-FEF72B8DF5DF@gmail.com>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <21ea0c4d-c895-65a8-7d00-ef19ec1c824e@workingcode.com>
Date:   Fri, 14 Feb 2020 13:25:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <836660BD-A8FA-4750-87A0-FEF72B8DF5DF@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-DCC-uptempo.net-Metrics: carlson 1093; Body=2 Fuz1=2 Fuz2=2
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 2/14/20 11:58 AM, igal avraham wrote:
> Thanks for the fast reply.
> 
> Are there any guidelines for porting if I want to do it by myself ?

If Apple shipped their driver header files, you *might* be able to get
away with compiling just the user-space code alone, substituting in
those headers.  A quick check of a Mac system I have shows that the
header files for PPP are missing.  I don't know how you'd go about
getting them.  Maybe you'd get lucky and their kernel modules don't
differ significantly from those used on other OSes.  It's perhaps worth
a try.  It'll take some hacking of the 'configure' script to make it happen.

Assuming that fails ...

The starting point for a complete port is the kernel module, which must
be able to attach to a serial driver (so that we can send/receive frames
using AHDLC or HDLC) and to the network stack (so that we can behave as
a data link layer protocol in the system).

How this is done varies dramatically based on system design, kernel
facilities, and resource management issues.  Feel free to look through
the 'modules' subdirectory in the pppd distribution for an example of
how it's done on a STREAMS-based system, and the Linux sources for an
example of that kernel:

https://github.com/torvalds/linux/blob/master/drivers/net/ppp/ppp_generic.c

Perhaps closer to what you want is the FreeBSD port, given that I think
Darwin is a derivative of the original BSD4.4, but that one is even
further afield of the original pppd sources.  They've forked the sources
and maintain them as part of the FreeBSD tree.  (I think similar things
are true for the other *BSD variants.)

https://github.com/freebsd/freebsd/tree/master/usr.sbin/ppp

I don't know how much of Darwin's kernel is publicly documented.  I know
they released some stuff openly for a while and then gave up on the
whole "open source" thing.  You might be able to get some pointers
through one of the projects that derived from that:

http://www.puredarwin.org/

And, if successful, you'd also need to figure out how to put a
cryptographic signature on your module so you can load it in the kernel.
 Much luck with that part; all I know is that it's non-trivial.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
