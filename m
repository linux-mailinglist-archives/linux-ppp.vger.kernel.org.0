Return-Path: <linux-ppp+bounces-86-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F055974727
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Sep 2024 02:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC97B28778D
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Sep 2024 00:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A723AD5A;
	Wed, 11 Sep 2024 00:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=in-unison.com header.i=@in-unison.com header.b="qnx1K0nn"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335508488
	for <linux-ppp@vger.kernel.org>; Wed, 11 Sep 2024 00:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726013455; cv=none; b=hlF8rNcaeD+L8Tr4HeW9lO3B1w8ciy79g12NPBzE0aOylf1uWBSF+JF02XqBzrC1oCSGddRziIrAQj16vrMMu+7YV671isSQT66Y+BWG77N1G9p1EQ8nyJZirGjnD391eqIDdso2+LuAt1GorsVqm+qHPQegCdRM4bEIPTrFJIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726013455; c=relaxed/simple;
	bh=6TyAUpdmqXJANVsyhLG4wtV74KKtzs4X9KfYwVyoxDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKkL6FE8eSTG9pnqEOJGerVfZzKC/8UpUG30QVOqlHrq7Gb1+jiZ7vDg2zrWCJVlkKu6zWPuJmBU0LWRF27WMwhcNnGfZ/HHyZmKfcrlTgnRoQ7NbCaX2ICxQwwRObeJkvTbWttgd9p6VT7dylcgHm94Poi6YWgOzsYCuZbjmcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-unison.com; spf=pass smtp.mailfrom=in-unison.com; dkim=pass (2048-bit key) header.d=in-unison.com header.i=@in-unison.com header.b=qnx1K0nn; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-unison.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-unison.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5356d34ef19so942167e87.2
        for <linux-ppp@vger.kernel.org>; Tue, 10 Sep 2024 17:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=in-unison.com; s=google; t=1726013451; x=1726618251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ET2mIwJiDoq9jskFCVFQcf9gmjSIYqvap97ekpCbT58=;
        b=qnx1K0nndparEnBBtR2xt7UNrBejQwWbSA+oSrY0qPE5DiRsE8OfbPTZpB0NVDlbyG
         E+JMOjxV0JBxNw/Y0lkQla6lkK41f0lubCs8wdeWRGzR97S2A/heDAELObvDMY8CO7cu
         FClik2xUGzOrLTJ8AX+hFzfhhq6k0Pkd3H/fATvbCGo8GDGnDy6/GF2ywd44lzncLMRJ
         x4oaDtJmihGEQRXkHNLUr9HM48cGCOwd+ejZzh+9f1WYqXmiOv4Nj/URqFYL74jHiMX5
         ENh0txw6pC17NGa3L2B7jF8yj10slFIPGsLXoS8zBylOxfGQrrgeTYkhVVfXA9+StH2N
         navA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726013451; x=1726618251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ET2mIwJiDoq9jskFCVFQcf9gmjSIYqvap97ekpCbT58=;
        b=s+n+s5UxwSOq75A0yOBayjCAFPW7UvcHSU08fqV4871h/MKetLmVmhJuDePZta5AE4
         EqgEoYpcBUtbPvj51nFx8SqIoI69tGr3kWmtg1FeNspLubeENkJ7+QIov2DrIGD2wygW
         sYOAwkNUgrUYBR/bbOB+PRqMi3Eceae9MjbzTcas8naRXFbdOFLXiIiAYJczsiMkRjiJ
         8p9a161xJed714QhIRlf1MmMYoZdgXU673KeA1KPgrcm5vZBda+Mkfl9VxBd8qMxdm0X
         6jxwPSHnU9qnST7yi726qNlj9lWXUXDzU3Fq9IZXjcrt3qI4Ht93vJfqydzvHvr5r5O6
         GSrg==
X-Gm-Message-State: AOJu0Yw77ud731+XaK7WQglmubNdGd4W5UmwVOTPsTpeizMrZmJqOSlb
	Km0r++0V66zM7vrzXJOXsYFI9CkTzVxHl/tVZO57tf8PZSdLU021jQHFeo523bPPQj1APzRyMdn
	Ij3xWd225PUZpjciYemEJKH3PbwKUdOeQ7FbPVXoch2owhzvLQLioww==
