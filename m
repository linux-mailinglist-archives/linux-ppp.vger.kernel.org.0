Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB251E6322
	for <lists+linux-ppp@lfdr.de>; Thu, 28 May 2020 15:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390664AbgE1N7Y (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 28 May 2020 09:59:24 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:44518 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390800AbgE1N7X (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 28 May 2020 09:59:23 -0400
Received: from [50.78.21.49] (carlson [50.78.21.49])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id 04SDxDYm011474
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Thu, 28 May 2020 09:59:13 -0400
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com 04SDxDYm011474
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1590674359;
        bh=soMKEYdxHItecmquVU8hsrEWFRXiozuEb9RmMwfloXc=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=VQ5n8hohrR/wwDCl7tBI1UKSMpOAishMDrw/HPyAH0c9sXk42RX+7B7xHx5wQrQAk
         EReAHqXRhiYZxTKNiF5v3dGNW29DTtPspSVbgBpMet2NA9v+h12waqGqDN5cZHnIRP
         FIXNuH1XkxaJvtXMki88xF7tdp2Q78GiJ2XcDEwk=
Subject: Re: PPP cycling between UP and DOWN
To:     Patrick Mahan <mahan@mahan.org>, linux-ppp@vger.kernel.org
References: <f44e7e14-1621-7141-66a3-3a2218e8db86@mahan.org>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <84d4375a-a446-6a15-9388-db312b77e50a@workingcode.com>
Date:   Thu, 28 May 2020 09:59:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f44e7e14-1621-7141-66a3-3a2218e8db86@mahan.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-DCC-sonic-Metrics: carlson 1254; Body=2 Fuz1=2 Fuz2=2
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 2020-05-27 15:16, Patrick Mahan wrote:
> I have a script that monitors by this by having a modified ip-up and
> ip-down script write a value to a specific file under /var/run/pppd/ and
> if it is ip-down, then I schedule a restart of pppd to occur once the
> pppd image exits.  I have assumed that ip-down being triggered is and
> indication that PPPoE connection is down and over.

That's the most likely case.  It would help to have _complete_ debug
logs showing what's happening.

(For what it's worth, another person posting to this list recently was
having PPPoE problems that ended up tracking back to a bad Ethernet
driver.  The driver allowed receive of unicast packets with someone
else's address, and the PPPoE kernel code accepted a stray PADT that
caused the link to go down.)  (PPPoE, as a protocol, is pretty nasty stuff.)

> But I am now seeing that this assumption could be incorrect.  I don't
> claim to understand the entire protocol layers involved.  But is it
> supported that a PPPoE connection can shift back from the IPCP layer to
> the LCP layer?  Then back?

IPCP can certainly be taken down without taking down LCP.  And LCP can
be renegotiated (implicitly taking down IPCP as well) at any time.
However, I've yet to find a commercial service provider that actually
supports anything like this.  All of the systems they use are much more
limited implementations.

It sounds like a stretch to me.  A debug log would show for sure, though.

> Or is this a ppp protocol issue.  I see in the pppd code that we can
> moved to a down state if we get a request to restart negotiations, so I
> can see that my assumption may be incorrect.

It can, as described above, but it's not something that's commonly (or
"ever") implemented, at least in my experience.  Renegotiation almost
always leads to complete teardown.  (Depending on the vendor, some will
start doing LCP Protocol-Reject on the NCP protocols like IPCP if you
attempt that.)

This doesn't sound likely to me.  But, again, debug logs are your friend
here.

Use the pppd 'debug' option.  By itself, that'll write the log
information to syslog daemon.debug (be sure to redirect that to a file).
 Or use the "logfile /path/to/file" option to write the messages to a
file.  Then post those logs.

It's important to understand that PPP is just one protocol layer.  PPPoE
itself is distinct, with its own messages and states.  The actions of
PPPoE are seen by PPP as just underlying link up/down states -- very
much like the signals PPP would get from a modem.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
