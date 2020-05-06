Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C411C73ED
	for <lists+linux-ppp@lfdr.de>; Wed,  6 May 2020 17:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729517AbgEFPP4 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 6 May 2020 11:15:56 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:37722 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729368AbgEFPPz (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 6 May 2020 11:15:55 -0400
Received: from [50.78.21.49] (carlson [50.78.21.49])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id 046FFkTm015378
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Wed, 6 May 2020 11:15:46 -0400
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com 046FFkTm015378
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1588778147;
        bh=mHhUezNMsEM+eQ76eBMBpldByvtMtHSB5Q/w15L93uY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=PGvGlavNcU+VYUIAIRYicpgxWi8ZQSQJRgV7InzDOf5gO9lFycGnW5lt+7isXauQW
         J8Ay1MkjxSBCQj9LdkKXFI3N62AB3+PBM2eau4nIgaVv5+9e6FpftzA93++bsP4iFG
         SMVUK68WstJCbO+Gti7eYHCXsUFdOfdidbiM5juA=
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     Guillaume Nault <gnault@redhat.com>,
        =?UTF-8?Q?David_Bala=c5=beic?= <xerces9@gmail.com>
Cc:     linux-ppp@vger.kernel.org
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <CAPJ9Yc8eDBsGtFy_juZ3Z6biKKD4-JoNg0icv4otHK=o66aBZw@mail.gmail.com>
 <20200504130149.GB27585@pc-3.home>
 <CAPJ9Yc_kvqAD5d1XJGQmzVC5d8_HXtp5aH-4OSyqBXDLu1Na8g@mail.gmail.com>
 <20200504181159.GA7717@pc-3.home>
 <CAPJ9Yc-a4ax_RgYLJT71ukkcPasz+z2dU6bm9yiE+k664JhNqA@mail.gmail.com>
 <20200506142619.GA21453@pc-3.home>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <b222ca9e-34bd-7a43-e426-3cd0a622edbf@workingcode.com>
Date:   Wed, 6 May 2020 11:15:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200506142619.GA21453@pc-3.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-DCC-x.dcc-servers-Metrics: carlson 104; Body=3 Fuz1=3 Fuz2=3
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 2020-05-06 10:26, Guillaume Nault wrote:
> On Wed, May 06, 2020 at 11:52:48AM +0200, David Balažic wrote:
>> (the last line is from my fix, the connection is now not dropped when
>> the PADT is not for us; works fine, my connection stays up and
>> working)
>>
> Looks like a more fundamental issue. This frame shouldn't have been
> accepted in the first place. Can you also print the packet class
> ("... pkt_type %u", ..., skb->pkt_type)?
> 
> Testing the destination MAC here is likely to just paper over the
> problem.

Having either sketchy (e.g., CRC hash filter based) or just absent
hardware filtering of unicast addresses isn't an unknown property for
some Ethernet devices.  Relying on exact match from the underlying
hardware seems like a bad idea.  (Some, for instance, can either receive
"all multicast" or can filter using the low N bits of the CRC to index
into a 2^N-bit hash table, but can't really exclude a unicast packet
that happens to match the low N bits of a selectively enabled multicast
address.  See, for example, the PowerQUICC implementation.  But there
are quite a few that work like this.  It wouldn't surprise me in the
least that 'ar71xx' [Atheros/Qualcomm?] is like this.)

I agree that having to test the MAC address right here is a bit lame and
that the driver itself ought to assist the hardware in doing the Right
Thing.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
