Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F5331AEB7
	for <lists+linux-ppp@lfdr.de>; Sun, 14 Feb 2021 03:06:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbhBNCFs (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sat, 13 Feb 2021 21:05:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhBNCFs (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sat, 13 Feb 2021 21:05:48 -0500
X-Greylist: delayed 448 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 13 Feb 2021 18:05:08 PST
Received: from tuna.sandelman.ca (tuna.sandelman.ca [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35841C061574
        for <linux-ppp@vger.kernel.org>; Sat, 13 Feb 2021 18:05:08 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by tuna.sandelman.ca (Postfix) with ESMTP id ECF8738A47;
        Sat, 13 Feb 2021 21:01:07 -0500 (EST)
Received: from tuna.sandelman.ca ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id reDqK_dTtI8R; Sat, 13 Feb 2021 21:01:06 -0500 (EST)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
        by tuna.sandelman.ca (Postfix) with ESMTP id E33D638A3E;
        Sat, 13 Feb 2021 21:01:06 -0500 (EST)
Received: from localhost (localhost [IPv6:::1])
        by sandelman.ca (Postfix) with ESMTP id 8814C670;
        Sat, 13 Feb 2021 20:57:35 -0500 (EST)
From:   Michael Richardson <mcr@sandelman.ca>
To:     Nicholas Humfrey <njh@aelius.com>
cc:     linux-ppp@vger.kernel.org
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from remote peer
In-Reply-To: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;<'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Date:   Sat, 13 Feb 2021 20:57:35 -0500
Message-ID: <15154.1613267855@localhost>
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

--=-=-=
Content-Type: text/plain


Nicholas Humfrey <njh@aelius.com> wrote:
    > I have two pppd (v2.4.7) instances running, talking to each over over a
    > serial port link. But I can't work out how to get the 'client' pppd to
    > accept the link-local IPv6 interface identifier provided by the
    > 'server' pppd. I am trying to use static addresses so I know the
    > link-local IP address of the remote peer.

So, basically you want to have ppp running with unnumbered links, and then
maybe you do routing over that?

I am not surprised that this hasn't been tested, and that there are bugs.
Mostly, IP6CP assigns random IPv6-LL.

If your goal is routing over unnumbered links, you don't really need the
destination IPv6-LL to route to, it's enough to "dev ppp0" or whatever.

If you just want a stable identifier at each end, then put it on lo a /128
alias, and put a route to it.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAmAog48ACgkQgItw+93Q
3WXelwgAjJUBanvsiWaBqccF6wyaiV+yHJtiEQufFeALbkvTfgKfAiRHuNvKuvkm
mXQ53mvSXgVLbZSEJg37sdVKBobNEZTx5ITWy6V7o8pacJQ+rAomBAF9aBiM/Mdm
KExM3KSaTCJBMNBZg7x6gAwj/4TKXsZm/FNoXkQhAZnipd9iu6hncJSceaSAE281
dyBOIOEViKrXLtahH4JpzDtXU080136TrAnM5qUNRHCYSUqdQ15w1qk4m9+nMF4M
BkWi8UvAhOKu1oumdFyn1HKHrIGpU5vssmJNPTM2QTHFxLdLZXVmJUkGrx6T/07N
3ATuAsVXiW8PE9zk5QHRYhw7Rpv3ew==
=2P7t
-----END PGP SIGNATURE-----
--=-=-=--
