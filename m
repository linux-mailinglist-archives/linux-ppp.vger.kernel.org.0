Return-Path: <linux-ppp+bounces-90-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A12978A0C
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Sep 2024 22:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 574662811A3
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Sep 2024 20:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10AC137905;
	Fri, 13 Sep 2024 20:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=in-unison.com header.i=@in-unison.com header.b="cSiqnC2Y"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21AA6EB4C
	for <linux-ppp@vger.kernel.org>; Fri, 13 Sep 2024 20:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726259648; cv=none; b=dzRGaHL3oWFVur+ICoi6/4HlGCAR2WSNn4Z89JBwewwBJ0gDaRx1w07RjZJAXlmj4HqQinam2zi7Yym0fsYp+yaGdTtXw9p3ddC+nVS1S+4wKL+dOXGyiajCTwDQRF1Nl5kPxvb2x48TP5IoFmLAs9LLMktymqn7X9/29QXqyUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726259648; c=relaxed/simple;
	bh=jYHz0F3qFR12R/I0XWQg0CMIFaVhvGMom6nHyJ4np8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sEom+G1LRd+KmifmILdYX9mUT/J1gzLE1JCQ13dEp2z2LwsePXhB6WyxsLvjPNkS/QSU2DdD8hnRPYW/hp5x27RiM+emyqUsMih7kICiTlJHpHG6J7Wr3dMPn4hDsEUIKC1Pynuj4bBcesW9yWFNU6qXZO9RGCHbs0Jzgykit4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-unison.com; spf=pass smtp.mailfrom=in-unison.com; dkim=pass (2048-bit key) header.d=in-unison.com header.i=@in-unison.com header.b=cSiqnC2Y; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-unison.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-unison.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53569ef26e6so317633e87.1
        for <linux-ppp@vger.kernel.org>; Fri, 13 Sep 2024 13:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=in-unison.com; s=google; t=1726259645; x=1726864445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCVmGHdmWiimizBVKzN2dXCflxG8e05qXMPoRZVMjTQ=;
        b=cSiqnC2YFtyvQrnrqKpAIvYjy/7GIZ1t5JEL255XqmvQe7uJx9x+TsZqSkYnKCSGkq
         O6zPg4IO76lsAqw/jd9lZO6Gq2pcUrTdcVsQ2pmkpzslEZGBnKKCg3LkZ/3P9OcoM5Bs
         xyMHMD3t2fx/Cg3rUw2AWWKXUvNvbiUIt2yflaGJXpemRIBzCxx+XiCeX7ZybjdeFfLY
         S4ktLgRJ4X5LC5DwSU0+DNUpAnAO8Cs27qoOanEQ4/ipggkyo3OnQKEwY7IPSFgUPgOX
         JLp7RSGmI3KPyLH4NMnJFmo+i6XA+M3SLJhyLViYlGGodQUCCaomkjqMj/+X3Tlx1Gta
         cMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726259645; x=1726864445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QCVmGHdmWiimizBVKzN2dXCflxG8e05qXMPoRZVMjTQ=;
        b=L1MtPoqsCa7+ZFNnq6iibrw8CXyZiNqAZxCIpy81ANRQa1ys8c3Z7gzRAY7lfw7PIt
         1yB+3euyNOj9WRVvMl2LREfkR2ABjhQd3D88Bxgl8eaXaDopkDAh3TF28DiUNY06iYIM
         m2u9r6LhjJBKSCKgU3DJDeeBLoOcFhQ98BBcPsRL9fC/64MmYe3zeo3OKwkE/fkvukyH
         sdzOFg9ICkMM/TRJ7zj2/ZJ6ziBgcX5N3I+hBc/37KW/3gCPk1+87u/jQxMQYJeFfbSL
         asaOQNOPILDIFB0umLxd/WvacZ6H6/h2jeO5w92ol4D3v/2tPEB9eqEPKbBc+BKdHF1J
         ROaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL+O/55sBDgJ2MJ62iXXqwZkWaLCk30FriXJbRrZQ8CE9rX6V0Pqp0iRYmEXqQsVEzPBUSjQdr37s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxGKzVRidXkn1LqLt3Sr/Z3ft9I+gU1gbqye/w+/qu+PrLUyWD
	+VQoC019czSn4T98eX9t2UR8EwVar6emxcYEIeZVlMuzBsYIuqDsywQEQogoI4snWD1jCvd10Ju
	Ukntdobd87ygBuZL8eMeV8Fsn9tlhT07qYPkSS770xyIqARYNnKY=
