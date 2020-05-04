Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A907E1C4631
	for <lists+linux-ppp@lfdr.de>; Mon,  4 May 2020 20:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgEDSnk (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 4 May 2020 14:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726756AbgEDSnj (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 4 May 2020 14:43:39 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F080C061A0E
        for <linux-ppp@vger.kernel.org>; Mon,  4 May 2020 11:43:39 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id u12so340184vsq.0
        for <linux-ppp@vger.kernel.org>; Mon, 04 May 2020 11:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=b8HYQUygIlzHvDCeUjs5ljebjxKR3aqM/1s9TOv8VlE=;
        b=QKxThu1F6GjT4k9tNnn+UBp7w9SEfL3aNrB5e9DvX/8TrxIlcxlZWFWw4cRAHfbtVh
         I1FYTIky8Pap12JQ6tsHqNGn4limu33ob4OdJr2LKGvyyb+Nl3fLTL8+cjfMut4Yal74
         gU9zgMTCqa/RGqebstUMW8sFJpvMyF9mWaKE/jJ+HU3wShj7vD39YryncyW3ljmv7eLb
         GYGDc9KZw3i2XPpyBSRARkji1AIywhffT61gyzQxN5cbXkuaDvGHjj5EKw+RzE/OfTyL
         VKS3/nhkx5yOKedH/Y6PNIHjmOnO3f68IjvnhT8+OEmKnRqHO0tvEOWvNkHbdUbiLpST
         YmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=b8HYQUygIlzHvDCeUjs5ljebjxKR3aqM/1s9TOv8VlE=;
        b=UoEng8/QMg4hTYxEKUoS5ZNunUqjxz+klJWzBtH3dVwC1rV+t3nuH+0MgbQH+SHIy+
         B2F2fa1bva0C4j8o9NarjeiDJaoOQYha65mCiaaz7Qp2Os3+TKPFUK1YBMzGNtBdIiWW
         TTdpzYEodoSPxn8klHDa+SKN6yEVQonB5Z2q+YSm0fU40UHXPKj4yZysfh9xZtifdIx5
         cUrEszZ2lTMiNSqghMhKIxpKSMSVtM+0/jzrSwbQXP61doJ48XAEihE2QURF2UAPhZy8
         aLmrpQPJI4xmBf1Ma9J/Gcn6J9BSWJcEg5rDTDaPJ3Rl7ax6PySyMcqT0CpjplTq/JrR
         Jzjg==
X-Gm-Message-State: AGi0Puao5W3WOj7np048FD5vix+cqYcZ7FXG8wJEh/gBLogrxMXQEG0t
        xtXOLSn3lwyE98SzBhYsvpjypoND9ziMWyf9uoBTF2Puaps=
X-Google-Smtp-Source: APiQypITaS8NQpkCKDflC7SBpCpLuVEoJlWwr7xKYCMgQvVOlIQZgC/N+znWFBJL4iOkfzqZOrdlbhaDw33VV+F9StA=
X-Received: by 2002:a67:eb17:: with SMTP id a23mr509494vso.111.1588617818172;
 Mon, 04 May 2020 11:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <CAPJ9Yc8eDBsGtFy_juZ3Z6biKKD4-JoNg0icv4otHK=o66aBZw@mail.gmail.com>
 <20200504130149.GB27585@pc-3.home> <CAPJ9Yc_kvqAD5d1XJGQmzVC5d8_HXtp5aH-4OSyqBXDLu1Na8g@mail.gmail.com>
 <20200504181159.GA7717@pc-3.home>
In-Reply-To: <20200504181159.GA7717@pc-3.home>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Mon, 4 May 2020 20:43:26 +0200
Message-ID: <CAPJ9Yc8KxAHuw-PsF2uJuW+Ec5HNzhVqVR7yQgrWRwUWeT=ekA@mail.gmail.com>
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
> > "ifdown wan" triggers a PADT response from the server, and then this
> > code prints:
> >
> >  dev eth1.3902, flags: 0x1003, promiscuity 0
> >
> I'm not sure what "ifdown wan" is supposed to do. Assuming "wan" is the
> name of your ppp interface (wasn't it "pppoe-wan" in your previous
> logs?) and that ifdown works like on Debian, then it makes sense that
> the peer disconnects the PPPoE session by sending a PADT. At least now
> the device isn't in promisc mode.

Yes, "wan" is the interface alias. ifdown "closes" it... sends a PADT
to the server, server replies with PADT...

> > I'll report later values printed when a stray PADT appears.
> >
> Okay, but please keep printing the destination MAC address of the
> packet. I was providing the flags/promiscuity string just to get extra
> information, not to replace your original log.
>
> Also, what's the driver of your NIC (ethtool -i eth1)?

# ethtool  -i eth1
driver: ag71xx

Regards,
David
