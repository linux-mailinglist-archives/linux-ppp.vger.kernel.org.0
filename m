Return-Path: <linux-ppp+bounces-453-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJ8KIGTjxWkeCwUAu9opvQ
	(envelope-from <linux-ppp+bounces-453-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 02:54:44 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D980633DFD1
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 02:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5654E3007AD3
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 01:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A911A073F;
	Fri, 27 Mar 2026 01:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMG2Is5W"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805D312F585
	for <linux-ppp@vger.kernel.org>; Fri, 27 Mar 2026 01:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774576146; cv=pass; b=me0QAkSB/Wb+q0cc/S8k85GkYmt510DOIkL7SWyVQqn6uxQ2c5wkIPEf2u+95im6cfoh42knsDbdIDVOaElZAn/ZR9vxd3TAei4m/kbzhrshuj8AxzsbrOu6EfbmcN4+p4j0Rp7byzuPAFNavUmmn7AGImzZ5ZhBn3YDFtOAJxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774576146; c=relaxed/simple;
	bh=5yR2LiYw2cW2pMfYnUY2YLw2WetpDSJfe3rA8gRX4B8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ClVRnOFiGAUvZVPyWF8xRhq0eGVIE2ob091Wr7nEfHnT6DyFLD1dLz4owcvmAT9OL8Da9q9wJQA3S++F17MTWUddZTcoK/N/U2rih/eoO9XiZ71Ne+mjhNlnT39CBSV2W+2BdQ48Bd6tqNcYarRdRAQhqVGgG0YWExD/r8IHsco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMG2Is5W; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79a46260385so17683167b3.3
        for <linux-ppp@vger.kernel.org>; Thu, 26 Mar 2026 18:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774576144; cv=none;
        d=google.com; s=arc-20240605;
        b=R/64b2QutMVqXxpwoEiRnDWi4jKKqpLMm91pamobEMx4D/Dw6SVDr+w5qWmfOqBpCD
         nYpV/S1dzQVx/iHsJraHBGZa9zAcZGYy5feYgYx12RsbleRh7pBlxFrLWVi0qs6BSRm1
         LCrMskjVE56fyRq2KLqbbD62MbtkJhwIbRK8UXfzjuCEfa9rZ6kpIAphI5PkyXvRm1qk
         gdzHt+SFEqu4rtcH+mwUIx3dXJ+CbaPF+BjFu3Tn6QTd4Yoj42FqgSEkZuIbcFiu/4wL
         3EsZltat4FwYwu9HpjF6KxzVfuA9m/W7P4jklJ1H6mqrM4i5S3Y843f0743Z9v/bjwr6
         Voqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5yR2LiYw2cW2pMfYnUY2YLw2WetpDSJfe3rA8gRX4B8=;
        fh=zoOtyoLhKzU4/73f5HhNmFl2Y0Lbi+DSU+Vq58vgPu4=;
        b=XUiGRW0PQDwmCR/XsSCyVFQQQ18gAGZLmkR6UcuuTVAJXwRdT2+RN3LXrEiKkOO6mq
         TEitW2yRAEEpB+0DdcYOfaQbjkVJ6XrfdYKWfTvqj6UiJNEKE0s8dMHk+KXgI8WMBkIS
         HuIhV+TYyE8Ja/PkzCnIp4H67KbfeJBiXzxCnZiDFvcj4ljxxcIfPTkfYrUK0LUbyKZG
         Qz3k5mFtEjt9T6BBjO5Kpq1EWzTOP1HDvjIVOPKkhOUZbitfzfnRzONSacyTczTjA3T+
         Tk8C0bC+PBthM4xYPRyT9wVCWepFGpUvmwkC0yZhwb9+zJtPwqyHPHgIjKjOl5ZJyOse
         Fa2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774576144; x=1775180944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5yR2LiYw2cW2pMfYnUY2YLw2WetpDSJfe3rA8gRX4B8=;
        b=hMG2Is5WcFZxtEbjifeRdSM1q6Fvn26oHTG61qTvcjRNsTyR+WYmvnUBfszvULXVLD
         BT2vOMHcDfZeQju0tfK++wS5USATmuWDaWG49HpElXQWVBRCUqC9IGjWaruqm3JfaUmz
         /iIX5oeKzw2qw9AZciRvJaej521g9DYT9H16rlgmEhHEgUbxBp2bD20yKtobSlrNVYZM
         t5mMiOTbY6DABvliVbn6qE+AmRj2nSH8yHkqaxjZNWRgtBfE570yjfI636+cTcnvkSsw
         T3NVjcvQtZKJM1A0XbRMdFiJIXsNo3Ya7xO+pHQFOmoYCLsK6Db3ZBWMghJILc34A/Ca
         X7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774576144; x=1775180944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5yR2LiYw2cW2pMfYnUY2YLw2WetpDSJfe3rA8gRX4B8=;
        b=Rfeki7dp8s4+4Xa6pPH7ZmGs+S9PR04fgf52qy5u+kbDT6eHs7KfGg1z08f2Q5YQoE
         4D7GrpCowNFjJpqCUtUriClf5g5vX6DAmNGNA9WOSGjvfe67rufu/ZH2q+3Dfnhr/Mzr
         3suWLWviTbLOKOUu/kfn3fH4UMvdewqyts7w2aAMY3DsK/7I/al1SB9NSC+dClDfwap2
         F1ofzGDsgnNnSpH75qhQ1xKBR470+cMofMfJAffqFcvBwm8Ah13/8e7wUDdI49ebMzJ3
         fbg9ODPcR6E8R0ERnhHyoLwXp+aOSuWKyWZ+NmdI04Kqj/SrembVmMYjpwcUZae9QIDX
         W4nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNDEvVpO+PgxnUrBDHHB2YruHzzuxnhyQNz0rBPatlVOZCAhBePr2xSWh3Z//J8H7hZJg1nxkf9GI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTuFCiE9sxH0ZKjl09yWdtmcmVOPL2pjsx989afRA6Kf6vjqkU
	5VRYuICyclS4NzepuECFEhaN8ZSHGZS+e9rhcxzxDhuuIl5Q6xWNxSyG7W40/+na3YMNJDhUvl7
	7gDA5u8x3enEmwvot3+Rf/QgFLZqmraE=
X-Gm-Gg: ATEYQzwKxBaeUlxsm+KEk4fQ6ZaNuBogvo/rmab2DYRNsAjxzwz1ejuwTyNDGq7cvv6
	xI6T/PTgDSEdqLTALf0smZBlJN4gbnM8UXG/NAM86NYuCnonX0tXYhtYuZrVr5xDAk9rHue7wKs
	F8tiV8AZEOw7cQ4H2AMXxJM1AYmsuRWyh8iIVZdP/7abrf8XqPIL2gfBkbLmETA/jY68jSAFpIL
	v9h2Uqei7VEM3EgkxSIxJJuACed8Su2m07hyFBkylC5nSBMvKRy71KhJ8ld1ZFdn7ttuU9heglS
	4NAfI17NycOGoR/jt6bjER0NFHM=
X-Received: by 2002:a05:690c:600f:b0:79b:deb2:f5ed with SMTP id
 00721157ae682-79bdeb2ffdcmr4128527b3.23.1774576144482; Thu, 26 Mar 2026
 18:49:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305013852.3769-1-dqfext@gmail.com> <CALW65jZRyKydW6bs-mYwh2mEn0dpv3opVEr=WczKn_0952_+Yg@mail.gmail.com>
 <CADvbK_fj_26MLP=+U+rzOMfqdPpdvFQJgN_fozd2uAjRsfHweQ@mail.gmail.com> <CADvbK_f3LwEt+-BG-1Pcr4jMn6Jxry+0p-Fu_s0C6Px+F_NHCA@mail.gmail.com>
In-Reply-To: <CADvbK_f3LwEt+-BG-1Pcr4jMn6Jxry+0p-Fu_s0C6Px+F_NHCA@mail.gmail.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Fri, 27 Mar 2026 09:48:53 +0800
X-Gm-Features: AQROBzCQfDHh_EmbwR6jDFT6sXXahubBUzk-qQWsQ0Bkg-lt35ZOjSZ4Ou0pZxo
Message-ID: <CALW65javKc9H1zQ4m5cb0qPfXix+bWM9LcVZ+uQN5BdgdTQ=gQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5] net: pppoe: implement GRO/GSO support
To: Xin Long <lucien.xin@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-453-lists,linux-ppp=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.711];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,nbd.name,vger.kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D980633DFD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Thu, Mar 26, 2026 at 10:44=E2=80=AFPM Xin Long <lucien.xin@gmail.com> wr=
ote:
>
> On Thu, Mar 26, 2026 at 10:43=E2=80=AFAM Xin Long <lucien.xin@gmail.com> =
wrote:
> >
> > On Wed, Mar 25, 2026 at 10:43=E2=80=AFPM Qingfang Deng <dqfext@gmail.co=
m> wrote:
> > >
> > > Hi all,
> > >
> > > In some cases (such as BIG TCP) a GRO skb length can overflow a u16,
> > > then what should I do with the u16 length field here?
> >
> > I think you can either add a check in pppoe_gro_complete() to ensure
> sorry, I meant add a check in pppoe_gro_receive().
> > the aggregated size does not exceed U16_MAX, avoiding BIG TCP
> > behavior; Or, set phdr->length to 0 and rely on skb->len to determine
> > the actual length, as done in BIG TCP itself.

In my v6 patch, I set phdr->length to 0xFFFF. Is that okay?

https://lore.kernel.org/netdev/20260326081127.61229-1-dqfext@gmail.com/

