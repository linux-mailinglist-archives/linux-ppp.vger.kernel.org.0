Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 530611B8ADA
	for <lists+linux-ppp@lfdr.de>; Sun, 26 Apr 2020 03:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgDZBih (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sat, 25 Apr 2020 21:38:37 -0400
Received: from tuna.sandelman.ca ([209.87.249.19]:58757 "EHLO
        tuna.sandelman.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgDZBih (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sat, 25 Apr 2020 21:38:37 -0400
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
        by tuna.sandelman.ca (Postfix) with ESMTP id 7C8783897D;
        Sat, 25 Apr 2020 21:36:45 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
        by sandelman.ca (Postfix) with ESMTP id C95B091E;
        Sat, 25 Apr 2020 21:38:35 -0400 (EDT)
From:   Michael Richardson <mcr@sandelman.ca>
To:     =?us-ascii?Q?=3D=3FUTF-8=3FQ=3FDavid=5FBala=3DC5=3DBEic=3F=3D?= 
        <xerces9@gmail.com>
cc:     linux-ppp@vger.kernel.org
Subject: Re: PPPoE Modem hangup after random time - how to debug?
In-Reply-To: <CAPJ9Yc_iOxyDzrL9cs_ERSEjnVttYgk4JFqhO7T=yg03420LMA@mail.gmail.com>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com> <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com> <21061.1587602497@localhost> <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com> <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com> <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com> <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com> <7689.1587657698@localhost> <CAPJ9Yc9rdbwd0OTcJhmuqG_r6qPfYKwiScLOxiwe41_ye_PNGw@mail.gmail.com> <CAPJ9Yc9uuOKk=fh3Ke7riuZN2JgB2Ma3F2Njy69_6nms1kC=bQ@mail.gmail.com> <CAPJ9Yc_iOxyDzrL9cs_ERSEjnVttYgk4JFqhO7T=yg03420LMA@mail.gmail.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 25.1.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;<'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Date:   Sat, 25 Apr 2020 21:38:35 -0400
Message-ID: <29906.1587865115@localhost>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


David Bala=C5=BEic <xerces9@gmail.com> wrote:
    >> OK, more data:
    >> I started tcpdump with the -e option as suggested on openwrt forum:
    >> tcpdump -e -v -i eth1.3902 pppoed
    >>
    >> on disconnect, this was logged (times are UTC):
    >>
    >>
    >> tcpdump: listening on eth1.3902, link-type EN10MB (Ethernet), capture
    >> size 262144 bytes
    >> 18:23:09.204991 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
    >> (oui Unknown), ethertype PPPoE D (0x8863), length 97: PPPoE PADO
    >> [Service-Name] [AC-Name "SIMB_TABOR_BNG1"] [Host-Uniq
    >> 0x44************long_number******************************AA]
    >> [AC-Cookie ".5b************v"]

    > Isnt this strange? The dst addr is not my router or any other known.
    > Also the Host-Uniq value is different.
    > As if is traffic meant for someone else.

oh, I understand.
thank you for noting this.
So, it's as if you are getting a PPPoE message for someone else, and when
that happens, the interface is dying.
Is it always the same ethernet address?

Do you have ebtables?  Could you arrange to filter out packets like that?
That would point to there being some kernel bug.

Clearly, your ISP has some other bug that they are sending stuff down the
wrong pipe, but that could just be hash collisions that they assume are
"harmless".

=2D-
]               Never tell me the odds!                 | ipv6 mesh network=
s [
]   Michael Richardson, Sandelman Software Works        |    IoT architect =
  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails  =
  [




--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl6k5hsACgkQgItw+93Q
3WV5FggAvnEIBKIhJC3Cl1igLcJICFlQJ8U/cJhoIGjiOaBlUo5ZY91DOyaVrtBM
sv8BG4t7Tev2Zi55NRZHHyaDYYnVtkelUidq+152PYZyA0sLNGJw9fjzU7SIIyfe
/wfvhUxf3jmmLn5gJtLLM1DvswnLWWS/vp3+d64IdNsg8opiR9NZql3vM+x2DGcA
kdpx9ueu12YuNUCEMBELd4PaPCwGzyrQivWs1vcEuaVeIRHP5HXI8uEKFk+iuO5K
w66X/WT5DwSv+cvDV0yPyBvgMOO5cJ0wH4aPVw5EFIjpocGb8FxSzGQi7yfo6eAb
eV41cigtbSGOYBUAZdo7y8H/xe/Y0Q==
=q1HO
-----END PGP SIGNATURE-----
--=-=-=--
