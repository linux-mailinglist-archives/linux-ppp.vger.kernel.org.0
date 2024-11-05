Return-Path: <linux-ppp+bounces-107-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDE49BD007
	for <lists+linux-ppp@lfdr.de>; Tue,  5 Nov 2024 16:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 572371C2119F
	for <lists+linux-ppp@lfdr.de>; Tue,  5 Nov 2024 15:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F4A1D7E46;
	Tue,  5 Nov 2024 15:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuPVa2Yv"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E0C33080;
	Tue,  5 Nov 2024 15:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730819097; cv=none; b=dlCba3sOzmIGGCBS/+D5cngk1nS3RDjy2Pjptfv3x0QBfQ4F+Eqa9csWEMvyqdbtPUYNQpNW3DOA9IlTXqp4u6ztcruLfQbtkcK1vYVEeISCxpvJZsVTiJfHDDSu3cGiUgrQkWiHzEafAjKLC10d0CB/KfAHY0oQyI53F3fU7CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730819097; c=relaxed/simple;
	bh=63apKU3oCK84jQYr9wI2Tor+Zn6BKoINp1mEwP9zZfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDjfc3uZVlJA/BsQkEIPhgsu2oND5XEmKTjsLKgbY1Sa3u1muPs5aXcJZX1LicyhCyZBQreJ85n2K5+4zjMh4ecPQI650ktxkAKWm4rgzfvzXMW7GbLcJDMKPAFBgD5Eku5uf3s5NfyKk9fiDd7W/eGN1nFRqJ8oPgiPTQY73QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuPVa2Yv; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e5cec98cceso44338397b3.2;
        Tue, 05 Nov 2024 07:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730819095; x=1731423895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63apKU3oCK84jQYr9wI2Tor+Zn6BKoINp1mEwP9zZfI=;
        b=TuPVa2YvHZwrp3Y3AAhN5wosKUC9E5bKSm9K5nonakYwC+2vwzAwpMpiNdQp2vYT8R
         vB1sA/WSlkk8c+w2iG2MK/ZPTCo4XHOca5ImJg2LYXfHAXaWeqTrFV1hf5lo5pfbJrDG
         1nkA9aQeYS9WCh1zrQpH8pppzv/Y6YHY50kNwT3fvYFiJalUEb2HgGNdLMP3oxC1+kWQ
         bz7hmdKLzwHH/YegTuGvO+4LtRE5lfVJZXudPlHcIBCYUSeNU+5h4ryMgVVwnyWT2EWM
         8g7Km0i8r5v+6gMcZj9KeL3hTz9fqArE6EYNt0tNVbKuslJ/uNER5oHk44P2piEQRBKH
         g7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730819095; x=1731423895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63apKU3oCK84jQYr9wI2Tor+Zn6BKoINp1mEwP9zZfI=;
        b=lTcH8bVWWgcWGDXpV9js/T3y5z3s2q6h1RHdupqwvI/L2ZJFtpm0hldN8XxXMYuT7b
         IHFGoJAL0/LSc8k1dBgEP6VKyx5mCgzHhTDrFfFihjCqjQC763l+jeFPzSKBd1XvIHMp
         nKJ6qVqxmEWGRIzadMEp30j5m2Rcb3q33P+yjuZrT53Qi97/J/KXELP5EQqJImsJ+4RW
         o+DflTMf5SN67vRWSSZnpGtrAEy8fVmRITSEY7XzksREOnrvXF+AwMBBcTWz5Dm5lJuw
         DXugH+iFCg31Y7vVDEZuvsFhEZ8duLh/MWjUqgTIZp2BdxwNYixa8cuGinVj+yJqma3E
         pZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCVW6XpdA0RMOvbN6crWl0TuKz+cqJBIz9YjsR2M3m+n9HRDadDY6XHaReVSYgDam6Ka166xnYZz@vger.kernel.org, AJvYcCW+ps+lot2RWDkx4lTC6+rBhVv39FZDccMFjjH2g4IiLui0mhU1mzC8QokGLeC+/f4nRyBT9/sUGEFZ@vger.kernel.org, AJvYcCX/Ki4mx1F47oLqDJTRWZz2WGqJ570tpB1zauMxzVgUO4D+sOD+QExU6Ra078vq4xPUys7y8UNUI+/rEQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YytoQYD+EkygFxSeiuI+8Sul/QES8e8v9C9sPtJ4nGKF19dWtEI
	LcRk16EQwY0Xxq+8q5eofTodN5NONUcaKTWv6r4XjdowGe+NlRSW89Do0Do0YWHEkBBYOrz8SOM
	16cc3JXHokjhJAA2vBgB7yOybaDkv9eRHCa4=
