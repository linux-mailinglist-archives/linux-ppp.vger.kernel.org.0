Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582BD1C72BE
	for <lists+linux-ppp@lfdr.de>; Wed,  6 May 2020 16:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728937AbgEFO01 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 6 May 2020 10:26:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58991 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728854AbgEFO01 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 6 May 2020 10:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588775185;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZAivIsmNo4KXeynKNoRu4A1+o8GQT6D9drsnKTUOiis=;
        b=bTQ+I3m2tvRt1Ci9S56n9rhK6SQDOFYZ0D0hjkOn/+5jt4KP9z4g7J60uOCPPe1umwVX1u
        9CUvkOWRjtP4Jj7mpsg7DRyqojRCG6+QKp7DLqdgADv+0inVoLRX+lOzFkThNALEbkjWH/
        Ureb/aXi0VeODhNTOYTVkjkEYA7L9xk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-ljP-P0o7PzG_oMCYQxyNBg-1; Wed, 06 May 2020 10:26:24 -0400
X-MC-Unique: ljP-P0o7PzG_oMCYQxyNBg-1
Received: by mail-wr1-f72.google.com with SMTP id v17so1395971wrq.8
        for <linux-ppp@vger.kernel.org>; Wed, 06 May 2020 07:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZAivIsmNo4KXeynKNoRu4A1+o8GQT6D9drsnKTUOiis=;
        b=FQQbUKegjDj4etgqHEKhp+uzSFdS3vP0zUKIvUVI65pjZecoYCAztbDu9YLUpTcd5l
         U9xoJ+vkh9SNa+sd3tSowpzdkLzmmuEMv3EY5iFsYGnicJ595x2ZHyWEoN6Bs6ynLOy/
         hSADInhk84P8WRvjAcWLEc/7NKWstQYRlHi1JZDE58r9OqjXNd447zOD2+/7iIEkyP7e
         J3SL4gy9rXGDCT/Me/wdrdjE14RRIuDdFElLqjH4v0No1cjfJYynie3SieqBPMBJXZD3
         5TBANoJjEgRsYB4+X2RBftpnvv+/20v2+wIfrc4/8Ic5JLBcTA3ovm20cylsLvXeQl3L
         qQxg==
X-Gm-Message-State: AGi0PuYNG9WIWzOu1vpKYlVE3TsbFFEGiDIDVKS0Jb2HdDRXTEkMz+R/
        4F5tEQscZPM1Evk5tw0l8euPQom7KZZbKIQYGgXgtau7RcyGBoQFwuL3hFVbpRuXNAAKd11+KHH
        uergeQBZUh/RaF3uhGhYD
X-Received: by 2002:adf:ef48:: with SMTP id c8mr9438846wrp.140.1588775182452;
        Wed, 06 May 2020 07:26:22 -0700 (PDT)
X-Google-Smtp-Source: APiQypJC7vcScKx3OISCN2pWKMjUOlS1ksXJ5akL91o0NBIEgkZ/q6kcG6LErY6XI+ZJDXhFkNVz0A==
X-Received: by 2002:adf:ef48:: with SMTP id c8mr9438833wrp.140.1588775182254;
        Wed, 06 May 2020 07:26:22 -0700 (PDT)
Received: from pc-3.home (2a01cb0585138800b113760e11343d15.ipv6.abo.wanadoo.fr. [2a01:cb05:8513:8800:b113:760e:1134:3d15])
        by smtp.gmail.com with ESMTPSA id y63sm3447887wmg.21.2020.05.06.07.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 07:26:21 -0700 (PDT)
Date:   Wed, 6 May 2020 16:26:19 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     David =?utf-8?Q?Bala=C5=BEic?= <xerces9@gmail.com>
Cc:     linux-ppp@vger.kernel.org
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-ID: <20200506142619.GA21453@pc-3.home>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <CAPJ9Yc8eDBsGtFy_juZ3Z6biKKD4-JoNg0icv4otHK=o66aBZw@mail.gmail.com>
 <20200504130149.GB27585@pc-3.home>
 <CAPJ9Yc_kvqAD5d1XJGQmzVC5d8_HXtp5aH-4OSyqBXDLu1Na8g@mail.gmail.com>
 <20200504181159.GA7717@pc-3.home>
 <CAPJ9Yc-a4ax_RgYLJT71ukkcPasz+z2dU6bm9yiE+k664JhNqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPJ9Yc-a4ax_RgYLJT71ukkcPasz+z2dU6bm9yiE+k664JhNqA@mail.gmail.com>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Wed, May 06, 2020 at 11:52:48AM +0200, David Balažic wrote:
> On Mon, 4 May 2020 at 20:12, Guillaume Nault <gnault@redhat.com> wrote:
> >
> > On Mon, May 04, 2020 at 06:36:48PM +0200, David Balažic wrote:
> > > On Mon, 4 May 2020 at 15:01, Guillaume Nault <gnault@redhat.com> wrote:
> > > > You can use "%pM" for printing MAC addresses. Also, it'd be interesting
> > > > to have information about promisc mode:
> > > >   "dev %s, flags: %#x, promiscuity %u",
> > > >   dev->name, dev->flags, dev->promiscuity,
> > >
> >
> > > I'll report later values printed when a stray PADT appears.
> > >
> > Okay, but please keep printing the destination MAC address of the
> > packet. I was providing the flags/promiscuity string just to get extra
> > information, not to replace your original log.
> 
> This was logged now:
> 
> (all at May  6 05:34:50 2020 UTC)
> pppoe_disc_rcv PADT received, sid=1, SRC: a4:7b:2c:9e:c7:44, DST:
> 44:4e:6d:fd:c7:39
> pppoe_disc_rcv PADT received, own hw addr: c4:XX:XX:XX:XX:ed
>       dev eth1.3902, flags: 0x1003, promiscuity 0
> pppoe_disc_rcv PADT received, not four our address, ignoring
> 
> (the last line is from my fix, the connection is now not dropped when
> the PADT is not for us; works fine, my connection stays up and
> working)
> 
Looks like a more fundamental issue. This frame shouldn't have been
accepted in the first place. Can you also print the packet class
("... pkt_type %u", ..., skb->pkt_type)?

Testing the destination MAC here is likely to just paper over the
problem.

> I'll clean up and post the patch later.
> 
> Regards,
> David
> 

