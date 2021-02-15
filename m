Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8943D31B5A6
	for <lists+linux-ppp@lfdr.de>; Mon, 15 Feb 2021 08:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhBOHb2 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 15 Feb 2021 02:31:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhBOHb0 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 15 Feb 2021 02:31:26 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F76BC061574
        for <linux-ppp@vger.kernel.org>; Sun, 14 Feb 2021 23:30:46 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id h7so144797wmq.0
        for <linux-ppp@vger.kernel.org>; Sun, 14 Feb 2021 23:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ps78Zx/SHUNMZ885xjtz+klmVcEwNh1mCiwqUQLhFpI=;
        b=Y1WDRaFHkfKVEtd4DEpOzplDBmZ9y9wo5Iy1ItSDabDNsvIqOPaQyhr7547ptSZyVr
         ye7RACt/lu6Kf3cTz2Lpk0kOO9rgKU7Q0ijpjMk9Kh/76QFXDjVe0UU5NZ966HKhFFXe
         r3XoVcrlktFRg+iKo/mYLHu4UToYKbJy1bpcO/EBHW8rJzi0zXkSCO2IqUVgma73CE1X
         IagwtqoTWxTZgb2icoYWRSBiTQcPPLJaRo94wK+iZUp/1c2W0S6wAjVZVVxhecQJULOR
         k2ZdufHWbNkHyuiJkpGqmyr34vvc+/7L3/VLZ5wu8pGeomBPgW2b4N/Ams4LMRJs+Nhd
         CDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ps78Zx/SHUNMZ885xjtz+klmVcEwNh1mCiwqUQLhFpI=;
        b=nkhkEirNVPQINWzTBQ8Ohokyzx/JkTQxfB506JJ3eriGklP+XrISrsbQPVe/X0Is4a
         50fwqlW6QW6KcZBifqCJCaI8ugcH1kfg7NVjCYboxfBtGgyLSkHvwKAD8BtVBVRoKLcN
         m5B3nkHwQsrxL6vYqfpW2jPNG6zklN2MZumpFhTBfSOrXTSmjQeh6qcg/8lhkye4FXbj
         Mx0lys3aBsSCZi+CgvJQyP8qwQ4rOVz0j8NCyoHyWCu9L7OMtvZJw6VYAW4XIeYrFQFe
         Xeh43OpzoM/wQas+NuWmWDrDO4l5zcX4uqDVFWZuc4/MgfUYoTjtfsb5qbBo38jL/w00
         pU0Q==
X-Gm-Message-State: AOAM530ixXUGEpjNIrxMal3jc+hvsixTvXj0+zGn/d458KI+A1bZaGkI
        M39Qietoa6wqKQVB6J2B4DYbSe1DqCo=
X-Google-Smtp-Source: ABdhPJy3lRzL/7vLuB6xgttAT6u407pHunpixeglLWNCUqkfUfEY9OYWsBTY4ZDklC/ABZMZNbkIkw==
X-Received: by 2002:a1c:408a:: with SMTP id n132mr12818925wma.86.1613374245015;
        Sun, 14 Feb 2021 23:30:45 -0800 (PST)
Received: from w530 ([87.166.147.84])
        by smtp.gmail.com with ESMTPSA id v11sm22915367wrr.3.2021.02.14.23.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 23:30:44 -0800 (PST)
Date:   Mon, 15 Feb 2021 08:30:26 +0100
From:   =?UTF-8?B?QmrDtnJu?= Kirchner <bjkit89@gmail.com>
To:     James Carlson <carlsonj@workingcode.com>
Cc:     linux-ppp@vger.kernel.org
Subject: Re: Problem with M2M PPP connection
Message-ID: <20210215083026.189b4bc1@w530>
In-Reply-To: <1a006a06-5155-74a9-21be-fb6fcfc891e1@workingcode.com>
References: <20210210101740.1bae8b93@w530>
        <1a006a06-5155-74a9-21be-fb6fcfc891e1@workingcode.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hello James,

thank you for your tips. You were right, I could dramatically shorten
the configuration. It let to the same behaviour. I had another LTE IoT
modem available (this time a Quectel BG96 chip) and I tested the same,
shortened, configuration with this modem. This time it worked out of
the box and I can ping in both directions the relevant hosts over the
PPP connection.

So, maybe it is something specific with the BC66 chip or even the Olimex
device hosting the BC66 chip. Unfortunately Quectel's documentation on
PPP with the BC66 chip only describes the configuration on Windows
hosts. In this document they describe lots of specific configuration
changes (like switching off different authentication methods, etc.).
That's why my first configuration was so convoluted, because I tried
to adapt the Windows specific options to PPP options.


