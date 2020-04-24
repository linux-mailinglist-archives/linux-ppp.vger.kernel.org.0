Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 299751B7AD4
	for <lists+linux-ppp@lfdr.de>; Fri, 24 Apr 2020 17:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbgDXPzH (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 24 Apr 2020 11:55:07 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51142 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727972AbgDXPzH (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 24 Apr 2020 11:55:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587743706;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Fxgb+k6dgDenIw86tROuFj/38uu7tUiE/lHni5yXwB0=;
        b=QG3Y9SetujUdyY6Nlo1uOe6FeBjT+HmqUlAK+H3Ul4VETfF5L6yEZqafMx91eAaew+cVEb
        Mh5ixIharmnThL+FMGmfzDOaNKKmnDb3oPoiq4/jH5R/ytAaqaF+bWTBpVpDXYHP+zrgvF
        JnLxvxWImrbz/77KfM3Z4pIDyhqP6OE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-4H0nYugNNSKOIV20hX0zpw-1; Fri, 24 Apr 2020 11:55:04 -0400
X-MC-Unique: 4H0nYugNNSKOIV20hX0zpw-1
Received: by mail-wm1-f72.google.com with SMTP id v185so4427717wmg.0
        for <linux-ppp@vger.kernel.org>; Fri, 24 Apr 2020 08:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Fxgb+k6dgDenIw86tROuFj/38uu7tUiE/lHni5yXwB0=;
        b=n/NseC/BO2g0oVXdCIsTp02TqteecEs5HWPx5mOpo8XHQsdbHoyXDSd33/NQ58r33o
         LLNnffEb70LWBFYNuVYVai+iz9ZcCy5rqqvOaUYv9OFi55uP4TwCUSzS6Rb/82ZyUC/y
         TJQUtSjeiDRCtLZMHan+7T5kGZ5UA7LOF3YGW0A0aqW3FTNBMaRIVyXohHiLiejlmowp
         7v3pcqpEWkVHkJuqprMswluEkOjmLXtnL/B6V/bAB5nC3RqSjpEhEZAIJjsEoSxvXc7N
         1q4AABj6zIM52epBoVqLCgmKGeLnsex3h9aeyNxmLidd2VhCCJJj681kL9q5Cm9o8XHF
         eokg==
X-Gm-Message-State: AGi0PubJYQxJ8Acv5S9rZC+r5AejtcKv+siL20bcWUYOHzQPoXVUQvpk
        ENhpKuRrEYolv4Sj/pXHannN15ccG1k3H1jnmF1OlpQzwLzslsG9W8BcHoAAHx2NsuSHaxvEaqh
        eaRFIfte5wwPtnT9bATlv
X-Received: by 2002:a5d:6188:: with SMTP id j8mr11479585wru.119.1587743702825;
        Fri, 24 Apr 2020 08:55:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypKkZmoOdiAEIFaImaiVXcXjjApGbuglDtVTNaQXjkIb62KdJUZT22ypNWTInlOYOm/SVoB7GA==
X-Received: by 2002:a5d:6188:: with SMTP id j8mr11479548wru.119.1587743702429;
        Fri, 24 Apr 2020 08:55:02 -0700 (PDT)
Received: from pc-3.home (2a01cb0585138800b113760e11343d15.ipv6.abo.wanadoo.fr. [2a01:cb05:8513:8800:b113:760e:1134:3d15])
        by smtp.gmail.com with ESMTPSA id i25sm3219437wml.43.2020.04.24.08.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 08:55:01 -0700 (PDT)
Date:   Fri, 24 Apr 2020 17:54:59 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     David =?utf-8?Q?Bala=C5=BEic?= <xerces9@gmail.com>
Cc:     linux-ppp@vger.kernel.org
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-ID: <20200424155459.GB21114@pc-3.home>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com>
 <21061.1587602497@localhost>
 <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com>
 <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
 <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
 <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Thu, Apr 23, 2020 at 02:13:14PM +0200, David Balažic wrote:
> Oh, i'm "lucky", shortly after starting "tcpdump -i eth1.3902 pppoed"
> there was another disconnect:
> 
> Thu Apr 23 11:44:13 2020 daemon.notice pppd[10756]: Modem hangup
> 
> tcpdump output:
> 
> listening on eth1.3902, link-type EN10MB (Ethernet), capture size 262144 bytes
> 11:44:09.749322 PPPoE PADO [Service-Name] [AC-Name "SIMB_TABOR_BNG1"]
> [Host-Uniq 0x44************long_number******************************AA]
> [AC-Cookie ".5b************v"]
> 11:44:09.754297 PPPoE PADS [ses 0x1] [Service-Name] [Host-Uniq
> 0x44*******************long_number*********************************AA]
> 11:44:13.115312 PPPoE PADT [ses 0x1]
> 11:44:13.126422 PPPoE PADT [ses 0x1] [Host-Uniq 0x00002A04] [AC-Cookie
> 0xED****************************75]
> tcpdump: pcap_loop: The interface went down
> 4 packets captured
> 22 packets received by filter
> 0 packets dropped by kernel
> 
> 
> The ifconfig packet counter for the VLAN interface eth1.3902 is reset,
> compare to values in quested message below, this is th eoutpu a few
> minutes after the reconnect:
> 
> eth1      Link encap:Ethernet  HWaddr C4:3D:C7:90:CE:ED
>           inet6 addr: fe80::c63d:c7ff:fe90:ceed/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:24193753 errors:0 dropped:0 overruns:3 frame:0
>           TX packets:12513809 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:4171215264 (3.8 GiB)  TX bytes:2485973 (2.3 MiB)
>           Interrupt:5
> 
> eth1.3902 Link encap:Ethernet  HWaddr C4:3D:C7:90:CE:ED
>           inet6 addr: fe80::c63d:c7ff:fe90:ceed/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:255930 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:42015 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:126494373 (120.6 MiB)  TX bytes:25853728 (24.6 MiB)
> 
You can monitor the evolution of you network devices with rtmon:
$ rtmon file ./some/file.log link

Then read it with ip monitor:
$ ip monitor file ./some/file.log

That should tell if eth1.3902 is ever passed down or even deleted.

