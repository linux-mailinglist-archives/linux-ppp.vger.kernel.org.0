Return-Path: <linux-ppp+bounces-335-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D00AB203D7
	for <lists+linux-ppp@lfdr.de>; Mon, 11 Aug 2025 11:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C329189FEF6
	for <lists+linux-ppp@lfdr.de>; Mon, 11 Aug 2025 09:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB6A21FF39;
	Mon, 11 Aug 2025 09:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJ/mrs4I"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64719219A9B;
	Mon, 11 Aug 2025 09:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904955; cv=none; b=t/1vJ+LJApK1sYPINoxZu17BHGzFLZ+2wkCFlTLBujO3tjTEWS/ZLhGR1EUPJYHCtBqYfAOAhbnFE/lqZvy3VO6piAC/WfuQgfKD7Hcq5Eh50w5JkJ9oyyJEdFqYty5faavqM0hAofNPThF1P1l/g1VCMeLyN7HnN3Dw5QgqVvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904955; c=relaxed/simple;
	bh=huCMHIOn/M8ds1Qx9wLzhAyBHeP/mVcrI5EZ4zAW0Uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBOUFGKolgtpZsWwwq4VhY7dk813sq16koLT0/cTQkmh87LgA12qLqR0FBhHENqdMPtQ2Saeh3RXoFM94Y2PvKF/CkuCWhbP9WNVYFIX7u5j/P0GAwKMIfxXnqgFtWt5mk4lnwrEqtpH15vcJImEM4HOuLkKCMVzNm2BNcHOVCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJ/mrs4I; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71c0ba0bea4so11748127b3.0;
        Mon, 11 Aug 2025 02:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754904953; x=1755509753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcUbaj5Xh5Mro6ZUAFV3vQZF2eNOuhYUNOO/PJ+eOAY=;
        b=KJ/mrs4ImbrSCMWDpJjNJcYES5zYkt0PUNxpTqZHZDUn5LvR6d4ky3gbarpZy8TyRs
         kpfzb1mMJTaFJlDSMm/iaVZFGLB7Pr87PPgaKWSKSwnQIKgDYZZ2Ii/Zbmk77w7/wpJM
         2yyBPeG7dLW7vZQhTmrdp8WTajSeBoPd0Sv8GZSMQZU8B2Aja1zK0lPk+kDHNrp9nuvp
         QhaScGFmNVOr03r7ixRfZ/kOPqZDNK+olcLbQdeO1UR10hs3l/EiTUwdPCqr0AnvIkDJ
         5kqrCoxbWbmBwD/drbTD0F1E+755VyUfzVFBQpVJdOEpaylqaoVvol7gzyMmAES7+BB1
         I1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904953; x=1755509753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcUbaj5Xh5Mro6ZUAFV3vQZF2eNOuhYUNOO/PJ+eOAY=;
        b=lp7P31/ICcQQdKfmCNLMVxazJjJYSVnOLyoO3la63R98PMwPYBH6ZBN5wrWJIQMudV
         R1civP6EtWjRRfg5T6avsWB/EswHQY7RwUJ0ityKfy8xImpwGnCPBWi8HNjTjFLsTRgH
         cGdVK1BzOiWhtovcgUWnIALz8R/5JBH6TLLT3I26eAMH06tPeB6zba9fOnTIYDXX44OQ
         mda6/sC4YxLtfujPNWLyTWYdd0bXXCA+qwZMeV6E9tSxP+hmSSpEq+LlOW4eupamC5pO
         VRhSfbGN8Xe+c0EuyFen0Y3OKWaWR9u8QbQS2WuCAzhviyIPYME37Z5nr80us4ileOpa
         DujA==
