Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25B891B9513
	for <lists+linux-ppp@lfdr.de>; Mon, 27 Apr 2020 04:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgD0COV (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 26 Apr 2020 22:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726084AbgD0COV (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 26 Apr 2020 22:14:21 -0400
Received: from tuna.sandelman.ca (tuna.sandelman.ca [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98FF8C061A0F
        for <linux-ppp@vger.kernel.org>; Sun, 26 Apr 2020 19:14:20 -0700 (PDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
        by tuna.sandelman.ca (Postfix) with ESMTP id 01DD93897D;
        Sun, 26 Apr 2020 22:12:19 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
        by sandelman.ca (Postfix) with ESMTP id 2E95A9F7;
        Sun, 26 Apr 2020 22:14:11 -0400 (EDT)
From:   Michael Richardson <mcr@sandelman.ca>
To:     =?us-ascii?Q?=3D=3FUTF-8=3FQ=3FDavid=5FBala=3DC5=3DBEic=3F=3D?= 
        <xerces9@gmail.com>
cc:     linux-ppp@vger.kernel.org
Subject: Re: PPPoE Modem hangup after random time - how to debug?
In-Reply-To: <CAPJ9Yc8AQZnATT07zUC0397vSGCuuh8STyQRbdBk5LLPp3Xfyg@mail.gmail.com>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com> <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com> <21061.1587602497@localhost> <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com> <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com> <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com> <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com> <7689.1587657698@localhost> <CAPJ9Yc9rdbwd0OTcJhmuqG_r6qPfYKwiScLOxiwe41_ye_PNGw@mail.gmail.com> <CAPJ9Yc9uuOKk=fh3Ke7riuZN2JgB2Ma3F2Njy69_6nms1kC=bQ@mail.gmail.com> <CAPJ9Yc_iOxyDzrL9cs_ERSEjnVttYgk4JFqhO7T=yg03420LMA@mail.gmail.com> <29906.1587865115@localhost> <CAPJ9Yc-Tj+pLJ_vfLuERUi-2oGadeaWTJSkDFNw0rLoqMCmL3Q@mail.gmail.com> <CAPJ9Yc8AQZnATT07zUC0397vSGCuuh8STyQRbdBk5LLPp3Xfyg@mail.gmail.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 25.1.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;<'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Date:   Sun, 26 Apr 2020 22:14:11 -0400
Message-ID: <5466.1587953651@localhost>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


David Bala=C5=BEic <xerces9@gmail.com> wrote:
    > Sun Apr 26 17:34:57 2020 daemon.debug pppd[20289]: sent [IPV6CP
    > ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
    > Sun Apr 26 17:35:00 2020 daemon.debug pppd[20289]: sent [IPV6CP
    > ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
    > Sun Apr 26 17:35:03 2020 daemon.debug pppd[20289]: sent [IPV6CP
    > ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
    > Sun Apr 26 17:35:06 2020 daemon.debug pppd[20289]: sent [IPV6CP
    > ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
    > Sun Apr 26 17:35:09 2020 daemon.warn pppd[20289]: IPV6CP: timeout
    > sending Config-Requests

Could this be the reason for the hangup?
pppd gets tired of no IPv6, decides it should hangup?

    > The strange part is in the tcpdump there is a PADT sent to an
    > "unknown" MAC and my pppd responds. At least that is how I see it.

    > You think NOT putting the interface into promiscuous mode (done by
    > tcpdump) would prevent this?
    > Anyway, now I startted tcpdump with the -p option:  tcpdump -e -v -p
    > -i eth1 vlan 3902 and pppoed

It could be that promisc mode (no -p) means that the PADT makes something
break, different than what you are investigating.  -p avoid promisc mode, so
would avoid seeing that packet.

You mention in another thread that you were trying to do DHCPv6 on a
different (non-PPPoE) interface.  I don't see how that would matter unless
the failure caused netifd to decide to retry it all.

It seems that you ought to try the noipv6 option to pppd.


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

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl6mP/IACgkQgItw+93Q
3WUQAwgAi6hPqP63bW32GDO7qhjCkFt+BkOJLWdszSB5OBO5NzVYCNpbCIYn6qKk
/CNsSYAFfcSUVkeOSanWCGkcTdxWB5dbdRee6bhJ1aptHOqgW+fDk3L+uP9yE6b0
PMsYW2G71h6V34l0arXLGCTTKjm3bfQwZ8V54t0Zah3RZt6YVMvNVa35BPm+aeu0
/OznEodI/wKznq4wCc/qJT28MqV1NLkIs3ekiWXyd/svjDYpHyfIEaxrhsvHYex4
B3ecZA3SrtoVkeoRhiobPGmfHpBwh/Azhx3GLV8+uMjYJNxwYKdz7vNiwhBbH3/Y
X0Z9ab/q3MYufK0XGp9tz1FsvdWssQ==
=4h/b
-----END PGP SIGNATURE-----
--=-=-=--
