Return-Path: <linux-ppp+bounces-461-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPTHKUOsxmk4NQUAu9opvQ
	(envelope-from <linux-ppp+bounces-461-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 17:11:47 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2453B347334
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 17:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B3EA3041000
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 16:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F6633B974;
	Fri, 27 Mar 2026 16:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gB8792Dp"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286F330FC12
	for <linux-ppp@vger.kernel.org>; Fri, 27 Mar 2026 16:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627856; cv=pass; b=Stn87ouU4dBk7Gspc6+6i26Gz72FMXe5SMYwMG55HpPMHtFeqwzqezmAYW4rs5C0z68k5kd3UMbghyT4jPEkD4/nYw3JqbW/SF7An5I7jBfKlr2Lwg8Z+2VeFJ4PhdooF3VVF8nqNIk/4N4EX6LPe2ClmsxyQqA2vJDgS9li+SE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627856; c=relaxed/simple;
	bh=4zQLANhpfIdewHJstnB7dl+HZnNDQqJHWx3xVtfG8mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CiqflPVYwC00wU3LwbZis9VUxrzghgfd6lxuOacMgp15pIpBPhLJI4MRxfpC0PxTem5QarwcTY/rDK/rnjShPdPFaNN+7u1QIz5ZdQqq5HJDGXAhjtxhW7nvvyNQWbO9lglTYcXBCVtHHCgy2nyRkzpQb6ZejDwScR27GwZTbx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gB8792Dp; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-823c56765fdso1289850b3a.1
        for <linux-ppp@vger.kernel.org>; Fri, 27 Mar 2026 09:10:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774627854; cv=none;
        d=google.com; s=arc-20240605;
        b=jqY4NoM5UPQKrTg9Dl6WmtB3niL3WVKGQAcFZtPfy9fEtw/aOY9v3a2/Ls9FHcFwzm
         fixKXI5BkmJkAJklwitf4Ac5lPslJlfsft2bKwnHuPmxN98if5UuBiEtPe9iPK4Fdq/Y
         wz1mCZWpUbaems/tUu6+awyQXNm6UkCJ6cbYaNuq0XuqbSJ7UQb3pa2dH6OwSL2ZXnby
         RrVXe+8dTgLjjq4/I0jPGY1ll3N8gJLobXlvWe4C4waU5wOfEMrupXQH5jsqJZvsPFKY
         ISu74hakkueRFtFd1EVYPPjPRk25e6HiB4qe3Gk74pwIhAqVhmuFvO2pTrgTIEWZwBug
         aQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4zQLANhpfIdewHJstnB7dl+HZnNDQqJHWx3xVtfG8mk=;
        fh=1/B4ZkI0Jby+N6OSZtIekpVh2ZyIdXmYmAbT9LKA9r0=;
        b=M2szlgtxpMrSIRZJqc43u5U758iLc+bngyIwGpYcUvNe9DQyTK4TpCmfgJV71Kk918
         w6Snsp+Xagb9QjSCpMtd+X5cXAOClkgFXaJ+7RPOFWjN5wMU4Qndaiat+LB9PZV7Dw+j
         eeVIdCPY1PSZjcT9VEt0voemkXhZ9VFsEAl4+BJQ6GWRpygdteTHw9ziJu37PWoaIat7
         phossjaVfWZeemTNUMjYphWwJZiOaAK/VhjheFsjz0uqDVEog/iqkjcyTG6gwsMaRPpI
         kIeEw5P3MjcnUginwIUi1xficjWu39wh3GoqUJG2s6wrxT5LzYCavX/XBXx2LqC1+AdF
         wkCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774627854; x=1775232654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zQLANhpfIdewHJstnB7dl+HZnNDQqJHWx3xVtfG8mk=;
        b=gB8792DpXd9/pVZjLpT1NdaPfBDwViKcAnMxO58W/AcwIfIO5iU7ewlgpNfl74UqNB
         fsabECvHRjCoZZ/stcYpnb4jmcrO6FevxzykyasJPGJXtb9iaH2litUz87slIXFJUiro
         k8hHM2HG+8PvNncZJT5IDsLTMN3aBtVlkrGW1ZMOJnUWuWg8+DG6cLHcGrYg8btMFnpH
         oueZQugtp2/rE/4iFg5l2CF+8YW1Ll02XEgnXedVW8KLz763b1YxXT50i4lsU1foPNpc
         k5Ax+4FY9arVBkz0WCRuUDIaCa71/XW5LI3YfKGJVqIQmS5KP5Zt/ITf8VQWO8G+r8wC
         SV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627854; x=1775232654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4zQLANhpfIdewHJstnB7dl+HZnNDQqJHWx3xVtfG8mk=;
        b=mtn1CPkyRvz0ZTZ/vg7ox21Aq2Z/QQuYpsF7hj3HOgnKwoSXppBFQ+0ciP5izGEfFd
         lT7Rb9JOd5QsAkNu4vknjcUoVJMlOa/j5KOF62RYu+LRF1uKpAze4ignGLPKOjS1pjH+
         AHX4AArbXCvgNz3hRAY+KoFyHkp9rKKs8IYTU0HMDfTeiOj5TDzeP4v6n8EUxqro2J2W
         9b4zlN5Wh/yR9qfsHHZUxBgKKKaYnEwztDFjTyOr6fJ+wKBmiAYhrqvIHzk+AyKabohE
         MHPFxOsa2+vlLycUICAVx0SPBkVuilHMI/HVzIiYHgk9dRKHuyNFJhGYl1d0HTXS4I4t
         A13g==
X-Forwarded-Encrypted: i=1; AJvYcCVXrNjfoMC7/Q5rYX8a9Al09LUc7ZXgX54moyzmqmH8sHq8WwmQVJ2Idte4OVyxHGqdLuFzzngVaj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzumNPe65lNJGyTOf0FK5VAHC5OVHVrAHjA8ImqZzD05FDmpumJ
	ggkMGruVj7/P+O2Um4su74trFVse/2egTpGyd88N8R7FPLhrXW7owuIk38kByPfCsRe81E8Eg+a
	bbylTPXqj0PCxJUjbjeFcOXDw+N8blro=
X-Gm-Gg: ATEYQzzrIl6eUUEoj4+lMHjJgOc1BKJKVj9rSiN5e1Ev2vhrzYXX2PgtLfgH6QcuP+c
	A4ZUrLtEvPRGFc0Zm6WswsgQTUC1zQeU2q8pc4K2WSf+SgR5P/K5vCmfErfeKEXu6VxqhZM1mm8
	6++A81TAh2B6pfqYrYh9X9PYKp7HapgMb+IKP1os0fom0YRW+jJ8jl3LcP6s+3A8o66WwWnr32I
	mLnvS62Zaf0pTHIgNdU79gfXrId9X4QUgLbKCC2VKPnLV71wT23nNP4JosZPyUfm8GNnmwCdS+B
	TmsiO8CFqEkNNZ9MqGKvihQlOjT67ItOWO6jr10+n9j4weH+EJSv+7hr0PcbZuXzWfl8l+2vewj
	rskhFO5mQeHlORm/P
X-Received: by 2002:a05:6a00:27a0:b0:823:cbb:a484 with SMTP id
 d2e1a72fcca58-82c95d45b1fmr3174313b3a.14.1774627854496; Fri, 27 Mar 2026
 09:10:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305013852.3769-1-dqfext@gmail.com> <CALW65jZRyKydW6bs-mYwh2mEn0dpv3opVEr=WczKn_0952_+Yg@mail.gmail.com>
 <CADvbK_fj_26MLP=+U+rzOMfqdPpdvFQJgN_fozd2uAjRsfHweQ@mail.gmail.com>
 <CADvbK_f3LwEt+-BG-1Pcr4jMn6Jxry+0p-Fu_s0C6Px+F_NHCA@mail.gmail.com>
 <CALW65javKc9H1zQ4m5cb0qPfXix+bWM9LcVZ+uQN5BdgdTQ=gQ@mail.gmail.com>
 <CADvbK_fug3vckLkfufLTtqTEKzywRUw8C_dzfW032_cb6vLpZg@mail.gmail.com> <CALW65jYQt9-EQ0tKkgPRGMdf4Ra2oq4BT4XkCPu0zaRH=rzviQ@mail.gmail.com>
In-Reply-To: <CALW65jYQt9-EQ0tKkgPRGMdf4Ra2oq4BT4XkCPu0zaRH=rzviQ@mail.gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 27 Mar 2026 12:10:43 -0400
X-Gm-Features: AQROBzBsDWp0nhik9IE67j9AWPQ3G2vduNGzWrKgp9vfAx0VgvWYCw4K-B4LHcc
Message-ID: <CADvbK_fu3e_CRAFS=qju1eTyuWymSFq=_qebtNL=d1udhAm7rg@mail.gmail.com>
Subject: Re: [PATCH net-next v5] net: pppoe: implement GRO/GSO support
To: Qingfang Deng <dqfext@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Felix Fietkau <nbd@nbd.name>, linux-ppp@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Richard Gobert <richardbgobert@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-461-lists,linux-ppp=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.932];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lucienxin@gmail.com,linux-ppp@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,nbd.name,vger.kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2453B347334
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 10:43=E2=80=AFAM Qingfang Deng <dqfext@gmail.com> w=
rote:
>
> Hi, Xin Long,
>
> On Fri, Mar 27, 2026 at 9:23=E2=80=AFPM Xin Long <lucien.xin@gmail.com> w=
rote:
> >
> > On Thu, Mar 26, 2026 at 9:49=E2=80=AFPM Qingfang Deng <dqfext@gmail.com=
> wrote:
> > >
> > > In my v6 patch, I set phdr->length to 0xFFFF. Is that okay?
> > >
> > > https://lore.kernel.org/netdev/20260326081127.61229-1-dqfext@gmail.co=
m/
> >
> > I think you need to check how the PPPoE stack handles this value. If
> > it recalculates the actual length using skb->len when phdr->length =3D=
=3D
> > 0xFFFF, then this approach might be fine.
> >
> > Also, how does the PPPoE stack distinguish between 0xFFFF being the
> > actual payload length versus it being used as a marker to indicate a
> > jumbo packet (similar to BIG TCP)?
>
> In the receive function 'pppoe_rcv()': if a skb's actual payload
> length is less than phdr->length, it will be dropped; if greater than
> phdr->length, it will be trimmed to match phdr->length. After that,
> the phdr is popped and the skb is passed to the generic PPP layer.
> There is also a fastpath in Netfilter flowtable for IPv4/IPv6 that
> bypasses pppoe_rcv(): it does not check phdr->length at all, and only
> relies on the length field in the network header.
>
> In the v2 version of this patch, phdr->length is not updated in
> gro_complete(), so an additional check 'skb_is_gso()' is added to the
> function to avoid trimming a GRO skb. Then Richard Gobert suggested
> that the length field needs to be updated, and if the updated field
> matches the actual length, the 'skb_is_gso()' is not necessary, but
> only if the length fits in the u16 field.
I guess you have to look back to pppoe_rcv() for this, and double check
with Richard Gobert.

The phdr->length trick for jumbo packets might also affect how tcpdump
or tshark parses PPPoE packets.

