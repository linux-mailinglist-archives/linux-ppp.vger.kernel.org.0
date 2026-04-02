Return-Path: <linux-ppp+bounces-482-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDh5CMRbzmmgnAYAu9opvQ
	(envelope-from <linux-ppp+bounces-482-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 14:06:28 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F7C388CAC
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 14:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EA743001D7E
	for <lists+linux-ppp@lfdr.de>; Thu,  2 Apr 2026 12:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592593C9ECC;
	Thu,  2 Apr 2026 12:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXYUFk+C"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4AC40DFAC
	for <linux-ppp@vger.kernel.org>; Thu,  2 Apr 2026 12:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775131476; cv=pass; b=BME+LZoA4opvWkUOgXUTQf/xJriJRopVQb6VPHw0wmzPx0kMk6prA8nrqkBkd73HYq5ARMyZ1kSzrzta026Sy6n9YGzk0ltNay0kRNMZMCsfwApolAK8roH00GCN2if1L1IlGPTSbQ5/TdIsm0K2TyOmUm0lF3IMFJG9vhlem90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775131476; c=relaxed/simple;
	bh=zKWFrITeul/qgtQWiLbC+mauwtMzdzB7O/5xgYGl/5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gvCwLA6zmru6wTSLfbXo73Lwt266Y9cESHF5lGVApVjqFbFzIGxDHU8odtx72V+gdl3VxkuOG+hI3ZHQsUDALmsFVC6O17w3dw9kbE3kH+X69c5K6jvg8SPb//eUxBPM3pltsUeLU8GWpFK8TmQs0vyNDfESMkUbElWsxfyyYeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXYUFk+C; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79827d28fc4so6799587b3.1
        for <linux-ppp@vger.kernel.org>; Thu, 02 Apr 2026 05:04:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775131474; cv=none;
        d=google.com; s=arc-20240605;
        b=aFwhIQFgYiAtzk2BoM31QZN2wjjd5IBdlsw1fBVCSsPaxvkuw8ySJ7YqmGGbLvYmT9
         kPUf0Nn9ggFqwrEz5bdkenG24FDptY4DKKyhX5HVI1+LPw12U//t92qmxOpqdRsS+IsQ
         ++GK9DadbhA6iUpfcB/Sz3uoFrGnppPEmJr/uTxiv8kDbp+gf36FNeDMThrVfmapK65a
         JH1WaKf7wvIbw/d6NVsffRcrkKab4eNVr+JJ68ozsz0qG+Kk9vS973xECYByRfOpyKY1
         2Kfzd9RVgQkYs3X9YkU58nxuPmR13UK3p5fHQfqoONDQljiFixvPesUKQR/8TiJakR5/
         TmNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zKWFrITeul/qgtQWiLbC+mauwtMzdzB7O/5xgYGl/5U=;
        fh=Vx0awbOosJVRQ6fN1kSkZyaxdlT+r+/8YtP7IYmJlnU=;
        b=TiBO1Iou7Ce98+R4rsu1FzZeqqjXLut3950klnH9HRgQY/mfAIY2lkY6jxLp20mjgX
         hDGeydeLgj2clE/FCkjJHmIdCknmmCgqxm4gL5hzdIaCVexkpEfFnjfTf4YK8YyM16LS
         eCA1FmygY9DmE25ho2GwipoPybZWXg5BT5edBqOfCf8WlruWBjQ/fs55VTtgBtKRLHhF
         OU4hZCfFs0gNEKw4DXUVI8qZYzhyjEpPgoWEpaq5d95uaryA0At0eFzg5x0kVJSqiiSB
         NZ4LCxMc2dP2xuRV8oKoxyYMzQ4oRtXW5QFhRkBxRRKWNohHExtcyyGa2yNzqAgPMT9d
         69mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775131474; x=1775736274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKWFrITeul/qgtQWiLbC+mauwtMzdzB7O/5xgYGl/5U=;
        b=VXYUFk+CoDu8M8EaV3fM67tURl8pgvESG6Ln4kfzswHkFKtmFf2y9WIaLYryLL6rT6
         frQDoznSMtQy/JVUQr4Mterw+FbRoNPv0VaTkcxppimirTEbThZfjME1/DG3KBfnpsY9
         OZvshLk4OLJn589ecHkqFLSFic4YDbapAe8iMLCzhfU1qfR3y9ILZgOEEhoRXgWAmnNJ
         DCywUDKILlkXZZLGZ3Hi6t97Ye1GKZJLTkHY7ijgxcUfJToq9xwFzRsGRuaqfJfakMtq
         VNFEDW0OS9KYfWYQE/o5svSRvxh4z0S7etR2mnQkIM2h15jUtHaFJMwmt8s9MuxAMZof
         Duew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775131474; x=1775736274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zKWFrITeul/qgtQWiLbC+mauwtMzdzB7O/5xgYGl/5U=;
        b=eteF+dq8Fs24Pg2Z3Md3yOr8rRDtyl2PmwSIsF2Sc5n9USkmeA6xmM1PUglEe8bG2y
         W2z5/K71GgeG+8QYeJG+UZed9/57kdc3507wIirGEY0SBk3EBb6yd5EAEcPXDGfEC9kh
         Yhg6bKAwGM2BS6IgCZV6fXexFnUyKC3WJ94ZLJqtLroqdcYX9KLPyef3UEHV69C7r1uD
         8hN9XS6dUZD8kQlsgCaC0bcYpm4QdcN+Qfp2N8WSlhcn07NC9weuvBNDBc3T45eop5ny
         ir16HD1xyZg9B9lJY1CJ5hIJhZykrmuX+zHOsu44IDQW+Mccc+UysYjlhFTbwZQRIhS4
         hcbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDZ5P0crhWmfoNnKrJ/G7e4ne+9XQtqCgpicugAVeZ6ufD4SLMSavIIs66SiWxH01QNL3kog6knVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjWp4+/1fL2/+kVpVNPKL7KrzWAjberb92Ox/yoeyWOzsoVDwF
	oA1DJ74wVEGUGf0KZU0YPxdTQ6732MNdnM+ENGNSy83X72YYmAt119BH+HJpJlE5x0Fbu0ZIkjL
	UroDWLagK8zG6JCMkjOybLRPmrUAT9lg=
X-Gm-Gg: AeBDiet+YKUqOrCErWVSYoaDTvToVmOlI12rX0YodSVkLSDnebCjyAXA20dibmnfKUd
	iMddQV5G/BOb/JL1P1PbQYB4SySqRE9z2Rs3htc24cxscQAxhiwBsBDdkv63uR6VU9RBPEtKAPK
	YqQRnci7gYwBrLLmM9WpzQlc/I2A70oWwHpHeuuRXKPLK7a+EmFqsX0n+brjMOq9ji9pkTxUCCh
	5+bq42WDZswVEHgdcA01QBpLHdXdObERoa1hy3/ySDWFYHTAZupqbbC7FZFYzcf1Ay36BjmBtxM
	O7m5egzVb+OqHoz3AUGCuDIZ9O8SljxM5lQx
X-Received: by 2002:a05:690c:4b0f:b0:799:182:17d1 with SMTP id
 00721157ae682-7a212d172a8mr79902757b3.45.1775131474012; Thu, 02 Apr 2026
 05:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330035604.133073-1-dqfext@gmail.com> <20260401081030.29b050d5@kernel.org>
 <CALW65jahWApDnVmFReW+Y3HDxBEmCwzsT1oyh03SW7X5ry6PzA@mail.gmail.com>
 <20260401175621.549c492e@kernel.org> <CALW65jaTbaosbO8ypKZ6G37HxuxXabeTaP_Fhq72xTovmDj+8g@mail.gmail.com>
 <50ae3c69-2c4e-499f-a46a-cbd207ff5f09@redhat.com> <CALW65ja1FV-OcqSazgKZhQhKf3oqr=kcGxyGkOGbhurGLOJ0-w@mail.gmail.com>
 <cb43761b-d414-4878-bf41-4ef6c988f881@redhat.com>
In-Reply-To: <cb43761b-d414-4878-bf41-4ef6c988f881@redhat.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Thu, 2 Apr 2026 20:04:23 +0800
X-Gm-Features: AQROBzBt3iwuFhkn47HugLmDXoXDBifovZc4o_ihC5WPjxUjy9gSLkKhZ_qqgHg
Message-ID: <CALW65jZszAVHNSYgo9Fav8J-Ph9dXzR34CYr1-Ar776mOy4Lbw@mail.gmail.com>
Subject: Re: [PATCH net-next v7] selftests: net: add tests for PPP
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Dianne Skoll <dianne@skoll.ca>, Shuah Khan <shuah@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Simon Horman <horms@kernel.org>, Felix Maurer <fmaurer@redhat.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>, Jaco Kroon <jaco@uls.co.za>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-482-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ppp];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B3F7C388CAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 7:17=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 4/2/26 12:13 PM, Qingfang Deng wrote:
>
> > What distro do you run CI tests on? On Ubuntu 24.04, "rp-pppoe.so" is
> > a symlink to "pppoe.so" in apt package "ppp". Maybe an additional
> > package is required for the distro you use, or I may work around that
> > by manually creating the symlink.
>
> It's fedora 43 with ppp and pppoe installed.
>
> ppp provides pppoe.so, and AFAICS nothink provides rp-pppoe.so, and the
> pppoe-server is looking for a non existing /etc/ppp/plugins/rp-pppoe.so
> plugin.
>
> Before I mess with the nipa testbed, could you please double check that
>
> ln -n /usr/lib64/pppd/2.5.1/pppoe.so /etc/ppp/plugins/rp-pppoe.so
>
> should solve?

Hard links will also work.
Alternatively, if your rp-pppoe version is 4.0, you can use the new
option `-g` to specify the full path of the pppoe.so plugin.

Regards,
Qingfang

