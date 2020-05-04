Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45ED11C3AC2
	for <lists+linux-ppp@lfdr.de>; Mon,  4 May 2020 15:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgEDNB4 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 4 May 2020 09:01:56 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37537 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726351AbgEDNB4 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 4 May 2020 09:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588597315;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8vREnIFwavQ34wMDJjtzJxxj/Z+SEP8F2WQecfHHSLI=;
        b=HyzKDqLx4SevlmHgTPqs0+qil7DHr0UolGFfshTgW1Afowpb5QxunUoRYGEz1ZtdthC5yB
        6kOUpniNGhuFljG4jCMfRDyFCeMYHFAejCWhMkc5wYdBTeHnKjhh/XYqejTDZ18s2kN8mo
        XaBelEuKz/nm5Xua+c3MmrHrKMIWEwU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-mcdTXQUTO_CsJmCU8VoZYw-1; Mon, 04 May 2020 09:01:53 -0400
X-MC-Unique: mcdTXQUTO_CsJmCU8VoZYw-1
Received: by mail-wr1-f69.google.com with SMTP id v17so5877982wrq.8
        for <linux-ppp@vger.kernel.org>; Mon, 04 May 2020 06:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8vREnIFwavQ34wMDJjtzJxxj/Z+SEP8F2WQecfHHSLI=;
        b=dYx+n5ClSTsbTaPBB1nOzVu5aE3ad34L7yuTaftTf94JZr9sTis1HcQI+CN1IlOJtT
         EUBQ73IdX/DVmtvk2e3PFo2u7QBMaHtfprCdX2iICbIgpb6Y1O3rvS9jZepzDU2W6j89
         DtTi8Rq5ocs1BbfZlifX5gJ2SORUQcaZlhA444pufTRs5IIeZloUsqCXYjeq21eoPIy1
         HSfsuhJyKwE3Z64+IDMqRW5u0Tpd3EEVt/71jEpEEczYRaAKI5v0pj3IkBsZoBbOoZGq
         x2ylfcTypcTOmrXHp9wrALZIiLiRSYsdyA6XWNlsKfMaNku0S1C74ZnfjCfuMYfPQrmD
         7C3w==
X-Gm-Message-State: AGi0PuY+cZUJvtpp+jbtB/5TBzMaGX8P6uNhvWAXzzrqcfcxjXdX1So4
        XFo3ZQpXBQdA2ybN3PgoIrYBUoKUEE4jlO2rT0vnpVtxIv9Ct2qfEVlYj2km35zus7R9gprsMRC
        c9mXFbPDzvmf/SCd7AUxZ
X-Received: by 2002:adf:e80c:: with SMTP id o12mr17737985wrm.337.1588597312771;
        Mon, 04 May 2020 06:01:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypLvdEsfRUCXTM1XdAilfAxn7Yzj1dDCPFTb/LJhU7mbXmyANDcUZgVL+He5xV+bmdZRk0HpUA==
X-Received: by 2002:adf:e80c:: with SMTP id o12mr17737946wrm.337.1588597312481;
        Mon, 04 May 2020 06:01:52 -0700 (PDT)
Received: from pc-3.home (2a01cb0585138800b113760e11343d15.ipv6.abo.wanadoo.fr. [2a01:cb05:8513:8800:b113:760e:1134:3d15])
        by smtp.gmail.com with ESMTPSA id z1sm12818512wmf.15.2020.05.04.06.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 06:01:51 -0700 (PDT)
Date:   Mon, 4 May 2020 15:01:49 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     David =?utf-8?Q?Bala=C5=BEic?= <xerces9@gmail.com>
Cc:     linux-ppp@vger.kernel.org
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-ID: <20200504130149.GB27585@pc-3.home>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <CAPJ9Yc8eDBsGtFy_juZ3Z6biKKD4-JoNg0icv4otHK=o66aBZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPJ9Yc8eDBsGtFy_juZ3Z6biKKD4-JoNg0icv4otHK=o66aBZw@mail.gmail.com>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Sun, May 03, 2020 at 12:31:51PM +0200, David Balažic wrote:
> On Wed, 22 Apr 2020 at 19:45, David Balažic <xerces9@gmail.com> wrote:
> >
> > Hi!
> >
> > I have a router running openwrt connected to a GPON ONT, running a
> > PPPoE connection (hw details below).
> >
> > The problem is, that after some random time one to 20 hours, the
> > connection breaks. Then in about a minute it reconnects (successfully,
> > each time).
> 
> Mystery solved.
> 
> I added a debug output to kernel pppoe.c:
> 
> pr_info("pppoe: pppoe_disc_rcv /my patch/  PADT received, sid=%d, SRC:
> %02x:%02x:%02x:%02x:%02x:%02x, DST: %02x:%02x:%02x:%02x:%02x:%02x\n",
> ph->sid,
> eth_hdr(skb)->h_source[0],
> eth_hdr(skb)->h_source[1],
> eth_hdr(skb)->h_source[2],
> eth_hdr(skb)->h_source[3],
> eth_hdr(skb)->h_source[4],
> eth_hdr(skb)->h_source[5],
> eth_hdr(skb)->h_dest[0],
> eth_hdr(skb)->h_dest[1],
> eth_hdr(skb)->h_dest[2],
> eth_hdr(skb)->h_dest[3],
> eth_hdr(skb)->h_dest[4],
> eth_hdr(skb)->h_dest[5]
> );
>
You can use "%pM" for printing MAC addresses. Also, it'd be interesting
to have information about promisc mode:
  "dev %s, flags: %#x, promiscuity %u",
  dev->name, dev->flags, dev->promiscuity,

> When the problem happens, it prints:
> 
> pppoe: pppoe_disc_rcv /my patch/  PADT received, sid=1, SRC:
> a4:7b:2c:9e:c7:44, DST: 44:4e:6d:fd:c7:39
> 
> My HWaddr is c4:xxxxxx:ed
> 
> After that, the pppoe module closes the connection.
> 
> So the problem was as already suspected, that pppoe does not properly
> check if the received PADT packet belongs to its ppp session.
> 
Given the logs you posted previously, it looks like the frame was
accepted because your interface was in promiscuous mode.

> I'll patch it up soon (if someone does not beat me to it).
> 
Please verify that the problem still happens when the device is _not_
in promisc mode.

> Regards,
> David
> 