Again, thank you for your help and support, it really helped.=20
I consider switching modems now...

Regards

Bj=C3=B6rn

Am Wed, 10 Feb 2021 12:22:57 -0500
schrieb James Carlson <carlsonj@workingcode.com>:

> On 2021-02-10 04:17, Bj=C3=B6rn Kirchner wrote:
> > Dear list readers,
> >=20
> > I am stuck with the following problem and I hope you can give me
> > some hints or advice. It looks to me like a configuration or
> > routing error. =20
>=20
> A broad hint first: less configuration is always better.  Not only
> have the developers chosen the defaults very carefully to make them
> work in the widest range of cases, but the protocol itself is
> designed to negotiate the available options in order to settle on the
> correct link parameters.  A giant configuration file either says
> "this set-up is really brittle" or possibly "wow, the peer I'm forced
> to talk to is flaming garbage."
>=20
> I'm not saying you're necessarily doing anything wrong here, but that
> laundry list is at least suspicious, and I'd certainly wonder why it
> is set up that way.
>=20
> A summary analysis: other than three questionable options
> ("nodefaultroute", "noaccomp", "nopcomp") and what appears to be a
> broken serial interface ("nocdtrcts", "local"), I don't see anything
> in particular going wrong at the PPP level.  The problems, whatever
> they may be, are elsewhere.
>=20
> > I have an Olimex NB-IoT-DevKit with a Quectel BC66 LTE-NB1 chip
> > which =20
>=20
> Ah, the legacy of GPRS.  Fortunately, I haven't kept up with this
> "NB-IoS" stuff, but if it's from the same folks who designed that
> earlier gear, then there are some things to be aware of here:
>=20
> - The actual authentication and IP address assignment is done through
>   some other protocol, not PPP, and is typically done during the LCP
>   negotiation, and completely behind your back.
>=20
> - Any failures that occur during that hidden work are almost always
>   completely invisible.  If it's a bad user name or password, the peer
>   usually assigns a bogus IP address and just fails to provide any
>   service.  There are no error messages.  No way to know, at least via
>   PPP messages.
>=20
> > and the P-t-P=E2=80=99s address. My problem is, that I cannot reach any=
thing
> > via that connection. I cannot ping the P-t-P, I cannot ping other
> > addresses. The ISP=E2=80=99s support confirmed that PPP was a viable op=
tion
> > to =20
>=20
> That's typically what's expected when the authentication phase fails
> or when the client is otherwise "unauthorized."
>=20
> I strongly suspect that the problem is with the "AT" commands in the
> chat script.  I have no way of verifying those.
>=20
> On to some (overly detailed) notes about your PPP configuration:
>=20
> > refuse-chap             # (from /etc/ppp/peers/quectel-ppp)
> > refuse-mschap           # (from /etc/ppp/peers/quectel-ppp)
> > refuse-mschap-v2                # (from /etc/ppp/peers/quectel-ppp)
> > refuse-eap              # (from /etc/ppp/peers/quectel-ppp) =20
>=20
> These really aren't necessary.  If you don't have username/passphrase
> pairs configured into the /etc/ppp/*-secrets files for this peer, then
> pppd will automatically refuse those protocols.  And the peer isn't
> even asking for authentication from us ... so these do nothing.
>=20
> > user *          # (from /etc/ppp/peers/quectel-ppp)
> > password ??????         # (from /etc/ppp/peers/quectel-ppp) =20
>=20
> These are apparently useless.  The peer isn't asking for
> authentication at all via PPP.  (Though, to be fair, this could be
> because the chat script is setting things up incorrectly.  Maybe it
> would ask if the "modem" were set up correctly ... ?)
>=20
> > remotename 3gppp                #
> > (from /etc/ppp/peers/quectel-ppp) =20
>=20
> If you're not doing authentication, then this may be useless.
>=20
> > record /tmp/quectel.record              #
> > (from /etc/ppp/peers/quectel-ppp) =20
>=20
> Not sure why you'd want that.  It's really an internal debug option
> intended for PPP developers.  I suggest leaving it out as it can
> certainly complicate things.  It forces the pppd daemon to run on top
> of a pty pair and write the "raw" AHDLC data to a file for later
> analysis.
>=20
> > nocdtrcts               # (from /etc/ppp/peers/quectel-ppp)
> > local           # (from /etc/ppp/peers/quectel-ppp) =20
>=20
> Those two are a real shame.  This serial device really has no modem
> control lines at all?  Even if you get this working, it's possible
> that it won't work very well at all.
>=20
> "nocdtrcts" means "no hardware flow control exists."  This means that
> CTS/RTS aren't used.  And if one side or the other encounters an
> overflow, then it'll just drop bytes silently, causing packets to be
> dropped.  With enough of that, the link will be utterly unusable.
>=20
> If the device you're using really is that horrible, then I'd check to
> see if it can do at least XON/XOFF ("xonxoff") software flow control.
> Something is better than nothing at all.
>=20
> "local" means "no modem on/off hook signaling."  This means that
> DTR/DCD aren't used.  That means that if the other end hangs up for
> some reason, then you'll get no notice at all.  Bytes will just stop
> flowing mysteriously.
>=20
> If that's really the case, then I *strongly* recommend using the
> "lcp-echo-failure" and "lcp-echo-interval" options.  This allows PPP's
> LCP layer to detect link failure.  Otherwise, you're shooting packets
> into the dark.
>=20
> > noaccomp                # (from /etc/ppp/peers/quectel-ppp)
> > nopcomp         # (from /etc/ppp/peers/quectel-ppp) =20
>=20
> These two appear to be incorrect.  The peer is asking for these two
> common options, and you've configured it intentionally to refuse them.
> I don't see why anyone would do that.  Note that these are *NOT*
> related to data compression in any way.  The "compression" they're
> referring to here is just omitting some constant bytes from the PPP
> header.
>=20
> ACFC gets rid of the static HDLC "FF 03" at the start of every PPP
> frame.  PFC gets rid of the extra "00" byte for network protocols less
> than 0100 -- this means that IP shows up as "21" instead of "00 21".
> Having both options on (the default) means saving 3 bytes per packet.
>=20
> Unless you know for sure that you're operating over an HDLC link using
> multi-point addressing, or that the peer has horrible bugs in its
> basic PPP implementation, turning ACFC off likely makes little sense.
>=20
> See RFC 1661 sections 6.5 and 6.6 for details.
>=20
> > novj            # (from /etc/ppp/peers/quectel-ppp)
> > novjccomp               # (from /etc/ppp/peers/quectel-ppp) =20
>=20
> The peer isn't offering VJ header compression, so these likely don't
> do much.  Note that "vjccomp" is dependent on "vj", so saying "novj"
> alone is sufficient to turn off both.
>=20
> > nodefaultroute          # (from /etc/ppp/peers/quectel-ppp) =20
>=20
> This is a little weird.  Are you sure?  I thought this was supposed to
> be your connection to the Internet.  If so, then you certainly want to
> have pppd establish a default route for you.  (Doing so manually is at
> best error-prone.)
>=20
> Just make sure you remove the system's default route (if any) before
> starting pppd.
>=20
> > noremoteip              # (from /etc/ppp/peers/quectel-ppp) =20
>=20
> This appears to be unnecessary, but may be harmless.  The peer is
> offering an IP address for itself, so the option doesn't come into
> play.
>=20
> > noccp           # (from /etc/ppp/peers/quectel-ppp)
> > nobsdcomp               # (from /etc/ppp/peers/quectel-ppp)
> > nopredictor1            # (from /etc/ppp/peers/quectel-ppp) =20
>=20
> "noccp" is sufficient.  The rest of those protocols are dependent on
> CCP negotiation.  You can't get there if CCP is turned off.
>=20
> > Output from ifconfig ppp0:
> > root@raspberrypi:~# ifconfig ppp0
> > ppp0: flags=3D4305<UP,POINTOPOINT,RUNNING,NOARP,MULTICAST>  mtu 1500
> >         inet 10.43.124.1  netmask 255.255.255.255  destination
> > 10.0.0.1 ppp  txqueuelen 3  (Point-to-Point Protocol)
> >         RX packets 3  bytes 30 (30.0 B)
> >         RX errors 0  dropped 0  overruns 0  frame 0
> >         TX packets 3  bytes 30 (30.0 B)
> >         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0 =20
>=20
> Nothing looks wrong there.
>=20
> > If you need more information I am eager to provide those. Do you
> > have any suggestions how to be able to receive the hosts on the
> > "other" side? =20
>=20
> I don't know what that means.
>=20
> However, wireshark is an excellent tool to use if you think that
> there's a problem at the network level, rather than just the basic
> connection itself.
>=20

