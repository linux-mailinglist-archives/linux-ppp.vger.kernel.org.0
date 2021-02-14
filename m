Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A46B31AE97
	for <lists+linux-ppp@lfdr.de>; Sun, 14 Feb 2021 02:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbhBNBEN (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sat, 13 Feb 2021 20:04:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbhBNBEM (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sat, 13 Feb 2021 20:04:12 -0500
Received: from haggis.mythic-beasts.com (haggis.mythic-beasts.com [IPv6:2a00:1098:0:86:1000:0:2:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5670C061574
        for <linux-ppp@vger.kernel.org>; Sat, 13 Feb 2021 17:03:31 -0800 (PST)
Received: from [2001:8b0:ffd5:3:5819:fd27:3c1:af9f] (port=51847)
        by haggis.mythic-beasts.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <njh@aelius.com>)
        id 1lB5ow-0004w4-GU
        for linux-ppp@vger.kernel.org; Sun, 14 Feb 2021 01:03:30 +0000
From:   Nicholas Humfrey <njh@aelius.com>
Subject: Configuring pppd to accept link-local IPv6 interface id from remote
 peer
To:     linux-ppp@vger.kernel.org
Message-ID: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
Date:   Sun, 14 Feb 2021 01:03:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-BlackCat-Spam-Score: 0
X-Spam-Status: No, score=-0.1
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hi,

I originally asked this question on the "Unix and Linux" StackExchange:
https://unix.stackexchange.com/questions/634033/configuring-pppd-to-accept-link-local-ipv6-address-from-remote-peer

But i suspect it is a bit too niche and have not had a response there.


I have two pppd (v2.4.7) instances running, talking to each over over a 
serial port link. But I can't work out how to get the 'client' pppd to 
accept the link-local IPv6 interface identifier provided by the 'server' 
pppd. I am trying to use static addresses so I know the link-local IP 
address of the remote peer.

On the 'server' I am running:
   pppd file ./ppp-options ipv6 ::1,::2 /dev/ttyAMA0 115200

And on the 'client', I am running:
   pppd file ./ppp-options ipv6cp-accept-local /dev/ttyAMA0 115200

This is the contents of ppp-options on both:
   nodetach
   noauth
   persist
   local
   noip
   +ipv6

The pppd man page says:
   ipv6cp-accept-local
     With this option, pppd will accept the peer's idea of our local 
IPv6 interface
     identifier, even if the local IPv6 interface identifier was 
specified in an option.

But that doesn't seem to be the behaviour I am experiencing.

The client always just uses a locally chosen interface identifier 
instead. It was suggested to me to try setting the 'client' local 
interface identifier to all-zero but I have not found a way of doing 
this through configuration. Or alternatively get the 'server' to Nack 
the clients choice of interface identifier - but I'm not sure how to 
achieve that with pppd.

I have now managed to get it working by hacking ipv6cp.c to keep the 
local identifier as all-zero, by disabling a couple of calls to 
eui64_magic_nz. But I am not sure what the proper solution is.

Does there need to be an IPv6 equivalent to 'noipdefault' to use in 
conjunction with 'ipv6cp-accept-local'?

Thanks,

nick.


