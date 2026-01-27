Return-Path: <linux-ppp+bounces-371-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG0FAXjMeGmNtQEAu9opvQ
	(envelope-from <linux-ppp+bounces-371-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 27 Jan 2026 15:32:24 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F0195C14
	for <lists+linux-ppp@lfdr.de>; Tue, 27 Jan 2026 15:32:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0768F301A502
	for <lists+linux-ppp@lfdr.de>; Tue, 27 Jan 2026 14:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D0F35BDAD;
	Tue, 27 Jan 2026 14:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1cLHZnT"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EEB13AF2
	for <linux-ppp@vger.kernel.org>; Tue, 27 Jan 2026 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524287; cv=pass; b=qDJXrit79gRQxrCr5jBa25LDT+F/mNELwxhLONu9HJf00h4lXukgjvF1+xungHAaZfsksOEpSu9xEHlbwSkUG8DlQdC7T01HtVlVXEkpqjFhYMFesn/+9/CS3bhxlvM++X4mgRyf83wa8C6PdQ4PDV1BKYle+1aPV7pS6iGnFdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524287; c=relaxed/simple;
	bh=JGwR91Qfe8nXomjgqf2NH1PG05H8e7VTRWQVuRRQaJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQw92YPeqEawzeHupMvus02mwMuPDNnpfotA1y07r7vQ3sQNfs1m2F6USID1y5bcAfdRJCcZw3lJmoLDTVsk/4F04IZVW/ZDdtSwOnXuZnNf+VVgpkf82h0yKfCQcwpAIERtLT9kcIodvGgSNxMQYWoTKwzoctgYBLdbBKmL1Jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1cLHZnT; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-790992528f6so55376457b3.1
        for <linux-ppp@vger.kernel.org>; Tue, 27 Jan 2026 06:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769524285; cv=none;
        d=google.com; s=arc-20240605;
        b=TvkFtNTB9vTZgAUYSfjJ/YYeUzBwQdSSwpcbeoXBmwn8XZ3GX6mOQjQkgbN6odOD8A
         xtE4UtbaVR0go7wcAu7fAaJx4PRLRsCoikTlGZ+3G0uzfFiTfHKmWgAKs51TBOOHAI9X
         QwW8g3NlnQl+5GzBT5BTkzZyIj77LybBibHccZTU9hZU9TwXWw/6Hln2WiPF1YIXE9Nc
         KV//F2z+WDR10uzKBYEd3YnmmzapNoa6F/rCrgoQGJkBmYSUDDKiyg01JNJ28/LF9ld6
         2QS6cilDYvS64+Qkm5VBZzgnsWamowYji5DQFyUs3QGwsz8GG3dIrlxCAPdM0QFOVCNP
         4HJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JGwR91Qfe8nXomjgqf2NH1PG05H8e7VTRWQVuRRQaJQ=;
        fh=H3PQbsSqitBIVvBlhvE2FF5Hqt3NgpjaZJVGmYn1Fnc=;
        b=WgVYt1UvgpdANEKJZUTaTF/ePRgXGDs2B6Z+VjxZwRMANYGk36ZG0D7Pt6q0MIzcIF
         BmYh8WwY4XilpFAS9JACqCJ4NeR+vkCvyxFaCq8H/hyjOLkCr4jve1e6H1uBfB63tH90
         z9a9LVrR+nsQALoc7nQP2nzREx3j0w2U3AcjHuGBEFMOWtNbEiRUT5N1i2zLf02BscZA
         khvjSFReGRi/NFeSZP434caZGEQniNQHjun1r1MtJG/Pf4iRn0QMC2aP2FwMkrmizlPj
         d0dEn/P+6cEmK4/bEO7k5dPixvvSnpC35eweSlUOdXF4G7Q0MpwJAT27LjI7fljs3Vzz
         iyjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769524285; x=1770129085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGwR91Qfe8nXomjgqf2NH1PG05H8e7VTRWQVuRRQaJQ=;
        b=Z1cLHZnTt4WyW1oNE7msTzaCmYM/VoVY4sYfebP1jqVTke6b0UPACX4T5a1HlFP27A
         Vnm4gSn19/0+Q2FuboMNXVTt5fPFOwREpGTjboM4F3L8jwqqNALFx4SBR3jIvBnb9Xy3
         NGXY36ZAr7ef22r1OV7/y0r/v47vpX0twQx6tixn0f0TftSvQK+BjQ4vcCQc7FpFDXvq
         OOt2H9cRIltLPad1UnLfq5ezYZ57WCzCqKWJNmt9lRsUJcfjop3nsv2Qd+rAWaIbA+KR
         DynSaL/f8LhwNx6py736Ajqu4w68O3YryaI85hk62A+hefF03XpjS/xs0ytUf93NfSjZ
         pyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769524285; x=1770129085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JGwR91Qfe8nXomjgqf2NH1PG05H8e7VTRWQVuRRQaJQ=;
        b=YXjt5L0T2BZjvNMBH2R/Y8z8XgLbO5xSgQDkypl6qPh/A6CXtPsiFE8DtWz86XdEBY
         535zKABxPDwKmSCdYYPuHBlxgi89GeYfGsHtNRmUC4Li+5/otgksKTKn1i0VtqCviln/
         CuBfExN/ucpt6RFbYLb2DqHatEk11ee8t8Qc/TtZzltv31MoYuieVikz3FmXDSTyHQOj
         4cPDgNhiSaBzej747MJNFbriGK1EFF9iMeQjffX9PUbWliy7xmv7aOaicI8el0E9dyjC
         xY19oPtuYOUJIQUJSHUF6YYuFeONXhoNPFTvnNeE/M6/Y5VuzNKhcA/Zgwg3rByC0FWr
         LqFA==
X-Forwarded-Encrypted: i=1; AJvYcCVZZyad1lTbCbrFv5OIxLBMrJdCEmtSEmQPCDKSCTUsWTwAlnI2bDPSaXZJ5G0NAHMQ+DkjeJIL2SQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoHJ5RzLPbCiqsgZDOsJ/4w/1Acsi36KG7F49icaXSViClOmTT
	mLw0wK8plxOs8Cj8eESr8ulZmd/apDCoGeDg4r8OyDU9/+pKfpVZX+4S0GDjlvzkuRm5Q3dfGMa
	bd5CIbO7CkweEE7WFrCVwdP7IlSqsVHw=
X-Gm-Gg: AZuq6aJ7TEtlEg+vAJOUnI085CNtLTgXiPLdbuE1Lrma1lG10HVPIO3eYhVTZFyALDC
	8vc4QMmZ4Aoou3DP7wauptkDPlRvyCFqvxlo3ryPoUbi0zAhBbgteuSdYtmIerMoCqFvPRQdp23
	E8aKUl/2aBaEQ92uCOMvAbJCy1oxgqDYp3i5ow9ww7QbinLcM7uIkomcK55iTBhLKCS7V8U1S+/
	zI1CBmrx7bFAqCJ9gfc22Bo+u0u34As+CySXjEXrnqZIk3chOr2YIxCq/VVJF7AAvhpdzcnFNe/
	EzxLa2+pY9u9WlakcXUXbaITN5MyAubb3jo=
X-Received: by 2002:a05:690c:6813:b0:786:a0fb:fa8e with SMTP id
 00721157ae682-7947ab157c5mr13544667b3.15.1769524285131; Tue, 27 Jan 2026
 06:31:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123014214.225278-1-dqfext@gmail.com> <a957214d-62dc-40cd-a422-73b317bc1827@redhat.com>
In-Reply-To: <a957214d-62dc-40cd-a422-73b317bc1827@redhat.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Tue, 27 Jan 2026 22:31:13 +0800
X-Gm-Features: AZwV_Qgys8PIBruD6IDJu3dMJHS65bdijFA95T9f5ZDhzgombFrwpXGG4qqUgfg
Message-ID: <CALW65jYb0prfB-KpxdcNVHB1tBjN3tW286BsvQkCFoXwTu2QKw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-371-lists,linux-ppp=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A6F0195C14
X-Rspamd-Action: no action

Hi Paolo,

On Tue, Jan 27, 2026 at 8:34=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
> I spent a little time trying to understanding the logic here and I think
> that enabling features depending on IFF_NO_QUEUE is fragile at best.
>
> It looks like that the IFF_NO_QUEUE bit is an inconsistent state for
> multilink devices using different type of channels.
> Moreover the user-space could attaching a qdisc to the ppp device after
> channel initialization.
>
> Instead you could always expose the features and linearize as needed
> when transmitting on !direct_xmit channel; no need to touch the
> individual channel implementation, you could do such check before
> calling the ops->start_xmit() calls (possibly creating a new
> wrapper/helper for that).

Attaching a new qdisc won't clear the IFF_NO_QUEUE bit. (The flag
means the interface _can_ run without a qdisc).
As for multilink devices, one is not supposed to bundle channels with
inconsistent direct_xmit (for example, mix ppp_synctty with pptp) and
expect better results. But as the driver does not reject that, I may
add a skb_linearize() to ppp_mp_explode(), or add a check for
SC_MULTILINK flag in ppp_fix_features().

What do you think?

Regards,
Qingfang

