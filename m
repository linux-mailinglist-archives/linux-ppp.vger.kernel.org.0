Return-Path: <linux-ppp+bounces-367-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B130C3E5A2
	for <lists+linux-ppp@lfdr.de>; Fri, 07 Nov 2025 04:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 234624E5943
	for <lists+linux-ppp@lfdr.de>; Fri,  7 Nov 2025 03:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D151E32D3;
	Fri,  7 Nov 2025 03:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVgaffeO"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA1513D891
	for <linux-ppp@vger.kernel.org>; Fri,  7 Nov 2025 03:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762486502; cv=none; b=T5gBMZiUbVLhLAjJeDe3yV0q2bFkahrYR2IOdhjtLTrBydZEE0oa/bWCUBp1PChjaKDoMHC2eVh74t6qEc7+ew+Ajj4CKhvMORHzOzzHASrdJXNFWSOVnnESc7IKNaZiiOqK/lGugP/jCJnxlStzlktyzIUslqXVRtAKzyYVTtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762486502; c=relaxed/simple;
	bh=/sdZ8+zzSN4+VevI0KHO+cKwje7e1ceK2OpOYkJQVIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8YQHHvFBgE9fQXCAtcl0e36AnJHL9w5A54NljlV0bMfistJLv3Uogfaz1avIy2M6iJFfNqEUDuUrW/Z3JtemWjHpoLVJL3QMBCdUi1+qK0YU/el+eyTD/SQDop11XJwGYbiKodKw01elWIsI1sBsvJsy8PfBB3fhPo4mZ0lfAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVgaffeO; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7866bca6765so2732257b3.1
        for <linux-ppp@vger.kernel.org>; Thu, 06 Nov 2025 19:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762486500; x=1763091300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sdZ8+zzSN4+VevI0KHO+cKwje7e1ceK2OpOYkJQVIM=;
        b=hVgaffeOwm2jWKVawg5d65K8HRPxDR8c1ZpEb7OgWxQ6NeLAVX64e66pzS6RlJ09dG
         NK0OW2eG/H8fpNitUyQuJu9plu0NdP/Os8pYFk7ZWgz+3cYX0vtOCOoFe3tX8fZCQpsA
         gdS6eRDsv3f1Hrp6Twl3vFbs5LLkqlWE5C1OkPLhBT7VBKjaYtDf4sI2k7X4XDRVwJE3
         G0WUL5o2HrLFjWj2nwoqLjSBAN8H9lpeW1zgbqzD9qbOyr1YwJFi0ppi4O4tetx7vOrF
         gF7h1mG/m7qks+2TZCvEp3Y0yRuR+zt2P3nX+8Zc1dC5FtBvj8+GI3QQ1ZFWqkL12raB
         1/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762486500; x=1763091300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/sdZ8+zzSN4+VevI0KHO+cKwje7e1ceK2OpOYkJQVIM=;
        b=ZjpDiNkUBCtmn4pBdkk7W4gQXcBdRtZUe93JBc0PcSKU1XAkId4vMQzjv0IzxJmjEE
         p2PlHK0dOFhJzmvWUjx+DyHobk7BLM5bJgkf1ru7CLIEauC6eYYY7/Dbm/a9WNdkJd5y
         LhuQLm8W7wJqg2uQJFmPY+QknbDb0m0I55O1owawf2/P8MDlVRqeijJFseZ2zOydH6tu
         2CUCOpZonYD2yrEliDPxt0XcP70Ecg//DbOjnt4DMFTKNTNVGkQMzRwLC4S2PRCkL5w9
         uE4IpYbRUNUBY5ozC03joD1tDTwcuuX9mH6ftNdfJDWjR8Nov5k4oIEI/R7wLsAoEH5f
         VyWw==
X-Forwarded-Encrypted: i=1; AJvYcCV025c9km0HQrUe7oaNJZWUNaOfyEmTtmTdRb92DyaCNQGs1T0cAbn6YUtma8k7wnDYG3I1Fiw/S78=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1PzW4MFKpxP5SYGEjiiHjxjg6cNL0J0vkXcRwtPwzQ9MsR16o
	4NGmyACKQCnqIx0HHfS80SQvFkpHzmcFxdVViXCT9QQmAmaMcmHb/NxzZgfZVluJQpKVoGgiNTJ
	rV8VBr6QisliwsnSaHbv0TcAvW/Xiduo=
X-Gm-Gg: ASbGncuP8RrGC3EuKH/worsUTnTqxCsuO6vwWuUCZ/snpC4HWD5G8IZz2eIo9lZE0it
	lJR9t2TW9OUy3lWv9eDFvbXNjD/I7ykaEnLwwHLpR0pzIcwOD35jIhcOAQAA5J2+pqgKupBWWRR
	JRrcnU4GCcsOxaOYdOzr5traLy0Bo7zd5KqHrZ23+BEkUa+tj4WO7Grtfds0Dztrp4iyXqA4znA
	LXpL5N/jvsTQLKulCT1AwfemKsj9egnmh57Durpo7kiOr0COTqqWV+fRJyNBV2ES3a1vGYBHuyS
	HK44DkGxT44S+GdcTxTpz7W27I1m
X-Google-Smtp-Source: AGHT+IGDDqqgBqEgNOx4AELZAJ4xLLz45gA1UT45FyOO8v0dFg5xdJ6oOobqThWQoYeziLebEVo9RMmVybURSqYFTCM=
X-Received: by 2002:a05:690c:48c7:b0:786:61c6:7e5e with SMTP id
 00721157ae682-787c53ab9bcmr16461667b3.44.1762486500242; Thu, 06 Nov 2025
 19:35:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103031501.404141-1-dqfext@gmail.com> <d9b8ec8a-f541-4356-8c42-e29adced59c0@redhat.com>
In-Reply-To: <d9b8ec8a-f541-4356-8c42-e29adced59c0@redhat.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Fri, 7 Nov 2025 11:34:47 +0800
X-Gm-Features: AWmQ_bkkdncyWIw-Q3XtM-gpdPTe01VHbfYOl_wXWnzhLVqHYoEvskEhg06aKs0
Message-ID: <CALW65jbNbnDJkHA5imp6OR4MST7=G1XMQ3+ddQ38YuQThuKMLQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] ppp: enable TX scatter-gather
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 10:19=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
> Instead of dynamically changing the features, what about always exposing
> SG and FRAGLIST and linearize the skb as need for compression's sake?

I was thinking the same thing. But then we also need to linearize the
skb at PPPoTTY drivers such as ppp_synctty.c

