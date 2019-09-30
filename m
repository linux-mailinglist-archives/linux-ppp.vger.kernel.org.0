Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7DBCC20D4
	for <lists+linux-ppp@lfdr.de>; Mon, 30 Sep 2019 14:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729649AbfI3MrX (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 30 Sep 2019 08:47:23 -0400
Received: from relay-b03.edpnet.be ([212.71.1.220]:46405 "EHLO
        relay-b03.edpnet.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728214AbfI3MrX (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 30 Sep 2019 08:47:23 -0400
X-ASG-Debug-ID: 1569847640-0a88186e22432a2a0001-vz1ewb
Received: from zotac.vandijck-laurijssen.be (77.109.119.18.adsl.dyn.edpnet.net [77.109.119.18]) by relay-b03.edpnet.be with ESMTP id zho5yPknkGD26ni2; Mon, 30 Sep 2019 14:47:20 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.119.18.adsl.dyn.edpnet.net[77.109.119.18]
X-Barracuda-Apparent-Source-IP: 77.109.119.18
Received: from x1.vandijck-laurijssen.be (74.250-240-81.adsl-static.isp.belgacom.be [81.240.250.74])
        by zotac.vandijck-laurijssen.be (Postfix) with ESMTPSA id D4F87A18D67;
        Mon, 30 Sep 2019 14:47:19 +0200 (CEST)
Date:   Mon, 30 Sep 2019 14:47:18 +0200
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To:     Paul Mackerras <paulus@ozlabs.org>
Cc:     linux-ppp@vger.kernel.org
Subject: Re: [RFC] patch series to compile pppd with musl toolchain
Message-ID: <20190930124718.GC27078@x1.vandijck-laurijssen.be>
X-ASG-Orig-Subj: Re: [RFC] patch series to compile pppd with musl toolchain
Mail-Followup-To: Paul Mackerras <paulus@ozlabs.org>,
        linux-ppp@vger.kernel.org
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20190930105639.GA9567@blackberry>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190930105639.GA9567@blackberry>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Barracuda-Connect: 77.109.119.18.adsl.dyn.edpnet.net[77.109.119.18]
X-Barracuda-Start-Time: 1569847640
X-Barracuda-URL: https://212.71.1.220:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 766
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.5014 1.0000 0.7500
X-Barracuda-Spam-Score: 0.75
X-Barracuda-Spam-Status: No, SCORE=0.75 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.76963
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On ma, 30 sep 2019 20:56:39 +1000, Paul Mackerras wrote:
> On Thu, Sep 26, 2019 at 09:20:57AM +0200, Kurt Van Dijck wrote:
> > Hello,
> > 
> > I'd like to add this series of 9 patches to pppd.
> > The goal is to use pppd on an embedded system with musl instead of glibc.
> > 
> > Kind regards,
> > Kurt
> 
> The series looks pretty good to me.  I would like a little more
> explanation in the commit messages for patches 3 and 7, though, as to
> why we want to make the change being made.  If you can give me a
> couple of sentences for each of those two patches I will put them in
> and apply the series.

I sent updates for both mentioned patches, with comments.
I didn't add the v2 to my patch 7/9 update, sorry for that.

Kind regards,
Kurt
