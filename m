Return-Path: <linux-ppp+bounces-381-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM4/Ar5fhWmfAgQAu9opvQ
	(envelope-from <linux-ppp+bounces-381-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 06 Feb 2026 04:27:58 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60305F9BB3
	for <lists+linux-ppp@lfdr.de>; Fri, 06 Feb 2026 04:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED451301050B
	for <lists+linux-ppp@lfdr.de>; Fri,  6 Feb 2026 03:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC5D330B14;
	Fri,  6 Feb 2026 03:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXWJZ27z"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1653B32FA3D
	for <linux-ppp@vger.kernel.org>; Fri,  6 Feb 2026 03:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770348374; cv=pass; b=lwXPe4/J2zriMWK1ffWmjYbXxnWq84EflxjhW9roZC1d98IfELKY4pTICkRxM8NAodYTbHXt8m60M2VwsFAzee4jpQbphj+jMjO7xAb27eF6WVJyM0fPOwKzTC/Powobb12BKCwP/m5CD+kliAkE7FI53m3ww+7oBHDkmqddqqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770348374; c=relaxed/simple;
	bh=nzyi1NcjbBGTxpUVC/DDARbbFTgX86MBUEkykiCwkzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=amt7ci8iD1oHsZoM8RAwoDRLnOo8xQZ/9AqrMq1IteNEiaTSTxvm2TZMZCtC6CekW+BOizcTRIOvZ65Ei+2CApQ3IC1exibkik9m8RHpjp9YBOtbrQQc8g+KjfsW5l58PIHtDXfkXyl0xghvDrtE0zXyotgmgevU+I7WWhRRiz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXWJZ27z; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7927261a3acso3264927b3.0
        for <linux-ppp@vger.kernel.org>; Thu, 05 Feb 2026 19:26:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770348373; cv=none;
        d=google.com; s=arc-20240605;
        b=d5PEwDJSDI56Aeg2sZKj9BWE4/f1S1GLGQV1I8Ee/EYkE9GwiaElzgQj6KLtHjEVzL
         S3E23xgRnwqnmHY2D/Us2C4fLCFIEa4w+3ns0xIDR+Jb587e/n8m4zmTeFRck8BLxXJz
         sFIdvjkwYBsFX+1/KX/vLeTdB3WP0EgZETQJF5RKkSb8J9hJbjcspufooENIR2YEtwon
         EPwZ6YaxangIVHLaQMuO5/sm5hgU52dbIByhmJssX8hkcBJ5SU26SvU0RFQzbRk7CZSz
         VMw4Of4eJ2lZt3v6OeSawggNG1JoirJIXu8QVtDkPNeZvsaRAD0+Epv4TJ4apFrruNcG
         uZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nzyi1NcjbBGTxpUVC/DDARbbFTgX86MBUEkykiCwkzk=;
        fh=PdLKQUUJAJq5aFQJYV/9vOjnCzS0EYCu2GIlX9Uwo64=;
        b=ExOcO7fNSAM4hVSUWCp29r2GVFUhA/OlMAGft7n7d6hsu40TAr1Jqe9GP70bQg5mGt
         Ylc8g1fEd4DizB3md9Y2JfwE86iJpfI77Z4KGHudePEqAEN+Y2gF3Y86Bh9uxYaIr9RP
         izgM5xrOBsj4pz2lsXf+LMdHR6Q3JRvDTniuJq0xNZwH0AMUa8SVVlQEodzI7n28ovV/
         yyX+/v9wH3YIJltwCCudlSfa1lVrYrHh3XMfDpHqg7CM5pID6EZN9B/xriq8/uduPHME
         EmEUH5Q8synIzy7A+JY/nYx6wU/Tb8cqiKW9iKheA8XYyS39+gEqdOKG8SXBj5aOKubE
         43Dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770348373; x=1770953173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzyi1NcjbBGTxpUVC/DDARbbFTgX86MBUEkykiCwkzk=;
        b=XXWJZ27zGi17WBr1VqxvCrCxMngEkT5d2fk/+ZafNggDzBsG+zpL3uimJN6ye2YUG1
         Q28ONGTnlbMTRXfBKimO9xUKC+qM+1upSpGOe9tvY+I6Li9p9zsRnzpKX154eKRr4BKK
         re3XXe0wxnvBM9KfJlbys0Ds3y08pJM8BuRinqWgLxnaiLLxtPPM62v3s7/5ifaMJ7Sg
         vjv6fLxEbfi4rY+8S7sFHllKWVoJWEL5j7HMze3SsgSttSE2LyCaO6nHf7gKIZMK+Di3
         sfNNUx5hwshkD+o3/pPhUu1MfxHGdGEgUhEPzJtQtDaMYgGT8R9ogXhXXYPPj1nPrdqf
         +kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770348373; x=1770953173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nzyi1NcjbBGTxpUVC/DDARbbFTgX86MBUEkykiCwkzk=;
        b=wq8BpsedHpMql+TuHEm8rjT/b76Mobe2I1hcZ6SI/L4doOZn7naL0ime369LNN4lDv
         aYzXicqZfREH303hLtA52lhMqryFmK11ZHARZ6jdynpcFHAcXdxXu99lLcMYFftqcOGI
         LZoZeddYdghBYWg1iknACE7T713518zQtgkv/HIXTLJ5bcwJMShOwDaaUUx1x+r6gvVF
         fJFKPdkKomnBB5hsrCxo7SfLRV+m+KUNPynYWWAGsXwxZhyuYSsdEre86kodmENNLFBh
         OlYyTdyqYjpr0CDsn9APe4sDmGp6+xLq/MkmhHcm0CnV93GtO1JFfLXJzSca2Pw464Ze
         hhJw==
X-Forwarded-Encrypted: i=1; AJvYcCV57EbzzAZYlq0OnXw1eGvMz2lgjr485zaibiHBdPLA76uUq/jTgSFx5uu8kSGtENMkU0GOacqEYyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhqEVpzc880SiQ0Al8i8fzFGDlLGW/qRCIf5n0Y0j5vL0SsWsy
	ZXnrqZd1OgPLCwHKsv1xVn2i0Z+5RdCA8adyvBFkBWrn0+1D8EoQ2CAw3awyWedCnPmwjmbQJOv
	8/2ffWGfx5F8bfK+G2gkIAN/XQFK8uwo=
X-Gm-Gg: AZuq6aKQCXaG96UZLOQfuNrIMsplAazUjz3eTr+nGTFOh4Q0EdRz5SGGfyuBZC0GLbC
	4vKr2QQm8vs2ehT2kjlJ198oQ3pRGFpbrQMPu2VbN3SSCmsxeFYiZa169cyF4erejDoCrW47nCL
	zIm/h8C+hmq/BE9W+0VOk27RcNVYPt7J9hu+uZT6/4IuNYZRTUWYhIL4XfSZTf+h7OyI36b/d95
	qDn6xfkoQUYdYg+ibKrQXSwlf1q1Q4CwijNMRFY823XHbcuRQHUv8THiOTpBmh1WQUcIhcMmDnx
	GK1Jbj2WJe5sIBMZ227GPkkgowwTcME/gA09Qwk=
X-Received: by 2002:a81:b813:0:b0:792:7828:b709 with SMTP id
 00721157ae682-7952aaa0022mr11939057b3.22.1770348373142; Thu, 05 Feb 2026
 19:26:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202092116.266568-1-dqfext@gmail.com> <b8083480-b34c-4066-99c2-1bf1ebac7004@redhat.com>
In-Reply-To: <b8083480-b34c-4066-99c2-1bf1ebac7004@redhat.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Fri, 6 Feb 2026 11:26:02 +0800
X-Gm-Features: AZwV_Qj-fFrhjGxKJB2ciWFuDaM_bWlFVc0z83YZxZ3qBWUPXeppadCCcq7a9Sk
Message-ID: <CALW65jab4ViEU_g1nMOwO90dtEEkpQrKE-ypZz8tu9ShNjahtg@mail.gmail.com>
Subject: Re: [PATCH net-next v2] ppp: remove ppp->closing check
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-381-lists,linux-ppp=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 60305F9BB3
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 7:40=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 2/2/26 10:21 AM, Qingfang Deng wrote:
> > The ppp->closing flag is used to test if an interface is closing down.
> > However, when .ndo_uninit() is called (where ppp->closing is set to 1),
> > dev_close() has already brought down the interface, and
> > synchronize_net() guarantees that no pending TX/RX in the network path
> > can take place. Thus, the check in the network path is unnecessary.
> >
> > For file operations - ppp_read(), ppp_write(), and ppp_poll(), can
> > normally still send or receive skbs. ppp_read() and ppp_poll() are safe
> > because ppp_dev_uninit() sets pf->dead before waking them up, causing
> > both to exit cleanly.
>
> Please report the accurate call sequence that would lead to such syscall
> complete cleanly. Also what if ndo_uninit() happens just after the
> user-space has been woken-up?

ppp_read() and ppp_poll() do not care about ppp->closing so their
behaviours remain unchanged. And since ppp_file is refcounted there
isn't a UAF issue.

>
> > ppp_write() does not check pf->dead, but
> > ppp_push() verifies that ppp->channels list is not empty before sending=
.
> >
> > Remove the ppp->closing check.
>
> This still feel risky to me and it's not clear which would be the
> goal/gain. It this change performance oriented? If so please included
> actual figures.

For both performance and size, but I don't have the figures yet.

>
> Thanks,
>
> Paolo
>

