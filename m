Return-Path: <linux-ppp+bounces-401-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOnxDkQ+pWm36gUAu9opvQ
	(envelope-from <linux-ppp+bounces-401-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Mon, 02 Mar 2026 08:37:40 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E221D405B
	for <lists+linux-ppp@lfdr.de>; Mon, 02 Mar 2026 08:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8233E3030B1B
	for <lists+linux-ppp@lfdr.de>; Mon,  2 Mar 2026 07:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F719383C86;
	Mon,  2 Mar 2026 07:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0B/ugf0"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A540C385505
	for <linux-ppp@vger.kernel.org>; Mon,  2 Mar 2026 07:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772436874; cv=pass; b=P/zuWfBFhnH6jvqPdhjQWiWECV5xSVuLpLvlzk+ME24hZ9pbNUy63OHM1Pfr2zO9i6KBuPTT7x7zlpvXIcjoBrzKJXRxYBaWPQ5jNrLcTF/TSZdRbpmzf7nDQoPVvmVaLwZYvDpa2xdX7Kap9wRnh5H7kvBMvyWWdAr6ci14j58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772436874; c=relaxed/simple;
	bh=F8us0mYDe9VzqkuQSV6DKqQJfQZIy9UQUe8TBZBNxvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P03kLHcgrSq13Vsome4cVyitu6vaNbgTuNiB1tuXBpV7f91732IU4wZFZnYZtJ3TuU/PX9MIP4MjTUwXfOWDcxdzYhfL9aIjt/ZndLUB+bbUjjUnd4nX7oSlykcYlqs3dZ45dq6fBBOAOGElmbJRblGAtJnDvA5Wr9dkw6pebhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0B/ugf0; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7985ce90542so39354287b3.0
        for <linux-ppp@vger.kernel.org>; Sun, 01 Mar 2026 23:34:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772436870; cv=none;
        d=google.com; s=arc-20240605;
        b=JNJq+uPxNz/fW3u+2oELqOto5YTU6dYwYoPv5LINWRGXo6KEWtb/iZN6i/Gk4jF7gj
         km0vhZQxbvEbywDp/LozvfgM5QvVLXdkOKCcBTDXwazzb3DdppC/oVtG72FwAOEQigM2
         kErL/dYMJTIaLj48VKDdHptbRFHESiktqJmoYu/7fCJduW48kfRn5nlwc6D7OLgRJpJP
         CvURugPEfSo7gPueZtYx/EId/esch/Dw+8h1I74S04r2cuZtTcJ9ar2LZIPTOtVCjEmb
         v9pHex+s1mMLMZFxTGW0VQoKzivAD5JcmOUopnw2YfeCPg2X4JFmCLfD+jut7LhZarl9
         iyCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cYt48Jm/b28J/QibUPBjfmfCYTHIExaVQFXEe6zv+NE=;
        fh=qzQv9VKZovv84+QnMKZxJc+oxIbcLpqjqXRREVSrVSI=;
        b=knPdj8UsvBIlsfXKLwC+8CqRfKr4aPUuXOskG3H8QoJ/6GPQY3PP4brkULdiN2i5Z5
         1/Ztx+67xe3la4sml+Mg3tm+LGBh95fsib0rjDaE2A2DhP3CGx4d2JSk7n/NPX9n5g0Y
         spURAXGJw2q+Ixx3HkzgurHBF3lx5/kSjY35mS72qqaeWdcxi/WQEWvX5lJevm2l7cRZ
         KkKn1B9AL83vJCfunEYV1v4nHICLZWgFG3dcrJE6VWqU8qgOx02vfgx3nCTxUNypPk5K
         myw19gX+v4rJaIrIVIEBI9ksaZMn/dZHIEuMez+tnuKFoXsUL7xwqTISD03iB+y2K1qS
         Bm8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772436870; x=1773041670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYt48Jm/b28J/QibUPBjfmfCYTHIExaVQFXEe6zv+NE=;
        b=l0B/ugf0d5abhhOCC7WiGq0ThYiHO88puiDoNcIunmOTbqNIv+lniwblEQoBNalJNo
         EjuFVaeyALHhgvqjIHsQSao89C5/TX3B1+mvnETSulpzzASkdrwCco6EPBWi1TO0yaPI
         E6hW1LpRVRcva5V9iibPaUs6r7z1niXgaEpA+crSJO9IBQNU1pNkMFK6ZzhCvFP1IKeq
         kFCArIp0Mvmviq87Upc7YnsStHH/wh8vX583GG/hIosOf4R1RwNdxz/OrkpZ4gD5mNxd
         QjI3+ur+RiB8DBAajdPj2nxqFV1GbTZXDTsS2HSLEvT+8tnWZMdqNI5xGnLCLGR3IIWL
         SIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772436870; x=1773041670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cYt48Jm/b28J/QibUPBjfmfCYTHIExaVQFXEe6zv+NE=;
        b=DwevmTY4pp63TARk8zFooxcMNqddBiDdIcuvPS898P5jsaT0Ut+S7sFryzPfINzPbN
         XhdQ8g2TeeSQ4cYw70k0JwcDLK5GdY+iFGbVQmGITRptzxByCD4gKrkUWEmBuIiwvEEC
         0TkowNgPzj4neYLBX0ODNFNbK+NkKJ++hqDrNAMTKTAc2JY6+ftKs45DIn1ROZIEYtf6
         sKFtE/3mN+vChlw8NBnzBuMDTLc/U8MdmLYx+p86JOH8s7qF4JTnRKRhn/zG18rFaiwy
         8KEueX9ne3TKoPGAstwXYPwyil60sufLjeROda2YU5kF9GlpIeAq/5BvZ+VGi1PQureE
         orSA==
X-Gm-Message-State: AOJu0YxgAo1pThsfz2dSOzAG4fMoPVj8HjCuG3jBoIQIc8OB5PQIQY//
	Va/Hiwb0Twpu46cn1+G/oEkKyOC1VFW8eVqp+mL42lBlxRTnVp/Cf4j6RBaxfOf5K1Leg8xiCDN
	zO7wWEwa2TT2ehcw4Nz8pzsJghEPOLvNfTeCbehYYWkgB
X-Gm-Gg: ATEYQzz5Pk56dB0KzSmtP9jjI9hH1Uei4KH6oX/04FRNZxrtoDvKG56C4T5/cSs7hoH
	43YNVy4Hpc0P88ufeUZdYC9uW1C9ozg1BM3+uGZYPzi5q/mjwlYyeYq3Tt3ifxjzvrOo9y2Gkyd
	mGwCfSPZlRl5S7FGdlG1arwfLZF5UwAwVlebJPe4bPiLiJrjSH+xuudoZJpbcf3mveJPEOmxWHV
	PD6cW6s5MykdUVlc9wvxM1Ad6Eqpw6dhPGNWld3Zilb/rnn9T5jHFHXs4AEZsZl+SvhwuWHakuT
	4Ihs79oNbLskmRoG
X-Received: by 2002:a05:690c:2612:b0:798:80e9:c291 with SMTP id
 00721157ae682-7988546fe77mr92953177b3.12.1772436870563; Sun, 01 Mar 2026
 23:34:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260228032317.146855-1-dqfext@gmail.com>
In-Reply-To: <20260228032317.146855-1-dqfext@gmail.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Mon, 2 Mar 2026 15:34:18 +0800
X-Gm-Features: AaiRm536FaUiui3FQJpBvApexR5qVl9Il56KFaQhAG5NQygfho07H9harzKka40
Message-ID: <CALW65jbAGUxsyNw229uHks92T3Vr1iuFs=hVeTB3N9awAuZVXg@mail.gmail.com>
Subject: Re: [PATCH net-next v4] net: pppoe: implement GRO/GSO support
To: linux-ppp@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>
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
	TAGGED_FROM(0.00)[bounces-401-lists,linux-ppp=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 92E221D405B
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 11:23=E2=80=AFAM Qingfang Deng <dqfext@gmail.com> w=
rote:
> +       /* ignore packets with padding or invalid length */
> +       if (skb_gro_len(skb) !=3D be16_to_cpu(phdr->length) + hlen)

Both Claude (Netdev AI Review) and Gemini said `hlen` should be
replaced with `sizeof(*phdr)`. Is that correct?

