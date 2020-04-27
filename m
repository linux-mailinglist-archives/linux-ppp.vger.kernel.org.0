Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08F591BA53B
	for <lists+linux-ppp@lfdr.de>; Mon, 27 Apr 2020 15:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgD0NnM (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 27 Apr 2020 09:43:12 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:55046 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgD0NnL (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 27 Apr 2020 09:43:11 -0400
Received: from [50.78.21.49] (carlson [50.78.21.49])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id 03RDh6rn031925
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Mon, 27 Apr 2020 09:43:06 -0400
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com 03RDh6rn031925
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1587994986;
        bh=RozXZa9ZdCmd/LpJqd2gwKSW7aUafpcq6v2Bw/oqKE0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=lNswLF1gE2sfgwtrv8kwQ3AypmCtv69OtgZHn86tw0opaaBBHYLpl5j3OVKCpad0E
         zCKvFGBN8cYcwZ/6xpxMw9fPGPQWtVv2buRE1fzL6NWNV/rYap1Ids7cTngj1UmPG5
         ftqsqegK3PuB/8mJOVAbG3QjMMGkBg+S+E7IGWL0=
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     =?UTF-8?Q?David_Bala=c5=beic?= <xerces9@gmail.com>
Cc:     linux-ppp@vger.kernel.org
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
 <29906.1587865115@localhost>
 <CAPJ9Yc-Tj+pLJ_vfLuERUi-2oGadeaWTJSkDFNw0rLoqMCmL3Q@mail.gmail.com>
 <CAPJ9Yc8AQZnATT07zUC0397vSGCuuh8STyQRbdBk5LLPp3Xfyg@mail.gmail.com>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <92e78022-55ca-862c-fcda-3f728be89774@workingcode.com>
Date:   Mon, 27 Apr 2020 09:43:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAPJ9Yc8AQZnATT07zUC0397vSGCuuh8STyQRbdBk5LLPp3Xfyg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-DCC-sonic-Metrics: carlson 1254; Body=2 Fuz1=2 Fuz2=2
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 2020-04-26 15:03, David Balažic wrote:
> tcpdump: listening on eth1, link-type EN10MB (Ethernet), capture size
> 262144 bytes
> 17:34:34.805424 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
> (oui Unknown), ethertype 802.1Q (0x8100), length 60: vlan 3902, p 1,
> ethertype PPPoE D, PPPoE PADT [ses 0x1]
> 17:34:34.815673 c4:3d:c7:90:ce:ed (oui Unknown) > a4:7b:2c:9e:c7:44
> (oui Unknown), ethertype 802.1Q (0x8100), length 52: vlan 3902, p 0,
> ethertype PPPoE D, PPPoE PADT [ses 0x1] [Host-Uniq 0x00003003]
> [AC-Cookie 0xED****************************75]
> tcpdump: pcap_loop: The interface went down
[...]
> Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]:  dst
> c4:XX:XX:XX:XX:ed  src a4:XX:XX:XX:XX:44

That's really good evidence right there.  It certainly looks like the
Roaring Penguin PPPoE kernel driver is blindly accepting a bad PADT
packet meant for someone else.  Your peer probably shouldn't have sent
this down the line to you, but that's another matter.

I don't maintain the RP software, but I have a guess.  Either something
on the system is keeping the Ethernet driver itself in promiscuous mode,
or some defect in the driver allows non-matching non-multicast
destinations to be sent up the receive pipe.

Either way, it's usually responsibility of the receiving protocol
software after ethertype demux (in this case, the PPPoE implementation,
and NOT the PPP code) to validate that the addresses are correct when
necessary.  It's not the driver's problem.

I think the PPPoE code may be missing a check here.  This looks like a
bug to me.

> Sun Apr 26 17:35:06 2020 daemon.debug pppd[20289]: sent [IPV6CP
> ConfReq id=0x1 <addr fe80::d035:60ed:928e:f741>]
> Sun Apr 26 17:35:09 2020 daemon.warn pppd[20289]: IPV6CP: timeout
> sending Config-Requests

I don't think this is causing the problem, but it's interesting evidence
nonetheless.  If the peer you're talking to actually implemented PPP in
a reasonable manner, it would send LCP Protocol-Reject in response to
your attempt to negotiate IPV6CP rather than just ignoring you.  The
peer isn't healthy.  Not much you can do about it at this point (other
than disabling IPv6 on your side with "noipv6"), but still interesting.

> The strange part is in the tcpdump there is a PADT sent to an
> "unknown" MAC and my pppd responds. At least that is how I see it.

Yes, EXCEPT that pppd isn't involved at all.  PADT is part of the PPPoE
protocol, not PPP.  pppd doesn't know anything about this.  It's the
rp-pppoe software that's responding improperly.  As I suggested
previously in a private message, I think you should discuss the problem
with the maintainers of the PPPoE stuff.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
