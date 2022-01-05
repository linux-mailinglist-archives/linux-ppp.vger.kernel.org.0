Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3A948575D
	for <lists+linux-ppp@lfdr.de>; Wed,  5 Jan 2022 18:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242360AbiAERhb (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 5 Jan 2022 12:37:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34217 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242371AbiAERhM (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 5 Jan 2022 12:37:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641404230;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JquRRMpmPNBUfRVv/kO5rqtHDVD1T4H1+hvFjq+MPQk=;
        b=A9zGLM0YJhO6SDmPAS+9tj6LE+Bz1M52zXbAgV/3LfZCUs2OWYBlOZtLHpiQ53FCWMu0KK
        46ptQbpiviRtIfmydF/Nf619g8J51a3vNKqHAUpo/L7vNRd7VyeMAnuXVhZn2MY8P5pbyH
        n3djpcP361CfHwTJ/AMpMtEKLjtESXA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-yL9SNtdXNmuDBWkmikOOhg-1; Wed, 05 Jan 2022 12:37:09 -0500
X-MC-Unique: yL9SNtdXNmuDBWkmikOOhg-1
Received: by mail-wr1-f72.google.com with SMTP id v6-20020adfa1c6000000b001a26d0c3e32so12773386wrv.14
        for <linux-ppp@vger.kernel.org>; Wed, 05 Jan 2022 09:37:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JquRRMpmPNBUfRVv/kO5rqtHDVD1T4H1+hvFjq+MPQk=;
        b=x35ExH4658ihGYCK77XHpGr3oqQ9x6V4Jne85s67C26A+g5TH/DOpDJpXNHmwmCWI5
         sYYyNvmyMlHRHQk3o85hjkpk1lu1Npv2aGhVX13rAyzjvukxMMxjkISVFC4JKC8Kwkv3
         NPp9CPnDh14KHpQatpdn8a7HWFpTKn0u+h6DKWXm9Dzaji6/qWGYA6Qy5NOygU9RxXWs
         bZwSIXAx0N2XaHRW5xSE9kurjxX4bHcUbhQx2CHqwpFQYQypBb9Gn1lSiNJDh5aphEJe
         1L765IV60HeTnnpwsFcSZOYDasbyqLXqtBed7c7LZ4n6LBRvSULOcQIZY3sfNpr29RPO
         NZEw==
X-Gm-Message-State: AOAM5308PJ9FB88mgTJC8BvhVxIy9KV1LFTuCuZTjxdST6x9vqTU0ZbH
        O1y7eLz99XXwRUa1uPB6RRR4MFKn6k1mcto17hEz8ccyarLsazrIClN3GIPCmmM1yhmlqEofBwa
        YhSpn9L/3A20MFCUdtEa2
X-Received: by 2002:a05:6000:23a:: with SMTP id l26mr45974055wrz.666.1641404227878;
        Wed, 05 Jan 2022 09:37:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUPCe5++dVtfLUu9svVLg4wpor9PvBkTQTFAzxfrW00+u7H+DOAc0Mtv0jCVozOYczIXjhBw==
X-Received: by 2002:a05:6000:23a:: with SMTP id l26mr45974036wrz.666.1641404227705;
        Wed, 05 Jan 2022 09:37:07 -0800 (PST)
Received: from pc-1.home (2a01cb058d24940001d1c23ad2b4ba61.ipv6.abo.wanadoo.fr. [2a01:cb05:8d24:9400:1d1:c23a:d2b4:ba61])
        by smtp.gmail.com with ESMTPSA id d5sm2888861wms.28.2022.01.05.09.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 09:37:07 -0800 (PST)
Date:   Wed, 5 Jan 2022 18:37:05 +0100
From:   Guillaume Nault <gnault@redhat.com>
To:     James Carlson <carlsonj@workingcode.com>
Cc:     Eric Dumazet <eric.dumazet@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org,
        syzbot <syzkaller@googlegroups.com>
Subject: Re: [PATCH net] ppp: ensure minimum packet size in ppp_write()
Message-ID: <20220105173705.GC17823@pc-1.home>
References: <20220105114842.2380951-1-eric.dumazet@gmail.com>
 <20220105131929.GA17823@pc-1.home>
 <dbde2a45-a7dd-0e8a-d04c-233f69631885@workingcode.com>
 <20220105162954.GB17823@pc-1.home>
 <f78e2051-714d-ff74-7e36-bea3b4edc682@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f78e2051-714d-ff74-7e36-bea3b4edc682@workingcode.com>
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Wed, Jan 05, 2022 at 11:35:52AM -0500, James Carlson wrote:
> On 1/5/22 11:29, Guillaume Nault wrote:
> > On Wed, Jan 05, 2022 at 10:30:09AM -0500, James Carlson wrote:
> >> On 1/5/22 08:19, Guillaume Nault wrote:
> >>> On Wed, Jan 05, 2022 at 03:48:42AM -0800, Eric Dumazet wrote:
> >>>> From: Eric Dumazet <edumazet@google.com>
> >>>>
> >>>> It seems pretty clear ppp layer assumed user space
> >>>> would always be kind to provide enough data
> >>>> in their write() to a ppp device.
> >>>>
> >>>> This patch makes sure user provides at least
> >>>> 2 bytes.
> >>>>
> >>>> It adds PPP_PROTO_LEN macro that could replace
> >>>> in net-next many occurrences of hard-coded 2 value.
> >>>
> >>> The PPP header can be compressed to only 1 byte, but since 2 bytes is
> >>> assumed in several parts of the code, rejecting such packets in
> >>> ppp_xmit() is probably the best we can do.
> >>
> >> The only ones that can be compressed are those less than 0x0100, which
> >> are (intentionally) all network layer protocols.  We should be getting
> >> only control protocol messages though the user-space interface, not
> >> network layer, so I'd say it's not just the best we can do, but indeed
> >> the right thing to do by design.
> > 
> > Well, I know of at least one implementation that used to transmit data
> > by writing on ppp unit file descriptors. That was a hack to work around
> > some other problems. Not a beautiful one, but it worked.
> > 
> 
> So, if you do that sort of hack, then you're constrained to send
> uncompressed protocol numbers regardless of what's negotiated. That
> seems like a tiny concession. (And receivers are required to handle
> uncompressed no matter what LCP negotiation says, per 1661 6.5.)

In the case I was refering to, the program was just retransmitting PPP
frames and wasn't supposed to modify the headers. We now have kernel
support for that, but it landed only one year ago. Before that, the only
option was to write on the ppp fd (btw, that was the channel fd, not the
unit, sorry).

> And I'd still maintain that the intended design is that control
> protocols are handled by the user portion, while network layer protocols
> are connected in the kernel.

Absolutely, I was just pointing out that the kernel doesn't enforce
this design and therefore implementations sometimes ignore it.

Anyway, I don't see any problem with refusing to send packets smaller
than 2 bytes. Hence my acked-by.

