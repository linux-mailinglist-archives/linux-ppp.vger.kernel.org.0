Return-Path: <linux-ppp+bounces-269-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 128F6A49A36
	for <lists+linux-ppp@lfdr.de>; Fri, 28 Feb 2025 14:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E55B16705A
	for <lists+linux-ppp@lfdr.de>; Fri, 28 Feb 2025 13:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148A726B97A;
	Fri, 28 Feb 2025 13:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WNURMclR"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67D0261579
	for <linux-ppp@vger.kernel.org>; Fri, 28 Feb 2025 13:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740747991; cv=none; b=L9cwNwmiXIumOKfoSAMkPvUFDnC2rwZg+r+bg0BJPrx82Q6FleaAjlPDDMDxgiuDK7HKuvGvBsw0PhNMQnD9C+6qM4j8X4qfUpmsjs0BHImyrHW5vdkEIfZFtKblj9dqogOY6WrX53Xj/tDsOoXgbByT6R4TzMAtII+5TRdirPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740747991; c=relaxed/simple;
	bh=+GsZ2x5HDjoLoOW+IXY8Q0+AMdGD72Srex7vp56yPeY=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AsTsUfbRCqStMjuuqKybF+u/pUk3sMlUibhJQTIuLEIiP0qc2yBPFCM5/qWvTeRUdHliKcgXbC07XztjrSlOJ5xMkuVAb/eU5ThrARmpD8vN950Pzim4199RvK2WHm7OHE5blbjf1Sj3gqul9RWJGcwCssqWf3i00tT0Kjt/aXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WNURMclR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740747987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rXONDGo6ihZ0iPAG84+CFGzh14N9ncmYlb6e6RA5ajA=;
	b=WNURMclRK/elCk10UKIXY71Bnt7gwcf6uyTgVTy6LK4XZcCcRIdb5NYSMMk2+cvA6y1/gE
	JFF6UiSLT6wfuYEttzu1DE+1brgapqZF5GugSMOTH4Opww2e2ihQoVvOEGYQP0oxI1e03j
	UR1K/SBp+toD84iDhXxZN6QRDtmVJJM=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-FFgLTEAgP-mADVcfJqBnMQ-1; Fri, 28 Feb 2025 08:06:26 -0500
X-MC-Unique: FFgLTEAgP-mADVcfJqBnMQ-1
X-Mimecast-MFC-AGG-ID: FFgLTEAgP-mADVcfJqBnMQ_1740747985
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5462122814dso1703524e87.2
        for <linux-ppp@vger.kernel.org>; Fri, 28 Feb 2025 05:06:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740747985; x=1741352785;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rXONDGo6ihZ0iPAG84+CFGzh14N9ncmYlb6e6RA5ajA=;
        b=E6KAqgZxyzSriQUDqLRkFByBwafzoKpyjEHbl2/tVU+alFb7bbGcYaDNu9JJ4l6fOG
         IiP4e/WqjKuJCKeuDjZvDdRF3SCqo0ZS9gnXxwHL8Kz40+bHqstPTbJFf5iLooOj2wnN
         9pld4bEYZuORe30wSEqFWAAamw+KOuWynbyVbuNdc07tycflVbOuINKytNmpnQKzXSjZ
         Uq5XqTY+vHKb4CilqSlf7f9pz/IL7GPGIOmJPe5pgRJGZ9ldtXcpILCUDQJMbHLe8OUq
         0n2sEfoLyZIpHhCWbdd+epbTelgsTepwQ15V5Y4ynjHZJkQTikLmjqfHlYdzBMlQnjzg
         9Tvw==
X-Forwarded-Encrypted: i=1; AJvYcCXJkCsKj3hepZLm3OdO1RORA3iW08r9mCFJdegB0JVCDaawiisUOcQArvCJKEaQ46ZUnV6HIgILY/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4hQHfZC3wV5QOUmDNjapPE2MppCew0AyHCv4Bq8MCIVy1kd3Q
	pix3RKyhKB+33yZ+YW77GxJG5UcciUcugl4xinSFzHHvccPEFwBDbOC708HqvWT8adm4QquwlAD
	X95W2Kd/FTIfOHFgzuo8tO0EsTTDDwP9kpgEbfsN8tyJV/RCZ1MEmCqJH7g==
X-Gm-Gg: ASbGncvblH4mbCE9tg00uqlxsJ7wGMiwmuJnnEvm/UG267YEt7qsapa+W6981ojpEqo
	6d5YffD5F5uckxirS6FHuIn6vLl+KwRjnKBXwnq/jwiGFVFeyW8L8rHa0NZvQJAt/ctQsV0pkYW
	msdWD/Y3cvRoivQj3xEVzEc2Z8AyEoX2T0WSpXsrPVHqFG54pf92g8qUtud2OHb49LO/cpKSdCr
	tlM+urdXG/djWeM6P7j/XXfkkbNz3FWQzUnGk/jJs7od6jFuF6LYAQ+02wkbcitaLU1GK2rRWPQ
	tIsK1Qq2Sf93
X-Received: by 2002:a05:6512:693:b0:545:d35:6be2 with SMTP id 2adb3069b0e04-5494c37b691mr1519548e87.34.1740747984671;
        Fri, 28 Feb 2025 05:06:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXotuHxxDRGbkDTRI047dsn/XMby3ovfUFDsR8yccG6wwU82nc0E5sR/kWuqacEJVRyen1nA==
X-Received: by 2002:a05:6512:693:b0:545:d35:6be2 with SMTP id 2adb3069b0e04-5494c37b691mr1519511e87.34.1740747984188;
        Fri, 28 Feb 2025 05:06:24 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494cb3352dsm274562e87.184.2025.02.28.05.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 05:06:23 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 970B818B69EB; Fri, 28 Feb 2025 14:06:22 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Qingfang Deng <dqfext@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Michal Ostrowski <mostrows@earthlink.net>, James
 Chapman <jchapman@katalix.com>, Simon Horman <horms@kernel.org>,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH net-next v3] ppp: use IFF_NO_QUEUE in virtual
 interfaces
In-Reply-To: <20250228100730.670587-1-dqfext@gmail.com>
References: <20250228100730.670587-1-dqfext@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 28 Feb 2025 14:06:22 +0100
Message-ID: <87bjum1anl.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Qingfang Deng <dqfext@gmail.com> writes:

> For PPPoE, PPTP, and PPPoL2TP, the start_xmit() function directly
> forwards packets to the underlying network stack and never returns
> anything other than 1. So these interfaces do not require a qdisc,
> and the IFF_NO_QUEUE flag should be set.
>
> Introduces a direct_xmit flag in struct ppp_channel to indicate when
> IFF_NO_QUEUE should be applied. The flag is set in ppp_connect_channel()
> for relevant protocols.
>
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
> v3:
>   Move direct_xmit above the unused "latency" member to avoid
>   confusion. Should I remove it instead?

If it really is unused, I think removing it is better to remove it,
yeah :)

-Toke


