Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 211D81C751A
	for <lists+linux-ppp@lfdr.de>; Wed,  6 May 2020 17:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729436AbgEFPje (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 6 May 2020 11:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgEFPjc (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 6 May 2020 11:39:32 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19AC5C061A0F
        for <linux-ppp@vger.kernel.org>; Wed,  6 May 2020 08:39:32 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id p139so636931vkd.7
        for <linux-ppp@vger.kernel.org>; Wed, 06 May 2020 08:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ofCNQy/qsZolw23gVImzFfWE8WB3u+QHuQ10cKPPW7A=;
        b=eYSasIe9Dh8FXrCPCDgwx8mkOr1B0wwtEyzFBB5NPRqG5el3/sV/MKvfu3KN4XmLMx
         TtZ10rWnbGjtFdJp8m6vlsbgeibatd2ox4+PlfNGcNEWxkLKqgkoFyOmbdkA3IOYrgJ8
         M5j+RWWXO/OGeC4IW7AmMyP9FDIPDWadlQpXn6jCNHFCaeqLkVTGmntznjgXOxArdumL
         KTcDVWGKtYzvzKfXvDKxQDh8rA/zGDlwK0rKt/AK2XhxqJEv6eUdY31Smk0/bb/Cv5j0
         bWfINKkOjfV3tzuU3dESL96lLFAa3wiRaMStxIFW+kU7ojmjlZsNzqk4aookvAEpKjkb
         /0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ofCNQy/qsZolw23gVImzFfWE8WB3u+QHuQ10cKPPW7A=;
        b=UMsdu2NHDeUCX+K9AMWMwXzzdynFbC+htLNa2nE13ePXTNFIdcVJL0njdV33gCicQ3
         j7SNzcBRaf0AOp+to1VqeY/e1yKOFjlBVeeONbBsEDufm7ha/JsgtCxj4NjQPp1b4rVw
         52vM1wSdyAx80pyNCcykNZDHnzvYqA77kG9njwLDInAvVtAC8l/3wIva/sLPQ5U8KFUJ
         zybnnG0TmhPevC60PIBXOwblnQZ9Ld2xaWDttSX9EX6/LKIiNSPgONfeGbkumsWpvYBP
         yhT84XPOnHqSVbHzWyKzp8LU7Qh59+toEWJl2Q56XvMCJLgeNkAn++sRPedizlf82kob
         7dTw==
X-Gm-Message-State: AGi0PuYlGrrFIFVo6gZhmNcV29LT6gJMWWWUWSiUf+PbvVFqEH3aKvud
        Zde3TfNfRcqML2UT9J5I6BId7GwSsCUPXcVqKIGDmfE/h6A=
X-Google-Smtp-Source: APiQypIS5yL5LVymtiCUmZXDzdv7TyzZQ2y4cCdT5Trx4+RaTC6xGQPWCipe9hnMx3q6On2sUs2eUyL25PxmsjMv6xk=
X-Received: by 2002:a1f:9182:: with SMTP id t124mr7496633vkd.38.1588779571157;
 Wed, 06 May 2020 08:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <CAPJ9Yc8eDBsGtFy_juZ3Z6biKKD4-JoNg0icv4otHK=o66aBZw@mail.gmail.com>
 <20200504130149.GB27585@pc-3.home> <CAPJ9Yc_kvqAD5d1XJGQmzVC5d8_HXtp5aH-4OSyqBXDLu1Na8g@mail.gmail.com>
 <20200504181159.GA7717@pc-3.home> <CAPJ9Yc-a4ax_RgYLJT71ukkcPasz+z2dU6bm9yiE+k664JhNqA@mail.gmail.com>
 <20200506142619.GA21453@pc-3.home>
In-Reply-To: <20200506142619.GA21453@pc-3.home>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Wed, 6 May 2020 17:39:20 +0200
Message-ID: <CAPJ9Yc_5UFEo1axHtqhGHmtoEtr3qJ+=SXWvFU1m5+7h6RNn4Q@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     Guillaume Nault <gnault@redhat.com>
Cc:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Wed, 6 May 2020 at 16:26, Guillaume Nault <gnault@redhat.com> wrote:
>
> On Wed, May 06, 2020 at 11:52:48AM +0200, David Bala=C5=BEic wrote:
> > On Mon, 4 May 2020 at 20:12, Guillaume Nault <gnault@redhat.com> wrote:
> > >
> > > On Mon, May 04, 2020 at 06:36:48PM +0200, David Bala=C5=BEic wrote:
> > > > On Mon, 4 May 2020 at 15:01, Guillaume Nault <gnault@redhat.com> wr=
ote:
> > > > > You can use "%pM" for printing MAC addresses. Also, it'd be inter=
esting
> > > > > to have information about promisc mode:
> > > > >   "dev %s, flags: %#x, promiscuity %u",
> > > > >   dev->name, dev->flags, dev->promiscuity,
> > > >
> > >
> > > > I'll report later values printed when a stray PADT appears.
> > > >
> > > Okay, but please keep printing the destination MAC address of the
> > > packet. I was providing the flags/promiscuity string just to get extr=
a
> > > information, not to replace your original log.
> >
> > This was logged now:
> >
> > (all at May  6 05:34:50 2020 UTC)
> > pppoe_disc_rcv PADT received, sid=3D1, SRC: a4:7b:2c:9e:c7:44, DST:
> > 44:4e:6d:fd:c7:39
> > pppoe_disc_rcv PADT received, own hw addr: c4:XX:XX:XX:XX:ed
> >       dev eth1.3902, flags: 0x1003, promiscuity 0
> > pppoe_disc_rcv PADT received, not four our address, ignoring
> >
> > (the last line is from my fix, the connection is now not dropped when
> > the PADT is not for us; works fine, my connection stays up and
> > working)
> >
> Looks like a more fundamental issue. This frame shouldn't have been
> accepted in the first place. Can you also print the packet class
> ("... pkt_type %u", ..., skb->pkt_type)?

After fixing it, the priority of this issue really dropped on my task list.
Maybe someone has a similar hardware and can test?

It is an Atheros AR7161 SoC. (full HW info on the openwrt.org pages,
look for Netgear WNDR3700v2)