X-Google-Smtp-Source: AGHT+IGv0hVPmXRZzgVKapi2JeK7QByL7osKQZmtZ7Hl75L+P7pednW6c174XPEtxpHijXTs63tM58F0LxLbkhO1rck=
X-Received: by 2002:a05:6512:3d8f:b0:52e:ccf4:c5e2 with SMTP id
 2adb3069b0e04-53678fecb72mr1357539e87.8.1726259644492; Fri, 13 Sep 2024
 13:34:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPKvdWd3rGxir3MEKrcfdjD4NfOQpCttv3yFPXY=Q35-8cs2Tw@mail.gmail.com>
 <358952.1725971979@dyas> <CAPKvdWdXozAW6DTtXpFix9ZYOQ956AMTqMCHhrGEX6BixA8AKw@mail.gmail.com>
 <377699.1725992617@dyas> <CAPKvdWcQH207rUofzgHYvCa6_ULs5dWxEvRbqmw5+PeYY5QYqg@mail.gmail.com>
 <ZuDb6r9xLIku_vxd@cleo.paulus.ozlabs.org> <CAPKvdWdwWCuXVn9rs7xW-wiwxZV6wf4XUF4MKt23oOPJnif3oA@mail.gmail.com>
 <CAPKvdWf=Ey-XFvsF=bsZPgsE-Jgf5abspukPWCGh-oR9GSQWEw@mail.gmail.com>
 <539828.1726250442@dyas> <CAPKvdWcdck2Q0dc0TOntM4QPmD2LrizxvQsigO6kO2OQBsOqhQ@mail.gmail.com>
In-Reply-To: <CAPKvdWcdck2Q0dc0TOntM4QPmD2LrizxvQsigO6kO2OQBsOqhQ@mail.gmail.com>
From: Devesh Chipade <devesh@in-unison.com>
Date: Fri, 13 Sep 2024 13:33:53 -0700
Message-ID: <CAPKvdWeC2AHc0eqieJAFXCaayyoU4zOSsGkDwDtK-xpDycYwsQ@mail.gmail.com>
Subject: Re: PPP Modem Hangup
To: Michael Richardson <mcr@sandelman.ca>
Cc: Paul Mackerras <paulus@ozlabs.org>, linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On analyzing the logs further, I noticed that I can ping only from
AOSP target device to Ubuntu Machine and not the other way around.

