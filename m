Return-Path: <linux-ppp+bounces-89-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 469D29787ED
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Sep 2024 20:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B78ED1F23318
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Sep 2024 18:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B92126F0A;
	Fri, 13 Sep 2024 18:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=in-unison.com header.i=@in-unison.com header.b="lhKhfC+R"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376AD7B3FE
	for <linux-ppp@vger.kernel.org>; Fri, 13 Sep 2024 18:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726252402; cv=none; b=oyRfrTs6ScE7GWYkMWAUZHa/Tm5Ya667Fl7L2aIGH4TKxHd04exiNLbO24BLPJXMiMWqkwn7THBaxGDTH0jn/axk6FRuuVtgBg6XMlgYQ+BRqIZQJzb0GUYJ/8bStRFfuVEWq0m45/TPs7fZZVwq6pCcFOihZ4GfbJoWYnoqyhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726252402; c=relaxed/simple;
	bh=6KaJmE3JMqKr2CiYIRYL4Gzv0tHxvOERJF0RgtLm3Mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pnOhE19Ro4k+eq+qv9YHM5l3BSg9zaD4TSYwm9D5bDNvmxHL+Sxm1+6SAMiCVWrgbJ8lUaIgV1vNQuRDCKGM8VkV7gTJamoreOA+nbeOfbY4gsSvJ+KlLXHP+J50Ju0qbr+PlqL21Dl0K8pQIYvEXwIGpUDgFQi02A0Q4tg1ip8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-unison.com; spf=pass smtp.mailfrom=in-unison.com; dkim=pass (2048-bit key) header.d=in-unison.com header.i=@in-unison.com header.b=lhKhfC+R; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-unison.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-unison.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53568285c1aso276765e87.3
        for <linux-ppp@vger.kernel.org>; Fri, 13 Sep 2024 11:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=in-unison.com; s=google; t=1726252398; x=1726857198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjOfbH+1V9n5wu0MppXCJeMNzksNArcztkteUml5aSE=;
        b=lhKhfC+RX10RALgVADLwuqi2sKZu9V/uAffR1WSgJo1bPGvIubpwqpQRrL5oJ1baTc
         CWtv5O7XY8kZ2UD2eaLUMMCsDSLNIgSZzYV9HA3wDL2NsKY6TtXmA0iLEuHMXyOAnOzr
         e6hPjJ6dNi1y7rQWQxsf6eTbICifHMXAZb2Rp0aI17f9lCa43LoZoIq2HSuxFB32s0TS
         SUPJsd2VZY6dW0wddoycydP7zeWh7+fi0hljk3XsA2tCztfO5lwYk9Mn//4ANfqQeb/a
         Mx7j2sN0zBpBBPT2tOlZzJel3o8tGmyvCT8m9uEajIFU3pSpoDqgJkJuD1Iwkb3eIlgB
         Glgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726252398; x=1726857198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JjOfbH+1V9n5wu0MppXCJeMNzksNArcztkteUml5aSE=;
        b=AOKzWYwqFmUXjfvmv5hfMPGKwHzhyNpjH9dZMSEUU9oZfwWiTJbF9TViOO004K6jlp
         bZAVvKsFf0pzntCCMBqOYfBdaLBthMp8eOTCAatyT0cgkwizRajXYdV78xJdtVy+6lJV
         YJv9cyHAOqHCccll7/zViu+TQECRVOu8QKVwOEyOfbtwQFrve+POQN/7QFaSwNPxFCpA
         B7CYJmpP3W5GBJZOwMX0bz58NAN5FxufMZX+XqwSXPDQD9uYcqzY6VPBuHoIl74qFFAX
         XcJNsCXiMK5aK5n2EYAkBQuHQwg7+xUb69A/e4R2Jin2NftDrK5uwg6nV9zWqYVJbQuG
         6sSA==
