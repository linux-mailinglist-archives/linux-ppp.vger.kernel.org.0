Return-Path: <linux-ppp+bounces-105-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1946F9BCF35
	for <lists+linux-ppp@lfdr.de>; Tue,  5 Nov 2024 15:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5825283E43
	for <lists+linux-ppp@lfdr.de>; Tue,  5 Nov 2024 14:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D5D1D8DEE;
	Tue,  5 Nov 2024 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1lqxFFu"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226C61D86CE;
	Tue,  5 Nov 2024 14:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730816736; cv=none; b=nDwSNQKg+Le/ELz/pNdS4urhueE4oI1u+PAfgaUQ35rWNkNw2OPMZT8kCZqCHpQ9dQ5zu08Hl5JTGrEcG7GwDByH2FiI+cBrHNBorjrJ+qH5wLCAS5jPp7gljTriuvGA3gf6XyGkRNjmHJGudlnXJJh/dlmfaipkZ4K5dn+6SNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730816736; c=relaxed/simple;
	bh=jKywvlASPOyLP8DRMjcTka1z7/AS3/LjEEQY5ja8zGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mlxrxR5E6ZnUD5JcABelg34iEDPabCLSSeC9YcF+kJ9fQepL6a47cRTR29t7gHKnhrUIsvi90R/zaeafms+6UgvHXWp9Qs2kVTFXdlgDcFPwRDWzBr5djLI9iZj+NvfNA/tDEJZCrQTNGRX4xQQqDYPXxX/7f5M5p9EacKrEg2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1lqxFFu; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ea1407e978so51876017b3.1;
        Tue, 05 Nov 2024 06:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730816734; x=1731421534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKywvlASPOyLP8DRMjcTka1z7/AS3/LjEEQY5ja8zGY=;
        b=I1lqxFFuDCfMHdYTyg+8yxfvNm7HXkPTT3cZ6cg6iaCRZJlQDZeZqY7pJC9L08KP+R
         worx2hQJMyfD8dWl78dJAjzp9ZFqVbWUdSOS78Ru6QbwKdvqSw45gNbM2+8Zgyyl5vie
         RRtQBJedOV0z3LZtdR40LqvxxPL0OMXjF9PvGS5h340pJlSraL+ws3of9aDLfqUsGgOE
         1eFst8FrzhbQqXhcuTIfiBQqkVKu1JHVVYY0M1jHoAYshLPrSgpbJnpAPBpyLYmviX6u
         p5aAhmD1Q4SDNYt3dEPDJeM8l6IssebY7883BoTCTkyOSMB0alfwa2+/aN5o7w64q3jZ
         WscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730816734; x=1731421534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKywvlASPOyLP8DRMjcTka1z7/AS3/LjEEQY5ja8zGY=;
        b=lztN0S/MLGn2ILqL5oFjm8WefWvXCaK39tqGiIRMfXNVYxOTFo3aQYk1tm88hI3aBY
         dhTco+iecewFOm7BeKnmv0C3StniaDNDQtXuhw5ERSDqOIBGtI/i4tKpPrJmHWPk2q8i
         J6qCQYrOlvoT0TqhErmVmY0AUHKil0RrbplPExmLTG1BlKUztuvlGOXSbI+MGIs9l7FL
         +xPsT81GxZl5AqvPMS3sS+oT6GmF1z4xRaBgxQMN6SlPIP1GMucXfKKBWP0xN9pTk/7Y
         mqYs1dXfbP1ImNr5OU3U9geamcrh+blLe8bIdPZyEXzSUUCVqe+wfFBuS/IaHv3ZZnHb
         gtOA==
