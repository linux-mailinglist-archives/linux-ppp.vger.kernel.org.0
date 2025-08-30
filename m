Return-Path: <linux-ppp+bounces-347-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F84B3CB97
	for <lists+linux-ppp@lfdr.de>; Sat, 30 Aug 2025 17:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 805991BA324B
	for <lists+linux-ppp@lfdr.de>; Sat, 30 Aug 2025 15:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D551A314F;
	Sat, 30 Aug 2025 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAOIyAOT"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5526FC5;
	Sat, 30 Aug 2025 15:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756566053; cv=none; b=aM4/6MumEYa8J3t6QBliCjB6L9GyiakyttGpUYu247gLZ1vHoKfFleuuQIdQliZg9nPn2XmNsA1uXNN96Aws13BLvuPJT2jUqWKWQlNNcaB1sX4E312YuJ51me5peq/4KmJXiglqPHaOL5QEYAwGbCquFGdZXuYBkwXYYst/dzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756566053; c=relaxed/simple;
	bh=LLOL+fmqYILSTDi8SlcB393oKMhsEt8d7adREn/sdDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKscpUZkmRrBHJu4OZ2kxqnt5lZRWnsCEBm1iP6gCm8LgbEdxyMQuKSZ8zy/aZ5QK2R6sczLAjBGGKN6BHfaAcW24MfQKa1sDk2WNjD747bDEZgQYZkl1+mrinK7htqcmMutfvHI3H9u7g0TP1UPUR5bF7a7bpZ+SFt/aLypnT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAOIyAOT; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71d5fb5e34cso28902337b3.0;
        Sat, 30 Aug 2025 08:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756566051; x=1757170851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLOL+fmqYILSTDi8SlcB393oKMhsEt8d7adREn/sdDI=;
        b=fAOIyAOT/ODl7rMqDMTVqlYcZlTvjeIBGNOCpDddtLvmescjgg0Lz4x1M5j4UsYkK/
         l8R/gwAURVYcsNK5QLNJR2pPMlByb+6vMVaRzisPcoP+kxj+GJTOTeUv4+0TRDDLktjv
         SokW4jbOR2PzsWYCDvPWMEy49Urp/wpSfvoic7r46KIHHmj7EYk3ZnxG6yZzQzpyCSub
         76d3gSsfDW0bl0BZ6UjwNDrOXIj9ni0qrDtUsFf2t8v/7gHLgZV5i/s+hovqePfzHI25
         IS7iYF8Ib9W9FLuRW2Q/f0mmSp57qD0ezQyCU8bdV19oyC5+pDEomH88cqFySfDw89sL
         yGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756566051; x=1757170851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LLOL+fmqYILSTDi8SlcB393oKMhsEt8d7adREn/sdDI=;
        b=rLRI3JtuZI+8tXuUf5nXiwIxGWiJY4oC7ixWLtLGZApfgqo02nSZlIghwj9/MzLEdf
         CeNjhmGFqrcLxDm5yWXSx0HDWbhwdHoAjzaCbs42Y0t0uhlh33zyjhu8BMJraJMI2qOT
         7pU4Avo0lGI3yQgV9Q1dNlM7WipqKye5WpAfvu0ENy7ENjlDJqe81qLpreUS2ZDZ+2su
         snmkAKNf/2s+EdDvHXgvcAgozri2xKcqrHmM0Oh/n4LyYIHj+bHvNGR0rdbn4U/XzYJO
         hkY296jEZ1V+35UQjB9J3EN6ylj/43rXRZks+jArWYNrRWRbUDvOcuqSbsCmJ3EavXAj
         NGMg==
