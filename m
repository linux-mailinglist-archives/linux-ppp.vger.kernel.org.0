Return-Path: <linux-ppp+bounces-345-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A3DB3BF40
	for <lists+linux-ppp@lfdr.de>; Fri, 29 Aug 2025 17:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF8551CC0BCA
	for <lists+linux-ppp@lfdr.de>; Fri, 29 Aug 2025 15:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13541FDA8E;
	Fri, 29 Aug 2025 15:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPH0PtLl"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CC71FFC46;
	Fri, 29 Aug 2025 15:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756481472; cv=none; b=TZJOu1jSRQtZYfo1KNPUYulOqJ+K4qRs3SWFi6bdDuogyjQGDoLC//Pv6nRnEeMf19oIfOvrnibDV8Msgvx7DbKCwQ2M+hg38NWXp3huOnj4jZbkHi0PDjCq0TT/NL2eC3qt6l2GJvBEgDDA5QZiqkuVoZFF7gymPNByylrBQvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756481472; c=relaxed/simple;
	bh=cNuhgCQH45pDFYK27TItButjs7WXUbjpdGFncEFNkGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=piUuzxvIWt2cGUKQll3Z5kLW7IKdbq7tJzSXUMhFH36wrWttwPzDw3pRC+2iwlZaq3wl0UGMMH2UYcxSX0NW/pbmgBDYhYZfWeNlWTgnKzuqdwVfM0cnk90jgSqQJAsWfNL3nGVIO5rh42hcMA7Ne3z70On4310j5Rux6gcv4fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPH0PtLl; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-71d603cebd9so21348357b3.1;
        Fri, 29 Aug 2025 08:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756481470; x=1757086270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNuhgCQH45pDFYK27TItButjs7WXUbjpdGFncEFNkGc=;
        b=BPH0PtLlmlWikup4C6E/bqfBrWkHb8fO209MqG/ME2HiS+LpaExttuRtAQ04gMlSvw
         zjev90rnJB6YTJ1Re+VyR2WR2m4PGXfJKKMJqYXvZ8u+t5VFJqT3Kj/sUp9DJE02gJeY
         9f0baZsehBJKsG3/iburqCqWUJZbT7yxpA/rnTqDg2rpGyHZoh3oJ6tJNi7Zfi0Fkiuk
         PGxd6HsoW93NwqfbrfOwxuyTatxKVuDdX97c3Whw22rDb1jglyj7Q1I/cHAIaN6hEXeo
         J1ZQY1jIt/gUdB05LYjE0r38uk7Id+5MonWVrCHa0YFZyBF2LcnQ90xiF4VagYuMBtEa
         C+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756481470; x=1757086270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNuhgCQH45pDFYK27TItButjs7WXUbjpdGFncEFNkGc=;
        b=EmJFKto5ciE/Xb4NXuBpFfirVAe1bXxZIUpxD5HF2zVxTM9iXjGMBdRJmTXb3vUxy9
         PdSn7UQdGfW+90DJuGmul0jaRTTKcR9dGQ0WkXLBsx6dclqr01B8sQYYP+ynx4NU8SnF
         /6XtgNVo+tihNTvLHtD0vaKL6H8G3jtIPQa7TpIbz1QcLBWcB8wacbp70RSlZGdTsuQ9
         3ZWlmbp32zgnWWfJPDjDB4TbXnQaRPmu62ZD1JApBTPbKCQQOdtMX5uueZe1Osuox9Hd
         Opj//Aa2PgV3Why6FmvzV4TxzLQfpXCVLZNI9tlIPGOnGEUrEK75cGXmYymqeXDhcPSq
         wOAg==
