Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66017533007
	for <lists+linux-ppp@lfdr.de>; Tue, 24 May 2022 20:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237495AbiEXSEu (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 24 May 2022 14:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238078AbiEXSEt (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Tue, 24 May 2022 14:04:49 -0400
Received: from carlson.workingcode.com (carlson.workingcode.com [50.78.21.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF905140A8
        for <linux-ppp@vger.kernel.org>; Tue, 24 May 2022 11:04:44 -0700 (PDT)
Received: from [192.168.254.162] (dhcp-162.workingcode.com [192.168.254.162])
        (authenticated bits=0)
        by carlson.workingcode.com (8.17.0.3/8.17.0.3/SUSE Linux 0.8) with ESMTPSA id 24OI4eJG022830
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Tue, 24 May 2022 14:04:41 -0400
DKIM-Filter: OpenDKIM Filter v2.11.0 carlson.workingcode.com 24OI4eJG022830
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1653415481;
        bh=orAUq7JkAaxDJkS+LIcA4GrQ5b6rV4tYk610eAPzIgw=;
        h=Date:Subject:To:References:From:In-Reply-To;
        b=a/GyGpPqbJ2LhYv7bHJW33x6D4U3SwPcnVWXp0yS/wjE0G7RPH2y6XEKRLWmQOIMF
         xsb1pAVEcdgqpLjGbJPUUD2MbvkuyrCXVZhUJ2wufWdUp5CF+hcULPjOKmXIJPnYr/
         u32YRKO78xo/GG8UA2guQCvfgpGf/xxMbmvnavZM=
Message-ID: <71966adb-7a30-76b1-a697-6f7dbbc56e39@workingcode.com>
Date:   Tue, 24 May 2022 14:04:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: How to configure Netplan for VPN on boot
Content-Language: en-US
To:     Andy Barratt <andy@barratt.scot>, linux-ppp@vger.kernel.org
References: <FF40E3EB-CB33-4021-965D-A46E82A367C9@barratt.scot>
From:   James Carlson <carlsonj@workingcode.com>
In-Reply-To: <FF40E3EB-CB33-4021-965D-A46E82A367C9@barratt.scot>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DCC--Metrics: carlson 1102; Body=2 Fuz1=2 Fuz2=2
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 5/24/22 5:28 AM, Andy Barratt wrote:
> Hello all,
> 
> Thanks for having me.  I’m afraid I’m still somewhat of a novice when it comes to the sysadmin/devops/networking world so please be patient with me if I don’t understand things right away :)
> 
> I’ve set up a wee web server at home running Ubuntu 20.04 and a number of docker controllers.  As I am using a 5G modem for internet, IP addresses and port forwarding can be a bit unpredictable so I’ve chosen to hook this server up to a VPN provider to gain a static IP address and open ports directly to the machine.
> 
> I’ve successfully managed to set up my peer and all is well.  The only trouble is that I have to manually run `sudo pon purevpn` on each boot.  Whilst I do have a UPS in place, I do want to know that the connection will correct itself if there ever is a need for the box to reboot :)

I've never used the Debian pon/poff stuff, and none of my Linux systems 
have it installed, but it looks pretty darned simple. That's just doing 
nothing more than "pppd call purevpn" under the covers. The "pon" script 
is simple enough that I'm not 100% sure why it exists.

To invoke at boot, I would expect it's sufficient to create your own 
start-up script that does the above (either via the old rc scripts or 
through a custom systemd service).

> 
> Now I’ve looked at the documentation by you good folk here: http://pptpclient.sourceforge.net/howto-ubuntu.phtml
> but I note that it was last updated 15 years ago (2007) and that it suggests I make some changes to my `/etc/network/interfaces` file.
> 
> The trouble lies here.  Ubuntu 20.04 does not, by default, have a `/etc/network/interfaces` file.  It would seem things have been migrated in this new version to something called NetPlan.

NetPlan looks anything but simple and I'm not completely sure that it 
supports the construction of PPP links. I suspect it does not.

https://askubuntu.com/questions/987982/how-do-i-use-netplan-to-configure-pppoe
https://askubuntu.com/questions/1060696/ubuntu-18-04-netplan-support-ppp-interface-with-specific-isp-provider

> P.S. I note that my first attempt to subscribe failed when I sent a command to confirm my email address.  I guessed (seemingly correctly) that converting to Plain Text emails would solve this problem (Rich Text of course being the default in most clients these days!).  It might be helpful if someone could update the mailing list software to advise future participants to do the same :)

"Rich Text" would be a strange and cumbersome thing for a widely 
distributed mailing list, I'd think.

> P.P.S. I’ve chosen to use `back ticks` to surround code snippets as this is what I’m used to in systems like markdown, but do let me know if there’re different conventions folk are used to in mailing lists like this.  Despite being born in the late 80s and grown up on dialup, I seem to have somehow missed out on the mailing list phase of the internet! :)

That's fine; it's obvious what was meant. See, if it were Rich Text, I'd 
probably be staring at little square boxes instead of quote marks, as 
whatever weird "smart quoting" was used in the original message wouldn't 
match the client I have. :->

-- 
James Carlson     42.703N 71.076W FN42lq08    <carlsonj@workingcode.com>
