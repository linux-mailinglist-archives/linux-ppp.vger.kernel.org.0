Return-Path: <linux-ppp+bounces-91-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21937978B9E
	for <lists+linux-ppp@lfdr.de>; Sat, 14 Sep 2024 01:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 549881C22B4A
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Sep 2024 23:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1142018A6CB;
	Fri, 13 Sep 2024 23:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sandelman.ca header.i=@sandelman.ca header.b="agVf+oDU"
X-Original-To: linux-ppp@vger.kernel.org
Received: from relay.sandelman.ca (relay.cooperix.net [176.58.120.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4503F189538
	for <linux-ppp@vger.kernel.org>; Fri, 13 Sep 2024 23:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.58.120.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726268590; cv=none; b=fmIwOs3l2N545DVz1VKoz2w1vRULHYnPdWobO0+mi3+DWW6O35qqdmarDv3YWkkC0aWNuHZy9CfcKhgYye2pi74idBkaBbPRRqlEtSanxRrLBh7d2tBpVmIDAxfQ6JFSY/OqGzsOTltM5CinG3goNW9pmJDYdCeCeb5f3y3iGSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726268590; c=relaxed/simple;
	bh=+5JoAZnXNoJrypJvNLNS/gwaVQe/qGR4nhcjaAeSXhA=;
	h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:Message-ID; b=NXtE755md3CbRtX4ujzEOsES3zOtaL2E06Hjtn/ebR9l9/mKdGBTbisZDYDQqxZzv0TLw8V7/6B++8/I98eBQSCXR1yrJ+9lLtx1rIJHCMXhamRlEcNzuzehH0n1O9D4N6zkA+F879XAbOtcxLJtwgJ1uMNFGygidFDnaubYzkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sandelman.ca; spf=pass smtp.mailfrom=sandelman.ca; dkim=pass (2048-bit key) header.d=sandelman.ca header.i=@sandelman.ca header.b=agVf+oDU; arc=none smtp.client-ip=176.58.120.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sandelman.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sandelman.ca
Authentication-Results: relay.sandelman.ca;
	dkim=pass (2048-bit key; secure) header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha256 header.s=dyas header.b=agVf+oDU;
	dkim-atps=neutral
Received: from dyas.sandelman.ca (unknown [207.112.12.21])
	by relay.sandelman.ca (Postfix) with ESMTPS id 824FB1F483;
	Fri, 13 Sep 2024 23:00:04 +0000 (UTC)
Received: by dyas.sandelman.ca (Postfix, from userid 1000)
	id 94041AB67D; Fri, 13 Sep 2024 19:03:01 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sandelman.ca; s=dyas;
	t=1726268581; bh=+5JoAZnXNoJrypJvNLNS/gwaVQe/qGR4nhcjaAeSXhA=;
	h=From:To:cc:Subject:In-reply-to:References:Date:From;
	b=agVf+oDUqPBy5pLO4huLl1LWHTFybx38CjKhJ7YIHRzq46iyULFf27NkCOeqrXDO2
	 a5QTmbHRRHgdxp+3X9wU8hWCIBRdzpJG5NinYcHSBSqUWOg3wxaxFVLDJ1VogjOoGW
	 VzfULcXBrQBNp2idUN1sj932Y0w1MAWMeecARX0O2OI3IA+4ADJrffhmYUKSKmOKyM
	 8oT4pfzgqWqkZLd5NEEYhr3HNETnsxkLeRTXAS7usEnz2rtlN2UEg4Vl5lpnFwBaMD
	 UpDiAweAgyaKorMmGCErT3xyfujN4U7WXJM1acuZpVwkfrkpU63s2VJEW02JJYhE1p
	 Pi81nQQmyYLsA==
Received: from dyas (localhost [127.0.0.1])
	by dyas.sandelman.ca (Postfix) with ESMTP id 92297AB676;
	Fri, 13 Sep 2024 19:03:01 -0400 (EDT)
From: Michael Richardson <mcr+ietf@sandelman.ca>
To: Devesh Chipade <devesh@in-unison.com>
cc: Paul Mackerras <paulus@ozlabs.org>, linux-ppp@vger.kernel.org
Subject: Re: PPP Modem Hangup
In-reply-to: <CAPKvdWeC2AHc0eqieJAFXCaayyoU4zOSsGkDwDtK-xpDycYwsQ@mail.gmail.com>
References: <CAPKvdWd3rGxir3MEKrcfdjD4NfOQpCttv3yFPXY=Q35-8cs2Tw@mail.gmail.com> <358952.1725971979@dyas> <CAPKvdWdXozAW6DTtXpFix9ZYOQ956AMTqMCHhrGEX6BixA8AKw@mail.gmail.com> <377699.1725992617@dyas> <CAPKvdWcQH207rUofzgHYvCa6_ULs5dWxEvRbqmw5+PeYY5QYqg@mail.gmail.com> <ZuDb6r9xLIku_vxd@cleo.paulus.ozlabs.org> <CAPKvdWdwWCuXVn9rs7xW-wiwxZV6wf4XUF4MKt23oOPJnif3oA@mail.gmail.com> <CAPKvdWf=Ey-XFvsF=bsZPgsE-Jgf5abspukPWCGh-oR9GSQWEw@mail.gmail.com> <539828.1726250442@dyas> <CAPKvdWcdck2Q0dc0TOntM4QPmD2LrizxvQsigO6kO2OQBsOqhQ@mail.gmail.com> <CAPKvdWeC2AHc0eqieJAFXCaayyoU4zOSsGkDwDtK-xpDycYwsQ@mail.gmail.com>
Comments: In-reply-to Devesh Chipade <devesh@in-unison.com>
   message dated "Fri, 13 Sep 2024 13:33:53 -0700."
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.3
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 13 Sep 2024 19:03:01 -0400
Message-ID: <550821.1726268581@dyas>

--=-=-=
Content-Type: text/plain


Devesh Chipade <devesh@in-unison.com> wrote:
    > On analyzing the logs further, I noticed that I can ping only from AOSP
    > target device to Ubuntu Machine and not the other way around.

    >> 11:29:02.068203 IP Devesh > 10.0.0.2: ICMP echo request, id 56351, seq
    >> 5744, length 64 11:29:02.394650 IP 10.0.0.2 > Devesh: ICMP echo
        >> request, id 32, seq 5882, length 64 11:29:02.394673 IP Devesh >
    >> 10.0.0.2: ICMP echo reply, id 32, seq 5882, length 64 11:29:02.490505

Looks like it works that way.

    >> cooked v1), snapshot length 262144 bytes 11:27:47.371173 IP 10.0.0.1 >
    >> 10.0.0.2: ICMP echo reply, id 32, seq 5969, length 64 11:27:47.865949
    >> IP 10.0.0.1 > 10.0.0.2: ICMP echo request, id 56351, seq 5830, length

And the other way too.


--
Michael Richardson <mcr+IETF@sandelman.ca>, Sandelman Software Works
 -= IPv6 IoT consulting =-                      *I*LIKE*TRAINS*




--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEERK+9HEcJHTJ9UqTMlUzhVv38QpAFAmbkxKUACgkQlUzhVv38
QpCz+Af/VDftczcdzpZsQRsHagQf4gonVSoNy6rPj095VGqmI5N0Qazrj/PacJJF
X23RclxraWQkt/z3gnGGvniFD5Dw2HECiW4BKoWuYEdWzeYKMn3OWMc3kFzO5tx1
7mpj+JrP/QuPJBQ6UhEBHATSTcPuuzo5akUDJMMZO3GWgXBSnoUkDAd7OZ7pK/mk
613mSi1bXpWUIylBx29gZtwI2YK92Z/CEGoACEBshY5c3V3g18LqmWWDhA7iqnln
kNb3s3Uc/dt3kNqNcMBuvf36EXXTg1C/ElpBeIZ+0fNHl7afSKBPi+dssSIkORbb
AsMmLGVk8DqNfYQcmTjNlakHr9QnEA==
=Qhzu
-----END PGP SIGNATURE-----
--=-=-=--

