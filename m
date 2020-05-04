Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9731C4511
	for <lists+linux-ppp@lfdr.de>; Mon,  4 May 2020 20:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731469AbgEDSMK (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 4 May 2020 14:12:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40410 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731468AbgEDSMJ (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 4 May 2020 14:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588615928;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0wsqbun106KN59ljecpUqXkLzvbkZ7E3iMXmFvOcSVU=;
        b=GZMHzXuk4xCIWLbOYpTu3pJrMs87XCLv9XBuogyd0eDj4f425L0vylRavUIWJQViD/wauC
        waH6XnVcE2P3NIaVg7leh83Wlryor5RODdt7AKAiKAt6eSCzW/jPH2H03/GQaxm/G7jR6K
        w9QJ1aYF0eRkThaxWBdDsOS4ySglXgg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353--FngNvbPPdaiXru2kwNLQA-1; Mon, 04 May 2020 14:12:03 -0400
X-MC-Unique: -FngNvbPPdaiXru2kwNLQA-1
Received: by mail-wr1-f69.google.com with SMTP id g7so320942wrw.18
        for <linux-ppp@vger.kernel.org>; Mon, 04 May 2020 11:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0wsqbun106KN59ljecpUqXkLzvbkZ7E3iMXmFvOcSVU=;
        b=eOP5jRRmE6+cbgo+yJhf4w9MHiKU5ng5OCzY9M8rxOZ1Mmb0PslqADwXDjcIRSafiP
         1evEBezrkt7DZ/UaF2mnsHLx8vgUC3GRUioclRlRTbQdRz2axw3zgn5BrqxZ4J+r0eph
         L8AtuSqpKTX56g3abS7O7eFLMIMK2ZukOuFzOeJxZCJfSDu5bmSX5qoplvZxQ6h4qaAu
         fHMMcrvJzo6fHRSOPLV1G0+0uzf0PiaXFkBGnwN04/N/SbhewqxURaAi7sCTOA8teVFx
         FfRdNCCjV1haTHBodgkyriCWZxuJUZDty+ELwB5FPuaGBfPFitb+WrzM4K6diuvJNdCz
         jk/g==
X-Gm-Message-State: AGi0PuaOmgt4gCFo5FOIXor3V6wahD51/wiXfdtlRFhYHsXAZuDRqM3v
        2JUZvcbcHO3cV09dSQpu9jaqGTJ8f9ZZTmtygvIrkmH4IJSZXp5M0SAV3Hk4dRhrosgUsuT1xBV
        CGodvMt36HyzskngfHkrD
X-Received: by 2002:adf:edc6:: with SMTP id v6mr602273wro.8.1588615922327;
        Mon, 04 May 2020 11:12:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypK3j5617kWcI2wXJgxqqPvPhbbxVjXLWkzpoLx2OcCVn+nF/0tOmKx9Oanxke0L7RyCMcCwMw==
X-Received: by 2002:adf:edc6:: with SMTP id v6mr602258wro.8.1588615922073;
        Mon, 04 May 2020 11:12:02 -0700 (PDT)
Received: from pc-3.home (2a01cb0585138800b113760e11343d15.ipv6.abo.wanadoo.fr. [2a01:cb05:8513:8800:b113:760e:1134:3d15])
        by smtp.gmail.com with ESMTPSA id n21sm6773688wra.15.2020.05.04.11.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 11:12:01 -0700 (PDT)
Date:   Mon, 4 May 2020 20:11:59 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     David =?utf-8?Q?Bala=C5=BEic?= <xerces9@gmail.com>
Cc:     linux-ppp@vger.kernel.org
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-ID: <20200504181159.GA7717@pc-3.home>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <CAPJ9Yc8eDBsGtFy_juZ3Z6biKKD4-JoNg0icv4otHK=o66aBZw@mail.gmail.com>
 <20200504130149.GB27585@pc-3.home>
 <CAPJ9Yc_kvqAD5d1XJGQmzVC5d8_HXtp5aH-4OSyqBXDLu1Na8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPJ9Yc_kvqAD5d1XJGQmzVC5d8_HXtp5aH-4OSyqBXDLu1Na8g@mail.gmail.com>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Mon, May 04, 2020 at 06:36:48PM +0200, David Balažic wrote:
> On Mon, 4 May 2020 at 15:01, Guillaume Nault <gnault@redhat.com> wrote:
> > You can use "%pM" for printing MAC addresses. Also, it'd be interesting
> > to have information about promisc mode:
> >   "dev %s, flags: %#x, promiscuity %u",
> >   dev->name, dev->flags, dev->promiscuity,
> 
> "ifdown wan" triggers a PADT response from the server, and then this
> code prints:
> 
>  dev eth1.3902, flags: 0x1003, promiscuity 0
> 
I'm not sure what "ifdown wan" is supposed to do. Assuming "wan" is the
name of your ppp interface (wasn't it "pppoe-wan" in your previous
logs?) and that ifdown works like on Debian, then it makes sense that
the peer disconnects the PPPoE session by sending a PADT. At least now
the device isn't in promisc mode.

> I'll report later values printed when a stray PADT appears.
> 
Okay, but please keep printing the destination MAC address of the
packet. I was providing the flags/promiscuity string just to get extra
information, not to replace your original log.

Also, what's the driver of your NIC (ethtool -i eth1)?

> Regards,
> David
> 

