Return-Path: <linux-ppp+bounces-330-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCBEB19ECB
	for <lists+linux-ppp@lfdr.de>; Mon,  4 Aug 2025 11:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1248E179CA0
	for <lists+linux-ppp@lfdr.de>; Mon,  4 Aug 2025 09:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3819246760;
	Mon,  4 Aug 2025 09:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxiYeJ84"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7E224635E;
	Mon,  4 Aug 2025 09:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754299788; cv=none; b=OzjWxAxg5mrcaLXSSAaLf7JqBlqdNuOipCuy1/vhGiXvxeyz1zho9fJH/GkNzwjR2uY3pXs/NZRBO2ca7x8dbOWZlFAuLwXN2rVLUs4uPFiMlo7OzLHA8HNNSosGCKk4IjRi/0bArYv5OqUflGM5CGixHLxd972urdvF2ZIP31c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754299788; c=relaxed/simple;
	bh=0bOR85IwqmVhzlMXMXnU8/54d8CwqJbimfrabBc64Qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3K5AitQIzEZmhtlcA3ZVaKryRunh05o1jYMA3NOUDdP4KUcIu2HJVXyhS7RzdoHJlihZC2MfqvJKVaOqxiPqg1qxBx0JmBrN5XsePRe4I+C/VuPzanNvZWUj8uCHVr7iq/h4QKnXThaa+3axoQ8+C6XksGjLCy9Gvn2ipkKEnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GxiYeJ84; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e8fe3aeffb6so2110587276.3;
        Mon, 04 Aug 2025 02:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754299786; x=1754904586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/k6Remx3AitIuNeSrJaU0Zfq2mESN68ZfgTyLwXy+M4=;
        b=GxiYeJ844BYcMn7fxq6I0enu0XiblPjegPb5gFE4x2iuYgKUkiO5ZOBBfzSujE6MKt
         D4Z54aJi0ci1LzHe8iBTdfpiiZ+93TVrrzY9LRLkshZ2bLv2d7apbip7T3wslDQbIjlX
         DAZLFyXpkvP7l7XzPFNu4T30YcfaCFMqxpJ8pC8SM7ehY2Q5hlKz2WAAmVIEZgSXy2X4
         fJHnezYCgoUMGRnmrooADVEqKYPar0GdywZncAFWoe149xQp6c0St7RNh538SLkKoiNA
         gu+0E17P8DvxCIQ+DZFPZyz7mGaKjzHvtl9IgUil4z3hrJnKmKkntPdrACrcDYSVsHaa
         6mWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754299786; x=1754904586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/k6Remx3AitIuNeSrJaU0Zfq2mESN68ZfgTyLwXy+M4=;
        b=P0hf305ct8VyfhF0IWlWI8uLfqPTxdMY1sbspfYR+W1zcz1CeyuKwb6aS9AKfA5WKl
         bi5IWG01XZoxJHIORdkuxwhDJM5Jr8zKP9j1oA/Se+v9oLpRPfBKLfu6IpKkpZ+p6WBW
         gQ6eMJqZGWZJytm2MDYx8hnRcmDhHpNMCEKR4DMq3cjcbmBq2Jwi8f718c1uASatc16V
         /h9KZW0NK/jYrykR/ecftn2DH48IaeFjWrRMZ4ECKcdE+y/EBBIthgr7pxCNbdscficN
         kMcfw7PN79Dk3MEEjqnZPFoJ3V250wHstMyOjdC3RMyAptrHs/he8HlhcJcSceC3JCDl
         wDgA==
X-Forwarded-Encrypted: i=1; AJvYcCVbt+mUgrjJo1QpSeE5ah+UOLeqr27bBUa6N+/urocFXXwIo2OT1/6Vx0ck2/ATXYyLy+wP9wi/qj28+tY=@vger.kernel.org, AJvYcCVvRlgKPQeJ7TFoMAn2mPPlI7I5qeoFcZUmFTXL7H1rG7ie9otYx7mMXMRyprq9JVOYJ+YjBQQfht03@vger.kernel.org, AJvYcCXycw9a4VyfIuH15MbP48ZCboi03EXH7uoke+OLLmLsfBbleZWp42HWI3dPnZ87E+8cTdFMuvFV@vger.kernel.org
X-Gm-Message-State: AOJu0YzGYJZ3yln3j6PM7E5zmrkNya5pdW2mUfeQo2QES5NPGWVzsX+G
	O6g/v/ooFQ1gSRMjQw2MOm3EbS7I8srixpL3alaP/E7A90LK0C3H1qxEScHkLsyvI+vOYd5Gzgq
	QApLEmkMMILePCQEE/0JEMMM7iMqh40o=
X-Gm-Gg: ASbGncvETKRY36i7QzHQUuAYd19ZmddIVkBSbBVRgs30L/+iCtcL4Y5APy2BmFLr6mN
	Y3gKcICCeArvfompZJ9L2kkFLDdKQYcRbJqSUKjB7j89Uyio+8gBefCkhxoEfDiXgRlX5+2OXpb
	TTfIbOU1J4V2DX0FdewYq7VI2Y2uRVm5M39wwx9baFtNbBqWzI8vphEpo5luGIUEtgmn0NwEpU4
	S5DG/quw+MNT97UnTFHrls6tCkzIDYUIsWY
X-Google-Smtp-Source: AGHT+IFZnZKo2wN9guqys9KE+oxNobYmE4Ew1acbmvVRlQylcNjmUsKVRJc69AXJZO3Vq5eZfEH1OpF/mTVRRItH9p8=
X-Received: by 2002:a05:6902:18d4:b0:e8b:beb6:a35a with SMTP id
 3f1490d57ef6-e8fee0baa79mr9021637276.37.1754299786217; Mon, 04 Aug 2025
 02:29:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804062004.29617-1-dqfext@gmail.com> <CANn89iJ3Lau_3W5bJdmRWL9BFUf3a40XqNgfjr7nCEu5PQ_otg@mail.gmail.com>
In-Reply-To: <CANn89iJ3Lau_3W5bJdmRWL9BFUf3a40XqNgfjr7nCEu5PQ_otg@mail.gmail.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Mon, 4 Aug 2025 17:29:32 +0800
X-Gm-Features: Ac12FXzjQmRX7zY2qpX_2OD-rFX7sajMSoVIgkI2LLkZP2HtCzzZRcen3I4K57M
Message-ID: <CALW65jZToqXjwgO15vi8TWYnXyS_cY96r7V=k8gQwpSRP2TzEw@mail.gmail.com>
Subject: Re: [PATCH net-next] ppp: remove rwlock usage
To: Eric Dumazet <edumazet@google.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Mon, Aug 4, 2025 at 3:36=E2=80=AFPM Eric Dumazet <edumazet@google.com> w=
rote:
> For all your patch :
>
> Since the spinlock is now only used from the control path in process
> context, what is the reason you use _bh() suffix
> blocking BH while holding it ?
>
> Also, a mere rcu_read_lock() is enough for ppp_dev_name() and
> ppp_unit_number() : No need to disable BH there.

You're right. I will drop the _bh suffix in a later patch.

>
> > +       synchronize_rcu();
> > +
> >         if (ppp) {
>
> You probably could move the synchronize_rcu() here, there is no need
> to call it if ppp is NULL

Got it.

>
> >                 /* remove it from the ppp unit's list */
> >                 ppp_lock(ppp);