X-Forwarded-Encrypted: i=1; AJvYcCWUbWsG5aSgpQS2HzEz9p+5UIB3DoZkulCdmiFnIkhCV9ElYoXN96wuBSxtEXzMGnnIGSjWFl10Kb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL0aYNA3GYERRkh9Abjyo0qCcy/Zjv4YUifos4goeDCczk89Fx
	mhZhQ3tCxusy2g1+t0rWT6fVSCKuHTGu4lftVy9b//s3xhp06tqoF4jwfnuhpfamJ5ggYD1zijk
	2U01AFBVT2PBI7m1Bc03R89Oh8THz4fIYA7GpslomvhuJ6f0egaEvjQ==
X-Google-Smtp-Source: AGHT+IHXhyoYo9dm+4eqMgeU1M5aAG5PV7ernC4IjZiOk9iIdSPbPPTUMQDXzmflNKKuOOmvRA6N45i+nh9LiOivVa4=
X-Received: by 2002:a05:6512:ea6:b0:533:793:e3d9 with SMTP id
 2adb3069b0e04-53678fab57fmr1315220e87.2.1726252398083; Fri, 13 Sep 2024
 11:33:18 -0700 (PDT)
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
 <CAPKvdWf=Ey-XFvsF=bsZPgsE-Jgf5abspukPWCGh-oR9GSQWEw@mail.gmail.com> <539828.1726250442@dyas>
In-Reply-To: <539828.1726250442@dyas>
From: Devesh Chipade <devesh@in-unison.com>
Date: Fri, 13 Sep 2024 11:33:07 -0700
Message-ID: <CAPKvdWcdck2Q0dc0TOntM4QPmD2LrizxvQsigO6kO2OQBsOqhQ@mail.gmail.com>
Subject: Re: PPP Modem Hangup
To: Michael Richardson <mcr@sandelman.ca>
Cc: Paul Mackerras <paulus@ozlabs.org>, linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Posting more details:

On Ubuntu:

$ ip route show
default via 192.168.0.1 dev wlp5s0 proto dhcp src 192.168.0.79 metric 600
10.0.0.0/24 dev ppp0 scope link
10.0.0.2 dev ppp0 proto kernel scope link src 10.0.0.1
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown
192.168.0.0/24 dev wlp5s0 proto kernel scope link src 192.168.0.79 metr

$ ip addr show
59: ppp0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc
pfifo_fast state UNKNOWN group default qlen 3
    link/ppp
    inet 10.0.0.1 peer 10.0.0.2/32 scope global ppp0
       valid_lft forever preferred_lft forever

~$ sudo tcpdump -i ppp0
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on ppp0, link-type LINUX_SLL (Linux cooked v1), snapshot
length 262144 bytes
11:29:02.068203 IP Devesh > 10.0.0.2: ICMP echo request, id 56351, seq
5744, length 64
11:29:02.394650 IP 10.0.0.2 > Devesh: ICMP echo request, id 32, seq
5882, length 64
11:29:02.394673 IP Devesh > 10.0.0.2: ICMP echo reply, id 32, seq
5882, length 64
11:29:02.490505 IP 10.0.0.2 > Devesh: ICMP echo request, id 28, seq
428, length 64
11:29:02.490533 IP Devesh > 10.0.0.2: ICMP echo reply, id 28, seq 428, leng=
th 64
11:29:02.570513 IP 10.0.0.2 > Devesh: ICMP echo request, id 29, seq
239, length 64
11:29:02.570533 IP Devesh > 10.0.0.2: ICMP echo reply, id 29, seq 239, leng=
th 64
11:29:03.092195 IP Devesh > 10.0.0.2: ICMP echo request, id 56351, seq
5745, length 64
11:29:03.386211 IP 10.0.0.2 > Devesh: ICMP echo request, id 32, seq
5883, length 64
11:29:03.386238 IP Devesh > 10.0.0.2: ICMP echo reply, id 32, seq
5883, length 64
11:29:03.482223 IP 10.0.0.2 > Devesh: ICMP echo request, id 28, seq
429, length 64
11:29:03.482246 IP Devesh > 10.0.0.2: ICMP echo reply, id 28, seq 429, leng=
th 64
11:29:03.578234 IP 10.0.0.2 > Devesh: ICMP echo request, id 29, seq
240, length 64
11:29:03.578258 IP Devesh > 10.0.0.2: ICMP echo reply, id 29, seq 240, leng=
th 64
11:29:04.116196 IP Devesh > 10.0.0.2: ICMP echo request, id 56351, seq
5746, length 64
11:29:04.393801 IP 10.0.0.2 > Devesh: ICMP echo request, id 32, seq
5884, length 64
11:29:04.393826 IP Devesh > 10.0.0.2: ICMP echo reply, id 32, seq
5884, length 64


