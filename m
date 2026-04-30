Return-Path: <linux-ppp+bounces-556-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pUWZIpV682nH4QEAu9opvQ
	(envelope-from <linux-ppp+bounces-556-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 17:51:49 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7A14A525D
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 17:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79FCD300C92C
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 15:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97CF44CAD7;
	Thu, 30 Apr 2026 15:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+Lv33Va"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AF244BC9F
	for <linux-ppp@vger.kernel.org>; Thu, 30 Apr 2026 15:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564090; cv=pass; b=Brsm2qH7xjZ0ufJhCUHtjxeW97C/E2s2ltiMU+4/yjIZeKd9u9q77CK5H8aceLaQcqU3d/UbI38IMnyNUMAsBp4GUZ65AiRhYIxGz0cjXB7XnGSRb9OmBnXHzZFpT9WqBKwIfKKzRhUN2snXmLb/+e5qkEZZgsJGKN5b56rpF+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564090; c=relaxed/simple;
	bh=NHff015SBWIIZDAU//3Z+xZwXxY9PSwzlnhITW5PnP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVYLMXJxCjudC93t3Di8ZQ0+lj9b19S8wZUKkafFIw2p/HOEupqEVaat6gz6VEL0TMyMVrUJYSLJALJmV5pws+ZU9BZvKqXhkrprqnKVekk+a6HcgwNK4rmSJYz1JG3IMs2ad++17PxaYvbR0b0ZCJVwilGWSTVtorT9O3gOJUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+Lv33Va; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7bd5c582c47so5011337b3.2
        for <linux-ppp@vger.kernel.org>; Thu, 30 Apr 2026 08:48:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777564088; cv=none;
        d=google.com; s=arc-20240605;
        b=Ey6eTPOPeGQktudN/8vtP7W+xgVNPNOe8EE82dNNOGKnHGbQ3lVPkrRUXIe0D6DmIp
         q6dcxJQGW8TL/ZuoYn71hHt6eIhBhvexvtSU/oIxY9hFxODk/f6USfGK/lRdUM7sTxZE
         MDSL3kgAWQLrLBzoN7DyzY1vtjJfLtvJDdbxIaXZuDZe7lu4gkElnGECgw14Idpezi80
         qMNo1gqoR7X0qU9RkAkcQSiNGR4DRVgO6itO0q/pfjIxyaoAEx8PT29AgUtmsmjsMdz4
         tfAas+dglR5qOITBGKmcEQ20lbWYLkAsNa/97tFI+Fq4XNIk4xDYoAiiZOCmTVDi+1N/
         NgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kmrba/VIZGvmAtnPma5JUyYaORZG2GeWjvJefcuxw6o=;
        fh=AoVYLR93Kg8xwBfHjIGAhFhlxcxXAbs865zoSl+jWUI=;
        b=IqXuZiyULyKLBLJF+JECsom43EjiKbXQ0ZltQgku/FSpZv+6IwsiU2FC8+sCy2E38M
         Fk8s8PN2ylXh7PwrYCaUkwBakGOaIJ8kj0Cx2dQlwiBcTp8AFyi0NVspifB//r5JGUIH
         IFhPj51kJvrHKOFKUgB6fgmr9DE3lvPfW0EuNyBhGdRVqBtdIV4RCdwbdZYOYvaJFLbF
         b6NnTE08VpzBjXDfIWdUspEkFvSSej+EkZnlMIhO9BPAFwZMgYH6i/PyZO04wucogtmg
         7wSpRAiMSCY5HD75QVN0HBkaFt0OVr8bkL2pN99A/ZcWRlrOvIl/p47rI0D5+EacOB95
         e5RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777564088; x=1778168888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kmrba/VIZGvmAtnPma5JUyYaORZG2GeWjvJefcuxw6o=;
        b=c+Lv33VaItaTVju8kazA/iSdt6kRPgb8QHIj4+XkKnEs+qPkp2jMoWCfIVzoFlPQKU
         FKn05ZdLRugJYJXYjvIA4tYR9LdKtOWbO+/iOxoJmMybS3iWAr6KDOYn0TuOqas/tTKM
         8ABbXCEIjHVoeiwQPke7LPc7+/CjbNWcx4ilmqV2anNBIaMZTU0LFBdpX3LL8PO9h6PE
         TRNpKBcdkwxTqtkJtKGU/R4a9fteTI3gj7OSWA+HpJFhFjm+aeYxB0zpkRVOGNtC1cyv
         dsNlN5DOwFatKlSq3mgLcZfcYGFnCzMPpDeVjgvekNFT0+kRRNnySPzTwTfTe7O5URD6
         +bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564088; x=1778168888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kmrba/VIZGvmAtnPma5JUyYaORZG2GeWjvJefcuxw6o=;
        b=hJZUoym+ZnQP5sXiWEOGiCFUTZnCggm56s0gxHhYtSWvttq8m6qEq46ZuFzscq7yHR
         os3orLMRk/xVFAOzTwk/o/QTx0c1hSdr+OKqNntyOI/6skwRW0kROgjb0OmpQRahBDFj
         gnqG8fvKKh/S72CLtXzqL4vExxMf+1/RieEfyGET2lpu32JPCuIaiTRNfXw2QcCUzE4L
         TOiKrNO4D5vXQJyN+CgwqDfEb9f0xlLqVyF3ToB+epFXy8shi57ESqgfyXVW1vccAqJX
         IA9pdiWNKgQUknC4bGsNeRlQMDWlcujGebMjVEwFa1IPRY61m+8ZnDnt4AKHVw5WoCi+
         uCwg==
X-Forwarded-Encrypted: i=1; AFNElJ/h+pxkzfh+g+rh5Fhab0Sc5aG1Af3c4FfcGGwJswnDU+nmUco/u0DmMlGCdIriza7gdj/ELFViyTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJMv/jkABD5VHd/4Z5nfo5a54qaljDYR+lMNLaWUtB4bsdzBqh
	u5S4KWKTcGJOi0/1iOa3QZhvykZ5X6nWio7FIPuATeEXBrlt6v2tSuD5/P/nOhnGqNilSwkQ/X1
	xtz2vmjlfKthLLNJQMIkoeDVEbLtRAkU=
X-Gm-Gg: AeBDies7YebMuYEGsnxSEpZf5Lcqyzdr61dNqTNkZxjeHgzBXn2dNrPehRbaWi5icx0
	LyIqYQ8zkgGKEJGGQLi7unnM7Mifv8gsK2iZmR8O3MOp2vUP0CwMbPRGPbR98dvHt1Piu+1ZcOA
	rpXW7coNzhhMTGQqG6WmgAJGRfoyQOihnokRHr75UmiNrfDZ74+dDh5p3LmgoK9ZzB7izaQcOPm
	RcfA+VqnnnEIxYHMB0iCxBH5aeRXQgEQYh1441Nm3evJpkcRWCNSKDowKt6tJd0rg84VZd8+T8k
	qF6pzPW7lUQk0uaLc5T/xjH0GJkIodsms97+JNcpW0mUIK0=
X-Received: by 2002:a05:690c:8:b0:79a:60f6:c5ed with SMTP id
 00721157ae682-7bd52809836mr36661477b3.6.1777564088379; Thu, 30 Apr 2026
 08:48:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326081127.61229-1-dqfext@gmail.com> <9d7f1bbc-155d-4c18-bcf7-732ebe4cbf67@redhat.com>
In-Reply-To: <9d7f1bbc-155d-4c18-bcf7-732ebe4cbf67@redhat.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Thu, 30 Apr 2026 23:47:57 +0800
X-Gm-Features: AVHnY4KZEw6sEvZhRyNLFyexDtbd8Y82AgKjLjZiaVqz8Hfs_giwU2yWejKheeg
Message-ID: <CALW65jYB1jWS5LnSxRCrEeCpPfhA8saqbYYfU-LkPh_25gWfsw@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 1/2] net: pppoe: implement GRO/GSO support
To: Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, David Ahern <dsahern@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-ppp@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6D7A14A525D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-556-lists,linux-ppp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Thu, Apr 30, 2026 at 5:34=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> AFAICS, when the computed len is >=3D 64K, and the above min() will
> truncate it, later pppoe_rcv() will drop the packet.

pppoe_rcv() does _not_ drop such packets.
The drop condition is "skb->len < ntohs(ph->length)", not the other way aro=
und.

> > +     skb =3D segs;
> > +     do {
> > +             phdr =3D (struct pppoe_hdr *)(skb_mac_header(skb) + nhoff=
);
> > +             len =3D skb->len - (nhoff + sizeof(*phdr));
> > +             phdr->length =3D cpu_to_be16(len);
> > +             skb->network_header =3D (u8 *)phdr - skb->head;
>
> I understand is quite late for the following question, but...
> The network headers points to the pppoe hdr. Should it point to the
> actual IP hdr?
>
> Why not? A comment in the code or in the commit message would be
> appreciated.

I'm not sure about the GSO stuff. This code is carried over from
Felix's v3 patch unmodified and I haven't noticed any issues. Maybe he
has the answer.

FYI, Pablo Neira Ayuso is adding the "inline PPPoE GSO" to Netfilter
flowtable: https://lore.kernel.org/netfilter-devel/20260430055836.223494-2-=
pablo@netfilter.org/
to work around missing GSO support in PPPoE driver, prior to this
patch.

