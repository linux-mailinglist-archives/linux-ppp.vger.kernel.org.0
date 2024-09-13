Return-Path: <linux-ppp+bounces-88-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C78E7978768
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Sep 2024 20:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 718281F24DCF
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Sep 2024 18:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936E0126C01;
	Fri, 13 Sep 2024 18:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sandelman.ca header.i=@sandelman.ca header.b="Oi8dWkb5"
X-Original-To: linux-ppp@vger.kernel.org
Received: from relay.sandelman.ca (relay.cooperix.net [176.58.120.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C9313212A
	for <linux-ppp@vger.kernel.org>; Fri, 13 Sep 2024 18:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.58.120.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726250456; cv=none; b=ZFIv4/EATQIm04Qd3/IO/Fzrb5I8MQVoV84nAd4CBknbeN5L91B1LAh5Ke1JH64sH9sbZe/tEDuCUcC4X2M3zRr7hrthrmX/QN34WnxCnkvk7LTH48bdI2XpEJcwrI4wC57HTWWd0Q40SDyhybLONtq4CDhZ4e8mJ03+w99DW6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726250456; c=relaxed/simple;
	bh=53cXayd5h9AidI8bCu27z6Vs5Mbt3e+XnDmMS0rkGQ0=;
	h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:Message-ID; b=iL9Dcp5cc/RLyPWwm5td9QF5WCVwDV1iDo4pWBhh+7CzdvatOX3cvEVTOX/+h/YZQ7XnHWr24J+55H2fM1eZsV2C6OSbagJxPCbCO+O70Nq8fUp6ijpoLPpZpvX903l9N2Y2YOn2kly/OhgUy1ilezR8pH9SqAgrl7h6k4jJNHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sandelman.ca; spf=pass smtp.mailfrom=sandelman.ca; dkim=pass (2048-bit key) header.d=sandelman.ca header.i=@sandelman.ca header.b=Oi8dWkb5; arc=none smtp.client-ip=176.58.120.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sandelman.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sandelman.ca
Authentication-Results: relay.sandelman.ca;
	dkim=pass (2048-bit key; secure) header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha256 header.s=dyas header.b=Oi8dWkb5;
	dkim-atps=neutral
Received: from dyas.sandelman.ca (unknown [142.169.16.236])
	by relay.sandelman.ca (Postfix) with ESMTPS id EFDF81F483;
	Fri, 13 Sep 2024 17:57:45 +0000 (UTC)
Received: by dyas.sandelman.ca (Postfix, from userid 1000)
	id 30233AB676; Fri, 13 Sep 2024 14:00:42 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sandelman.ca; s=dyas;
	t=1726250442; bh=53cXayd5h9AidI8bCu27z6Vs5Mbt3e+XnDmMS0rkGQ0=;
	h=From:To:cc:Subject:In-reply-to:References:Date:From;
	b=Oi8dWkb5zc09UTTXpO7GIZdjoqPP1m7aIyRoYsl8JlNOOjROftwv6DsahHPIn53MH
	 XCeLbEnwJWJFdvdi12D4fievVbQTQClwjQ4AtnAXWtoo05JVHkc2HIPJ3sFMc7qJUz
	 /Dr/6Xpc1q5Q3sso7LR9MbHNG6DtuNifhnEbPVw43JUJqxS+Bg65RrSRh3T+02hQrE
	 SexVgzBnOAwzaci6WibALusNfSZDr0hpJ/KXmdF3ao7DF4qjKqg/hyLISM2Jlvjquy
	 hFeI/S/UZffocxdUfPsbmj86YZ9vz/6IAYbOp0Hgqbp1qX/ibsNKhCot0fcbp6hrVi
	 V9fR0EXEYiRYQ==
Received: from dyas (localhost [127.0.0.1])
	by dyas.sandelman.ca (Postfix) with ESMTP id 2D5BFAB672;
	Fri, 13 Sep 2024 14:00:42 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Devesh Chipade <devesh@in-unison.com>
cc: Paul Mackerras <paulus@ozlabs.org>, linux-ppp@vger.kernel.org
Subject: Re: PPP Modem Hangup
In-reply-to: <CAPKvdWf=Ey-XFvsF=bsZPgsE-Jgf5abspukPWCGh-oR9GSQWEw@mail.gmail.com>
References: <CAPKvdWd3rGxir3MEKrcfdjD4NfOQpCttv3yFPXY=Q35-8cs2Tw@mail.gmail.com> <358952.1725971979@dyas> <CAPKvdWdXozAW6DTtXpFix9ZYOQ956AMTqMCHhrGEX6BixA8AKw@mail.gmail.com> <377699.1725992617@dyas> <CAPKvdWcQH207rUofzgHYvCa6_ULs5dWxEvRbqmw5+PeYY5QYqg@mail.gmail.com> <ZuDb6r9xLIku_vxd@cleo.paulus.ozlabs.org> <CAPKvdWdwWCuXVn9rs7xW-wiwxZV6wf4XUF4MKt23oOPJnif3oA@mail.gmail.com> <CAPKvdWf=Ey-XFvsF=bsZPgsE-Jgf5abspukPWCGh-oR9GSQWEw@mail.gmail.com>
Comments: In-reply-to Devesh Chipade <devesh@in-unison.com>
   message dated "Thu, 12 Sep 2024 18:43:17 -0700."
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.3
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 13 Sep 2024 14:00:42 -0400
Message-ID: <539828.1726250442@dyas>

--=-=-=
Content-Type: text/plain


Devesh Chipade <devesh@in-unison.com> wrote:
    > I am still not able to ping into ubuntu/linux or into my aosp target
    > device without explicitly mentioning -I ppp0 interface.  ping -I ppp0
    > 10.0.0.1 / ping -I ppp0 10.0.0.2 works but ping 10.0.0.1 / ping
    > 10.0.0.2 does not work,

Android does stuff with the networking stack so that it can live in multiple
provider domains.   So the default route (if it exists) often lives in a
alternate routing table.

    > I have verified the ip route, ip tables, ip addr show as well as
    > ifconfig (both on linux and aosp target). Seems to be all good in it.
    > Any suggestions?

you didn't post details, but..

if you tcpdump on your Ubuntu side, you'll probably see that AOSP side has
picked some other IP address as the source.  If you really want to fix that,
then add a route back to the ppp0 device on the ubuntu side, but probably you
just need to make sure that the Android side always uses the right source IP.




--
Michael Richardson <mcr+IETF@sandelman.ca>, Sandelman Software Works
 -= IPv6 IoT consulting =-                      *I*LIKE*TRAINS*




--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEERK+9HEcJHTJ9UqTMlUzhVv38QpAFAmbkfckACgkQlUzhVv38
QpDQBwf+M2/VPeIe5c+ul8yKZLkjZFdpUiZZP7a3mKpAl0LJGmrCPNyANv2Wjulg
r0rCb3ZyFDtjC2OygDXd2GIKTxz1E0kqQevvpg41pjStcGeFmFcY7IsWL6gbTySI
/Wrzvtx6bTJ4qH01MyQOt17Pxr1zrwFnGKxooEUSMgnSfD4gghqehu/oQLBBrgv6
QHv/DrerPYNyZYMmMJpaRDhzt78lRVxB3u8046ToIC/bH3EhUKS1Bvmnttoyn57o
3SPwLqVipMW0jAxMFnNpZZ9ULcTlw5I9FeTlIyOkrbTxYSHAG/LF8v5jJpnR14eA
ZVgARLiQ7Kx0NworxhLSj8A8vF3n+A==
=Oqzm
-----END PGP SIGNATURE-----
--=-=-=--

