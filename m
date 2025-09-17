Return-Path: <linux-ppp+bounces-361-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 184C0B7D07F
	for <lists+linux-ppp@lfdr.de>; Wed, 17 Sep 2025 14:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B92424644E5
	for <lists+linux-ppp@lfdr.de>; Wed, 17 Sep 2025 11:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0919285418;
	Wed, 17 Sep 2025 11:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REFQ9J/t"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A9C27E043
	for <linux-ppp@vger.kernel.org>; Wed, 17 Sep 2025 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758106830; cv=none; b=DdWC0keIt6L8RhACv7V1nRLNnc4wxDvROWisQSwRrI/ScsZNkvdQt815bVO+nrkmD2ZxWv+QSTsD6tLibtEGG3ud0EF7TwiDxWjw4Dea9d+tjYWypPh2lBOwyszINsV2+sTPa/TQxkK/ssPhiqZQruOoAzCINe8CunCch+vdkXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758106830; c=relaxed/simple;
	bh=iOpYV/CrvsvUnku/0QkvP3IDl3KIs1iAJKOOZesxXbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMmyaofm4x+y7rF6LT9hruzp9A/Akf2Y7GwyW0D28YYeWQYK6FYejT0yeMzX6PV0QujxwsTP5uQHwhPcnpuvg5G1mSjgKGxFYgg5MQei6lIZn/wCbdw/9FTArWmVoQ0ZAXY00MSeN2ZeEcNdQvzkljg7K78gGYlFCJdGGh2WfNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REFQ9J/t; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e970e624b7cso722683276.0
        for <linux-ppp@vger.kernel.org>; Wed, 17 Sep 2025 04:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758106828; x=1758711628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOpYV/CrvsvUnku/0QkvP3IDl3KIs1iAJKOOZesxXbs=;
        b=REFQ9J/ti1q0ctWu3QtcK7nHBvfNDnbSJ+rRT+BI9KKorSnWIlqEUZDSjs+5RDWa2Z
         cZYIHVUFJ+bwb8/unvb26fwaUd88qkypbmWBMXx0FgJGP1dd5eLXiMIRj1iv1Od4uhpg
         l5HtUUGHK8N4AE1t1oiWN3FZP3e4495ZSLO+sMDe+l6eSZ40NqQyUbUd9LQW1B+YghkD
         mrxJ6JaJApqHXgjgRu5uVXwPkXkaJwDWJgR+glyVmWw/1GNkglW8vMI66u5n3kieplQP
         dzywh88U3RCkmspLuFyXcJx/MW0dFVtUi8mcNffjrHdbBnNo0SbagevI57sc3w0y2lJR
         ZSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758106828; x=1758711628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOpYV/CrvsvUnku/0QkvP3IDl3KIs1iAJKOOZesxXbs=;
        b=PcOxwD4P9wqCSHs7qoQW255YI6e2+no6phIiPjSKB6SbNkHqpGlJ3Jc/JhQdZPczl1
         sDKFSD0TYfrIS/cgGq6fJs4sKRDe3hRI5U8iwJ50XAa+YBFIq24EeR1Abu26XyrcGKlP
         5smuBy0toQS07ULDpLdiIc7BzMQKFHaYxzzhrMBnIhu2K5t/9zgVnG5y0PiEgZy2iNM2
         A7rLYyIDD2ZC6bPEpDu+EwJh5KdK7rksz0LLhaUhtanZsSLJ2u5jiPDk0BMmSRLBPS3i
         yT34P1Xv1HEAn8dQK9EOhIKTqAGwuRXM2h4oV8rs6cG0GG+1LNGYp00c6f1OHR+4+CyB
         eINw==
X-Forwarded-Encrypted: i=1; AJvYcCXEiO8nuBrDXlL+Z5x5yIR05L8CfdZCI/QzlrVm5SmtzqNKJ5RABQDUUJunwlK5QFgzn1Mp7KKcG5U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2s1IuBVlpryQnOHoK08QIqR8c674xtfDuhn/LaAJZakRzqFP1
	7x0SmQswrgIBgh1n/a7gIKiK6pCZDQkVRCxy4+u3AbXfQ9QzKE9EmOepNFIggm6aw1kRrhhegNS
	uQZuflHRKW+lRpuN2JmI0qQDOxKENDdk=
X-Gm-Gg: ASbGncvsuxzkAkIosw0mqU4dyrFjNmldTP6SRkeb6urXBNZFW5VgWNT3HNThazwbHEF
	it+VSEWgav63Uc5qJ5adlYxvUqjj3LsjqfMKlOK62OdnUOVOSS3hsRxKwdSJoTUFatlRdRtByQr
	48BGL1dg7A++p3bXGXpyT+Z7dEMLPZdgL/JDrhDJKRSKkYwxy8BOJVcc9zsbKFVboMxEaR1achD
	oatbRKwqLfk3v9d61X9PPsPOWv8Te8woTWmMmGsMq1jWUHBtKA=
X-Google-Smtp-Source: AGHT+IGfnuwSEGf3ha0nSdQ2bBtn723dyi/fioLa2ryAVJS390NdpOSQEFlC22tsMhWb9EgeYLp9ZMfDh/dzPGnq+7Q=
X-Received: by 2002:a05:690e:159c:20b0:62a:c4a6:bfea with SMTP id
 956f58d0204a3-633b126d5edmr1034403d50.17.1758106828070; Wed, 17 Sep 2025
 04:00:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912095928.1532113-1-dqfext@gmail.com> <20250915181015.67588ec2@kernel.org>
 <CALW65jYgDYxXfWFmwYBjXfNtqWqZ7VDWPYsbzAH_EzcRtyn0DQ@mail.gmail.com> <20250916075721.273ea979@kernel.org>
In-Reply-To: <20250916075721.273ea979@kernel.org>
From: Qingfang Deng <dqfext@gmail.com>
Date: Wed, 17 Sep 2025 19:00:16 +0800
X-Gm-Features: AS18NWB_hpDqfpIABkrd-Pvpolw7w2H4ujFI3yYvFt7f0E3V1zdjLMakXthxI2E
Message-ID: <CALW65jZaDtchy1FFttNH9jMo--YSoZMsb8=HE72i=ZdnNP-akw@mail.gmail.com>
Subject: Re: [PATCH net-next] ppp: enable TX scatter-gather
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 10:57=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Tue, 16 Sep 2025 10:57:49 +0800 Qingfang Deng wrote:
> > Can I modify dev->features directly under the spin lock (without
> > .ndo_fix_features) ?
>
> Hm, I'm not aware of a reason not to. You definitely need to hold
> rtnl_lock, and call netdev_update_features() after.

Will the modification race against __netdev_update_features(), where
dev->features is assigned a new value?

