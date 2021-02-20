Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A498320267
	for <lists+linux-ppp@lfdr.de>; Sat, 20 Feb 2021 02:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbhBTBNo (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 19 Feb 2021 20:13:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbhBTBNo (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 19 Feb 2021 20:13:44 -0500
Received: from haggis.mythic-beasts.com (haggis.mythic-beasts.com [IPv6:2a00:1098:0:86:1000:0:2:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5614C061574
        for <linux-ppp@vger.kernel.org>; Fri, 19 Feb 2021 17:13:03 -0800 (PST)
Received: from [2001:8b0:ffd5:3:3930:1cd4:f9ab:1d8e] (port=54953)
        by haggis.mythic-beasts.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <njh@aelius.com>)
        id 1lDGpS-0000bv-JX
        for linux-ppp@vger.kernel.org; Sat, 20 Feb 2021 01:13:02 +0000
From:   Nicholas Humfrey <njh@aelius.com>
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from
 remote peer
To:     linux-ppp <linux-ppp@vger.kernel.org>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
 <907df17c-450a-8db6-1dc1-dd3731019279@workingcode.com>
 <e04667f8e2ff35927fca7e6280c0817a0caccebb.camel@dolka.fr>
 <dbd27511-117f-6cf7-0d38-eb715faed9c5@aelius.com>
 <072169f215e68427ba9b65caac3c3effef3b971c.camel@dolka.fr>
Message-ID: <28d6f815-4e98-a4c4-ec53-55803669d7a7@aelius.com>
Date:   Sat, 20 Feb 2021 01:13:02 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <072169f215e68427ba9b65caac3c3effef3b971c.camel@dolka.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-BlackCat-Spam-Score: 0
X-Spam-Status: No, score=-0.1
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org


>> Looking at the git master branch, it looks like Pali Rohár is actively
>> working in this space:
>>
>> https://github.com/paulusmack/ppp/commits/master
> Well, I'll give a look to find what's wrong.


Just a quick follow up to say that it is all working fine after I 
upgraded to version 2.4.9 of pppd.

I had initially been using version 2.4.7, that came with Raspberry Pi OS 
(buster).
I had also been testing using git master of the ppp repo on the 'client'.

But I hadn't tried upgrading the 'server' (the peer configured with the 
interface identifiers).
After upgrading to 2.4.9 on the 'server' it works perfectly - even with 
an older version of pppd on the 'client'.
I haven't tracked down the commit that fixed it but I guess it was 
something to do with failing to Nack the random interface identifier 
sent by the peer.

Thank you for your help and thoughts on the issue.


nick.


|pppd file ./ppp-options ipv6cp-accept-local /dev/ttyAMA0 115200 using 
channel 368 Using interface ppp0 Connect: ppp0 <--> /dev/ttyAMA0 sent 
[LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x7f793cbe>] rcvd [LCP ConfReq 
id=0xb <asyncmap 0x0> <magic 0xecde7250>] sent [LCP ConfAck id=0xb 
<asyncmap 0x0> <magic 0xecde7250>] rcvd [LCP ConfReq id=0xb <asyncmap 
0x0> <magic 0xecde7250>] sent [LCP ConfAck id=0xb <asyncmap 0x0> <magic 
0xecde7250>] rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x7f793cbe>] 
sent [LCP EchoReq id=0x0 magic=0x7f793cbe] sent [IPV6CP ConfReq id=0x1 
<addr fe80::0dfd:3c3b:e130:91ce>] rcvd [LCP EchoReq id=0x0 
magic=0xecde7250] sent [LCP EchoRep id=0x0 magic=0x7f793cbe] rcvd [LCP 
EchoRep id=0x0 magic=0xecde7250] rcvd [IPV6CP ConfReq id=0xb <addr 
fe80::0000:0000:0000:0001>] sent [IPV6CP ConfAck id=0xb <addr 
fe80::0000:0000:0000:0001>] rcvd [IPV6CP ConfNak id=0x1 <addr 
fe80::0000:0000:0000:0002>] sent [IPV6CP ConfReq id=0x2 <addr 
fe80::0000:0000:0000:0002>] rcvd [IPV6CP ConfAck id=0x2 <addr 
fe80::0000:0000:0000:0002>] local LL address fe80::0000:0000:0000:0002 
remote LL address fe80::0000:0000:0000:0001 Script /etc/ppp/ipv6-up 
started (pid 7049) Script /etc/ppp/ipv6-up finished (pid 7049), status = 
0x0 |


