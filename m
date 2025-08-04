Return-Path: <linux-ppp+bounces-329-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C79CB19CBC
	for <lists+linux-ppp@lfdr.de>; Mon,  4 Aug 2025 09:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 594D018952AD
	for <lists+linux-ppp@lfdr.de>; Mon,  4 Aug 2025 07:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E355A2397AA;
	Mon,  4 Aug 2025 07:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RomulYfm"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588B5238C1A
	for <linux-ppp@vger.kernel.org>; Mon,  4 Aug 2025 07:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754293006; cv=none; b=NGDRUnj+394Mvgj3iWDv8Cs+QtWt0FA/63kqJ5Kh/0xoihR2XxSwhAlKdZ5zerxyeRkQn9XhbCbdTq5qXORtHK0pE7bamx3Ov9e75rzdMrGOrfThyvq01N8ZlwpYr7YuEM+CRvre5BNLTj6F8Y9j5Xs6nBYtcLhFYnjNWUxpMYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754293006; c=relaxed/simple;
	bh=3Y/eNwvB5ILZs5E+ocvhqUEyyEQJUHJ6l9mncbf4LIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zwehl6TJ4V90K8ORcfnJxxWxT2EuFXa9fY/7fXLodVuQci0S4YSgUhnLT9ZwFO9lASE8wWG6hJJD8hqPVZoEAS2oRKnkSH3Xm2p4c1fxzGCIcmIMhZn+dli2Wod7BRfS2scIIUz9l7NdzYzb6vY5uheNC6V9mXUkb1re1W5Yg8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RomulYfm; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ab82eb3417so46364251cf.2
        for <linux-ppp@vger.kernel.org>; Mon, 04 Aug 2025 00:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754293003; x=1754897803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3ooJeoXgiNxmCjKQ3/NUiLCRPH/OBbBVxn1XceNIw4=;
        b=RomulYfmI35IjwyVZgiRfu6BIDfdWhbud076jZv7v3uLxOhPIHU75fiDPCCt5X01gT
         XkKntFUf3wN7czyhM3OXc9YttnxOptB+xA6iSwOEwt6CxnQIocMQX/BbRSa5QUeXUZqX
         0t21/UbsWGn8tBdOgN87j17XabVu9i2SnWCa7XxjHSIVlVuIP4Bm+fy9xmQzsbpKaFfd
         i1M/wxuDpLDqUMeJQahOsRdjqfHPrQ1/QhmfJF7YGAK3BSrhFE0bx0DTjnpEbBmlepBA
         qNPOkjLujrTxVlIBh8RxLt8dzPtlBCBBTPGZOMz83HPniSN7qExQQJpKyi2PynfjfDF1
         3E7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754293003; x=1754897803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3ooJeoXgiNxmCjKQ3/NUiLCRPH/OBbBVxn1XceNIw4=;
        b=Zn3/8Utbw56Uu1IhzSonsWGGfRVErki4bALWDvRCytVoItJs+FWUNnGV6EL1DgFImv
         +5mqpJlgCI9/hcBAKcwYIr2Q6X71WXNPZeU/gZ9Zpv/hyEwmVS0VkanY+yvalj+5ufEZ
         GLPKJOKJw7gJa98xdp3SEYsL02JJw76OywO6XP0tiuVlDJdkJrAQ72dwAgkgK2xK9dEl
         GGTaIW0VL4ZL2KLEw5AyXDABfPECjGWUXgs8OvqtkZCtAfkWNvcbAxtz1rCpvc3CtGfL
         T/MUTEajC1PajDscgmAl+EFAoRZNXJwoXJUu7647OSBQT80ulKS5dl0ZxItkxVGEW534
         yVMg==
X-Forwarded-Encrypted: i=1; AJvYcCUe91ZYP3wzvUCDvGXTI0F+L1vXJednX5vUJLVpjYDiPeX4rTaWNg4GPLESO/8Q97PAK8LzwvaXvK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPLdaJCaHHsIutbrti86pv1j98L8rvOzzxgK6SGrHcR8zfqhEy
	sLqDVLjog3Z3d9j4tPxXw9JZ057/bgNY9g3j9eWZSaEe2395jhMes6lO3HMNrCKXm5vghWYuLfA
	zgQ/bE247QJCQ2OqzDxA5i0k2y87QpwPKHO8Z+uVZ
X-Gm-Gg: ASbGnctCLgDekRuDt4LuiKcvNnjzrAwZWXNPxvr1Sgsf/2HGDXAo1F0BJU/d8omhIVe
	bdkG91yIvcPDNDh/k3Hve/9PxSxYi20ezMb8a3zbi9ttKJ4CWNqttxX8+Jx4n71VSNh5/Fx874f
	b7PV8KzEF1Px2wrwx9PrRZsw326X0BBZ88FcLcqAl6X1f+yIq/9KRhZGhX6Z2EWcuh2exWdeon3
	kiB8wn3gZQcD4k=
X-Google-Smtp-Source: AGHT+IEoCUer5WNytH9wVW03O++C/FNr5V/5RS20GrME6Uk6NXfcgbALruaSrPF23gegV0XuKZHBdOlmBgO2ep9Ykx8=
X-Received: by 2002:a05:622a:15c7:b0:4ab:c00c:250b with SMTP id
 d75a77b69052e-4af10cf33f6mr122336581cf.40.1754293002922; Mon, 04 Aug 2025
 00:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804062004.29617-1-dqfext@gmail.com>
In-Reply-To: <20250804062004.29617-1-dqfext@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 4 Aug 2025 00:36:31 -0700
X-Gm-Features: Ac12FXznjO0BdtnALtDt-VPl7bSJs2FnxBEs7TFJ8fwttr2To0hldVsXZK8iBas
Message-ID: <CANn89iJ3Lau_3W5bJdmRWL9BFUf3a40XqNgfjr7nCEu5PQ_otg@mail.gmail.com>
Subject: Re: [PATCH net-next] ppp: remove rwlock usage
To: Qingfang Deng <dqfext@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 3, 2025 at 11:20=E2=80=AFPM Qingfang Deng <dqfext@gmail.com> wr=
ote:
>
> In struct channel, the upl lock is implemented using rwlock_t,
> protecting access to pch->ppp and pch->bridge.
>
> As previously discussed on the list, using rwlock in the network fast
> path is not recommended.
> This patch replaces the rwlock with a spinlock for writers, and uses RCU
> for readers.
>
> - pch->ppp and pch->bridge are now declared as __rcu pointers.
> - Readers use rcu_dereference_bh() under rcu_read_lock_bh().
> - Writers use spin_lock_bh() to update, followed by synchronize_rcu()
>   where required.
>
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---

....
For all your patch :

Since the spinlock is now only used from the control path in process
context, what is the reason you use _bh() suffix
blocking BH while holding it ?

Also, a mere rcu_read_lock() is enough for ppp_dev_name() and
ppp_unit_number() : No need to disable BH there.

> -       write_lock_bh(&pch->upl);
> -       ppp =3D pch->ppp;
> -       pch->ppp =3D NULL;
> -       write_unlock_bh(&pch->upl);
> +       spin_lock_bh(&pch->upl);
> +       ppp =3D rcu_replace_pointer(pch->ppp, NULL, lockdep_is_held(&pch-=
>upl));
> +       spin_unlock_bh(&pch->upl);
> +       synchronize_rcu();
> +
>         if (ppp) {

You probably could move the synchronize_rcu() here, there is no need
to call it if ppp is NULL

>                 /* remove it from the ppp unit's list */
>                 ppp_lock(ppp);
> --
> 2.43.0
>