On Fri, Sep 13, 2024 at 11:33=E2=80=AFAM Devesh Chipade <devesh@in-unison.c=
om> wrote:
>
> Posting more details:
>
> On Ubuntu:
>
> $ ip route show
> default via 192.168.0.1 dev wlp5s0 proto dhcp src 192.168.0.79 metric 600
> 10.0.0.0/24 dev ppp0 scope link
> 10.0.0.2 dev ppp0 proto kernel scope link src 10.0.0.1
> 172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown
> 192.168.0.0/24 dev wlp5s0 proto kernel scope link src 192.168.0.79 metr
>
> $ ip addr show
> 59: ppp0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc
> pfifo_fast state UNKNOWN group default qlen 3
>     link/ppp
>     inet 10.0.0.1 peer 10.0.0.2/32 scope global ppp0
>        valid_lft forever preferred_lft forever
>
> ~$ sudo tcpdump -i ppp0
> tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
> listening on ppp0, link-type LINUX_SLL (Linux cooked v1), snapshot
> length 262144 bytes
> 11:29:02.068203 IP Devesh > 10.0.0.2: ICMP echo request, id 56351, seq
> 5744, length 64
> 11:29:02.394650 IP 10.0.0.2 > Devesh: ICMP echo request, id 32, seq
> 5882, length 64
> 11:29:02.394673 IP Devesh > 10.0.0.2: ICMP echo reply, id 32, seq
> 5882, length 64
> 11:29:02.490505 IP 10.0.0.2 > Devesh: ICMP echo request, id 28, seq
> 428, length 64
> 11:29:02.490533 IP Devesh > 10.0.0.2: ICMP echo reply, id 28, seq 428, le=
ngth 64
> 11:29:02.570513 IP 10.0.0.2 > Devesh: ICMP echo request, id 29, seq
> 239, length 64
> 11:29:02.570533 IP Devesh > 10.0.0.2: ICMP echo reply, id 29, seq 239, le=
ngth 64
> 11:29:03.092195 IP Devesh > 10.0.0.2: ICMP echo request, id 56351, seq
> 5745, length 64
> 11:29:03.386211 IP 10.0.0.2 > Devesh: ICMP echo request, id 32, seq
> 5883, length 64
> 11:29:03.386238 IP Devesh > 10.0.0.2: ICMP echo reply, id 32, seq
> 5883, length 64
> 11:29:03.482223 IP 10.0.0.2 > Devesh: ICMP echo request, id 28, seq
> 429, length 64
> 11:29:03.482246 IP Devesh > 10.0.0.2: ICMP echo reply, id 28, seq 429, le=
ngth 64
> 11:29:03.578234 IP 10.0.0.2 > Devesh: ICMP echo request, id 29, seq
> 240, length 64
> 11:29:03.578258 IP Devesh > 10.0.0.2: ICMP echo reply, id 29, seq 240, le=
ngth 64
> 11:29:04.116196 IP Devesh > 10.0.0.2: ICMP echo request, id 56351, seq
> 5746, length 64
> 11:29:04.393801 IP 10.0.0.2 > Devesh: ICMP echo request, id 32, seq
> 5884, length 64
> 11:29:04.393826 IP Devesh > 10.0.0.2: ICMP echo reply, id 32, seq
> 5884, length 64
>
>
> On Android Target Device:
>
> # ip route
> default dev ppp0 scope link
> 10.0.0.0/24 dev ppp0 scope link
> 10.0.0.1 dev ppp0 proto kernel scope link src 10.0.0.2
>
> # ip addr show
> 72: ppp0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc
> pfifo_fast state UNKNOWN group default qlen 3
>     link/ppp
>     inet 10.0.0.2 peer 10.0.0.1/32 scope global ppp0
>        valid_lft forever preferred_lft forever
>
> # ifconfig
> ppp0      Link encap:Point-to-Point Protocol
>           inet addr:10.0.0.2  P-t-P:10.0.0.1  Mask:255.255.255.255
>           UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
>           RX packets:204583 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:137381 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:3
>           RX bytes:17453623 TX bytes:11539856
>
> # tcpdump -i ppp0
> tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
> listening on ppp0, link-type LINUX_SLL (Linux cooked v1), snapshot
> length 262144 bytes
> 11:27:47.371173 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 32, seq
> 5969, length 64
> 11:27:47.865949 IP 10.0.0.1 > 10.0.0.2: ICMP echo request, id 56351,
> seq 5830, length 64
> 11:27:47.979345 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 29, seq
> 327, length 64
> 11:27:47.979903 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 32, seq
> 5970, length 64
> 11:27:47.980717 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 28, seq
> 516, length 64
> 11:27:48.182932 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 29, seq
> 327, length 64
> 11:27:48.275624 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 32, seq
> 5970, length 64
> 11:27:48.363885 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 28, seq
> 516, length 64
> 11:27:48.891693 IP 10.0.0.1 > 10.0.0.2: ICMP echo request, id 56351,
> seq 5831, length 64
> 11:27:48.979785 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 29, seq
> 328, length 64
> 11:27:48.981057 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 32, seq
> 5971, length 64
> 11:27:48.981469 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 28, seq
> 517, length 64
> 11:27:49.190116 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 29, seq
> 328, length 64
> 11:27:49.281473 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 32, seq
> 5971, length 64
> 11:27:49.368639 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 28, seq
> 517, length 64
> 11:27:49.913433 IP 10.0.0.1 > 10.0.0.2: ICMP echo request, id 56351,
> seq 5832, length 64
> 11:27:49.980826 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 32, seq
> 5972, length 64
> 11:27:49.981377 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 29, seq
> 329, length 64
> 11:27:49.982190 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 28, seq
> 518, length 64
> 11:27:50.193380 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 32, seq
> 5972, length 64
>
> On Fri, Sep 13, 2024 at 11:00=E2=80=AFAM Michael Richardson <mcr@sandelma=
n.ca> wrote:
> >
> >
> > Devesh Chipade <devesh@in-unison.com> wrote:
> >     > I am still not able to ping into ubuntu/linux or into my aosp tar=
get
> >     > device without explicitly mentioning -I ppp0 interface.  ping -I =
ppp0
> >     > 10.0.0.1 / ping -I ppp0 10.0.0.2 works but ping 10.0.0.1 / ping
> >     > 10.0.0.2 does not work,
> >
> > Android does stuff with the networking stack so that it can live in mul=
tiple
> > provider domains.   So the default route (if it exists) often lives in =
a
> > alternate routing table.
> >
> >     > I have verified the ip route, ip tables, ip addr show as well as
> >     > ifconfig (both on linux and aosp target). Seems to be all good in=
 it.
> >     > Any suggestions?
> >
> > you didn't post details, but..
> >
> > if you tcpdump on your Ubuntu side, you'll probably see that AOSP side =
has
> > picked some other IP address as the source.  If you really want to fix =
that,
> > then add a route back to the ppp0 device on the ubuntu side, but probab=
ly you
> > just need to make sure that the Android side always uses the right sour=
ce IP.
> >
> >
> >
> >
> > --
> > Michael Richardson <mcr+IETF@sandelman.ca>, Sandelman Software Works
> >  -=3D IPv6 IoT consulting =3D-                      *I*LIKE*TRAINS*
> >
> >
> >

