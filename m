Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 446571B5238
	for <lists+linux-ppp@lfdr.de>; Thu, 23 Apr 2020 04:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgDWCBr (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 22 Apr 2020 22:01:47 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:41282 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgDWCBq (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 22 Apr 2020 22:01:46 -0400
Received: from [192.168.254.66] ([192.168.254.66])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id 03N21cp4010339
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Wed, 22 Apr 2020 22:01:39 -0400
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com 03N21cp4010339
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1587607299;
        bh=vvKx6hnGEicpXcdMiaPdfHKapgCgdRaGrkz9CTTjM/U=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=w0DclsBIKO7biRQzI6CUhyrpJL3kQ+wnTWY2B9BaXjReXwKssKrfFB01pFYn5QrAx
         tzgIIHHGjZeYguo+eahWLvhJ3p6u1DNdcryN7F4ukHOd2Cg5Zk+J5JtTba4GCNjJQm
         vGYzGXjTM4c5QiCDu5eGjJpZimY59H9oaUEDGasU=
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     Michael Richardson <mcr@sandelman.ca>
Cc:     =?UTF-8?Q?David_Bala=c5=beic?= <xerces9@gmail.com>,
        linux-ppp@vger.kernel.org
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com>
 <21061.1587602497@localhost>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com>
Date:   Wed, 22 Apr 2020 22:01:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <21061.1587602497@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-DCC-x.dcc-servers-Metrics: carlson 104; Body=3 Fuz1=3 Fuz2=3
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 4/22/20 8:41 PM, Michael Richardson wrote:
> 
> James Carlson <carlsonj@workingcode.com> wrote:
>      > If it isn't, then possibly it's something else.  I think that the last
>      > time I looked at the PPPoE implementation on Linux it was a bit hokey --
>      > it ran PPP over a pty pair and then decoded the framing in user space
>      > and wrote it back out over Ethernet using PPPoE.  I hope it's not still
>      > like that, as I haven't looked at it in years, but it may well be.  An
>      > internal error in that logic could also cause a "hangup" message,
>      > although hopefully along with some kind of system log about a core file
>      > as well.
> 
> No, that's not how PPPoE has worked for at least 15 years.
> There is a PPPoE socket and the IP packets do not leave the kernel.
> I have built BMS systems that handle thousands of sessions on 8-core
> systems.

OK; thanks for the correction, and it's good to hear.  The ahdlc hacks 
I've seen were just inherently unstable.

That makes it ever more likely that this is just the provider's doing.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
