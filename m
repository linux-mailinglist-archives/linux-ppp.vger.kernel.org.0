Return-Path: <linux-ppp+bounces-81-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6979737DC
	for <lists+linux-ppp@lfdr.de>; Tue, 10 Sep 2024 14:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46C32B24512
	for <lists+linux-ppp@lfdr.de>; Tue, 10 Sep 2024 12:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125B818CC1F;
	Tue, 10 Sep 2024 12:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sandelman.ca header.i=@sandelman.ca header.b="AQA+XXAS"
X-Original-To: linux-ppp@vger.kernel.org
Received: from relay.sandelman.ca (relay.cooperix.net [176.58.120.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366F41DFE8
	for <linux-ppp@vger.kernel.org>; Tue, 10 Sep 2024 12:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.58.120.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725972503; cv=none; b=V06yY4r3AGKzOQQXbj5MLyjQus7ZvNs1YTzqa1n0fiBjLRek48VrVAWrNa2wyWBLtlkaGmBFUxYybjPaCtvFMKBkn64O7JfQnjpV5L9UpMQP9+8PYMdGtR1PiHIO2uLxnwJK6jlpZKAFSxARCc1tRVQolycd8+bGx/f64E6ZByY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725972503; c=relaxed/simple;
	bh=lV4/SkpJK7hZqnN86LrQKDq3ZQewQBcjjhp228nf+4s=;
	h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:Message-ID; b=l2kC3p3X+nCytNu667IY1poPbvaFbwWlzYsWns/LnpygKD+Wt5UUsJUZjvUOJ5abqKuDJrDjivLUcBtkRcy5Dw65nRaHsRUlC09zd8LllBsG/CaQyc859scjiHA3AFbHIpeHeTQTI5p1KpU1uwy2utktf0xRtH9apjP5h4o6YRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sandelman.ca; spf=pass smtp.mailfrom=sandelman.ca; dkim=pass (2048-bit key) header.d=sandelman.ca header.i=@sandelman.ca header.b=AQA+XXAS; arc=none smtp.client-ip=176.58.120.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sandelman.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sandelman.ca
Authentication-Results: relay.sandelman.ca;
	dkim=pass (2048-bit key; secure) header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha256 header.s=dyas header.b=AQA+XXAS;
	dkim-atps=neutral
Received: from dyas.sandelman.ca (unknown [142.169.16.87])
	by relay.sandelman.ca (Postfix) with ESMTPS id 9B8ED1F483;
	Tue, 10 Sep 2024 12:36:50 +0000 (UTC)
Received: by dyas.sandelman.ca (Postfix, from userid 1000)
	id AB989AB65B; Tue, 10 Sep 2024 08:39:39 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sandelman.ca; s=dyas;
	t=1725971979; bh=lV4/SkpJK7hZqnN86LrQKDq3ZQewQBcjjhp228nf+4s=;
	h=From:To:cc:Subject:In-reply-to:References:Date:From;
	b=AQA+XXASCmW17rH7tx8dYhfOE8MnzH3cvicKFjrpbS+iTRylWqNJ4ycwZKnwSDPCs
	 QJRbaXpIX54aXGVZCORWgW6YHKQhQM4cT/7F/Eqn/qxYLfbQbAY9korFnLCZdSoepi
	 eqawGUtUOJ0s8PvrIUcYhpnc9HqUp8cApGpgjVX2Ne7FxMl18cC/86A3Id6L6Mn0Tj
	 OWCoxjGQh5U/6JVDjRTHe5RiZuLEs2G2FiduX3tIhZpcAnrzbYMFr6FbEM7akfYJ1J
	 U4m1P6XF7deGZatk+eyJy4fu3HLUj45JOM3VQ56WE63Fcka7yqjw9+G90/6ynv30gF
	 RwBkm+zR4ks7A==
Received: from dyas (localhost [127.0.0.1])
	by dyas.sandelman.ca (Postfix) with ESMTP id A880EA003B;
	Tue, 10 Sep 2024 08:39:39 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Devesh Chipade <devesh@in-unison.com>
cc: linux-ppp@vger.kernel.org
Subject: Re: PPP Modem Hangup
In-reply-to: <CAPKvdWd3rGxir3MEKrcfdjD4NfOQpCttv3yFPXY=Q35-8cs2Tw@mail.gmail.com>
References: <CAPKvdWd3rGxir3MEKrcfdjD4NfOQpCttv3yFPXY=Q35-8cs2Tw@mail.gmail.com>
Comments: In-reply-to Devesh Chipade <devesh@in-unison.com>
   message dated "Mon, 09 Sep 2024 15:55:20 -0700."
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.3
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 10 Sep 2024 08:39:39 -0400
Message-ID: <358952.1725971979@dyas>

--=-=-=
Content-Type: text/plain


Given that you have:

      local                     # Do not use modem control lines; assume a

then pppd ought to tell the TTL to ignore DCD drops.
Is this a real serial connection, or actually serial over USB or PPPoE?
Looks like USB0.  USB/TTL adapter I bet.  Are other pins being used for
(JTAG) programming, reset?

Maybe "stty -F /dev/ttyUSB0 -a" (as root) during your magic 6s.
Is clocal set?



--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEERK+9HEcJHTJ9UqTMlUzhVv38QpAFAmbgPgsACgkQlUzhVv38
QpAXjAgAldYhra1U427fXa56346/iwvAVXYYncvadOLczdUPV2Vfw6Q/vn8MvZbR
dyWBzkBQ6Kc5U8DopXzlbKp88qw4O7HykidtorDb0srynZnoETgRmwzATaM3QTNU
KLZpsNk7g3DZ21wa32E3yzBbfHT7AqbDmCyyqI7uTGONPEX/vQvmxAZjEKEkBnr3
buwUd67KPjaWNHeSnrfLA9t6FL/mNbsgrMFpc8afvo+YrYzCIH/yLdXnROCzPBQJ
Vf+vLAbCUC1qUxCrFRIGShUMBRFE/GLVpv4QcYcgX+eblPTvociR89uGKoPcLqqy
sGD8DZKS7ginRke+CXtNHi2oEZKZpA==
=1Lgr
-----END PGP SIGNATURE-----
--=-=-=--

