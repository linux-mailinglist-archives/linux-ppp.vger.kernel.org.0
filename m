Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF7571C756A
	for <lists+linux-ppp@lfdr.de>; Wed,  6 May 2020 17:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729746AbgEFPyP (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 6 May 2020 11:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729624AbgEFPyO (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 6 May 2020 11:54:14 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985CBC061A0F
        for <linux-ppp@vger.kernel.org>; Wed,  6 May 2020 08:54:14 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id w188so792580vkf.0
        for <linux-ppp@vger.kernel.org>; Wed, 06 May 2020 08:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JkKISj+BU5VrnlxpBrSZkKLxz2oCCFItB+6Xx756rfs=;
        b=IXAzRegrokkB8G67uGNf4IijLo/XSy50fkKJANjAkdzbi4zR3B5xF3hRLcmVY3y5s1
         HcuJ2IYwcLeQbMdu981Jd7G8N9JbflgXUOag55HNJJrCQfzfnDDD0RclOWeX1AxKXgSr
         vecmnIf9j8HobDirWSfV1RRqNtDbcLx8UOc+2iBOvBfFyc/OKgRsVo4eWva88o1i+6pd
         G6GkdEKPQyas/O1/T+1jqvqeLuLNp9wnQbSwo906ld2II/CV1G2KaOYMcdrdW6JwQUEY
         hqwe4QoDMbdhp3F1GS9FAlOUH4B1GitbaeARtKoV7OS/O2HGVjV8pDtm4mDs9dRvnKQS
         3BYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JkKISj+BU5VrnlxpBrSZkKLxz2oCCFItB+6Xx756rfs=;
        b=LQTJaDcRgMocHFoQ1Shtz4ztbbdtS/QUqJkqPmoAGdooqCsIGI1qDitZfXiiOjIb1g
         u6lZTHuHHg+GDR/1VvhTmQ5JkWO9UqTxa3f1ANZ0NWD4YZo/Yzmfj3C0uKllOTeCVHfZ
         9xz3lxcQuColBROX0g2RYvzKhTcz8O6p8B1JuDOc8WX0voMcpcRHgENAWq0VCWVOdCB9
         iNivYfmMR5L46Hi7UGup/MwlxTmD73w9hd98RcLPeoGWVk8Q53NyaY1vV/oK4BhAJ1fY
         i6PKsIzT1y8duDBB2GuYjAnMzYAaDu0+pa8j/YLyGYGCNTZKoG4ebYh6rhxnPlrL2CRx
         7Ang==
X-Gm-Message-State: AGi0PubbhBM5BimLQOVJa2Nr7ip+v5/HJM3rNZm2nSokSlvNax8NNFB1
        M26K5Mm4wJP88ARRZ7sg8hHLGAT66CXJA7lIYkJikSSjsLI=
X-Google-Smtp-Source: APiQypKHTu64BUz1fnQCBBk1dsqd8+jtJPVWsAQuZ+QKWnm0MKYjIO/BQQNODiWyyYys5w6aZSWbliSd6ZKsnEP0agk=
X-Received: by 2002:a1f:3485:: with SMTP id b127mr7449288vka.69.1588780453749;
 Wed, 06 May 2020 08:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <CAPJ9Yc8eDBsGtFy_juZ3Z6biKKD4-JoNg0icv4otHK=o66aBZw@mail.gmail.com>
 <20200504130149.GB27585@pc-3.home> <CAPJ9Yc_kvqAD5d1XJGQmzVC5d8_HXtp5aH-4OSyqBXDLu1Na8g@mail.gmail.com>
 <20200504181159.GA7717@pc-3.home> <CAPJ9Yc8KxAHuw-PsF2uJuW+Ec5HNzhVqVR7yQgrWRwUWeT=ekA@mail.gmail.com>
 <20200506150210.GB21453@pc-3.home>
In-Reply-To: <20200506150210.GB21453@pc-3.home>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Wed, 6 May 2020 17:54:02 +0200
Message-ID: <CAPJ9Yc8pQ+1D=kNJT0OxTMWUqw7U30uMoFUr1vekA9tmkm2UhQ@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     Guillaume Nault <gnault@redhat.com>
Cc:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Wed, 6 May 2020 at 17:02, Guillaume Nault <gnault@redhat.com> wrote:
>
> On Mon, May 04, 2020 at 08:43:26PM +0200, David Bala=C5=BEic wrote:
> > On Mon, 4 May 2020 at 20:12, Guillaume Nault <gnault@redhat.com> wrote:
> > >
> > > Also, what's the driver of your NIC (ethtool -i eth1)?
> >
> > # ethtool  -i eth1
> > driver: ag71xx

This seems to be a driver from the openwrt project :
https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dtree;f=3Dtarget/linux/=
ar71xx/files/drivers/net/ethernet/atheros/ag71xx;h=3D3ced45e853aca454e8f745=
a686834ea1cce259f2;hb=3D33732f4a9c17921b782167a0dcaba9703d4e6753
(hopefully still readable)

The official kernel has a driver for this hardware since kernel 5.3.x
(and not before).
(linux-x.y.z/drivers/net/ethernet/atheros/ag71xx.c)

Maybe that one is better and openwrt will use it eventually.
