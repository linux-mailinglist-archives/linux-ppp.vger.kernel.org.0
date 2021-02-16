Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D6331C4A3
	for <lists+linux-ppp@lfdr.de>; Tue, 16 Feb 2021 01:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhBPAhO (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 15 Feb 2021 19:37:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhBPAhO (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 15 Feb 2021 19:37:14 -0500
X-Greylist: delayed 1516 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 15 Feb 2021 16:36:33 PST
Received: from balrog.mythic-beasts.com (balrog.mythic-beasts.com [IPv6:2a00:1098:0:82:1000:0:2:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1BC8C061756
        for <linux-ppp@vger.kernel.org>; Mon, 15 Feb 2021 16:36:33 -0800 (PST)
Received: from [2001:8b0:ffd5:3:4d3b:4ac1:ae3b:5c24] (port=64758)
        by balrog.mythic-beasts.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <njh@aelius.com>)
        id 1lBnxO-0000z8-Ax; Tue, 16 Feb 2021 00:11:14 +0000
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from
 remote peer
To:     James Carlson <carlsonj@workingcode.com>, linux-ppp@vger.kernel.org
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
 <907df17c-450a-8db6-1dc1-dd3731019279@workingcode.com>
From:   Nicholas Humfrey <njh@aelius.com>
Message-ID: <c0eb49d2-c33e-1ffc-db2d-1dd2e5e0a1ff@aelius.com>
Date:   Tue, 16 Feb 2021 00:10:54 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <907df17c-450a-8db6-1dc1-dd3731019279@workingcode.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-BlackCat-Spam-Score: 0
X-Spam-Status: No, score=-0.1
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org


On 14/02/2021 16:23, James Carlson wrote:
> On 2021-02-13 20:03, Nicholas Humfrey wrote:
>> Hi,
>>
>> I originally asked this question on the "Unix and Linux" StackExchange:
>> https://unix.stackexchange.com/questions/634033/configuring-pppd-to-accept-link-local-ipv6-address-from-remote-peer
> Do you have a debug trace?  I don't see one in that posting or here, so
> it's hard to know exactly what we're commenting on.

Debug trace is in a Gist, linked to in the StackExchange question. I 
have just updated the Gist to include both the 'client', 'server' and 
the pppd options file:

https://gist.github.com/njh/ab3282f43c72dcf6932b3693eb7dfca4


>> I have two pppd (v2.4.7) instances running, talking to each over over a
>> serial port link. But I can't work out how to get the 'client' pppd to
>> accept the link-local IPv6 interface identifier provided by the 'server'
>> pppd. I am trying to use static addresses so I know the link-local IP
>> address of the remote peer.
> Perhaps a silly question, but why?  Link locals are used only for the
> IPv6 router discovery, neighbor discovery, and routing protocol
> communication.  Why would anyone care what numbers are assigned as long
> as the two ends are distinct?

A very reasonable question! I am partly doing this as a learning 
exercise. But I think it is also useful for debugging and diagnostics. 
If they can be any two unique identifiers (to that link), it seems 
useful to be able to make them more easily human readable.

The PPP protocol describes a number of different ways to assign 
interface identifiers and pppd supports a number of them. Why does the 
functionality exist (even if a bit broken)?


>> The pppd man page says:
>>    ipv6cp-accept-local
>>      With this option, pppd will accept the peer's idea of our local IPv6
>> interface
>>      identifier, even if the local IPv6 interface identifier was
>> specified in an option.
> This means that we'll accept the peer's IPV6CP Configure-Nak message
> suggesting a different address rather than sticking to our guns.  It
> doesn't mean we won't start out with a legitimate identifier.

So I guess it is only useable when using a PPP implementation other than 
Linux pppd?

As there is no way to configure the 'server' to Nack the clients chosen 
identifier?


>> I have now managed to get it working by hacking ipv6cp.c to keep the
>> local identifier as all-zero, by disabling a couple of calls to
>> eui64_magic_nz. But I am not sure what the proper solution is.
>>
>> Does there need to be an IPv6 equivalent to 'noipdefault' to use in
>> conjunction with 'ipv6cp-accept-local'?
> Yes, I agree there could probably be an option ("noipv6default",
> perhaps) to do this, if only for testing reasons.  But given the lack of
> a compelling application for it, it's hard to see why.

I like the idea of it being explicit - and not change the 
existing/expected behaviour of the existing 'ipv6' option.


nick.


