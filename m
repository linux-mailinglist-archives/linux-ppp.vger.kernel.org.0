Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69A2A1B4DCA
	for <lists+linux-ppp@lfdr.de>; Wed, 22 Apr 2020 21:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgDVT5T (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 22 Apr 2020 15:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725779AbgDVT5T (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 22 Apr 2020 15:57:19 -0400
X-Greylist: delayed 368 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 22 Apr 2020 12:57:18 PDT
Received: from tuna.sandelman.ca (tuna.sandelman.ca [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC30C03C1A9
        for <linux-ppp@vger.kernel.org>; Wed, 22 Apr 2020 12:57:18 -0700 (PDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
        by tuna.sandelman.ca (Postfix) with ESMTP id B8D4F3897B;
        Wed, 22 Apr 2020 15:49:16 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
        by sandelman.ca (Postfix) with ESMTP id 655A7D1C;
        Wed, 22 Apr 2020 15:51:04 -0400 (EDT)
From:   Michael Richardson <mcr@sandelman.ca>
To:     =?us-ascii?Q?=3D=3FUTF-8=3FQ=3FDavid=5FBala=3DC5=3DBEic=3F=3D?= 
        <xerces9@gmail.com>
cc:     linux-ppp@vger.kernel.org
Subject: Re: PPPoE Modem hangup after random time - how to debug?
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 25.1.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;<'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Date:   Wed, 22 Apr 2020 15:51:04 -0400
Message-ID: <18466.1587585064@localhost>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

--=-=-=
Content-Type: text/plain


Hi, I found that some PPPoE BMS do not emit IPCP echo responses if there is
also traffic.  Since I have a static IPv4/v6, and there is DNS requests and
script kiddies, there is *ALWAYS* half a megabit/s of traffic, which is
probably atypical for many residential users who get random IPs.
I.e. they have some sort of "lcp-echo-adaptive" going on, but not in a good
way.

I had to force lcp-echo-interval to 0, which was a bit difficult to get right
in the OpenWRT UI.  I had tried to increase echo-failure to 30, but that
didn't help consistently.

The other problem is that Bell Canada only answers PADI's once every five
minutes.  It's total BS.

Modem Hangup would normally be because the DCD signal went down, but on
PPPoE, that can't happen, I think.  I did see that when LCP failed, but I
also had debugging that told me it had failed.  maybe that's just off for
you.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl6goCgACgkQgItw+93Q
3WWdMQf/TzdEgiNnDvlZSBLyg5FnMqzjYNWC2zkVNpYAnhlo4lOdwLa2e/yfD3fT
I80pJQCR6cQFm/jYUPJlm7ZkOwK96M5iH9KO/rkYINIuorDCa+xZ9bizBQ4eyi13
fL7zsds4QNMOwGMyYyEHmeEedkrhDm1XZmbzU7S5AI3rRMTzFBa6LuK1UpxYzTY7
6c2mdQ3rHguSzuWQeYDrIuBMc9M1IpnRzaCVltQmIzn+eyZX1ojU72qRMqoVGoEu
a3zTG7huPcJFY5ntrpmVUb1zgm4GCdRBzYNWWncTClbF3kZ400r+W1gMTQIkqMMZ
UAzdBTEFJ9JAt1GFq/Y7G3mI7dtgvA==
=kPb9
-----END PGP SIGNATURE-----
--=-=-=--
