Return-Path: <linux-ppp+bounces-377-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKHcMpYQgmm9OwMAu9opvQ
	(envelope-from <linux-ppp+bounces-377-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 03 Feb 2026 16:13:26 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C940DB230
	for <lists+linux-ppp@lfdr.de>; Tue, 03 Feb 2026 16:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B345A30A7D5F
	for <lists+linux-ppp@lfdr.de>; Tue,  3 Feb 2026 15:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6783101DE;
	Tue,  3 Feb 2026 15:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHzrTtCS"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A908D30FF37
	for <linux-ppp@vger.kernel.org>; Tue,  3 Feb 2026 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770131323; cv=pass; b=GKIVcmgRh8ABfYE2Vw+1YJ4w2V2aFlY1CI8Qf2kh4D6W17vifVc8E7cTPpZ8b4FKBaMky7aW/CXV2P4M5CGWvvqNdCHkCx26zawj+Wn/Wp1P/h2wBthbOvGZXIkV0Xg7zGrXjmXB01Y6K4jL+3IPIO4Lp3BQFV0c2xr0KEvenEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770131323; c=relaxed/simple;
	bh=dLwhPzO5ci89AJamct/0TDGWXR/7sdMpdjrHvBeisqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FCkcVvM5nMybRExIBHQOLaPY18Ho7eTCtgvtdd7Lm9Da2NoPizX2Le1700AGPqKNihzQAPNTK79QOoutboMtUA7AutkNrs1+rxhTtfY+Oqv8wRppui19QNLsARBfMXP9ygU6vMB3/Wgn4BzK6K7T62fk4ZMos12Km3zJl2yn3AI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHzrTtCS; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-794ed669269so16205497b3.1
        for <linux-ppp@vger.kernel.org>; Tue, 03 Feb 2026 07:08:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770131321; cv=none;
        d=google.com; s=arc-20240605;
        b=lYxskhecgb0/ZDhytUlrlq+5ZG9TQONZu1XxFB8Uco3J50a4QZf/CpqFC9HPLRFsdD
         I2AUOrLBSdDCZFNcoP1tgzsSr8phtNq+MquWT3BHkSAnPr6W97YxAEzXv+Hc64SB2+qe
         k2ZaeSvxRCSQDrdUUooCwP51kroZ5ofsFMLtsq5B7hLb7aCfQaDoMQKJCouGRC3OqcTK
         +NR4KAt6CYf9IQfFpmhlxHM6mJhM0CucpnPe9xf+Sj+CB96Iz3de6cMPwV4Z3amwRobz
         XLyNp/XqU2FLh14CSY8iupuGs8Cc5UnZUEf0t0EPQKsBPQgXJam4+XgdgOjxwpsuGmi7
         Tifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dLwhPzO5ci89AJamct/0TDGWXR/7sdMpdjrHvBeisqU=;
        fh=JEYSKDfk5kT8VcAy49Ptr4jA0nW5k5J5AAfF5HiMxf4=;
        b=IBvHAjVvRcfXg+3547Vzz1H0PbTv0gUQCGtNCy3UpKvWLnEorBlgJGM2diLmgIQ99n
         FzJOEqQKMVDvh1kY4iykiupb1lQF3Hh/kZqu+J/TPX92Y7genlpJE1RjIQiqQeSRoaay
         xq5ng7OCRhD3AUfQeBaAiKkSueXVQ/RHJIINufwzZEk/bdaaOYrMqJfwCt2dRdSQeWJr
         Ya+/iP48pfDhX/ycdEPH4tdo+BcLrhbfyzJvwdNsUBdCsW+4MjjQ00UZo3woIjLwwHMY
         tf9R7gJa9D6Xook8oVRsOhIEylLJT5/ZKOqAT9ylFjkY1Ezm+bO/zLyR3SDR+dTRpbNu
         nNKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770131321; x=1770736121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLwhPzO5ci89AJamct/0TDGWXR/7sdMpdjrHvBeisqU=;
        b=nHzrTtCSFhLYgllkdKMFI61NqCGXsRJgJvMim/PTp/ECsr5FgEbRmAx8S5athEjP0r
         +yk/SmBUulrmdsNRNVeXo5kNbSiCZmc9jW/ykS/DoDOzvOy/ZWy60ZFFBgpulbaAPVSv
         D6eipKpUgNL3WcaaD7+V++f5rXiXxpAl8PNH9CaFE2sJHcoI+cyoygbgLhy/2LcGi3iH
         /6997Rl2ZXgC+8qDV/a2NdUM2v5FK61MT4SWkNrqmCb9uW+22UUdW3Gelis6oG2oh6bg
         wk5mO401m185nVJY8LwdrcFR5hJ1ebFvBtccHG0mzv1A6O88mR/2ViJRaq3YOg9js5Hl
         M2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770131321; x=1770736121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dLwhPzO5ci89AJamct/0TDGWXR/7sdMpdjrHvBeisqU=;
        b=Eq38mekd61J5xP3jy6j8aH0MhJadHeRNNDXij7pB87mAxkmfl9KI4PkpxcqL1pMdk3
         2LOd9Cqg2TTv8c4d3VlPOZf8Rwslck8wR3a0dEdwRTbZPi/Dg4Ftt4QnKBXBuwCkLjUM
         svyQFd0gLRsxIS9Nd1dqf1nakDVBFOasQtNIfO8GdzNfnyRiNZOYc7st1u19/IKGJUCG
         PlPlkMERxXGdB1o9Vh1Nq7KCw6B5JRHpheUbTaJmt58ByMY3+897hHvyqEUieJEBwx0y
         Op0hKfxcvrxNS67YDfL9SgZW5luzEtC+VcsY1gzoOJo8XNe5hSKzDGpDMzH9+M4eGDCz
         BHpg==
X-Forwarded-Encrypted: i=1; AJvYcCX3LzIliIPbKB8LoNt4x+QAmbVmxBgC0rU7FK3ws94IWCncMJOR1cFLYBx3Q/nJAkS7YqiRVuUmjbI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9UcpjTQQaS6dcDoJfLvylv8LKveLBZI6s5KXbtUoDxkrFSwz3
	GRQidvowjIrgiwTT8UJrKA2YLKP2zL0q8HQQeO8WpFNC2pIwOXuh0Slutam1Ajf40l23bMjar5r
	Pw4BdOY0Ut1qRYmQT7w9H4cAvpFADjJY=
X-Gm-Gg: AZuq6aLFz70Qa2jxG74qHtH/FcMAYQseyLHCzDOaeODV2Jy2EfUJMQdPlgTToqb2DgT
	ZwTux64o0HTyb78d20G08f8ESzgbyCbk0cyhyxOnl8GACMs0+LQUgZ9o7b5t1iGiyVe8jc4ekfw
	U4ZGGoWHS/Ke8FsKKhVqBx9DM729Oya3TcUpmmFpIHl7jac0Bc9gdJNVn8WDOs2q8RF2SDyyd/e
	O9nezzu/uZ3Tm8yzBM7IlUSORkyVRUq8QRsismK6H0rMM/ZCFzcAIeCNJvvjHWnXhv0LvRDv9nP
	mKviPFfvo0ma0tz8PhSCtBz0
X-Received: by 2002:a05:690c:87:b0:794:bbca:7f5b with SMTP id
 00721157ae682-794ece32112mr28375927b3.28.1770131320425; Tue, 03 Feb 2026
 07:08:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129012902.941-1-dqfext@gmail.com> <03c714f3-edd5-43fb-a0be-8c4a43bf6101@redhat.com>
In-Reply-To: <03c714f3-edd5-43fb-a0be-8c4a43bf6101@redhat.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Tue, 3 Feb 2026 23:08:29 +0800
X-Gm-Features: AZwV_QhLGv3AIxSulV2m_PV_coaTjvPCiU13Z6w_WpfRLVLO-uryb0nQYB38NdM
Message-ID: <CALW65jYYdX+NQ-6vNBdxDGHxDV1AdKQWenFZNjnqE9VQyC7fog@mail.gmail.com>
Subject: Re: [PATCH net-next v4] ppp: enable TX scatter-gather
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-377-lists,linux-ppp=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C940DB230
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 6:55=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
> I'm sorry for missing this point before, but AFAICS channels with
> chan->direct_xmit =3D=3D 0 do not support GSO packets at all, and here su=
ch
> packets will be transmitted after linearization (but still as GSO).
>
> I think that while transmitting over !chan->direct_xmit you additionally
> need to check for GSO packet. If ppp features are recomputed depending
> on the channels configuration, you could chose to drop such packets.
> Otherwise you will need to segment them before transmission, and that
> looks error prone in case of multilink.

I don't think that's true. Using the current features set (NETIF_F_SG
| NETIF_F_FRAGLIST), the network core will only enable the generic
software GSO (NETIF_F_GSO), and a GSO skb will be segmented in
validate_xmit_skb before being passed to the PPP driver.

>
> /P