X-Google-Smtp-Source: AGHT+IGkQKv4E7h53RyJKex76eTO+O4PxWZ03upFHw4Q/iHWC8kefdgOGHx4gucylgpzgTSL9v8Z5MFPEQqDRBTMx8M=
X-Received: by 2002:a05:6512:2356:b0:535:681d:34b6 with SMTP id
 2adb3069b0e04-5365882c1f9mr3765577e87.10.1726013450918; Tue, 10 Sep 2024
 17:10:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPKvdWd3rGxir3MEKrcfdjD4NfOQpCttv3yFPXY=Q35-8cs2Tw@mail.gmail.com>
 <358952.1725971979@dyas> <CAPKvdWdXozAW6DTtXpFix9ZYOQ956AMTqMCHhrGEX6BixA8AKw@mail.gmail.com>
 <377699.1725992617@dyas> <CAPKvdWcQH207rUofzgHYvCa6_ULs5dWxEvRbqmw5+PeYY5QYqg@mail.gmail.com>
 <ZuDb6r9xLIku_vxd@cleo.paulus.ozlabs.org>
In-Reply-To: <ZuDb6r9xLIku_vxd@cleo.paulus.ozlabs.org>
From: Devesh Chipade <devesh@in-unison.com>
Date: Tue, 10 Sep 2024 17:10:40 -0700
Message-ID: <CAPKvdWdwWCuXVn9rs7xW-wiwxZV6wf4XUF4MKt23oOPJnif3oA@mail.gmail.com>
Subject: Re: PPP Modem Hangup
To: Paul Mackerras <paulus@ozlabs.org>
Cc: linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have resolved the issue now:

I have commented out the following in my init.rc file
#service console /system/bin/sh
#    class core
#    console
#    disabled
#    user shell
#    group shell log readproc
#    seclabel u:r:shell:s0
#    setenv HOSTNAME console
#    shutdown critical

The console service was configured to use the same UART serial port
that I was using for the PPP connection.
It would interfere with pppd by resetting or controlling the serial
port, causing the "Modem hangup" issue.

I have a stable connection now running for the past 60 minutes. There
is a ppp connection established between Ubuntu Machine and my AOSP
Target Device.
I can ping from AOSP target device into the Ubuntu Machine the
following (it works):
ping -I ppp0 10.0.0.1
(I have to use -I and provide the specific interface to ping even
though the ip route is up to date)
And I cannot ping from Ubuntu to AOSP target.

Strangely, tcpdump shows that packets are received/sent back and forth
 # tcpdump -i ppp0
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on ppp0, link-type LINUX_SLL (Linux cooked v1), snapshot
length 262144 bytes
14:49:17.949046 IP 10.0.0.1 > 10.0.0.2: ICMP echo request, id 552, seq
618, length 64
14:49:18.320546 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 15, seq
34, length 64
14:49:18.351262 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 15, seq
34, length 64
14:49:18.972947 IP 10.0.0.1 > 10.0.0.2: ICMP echo request, id 552, seq
619, length 64
14:49:19.321893 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 15, seq
35, length 64
14:49:19.353363 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 15, seq
35, length 64
14:49:19.997088 IP 10.0.0.1 > 10.0.0.2: ICMP echo request, id 552, seq
620, length 64
14:49:20.323381 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 15, seq
36, length 64
14:49:20.356685 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 15, seq
36, length 64

I am not blocked any more, but it would be good to know if there is a way f=
or:
1. I would be able to ping from Ubuntu machine as well into the AOSP target
2. Ideally, ping should work without -I and having to explicitly
mention the interface
(something like just ping 10.0.0.1 should work instead of ping -I ppp0 10.0=
.0.1

Thank you.

On Tue, Sep 10, 2024 at 4:53=E2=80=AFPM Paul Mackerras <paulus@ozlabs.org> =
wrote:
>
> On Tue, Sep 10, 2024 at 11:30:48AM -0700, Devesh Chipade wrote:
> > In my options file, I have debug and kdebug 7.
> > This is all the logs I could get:
>
> The pppd logs look fine.  There is nothing in the kernel (dmesg) log
> that looks relevant (in fact kdebug 7 is mostly useful if you are
> actually debugging the kernel driver; it doesn't really help with
> problems like this).
>
> Do you have logs from pppd on the ubuntu/linux side?  Is something
> causing it to terminate?
>
> Alternatively, do you have another service running on either side
> which also thinks it is using the same serial port?  Something like a
> getty, or whatever the systemd equivalent is for providing a login
> prompt?  You could do "fuser /dev/ttyMSM0" or "fuser /dev/ttyUSB0" as
> root during the 6 seconds when the link is up to check if something
> other than pppd also has the serial port open.
>
> Paul.

