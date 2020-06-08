Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B611F21F3
	for <lists+linux-ppp@lfdr.de>; Tue,  9 Jun 2020 00:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgFHWvF (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 8 Jun 2020 18:51:05 -0400
Received: from 23-24-207-145-static.hfc.comcastbusiness.net ([23.24.207.145]:49961
        "EHLO ns.mahan.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgFHWvE (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 8 Jun 2020 18:51:04 -0400
Received: from Cone-of-Silence.local (crowTrobot [23.24.207.146])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ns.mahan.org (Postfix) with ESMTPSA id 048CEA2DF92;
        Mon,  8 Jun 2020 15:51:03 -0700 (PDT)
Subject: Re: PPP cycling between UP and DOWN
To:     James Carlson <carlsonj@workingcode.com>, linux-ppp@vger.kernel.org
References: <f44e7e14-1621-7141-66a3-3a2218e8db86@mahan.org>
 <84d4375a-a446-6a15-9388-db312b77e50a@workingcode.com>
 <8d6fcc7e-c727-7979-13ca-a3e80d9eb514@mahan.org>
 <c3e9fab3-116c-ee26-cfa7-7fb7c76c7c4c@workingcode.com>
From:   Patrick Mahan <mahan@mahan.org>
Message-ID: <ed577071-6aad-6cc0-02b8-be0b3feb1222@mahan.org>
Date:   Mon, 8 Jun 2020 15:51:02 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <c3e9fab3-116c-ee26-cfa7-7fb7c76c7c4c@workingcode.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 6/8/20 10:15 AM, James Carlson wrote:
> On 2020-06-08 13:04, Patrick Mahan wrote:
>> On 5/28/20 6:59 AM, James Carlson wrote:
>>> That's the most likely case.  It would help to have _complete_ debug
>>> logs showing what's happening.
> [...]
>>> It sounds like a stretch to me.  A debug log would show for sure, though.
> [...]
>>> This doesn't sound likely to me.  But, again, debug logs are your friend
>>> here.
>>>
>>> Use the pppd 'debug' option.  By itself, that'll write the log
>>> information to syslog daemon.debug (be sure to redirect that to a file).
>>>    Or use the "logfile /path/to/file" option to write the messages to a
>>> file.  Then post those logs.
> [...]
>> I finally obtained the PPPoE logs from my customer.  I have redacted the
>> IP addresses.  This is where I think we get the UP-->DOWN-->UP that is
>> causing my issue.  Oddly, the customer has not experienced another event
>> of this nature since then.
>>
>> Here is the log with my annotations:
>>
>> Executing pppd w/plugin(/etc/ppp/plugins/rp-pppoe.so): '/usr/sbin/pppd
>> plugin /etc/ppp/plugins/rp-pppoe.so nic-wan0  unit 0 noipdefault noauth
>> default-asyncmap defaultroute hide-password nodetach  mtu 1492 mru 1492
>> noaccomp nodeflate nopcomp novj novjccomp user w29ddnjt@bizf.ocn.ne.jp
>> lcp-echo-interval 20 lcp-echo-failure 3 '
> 
> The one option that's not included in the list above is "debug".

Yes, I had requested that the debug option be added, but since we added it, there 
has not been another incident.

> 
>> local  IP address XX.XX.XX.XX
>> remote IP address YY.YY.YY.YY
>>
>> NOTE: This is where the first ip-up callout was triggered.
> 
> This looks like normal start-up.
> 
>> Connect time 0.1 minutes.
>> Sent 0 bytes, received 10 bytes.
>>
>> NOTE: This is where I think the ip-down callout was triggered.
> 
> This looks like it could be a normal tear-down of some sort.  Without
> debug information, we're not going to be able to say a whole lot more
> about this.  (Crucially, a debug log would likely show which side
> initiated the tear-down.)
> 

Understood.  And if we ever get this problem to occur again, I should have those 
logs.

>> sifdefaultroute(unit=0, ouraddr=XX.XX.XX.XX, gateway=YY.YY.YY.YY)
>> local  IP address XX.XX.XX.XX
>> remote IP address YY.YY.YY.YY
>>
>> NOTE: This is where I think the second ip-up callout was triggered.
>>
>> Modem hangup
>> Connect time 1629.1 minutes.
>> Sent 572 bytes, received 452067 bytes.
>> Connection terminated.
>> PPPoE shutdown on interface 'ppp0', exit status is '16'
> 
> "Modem hangup" means that PPPoE, not PPP, shut down this link.  It would
> be a completely wild guess -- I know the pppd code fairly well, but I
> don't know the separate rp-pppoe code too well at all -- but it's
> possible that this user was bit by the same stray PADT problem that
> someone reported earlier on this list.  Or maybe not.
> 
> Assuming that "Modem hangup" is the problem we're worried about here
> (I'm not 100% sure at this point), the next thing to do would be to
> debug the PPPoE stuff.  The Roaring Penguin guys would probably know
> more about that, but, personally, my first action would be to use
> something like wireshark to capture the traffic on the Ethernet itself,
> and use that to find out what happens to shut down the link.
> 

Sorry, no the "Modem hangup" here is expected.  Out tech support generally has a 
list of "try this" for these issues.  One of them was to IFDOWN the physical 
interface, wait 10s then IFUP.  We correctly caught the modem down and restarted.

No the issue I need to deal with is the UP-->DOWN-->UP cycle.  I am currently 
modifying the code to handle this issue a little more leniently, but I haven't 
figured out a way to validate my changes short of modifying the pppd to inject a 
rogue PADT packet.

Thanks,

Patrick