X-Forwarded-Encrypted: i=1; AJvYcCU8nzAYLxxxP9dEeY4XzxdOuYli3wpw9YpOYfFCyGdyx6tmrrTfRP9f6M6A6Yj5pgYbYncNpM5WCl9oQ8Y=@vger.kernel.org, AJvYcCV3VXEforguEEOGpF4w8GOB0iSfJbBLLX/ZjoXFys601hqlHqmYMkM7zKY4TBxwMTrdZXNEqCI8Wgeg@vger.kernel.org, AJvYcCVvH6bxl3axNbUIQjeu5pux2FYy6ePgIGR82nAFZbQGpOSmrnIaCp6GOC3gl8uT/7ZF0awFjptb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8YNx6d+veB0LmRxI48UUq2GxVftwLB5de81KXnW98qNA1t/dV
	hwspwnYBFaDILE2ljvG0p5mTEzfImWZaUAWQBGL69KcjgJYkBwijRUcgZCbS6B0l/8G5hOGfFrA
	wJR3gYhmFqKuDjuV4mombcXw2rmyjjU0=
X-Gm-Gg: ASbGnctghsJMcmFgJU3EC9Qfhtauu3omWFFvGLq0963ORRIFiB7X6pdgqSvls4LV+im
	IGfZULhh/YKGRRelch0h3OCipQs/Gae5+p0l22QICAsmeYrYtTgrgK5WgQMyUjmhgem9DNGpM7Q
	EBSgbWNPw/olvJ+2FxeDMeMmcc1UlN2OioTFKk3oU+xx8exS0hBrSPR/oCL1d+OiJNiXAZ1dOz9
	5B6Zts+eyPOS/9SJXwEqscSTSYcTIIQbxtqGnyQKKZGbrLJsA==
X-Google-Smtp-Source: AGHT+IHIxVY8ixW3N77AaSLxKCp74/xP+r4ANXHCz2RBpL+6X2caBUkQ/hXqYMB2k0RZrwev7hIP+1Nsfezz9z244vY=
X-Received: by 2002:a05:690c:250a:b0:721:369e:44f3 with SMTP id
 00721157ae682-721369e654amr162298947b3.47.1756481469830; Fri, 29 Aug 2025
 08:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPB3MF5apjd502qpepf8YnFhJuQoFy414u8p=K1yKxr3_FJsOg@mail.gmail.com>
In-Reply-To: <CAPB3MF5apjd502qpepf8YnFhJuQoFy414u8p=K1yKxr3_FJsOg@mail.gmail.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Fri, 29 Aug 2025 23:30:57 +0800
X-Gm-Features: Ac12FXx1IP5Bh0MdTYiC7LoDxPPojbznDNEZSfwmjdq_CYepOlXZWFtKcN7X1SE
Message-ID: <CALW65jY4MBCwt=XdzObMQBzN5FgtWjd=XrMBGDHQi9uuknK-og@mail.gmail.com>
Subject: Re: [Regression Bug] Re: [PATCH net v3 2/2] ppp: fix race conditions
 in ppp_fill_forward_path
To: cam enih <nanericwang@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, kuniyu@google.com, linux-kernel@vger.kernel.org, 
	linux-ppp@vger.kernel.org, nbd@nbd.name, netdev@vger.kernel.org, 
	pabeni@redhat.com, pablo@netfilter.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Fri, Aug 29, 2025 at 9:05=E2=80=AFPM cam enih <nanericwang@gmail.com> wr=
ote:
>
> Hi all,
> Having upgraded from 6.12.43 to 6.12.44, my kernel crashed at early boot.=
 The root cause is most likely related to the commit 94731cc551e29511d85aa8=
