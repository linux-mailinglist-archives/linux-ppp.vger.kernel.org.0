Return-Path: <linux-ppp+bounces-457-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF7dJ/Z7xmnwKgUAu9opvQ
	(envelope-from <linux-ppp+bounces-457-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 13:45:42 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F16C034481D
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 13:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30C53301DE3F
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 12:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA8F22CBC6;
	Fri, 27 Mar 2026 12:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZfPPg9c"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E21225760
	for <linux-ppp@vger.kernel.org>; Fri, 27 Mar 2026 12:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615165; cv=pass; b=jzLtPM/BO0wwbOaqBbc3pWw8gSiH1Jq9QxyDvZe6FfzE6tyBET+qANdMm1qj2E4gJIkGbNIiwOqgQ+lDIzu11K57MZYlu0QhbiM1tYNVWQ4Nh+QHbGaHXIa3EvSOZdNgWJk+lkbQwRdE6SXQ/84Aj3u0qdPt4s9dfwlmj7eMYYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615165; c=relaxed/simple;
	bh=9yUDwreZVAO3aCgvkkcmjPsNpZ0NGYYbXQDmMvro/NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cjl8L4YgrOKwmv0o1AU5c1cuHgBPu9QmQ+MAla62cm00SutJX63mtCohLnOKro+wWH0jaWN/KQylrFf+9e1WFNITqc0YCJfjCAq6Cptzj4YvF1qyz72gI6ZepYNFzb2N1DOcnnbflkfel3MA2z1VYrYFx7DEKkVCqwP8LG+M2D8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZfPPg9c; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78fc4425b6bso20832907b3.1
        for <linux-ppp@vger.kernel.org>; Fri, 27 Mar 2026 05:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774615163; cv=none;
        d=google.com; s=arc-20240605;
        b=QkadjUbugsqrig/wNlys76I6xV0pFaXB+Zhe+ldNA92BtssQCE3qnq9aY/z2Ovjkym
         lnqy/yr/FzKDPs5+A6sFe+CxHGJLRAR391FKxvfELY+MrPiORHsRlRAgyThUUaqDQsBG
         Aa+cFZNGLAyXxjWaZWby+9n7p4+qCNejKSIupv8ejWnQk1qFS9ZXND4HiW8TkZGUduIe
         KQ85M6RhneIdGYx8Z/bc/T4UBfjQVYCg8tr0i/fipQC0CEDP0bp6yV4/ysQQ5nfI5zgp
         S5717idXrt2QIe89dyyhLYVfvrLXDMqG4H5WgWfm0tFbLwS1Q0Gw1U4rytLFxYEGJME8
         FBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9yUDwreZVAO3aCgvkkcmjPsNpZ0NGYYbXQDmMvro/NE=;
        fh=4+whgxVpk9f4KX3HzX6ski5k/Wb6llF4K1geXUA4ag4=;
        b=d81JdWgzs4WUbgLwysVITumhW2jTxtXjrfV2kwG+nNdosU/wvBqEg0aLY2W+TW/zl5
         XjnUPAnigtiYq9gKxYNnBi2Y7Tuhp8HAVcAaFQfUvJ7aSMVyuLFXxkiKF3lUQ2mH/MHJ
         kdTZ82v0ckRsyzK0G7ZTNXnVInqt/CXYWV493Q9A6yZcUo9nJdY+wWvboS5kYCXXg9jo
         wtyDOMy9zTjkDuAfcUqS1MN4SDatnIlnLVZtwqs4wV9h9e2ah3MCDKbPbas1XF8VZrQs
         liAfYem4+gWZYKWN6AojKWBRiH2INXzDrIpKKHCWV/99kdk/QEM7tf79Rk1ZUbZlJtx0
         uZRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774615163; x=1775219963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yUDwreZVAO3aCgvkkcmjPsNpZ0NGYYbXQDmMvro/NE=;
        b=nZfPPg9cyym33ia3X5tDthwBqAVI1CRF+E/nPYenZQABTctGnlIDiSg7i1bzKgTOBF
         axmJNU3QlhD7/IfQ7beAiGjRCIv4p0KLt6Y6egYVRBZvTCN59pLxsUckc/5iavN7WXnO
         +1l+DoESaOYXaVtSQnF37S2iTFnnVbet23NW1EG282H5sVakuxtQ89aIL4O+96qZNyEz
         0IBYSbaXUR4IfkCaUu2D/845hwXrDaeRuaXHsnfrk86TSL65hNQEeZF/TAGm0xgUjhGX
         g6Lc4Tpnfl65om1rQIQlTqaUizpEQl3JsIp3n5kqKguSn35BSmP9H7vxPxM7ZHdNI0Zi
         Ke8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774615163; x=1775219963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9yUDwreZVAO3aCgvkkcmjPsNpZ0NGYYbXQDmMvro/NE=;
        b=qt3RjxxqNKYzxWCLJ52nmpJ+L/k76NTei9n3iuCE2N+uWiwpwFuT10j4zHhMVyT/rQ
         WgFrGRlfM1mV3cVzkwYav1A51vDAP9twrM6dJUjty3+IR6XsLuwIjFozzWuLIl7f/Vjp
         MF47TF20ef3rlud0Xce+f0gPrWATULt/3fdoB9Warf7QO/v1mQuHMMtrEdeQV/i3DQ1D
         4MP6SAvj7Z8IV6nTZUpNV1KopNXCZ0LS/u7p+q1adVlY3yp66pedxKWTu/ozV2XUXatZ
         0SOm86s6fzfQUv2cP5B1UDbEcA4fim2MLw6hlemP9ZZ0ZZfpEhEJ8oMRpeCEv2gz8C/2
         Nhnw==
X-Forwarded-Encrypted: i=1; AJvYcCWVxSSMHrZROiVsxqehFTgk4MvVFi52OlM4CWPqCsjAklVqtRLxd/nnkEetFECkYNwwZtSthqmb56U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFbuMD5/2ZMsqeDFlvJSuyIN0MM+XyPPkcNvZM7FlFfC4rUs1a
	6upkaZz8M+wcyyZE3R1dSFha7Y62vWtNI45skb0bq/xiXRH351bCsg8hN3bEnDR0cnT+Op9tuKC
	howS5zdEeSvbZfXfM5q+LWgPLOa/jJf4=
X-Gm-Gg: ATEYQzwZ7OW5wtwBlDqinjL8StBMWQjC6/Sqa+lLrGLmIK5UoZuSn5SPafl2rnDjZaY
	BdH775U7kFcjzH4pW5mDpgMKMwFqSwmj0rM7HZ/hNL/3EXYcc6N3l0AY77g6hccueIk3KQs8Y5a
	RS3fNQ72zrCnAaYXAGqCaCzw2h/nTzGkqqa1nyHksvW5FmLA472rJf5nkKZ5bFFnM/AjRjWZBhD
	Hc4iFxffpqlFASCX6D7KOvmjxq2ywApc1fUdFnAir+WjIrrG+qbiEQKBI4jINTv48B3J80HiLRA
	ZmiRffjeyofTMCecXfKpZxdgxoW1CIyQbOcY
X-Received: by 2002:a05:690c:89:b0:79a:62a2:b3a6 with SMTP id
 00721157ae682-79bde0b0487mr20276607b3.29.1774615163125; Fri, 27 Mar 2026
 05:39:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326021642.29170-1-dqfext@gmail.com> <20260326081304.xKa7-s_1@linutronix.de>
 <CALW65jYdzn_rZWa2zwYd5J+Gd=kyaGMsVFyX0fMJfKfgULMO6w@mail.gmail.com> <acZp3gRUqVIbw9yb@debian>
In-Reply-To: <acZp3gRUqVIbw9yb@debian>
From: Qingfang Deng <dqfext@gmail.com>
Date: Fri, 27 Mar 2026 20:39:11 +0800
X-Gm-Features: AQROBzDc-YGc2NLhX5E2vD7ZT3JvJ1z5OznSsvZlnQxdHln3jtYE9PJclSiuybM
Message-ID: <CALW65jZNi3oA7V7at_Jr5Vr4AdL03JYdA9WeK5G7cNr-XS2Bvg@mail.gmail.com>
Subject: Re: [PATCH net-next v4] selftests: net: add tests for PPP
To: Guillaume Nault <gnault@redhat.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Shuah Khan <shuah@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Felix Maurer <fmaurer@redhat.com>, Antonio Quartulli <antonio@openvpn.net>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-457-lists,linux-ppp=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linutronix.de:email]
X-Rspamd-Queue-Id: F16C034481D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 7:28=E2=80=AFPM Guillaume Nault <gnault@redhat.com>=
 wrote:
>
> On Thu, Mar 26, 2026 at 04:26:23PM +0800, Qingfang Deng wrote:
> > Hi Sebastian,
> >
> > On Thu, Mar 26, 2026 at 4:13=E2=80=AFPM Sebastian Andrzej Siewior
> > <bigeasy@linutronix.de> wrote:
> > >
> > > On 2026-03-26 10:16:24 [+0800], Qingfang Deng wrote:
> > > > Add ping and iperf3 tests for ppp_async.c and pppoe.c.
> > >
> > > Oh thank you for doing this.
> > > I haven't look in detail but this cover the "invalid loop" cases that
> > > ppp tries to catch?
> >
> > By "invalid loop", do you mean transmit recursion?
> > https://lore.kernel.org/all/20250715150806.700536-2-bigeasy@linutronix.=
de/
> >
> > AFAIK, this can only happen with PPTP or L2TP, which were not included
> > in this patch.
>
> The problem was originally reproduced using L2TP, indeed. But I guess
> that it could also be reproduced with PPPoE by using a UDP tunnel
> device like VXLAN (like sending a packet through a PPP interface,
> handled by PPPoE, running on top of a VXLAN device, that routes the UDP
> encapsulated packet back to the original PPP interface).

Yeah I've thought of that also. It can technically happen, though
there's no practical use. For self tests purpose, I may just add the
recursion test into PPTP or L2TP tests.

Regards,
Qingfang

