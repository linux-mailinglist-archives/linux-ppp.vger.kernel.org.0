Return-Path: <linux-ppp+bounces-439-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLdhOMKpw2nAtAQAu9opvQ
	(envelope-from <linux-ppp+bounces-439-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 25 Mar 2026 10:24:18 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B063221F4
	for <lists+linux-ppp@lfdr.de>; Wed, 25 Mar 2026 10:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 01E1D305804B
	for <lists+linux-ppp@lfdr.de>; Wed, 25 Mar 2026 09:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325B034EEF1;
	Wed, 25 Mar 2026 09:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kI6QvE+8"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E034C2D877D
	for <linux-ppp@vger.kernel.org>; Wed, 25 Mar 2026 09:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430633; cv=pass; b=njPIHGaLaF3BLC2A0fbKGavQH+KE3T0T8IhXEe/MpoZH7uLZX3CWhlC2FASipnGE0/3kyRdXh1vGySdCUGsBNaAOENw4Kk8losIkSQJya+Nu2/taioWnP4VeiBa4zjjOZSiS1OZ6UKynAbOil9azkWDwMMEb+zGPhSc2lQ7EJJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430633; c=relaxed/simple;
	bh=DUozAtuV+mXsErOqm9JnWIwOGatNtqQWfbvXsLOZVk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u4fF8d816pQjt2qxwlfR3MwNAO1CflbwHRIjdvQOZwXzt6PG7M/yUrlW6RKhEpey1V8fo64nw++7AE2rB0M9DHnp5w+9//QDgHbgt7ZcbCvS90i2tmYkX91jFSlCnX56xHNifxiUoLS6U6aU1UIVVWnRKMnyYc2lxzEfjR9QHI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kI6QvE+8; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79495b1aaa7so55850457b3.1
        for <linux-ppp@vger.kernel.org>; Wed, 25 Mar 2026 02:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774430631; cv=none;
        d=google.com; s=arc-20240605;
        b=R5caqYpQGCT+0GUcdn1fUbIUuN7+0MOiWpyQv1MCZe44HrJz4nUx5z1NfEyAIpunhR
         ELY0sW1ZHs4473VDVrJO2FI0BHU0bhXg0d312j/4ea+f7Wk8UlXARYNvtQY/GxqomOLH
         rj0TSlFgVXyA5krJ6RNqjUYH9YkvqLWywFy+8o0K3ML5foX4P0bNI2+Yo6xOo9o9jTQG
         /gNNKYy+m0C0LEq4lFP59GnaBZov4D0k/XlmOQW/t9fOH21hBDYAqZmjm5x6m88rVgEY
         ZxmLdSY30Y0LYG5SLfDtUcnqUw2ToUbfYkEJDv8/RkiMzR7zE5OGmfWWMvHyjp1e4L4y
         AFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DUozAtuV+mXsErOqm9JnWIwOGatNtqQWfbvXsLOZVk8=;
        fh=L6Ir7exAlGC7QvueqNDM0V83YvMU4+e7FOB6ZUm9Qlw=;
        b=KtUON+0RbtQiXDner3+I0Wj3KT3TYYIwmgN7GkeRnpri9OadPHE2iayX74mCy3fEpa
         z8gCy6J9aEzNwmp6wjlB4cBQxxTnZhpAQBJi3fY+lrtnB8wgrlJkINfp7cXx32kKumhE
         FetbvmRYI7KHlJ9vSYM3r28f6N6TAnHoERknB2DX4B/2J+zHJlnMeq7pUATSgII8G992
         1vrrAU6ewc5cYrkqz+/lrv+mNmNHlrLV0/AWlGz5Le/x4WYYvaxXSfNmX3VphyXlXq2Y
         OUBIkRs++3ncKCX4gv/eU+f+XHGouk3m5cpd2EiUmZOFaYtg/1PHQhlybIW5+fMdpam2
         pFyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774430631; x=1775035431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUozAtuV+mXsErOqm9JnWIwOGatNtqQWfbvXsLOZVk8=;
        b=kI6QvE+8xWlTaK60LvXxArJskCrToAx8B0fY31L3jPRnxzhENZ8+ZyRyZvo0aUf9is
         smi5iuJ3foKq4NhhGk0le1jGhZvb/g08XebyLG86+nggT+dH/blZqVk3DA1KGf6jP6zg
         KM6DcY0uNAudeVMMB13l8KjMw95SKIEIb+FlaIxG0d9Or4sOGzRQrWdrnXG0TxosNzIb
         pNNEEU5ovZFz5dSKPmWviE0PxhEr4wujvODkpJg59ESinRYhxNdhDGThvOwBjfxin7yj
         /Q9KlR99U0w2lW8OERC4PNK0XqFkW03lrZG+ZvNJMxSpjc7YodU+3oxrvcW5hwf7PkXP
         IYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774430631; x=1775035431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DUozAtuV+mXsErOqm9JnWIwOGatNtqQWfbvXsLOZVk8=;
        b=aF1O1G8OCCFEMHVWvQkhXOlhMkOQCpuqs/Y3UWf8JOYE7A2PcFdUMqBYWJrAk40DHU
         5WMRIuudav8P3VJjkHFPuK5kavo96noWtjqK3q3EsxQWPb+7oQHa0p3s+wrOLbb2115/
         JBigzox9H3+eyBnr9+aGrONAufhdiUCeizraCqe1Wq/l5ib8jNE4+eNfUbvlTm5DkzLn
         tNW3Z2NNizpVi/J55I8cZrieXx0mS+kFO6sY5hT733fgVU77mqnHxCKD0TG5+8UP2uIj
         rSGIpmeOv8XtFmmdigEk2Q11ef7B56a/jWkG2AAEg2MTTGdXQQtFfwwpM4kZeWoHbfPC
         qf8Q==
X-Gm-Message-State: AOJu0Yw98q4FrT7K3hs+X+TsdOMepEqM9hdnzLOlYeftIutpdGMIqJJx
	gg726fgjpHJ78OCY8pZTVCZdDdx4cudNsz/vWlksQ2kf2u3vR3vXpfSlj7hlG3fF0DgVq1Qs90m
	T8laoKXj5N2VKK0NA/635WTIeAoM/Xek=
X-Gm-Gg: ATEYQzyN4HF37FmnkYPd2r/TPsyxqp+C5uztDGYQOi2iA7qNiw1RVue7hZi47SQwFvb
	7Jmw6nKzpwzZvhjoPwOavzKHKFETjik6gsdc3K6OWySA+9nyxQ89xAnz9f9quXZ9+/AvcHDh/u3
	cfAyKwQ7lCPqtItF1NwSBqT0fWBqbVk+p0vNSpXMMkka7QaAyhOLDpXhulSnh3/IfBE1Qw8bJUh
	u65NKp5tTmlszygMS1M+4zCwdREw6Ui5CDZ5QOlWzuUxNEjkNUBvlI7D8EN8aIdIVk2T//daDsC
	eLpdROKj5cAB680n
X-Received: by 2002:a05:690c:7242:b0:798:1637:fee0 with SMTP id
 00721157ae682-79acf696502mr25525427b3.52.1774430630926; Wed, 25 Mar 2026
 02:23:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305013852.3769-1-dqfext@gmail.com> <20260306170411.49912ae1@kernel.org>
 <CALW65jatv71b7G6jpr4g-6j520RjLBDJMH8uta5MPJHmEM1S1g@mail.gmail.com> <20260309140127.465b6ccd@kernel.org>
In-Reply-To: <20260309140127.465b6ccd@kernel.org>
From: Qingfang Deng <dqfext@gmail.com>
Date: Wed, 25 Mar 2026 17:23:39 +0800
X-Gm-Features: AQROBzCVqdFuI71yt6DJNcO_3nIjUZ51UkzySbeq1qT2fwYWI3HzxJF6_wjrlMU
Message-ID: <CALW65jZv53Y4-H3civxZLT5RGypsKjb3JyiA6iy0pw-_RK-=Tw@mail.gmail.com>
Subject: Re: [PATCH net-next v5] net: pppoe: implement GRO/GSO support
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-ppp@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Felix Fietkau <nbd@nbd.name>, Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-439-lists,linux-ppp=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A2B063221F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 5:01=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 9 Mar 2026 18:46:59 +0800 Qingfang Deng wrote:
> > > Please add some selftests.
> >
> > I haven't written a kselftest before. What tests should I include?
> >
> > I think I can add a local ppp server and client over veth, and test
> > the connection with ping and iperf3.
>
> We have tools/testing/selftests/drivers/net/gro.c and associated Python
> test. (note I have ambiguous feelings about adding ppp cases to this
> file vs creating a new test, adding Willem to CC maybe he has some
> guidance)

He hasn't replied. What do you think?