dec61a6c071b1f2430 (Fixes: f6efc675c9dd ("net: ppp: resolve forwarding path=
 for bridge pppoe devices")). Please confirm, thanks.

Does this happen only if you set up a PPPoE connection?

>
> -Eric
>
> ```
> Aug 29 20:36:16 localhost kernel: NET: Registered PF_PPPOX protocol famil=
y
> Aug 29 20:36:17 localhost systemd-networkd[266]: Failed to parse hostname=
, ignoring: Invalid argument
> Aug 29 20:36:17 localhost systemd-networkd[266]: br0: DHCPv4 server: DISC=
OVER (0xebeec00c)
> Aug 29 20:36:17 localhost kernel: BUG: kernel NULL pointer dereference, a=
ddress: 0000000000000058
> Aug 29 20:36:17 localhost kernel: #PF: supervisor read access in kernel m=
ode
> Aug 29 20:36:17 localhost kernel: #PF: error_code(0x0000) - not-present p=
age
> Aug 29 20:36:17 localhost kernel: PGD 0 P4D 0
> Aug 29 20:36:17 localhost kernel: Oops: Oops: 0000 [#1] PREEMPT_RT SMP
> Aug 29 20:36:17 localhost kernel: CPU: 1 UID: 981 PID: 266 Comm: systemd-=
network Not tainted 6.12.44-xanmod1-1-lts #1

Looks like it's a downstream fork:
https://gitlab.com/xanmod/linux/-/releases/6.12.44-xanmod1
Have you reported to them too?

> Aug 29 20:36:17 localhost kernel: Hardware name: Default string Default s=
tring/Default string, BIOS 5.19 03/30/2021
> Aug 29 20:36:17 localhost kernel: RIP: 0010:0xffffffffb32b2f6c
> Aug 29 20:36:17 localhost kernel: Code: 85 8e 01 00 00 48 8b 44 24 08 48 =
8b 40 30 65 48 03 05 48 26 d6 4c e9 f0 fd ff ff e8 5e 9c c1 ff e9 ca fc ff =
ff 49 8b 44 24 18 <48> 8b 40 58 48 3d 00 e3 65 b3 0f 84 0f 01 00 00 48 89 c=
2 48 8d 78
> Aug 29 20:36:17 localhost kernel: RSP: 0018:ffff9bd080c778d8 EFLAGS: 0001=
0246
> Aug 29 20:36:17 localhost kernel: RAX: 0000000000000000 RBX: ffff9bd080c7=
7a00 RCX: 0000000000000001
> Aug 29 20:36:17 localhost kernel: RDX: 0000000000000000 RSI: 000000000002=
a424 RDI: ffffffffb38b6040
> Aug 29 20:36:17 localhost kernel: RBP: ffff999345ad1000 R08: 000000000000=
0003 R09: 0000000000000000
> Aug 29 20:36:17 localhost kernel: R10: ffff999342eb7900 R11: 000000000000=
0000 R12: ffff9bd080c77948
> Aug 29 20:36:17 localhost kernel: R13: 0000000000000008 R14: 000000000000=
0000 R15: 0000000090000000
> Aug 29 20:36:17 localhost kernel: FS: 00007fc0bab148c0(0000) GS:ffff9994b=
7d00000(0000) knlGS:0000000000000000
> Aug 29 20:36:17 localhost kernel: CS: 0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
> Aug 29 20:36:17 localhost kernel: CR2: 0000000000000058 CR3: 000000010b43=
8006 CR4: 0000000000b70ef0
> Aug 29 20:36:17 localhost kernel: Call Trace:
> Aug 29 20:36:17 localhost kernel: <TASK>
> Aug 29 20:36:17 localhost kernel: ? 0xffffffffb321d725
> Aug 29 20:36:17 localhost kernel: 0xffffffffb32b4197
> Aug 29 20:36:17 localhost kernel: 0xffffffffb32f5d6c
> Aug 29 20:36:17 localhost kernel: ? 0xffffffffb32b8c40
> Aug 29 20:36:17 localhost kernel: ? 0xffffffffb3212da5
> Aug 29 20:36:17 localhost kernel: 0xffffffffb3212da5
> Aug 29 20:36:17 localhost kernel: 0xffffffffb32131ea
> Aug 29 20:36:17 localhost kernel: 0xffffffffb32152ea
> Aug 29 20:36:17 localhost kernel: 0xffffffffb3364479
> Aug 29 20:36:17 localhost kernel: ? 0xffffffffb3364485
> Aug 29 20:36:17 localhost kernel: ? 0xffffffffb3215617
> Aug 29 20:36:17 localhost kernel: ? 0xffffffffb2f2cd31
> Aug 29 20:36:17 localhost kernel: ? 0xffffffffb33684f7
> Aug 29 20:36:17 localhost kernel: 0xffffffffb34000b0

Do they have a debug kernel image with KALLSYMS, so I won't be looking
at some random hex?

Thanks
- Qingfang

