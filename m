Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B0D1C7382
	for <lists+linux-ppp@lfdr.de>; Wed,  6 May 2020 17:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728590AbgEFPCU (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 6 May 2020 11:02:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58300 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728428AbgEFPCT (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 6 May 2020 11:02:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588777338;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+Dv+DHkhKOQP6mTut6kauOxkYmf2yMstrWO0f6ICOxU=;
        b=buGKmYbFZUbnSftMxqRC65TCuBa2IFLt2hCH8fWKQp0SZzf0aBHp905PS8jNQBLdj7lkUS
        0cYqjjuoEGJoAEBJjNNx1ROL6AYFgKzByJ4UKpLbTXzc0NoTgR0l34Leu9PnvAuUlmpJr+
        jDZ0bFtdBf/iUvsK8tGumyr939llTnA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-I6yEvsa2OVyjSOTAcoQkcw-1; Wed, 06 May 2020 11:02:16 -0400
X-MC-Unique: I6yEvsa2OVyjSOTAcoQkcw-1
Received: by mail-wr1-f71.google.com with SMTP id g10so1457494wrr.10
        for <linux-ppp@vger.kernel.org>; Wed, 06 May 2020 08:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+Dv+DHkhKOQP6mTut6kauOxkYmf2yMstrWO0f6ICOxU=;
        b=qWKgx+tM29n23Nj1jJq7sVqyd02p8iEWS8QJmcFO9++oAhBFPU2eQBGea+b1tb4AZU
         nHY9xQP4ujLNMYR8h0qHcck0sxxpX07O7ZCshWMMWuKFcbjQGXO8sqiix0DYODBYmyrB
         RZQJFZ3pFR3cVMVG6sbh3gLw4AUdkIrVqIOM6qW5DgU6ixlubS7EpedVZxqG5zyDruLC
         BO5xKp4gyr0Dnxfmkegl5Mz5u9km9/3ZZY9ZlC8+3RKCBdDsn2zlyItz014N+VWpGS4H
         iSb088BSfJwxTi+TO2Cj4ErL8LJLmlE/Jc5xnQa3Tpeg9U/TEy1F9gay3uDK15MDBqvr
         ajGQ==
X-Gm-Message-State: AGi0Pubo2IYtDmWZMaZvAEXfLmZPQaO6gI7bPgAsXXJZaW3YA3NDBGhN
        mUWta2kIuTT6DgcXcuEAKo4g8ZtrQe6uT9lzUftGK/p5bdQeCt+Bq4g2XH1PNxcIn1U8HO0SavK
        n+M0Ji3m3jzGe/gGcW66a
X-Received: by 2002:a7b:cf25:: with SMTP id m5mr5215124wmg.65.1588777334754;
        Wed, 06 May 2020 08:02:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypIrl5j6/oIt6BTc7ms6o6LXcN9tIJbyV4UAFvyhUAf7vYKETKnjb2HvbbWWCnE8v6GxDN4KnA==
X-Received: by 2002:a7b:cf25:: with SMTP id m5mr5215089wmg.65.1588777334517;
        Wed, 06 May 2020 08:02:14 -0700 (PDT)
Received: from pc-3.home (2a01cb0585138800b113760e11343d15.ipv6.abo.wanadoo.fr. [2a01:cb05:8513:8800:b113:760e:1134:3d15])
        by smtp.gmail.com with ESMTPSA id o6sm3264698wrw.63.2020.05.06.08.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 08:02:13 -0700 (PDT)
Date:   Wed, 6 May 2020 17:02:10 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     David =?utf-8?Q?Bala=C5=BEic?= <xerces9@gmail.com>
Cc:     linux-ppp@vger.kernel.org
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-ID: <20200506150210.GB21453@pc-3.home>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <CAPJ9Yc8eDBsGtFy_juZ3Z6biKKD4-JoNg0icv4otHK=o66aBZw@mail.gmail.com>
 <20200504130149.GB27585@pc-3.home>
 <CAPJ9Yc_kvqAD5d1XJGQmzVC5d8_HXtp5aH-4OSyqBXDLu1Na8g@mail.gmail.com>
 <20200504181159.GA7717@pc-3.home>
 <CAPJ9Yc8KxAHuw-PsF2uJuW+Ec5HNzhVqVR7yQgrWRwUWeT=ekA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPJ9Yc8KxAHuw-PsF2uJuW+Ec5HNzhVqVR7yQgrWRwUWeT=ekA@mail.gmail.com>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Mon, May 04, 2020 at 08:43:26PM +0200, David Balažic wrote:
> On Mon, 4 May 2020 at 20:12, Guillaume Nault <gnault@redhat.com> wrote:
> >
> > On Mon, May 04, 2020 at 06:36:48PM +0200, David Balažic wrote:
> > > On Mon, 4 May 2020 at 15:01, Guillaume Nault <gnault@redhat.com> wrote:
> > > > You can use "%pM" for printing MAC addresses. Also, it'd be interesting
> > > > to have information about promisc mode:
> > > >   "dev %s, flags: %#x, promiscuity %u",
> > > >   dev->name, dev->flags, dev->promiscuity,
> > >
> > > "ifdown wan" triggers a PADT response from the server, and then this
> > > code prints:
> > >
> > >  dev eth1.3902, flags: 0x1003, promiscuity 0
> > >
> > I'm not sure what "ifdown wan" is supposed to do. Assuming "wan" is the
> > name of your ppp interface (wasn't it "pppoe-wan" in your previous
> > logs?) and that ifdown works like on Debian, then it makes sense that
> > the peer disconnects the PPPoE session by sending a PADT. At least now
> > the device isn't in promisc mode.
> 
> Yes, "wan" is the interface alias. ifdown "closes" it... sends a PADT
> to the server, server replies with PADT...
> 
Thanks.

> > > I'll report later values printed when a stray PADT appears.
> > >
> > Okay, but please keep printing the destination MAC address of the
> > packet. I was providing the flags/promiscuity string just to get extra
> > information, not to replace your original log.
> >
> > Also, what's the driver of your NIC (ethtool -i eth1)?
> 
> # ethtool  -i eth1
> driver: ag71xx
> 
Ok, can you connect this interface directly to a box under your control
and use this box to ping the ag71xx interface using an invalid
destination MAC address?

Assuming your other box runs Linux and the IP address assigned to the
ag71xx NIC is 192.0.2.1, the test would look like this:

$ ping 192.0.2.1    # Basic test. Also makes Linux get the peer dst MAC

$ ip neighbour list # Show the peer dst MAC
192.0.2.1 dev ethX lladdr aa:bb:cc:dd:ee:ff REACHABLE

$ ip neighbour replace 192.0.2.1 dev ethX lladdr aa:bb:cc:dd:ee:f0

$ ping 192.0.2.1   # Try to ping again, this time using a wrong dst MAC

> Regards,
> David
> 

