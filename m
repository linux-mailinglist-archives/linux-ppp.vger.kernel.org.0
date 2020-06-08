Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14EE1F1E31
	for <lists+linux-ppp@lfdr.de>; Mon,  8 Jun 2020 19:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730696AbgFHRPw (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 8 Jun 2020 13:15:52 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:36564 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730588AbgFHRPv (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 8 Jun 2020 13:15:51 -0400
Received: from [50.78.21.49] (carlson [50.78.21.49])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id 058HFmSZ001786
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Mon, 8 Jun 2020 13:15:48 -0400
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com 058HFmSZ001786
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1591636548;
        bh=bcs3O2cwWOnqzOS3fLrvUK6YKtRUBmU4UG/W/qyp+0A=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=TjHKeUk9ahOl5J49+SJ8rwFEauQFvaAehz+ALdBu/KxFvSr1R7Oaxy2BviP1HRGJc
         CsUKlGDsSgTT28yOjUtVKmZZ0iQBtz+zrvH2E43q/Zjv+zDKerZmg/JPHjpmy0Y5O4
         XonaV9pgSOmqCd6Hu9KzlBtnI445CuiHbmUtjxLk=
Subject: Re: PPP cycling between UP and DOWN
To:     Patrick Mahan <mahan@mahan.org>, linux-ppp@vger.kernel.org
References: <f44e7e14-1621-7141-66a3-3a2218e8db86@mahan.org>
 <84d4375a-a446-6a15-9388-db312b77e50a@workingcode.com>
 <8d6fcc7e-c727-7979-13ca-a3e80d9eb514@mahan.org>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <c3e9fab3-116c-ee26-cfa7-7fb7c76c7c4c@workingcode.com>
Date:   Mon, 8 Jun 2020 13:15:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8d6fcc7e-c727-7979-13ca-a3e80d9eb514@mahan.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-DCC-sonic-Metrics: carlson 1254; Body=2 Fuz1=2 Fuz2=2
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 2020-06-08 13:04, Patrick Mahan wrote:
> On 5/28/20 6:59 AM, James Carlson wrote:
>> That's the most likely case.  It would help to have _complete_ debug
>> logs showing what's happening.
[...]
>> It sounds like a stretch to me.  A debug log would show for sure, though.
[...]
>> This doesn't sound likely to me.  But, again, debug logs are your friend
>> here.
>>
>> Use the pppd 'debug' option.  By itself, that'll write the log
>> information to syslog daemon.debug (be sure to redirect that to a file).
>>   Or use the "logfile /path/to/file" option to write the messages to a
>> file.  Then post those logs.
[...]
> I finally obtained the PPPoE logs from my customer.  I have redacted the
> IP addresses.  This is where I think we get the UP-->DOWN-->UP that is
> causing my issue.  Oddly, the customer has not experienced another event
> of this nature since then.
> 
> Here is the log with my annotations:
> 
> Executing pppd w/plugin(/etc/ppp/plugins/rp-pppoe.so): '/usr/sbin/pppd
> plugin /etc/ppp/plugins/rp-pppoe.so nic-wan0  unit 0 noipdefault noauth
> default-asyncmap defaultroute hide-password nodetach  mtu 1492 mru 1492
> noaccomp nodeflate nopcomp novj novjccomp user w29ddnjt@bizf.ocn.ne.jp
> lcp-echo-interval 20 lcp-echo-failure 3 '

The one option that's not included in the list above is "debug".

> local  IP address XX.XX.XX.XX
> remote IP address YY.YY.YY.YY
> 
> NOTE: This is where the first ip-up callout was triggered.

This looks like normal start-up.

> Connect time 0.1 minutes.
> Sent 0 bytes, received 10 bytes.
> 
> NOTE: This is where I think the ip-down callout was triggered.

This looks like it could be a normal tear-down of some sort.  Without
debug information, we're not going to be able to say a whole lot more
about this.  (Crucially, a debug log would likely show which side
initiated the tear-down.)

> sifdefaultroute(unit=0, ouraddr=XX.XX.XX.XX, gateway=YY.YY.YY.YY)
> local  IP address XX.XX.XX.XX
> remote IP address YY.YY.YY.YY
> 
> NOTE: This is where I think the second ip-up callout was triggered.
> 
> Modem hangup
> Connect time 1629.1 minutes.
> Sent 572 bytes, received 452067 bytes.
> Connection terminated.
> PPPoE shutdown on interface 'ppp0', exit status is '16'

"Modem hangup" means that PPPoE, not PPP, shut down this link.  It would
be a completely wild guess -- I know the pppd code fairly well, but I
don't know the separate rp-pppoe code too well at all -- but it's
possible that this user was bit by the same stray PADT problem that
someone reported earlier on this list.  Or maybe not.

Assuming that "Modem hangup" is the problem we're worried about here
(I'm not 100% sure at this point), the next thing to do would be to
debug the PPPoE stuff.  The Roaring Penguin guys would probably know
more about that, but, personally, my first action would be to use
something like wireshark to capture the traffic on the Ethernet itself,
and use that to find out what happens to shut down the link.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
