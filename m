Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55ACBBFDD9
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Sep 2019 06:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfI0EIe (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 27 Sep 2019 00:08:34 -0400
Received: from relay-b03.edpnet.be ([212.71.1.220]:36922 "EHLO
        relay-b03.edpnet.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfI0EIe (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 27 Sep 2019 00:08:34 -0400
X-ASG-Debug-ID: 1569557311-0a88186e204127a90001-vz1ewb
Received: from zotac.vandijck-laurijssen.be (77.109.114.181.adsl.dyn.edpnet.net [77.109.114.181]) by relay-b03.edpnet.be with ESMTP id F9BWgV636oijj5HT; Fri, 27 Sep 2019 06:08:31 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.114.181.adsl.dyn.edpnet.net[77.109.114.181]
X-Barracuda-Apparent-Source-IP: 77.109.114.181
Received: from x1.vandijck-laurijssen.be (x1.vandijck-laurijssen.be [IPv6:fd01::1a1d:eaff:fe02:d339])
        by zotac.vandijck-laurijssen.be (Postfix) with ESMTPSA id B8779A08A5E;
        Fri, 27 Sep 2019 06:08:30 +0200 (CEST)
Date:   Fri, 27 Sep 2019 06:08:29 +0200
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To:     Paul Mackerras <paulus@ozlabs.org>
Cc:     linux-ppp@vger.kernel.org
Subject: Re: [PATCH 1/9] magic: remove K&R style of arguments
Message-ID: <20190927040829.GA8592@x1.vandijck-laurijssen.be>
X-ASG-Orig-Subj: Re: [PATCH 1/9] magic: remove K&R style of arguments
Mail-Followup-To: Paul Mackerras <paulus@ozlabs.org>,
        linux-ppp@vger.kernel.org
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <1569482466-9551-2-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20190927013611.GA28486@blackberry>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190927013611.GA28486@blackberry>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Barracuda-Connect: 77.109.114.181.adsl.dyn.edpnet.net[77.109.114.181]
X-Barracuda-Start-Time: 1569557311
X-Barracuda-URL: https://212.71.1.220:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 517
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: SPAM GLOBAL 0.9997 1.0000 4.3400
X-Barracuda-Spam-Score: 4.34
X-Barracuda-Spam-Status: No, SCORE=4.34 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.76872
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On vr, 27 sep 2019 11:36:11 +1000, Paul Mackerras wrote:
> On Thu, Sep 26, 2019 at 09:20:58AM +0200, Kurt Van Dijck wrote:
> > The __P() macro does not exist in libmusl e.g.
> > I swicthed magic.{c,h} to using the std-c argument style, which had
> > already been used in some functions.
> 
> Right.  I was thinking of doing this across the whole tree in fact.

-Wmissing-parameter-type will get you through the job :-)
Until then, this patch in magic.{h,c} helps me getting things done using
musl.

Kurt
