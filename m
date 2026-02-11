Return-Path: <linux-ppp+bounces-391-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGYaCa1FjGlxkQAAu9opvQ
	(envelope-from <linux-ppp+bounces-391-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Feb 2026 10:02:37 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA14C122815
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Feb 2026 10:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B2393067595
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Feb 2026 09:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA2F3375A7;
	Wed, 11 Feb 2026 09:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBpWPvoL"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370213033CC
	for <linux-ppp@vger.kernel.org>; Wed, 11 Feb 2026 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770800428; cv=pass; b=Y3Ev6aTIbriKYFcZV/wMZJAlFQgMU8Eo4vWtyIvY/QjDymVEur8wn1ijqlb1ik4jICX6KrxKe4+cgU/BHH/RXKSLws162uRjH2nW8hnFpC2UnMDDwxYfJ3VVJQETXsZNdf/SBlNM3CY+/Y7SoARL2ebQFMWAz8IA4bqmtwWYayQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770800428; c=relaxed/simple;
	bh=lLa2/wlxLoEQfBV5d6w4ekHKrq1vIwSZn9GGDMyDWlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=brjNA4JIUq2rDUGHyWorysOvn1jBnOdYxypJsDsSlor8JQHOBQKO0q2S9HyLDv41dScxUtRQcRalRbxGnwM9Qx6R8bCH/uwJcywIovhfWOBBvY3i1PC4+GInTPDdsBJzFJH92ntBKFfhk6+diEEe3XsO7cP8tW9aq4PSpcjq75o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBpWPvoL; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79088484065so17746947b3.1
        for <linux-ppp@vger.kernel.org>; Wed, 11 Feb 2026 01:00:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770800426; cv=none;
        d=google.com; s=arc-20240605;
        b=MS8pRtYC8RRgH/AAXJ/n8eUB6+j9fC58k0mJp9ZzsMHt9CwZnMg4aw7oDSP8tRfun/
         rvI8de7lIxAFxm23lCrZ2c42nOnJWZs7dHOK/svYYLfsMxc9tNIczCpG/jLwwfbb+M95
         kWL0xLjozew6kV5CWXe0XdkfFhC5MLQfOwMw0VKD9RIRaggFy19VUNEGYZNWaZlGwe1z
         YmAHqWtbulkrp6c493kZsz/i7Vy+9t0kMIf1LtQRexq75jFJba/x29V9WIpq4uY7fXly
         Ilka0D02cC732i1JcODRDRd/C3Tw9MnIsdSgfneX9z6mdCnS3vrWfq54rbrWTmxRF/Yj
         aK0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5eBY6DLPg6MqjWFqTvLCRNYv08BwjqlfFLmiBYGbecI=;
        fh=BHdjyymCOWNl37NNWVf/jpJri1W11p3dBdqG3U9SaAQ=;
        b=MvhsVbmX2i3vGSTSZ5uYG/uQ0CB6+iqnA9TZseJ9sVJXHEGx0Xe/QiPc9UfErS7OSW
         nX8nda9x6tZRopndFRcgyCS3c0lj2IS3WPl3CJPVq9xs3gi78iYQWzBKSbvaT/7/QSOa
         Ud/olnkuKqs3CJ/C8nyp0pts3VzwGR7bBev48pUPaa5kWaOudBSPbvN2cBpbSqQf+f8l
         Y67TPdIIQxFJhyT+kmoH/t7Bd0FQNoCopUFOw4g2S4BPEYWm0v4JjVo+m2GlN17OC7Wh
         hsCrTlWtryAgNSBFTCqzidn/Qeu57I9WnzZUeeS+rKuvwHraUqBC4f0CVTJ5PmHJooW9
         mTaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770800426; x=1771405226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eBY6DLPg6MqjWFqTvLCRNYv08BwjqlfFLmiBYGbecI=;
        b=CBpWPvoL3GRLxDDW8sYA+n2vNEgKRq6kQGnTXkTIIeYqTTqeR6iTB0nTok/k6IBIW3
         2oot0xx5XRreYcMyzW9ZchHRinBfFz7FO+3RMQI/3yPMDik3ZRAYWb5Adk+g0f6Y0MRX
         dszgtZUIMTpCZ9mDVg4pXeKomNKetT2XClpZPlbEih/AH88rtZoyShDIqf2YRguoUJhx
         vipS6IAzZLy8lsd9USEYudCioXkUAxBcRD9HfBhsOhSh1mo9DSNz2CYa/kKw22+hD3ym
         UqKPwB/AS3At/dmaHLCyIcwVuVu6MnIN8oKMYCtVRH3fFPSxTctpnYgOXZYhEI0K7dMR
         A/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770800426; x=1771405226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5eBY6DLPg6MqjWFqTvLCRNYv08BwjqlfFLmiBYGbecI=;
        b=wz++9uMTHckZV9mWnVWr2EvW2ZEoTixGqP0ODeUhCTK4v4slCb4nzpebp8J0yp9keG
         xNfjGv/vqoNfGdOcfsKbSxqOnGszyJ0Mvd/CtRXjvg4OJctgWbRD1L/QH2rm8wwYPaWH
         qmMrNeDsxgvOdebFdyjOby5AxteQbW388FmQv2XJ+bZJ15tt7B6Xi34iedG5U1ReXU21
         E2k5MPgqQl8wyYeAD1Th7iwAB9CGZoKscV/rzsi6nxkL34udXrqDmzADD0Z6F7xNLBwO
         8yJ4z5JgkxB2mf0CoW/mzU875N52IG7i3rDPbTMsUUArVSsYAGc2m1NqAxnFnBytllwv
         t6Bw==
X-Gm-Message-State: AOJu0YwAhS3IAtQemIToKwv976syk+cHOxIWHTlvF4m0WhivXT6JVmF6
	ivHmMNd+YkhznFtEKVqAxGKxY/zYJxdEYq1YMTb8wJAH/q/OfrNqOTP/wZA0CrV6QNzesECS3mW
	kMwfK7Qg0btiQMbRZ7jelWB9OFdHKNfs=
X-Gm-Gg: AZuq6aI7RYdFglU5sJE8ZwrnLRyRw2VNY+ZY8PXx7yCIAfAYqdj1b83y3EL2LwRnsN8
	JwLbzVqw9IS/F7+pwE1RnD2GGHLdsePyk0+dp+mr5NnBWf8Loi6j2bGTh5W6IWxA2oZL6/iG8nE
	mE4shFcSPmW571xD9yTQwvwCoFz9atLjOdGOyMoMvARDeN6coqAjBYIBCTqSq6NxMPJ7rjIPzUN
	RUK9+Cu1tusq3SzFY8rJ2G1cCNaCcTxHXApM5lPA0lUYlXKSZ6jiV+CNjMUZpWjMuIW/z5BBFKu
	nACMK8aUO5xbPxavh+snhAB8YyrYihfJhBlv
X-Received: by 2002:a05:690c:6605:b0:794:ecaf:c4b1 with SMTP id
 00721157ae682-7952aa925f8mr358513567b3.25.1770800426067; Wed, 11 Feb 2026
 01:00:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211075547.138904-1-dqfext@gmail.com> <67c6125f-99e9-4a58-ba18-8a2a93e29b54@app.fastmail.com>
In-Reply-To: <67c6125f-99e9-4a58-ba18-8a2a93e29b54@app.fastmail.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Wed, 11 Feb 2026 17:00:12 +0800
X-Gm-Features: AZwV_QggEoOmwIp1Hxw3pZYR1SDyWYgIv4kI9eixG9p8dPjtLneWmXqO7XNx6Fw
Message-ID: <CALW65ja3sumAh3uzD3W=n=3Rk0J7EDtcpbvdaG6+F2y2dFUp2Q@mail.gmail.com>
Subject: Re: [PATCH RFC net-next] pppoe: remove unused kernel-mode relay support
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-ppp@vger.kernel.org, rp-pppoe@lists.skoll.ca, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	James Chapman <jchapman@katalix.com>, Simon Horman <horms@kernel.org>, Netdev <netdev@vger.kernel.org>, 
	linux-kernel@vger.kernel.org, Michal Ostrowski <mostrows@gmail.com>, 
	Dianne Skoll <dianne@skoll.ca>, Paul Mackerras <paulus@ozlabs.org>, Jaco Kroon <jaco@uls.co.za>, 
	James Carlson <carlsonj@workingcode.com>, Guillaume Nault <gnault@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-391-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RSPAMD_URIBL_FAIL(0.00)[arndb.de:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.skoll.ca,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,katalix.com,gmail.com,skoll.ca,ozlabs.org,uls.co.za,workingcode.com];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[arnd.arndb.de:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,arndb.de:email]
X-Rspamd-Queue-Id: BA14C122815
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 4:41=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> This will lose all compat ioctl support, not just the emulation for
> PPPOEIOCSFWD.

So I should only remove the if condition while keeping the
.compat_ioctl, is that correct?

>
>       Arnd