X-Forwarded-Encrypted: i=1; AJvYcCWjsuA68CbOIKt37Y+oyYzmwTj5YfHbLljm5fVtb+3QjYBfVeTi7JsSWhWQ2GM7TIyGD7oE0Q9n@vger.kernel.org, AJvYcCXI1r2JGjyFiqvlKMMKehtEu8BwrrrZSLmGG4C3QBZd0qMSVpAjQ+S2rpYrqqiRnfyuJXSd53S4WMjn2Ew=@vger.kernel.org, AJvYcCXgSSb9POjfQkz7Vl6LmnUxkKDnKjH1vHW0ldaSjbMJRioyRSqq0UEMdJTAVYH2+MGQH2QfnXX4wpl+@vger.kernel.org
X-Gm-Message-State: AOJu0YxSntAFe4vzIzbC5sK7/yhbEimoOKmkTw0t4UuTyeFZmswBVPMV
	LLaFZqBqwqdptHwwwYXMB+pBZ5ifZbAkLOMB3RlpdYqi8IRfrCCU8ZTr8mrDzAiKWItD6uv5ws6
	UbhYFmMhZDScmKf4cLi1NasujmWM+P3/t4iHzxA==
X-Google-Smtp-Source: AGHT+IEDBM5Bvwz4//GIAc/5kSGLSMTJSY9VJft9ffmjTPVj9SD8qtX/F3jCktuGTe4ObCtClqmNucQY7xewGhz0eYc=
X-Received: by 2002:a05:690c:360b:b0:6dd:d0fa:159e with SMTP id
 00721157ae682-6ea64bb1aa1mr166148317b3.30.1730816733948; Tue, 05 Nov 2024
 06:25:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241029103656.2151-1-dqfext@gmail.com> <87msid98dc.fsf@toke.dk>
In-Reply-To: <87msid98dc.fsf@toke.dk>
From: Qingfang Deng <dqfext@gmail.com>
Date: Tue, 5 Nov 2024 22:25:23 +0800
Message-ID: <CALW65jbz=3JNTx-SWk21DT4yc+oD3Dsz49z__zgDXF7TjUV7Lw@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] net: ppp: convert to IFF_NO_QUEUE
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Toke,

On Tue, Nov 5, 2024 at 8:24=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen <to=
ke@redhat.com> wrote:
>
> Qingfang Deng <dqfext@gmail.com> writes:
>
> > When testing the parallel TX performance of a single PPPoE interface
> > over a 2.5GbE link with multiple hardware queues, the throughput could
> > not exceed 1.9Gbps, even with low CPU usage.
> >
> > This issue arises because the PPP interface is registered with a single
> > queue and a tx_queue_len of 3. This default behavior dates back to Linu=
x
> > 2.3.13, which was suitable for slower serial ports. However, in modern
> > devices with multiple processors and hardware queues, this configuratio=
n
> > can lead to congestion.
> >
> > For PPPoE/PPTP, the lower interface should handle qdisc, so we need to
> > set IFF_NO_QUEUE.
>
> This bit makes sense - the PPPoE and PPTP channel types call through to
> the underlying network stack, and their start_xmit() ops never return
> anything other than 1 (so there's no pushback against the upper PPP
> device anyway). The same goes for the L2TP PPP channel driver.
>
> > For PPP over a serial port, we don't benefit from a qdisc with such a
> > short TX queue, so handling TX queueing in the driver and setting
> > IFF_NO_QUEUE is more effective.
>
> However, this bit is certainly not true. For the channel drivers that
> do push back (which is everything apart from the three mentioned above,
> AFAICT), we absolutely do want a qdisc to store the packets, instead of
> this arbitrary 32-packet FIFO inside the driver. Your comment about the
> short TX queue only holds for the pfifo_fast qdisc (that's the only one
> that uses the tx_queue_len for anything), anything else will do its own
> thing.
>
> (Side note: don't use pfifo_fast!)
>
> I suppose one option here could be to set the IFF_NO_QUEUE flag
> conditionally depending on whether the underlying channel driver does
> pushback against the PPP device or not (add a channel flag to indicate
> this, or something), and then call the netif_{wake,stop}_queue()
> functions conditionally depending on this. But setting the noqueue flag
> unconditionally like this patch does, is definitely not a good idea!

I agree. Then the problem becomes how to test if a PPP device is a PPPoE.
It seems like PPPoE is the only one that implements
ops->fill_forward_path, should I use that? Or is there a better way?

- Qingfang

>
> -Toke
>

