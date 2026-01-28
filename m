Return-Path: <linux-ppp+bounces-373-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FodBNM7UeWntzwEAu9opvQ
	(envelope-from <linux-ppp+bounces-373-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 28 Jan 2026 10:20:14 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 759469EBBC
	for <lists+linux-ppp@lfdr.de>; Wed, 28 Jan 2026 10:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37129300D171
	for <lists+linux-ppp@lfdr.de>; Wed, 28 Jan 2026 09:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8CA344035;
	Wed, 28 Jan 2026 09:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUOt2t5A"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEDA3446C7
	for <linux-ppp@vger.kernel.org>; Wed, 28 Jan 2026 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769592011; cv=pass; b=qyExGQ/yJxb4pfC1gbCmyWoJMZ+OCMGLKqSSZo576+4kfB+kIeSH44atziPzqE/sGp26rK2zkRDxdktvczHCDYNHspkiY1ppgCp+BMCOTyD1DR3uzKNOhKlJjhgXvXIN3ZvIY9yWR4Z5CTk3PE+fLdrdvM/qikeF5ukZ4RAiXUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769592011; c=relaxed/simple;
	bh=WTjdizy0L7AQzzyijgEvT1vsbT/lj9HTIYJktJcR0jI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XlE28JgDOz94tfyRNkZ6n/EF3mkllUBwcjyVH7b+GXA6MS0qURqqr9ilx6N7RCMWI8OMx5S8TPBIelC/iA1klIeHJYSWOk4GuVArnww8vqfPxaEDZFL0SxYWhNOd7I0EI6ma6jxGd9irg77W8GoyCCskmLMUR3QCFRbam1+ZgkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUOt2t5A; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-78fb6c7874cso62557287b3.0
        for <linux-ppp@vger.kernel.org>; Wed, 28 Jan 2026 01:20:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769592006; cv=none;
        d=google.com; s=arc-20240605;
        b=cR5DddcwluSI/vHO9Niur0OldOgfTczwtjXbLJa8i0XSB1xO3kJ1VMZIQI1qKlvhyQ
         QZXEH5F5FGyZY3oZGN6cLN6wOXsKxm1lK6qbnCKSSUqg68IRFUC2Ms0Wf07TsIBnY94e
         98mU4Gw8+9MwbBFkGo71VV60I8NFtsPqRMdIJduKs5Uv8MTfe2Y2IIS4RrM9iSHidWxH
         Sx0Av2tnkjuHEIPlz+3xqVqj8qy0qsjfv1m+ruRgML9Ddm4vvIy7La7zZc44JBIByhz6
         wisCa/+tWiJAvfRS0eLUXiuOetFofbbWZfwq5mlDJKUYMsOOU8WcyRrsAUyI8nUzVNvc
         LgIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WTjdizy0L7AQzzyijgEvT1vsbT/lj9HTIYJktJcR0jI=;
        fh=9Z/Mj9twCmPSkKjSMcrhNWQ1qwZ1inx5Y8/T5/ny+4A=;
        b=l07Hojirxq3NUlazC/VwgZ5Curz0kDoZTjLzLIYdq7aQotW3A7wIVNciWWjKIMS26T
         LlAyIPhlaPXUEOtj3X5D2WOlWxDc1ayzlbP8L3vnogG/fs+gBZe8R96hFU/iY8WLj3oV
         pTYQLCNGSS5HAPzveoS6P8J8xNuDiaSm5u92t0Vzxtp1wXNoEBf+qEir8NYNXFCrrdYf
         fJ//vg4TYJd5ZmcVUclTHEqD6Zl2AYSGKoZZScVrTgSGEPd5VEiwUAUVAZH4LCzFB4qv
         zUvDCtULf63lADaCPm5Wz5Z5yHCVsMsFz7Vz3wunX/US+m6oufieUq0wvJ7dwn3W0O0m
         Brig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769592006; x=1770196806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTjdizy0L7AQzzyijgEvT1vsbT/lj9HTIYJktJcR0jI=;
        b=VUOt2t5A5JXzlsHBSosjwhzHKWHoOc+d4faz2Ll5EEKaPs+uStDshvuVBj2DfhUUFg
         4kRj1GUCy+X2DoV15M5LWeOXGZ7cXEESyCQzxGdibIXUNVwv/VYJSJR+UqaOfpC0BNVQ
         Nhe/m7kmPCzE517QfTEMGKyFhg4C5mhOYQ8tmxnQF8SfsapcyTFX2omvyVRe33Hd1jHu
         J0FVu0ZS/bgDdBrveC19hZHp2YeFS5v/XlBRP/EKey6BYI6J6zsKsifx7qY7orcCTzMD
         BxUy6J8D9NWomP1o1u4oYYvewMCELTHC2T5M9zpTeGZwaDmQMGFH6lieYi4s3l3gZh+s
         OItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769592006; x=1770196806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WTjdizy0L7AQzzyijgEvT1vsbT/lj9HTIYJktJcR0jI=;
        b=QK8CoTQA6H89qks8nUCuchLIBJVqgn0SYPbdWTrjPrfIP21ObqFK3EVBn4ICI+nz3l
         cH6+MaB8kJ2y96I2GOY/b6HiywTUnsDd4qx3s6Pu5fgMDjc/zIJ6QAYUBBKjnT0YXtZH
         y64sHgn852SNsbVaQ/E9jrnCODQzNF/Qi9QyFGSAVA4Ix7XT/wdK7egEKPIShv/VYarr
         F9KgDkOSA+ruixBOnIVGboywIylGZZMWsSa2zhN1uHP1Ziy8Kffg9ITeNA3hqDO4c879
         UaarBGLmu/U/OSLoFXmwsZgc/f3yFhPmKFU8fo/1Rl+PCNheBKcHvu18cnZluMVE1lgI
         9NXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuDkbh5l1q0+pEpDZW7Be5PDubNygSDRIwpwtfK/4p2dhL82Xma9s2R6cDA2f2c7sZdYrTDFVZkSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOVUlAKrh9yol8ofiXoBjl5EUGIbo8EEVVyX4Q3fBFHw6QPa7N
	B8J+5C8/4lMHnexDthnLm7rTnzRcLYz5MxuB8Z7lPbzOInDQkVJfH5LeNumxMME90L30W7d6Jra
	6KknEEwl1J7PRrU92WOGeruMIn7M15OM=
X-Gm-Gg: AZuq6aJXq10hND1BV3Pl2UmrNUKqJh8uIzzeHJxpFRoKE0lRnBhoYfMBHsTkW+sU4jJ
	ZGJPCNAanUrrWuSNZbyj2OsCnbTqyWKtfy9TLUI5Sv8WvpEjyT5aho2SdlGeFbKD1kXsaFTf0m7
	a8nG6B5cVrIshEhjA0pEcRVccQHo8l7faJnbtwUk032p6uIJV323FyzHpBAMbf2ubMoBlwbxPIZ
	XvZ9pjRQVIGr1Swo0nXybSy+n8yEwQYaUOlmmgdy+fH5YDX7NJMdk+6efJ0NlVjoVHqc4PGOcLj
	T4rvrUowwI8uLPzKCVPSJWXD
X-Received: by 2002:a05:690c:c1a:b0:794:7131:3dc4 with SMTP id
 00721157ae682-7947ac5da1fmr36070537b3.58.1769592006179; Wed, 28 Jan 2026
 01:20:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123014214.225278-1-dqfext@gmail.com> <a957214d-62dc-40cd-a422-73b317bc1827@redhat.com>
 <CALW65jYb0prfB-KpxdcNVHB1tBjN3tW286BsvQkCFoXwTu2QKw@mail.gmail.com> <53ce393d-7071-40d8-b57e-df14405066ca@redhat.com>
In-Reply-To: <53ce393d-7071-40d8-b57e-df14405066ca@redhat.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Wed, 28 Jan 2026 17:19:54 +0800
X-Gm-Features: AZwV_Qjqpy2atw73QbxauN0Dth6WeSZUzvKosbHrYjpvy6yCHSAlOUmu7PQzwKk
Message-ID: <CALW65jZVB=+Q89Q7CjfngUyski1F5dCfbdGZdxe3no76Stv0_A@mail.gmail.com>
Subject: Re: [PATCH net-next v3] ppp: enable TX scatter-gather
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-373-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 759469EBBC
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 5:05=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
> > On Tue, Jan 27, 2026 at 8:34=E2=80=AFPM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >> I spent a little time trying to understanding the logic here and I thi=
nk
> >> that enabling features depending on IFF_NO_QUEUE is fragile at best.
> >>
> >> It looks like that the IFF_NO_QUEUE bit is an inconsistent state for
> >> multilink devices using different type of channels.
> >> Moreover the user-space could attaching a qdisc to the ppp device afte=
r
> >> channel initialization.
> >>
> >> Instead you could always expose the features and linearize as needed
> >> when transmitting on !direct_xmit channel; no need to touch the
> >> individual channel implementation, you could do such check before
> >> calling the ops->start_xmit() calls (possibly creating a new
> >> wrapper/helper for that).
> >
> > Attaching a new qdisc won't clear the IFF_NO_QUEUE bit. (The flag
> > means the interface _can_ run without a qdisc).
>
> Correct.
>
> > As for multilink devices, one is not supposed to bundle channels with
> > inconsistent direct_xmit (for example, mix ppp_synctty with pptp) and
> > expect better results. But as the driver does not reject that, I may
> > add a skb_linearize() to ppp_mp_explode(), or add a check for
> > SC_MULTILINK flag in ppp_fix_features().
> >
> > What do you think?
>
> AFAICS nothing prevent the user-space from creating multiple channels
> with different type even without SC_MULTILINK, so ppp_fix_features()
> should likely check the whole channel list.
>
> Also packets could be being transmitted after channel creation and
> before the features are updated, so ppp_start_xmit could observe
> transient mismatching features and skb layout.
>
> It's not a matter of bad performances: if skb is not linear and the
> channel start_xmit assumes linear layout bad things will happen. I think
> that even with a correct ppp_fix_features() you will need to check for
> linearization in the datapath (as an unlikely condition).

Fair enough. I'll send v4 with your proposed changes.

Regards,
Qingfang

