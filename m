Return-Path: <linux-ppp+bounces-473-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNVqOltBzWkkbAYAu9opvQ
	(envelope-from <linux-ppp+bounces-473-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 01 Apr 2026 18:01:31 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B6337D977
	for <lists+linux-ppp@lfdr.de>; Wed, 01 Apr 2026 18:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3446A300AC34
	for <lists+linux-ppp@lfdr.de>; Wed,  1 Apr 2026 15:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3213630B2;
	Wed,  1 Apr 2026 15:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gx5iIZAk"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B233FFAD2
	for <linux-ppp@vger.kernel.org>; Wed,  1 Apr 2026 15:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775058358; cv=pass; b=eDG/52qfYW8Q4bQzd9BuKNZitVohMXZKzCNUrxkwIzACoym+PNtUbKOg0CMvPrYLQDAOvKCK40Ta8sRkum8Wy9rH26m/mEH4XfwpDFK7cG773uCihCnzHljW9s6gaWP5DqPtzgtroHfXQiv7oQejjYqwlDW9PavwZKqncGzf6W4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775058358; c=relaxed/simple;
	bh=Esi9wO43FQaxJx4NMB7aYQXsx9C91N0Mmye513u0YKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1sC71VbwqDVaENq6mMwdSMcyr+ecRPM/nqV6jhKpqUFYsYZA23JcVKNlKzWTJbgH7NDXjsRthRTQMN/xZX+xxCGEsqtdCmYaEw6RsFKwwtwTW9051rvdzgBO/8yZ/iz5osVHibPpPsWyTrQtc5FfwuKt1IFMLYXMvB9NP8fymg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gx5iIZAk; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-794719afcd4so39739197b3.1
        for <linux-ppp@vger.kernel.org>; Wed, 01 Apr 2026 08:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775058353; cv=none;
        d=google.com; s=arc-20240605;
        b=X3NJ1nQwJlpZl+mtj0NwU2TRcl9VQz+5GryGh9gcaZOU4qPJUmi7qJpbe2PJkmtAYm
         3MHbt1oSu/wUeslibk6nQ0AmwLRwaLZh+QIwHXMd0EySC0xLpJ0b39tIxwM/h/FTbkbg
         7DYcCEMtUczKncur1sEN68n39p0MKJA4AbJCk7YktFve8pr3xV/SwUkhZpvCPC1RFWnL
         fXbgoReecObSuwf2o4vZj5Dz5j+/zVFB6NLxqWLcW0s1dxpD/Ve03JRkv0QRAo2MHgZz
         ZUxt6aQlQqwQ0O8DuQjafCghOvME41xuR3adCfaOo3B0Y6lnGWFFKnVYtUCF6B8Z/EXX
         VI0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rTGAJWv4JOiM3HwPkO1OOuIYpA+0TL54i8InJFWzsWQ=;
        fh=DwS+eK1PlpMvf0XRSaybgd3JwsXJ+yfGNy9JGNwPJtY=;
        b=hLkfnl0muY5ZXenssUZI1VQxjRt6/komoLAx6vvTVE4z1SxW1eD2FzuYua5amFvCAv
         zyushpDCrAADo+gN7f+BdCT+FoKoyziHbpTNYE4wyXNIU+Ps3RrTjvt5kZjKgT3+jYxA
         /Fy0kTgaRGm+XKrztmc3vZjkP8iOjY5j2En6W29bXb+7qhnEyIFYhRDFQPNCxPQroWDY
         1TsTAS5vn7luX5ojC72QXpZnEfyLHCbfGu3Vro/N2jsgat4ZB+XTjKAm9DSGDZpRXYNk
         Ve6AkrhxswDUJhj/OQimuEIj8NojIO4ARsEb0vSAMHFPKDkxQmYTSN56xaSe2lkGP7Vb
         I2cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775058353; x=1775663153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTGAJWv4JOiM3HwPkO1OOuIYpA+0TL54i8InJFWzsWQ=;
        b=gx5iIZAkZSP7OOBNHaL6XrF5y7/BQnSrPLwGqwKlm5sPejjpLvsRRU/Y984Lze24Bo
         Lk0i3p70fe80fNQH9v0i+Rr0ghokHQxEVTsfIItOk69AAWg6zJbl1L9g0CXYvhTeyN24
         TVWk95m+qFTbBSgwih4plH437afxucD3fvtPl5a6DYf9h6oPgHErNCySOpRjw6h1Ikvs
         2LS91pQjtI2f+tSg3izZC11aQ6zv6jIUeKCzHnBCwUxMEw9A97LVU2S3slx3JsShmyOD
         a5MyHSQ+aK9qZIm26PvBEF2nHh63ECQin7Rh9nxNrTm2H0u5ianugmA9TbeiENjb9XKM
         eOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775058353; x=1775663153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rTGAJWv4JOiM3HwPkO1OOuIYpA+0TL54i8InJFWzsWQ=;
        b=ruiXHn1mZrAR5KL6zETep6q1AXJ3g8jMaYkiB9HnK57KPMACyUlQtHvsjQgvrTPlML
         0e4nuwYoKX7qdLvqsmXDKcIw8I8g4CUVHTN0rEyX5u6k8RRmBBGsuv1KlHq4O5WaT+eb
         NGddzjOvLNFTBX8URHTVKTxOTosFkna1/jSe9ZBq2ghAUbxls9bsAAwhTSkphdxL8Djr
         +2lLuFovM0PPLgECenWGhk6OwIvVPQbgyi9io1sVFDWfrfoI89aYZjQmXwTusB5aolLf
         zjkcNcECVmVdofwryUDklzWWh7WcJm27sppbtL4LxwwR11HWQMOMOERwNHB4AYGFF2x9
         WZaw==
X-Forwarded-Encrypted: i=1; AJvYcCUSefPVmarPOvWl0xieQjAIbh62yd+May5yX9IcFYfh/5WsK/4C3YLPuktSjlYKWP4eV96QJC87w64=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHDHMu22+mcpzoWGqBzrdjpxp42Yek/C1K5oUKj1ILPblHQ/jm
	jaXIsZvcyIx6YSPY87qH3DM19eAZXmNu4xh8idR1ytHr8k4GZLxPpmfMuATtKRkrQ5OgE26bLFC
	LYpW2NcMR8z9AnBkEhc2Jv20SqTpZmxw=
X-Gm-Gg: ATEYQzzG2ZQR+Eh6BL/Li7db+coZl0qA9Y5LI1ChLCJigI6yrqMFAhSvy2awHyN9nAF
	1dlVz+INTiOkKf+j9zpQffMpNYxMXojaHDMc+kz3JNXVdS1XmqHBMpp+k/2eb4lROtsGKQm+p5h
	VkDbDSVG1nahNAHd/F9WTaTOQYsKwx5RoAKIZD8pdOiAmNpO12rYdq7IJ9Kg3hpp69xPay45OxU
	eSQ1Ysyn7+pDyTC8rlmTj59JISRtl9YsEhnoKJHnvwGbb5jtf5CzEqVMcv6neIx1OiFH4Qc83t/
	EIYn5Ujih3r95Qx6ZhZsEJW2tmQeYvTRGMCU
X-Received: by 2002:a05:690c:ec5:b0:79a:b330:a8c5 with SMTP id
 00721157ae682-7a212338856mr46397647b3.38.1775058352686; Wed, 01 Apr 2026
 08:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330035604.133073-1-dqfext@gmail.com> <20260401081030.29b050d5@kernel.org>
In-Reply-To: <20260401081030.29b050d5@kernel.org>
From: Qingfang Deng <dqfext@gmail.com>
Date: Wed, 1 Apr 2026 23:45:38 +0800
X-Gm-Features: AQROBzDs2PPqt_rboD4nSJbhKsxG4xBUkUV-LUDRPkPIF5__1EilYpl7BBNQO7g
Message-ID: <CALW65jahWApDnVmFReW+Y3HDxBEmCwzsT1oyh03SW7X5ry6PzA@mail.gmail.com>
Subject: Re: [PATCH net-next v7] selftests: net: add tests for PPP
To: Jakub Kicinski <kuba@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Felix Maurer <fmaurer@redhat.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	"Matthieu Baerts (NGI0)" <matttbe@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-473-lists,linux-ppp=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pppoe.so:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 54B6337D977
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, Apr 1, 2026 at 11:10=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 30 Mar 2026 11:55:44 +0800 Qingfang Deng wrote:
> > Add ping and iperf3 tests for ppp_async.c and pppoe.c.
>
> Hi! I added the new TARGET to netdev CI, the pppoe.sh test does not
> seem happy:
>
> # timeout set to 45
> # selftests: net/ppp: pppoe.sh
> # Plugin pppoe.so loaded.
> # PPPoE plugin from pppd 2.5.1
> # Send PPPOE Discovery V1T1 PADI session 0x0 length 12
> #  dst ff:ff:ff:ff:ff:ff  src b2:36:d8:0d:61:83
> #  [service-name] [host-uniq 9b 08 00 00]
> # Recv PPPOE Discovery V1T1 PADO session 0x0 length 73
> #  dst b2:36:d8:0d:61:83  src 4e:f5:66:23:13:38
> #  [AC-name vmksft-net-extra,debug-threads=3Don] [service-name] [AC-cooki=
e e5 e4 8c f0 87 72 d8 3a 60 66 4e 32 e4 ee af 6f 9a 08 00 00] [host-uniq 9=
b 08 00 00]
> # Send PPPOE Discovery V1T1 PADR session 0x0 length 36
> #  dst 4e:f5:66:23:13:38  src b2:36:d8:0d:61:83
> #  [service-name] [host-uniq 9b 08 00 00] [AC-cookie e5 e4 8c f0 87 72 d8=
 3a 60 66 4e 32 e4 ee af 6f 9a 08 00 00]
