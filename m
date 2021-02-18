Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2E3031E370
	for <lists+linux-ppp@lfdr.de>; Thu, 18 Feb 2021 01:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhBRATW (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 17 Feb 2021 19:19:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhBRATV (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 17 Feb 2021 19:19:21 -0500
Received: from balrog.mythic-beasts.com (balrog.mythic-beasts.com [IPv6:2a00:1098:0:82:1000:0:2:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDF6C061574
        for <linux-ppp@vger.kernel.org>; Wed, 17 Feb 2021 16:18:41 -0800 (PST)
Received: from [2001:8b0:ffd5:3:2141:af9e:de82:72b6] (port=58999)
        by balrog.mythic-beasts.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <njh@aelius.com>)
        id 1lCX1f-0001wm-On; Thu, 18 Feb 2021 00:18:39 +0000
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from
 remote peer
To:     Benjamin Cama <benoar@dolka.fr>
Cc:     linux-ppp <linux-ppp@vger.kernel.org>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
 <907df17c-450a-8db6-1dc1-dd3731019279@workingcode.com>
 <e04667f8e2ff35927fca7e6280c0817a0caccebb.camel@dolka.fr>
 <dbd27511-117f-6cf7-0d38-eb715faed9c5@aelius.com>
 <072169f215e68427ba9b65caac3c3effef3b971c.camel@dolka.fr>
From:   Nicholas Humfrey <njh@aelius.com>
Message-ID: <105ed7cd-8245-37ba-2018-ed7e947026e9@aelius.com>
Date:   Thu, 18 Feb 2021 00:18:17 +0000
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


On 16/02/2021 10:04, Benjamin Cama wrote:
> Hi Nicholas,
>
> [Cc'ing the list if I may, as it may be useful]

Whoops. I had meant to CC the list.


> It seems it keeps sending ConfReq for the zero identifier… strange.
> Here is the output with the patched version from last june when I wrote
> it, latest git at the time (some time after 2.4.8), which works

Hm! I will try testing against an older version in git...


Now that I know that it isn't just that I haven't found the right 
option, I decided to raise a Github issue here:

https://github.com/paulusmack/ppp/issues/256


nick.


