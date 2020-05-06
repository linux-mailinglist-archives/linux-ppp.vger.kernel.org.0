Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE001C6DA6
	for <lists+linux-ppp@lfdr.de>; Wed,  6 May 2020 11:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729013AbgEFJxA (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 6 May 2020 05:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728640AbgEFJw7 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 6 May 2020 05:52:59 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF09C061A0F
        for <linux-ppp@vger.kernel.org>; Wed,  6 May 2020 02:52:59 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id g2so610751vsb.4
        for <linux-ppp@vger.kernel.org>; Wed, 06 May 2020 02:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wURHhe5FcrV1fsAFCPZZNuPJkJD7RjBIOk9K/rTXMEE=;
        b=DC55kRxgTGGzwmf/Zd71yM7c0xQuE5GxNXPOWLO7QyXETxSVMdjLK1il2mMnEity/h
         zbvM43W7WahZJGUD0awZ1QFjvejn2FBr0WdcX7izGnYqzai/cg0oOb7o6IgQQgOhFHxt
         lK2dVOfMx8wMbCmASp7QDd44qxBrMOljHb0lvPGKlhfpCazST5qG57ZhAAv/M30C7ucZ
         NAgcHPeXKWGRrwWmzUWA6a0Sahtcqs26uTv2fa5Cn/1Z8wobbqL+l9+NsW6LTu2WTHBB
         bk58nfYp1fTzy5WvFBNS+SsS0Vr2B1tcvz/F35QdiSSzu/hkSCQgoilApVCnLqkGbbC/
         HIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wURHhe5FcrV1fsAFCPZZNuPJkJD7RjBIOk9K/rTXMEE=;
        b=qGxqTB+Ko/nUBuYnP+PF6FDNOuPlMwlnF6TVAi/WSlnUV38zYKeB9xFIgBn5lVRind
         yWfnbP0XdzGZ1p7nuu5iZSUWWZCny+rh4yht6/QS88gxPabrHnHVJk8Qps8xFOq/deGq
         JB6lcpf58kGodGUBrxpIo9pK2BkNju+mj+BmGmabDrWcPlpdKuCTcjCIHAed2kvOkvbq
         Z66QshNzBAfrR6UqG1tIouWnBHWA8ptcSoYxXG+P5MxQl5lGy1fZPuEL0dh0aU0nrdOq
         107HdsSjVJKVZ2bupKutqb5Jx95MP63TRbXVkxG4bcT2wprMUEikKH8xF+pqhl+V4pCG
         H1vw==
X-Gm-Message-State: AGi0PuaTm1707jlVQKjaNkPWkswZtKhW9meH1e1JI+eR/bXbTTm/b27m
        QiNQhv9JCJQD8h6R1To8JGPQK4x8Cb5uQultEwEsAIn5wUM=
X-Google-Smtp-Source: APiQypL97QK8atLc/sGuqPtVQGUrEhM2Jq7BOug0So/lI+UDNMhRu9cADuMQHjnWFBzarps06ljxBtUqNjjqIGqoAWM=
X-Received: by 2002:a67:eb17:: with SMTP id a23mr6874372vso.111.1588758778456;
 Wed, 06 May 2020 02:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <CAPJ9Yc8eDBsGtFy_juZ3Z6biKKD4-JoNg0icv4otHK=o66aBZw@mail.gmail.com>
 <20200504130149.GB27585@pc-3.home> <CAPJ9Yc_kvqAD5d1XJGQmzVC5d8_HXtp5aH-4OSyqBXDLu1Na8g@mail.gmail.com>
 <20200504181159.GA7717@pc-3.home>
In-Reply-To: <20200504181159.GA7717@pc-3.home>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Wed, 6 May 2020 11:52:48 +0200
Message-ID: <CAPJ9Yc-a4ax_RgYLJT71ukkcPasz+z2dU6bm9yiE+k664JhNqA@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     Guillaume Nault <gnault@redhat.com>
Cc:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Mon, 4 May 2020 at 20:12, Guillaume Nault <gnault@redhat.com> wrote:
>
> On Mon, May 04, 2020 at 06:36:48PM +0200, David Bala=C5=BEic wrote:
> > On Mon, 4 May 2020 at 15:01, Guillaume Nault <gnault@redhat.com> wrote:
> > > You can use "%pM" for printing MAC addresses. Also, it'd be interesti=
ng
> > > to have information about promisc mode:
> > >   "dev %s, flags: %#x, promiscuity %u",
> > >   dev->name, dev->flags, dev->promiscuity,
> >
>
> > I'll report later values printed when a stray PADT appears.
> >
> Okay, but please keep printing the destination MAC address of the
> packet. I was providing the flags/promiscuity string just to get extra
> information, not to replace your original log.

This was logged now:

(all at May  6 05:34:50 2020 UTC)
pppoe_disc_rcv PADT received, sid=3D1, SRC: a4:7b:2c:9e:c7:44, DST:
44:4e:6d:fd:c7:39
pppoe_disc_rcv PADT received, own hw addr: c4:XX:XX:XX:XX:ed
      dev eth1.3902, flags: 0x1003, promiscuity 0
pppoe_disc_rcv PADT received, not four our address, ignoring

(the last line is from my fix, the connection is now not dropped when
the PADT is not for us; works fine, my connection stays up and
working)

I'll clean up and post the patch later.

Regards,
David