> # Recv PPPOE Discovery V1T1 PADS session 0x1 length 12
> #  dst b2:36:d8:0d:61:83  src 4e:f5:66:23:13:38
> #  [service-name] [host-uniq 9b 08 00 00]
> # PPP session is 1
> # Connected to 4E:F5:66:23:13:38 via interface veth-client
> # using channel 1
> # Using interface ppp0
> # Connect: ppp0 <--> veth-client
> # sent [LCP ConfReq id=3D0x1 <mru 1492> <magic 0x6db8fab4>]
> # Modem hangup
> # Connection terminated.
> # Send PPPOE Discovery V1T1 PADT session 0x1 length 32
> #  dst 4e:f5:66:23:13:38  src b2:36:d8:0d:61:83
> #  [host-uniq 9b 08 00 00] [AC-cookie e5 e4 8c f0 87 72 d8 3a 60 66 4e 32=
 e4 ee af 6f 9a 08 00 00]
> # Sent PADT
> # ping: connect: Network is unreachable
> # iperf3: error - unable to connect to server - server may have stopped r=
unning or use a different port, firewall issue, etc.: Network is unreachabl=
e
> # TEST: PPPoE                                                         [FA=
IL]
> not ok 1 selftests: net/ppp: pppoe.sh # exit=3D1

It looks like pppoe-server fails to start. You may check the syslog to
see what's going on.

Regards,
Qingfang

