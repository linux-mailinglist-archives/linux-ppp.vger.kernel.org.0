Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55DEE1B7843
	for <lists+linux-ppp@lfdr.de>; Fri, 24 Apr 2020 16:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgDXO0V (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 24 Apr 2020 10:26:21 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:33648 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbgDXO0V (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 24 Apr 2020 10:26:21 -0400
Received: from [50.78.21.49] (carlson [50.78.21.49])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id 03OEQGsl014745
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Fri, 24 Apr 2020 10:26:16 -0400
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com 03OEQGsl014745
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1587738377;
        bh=d5ME2dFKKnrLOZumMmpYKULKkOg0856NcKMVy5Ji+qE=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=VNr0QSlkzwot3O+lYGzQdmfYT+vEPZLV2BvQaL9Szl9OhZsCOdyqRRG/9NXkV5kOy
         XOQbaVSvPokI3i48RyeqlkV8dFvipCCkqYx5Cw79Sk1YBNMXG44rTOwobp6oItpPd7
         yJB1QQhI02T0P6QrJOU9Lzi7/Iw1Gkxd8l14TPaM=
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     =?UTF-8?Q?David_Bala=c5=beic?= <xerces9@gmail.com>,
        linux-ppp@vger.kernel.org
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com>
 <21061.1587602497@localhost>
 <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com>
 <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
 <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
 <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
 <7689.1587657698@localhost>
 <CAPJ9Yc9rdbwd0OTcJhmuqG_r6qPfYKwiScLOxiwe41_ye_PNGw@mail.gmail.com>
 <CAPJ9Yc9uuOKk=fh3Ke7riuZN2JgB2Ma3F2Njy69_6nms1kC=bQ@mail.gmail.com>
 <CAPJ9Yc_iOxyDzrL9cs_ERSEjnVttYgk4JFqhO7T=yg03420LMA@mail.gmail.com>
 <CAPJ9Yc8O5t9ak_AB51We6w=EnURkbUjS1hXDHAuCroGLjeUxOg@mail.gmail.com>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <7b366bd6-85d6-c7c2-9d0e-aafdaf9a81fc@workingcode.com>
Date:   Fri, 24 Apr 2020 10:26:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAPJ9Yc8O5t9ak_AB51We6w=EnURkbUjS1hXDHAuCroGLjeUxOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-DCC--Metrics: carlson 1480; Body=2 Fuz1=2 Fuz2=2
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 2020-04-24 10:02, David Balažic wrote:
> ppp log:
> 
> 
> Fri Apr 24 10:42:32 2020 daemon.notice pppd[11986]: Modem hangup
> Fri Apr 24 10:42:32 2020 daemon.info pppd[11986]: Connect time 979.3 minutes.
> Fri Apr 24 10:42:32 2020 daemon.info pppd[11986]: Sent 325423487
> bytes, received 1643504692 bytes.

Truncated logs aren't so helpful.  This tells us nothing about what's
going on.

> It seems echo requests come more often towards the end, almost every
> second. Earlier they are also irregular, but come at 30-60 second
> intervals.

LCP Echo-Request messages are an optional feature.  They're controlled
by the lcp-echo-interval and lcp-echo-failure options.  By default, pppd
won't send these, but will respond if the other side sends them.

The idea is that if you send a request, and the other side fails to
respond, then, regardless of what the hardware is telling you, the link
itself is dead, and can be torn down.

However, in the exchange you've shown here, every request has a
response, and all of the requests and responses appear to be in good
order (each side is attaching its own LCP magic number option, which is
the right thing to see, and the ID numbers line up for request/reply).

There's nothing out of what you've sent that indicates (to me, at least)
any sort of problem, at least within PPP itself.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
