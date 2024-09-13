Return-Path: <linux-ppp+bounces-87-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E4097767C
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Sep 2024 03:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A767C1F24DC0
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Sep 2024 01:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45BB4A06;
	Fri, 13 Sep 2024 01:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=in-unison.com header.i=@in-unison.com header.b="hgFw1/3P"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B962E4A3E
	for <linux-ppp@vger.kernel.org>; Fri, 13 Sep 2024 01:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726191814; cv=none; b=VyHHkZiwVL5l/pRj33eKEiDPzlY27MR9r1J5TOeWQ8JIuvgR7bgx7ll1YvAlThPWz/DRMlFRt8U5zK8OQxq8OOsw6TW22//r5YH0jPacfbNaFbQOrKOA0chU4hTq29p7AzSW1modomgNqKStjRVJRm9G9homhPAjUdLde/KmIWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726191814; c=relaxed/simple;
	bh=SDOjLaGYG+G+sBSpwN4TBxn/jmFHeKzSPoNovfdCfP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OZafZ7k0dYt5ZjThCO07NyAdx0SpQfJAxXtMIkcy9O7CgWyyUHSiVLi1AIKx5vpsKj7mpol0LZuUgou7K7uuLh39xFvtyzIASoh3tl+yUrF2eN0uHAC9MIc3vXgNc4SQfDyf5v0/j1XJ1baAliIc9qAGi86yr5LAAcwTHrYlfgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-unison.com; spf=pass smtp.mailfrom=in-unison.com; dkim=pass (2048-bit key) header.d=in-unison.com header.i=@in-unison.com header.b=hgFw1/3P; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-unison.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-unison.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53567019df6so226822e87.0
        for <linux-ppp@vger.kernel.org>; Thu, 12 Sep 2024 18:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=in-unison.com; s=google; t=1726191809; x=1726796609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvAN0RtJsagkckoWh5uMkf/lrwYK+OOHv+GYsc7GlDU=;
        b=hgFw1/3PVTtUyz/nPbJh1wkpCQb5Bycw07UjsIodMpbX3PKE3xhjAWLyh/p2zJeEZI
         c4eMGFQHArPb87RXlZ+6hG5ToupiipKxnWfVclwUnBcfBD4ymxE9RnjDNZ5caYJ9qZyU
         80Zw59wGd2eWl/jjnbWivH3Nrg/VpbcEqpl01xrRq8d/E8wmGtY5yDiQcUVeNoTRSgOu
         YsMoMoZqQCyerRszXWfKT48Og97c93gWMbg+kHowT8owYmvhpoq1lmgnGpHQX6iL+OTS
         JjK4/Ob5u0iYRvW0d+EAQZ8U+pS9Hjewx0dGKIhe5LzcJGmPKqCPwLPn/4yPbEI0kTW8
         rtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726191809; x=1726796609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvAN0RtJsagkckoWh5uMkf/lrwYK+OOHv+GYsc7GlDU=;
        b=bwGKgZWm3Iczvs9oevM4Wr3RmPZfxPjDhfAppcFFxaQSiijFE3qqPEKz+3l+1KUkfW
         /GdUDatSbAIdsNYn8Z5p6Ebvq3/8/25JULds8w0cp+jPYTqbuwLlNDIt1z8s6lqkrEyx
         Uj8otUW5LLuR/MI+mEpXUymHz00Ke2VtFubh7JWi8jey8bSKlEq8EDEa+cpYJxTd17Dr
         DblLrxOstqPd4vUoWyMFI8I3B/Cnfn8GTq18mAT7YB6VDEY3sTrup6tsv5ID2mi2F6Qo
         3bLbzN0olGUQZFCf4T2iWWWrqzJ2k3UsQ5hCqFBF3aE/oyXEhYfWsvNSyvaBrgF9RLZA
         T7Lg==
X-Gm-Message-State: AOJu0YxIj9iIzI2p4OX+GW53q59VvYHVtpANwQuosH4A6NgRIoX7nNBS
	wmzfn99pgKierezhwUAoJeMDiGZ39qaBmMI6ov2ctYqaCYZxNFKaSOIZHNl1kMjRJfNrH5kSLsa
	im723mRZalId5/m8ejZWmny44DNBVJk1zOi8cDeCGyFlFP2vhkrE=
