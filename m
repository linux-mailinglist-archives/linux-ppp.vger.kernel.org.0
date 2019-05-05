Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8BCF141B3
	for <lists+linux-ppp@lfdr.de>; Sun,  5 May 2019 20:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727694AbfEESDh (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 5 May 2019 14:03:37 -0400
Received: from attila.bofh.it ([85.94.204.146]:49920 "EHLO attila.bofh.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727615AbfEESDg (ORCPT <rfc822;linux-ppp@vger.kernel.org>);
        Sun, 5 May 2019 14:03:36 -0400
X-Greylist: delayed 385 seconds by postgrey-1.27 at vger.kernel.org; Sun, 05 May 2019 14:03:35 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.it; 
 i=@linux.it; q=dns/txt; s=attila; t=1557079029; h=date : 
 cc : subject : message-id : references : mime-version : 
 content-type : in-reply-to : from : from; 
 bh=cCZPHdXO3Vk7RDmoN30AhSl8BPTns5D2QTbNOGf9EIc=; 
 b=N7FNi4b09xVXeD+zl+DR33ETx0pQByIyob6rU5GLjdzs7ULu64y4Dsn7
 Bv8wTHZCbzwBg9rXbz6f2RwFbALTwaSgmN4f4eo9gEVp8260/m9IpCLrka
 wkikzx1egR7vOeRy2YHmAd6zfGz0Yz+2GuSJPUslFR6+fLqcID+lCRzyA=
Received: by attila.bofh.it (Postfix, from userid 10)
        id 08052129D4E; Sun,  5 May 2019 19:57:08 +0200 (CEST)
Received: by bongo.bofh.it (Postfix, from userid 1000)
        id E3178841694; Sun,  5 May 2019 19:57:01 +0200 (CEST)
Date:   Sun, 5 May 2019 19:57:01 +0200
Cc:     linux-ppp@vger.kernel.org
Subject: Re: PPPOE on Arm
Message-ID: <20190505175701.GA27447@bongo.bofh.it>
References: <20190504164853.4736-1-mcroce@redhat.com>
 <5CCF1A2D.30808@bfs.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
In-Reply-To: <5CCF1A2D.30808@bfs.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
From:   Marco d'Itri <md@Linux.IT>
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 05, walter harms <wharms@bfs.de> wrote:

> I was using PPPOE on a raspi and it terminated with "invalid value",
Which raspi model and which distribution, exactly?

> while the same setup on x86_64 worked fine.
Is your pppd configuration unusual in any way?

> is anyone working with PPPOE ?
I use pppd and the PPPoE plugin from Debian 9 on a 32 bit armv7l system=20
(i.e. armhf) and it works fine.

--=20
ciao,
Marco

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGBsIcS5ipP0URKfyK/WlwSLE96QFAlzPI+0ACgkQK/WlwSLE
96SDQQwAw3gbfmO0CcBmaOHwumMkVIp87wMgUqJfQqMnpWLjxok8wPCxQ96TzFrH
lvj2le9r+mhGbxOncN1n8eIdBiLQrflE4VBNpwx+2da6HNLXEMm6JahWIW7R2XGE
nbsgH/FTMtS2YsxFKot7fdVuxCWxLj0LbR1ySf3vZ4IfTH563MCc1tl7FkpJdzA+
wJY56uVa7ia5bJmaoP6NhLuioj2PpKmRcZPadf/QglpCrMuEZ2at8wFiX4dgpgJQ
YjiTIbUEgyrSB1Kyrp5pIjERdmxqYvNfF0qrNOXGrFanHIVJNfFJ1MNasj6Dvd5n
az4h5HPqAMobtHwbXcKct3j5DjX6Yk0UurAuq52jWd9hmJGcFptzTvT4qzOBrV0Z
7kiu+l19kuWXtSDa9QNNFT4UFk8i+77zzyZ6ZQ155INP25rhC3UfAqi12a2GWfuf
9j/U5hu3OTmF4kGgTk4gcqa+UoxSI1+WZmdphPDrFKbJasthyXfnGDC4d/AcEKd8
bZPip5Gw
=BN7h
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