X-Forwarded-Encrypted: i=1; AJvYcCUOo491VMHbFY2qQXET/KnAaY7dkjmoNGgoiWP005i4Wuf51D4CuFXeF7ObGPJyJ7RMnx31gdsHGu+39vk=@vger.kernel.org, AJvYcCWkHQyWPD0L3TIf63f1RFGkYgvmEmOW0f437IudxHZremJizpmg7eHrL9bPNiKqgQfBBfczZqMh@vger.kernel.org, AJvYcCXr8zqhtGsYJ7HxMQH/8UAC8sOgn9GflZA/JIYiE/vqDyEmYjS46/YIU9bynHk7w0uPqeqyCIoYRglb@vger.kernel.org
X-Gm-Message-State: AOJu0YwmGyzvwWcbzJrywpYlCD1rNbizphe5hnGUO4LUnp51SWd0nFCB
	L3McD+RJ2gIhH5E58neDBYo2SGluJ7JsIGAQWwjTbfrf/E3cstMu9vrd8YFdWk+0uLmFhY8kkrG
	WG33+3cYx34OTi0+69Kzc2MsHddKSanQ=
X-Gm-Gg: ASbGnctkg2jZoNPZcperh4ygfzQGll04JclxdZNeOux4dNtwwRLWQ42micastJE6eWI
	l/KYeeg3PY+GF+xKw/X9Nme0uRimKmkH3AmxOtHk+e2n8DWnOrfs9hp71AXx9Q9lyGPlvli73Jf
	j57FY3E26HuGaDsO9O3Wo4i3sxHuoOPXwZVSDuWzO2O8zkdw4nuzJR554aaImieW5mdSgKPDc3B
	e4iJOLvoHifg2W1qKbjhNg=
X-Google-Smtp-Source: AGHT+IHcU9CbsS7KpoOZsMnZH/SewN4yccvQVB45rejWKX3sHFuPcavri8YzwSNjVlWayffwB8TTghNdf3bG8CWyTi0=
X-Received: by 2002:a05:690c:9691:b0:71a:41be:133 with SMTP id
 00721157ae682-71bf0d3d579mr151142237b3.14.1754904953147; Mon, 11 Aug 2025
 02:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811084427.178739-1-dqfext@gmail.com> <CANn89iLEMss3VGiJCo=XGVFBSA12bz0y01vVdmBN7WysBLtoUA@mail.gmail.com>
In-Reply-To: <CANn89iLEMss3VGiJCo=XGVFBSA12bz0y01vVdmBN7WysBLtoUA@mail.gmail.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Mon, 11 Aug 2025 17:35:32 +0800
X-Gm-Features: Ac12FXyXHPt3KWJVCq5JB8s-eJ6YpQlmaT2LGNV2OsLn2GATDz-fTxsoK-fo3Qw
Message-ID: <CALW65jZ-uBWOkxPVMQc3Yg-KEoVRdPQYVC3+q5MiQbvpDZBKTQ@mail.gmail.com>
Subject: Re: [PATCH net] ppp: fix race conditions in ppp_fill_forward_path
To: Eric Dumazet <edumazet@google.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Pablo Neira Ayuso <pablo@netfilter.org>, Felix Fietkau <nbd@nbd.name>, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 5:19=E2=80=AFPM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Mon, Aug 11, 2025 at 1:44=E2=80=AFAM Qingfang Deng <dqfext@gmail.com> =
wrote:
> It is unclear if rcu_read_lock() is held at this point.
>
> list_first_or_null_rcu() does not have a builtin __list_check_rcu()

ndo_fill_forward_path() is called by nf_tables chains, which is inside
an RCU critical section.

> >         chan =3D pch->chan;
>
> chan =3D READ_ONCE(pch->chan);
>
> And add a WRITE_ONCE(pch->chan, NULL) in ppp_unregister_channel()
>
> And/or add __rcu to pch->chan

Should I add {READ,WRITE}_ONCE to all occurrences of pch->chan or only
to ppp_unregister_channel?

>

> > +               synchronize_rcu();
>
> synchronize_net() is preferred.
>

Noted.

Thanks!