X-Google-Smtp-Source: AGHT+IF6deCUUq/fAef1sjCBaDXoiV5+pPGLpeFd8bc7g6V+0142Xx/92H9Eh1VrzCS78Orjac3tffKY2Cf2uE14fdA=
X-Received: by 2002:a05:6512:3f17:b0:52e:ccf5:7c3e with SMTP id
 2adb3069b0e04-53678fef719mr734104e87.7.1726191808426; Thu, 12 Sep 2024
 18:43:28 -0700 (PDT)
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
In-Reply-To: <CAPKvdWdwWCuXVn9rs7xW-wiwxZV6wf4XUF4MKt23oOPJnif3oA@mail.gmail.com>
From: Devesh Chipade <devesh@in-unison.com>
Date: Thu, 12 Sep 2024 18:43:17 -0700
Message-ID: <CAPKvdWf=Ey-XFvsF=bsZPgsE-Jgf5abspukPWCGh-oR9GSQWEw@mail.gmail.com>
Subject: Re: PPP Modem Hangup
To: Paul Mackerras <paulus@ozlabs.org>
Cc: linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am still not able to ping into ubuntu/linux or into my aosp target
device without explicitly mentioning -I ppp0 interface.
ping -I ppp0 10.0.0.1 / ping -I ppp0 10.0.0.2 works
but
ping 10.0.0.1 / ping 10.0.0.2 does not work,

I have verified the ip route, ip tables, ip addr show as well as
ifconfig (both on linux and aosp target). Seems to be all good in it.
Any suggestions?

On Tue, Sep 10, 2024 at 5:10=E2=80=AFPM Devesh Chipade <devesh@in-unison.co=
m> wrote:
>
> I have resolved the issue now:
>
> I have commented out the following in my init.rc file
> #service console /system/bin/sh
> #    class core
> #    console
> #    disabled
> #    user shell
> #    group shell log readproc
> #    seclabel u:r:shell:s0
> #    setenv HOSTNAME console
> #    shutdown critical
>
> The console service was configured to use the same UART serial port
> that I was using for the PPP connection.
> It would interfere with pppd by resetting or controlling the serial
> port, causing the "Modem hangup" issue.
>
> I have a stable connection now running for the past 60 minutes. There
> is a ppp connection established between Ubuntu Machine and my AOSP
> Target Device.
> I can ping from AOSP target device into the Ubuntu Machine the
> following (it works):
> ping -I ppp0 10.0.0.1
> (I have to use -I and provide the specific interface to ping even
> though the ip route is up to date)
> And I cannot ping from Ubuntu to AOSP target.
>
> Strangely, tcpdump shows that packets are received/sent back and forth
>  # tcpdump -i ppp0
> tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
> listening on ppp0, link-type LINUX_SLL (Linux cooked v1), snapshot
> length 262144 bytes
> 14:49:17.949046 IP 10.0.0.1 > 10.0.0.2: ICMP echo request, id 552, seq
> 618, length 64
> 14:49:18.320546 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 15, seq
> 34, length 64
> 14:49:18.351262 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 15, seq
> 34, length 64
> 14:49:18.972947 IP 10.0.0.1 > 10.0.0.2: ICMP echo request, id 552, seq
> 619, length 64
> 14:49:19.321893 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 15, seq
> 35, length 64
> 14:49:19.353363 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 15, seq
> 35, length 64
> 14:49:19.997088 IP 10.0.0.1 > 10.0.0.2: ICMP echo request, id 552, seq
> 620, length 64
> 14:49:20.323381 IP 10.0.0.2 > 10.0.0.1: ICMP echo request, id 15, seq
> 36, length 64
> 14:49:20.356685 IP 10.0.0.1 > 10.0.0.2: ICMP echo reply, id 15, seq
> 36, length 64
>
> I am not blocked any more, but it would be good to know if there is a way=
 for:
> 1. I would be able to ping from Ubuntu machine as well into the AOSP targ=
et
> 2. Ideally, ping should work without -I and having to explicitly
> mention the interface
> (something like just ping 10.0.0.1 should work instead of ping -I ppp0 10=
.0.0.1
>
> Thank you.
>
> On Tue, Sep 10, 2024 at 4:53=E2=80=AFPM Paul Mackerras <paulus@ozlabs.org=
> wrote:
> >
> > On Tue, Sep 10, 2024 at 11:30:48AM -0700, Devesh Chipade wrote:
> > > In my options file, I have debug and kdebug 7.
> > > This is all the logs I could get:
> >
> > The pppd logs look fine.  There is nothing in the kernel (dmesg) log
> > that looks relevant (in fact kdebug 7 is mostly useful if you are
> > actually debugging the kernel driver; it doesn't really help with
> > problems like this).
> >
> > Do you have logs from pppd on the ubuntu/linux side?  Is something
> > causing it to terminate?
> >
> > Alternatively, do you have another service running on either side
> > which also thinks it is using the same serial port?  Something like a
> > getty, or whatever the systemd equivalent is for providing a login
> > prompt?  You could do "fuser /dev/ttyMSM0" or "fuser /dev/ttyUSB0" as
> > root during the 6 seconds when the link is up to check if something
> > other than pppd also has the serial port open.
> >
> > Paul.

