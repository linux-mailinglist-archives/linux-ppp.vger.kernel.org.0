Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1FD1B5175
	for <lists+linux-ppp@lfdr.de>; Thu, 23 Apr 2020 02:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbgDWAll (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 22 Apr 2020 20:41:41 -0400
Received: from tuna.sandelman.ca ([209.87.249.19]:37222 "EHLO
        tuna.sandelman.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgDWAll (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 22 Apr 2020 20:41:41 -0400
X-Greylist: delayed 17430 seconds by postgrey-1.27 at vger.kernel.org; Wed, 22 Apr 2020 20:41:41 EDT
Received: from sandelman.ca (obiwan.sandelman.ca [209.87.249.21])
        by tuna.sandelman.ca (Postfix) with ESMTP id 7899C3897A;
        Wed, 22 Apr 2020 20:39:49 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
        by sandelman.ca (Postfix) with ESMTP id 2055E39;
        Wed, 22 Apr 2020 20:41:37 -0400 (EDT)
From:   Michael Richardson <mcr@sandelman.ca>
To:     James Carlson <carlsonj@workingcode.com>
cc:     =?us-ascii?Q?=3D=3FUTF-8=3FQ=3FDavid=5FBala=3Dc5=3Dbeic=3F=3D?= 
        <xerces9@gmail.com>, linux-ppp@vger.kernel.org
Subject: Re: PPPoE Modem hangup after random time - how to debug?
In-Reply-To: <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com> <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 25.1.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;<'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Date:   Wed, 22 Apr 2020 20:41:37 -0400
Message-ID: <21061.1587602497@localhost>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

--=-=-=
Content-Type: text/plain


James Carlson <carlsonj@workingcode.com> wrote:
    > If it isn't, then possibly it's something else.  I think that the last
    > time I looked at the PPPoE implementation on Linux it was a bit hokey --
    > it ran PPP over a pty pair and then decoded the framing in user space
    > and wrote it back out over Ethernet using PPPoE.  I hope it's not still
    > like that, as I haven't looked at it in years, but it may well be.  An
    > internal error in that logic could also cause a "hangup" message,
    > although hopefully along with some kind of system log about a core file
    > as well.

No, that's not how PPPoE has worked for at least 15 years.
There is a PPPoE socket and the IP packets do not leave the kernel.
I have built BMS systems that handle thousands of sessions on 8-core
systems.

We had to move to 64-bit kernels because we needed such a lot of control
structures that we'd run out 32-bit kernel memory long before we ran out of
CPU.  (this was for oversubscribed rather slow last miles, not VDSL2)

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [




--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl6g5EAACgkQgItw+93Q
3WVulAf7B+CL2RPgi3d4UyD/tZvpPvMeI/GLtN4NK6P12edRmWnY66D6PXD0sIPO
KDiLs435Hn23TOw5mCdlUkyUFB4HtgqPhgB8tQRwSN6bKEZniQMvmgpe9el03bgz
vU22ZwFt449Wj+BP6W0IxmutUzocB42PIuRx50kBwk2rKO3G1HZbg8LAz60ArOaS
gdwn6my7dG1amm1zPyU0QrYAkKmxJaZSE73DKSolXTd4Nnad4ihkPJVkfs9w6QtY
u4t8tnXuqHxmq7XFrKQmKpYnyyHPCMg1W5d7Pvl3IIBs7D7s8UFxeqzErnuquYgY
sdRwKnCzkx85A61a1WviDezvurGKYg==
=acYZ
-----END PGP SIGNATURE-----
--=-=-=--
