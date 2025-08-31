Return-Path: <linux-ppp+bounces-348-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE51B3D102
	for <lists+linux-ppp@lfdr.de>; Sun, 31 Aug 2025 07:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFCE817EBFF
	for <lists+linux-ppp@lfdr.de>; Sun, 31 Aug 2025 05:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5D01C1F05;
	Sun, 31 Aug 2025 05:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGw0ob/8"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FFC168BD;
	Sun, 31 Aug 2025 05:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756619725; cv=none; b=NJTlCpUlBvYs1CsbV5pm/y8e8rk3pApBIwqSIC/Ix0YFbEEeHGZajjFSjDQ9brlMkat/0GEUJMGZGwnNNTAezxerx24F3+mLP/Su02tbbjwxlfRfAY4oxQV99j4QpMLLbDBn55QPYQWhpZq7XPsmIeXJjdGe7yaiekGvSbCkOJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756619725; c=relaxed/simple;
	bh=vO7/3e3122L1g9o9OLHB7JkuMo9csml4Ab8aHRvSfiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2mEF5PAcu3Km6EnSV/UVTYzrB5UqMP0PAXAkXLu8zkWSzfxwPKlTjjjIeqqkdaBXsJ3dMe2s4hJtu8kWbFY2Qj+3m3QS9ZuYMLga1MHcP0ZcnodlKo0YDZ9PjiwLlogfCKjJP93BaL9MwlZUbPeBdkRaeJZUwu3iOAJLYAqaNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGw0ob/8; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-323267bc2eeso2567294a91.1;
        Sat, 30 Aug 2025 22:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756619723; x=1757224523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vO7/3e3122L1g9o9OLHB7JkuMo9csml4Ab8aHRvSfiU=;
        b=XGw0ob/8LUTXmp5jMweWxwRjkgD0Bxyr437tLWjp+cLMwPjTcoCzXTiK4g1RFxpP6n
         8YfRetz82NZ7EMjbgiOeN2Tzd93UItvS0gs5XR+2KiLOQk2Mp1TUYPzyih5ZZnv3+mL1
         ustuL3ONILqPLy1jrF7zQMO+qUzaA9HmskCOVwzDzuyRsJpALct7ORhXet48IB8qGIbl
         ybLPtXXgKvLXWYuQpYdFzRhl1yinxSjq9v0WAfvcavNdroGTci1xBjZ897OyuuZFbGav
         EXTem8CjP3NRo0OvoDD3DSqcACXeREen659jYEj6mGGtzNvIj/h8sRZXiiXc01z1UO0W
         /ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756619723; x=1757224523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vO7/3e3122L1g9o9OLHB7JkuMo9csml4Ab8aHRvSfiU=;
        b=uqh3S8YMaobkdUGHqocpCFq0o/kt13F7QAU/D42ml3BuhkdOgL3P/BvPTFgRt0jG/9
         ilVj+KELpW3H6yF2wlHWQRSWD0DTz51Yn2Nw3knpB/YK7zh2CW2lyAF+d9ExEpF995BX
         OuulEXk/Z4+Q7F3HBiECXGAyzQyqvGOFiFCQk99ENj3+Wh0iFm26E6hpnG8cb5u84L8Z
         45rg1rsXs+Br6bdPflhJEZGC6IqWRMol8zPHKVvlWbLXMhptIatZ5Eo2D+Mmj/vvs9E8
         Q1pK3uS4U8RCMafapn23iv8DK71K8rTw3DlEV2GcaPdMMlghtGgwmRIM8pOs/I6cYEj2
         +sVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU01ur5gNy4s54f0KSp+MRQa6+7/mWwanKrL8M/fgu1sbXzkW397mzJ6FSzUP66c2CcF5NCXD+kbl72ryk=@vger.kernel.org, AJvYcCV2gR059bBe65dlCGYJ1kq+Oac3BFzH7nLy9q19XkgrWPmJgBXhLCmvvGX4UkjUl02VX9WYLu2U@vger.kernel.org, AJvYcCVO/3VLCJIFDQH98/txlpbs3ZFMn4xA/7E2Ic/3fjRv0aAVjoNqvAznNGkx2BTIMDMiWVuGMXe3Ar8D@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3cuLbC4EKNhWjz/kN9V92VntXoX5yqrByrcoTRx9Dsjy+UuNG
	OLoA1Ym86joEIZ9B7DWx2jO5SBv4hVAEGjo6TOteR0Ou22qsh+AheJRXR5jPePIBv06hb0+hVk3
	iEF9oc+2kAYgcYivO3qcbORTq8df3U8o=