On Android Target Device:

# ip route
default dev ppp0 scope link
10.0.0.0/24 dev ppp0 scope link
10.0.0.1 dev ppp0 proto kernel scope link src 10.0.0.2

# ip addr show
72: ppp0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc
pfifo_fast state UNKNOWN group default qlen 3
    link/ppp
    inet 10.0.0.2 peer 10.0.0.1/32 scope global ppp0
       valid_lft forever preferred_lft forever

# ifconfig
ppp0      Link encap:Point-to-Point Protocol
          inet addr:10.0.0.2  P-t-P:10.0.0.1  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
          RX packets:204583 errors:0 dropped:0 overruns:0 frame:0
          TX packets:137381 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3
          RX bytes:17453623 TX bytes:11539856

# tcpdump -i ppp0
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on ppp0, link-type LINUX_SLL (Linux cooked v1), snapshot
length 262144 bytes
11:27:47.371173 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 32, seq
5969, length 64
11:27:47.865949 IP 10.0.0.1 > 10.0.0.2: ICMP echo request, id 56351,
seq 5830, length 64
11:27:47.979345 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 29, seq
327, length 64
11:27:47.979903 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 32, seq
5970, length 64
11:27:47.980717 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 28, seq
516, length 64
11:27:48.182932 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 29, seq
327, length 64
11:27:48.275624 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 32, seq
5970, length 64
11:27:48.363885 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 28, seq
516, length 64
11:27:48.891693 IP 10.0.0.1 > 10.0.0.2: ICMP echo request, id 56351,
seq 5831, length 64
11:27:48.979785 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 29, seq
328, length 64
11:27:48.981057 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 32, seq
5971, length 64
11:27:48.981469 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 28, seq
517, length 64
11:27:49.190116 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 29, seq
328, length 64
11:27:49.281473 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 32, seq
5971, length 64
11:27:49.368639 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 28, seq
517, length 64
11:27:49.913433 IP 10.0.0.1 > 10.0.0.2: ICMP echo request, id 56351,
seq 5832, length 64
11:27:49.980826 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 32, seq
5972, length 64
11:27:49.981377 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 29, seq
329, length 64
11:27:49.982190 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 28, seq
518, length 64
11:27:50.193380 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 32, seq
5972, length 64

On Fri, Sep 13, 2024 at 11:00=E2=80=AFAM Michael Richardson <mcr@sandelman.=
ca> wrote:
>
>
> Devesh Chipade <devesh@in-unison.com> wrote:
>     > I am still not able to ping into ubuntu/linux or into my aosp targe=
t
>     > device without explicitly mentioning -I ppp0 interface.  ping -I pp=
p0
>     > 10.0.0.1 / ping -I ppp0 10.0.0.2 works but ping 10.0.0.1 / ping
>     > 10.0.0.2 does not work,
>
> Android does stuff with the networking stack so that it can live in multi=
ple
> provider domains.   So the default route (if it exists) often lives in a
> alternate routing table.
>
>     > I have verified the ip route, ip tables, ip addr show as well as
>     > ifconfig (both on linux and aosp target). Seems to be all good in i=
t.
>     > Any suggestions?
>
> you didn't post details, but..
>
> if you tcpdump on your Ubuntu side, you'll probably see that AOSP side ha=
s
> picked some other IP address as the source.  If you really want to fix th=
at,
> then add a route back to the ppp0 device on the ubuntu side, but probably=
 you
> just need to make sure that the Android side always uses the right source=
 IP.
>
>
>
>
> --
> Michael Richardson <mcr+IETF@sandelman.ca>, Sandelman Software Works
>  -=3D IPv6 IoT consulting =3D-                      *I*LIKE*TRAINS*
>
>
>

