Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E1631B09A
	for <lists+linux-ppp@lfdr.de>; Sun, 14 Feb 2021 14:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbhBNNno (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 14 Feb 2021 08:43:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbhBNNnj (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 14 Feb 2021 08:43:39 -0500
Received: from haggis.mythic-beasts.com (haggis.mythic-beasts.com [IPv6:2a00:1098:0:86:1000:0:2:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28B0C061574
        for <linux-ppp@vger.kernel.org>; Sun, 14 Feb 2021 05:42:58 -0800 (PST)
Received: from [2001:8b0:ffd5:3:dc9c:7fd5:5732:a0b3] (port=54277)
        by haggis.mythic-beasts.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <njh@aelius.com>)
        id 1lBHft-0001To-9Y; Sun, 14 Feb 2021 13:42:57 +0000
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from
 remote peer
To:     linux-ppp@vger.kernel.org
Cc:     Michael Richardson <mcr@sandelman.ca>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
 <15154.1613267855@localhost>
From:   Nicholas Humfrey <njh@aelius.com>
Message-ID: <0c05578d-6212-3e64-16e3-1aa5b3c67e34@aelius.com>
Date:   Sun, 14 Feb 2021 13:42:54 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <15154.1613267855@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-BlackCat-Spam-Score: 0
X-Spam-Status: No, score=-0.1
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org


On 14/02/2021 01:57, Michael Richardson wrote
> Nicholas Humfrey <njh@aelius.com> wrote:
>      > I have two pppd (v2.4.7) instances running, talking to each over over a
>      > serial port link. But I can't work out how to get the 'client' pppd to
>      > accept the link-local IPv6 interface identifier provided by the
>      > 'server' pppd. I am trying to use static addresses so I know the
>      > link-local IP address of the remote peer.
>
> So, basically you want to have ppp running with unnumbered links, and then
> maybe you do routing over that?
>
> I am not surprised that this hasn't been tested, and that there are bugs.
> Mostly, IP6CP assigns random IPv6-LL.

I guess it does surprise me that there are bugs! I had been assuming 
that I was doing something wrong but the more I look at it, the more it 
looks like a bug.


> If your goal is routing over unnumbered links, you don't really need the
> destination IPv6-LL to route to, it's enough to "dev ppp0" or whatever.

Yeah, that is perfectly fair. I did get static global IPv6 addresses and 
routing working, so the actual link-local address I guess isn't that 
important.

Just a bit frustrating not being able to achieve something that seems 
like it should be possible.


Thanks!

nick.