X-Gm-Gg: ASbGnct17wTp0qSprHkA78oWEhL/WTTdyvlxrHmPsP76S42+Zo7kxvnn8bKtmp2hY0D
	KK+tirlXGiipJE8JH0YULPaF5bcxqfsYS1lRJC/zPcWVPPLZ1hIlx9IppFJO5hUs2nFvFKHuEd+
	zGo/h4UVAqunWNrv1N61zgzn5x7p9j6TJSj3Q4bKWHUptE/trzjvv0kcAnxkUOL5Y3MewW/KIw1
	dGrX3OJ+jhxD5M=
X-Google-Smtp-Source: AGHT+IF4by9wGR+uMdQS9BBU9p7VJ6sygd+W+e0UZ+tlUT9Sl6ihbrDfKrRug2sbMj5W+mfbrhNCAp/9eSrb1ILcCh8=
X-Received: by 2002:a17:90b:350c:b0:327:972d:6e79 with SMTP id
 98e67ed59e1d1-328156b6358mr4569060a91.21.1756619723260; Sat, 30 Aug 2025
 22:55:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPB3MF5apjd502qpepf8YnFhJuQoFy414u8p=K1yKxr3_FJsOg@mail.gmail.com>
 <CALW65jY4MBCwt=XdzObMQBzN5FgtWjd=XrMBGDHQi9uuknK-og@mail.gmail.com>
 <CAPB3MF7L-O_LW+Gxw8fgNif9zUq0r1WZFK_v2CzB0302RHXNLw@mail.gmail.com>
 <CAPB3MF5x5rSsYCKutpo1f=1DaQbz30QM6ny7fnB9hMGmwfkdbA@mail.gmail.com> <CALW65jafGk-qGtsMQJNYUC0pKE=6xLxvsZtEW_FSXdmGOsftBw@mail.gmail.com>
In-Reply-To: <CALW65jafGk-qGtsMQJNYUC0pKE=6xLxvsZtEW_FSXdmGOsftBw@mail.gmail.com>
From: cam enih <nanericwang@gmail.com>
Date: Sun, 31 Aug 2025 13:55:12 +0800
X-Gm-Features: Ac12FXwCiAISj3xYLyKHXUoeGCGfEA4uYOeEPsf7QYJotB1spFwoUFkVUrR4Obg
Message-ID: <CAPB3MF5PV6DeyRngtTmVEVFkhjsp7PjgsWqWQGEZM_6PkQr9=A@mail.gmail.com>
Subject: Re: [Regression Bug] Re: [PATCH net v3 2/2] ppp: fix race conditions
 in ppp_fill_forward_path
To: Qingfang Deng <dqfext@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, kuniyu@google.com, linux-kernel@vger.kernel.org, 
	linux-ppp@vger.kernel.org, nbd@nbd.name, netdev@vger.kernel.org, 
	pabeni@redhat.com, pablo@netfilter.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, you are right. FYI the xanmod kernel cherry-picked the commit
"net: ipv4: fix regression in local-broadcast routes"
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D5189446ba995556eaa3755a6e875bc06675b88bd)
which cause the regression by fixing another.

Reverting that commit resolves the issue. However, I see this
problematic commit has been merged into the trunk, which might cause
large-scale regression in the coming versions, I'm afraid.

-Eric

On Sat, Aug 30, 2025 at 11:00=E2=80=AFPM Qingfang Deng <dqfext@gmail.com> w=
rote:
>
> On Sat, Aug 30, 2025 at 10:39=E2=80=AFPM cam enih <nanericwang@gmail.com>=
 wrote:
> >
> > Here comes more details, and it might not be your commit that causes
> > the panic. sorry but I don't know where to go from here.
>
> You should try the vanilla kernel and see if the panic persists.
> If not, you should close the issue and direct your complaint to the
> fork's maintainers.

