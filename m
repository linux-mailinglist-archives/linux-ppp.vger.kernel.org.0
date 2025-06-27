Return-Path: <linux-ppp+bounces-309-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF93AEADAA
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Jun 2025 06:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B218D1BC7C10
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Jun 2025 04:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1BD1BE871;
	Fri, 27 Jun 2025 04:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrlrvfPO"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09C0249E5;
	Fri, 27 Jun 2025 04:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750996811; cv=none; b=Cn4zxHo1NRq+PHxFSkYaqRp+aWuxO3DAaiVSo6ifMFAvet2FFnyVMS6M9RM/dszPfWRO8shoJImjARljA1KtMKoFvenH4mAJvBRfeVfwIKnrObHLZl27QbRF46Nbd1Njz0nLq2DDOBMj/56sqA+NwetvaO/xRY9pR0lvZhwTYbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750996811; c=relaxed/simple;
	bh=uzh6Ejeo0zjoQzvbnZGYIBfTNLOOJRawGCX6NyVzMaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZF5ga7swSmoY2NikenFzK+9NWm0W8CvJwMaToCS2W+UNtrQJRtAzWI6ovFgMtzw880UyQIcyJFQ+m5Lu0mQY5UU3uqMk+x+YRutqPqlETHhYvguJEfqAm9sw+vZqWBWheGxLuPWqfezBPSQJmcqk0bqL4H4QKQVtVViQq8vfbOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrlrvfPO; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-711a3dda147so19579157b3.2;
        Thu, 26 Jun 2025 21:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750996808; x=1751601608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzh6Ejeo0zjoQzvbnZGYIBfTNLOOJRawGCX6NyVzMaQ=;
        b=lrlrvfPOAzaPRRBZVHWNSGC5PZ+izJuIC8G9AwKboi3FNNVSHFOfcnyExpybSf9a+M
         Z3XamDvkEtXNazzVwhZejaThdkW2Wv+9g6Qq8ZG1VOODZrk6dzSgaKd2HKA3AoMGGCEr
         Ha0iKsNWdQy3Q1DbteNdpimKefMuPSTa16IcGu4cvciqb0VwgcUXg2LRLw2+9I+77kXq
         abrJEvhYLbkQPWuwsQ5dDzOxYHvF1vVrAIlBnAdpUBzLyW9m+j9QfzpTJAzRwksj2myk
         EgR2x9sgVBJKeyIxGecpgrZ7J9BacWAqKX18M8Q1JoT4D33i0zUHnCKVuLfP8wCZv6z4
         ijKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750996808; x=1751601608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzh6Ejeo0zjoQzvbnZGYIBfTNLOOJRawGCX6NyVzMaQ=;
        b=wQ/DAr2J+Pw+tH0uAKp0xKUKqyZOUdboKjjy+i4J/208mtiFta/o46wS7LXlodoyu7
         mWefBEfsoTTtb/YqPOE0eInxn6ydtossDA4o5ezbR2NsOAuhycieTNXoWfJI+7Savibj
         DIWr9Pf7LlcnqLDik9Gsk2begePnU48/ZnSBw6XUO4i9k3gmfK00oLUVhXDqWTPkqewg
         qnMGtmVGIrKT4LzIYxhjp5Veut7IQ7t1ThIARVCSJE5wouSwn68KBR7+VsuSIT8tX83o
         oidXiSweRBC89bNxuiqGw9LabkiY5iToa+yzFB9QrUbXJ0HNY/qb85zESkr82GwUDm6h
         LSyA==
X-Forwarded-Encrypted: i=1; AJvYcCVFHAHvbEHlMHhhFxYXC7J6Zvl+5hwKxhuSt3M7OsTj3POf0LVSjgSTv20Nq+W5PNC9qjFOicWF@vger.kernel.org, AJvYcCWA1PvXXqMJVk6Ezf1OP8qmo0kTGzPefxNHj8muLhiTBY/EQloGJnEGElXDCmvF+p+ephDUwrSwZlK7I3Y=@vger.kernel.org, AJvYcCWRWy9/Q3EdosPgvaMPVTJ1kgDGKu8c2DFfnfjlNTrIOO7qEFybO2ixwmnGYAE8scwR3+NGbCqHsHKu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw0xUDFNmpyv6ZLwQyys8OeixA6D9CJRG/2SKh1ABVe+u+Wq7z
	xJyMupDgTRF3wbDmSbRe+WOQr8hSojQH9W0THPb0hqTJhX+W9YPDDorw4nQyQFVaiRVcE2nj4aq
	dfsY2Ff1qv8VOz3mntB77+PW5JVnJyUg=
X-Gm-Gg: ASbGncts/b17RAjaHvpE40gwvq1NOL9cXS1whNPKESgcCuq7mCp//9Ak0ety0HOgmCO
	D/1sEhrFa/yN8B0VV0Lea3Txn4QyGn3DoAz/yeRIpiE25bE2i1Y7qSzohYmIbFY+wuinnExxgmt
	+5pbMPdh6zsUTj+d3bIolKG09uXWtuLd6XFFN+dGCPNi0s61Uu0N2S542dN9c=
X-Google-Smtp-Source: AGHT+IFGFbNxfM2Y3pKB8FLy0/CNkvBvLBQxCbwsOZh36DwBvQpux8n0sFeXGu96NI0KeKMemd9NFiA0SpOeoRaXABE=
X-Received: by 2002:a05:690c:6e8e:b0:6fb:a696:b23b with SMTP id
 00721157ae682-715171d2002mr27679707b3.33.1750996808407; Thu, 26 Jun 2025
 21:00:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625034021.3650359-1-dqfext@gmail.com> <20250625034021.3650359-2-dqfext@gmail.com>
 <aF1z52+rpNyIKk0O@debian>
In-Reply-To: <aF1z52+rpNyIKk0O@debian>
From: Qingfang Deng <dqfext@gmail.com>
Date: Fri, 27 Jun 2025 11:58:58 +0800
X-Gm-Features: Ac12FXxEbCjk6xKhlXBSv8er9UxDmmmlmhm8ygwfkngkLtj7QrRRPuHIJzB3Cqg
Message-ID: <CALW65jasGOz_EKHPhKPNQf3i0Sxr1DQyBWBeXm=bbKRdDusAKg@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] ppp: convert rlock to rwlock to improve RX concurrency
To: Guillaume Nault <gnault@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 12:23=E2=80=AFAM Guillaume Nault <gnault@redhat.com=
> wrote:
> That doesn't look right. Several PPP Rx features are stateful
> (multilink, compression, etc.) and the current implementations
> currently don't take any precaution when updating the shared states.
>
> For example, see how bsd_decompress() (in bsd_comp.c) updates db->*
> fields all over the place. This db variable comes from ppp->rc_state,
> which is passed as parameter of the ppp->rcomp->decompress() call in
> ppp_decompress_frame().
>
> I think a lot of work would be needed before we could allow
> ppp_do_recv() to run concurrently on the same struct ppp.

Right. I think we can grab a write lock where it updates struct ppp.