X-Google-Smtp-Source: AGHT+IG9OEtgCqxYH2AGUXx+y9wCsQ2BKy/xHrqmG9IrH/j8u8vvE2+KgIidIE6DaWBTb75baRQbZmqsFfJmCge7nmI=
X-Received: by 2002:a05:690c:6ac2:b0:6ea:4d3f:df7c with SMTP id
 00721157ae682-6ea52329c6amr209250267b3.9.1730819095116; Tue, 05 Nov 2024
 07:04:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241029103656.2151-1-dqfext@gmail.com> <87msid98dc.fsf@toke.dk>
 <CALW65jbz=3JNTx-SWk21DT4yc+oD3Dsz49z__zgDXF7TjUV7Lw@mail.gmail.com> <87a5ed92ah.fsf@toke.dk>
In-Reply-To: <87a5ed92ah.fsf@toke.dk>
From: Qingfang Deng <dqfext@gmail.com>
Date: Tue, 5 Nov 2024 23:04:44 +0800
Message-ID: <CALW65jZtdy8xkNnMD2pCFKyf6JM4uwTHgt8v49M46GpCfS8cCw@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] net: ppp: convert to IFF_NO_QUEUE
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2024 at 10:35=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen <t=
oke@redhat.com> wrote:
>
> Qingfang Deng <dqfext@gmail.com> writes:
>
> > Hi Toke,
> >
> > On Tue, Nov 5, 2024 at 8:24=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen=
 <toke@redhat.com> wrote:
> >>
> >> Qingfang Deng <dqfext@gmail.com> writes:
> >>
> >> > When testing the parallel TX performance of a single PPPoE interface
> >> > over a 2.5GbE link with multiple hardware queues, the throughput cou=
ld
> >> > not exceed 1.9Gbps, even with low CPU usage.
> >> >
> >> > This issue arises because the PPP interface is registered with a sin=
gle
> >> > queue and a tx_queue_len of 3. This default behavior dates back to L=
inux
> >> > 2.3.13, which was suitable for slower serial ports. However, in mode=
rn
> >> > devices with multiple processors and hardware queues, this configura=
tion
> >> > can lead to congestion.
> >> >
> >> > For PPPoE/PPTP, the lower interface should handle qdisc, so we need =
to
> >> > set IFF_NO_QUEUE.
> >>
> >> This bit makes sense - the PPPoE and PPTP channel types call through t=
o
> >> the underlying network stack, and their start_xmit() ops never return
> >> anything other than 1 (so there's no pushback against the upper PPP
> >> device anyway). The same goes for the L2TP PPP channel driver.
> >>
> >> > For PPP over a serial port, we don't benefit from a qdisc with such =
a
> >> > short TX queue, so handling TX queueing in the driver and setting
> >> > IFF_NO_QUEUE is more effective.
> >>
> >> However, this bit is certainly not true. For the channel drivers that
> >> do push back (which is everything apart from the three mentioned above=
,
> >> AFAICT), we absolutely do want a qdisc to store the packets, instead o=
f
> >> this arbitrary 32-packet FIFO inside the driver. Your comment about th=
e
> >> short TX queue only holds for the pfifo_fast qdisc (that's the only on=
e
> >> that uses the tx_queue_len for anything), anything else will do its ow=
n
> >> thing.
> >>
> >> (Side note: don't use pfifo_fast!)
> >>
> >> I suppose one option here could be to set the IFF_NO_QUEUE flag
> >> conditionally depending on whether the underlying channel driver does
> >> pushback against the PPP device or not (add a channel flag to indicate
> >> this, or something), and then call the netif_{wake,stop}_queue()
> >> functions conditionally depending on this. But setting the noqueue fla=
g
> >> unconditionally like this patch does, is definitely not a good idea!
> >
> > I agree. Then the problem becomes how to test if a PPP device is a PPPo=
E.
> > It seems like PPPoE is the only one that implements
> > ops->fill_forward_path, should I use that? Or is there a better way?
>
> Just add a new field to struct ppp_channel and have the PPoE channel
> driver set that? Could be a flags field, or even just a 'bool
> direct_xmit' field...

Okay, I'll send a patch later.

>
> -Toke
>

