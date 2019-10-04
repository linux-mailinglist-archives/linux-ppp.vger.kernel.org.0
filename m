Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE99CC2B8
	for <lists+linux-ppp@lfdr.de>; Fri,  4 Oct 2019 20:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728666AbfJDSd2 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 4 Oct 2019 14:33:28 -0400
Received: from relay-b02.edpnet.be ([212.71.1.222]:40535 "EHLO
        relay-b02.edpnet.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfJDSd2 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 4 Oct 2019 14:33:28 -0400
X-ASG-Debug-ID: 1570214005-0a7b8d53c110f7850001-vz1ewb
Received: from zotac.vandijck-laurijssen.be (77.109.104.71.adsl.dyn.edpnet.net [77.109.104.71]) by relay-b02.edpnet.be with ESMTP id X9YuLzpilfHEVBm5; Fri, 04 Oct 2019 20:33:25 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.104.71.adsl.dyn.edpnet.net[77.109.104.71]
X-Barracuda-Apparent-Source-IP: 77.109.104.71
Received: from x1.vandijck-laurijssen.be (x1.vandijck-laurijssen.be [IPv6:fd01::1a1d:eaff:fe02:d339])
        by zotac.vandijck-laurijssen.be (Postfix) with ESMTPSA id A8229A30BC1;
        Fri,  4 Oct 2019 20:33:24 +0200 (CEST)
Date:   Fri, 4 Oct 2019 20:33:23 +0200
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To:     James Carlson <carlsonj@workingcode.com>
Cc:     Levente <leventelist@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>, linux-ppp@vger.kernel.org
Subject: Re: [PATCH] time.h: include header before using time_t
Message-ID: <20191004183323.GB868@x1.vandijck-laurijssen.be>
X-ASG-Orig-Subj: Re: [PATCH] time.h: include header before using time_t
Mail-Followup-To: James Carlson <carlsonj@workingcode.com>,
        Levente <leventelist@gmail.com>, Paul Mackerras <paulus@ozlabs.org>,
        linux-ppp@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d5c7a914-6e48-e4a7-3d6b-11807872ea5b@workingcode.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Barracuda-Connect: 77.109.104.71.adsl.dyn.edpnet.net[77.109.104.71]
X-Barracuda-Start-Time: 1570214005
X-Barracuda-URL: https://212.71.1.222:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 1015
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.5684 1.0000 0.7500
X-Barracuda-Spam-Score: 0.75
X-Barracuda-Spam-Status: No, SCORE=0.75 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.77103
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On vr, 04 okt 2019 13:52:11 -0400, James Carlson wrote:
> On 10/04/19 13:40, Kurt Van Dijck wrote:
> > I think you confirm 4x what I said, but I probably expressed myself
> > badly, so "show me code!", I created this patch.
> > It (1) works for me and (2) does not mix userspace headers in kernel
> > space anywhere.
> > Would this work for you?
> 
> That seems ok, in as much as it compiles on Solaris.  But I'm still a
> little confused about your apparent opposition to <sys/time.h> at the
> point where time_t is actually used.
> 
> <sys/time.h> is part of the UNIX standards.  It's documented to define
> time_t (among other things).  It's on-point for a header file that may
> be used in kernel context.  What's the concern?

headers under sys/ are, AFAIK, not delivered by the kernel, but by the
toolchain. sys/time.h may have less issues than time.h, it has the same
disease.

But maybe I'm incompetent on the matter, my knowledge besides linux on
this matter is very limited.

Kurt
