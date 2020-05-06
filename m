Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97E8F1C7B17
	for <lists+linux-ppp@lfdr.de>; Wed,  6 May 2020 22:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbgEFUU1 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 6 May 2020 16:20:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30640 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727792AbgEFUU0 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 6 May 2020 16:20:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588796424;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lUy35FteHGXPTni1AQP/rakdggUoni+0zji+4tDZVKk=;
        b=QL6VsP+Iu204hD/WKOcv87LT4nmaeVgLNxZsvF0AhEvrEGjAYf9htXUjlATGIXKRr9kzF+
        WTexncmpdjK1JsNNZg/seU9TgEvxqZPzZ3Jyt6VTuuX0bKk2ZiwtqIbgRgeNzeTaMPcWj+
        JPUQaeWNgEZKCUjik3l9cSZbMMbfETQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-R2VV8FitNSmaWX802ukhkQ-1; Wed, 06 May 2020 16:20:23 -0400
X-MC-Unique: R2VV8FitNSmaWX802ukhkQ-1
Received: by mail-wm1-f71.google.com with SMTP id d134so2979647wmd.0
        for <linux-ppp@vger.kernel.org>; Wed, 06 May 2020 13:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lUy35FteHGXPTni1AQP/rakdggUoni+0zji+4tDZVKk=;
        b=BbtmkPCZzd8S2DrIWK/NqEHM+O51T0wyOPECIOUsek9zZZk4Ec7NkbSrOrLwoYXhZL
         txX247m1KxHEVUEmZNruGFZssYsgnsMalbjEr64h3HxhP6J+QdMiENp6cV3tMgxmPV7U
         pV3QKm1/x+BWf0smxX5MdeqUzy/xXMBneHhNUAKweuig0LfVBPKQPAgXgR2YGjHph++V
         ImF87Sf0yEgRcGLL2UqRVDHoKv2N6OEfOceOTt5B9bFW8ejQI3VmjZ8dBoNxGrBhmT4c
         w9eC/3eRsrnT4iuGhbBZg57ly9vsPz+9gFN1Lspy97wnlPImxhsQ4/dFp0aSx0r8VPnc
         AMoQ==
X-Gm-Message-State: AGi0PubcrklZcO8aFZxcQ3pgIu/6HWteapG9OXPbLsOs68e6DxZ8+vBu
        DjmYotc9q1qynYtMul7b0S2/xsPT0ICvX0TUSWqHUXD2yEDNQClmHO5zWgYaMgIVs6U36o7rbJS
        WEw7edaEdXgb1gtUB/pVN
X-Received: by 2002:adf:f282:: with SMTP id k2mr10833136wro.133.1588796421610;
        Wed, 06 May 2020 13:20:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypImpKlJhKM1Gg1QFiAnqOQlKcx9jcjgctNwuIf7jrRYKcBBdi7kUKBGpOjFqDvZHnjHigHzVw==
X-Received: by 2002:adf:f282:: with SMTP id k2mr10833107wro.133.1588796421328;
        Wed, 06 May 2020 13:20:21 -0700 (PDT)
Received: from pc-3.home (2a01cb0585138800b113760e11343d15.ipv6.abo.wanadoo.fr. [2a01:cb05:8513:8800:b113:760e:1134:3d15])
        by smtp.gmail.com with ESMTPSA id a7sm4389245wmj.12.2020.05.06.13.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 13:20:20 -0700 (PDT)
Date:   Wed, 6 May 2020 22:20:18 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     James Carlson <carlsonj@workingcode.com>
Cc:     David =?utf-8?Q?Bala=C5=BEic?= <xerces9@gmail.com>,
        linux-ppp@vger.kernel.org
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-ID: <20200506202018.GA29247@pc-3.home>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <CAPJ9Yc8eDBsGtFy_juZ3Z6biKKD4-JoNg0icv4otHK=o66aBZw@mail.gmail.com>
 <20200504130149.GB27585@pc-3.home>
 <CAPJ9Yc_kvqAD5d1XJGQmzVC5d8_HXtp5aH-4OSyqBXDLu1Na8g@mail.gmail.com>
 <20200504181159.GA7717@pc-3.home>
 <CAPJ9Yc-a4ax_RgYLJT71ukkcPasz+z2dU6bm9yiE+k664JhNqA@mail.gmail.com>
 <20200506142619.GA21453@pc-3.home>
 <b222ca9e-34bd-7a43-e426-3cd0a622edbf@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b222ca9e-34bd-7a43-e426-3cd0a622edbf@workingcode.com>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Wed, May 06, 2020 at 11:15:46AM -0400, James Carlson wrote:
> On 2020-05-06 10:26, Guillaume Nault wrote:
> > On Wed, May 06, 2020 at 11:52:48AM +0200, David Balažic wrote:
> >> (the last line is from my fix, the connection is now not dropped when
> >> the PADT is not for us; works fine, my connection stays up and
> >> working)
> >>
> > Looks like a more fundamental issue. This frame shouldn't have been
> > accepted in the first place. Can you also print the packet class
> > ("... pkt_type %u", ..., skb->pkt_type)?
> > 
> > Testing the destination MAC here is likely to just paper over the
> > problem.
> 
> Having either sketchy (e.g., CRC hash filter based) or just absent
> hardware filtering of unicast addresses isn't an unknown property for
> some Ethernet devices.  Relying on exact match from the underlying
> hardware seems like a bad idea.  (Some, for instance, can either receive
> "all multicast" or can filter using the low N bits of the CRC to index
> into a 2^N-bit hash table, but can't really exclude a unicast packet
> that happens to match the low N bits of a selectively enabled multicast
> address.  See, for example, the PowerQUICC implementation.  But there
> are quite a few that work like this.  It wouldn't surprise me in the
> least that 'ar71xx' [Atheros/Qualcomm?] is like this.)
> 
Yes, but that's just a limitation of the chip. I'm not a driver guy,
but I'd expect the driver to do whatever is need, in software, to fix
such limitations.

> I agree that having to test the MAC address right here is a bit lame and
> that the driver itself ought to assist the hardware in doing the Right
> Thing.
> 
Yes, we shouldn't have to check the destination MAC address in all
ethertype handlers. The Ethernet layer has to do its job.

But looking at the openwrt code, it seems that the driver properly
calls eth_type_trans(). So skb->pkt_type should be correctly set and we
could use it to know if the frame was for us. It'd still be good to
verify that skb->pkt_type == PACKET_OTHERHOST when the original problem
happens.

Testing if ->pkt_type == PACKET_HOST in the PPPoE discovery handler
would be a good thing anyway, to avoid processing packets just because
someone started tcpdump. That might also "fix" David's problem as a
side effect.

> -- 
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
> 

