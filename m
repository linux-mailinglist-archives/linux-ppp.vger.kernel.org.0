Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F85F1E68E4
	for <lists+linux-ppp@lfdr.de>; Thu, 28 May 2020 19:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405636AbgE1RyS (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 28 May 2020 13:54:18 -0400
Received: from 23-24-207-145-static.hfc.comcastbusiness.net ([23.24.207.145]:16853
        "EHLO ns.mahan.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405666AbgE1RyN (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 28 May 2020 13:54:13 -0400
Received: from Cone-of-Silence.local (c-73-170-159-167.hsd1.ca.comcast.net [73.170.159.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ns.mahan.org (Postfix) with ESMTPSA id B3B99A2DF96;
        Thu, 28 May 2020 10:54:10 -0700 (PDT)
Subject: Re: PPP cycling between UP and DOWN
To:     James Carlson <carlsonj@workingcode.com>, linux-ppp@vger.kernel.org
References: <f44e7e14-1621-7141-66a3-3a2218e8db86@mahan.org>
 <84d4375a-a446-6a15-9388-db312b77e50a@workingcode.com>
From:   Patrick Mahan <mahan@mahan.org>
Message-ID: <4180d56f-b951-71a1-4a64-5360f4bea31a@mahan.org>
Date:   Thu, 28 May 2020 10:54:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <84d4375a-a446-6a15-9388-db312b77e50a@workingcode.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 5/28/20 6:59 AM, James Carlson wrote:
> On 2020-05-27 15:16, Patrick Mahan wrote:
>> I have a script that monitors by this by having a modified ip-up and
>> ip-down script write a value to a specific file under /var/run/pppd/ and
>> if it is ip-down, then I schedule a restart of pppd to occur once the
>> pppd image exits.  I have assumed that ip-down being triggered is and
>> indication that PPPoE connection is down and over.
> 
> That's the most likely case.  It would help to have _complete_ debug
> logs showing what's happening.

I'm working on that, but I probably won't have them until tomorrow.

> 
> (For what it's worth, another person posting to this list recently was
> having PPPoE problems that ended up tracking back to a bad Ethernet
> driver.  The driver allowed receive of unicast packets with someone
> else's address, and the PPPoE kernel code accepted a stray PADT that
> caused the link to go down.)  (PPPoE, as a protocol, is pretty nasty stuff.)
> 

I am dis-inclined to lean in that direction.  These are standard Intel igb 
devices.  In over 5 years I have yet to have one issue tracked back directly to 
the ethernet driver.

>> But I am now seeing that this assumption could be incorrect.  I don't
>> claim to understand the entire protocol layers involved.  But is it
>> supported that a PPPoE connection can shift back from the IPCP layer to
>> the LCP layer?  Then back?
> 
> IPCP can certainly be taken down without taking down LCP.  And LCP can
> be renegotiated (implicitly taking down IPCP as well) at any time.
> However, I've yet to find a commercial service provider that actually
> supports anything like this.  All of the systems they use are much more
> limited implementations.
> 
> It sounds like a stretch to me.  A debug log would show for sure, though.
> 

Yes, it seems like a stretch to me as well.  This code has been operating for 
almost 5 years with very little change.  This is the first case and it has only 
happened once.

>> Or is this a ppp protocol issue.  I see in the pppd code that we can
>> moved to a down state if we get a request to restart negotiations, so I
>> can see that my assumption may be incorrect.
> 
> It can, as described above, but it's not something that's commonly (or
> "ever") implemented, at least in my experience.  Renegotiation almost
> always leads to complete teardown.  (Depending on the vendor, some will
> start doing LCP Protocol-Reject on the NCP protocols like IPCP if you
> attempt that.)
> 
> This doesn't sound likely to me.  But, again, debug logs are your friend
> here.
> 
> Use the pppd 'debug' option.  By itself, that'll write the log
> information to syslog daemon.debug (be sure to redirect that to a file).
>   Or use the "logfile /path/to/file" option to write the messages to a
> file.  Then post those logs.
> 
> It's important to understand that PPP is just one protocol layer.  PPPoE
> itself is distinct, with its own messages and states.  The actions of
> PPPoE are seen by PPP as just underlying link up/down states -- very
> much like the signals PPP would get from a modem.
> 

I am using rp-pppoe so I will look at their code to see if there might be an 
possible issue.

I am currently hoping this is an one off issue that won't return soon and I can, 
hopefully, wait until we are upgrade to a newer kernel and code.

Thanks,

Patrick
