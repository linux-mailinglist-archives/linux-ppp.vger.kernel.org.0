Return-Path: <linux-ppp+bounces-480-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mP8hN3ZCzmlQmQYAu9opvQ
	(envelope-from <linux-ppp+bounces-480-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 12:18:30 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCB038798F
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 12:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42DC6300B562
	for <lists+linux-ppp@lfdr.de>; Thu,  2 Apr 2026 10:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1FD3DC4C2;
	Thu,  2 Apr 2026 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ab3lWxkr"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8103DE427
	for <linux-ppp@vger.kernel.org>; Thu,  2 Apr 2026 10:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775124801; cv=pass; b=LAwuVZZlsVqTqvYwECpQGvm2yGRnqxGGgo7X2ppLsKu5DvSgopgM8bvIjSc4V7zYvANXX1OULa64lxYHtLg9B0GQLbA9Zr+zC9YB50y1d5cw8gRBcBwTJrhtyhxjByTiJxQMydG5oOgHZJTAWjOwdmJOD0NWslP5+6jxVkv5FaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775124801; c=relaxed/simple;
	bh=UHRKW7d/gI/agzapMah+6q2m1siwp6pLPB48km3Iw+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uyROv21OlgBjDGB96G5/uptTMyEKCgi//S989Itgauyq9W7XXx716WdhU1UenwSJ+bPEItkHBKN4Mdu7k4eITBt21hdGX2h2Ja5tPFqbxe2EYj7JbjgjyJ7Kpd2B+bRG0RCWt0sGKRwQ/NE/nvlKYJRJCD7KSLMMQZlTh9Scn6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ab3lWxkr; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7a2b6adbfa6so7362337b3.0
        for <linux-ppp@vger.kernel.org>; Thu, 02 Apr 2026 03:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775124797; cv=none;
        d=google.com; s=arc-20240605;
        b=Q9MT/ZlhgnOEfro9dmTk+I0TVP1tLRlmTLWeWiEIQzPdSugZ+8Me1iHJ54AvKVjZjQ
         ruCcuQDn/RjkT1g2bE4GSTenfm7INiHDmjtLcHJfERiAK4nQWrLQUJVvKdjoLSVG1h9z
         ZAgbXvsM/EKg6JIWCSv2FKHKM5tPfjL9jqe9ZFlQsJ6K3NdfJljpdfA2vohQgL84/Z6c
         0GrQhxAbgQ72Z1YyPuEf+aA3/zZ3uBzNfK1HxncQD6/fidJr9AOKU8Pvv1eUi6/nalgU
         l0jwvPTE0KiGSbt84/mk2WyZmyOzeS2ghQHgiIHvUpX9Zrly+0iYJR2wpD6X4D78YMuW
         I/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UHRKW7d/gI/agzapMah+6q2m1siwp6pLPB48km3Iw+I=;
        fh=jI+pFociRnYn1uOclInUOT+evW5/BUfwBq0Om8jyNFs=;
        b=RkfPuiyKTKSBAnzExuuO98RPaxvolJwuE2rYC/PPhX24Vk9fL60XrqAdLQsICsG3Yo
         2G1RO2VAJOzZbLd2YUoZ5NybuR4jQJFVJSL6r2It+oigKu6nCenqQD1IqatSm+F2QXKX
         rooyygmBwrEDEzHh0orA3UKiqiSAavU+HFGR8RzHaVd93CB2ExoGOEXjsqT0BELznmSK
         tPHZ1rf4bqYw+GIj6Ga4vJVWteGS8oDAjnmmZvmYNI8WARkKLgh9R2TeOsrQoPWLpCCm
         AAxEXINCD0vdkFTyXFytHFgkKaUZIoUIWALQ1naG1q7CoiFAtnLTqq25xkK1Iucrwmuz
         i6tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775124797; x=1775729597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHRKW7d/gI/agzapMah+6q2m1siwp6pLPB48km3Iw+I=;
        b=Ab3lWxkrx4atMVO6dRMkxBOrypILc/ouLfaq77lO1TYP/ZcSruZzGaxuLWoC+pa8zF
         aiMsI56tnneL1uDBRajVYW1hz1cI9z635+8cuGtaP092Oqyde7pO/1WjcI4m9c/yiHsY
         hvXPDUYi8KGOHWTDO5WuAD2+ubmaIMAtWCInb3D8oW6aIODDNRAgwajwVGTuu3Ol+t/x
         sMMGmGJiNx1N7z7VtJN1e/fhH8hFDTV3oX11BEQ/lQ8YT36yN153CP+jMGheEhP9srcB
         Dxhl5cC9XcO892r+YHCUDE9T6ieL+ni4ohqrW7OQRZYxqiB5iPvl3n7fPCggVH64AhOo
         RFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775124797; x=1775729597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UHRKW7d/gI/agzapMah+6q2m1siwp6pLPB48km3Iw+I=;
        b=eXRrjA5YWsUK9BOgdUSDFdOy44crxqkShcNNrlGxSI/OvspuqkOyrlSKmnyYwMhr2P
         UWBKwjYtrDep1XpHqmDRGsza8e7OHuV9NJqLbP49J5t/eaHzxq4Bbo7ubW7HJexORbqZ
         IJktgAUdoeSRRcatcDTe5BsTGX6R44LDx75zvq/i7OrtcsnPZQSRRuUPaYt4qAln1G+y
         +Sgf7/g3f8UESNZNaS1NIaiMFB/CP45nw/E+Czf0jbZyhiSrMJUjMfUANv6kSxhOpVd4
         oS59ClFcRp/dZnNiO+CfKa1G4qR11Ir5OVufycnt1fw2rkzCeEz4To2Aqd22sMfEfT7F
         KOXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+LGM4+nGQz7hiUkM5vLGV+Zmzz0mtoyQ6PJKDWDzEwXMyD05Y+KRUtMUhWlcPfOnh4IIqPbqZLt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHGxGZZaq9kk1QjMYNGE+/5CdVJxOjzmd5PrmesJCeZjfkuM/i
	YKX3Ls775p7fQNZmjt2c2ABTDEgHPLoakxRHFJN8xkOlaC3IuVL6qV8TvQEQzKvrWcndBiLfiv3
	SgcYwJMQRK1lFeS6ZdKdfM0bgORGrACE=
X-Gm-Gg: AeBDiesCrPq/lYU/zUcYbLCldJ1E7d0rNVAlWG3GYIKZTyO51A35fF0n9/C+t920h/H
	5uEUTs0Gsnv10LuvlgWZJKgsX+vEcUNDmVJANoEtp0+M4DXfgGmIyEBGBEL4bpV5UwsZzF9o8wk
	erJ7khhkbUxnxLgi+X2kprpvcWwndg2H6cV53f+bGuk7Ytuk+TstWXS2deBieg3gsGiT+2/1frl
	As7bAct2m/gTk+GcGu4F15qXpv2xjILE0bMrSGqTKjsAmUYyoRqc4KMKRih/LS4xqEX9OrIoa5o
	x+IcCAb/ME1O9LfDBTgeat0JTiilcr85WWJoGH2z
X-Received: by 2002:a05:690c:38b:b0:79c:a09a:e59a with SMTP id
 00721157ae682-7a210a8c012mr71187397b3.24.1775124797268; Thu, 02 Apr 2026
 03:13:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330035604.133073-1-dqfext@gmail.com> <20260401081030.29b050d5@kernel.org>
 <CALW65jahWApDnVmFReW+Y3HDxBEmCwzsT1oyh03SW7X5ry6PzA@mail.gmail.com>
 <20260401175621.549c492e@kernel.org> <CALW65jaTbaosbO8ypKZ6G37HxuxXabeTaP_Fhq72xTovmDj+8g@mail.gmail.com>
 <50ae3c69-2c4e-499f-a46a-cbd207ff5f09@redhat.com>
In-Reply-To: <50ae3c69-2c4e-499f-a46a-cbd207ff5f09@redhat.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Thu, 2 Apr 2026 18:13:05 +0800
X-Gm-Features: AQROBzAyy1DnZFo-szwYlk4Mp8iFMyQo5jot_GYlouwlaNbxdnQyOVQ65zMkKtE
Message-ID: <CALW65ja1FV-OcqSazgKZhQhKf3oqr=kcGxyGkOGbhurGLOJ0-w@mail.gmail.com>
Subject: Re: [PATCH net-next v7] selftests: net: add tests for PPP
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Dianne Skoll <dianne@skoll.ca>, Shuah Khan <shuah@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Simon Horman <horms@kernel.org>, Felix Maurer <fmaurer@redhat.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>, Jaco Kroon <jaco@uls.co.za>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-480-lists,linux-ppp=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5BCB038798F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Paolo and Jakub,

On Thu, Apr 2, 2026 at 5:48=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
> Note that similar failures in the past in other test-cases were usually
> due to timing issues. i.e. the pppoe-server starts in background too
> late for the client.

I don't think it is a timing issue, otherwise the PADI negotiation
won't succeed. The "updetach" option on the client side also make it
wait for the negotiation.
It's likely that the pppd instance spawned by pppoe-server fails to
find the "rp-pppoe.so" plugin, so the connection fails when handing
off the session from pppoe-server to pppd. Note the naming difference:
the client loads "pppoe.so", while the server loads "rp-pppoe.so" by
default.

What distro do you run CI tests on? On Ubuntu 24.04, "rp-pppoe.so" is
a symlink to "pppoe.so" in apt package "ppp". Maybe an additional
package is required for the distro you use, or I may work around that
by manually creating the symlink.

