Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E431BAED4
	for <lists+linux-ppp@lfdr.de>; Mon, 27 Apr 2020 22:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgD0UIv (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 27 Apr 2020 16:08:51 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50521 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726609AbgD0UIv (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 27 Apr 2020 16:08:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588018129;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y3Dlv+7IBUUBpGMwapwJDZmQhGYwW0dNrgm2ZJFX3sU=;
        b=O0COKsqaBBdzVc+XAoQlvPxlB0NwgVYs9rNukkpY3q2yjF1rjc99NWS5Biw2uoHLak5KWQ
        C/UJ017EqxK8/IMDZIFuS7FhItzzf0hbCJG60g6MzR98t5kIVhgPwKr3I/wVUTvyrszlbM
        64w8IdlFVk/+GOUSMpIjew82j29M4dc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-igqXliN6NDmObH9a0X8JAg-1; Mon, 27 Apr 2020 16:08:47 -0400
X-MC-Unique: igqXliN6NDmObH9a0X8JAg-1
Received: by mail-wr1-f69.google.com with SMTP id i10so11065255wrq.8
        for <linux-ppp@vger.kernel.org>; Mon, 27 Apr 2020 13:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Y3Dlv+7IBUUBpGMwapwJDZmQhGYwW0dNrgm2ZJFX3sU=;
        b=Pwd34jlVjn/2SI8SWmBF44RhrCLJxpLaUFbWwHCGqmsTxAkM62kFwMsZyeZ4BrmLCw
         AyYXu8uuDGkttM/iS1AZx4oJCrJOTQRRZnHq5WajZm+YC1gUUZNf8TqOHl8UzyUyHbMB
         v1ik4jFKf+RIRu6rpyTx/6bzg9yTDoq/GriFbsydcUMKlmezYkV8vi9cOREhgQNfZHst
         W1TE4uVey6WTAXPk3Zvm4C+2JTNHX0/+mTHJK1789mAw9W+srBLGJ2A2fRp4fF0EBV57
         mqu9fMeaV54ibOWGfkPjDXp8iw478RVH7ZjRLe87DMTJWHKJfjaf6mtJp+QXnRfCtfqj
         1yFg==
X-Gm-Message-State: AGi0PuapTqOxBc3+zpFjk4skiOF6moV1AEAa/z/PH8JTLJi0Hq/L4ZJA
        NagDi8BUfzCZCsR2KqPFmmIRclaLRPAD40XrUnlSIZ7HEdxtQCsYu+ws70PIOyMpYhoeOih3ESt
        dcuf9B6kmJxF7p5xThHLi
X-Received: by 2002:a1c:770f:: with SMTP id t15mr397425wmi.178.1588018125280;
        Mon, 27 Apr 2020 13:08:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypLXycz+cSsR/XGDxqqsfS17ANJDRkJpGpYu5Pokzc7K8YQoSuo+Jf2vqH2OlbERirrLvyjYdw==
X-Received: by 2002:a1c:770f:: with SMTP id t15mr397400wmi.178.1588018124926;
        Mon, 27 Apr 2020 13:08:44 -0700 (PDT)
Received: from pc-3.home (2a01cb0585138800b113760e11343d15.ipv6.abo.wanadoo.fr. [2a01:cb05:8513:8800:b113:760e:1134:3d15])
        by smtp.gmail.com with ESMTPSA id 185sm344911wmc.32.2020.04.27.13.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 13:08:44 -0700 (PDT)
Date:   Mon, 27 Apr 2020 22:08:42 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     James Carlson <carlsonj@workingcode.com>
Cc:     David =?utf-8?Q?Bala=C5=BEic?= <xerces9@gmail.com>,
        linux-ppp@vger.kernel.org
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-ID: <20200427200842.GA3210@pc-3.home>
References: <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
 <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
 <7689.1587657698@localhost>
 <CAPJ9Yc9rdbwd0OTcJhmuqG_r6qPfYKwiScLOxiwe41_ye_PNGw@mail.gmail.com>
 <CAPJ9Yc9uuOKk=fh3Ke7riuZN2JgB2Ma3F2Njy69_6nms1kC=bQ@mail.gmail.com>
 <CAPJ9Yc_iOxyDzrL9cs_ERSEjnVttYgk4JFqhO7T=yg03420LMA@mail.gmail.com>
 <29906.1587865115@localhost>
 <CAPJ9Yc-Tj+pLJ_vfLuERUi-2oGadeaWTJSkDFNw0rLoqMCmL3Q@mail.gmail.com>
 <CAPJ9Yc8AQZnATT07zUC0397vSGCuuh8STyQRbdBk5LLPp3Xfyg@mail.gmail.com>
 <92e78022-55ca-862c-fcda-3f728be89774@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92e78022-55ca-862c-fcda-3f728be89774@workingcode.com>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Mon, Apr 27, 2020 at 09:43:06AM -0400, James Carlson wrote:
> On 2020-04-26 15:03, David Balažic wrote:
> > tcpdump: listening on eth1, link-type EN10MB (Ethernet), capture size
> > 262144 bytes
> > 17:34:34.805424 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
> > (oui Unknown), ethertype 802.1Q (0x8100), length 60: vlan 3902, p 1,
> > ethertype PPPoE D, PPPoE PADT [ses 0x1]
> > 17:34:34.815673 c4:3d:c7:90:ce:ed (oui Unknown) > a4:7b:2c:9e:c7:44
> > (oui Unknown), ethertype 802.1Q (0x8100), length 52: vlan 3902, p 0,
> > ethertype PPPoE D, PPPoE PADT [ses 0x1] [Host-Uniq 0x00003003]
> > [AC-Cookie 0xED****************************75]
> > tcpdump: pcap_loop: The interface went down
> [...]
> > Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]:  dst
> > c4:XX:XX:XX:XX:ed  src a4:XX:XX:XX:XX:44
> 
> That's really good evidence right there.  It certainly looks like the
> Roaring Penguin PPPoE kernel driver is blindly accepting a bad PADT
> packet meant for someone else.  Your peer probably shouldn't have sent
> this down the line to you, but that's another matter.
> 
From what I remember of the rp-pppoe and pppd code, once the PPPoE
session is established, rp-pppoe gives control to pppd.
Therefore it has no chance to receive a PADT, since it can't read the
file descriptor used for PPPoE discovery anymore.

That means that the kernel needs to have some ugly code to snoop PADT
messages and kill the affected channel, so that pppd terminates without
waiting for an LCP time out.

What's certain, is that the kernel will shut down the PPP channel
attached to a PPPoE session that receives a PADT. Matching is done on
the source MAC address, the input interface and the session Id.
Delivering the PADT to the interface follows the normal rules. So, in
non-promiscuous mode, a non-multicast frame must have the correct
destination MAC address. In promiscuous mode, all frames are accepted.

Note that, as I already said in a previous message, actions on the
network interface used by PPPoE can also unregister the PPP channel
(passing the interface down, changing the MTU, etc.). That's why I
proposed to check the evolution of the PPPoE interface with rtmon.

> I don't maintain the RP software, but I have a guess.  Either something
> on the system is keeping the Ethernet driver itself in promiscuous mode,
> or some defect in the driver allows non-matching non-multicast
> destinations to be sent up the receive pipe.
> 
I guess it was just because of the concurrent tcpdump running without
the -p option.

> Either way, it's usually responsibility of the receiving protocol
> software after ethertype demux (in this case, the PPPoE implementation,
> and NOT the PPP code) to validate that the addresses are correct when
> necessary.  It's not the driver's problem.
> 
> I think the PPPoE code may be missing a check here.  This looks like a
> bug to me.
> 
> > Sun Apr 26 17:35:06 2020 daemon.debug pppd[20289]: sent [IPV6CP
> > ConfReq id=0x1 <addr fe80::d035:60ed:928e:f741>]
> > Sun Apr 26 17:35:09 2020 daemon.warn pppd[20289]: IPV6CP: timeout
> > sending Config-Requests
> 
> I don't think this is causing the problem, but it's interesting evidence
> nonetheless.  If the peer you're talking to actually implemented PPP in
> a reasonable manner, it would send LCP Protocol-Reject in response to
> your attempt to negotiate IPV6CP rather than just ignoring you.  The
> peer isn't healthy.  Not much you can do about it at this point (other
> than disabling IPv6 on your side with "noipv6"), but still interesting.
> 
> > The strange part is in the tcpdump there is a PADT sent to an
> > "unknown" MAC and my pppd responds. At least that is how I see it.
> 
> Yes, EXCEPT that pppd isn't involved at all.  PADT is part of the PPPoE
> protocol, not PPP.  pppd doesn't know anything about this.  It's the
> rp-pppoe software that's responding improperly.  As I suggested
> previously in a private message, I think you should discuss the problem
> with the maintainers of the PPPoE stuff.
> 
> -- 
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
> 

