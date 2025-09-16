Return-Path: <linux-ppp+bounces-359-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C714B58C16
	for <lists+linux-ppp@lfdr.de>; Tue, 16 Sep 2025 04:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1E913B0BEA
	for <lists+linux-ppp@lfdr.de>; Tue, 16 Sep 2025 02:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE69E23B60C;
	Tue, 16 Sep 2025 02:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M145WT4S"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3722322AE7F
	for <linux-ppp@vger.kernel.org>; Tue, 16 Sep 2025 02:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757991512; cv=none; b=EgbfPAByf5mc+skiitJ7hcVFikRWHO7nDpMpqo7jiUfVuNmlbWyWdBVIcQ5MBBA7a1ZO0GIGYqankE3GrmvUfvSfGGdp1th3FSd4DxgXWFQxH69Z2jy9vYz25XpN3sXlkVTMoWmC4bfDA5s0LhfBP8zyPBRUR7fMiMVj0qc4jO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757991512; c=relaxed/simple;
	bh=0WNzQt6DCc1oCSopHUcGNsX0og3Qo+mNU8x/1pWS9J8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbmqCs5slVL5XuYJag3qBW9rOsbhzJCjaJN4Lf9ac8wdeRRINIZA2uS23JskUpvFbeSXRWIGYhT2iUuE4fRvw0JaRfYRvvUtZ42gB7GhW+Z0aWGFm/+1yHBXQ7HepO8VLwpbeo9h0om1uJt82uSdR+YKL0wJCW5wDH58Vi3kDKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M145WT4S; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71d71bcab69so33864467b3.0
        for <linux-ppp@vger.kernel.org>; Mon, 15 Sep 2025 19:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757991510; x=1758596310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WNzQt6DCc1oCSopHUcGNsX0og3Qo+mNU8x/1pWS9J8=;
        b=M145WT4Ss1/MVQpODuXyGL91Z4sDRfDXG2y17ZS4Nbp3xb3TfZlQZ7rDnUykYpKF5L
         iaSeF3CaoRjRbg+eHPDEB0W2sFRW4oifb1ZfQ6zlnndwhd4Q6Khnfw99SIGMGX2ReYNu
         okUOHiG/f474zdp6NgauRr56mY5PQXzmRGIsJtYNKPUJibH+uSIFNxLGgna08wx6Sp10
         gvG4q+NLtj2jligTfx1KxGLIZDoCPZS7lKiDdXB4S9U5Qi9Tj5KljnEf2h3Rx128tgHD
         222jY22ZpIUovH4MLFp3j48HB0laWzhs57bPzVtrQXaNMYY2E0/FgLtDKoxsP+RpIssD
         ibKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757991510; x=1758596310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WNzQt6DCc1oCSopHUcGNsX0og3Qo+mNU8x/1pWS9J8=;
        b=nGQxNBY9aGPljwjaPeIImZ4xIS2nWmZvWyKz668eeU2CTjqv2KttrVxNODl/ffDjIv
         PqBGR+CBgGUX2k8dM/Odd6BYgSIb+y5CsBQboQJMuJnfxeb2yypN9N8s/4qVokBe6VUa
         kZISmuzH8RFXZ3pdoY1wb8CBgXKhl7h8SaXNcZsajntPh7Fl8WSGnPugHJKGPO6NEKAD
         4jkOgBSBrceXxB5Awe0l60iEuyi/fta7eiFxMXzQnwWVYXYx/IcDootYHdbjelPl05MR
         yQabTiB/XVYZs1WTHg+EdhodgvS0KuNyD1uK+eNRcw32G3LJulsnLYCUdYSB+TGcpM19
         FJdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiGaN1CJ7P7OROtP9UiWJdfko0hRroTKErvyE/r+dzWe7AqE37QG0eDfEd4Aoxk/K3mFwq8DuoCMo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/AzSUtvV2Ge9o9Bjz1LRlFt4qNxwMDK1IhALXBJ7FB/PxVaQS
	lCy/Omd3Xy6piLSzfMY8lOoCqqfCOj1hFIEeQCaN9VsFAZiy6ic2owQmbyP45RlPdlJaap74oc4
	dBIKaY5AL4txAxTtq1MXv7sLfk1wauuo=
X-Gm-Gg: ASbGncsM1oVV5V167HAlljOFW5AH9FZuHwhdr615b3VDY84GFCXZBHuxvD3eiS4V193
	NrQVQ2oj+LlqriPzAE2u9dIj2coTW1Fk5bO2xA6bqcnlU8Z8MwI0auC1zLoAQ0S7qA1jxe3Aawn
	A7Ckauk8/Bst7qaoM3pExRtCbrm/3Pc6ShfXfFZonCSaNPsmR078PhD3qDM5ApJEVGbcxupk4DV
	T6zsZymBWKbtKZjSHN4dRwsWavRY/z970c=
X-Google-Smtp-Source: AGHT+IFoV8QGVxMrnTri70cXeQyLaQNEjmdLeZFLqkE+amnPx3JsydwAPu1HRgnuRf2sZ6BK97hxGf+G6+9fDlrhK/A=
X-Received: by 2002:a05:690c:6488:b0:735:4c38:34 with SMTP id
 00721157ae682-7354c380739mr40186397b3.27.1757991510063; Mon, 15 Sep 2025
 19:58:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912095928.1532113-1-dqfext@gmail.com> <20250915181015.67588ec2@kernel.org>
In-Reply-To: <20250915181015.67588ec2@kernel.org>
From: Qingfang Deng <dqfext@gmail.com>
Date: Tue, 16 Sep 2025 10:57:49 +0800
X-Gm-Features: Ac12FXx5b4SkRyivmeumpyy1hPkwx_2MizrBQEAH_5KP5izuBh4_VosS6gNuxWw
Message-ID: <CALW65jYgDYxXfWFmwYBjXfNtqWqZ7VDWPYsbzAH_EzcRtyn0DQ@mail.gmail.com>
Subject: Re: [PATCH net-next] ppp: enable TX scatter-gather
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

On Tue, Sep 16, 2025 at 9:10=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> Seems a bit racy. We can't netdev_update_features() under the spin lock
> so there's going to be a window of time where datapath will see new
> state but netdev flags won't be cleared, yet?
>
> We either need to add a explicit linearization check in the xmit path,
> or always reset the flags to disabled before we start tweaking the
> config and re-enable after config (tho the latter feels like a bit of
> a hack).

Can I modify dev->features directly under the spin lock (without
.ndo_fix_features) ?

> --
> pw-bot: cr

