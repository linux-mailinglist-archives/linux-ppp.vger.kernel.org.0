Return-Path: <linux-ppp+bounces-310-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43850AEAF21
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Jun 2025 08:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D68C37AA127
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Jun 2025 06:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44DA6214813;
	Fri, 27 Jun 2025 06:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bg+rhwJt"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6D01D5154
	for <linux-ppp@vger.kernel.org>; Fri, 27 Jun 2025 06:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751006678; cv=none; b=RH2AGjvvnzYP+DQhM93aW7GRxWxJp3v0qepTcRJlSqCxOM0UqmjP8XktswVUvhA+V+0PetrRop6oZe6aOvQ9M9BbMkRcIG2rZx/NDuncMCMa7yL7767PkEO0+vTZthvcFKBXJDSczI4GIYXknzzNwiwz/J8LTSxqmp8b4iXVj2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751006678; c=relaxed/simple;
	bh=al0hP3jK7BMgOXJbds9j4gsxtWUZxEhNq2cDmR5SwyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=siYMaPrBM+Y6Rcv0LzE3QLGXVR3hS8zqUX54mbMlmhJov+CPGd1txEcxXfUR6LPaYwK3HLOzArRXd+zy/xJF++85EcznqB+znEn0wR1ieJMm2tNOjNGUm2vnB4XrY9iYOGfpStpJ5cwSxxHtav2HasQPvLmPWgAWoiFNmkiXD30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bg+rhwJt; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a5851764e1so34845751cf.2
        for <linux-ppp@vger.kernel.org>; Thu, 26 Jun 2025 23:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751006675; x=1751611475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=al0hP3jK7BMgOXJbds9j4gsxtWUZxEhNq2cDmR5SwyY=;
        b=bg+rhwJtjuCvWKjaO2SL2WgEc5oLgxXFiDpL6om96q6yHnyT+EyioDhclyWTRYab/4
         mfvuOLow6Pl+Heb1fEDsd+fz7gqDCIXAbzdvBB5bypa6xI3B9DVu++Nu/QzSYLM3tPFW
         0ISCgI0sFS7N+1zTkVSNGPgvjWPgpEHFhc9DgvoAB66WuljMnAVJgpsZybWo7hriTIPI
         6VVcbqm0G9/FaiY5yq2K0WUxmpyRopgWudrPpS8dFHOxL+Ie11cAQGrMBbavwmFS6XN/
         lx+Um/cHUwK+qmXKzfLEZ70kT25BiwuBDcDdqIE8cGxQQcHuEQQKI1yRHsPwQnWlaYsz
         kb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751006675; x=1751611475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=al0hP3jK7BMgOXJbds9j4gsxtWUZxEhNq2cDmR5SwyY=;
        b=ugVcjTBScDKCr1SDjTBDIBg3RHix6Exia4TEOowsxdad4MlyoJ5UtgRDboTqfjprKL
         KlMbeVXa+flHbH72jGSqNLWuho3p5/TJGVuoGnCA3nSIudE9PjfNCtd/AMIaSjEONyEO
         uJTBOs2t42mxDk2c+v670+tiG5W1wuHs4G+naVe599StAM/FFqqnfI0OJ1iPo0w20shZ
         WcOZ6HRlrigi9kqf+XssfPcHebsGK/TOdcahtZ+1UIZK/wk0EiQa9qJdDmTLYbuJWmD3
         1409ESV4PYRjrrCsGLgY0nj1w0+mes+WYnGhS8hMfWhh+BoBcjUfc/mCmcbzX+JEJ36Q
         0SoA==
X-Forwarded-Encrypted: i=1; AJvYcCUhd+FUfOxDuJJK4wYE42NTPP6xnsjVkQmS5Sl5+yD/cfpWycIiaoXorQegqKF8wqzpsbV5gvNeUUc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/v2ISkywhNmB13vptPl9yffvTmbkOfME8tDXREoQ0CjCCZGKg
	9P8kJRYX8UGfPmFXyf0xCCo+5oJox2R7QAGBKntq4Mgczkqk3B41449DLEPUcVx8jQnOu2B+RXm
	ZLsNGFAApqoh8OYh76+7UqeMiAJRfrcu3xfm279yV
X-Gm-Gg: ASbGncu0xIh3edR9oG78zBlpOe/LGLMk+LxjCKKBIP7tDVdVcd/FEuScRU8vLI1mP4h
	3DVYLxXupNAcuYwC96I0Ae4bLdamjpkYFiAFR/RDObZWF3VekvVWcfWj9cM4KdITeuTa7Jolnyq
	e+KoGXmcbjydCheO3gj30SlEHPVk+BjsK8zDVyUF+IiA==
X-Google-Smtp-Source: AGHT+IEPBqWT/GV01Fy00IJ77bWCUdtJK/GlNaGd/pKF+Z/UsurcBd54QfHuDJmPQ+IFuYw4TsscuIy8eVOU5/Hm7c0=
X-Received: by 2002:ac8:5f0d:0:b0:4a3:5ba8:4978 with SMTP id
 d75a77b69052e-4a7fca45d98mr40468011cf.21.1751006669534; Thu, 26 Jun 2025
 23:44:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625034021.3650359-1-dqfext@gmail.com> <20250625034021.3650359-2-dqfext@gmail.com>
 <aF1z52+rpNyIKk0O@debian> <CALW65jasGOz_EKHPhKPNQf3i0Sxr1DQyBWBeXm=bbKRdDusAKg@mail.gmail.com>
In-Reply-To: <CALW65jasGOz_EKHPhKPNQf3i0Sxr1DQyBWBeXm=bbKRdDusAKg@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 26 Jun 2025 23:44:18 -0700
X-Gm-Features: Ac12FXw8B5uCF1YYGK-NP__GnNnDRKGjEfGKypkayVaYnKX9pkP04LmQrIHb8dk
Message-ID: <CANn89i+GO3jSDs94SaqvC8FvO9uv4Jyn_Q0W752QcvRSPLnzcQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] ppp: convert rlock to rwlock to improve RX concurrency
To: Qingfang Deng <dqfext@gmail.com>
Cc: Guillaume Nault <gnault@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 9:00=E2=80=AFPM Qingfang Deng <dqfext@gmail.com> wr=
ote:
>
> On Fri, Jun 27, 2025 at 12:23=E2=80=AFAM Guillaume Nault <gnault@redhat.c=
om> wrote:
> > That doesn't look right. Several PPP Rx features are stateful
> > (multilink, compression, etc.) and the current implementations
> > currently don't take any precaution when updating the shared states.
> >
> > For example, see how bsd_decompress() (in bsd_comp.c) updates db->*
> > fields all over the place. This db variable comes from ppp->rc_state,
> > which is passed as parameter of the ppp->rcomp->decompress() call in
> > ppp_decompress_frame().
> >
> > I think a lot of work would be needed before we could allow
> > ppp_do_recv() to run concurrently on the same struct ppp.
>
> Right. I think we can grab a write lock where it updates struct ppp.

tldr: network maintainers do not want rwlock back.

If you really care about concurrency, do not use rwlock, because it is
more expensive than a spinlock and very problematic.

Instead use RCU for readers, and spinlock for the parts needing exclusion.

Adding rwlock in network fast path is almost always a very bad choice.

Take a look at commit 0daf07e527095e6 for gory details.

