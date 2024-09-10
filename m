Return-Path: <linux-ppp+bounces-83-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBC4974208
	for <lists+linux-ppp@lfdr.de>; Tue, 10 Sep 2024 20:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9DBA1C25146
	for <lists+linux-ppp@lfdr.de>; Tue, 10 Sep 2024 18:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019BD1A4F35;
	Tue, 10 Sep 2024 18:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sandelman.ca header.i=@sandelman.ca header.b="jJSm9+SL"
X-Original-To: linux-ppp@vger.kernel.org
Received: from relay.sandelman.ca (relay.cooperix.net [176.58.120.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AEA1A4AB5
	for <linux-ppp@vger.kernel.org>; Tue, 10 Sep 2024 18:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.58.120.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725992638; cv=none; b=G/YzBelBzSupK+dTVoAOiHyOjkNd5XtQcyoQ9Jj1gKSQu+nAej5SICenorDdWfuCqTKYqNLEvg/tA4xnndO6o5ms5Aqu79bZ2zZniIa9YL8dqm5suS/6GiAuGMffHgcwjBpF5eTOVJDc7jyFQZ0l/SfRKtXrb+lBsBRVpIiblCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725992638; c=relaxed/simple;
	bh=5jkGlErdLP4xLHJiLEuCm00QxBOqrrulYM49W7wElwQ=;
	h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:Message-ID; b=bKdVKnhyFLrNbUgGJQ5k8pE8vHB2fj2ji/1qoF9DkiU8eQPIjLmM4e1DoVccqUP1aCQUpV4+0yTjFRi2PbussvtkGuHY09aOAifF1FKqbKE840HL9rODfleYGr/6xuKFxV2D2s2dHh4L+GNeyWjptcPylz8OBIGWZaRIZznn5Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sandelman.ca; spf=pass smtp.mailfrom=sandelman.ca; dkim=pass (2048-bit key) header.d=sandelman.ca header.i=@sandelman.ca header.b=jJSm9+SL; arc=none smtp.client-ip=176.58.120.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sandelman.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sandelman.ca
Authentication-Results: relay.sandelman.ca;
	dkim=pass (2048-bit key; secure) header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha256 header.s=dyas header.b=jJSm9+SL;
	dkim-atps=neutral
Received: from dyas.sandelman.ca (unknown [24.48.10.190])
	by relay.sandelman.ca (Postfix) with ESMTPS id B41941F483;
	Tue, 10 Sep 2024 18:21:01 +0000 (UTC)
Received: by dyas.sandelman.ca (Postfix, from userid 1000)
	id 0C5A5AB65C; Tue, 10 Sep 2024 14:23:37 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sandelman.ca; s=dyas;
	t=1725992617; bh=5jkGlErdLP4xLHJiLEuCm00QxBOqrrulYM49W7wElwQ=;
	h=From:To:cc:Subject:In-reply-to:References:Date:From;
	b=jJSm9+SLXI2aJOug0x7dQfdqAqBQG7rxWUm21TS/Q4gclUWjAzs5ESoC7Oqi035Uu
	 iCM3m7UfGJ5wpUQJSJJZmQG+01YcTumkMV2EjEvBUdJF1Djlf0FxcH1RFpoLqHlc82
	 w0g110pw6VTNohAkU2v/aekBPjLQrfo4oX1DJW7igAnWLWTZeyzTeFslokxg/Oagj7
	 /COmDoesXRuo8QvRaFlm3JnSMiMYjloNHsErfffMfjkQCZWIbrmqBEom88GWAWg1ES
	 +pIw1tr4IYyai+/TkyaENA8jipdNfDAD5m+ynvepIa4Qy2XcbdEhG5zlDouspJx/z7
	 MxbczErsRJZvA==
Received: from dyas (localhost [127.0.0.1])
	by dyas.sandelman.ca (Postfix) with ESMTP id 0A010A1466;
	Tue, 10 Sep 2024 14:23:37 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Devesh Chipade <devesh@in-unison.com>
cc: linux-ppp@vger.kernel.org
Subject: Re: PPP Modem Hangup
In-reply-to: <CAPKvdWdXozAW6DTtXpFix9ZYOQ956AMTqMCHhrGEX6BixA8AKw@mail.gmail.com>
References: <CAPKvdWd3rGxir3MEKrcfdjD4NfOQpCttv3yFPXY=Q35-8cs2Tw@mail.gmail.com> <358952.1725971979@dyas> <CAPKvdWdXozAW6DTtXpFix9ZYOQ956AMTqMCHhrGEX6BixA8AKw@mail.gmail.com>
Comments: In-reply-to Devesh Chipade <devesh@in-unison.com>
   message dated "Tue, 10 Sep 2024 09:42:41 -0700."
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.3
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 10 Sep 2024 14:23:37 -0400
Message-ID: <377699.1725992617@dyas>

--=-=-=
Content-Type: text/plain


Devesh Chipade <devesh@in-unison.com> wrote:
    > I get the following output:

Looks sane to me.
I had problems with my ISP connection where one of their DSLAMs would not
answer IPCP echo requests if there was already traffic flowing.  I had to
turn off that check at my end, but you already did that.

I think you'll have to enable lots more debuging, and maybe throw in a
printf() here or there.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEERK+9HEcJHTJ9UqTMlUzhVv38QpAFAmbgjqgACgkQlUzhVv38
QpBvfQf8CRBoSvSuUlYszI3RRWLZx/Hq0Zl/FesoLYtmoTe1zjjU2GfEZ0MfNziP
UJROSYUcqBB78MuXS+PPLd4PbMlDh/LXqSwUymtrozvQlTzuG9QyrjYgJ8ikZV3s
pDkWv61KJhjLcLZD1XV8gec4FqX20gfhk2TEvs1dBKoqfdokSP2QIZ8AkcoTLZlT
jyfwdysfjtisyiRDQ8C+DGWCvPGBdNQNlNei9iwH+r8MvWu2T2YFt7GoR6JIwLwy
T8CdpCn5Ne/q6PPPgb1dhpVsYgHYJqBmsOGI2QdNJKNlj9LxUqDrWvNuG/nmh3T7
uhpQ2FscWsxFcN1PWMt3g6svJx9t1Q==
=Ownr
-----END PGP SIGNATURE-----
--=-=-=--