X-Forwarded-Encrypted: i=1; AJvYcCU9S2LU3swVTJrVwqKWnvUAHG42g+gUBEmxq2ewpt77yAKtRPcX/vwUHLxfWalgsxIouNsyvqUjJ21a+gE=@vger.kernel.org, AJvYcCW7IDpbz1F00NI4rfnC/6IkDTHmwQa2wjin2qSdkNtD1vHX3jrUUo7pU6w5a0/CDA7LYSXuKJIdX9G1@vger.kernel.org, AJvYcCXNgwyYecu/T5lfPYvIpq7r7BKZHDjSEIejNiHHy4GAYFZsAuuoDh8fu6jD5o8Dj7heu1E0YcNr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3EzBVchGWir4hg+WOpilpuxpZGY1L/HwnGU8IMPRwSTHs4sDt
	groCkK5/z+BH8TM4heQEMQWLTmswrFaX/IrgR5SYw+izZF3uBrglBmabfnCb/4Nu5DI3evWCyVm
	5893sR1Y4u68LtlLBxMScrRHZ6sat288=
X-Gm-Gg: ASbGncvXM7qyJsPi31ixYS0MZHXHVlL20TK2VcE3+60I/eLu3HtYrtl3c5rcdx9SbV7
	PVLNDgPJZUpt2IKYDk+dx55zP+xRGsg2ckDEy/ngq+tRLD3lF+H+gBlt2YDlOli6wgBfXy7SBDf
	5VB3btNmrGAIBqDwH2vkW3l4vZdwspE0vinFy90lOZOXSPPEypgxR1DaGXbCj6e16l03drpSDGG
	8R+kuPKfpByHNCdUYLgGovE12dsyJheT5O0Aj4wB2/cFvfEwA==
X-Google-Smtp-Source: AGHT+IEpTdKx2MIT3wfdeGtJA02sP3Yiqi3boF/Eskh3P7YNRWbfrpypYz2ieGu/eMn19MFikTWiGxxf502MuJzU6go=
X-Received: by 2002:a05:690c:7501:b0:71e:787c:6c2b with SMTP id
 00721157ae682-72273b993eemr29405607b3.5.1756566050964; Sat, 30 Aug 2025
 08:00:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPB3MF5apjd502qpepf8YnFhJuQoFy414u8p=K1yKxr3_FJsOg@mail.gmail.com>
 <CALW65jY4MBCwt=XdzObMQBzN5FgtWjd=XrMBGDHQi9uuknK-og@mail.gmail.com>
 <CAPB3MF7L-O_LW+Gxw8fgNif9zUq0r1WZFK_v2CzB0302RHXNLw@mail.gmail.com> <CAPB3MF5x5rSsYCKutpo1f=1DaQbz30QM6ny7fnB9hMGmwfkdbA@mail.gmail.com>
In-Reply-To: <CAPB3MF5x5rSsYCKutpo1f=1DaQbz30QM6ny7fnB9hMGmwfkdbA@mail.gmail.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Sat, 30 Aug 2025 23:00:39 +0800
X-Gm-Features: Ac12FXz49vEIB_gJW0C0l2VKHccKvEGGDo49gsMkVjVRPjlcDT1BpLF7uUTJauE
Message-ID: <CALW65jafGk-qGtsMQJNYUC0pKE=6xLxvsZtEW_FSXdmGOsftBw@mail.gmail.com>
Subject: Re: [Regression Bug] Re: [PATCH net v3 2/2] ppp: fix race conditions
 in ppp_fill_forward_path
To: cam enih <nanericwang@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, kuniyu@google.com, linux-kernel@vger.kernel.org, 
	linux-ppp@vger.kernel.org, nbd@nbd.name, netdev@vger.kernel.org, 
	pabeni@redhat.com, pablo@netfilter.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 30, 2025 at 10:39=E2=80=AFPM cam enih <nanericwang@gmail.com> w=
rote:
>
> Here comes more details, and it might not be your commit that causes
> the panic. sorry but I don't know where to go from here.

You should try the vanilla kernel and see if the panic persists.
If not, you should close the issue and direct your complaint to the
fork's maintainers.

