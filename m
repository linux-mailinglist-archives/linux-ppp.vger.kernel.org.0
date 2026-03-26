Return-Path: <linux-ppp+bounces-449-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MH7RER/7xGny5QQAu9opvQ
	(envelope-from <linux-ppp+bounces-449-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 10:23:43 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE523323B1
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 10:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E35E3300F102
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 09:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2613B3603F8;
	Thu, 26 Mar 2026 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egxOrybp"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD193B583B
	for <linux-ppp@vger.kernel.org>; Thu, 26 Mar 2026 09:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774516145; cv=pass; b=V+rPqOnJzf9wNFdv7GNhIYoN0i+AmdZ0udO8nKwPGTCWpi5e/FMeNpgos8KpR1ZSq5dMnD2k+sopUhWC2V/PSblmmn0/6gd0IJGrM30+UBtLKEiP+EsGXupm8LwWW9N6PfW9jlZ5uC6/gkNdN65o2ct5VTz1c2L2oTt5NMNFn6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774516145; c=relaxed/simple;
	bh=uA25o5lpi6eVBSrg/N1K6ROoeMRwYMOMW3SOAr/2gF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FtUODbRvI/AdnbyTxbSP52s/XsFMtU7VeSR5bnbAEQ2K/pJE3uZP5g/VrOK9tdvyRulXO5GpvKTr6vVhScZcdB88YjqR0peJ7RUeZzxrW/ELhQO7IMhTLfTx2jLIU4OaL+1zK/v+3sk8fjmdCyr0ax5tF6v12S38j2gdG5kr3To=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egxOrybp; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79ab2f6ca48so506697b3.2
        for <linux-ppp@vger.kernel.org>; Thu, 26 Mar 2026 02:09:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774516143; cv=none;
        d=google.com; s=arc-20240605;
        b=RHAqXZQTD2p+4My11YKaLDmhiUYHia8J1VcdZsoer42ghpoCMiypj9r+S5EQC9jkJi
         OCu08z6KFIpwYUulO8XsbZQIjiijSC9L2eTO7rUN5yAHjcFRlCPY3+/nXSuYPMB3QVK4
         GA6gCmD/ejtD4PEPW9IrtlJ9+EbgS8rgrY7Vw63hmw1WpDbV2gbTfbPVv8G9FyX4JYzS
         7i/DcXkJp7PAMxfp5Itp/l3HzR4SQ3LbmD7glaYlujme/rGyN6WrCQlWj3XGEAx0X90s
         zDjmfdUeskwBHvhlflrT3y6d9rnJa6rZwPaIxKMkN+sQI1mr/bkBZmwFGkrqM4zqi0kh
         sT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uA25o5lpi6eVBSrg/N1K6ROoeMRwYMOMW3SOAr/2gF0=;
        fh=JnOavg+qeYiXZnD+WUdwWpcvAD3ZLIvUZsTzBmyC3As=;
        b=ajySZcGcW1cxeMocg2Tuk7qC0tFXUROxzH/Bm0LyFbPQgge4flGBfMbWvIaj7ST2/k
         XwWyvakRqHPmboIHt5yyvGSicanzU1EFpsulIDFKEOKOWt4jDSKGzAuXVUZ83Mv7jEq0
         NTYPkgcIz9nuTcH3EnuXHW1mN3gix7nk6xcnTrsN+2Mkujr7Il35zNvaruuWysWxbeoQ
         NRYyCt6WfLf2zAsVPZ3UNb/vpBjV4zuMXHgurDl+oQcVRaEyBd23hMDgMdvZAj1LSfTg
         HZ65S4FjLf37SBln7Kte1ppggAjLX7Aa2OxGbwJ1p69jb6BxYdSuC7eo6bn3E+16edL3
         1fgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774516143; x=1775120943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA25o5lpi6eVBSrg/N1K6ROoeMRwYMOMW3SOAr/2gF0=;
        b=egxOrybplSlmvCycHtCuGYbW1A5P5oNITAlKux98JNdH32W3gd7FvITIugTC40APEq
         Nf/gdQIFAgV2ksdsLd7vNMwXcKGMK9ojGYEyh87o8SKjGvdQp1cq332eGVhJ96pus4y0
         3t13kiyljwG+ATCz/fWGN/CqRtf5GPblFfgMNE+jXRdHUs+9j+6mYLoDppfXgKQr51xt
         u8Bu+X9v6yx/7TYZq0lXHgnTrkhf6d4cpVuv3d6D8YAtR0lqGSKu6klwi2djtA/SuIc5
         ecpDDEaouBk6qPRzoWTlsMeKegO8HRjY2SFUb6fs+HqAbuKrEk+c0z3ZkmsO9RK0eD/s
         SLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774516143; x=1775120943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uA25o5lpi6eVBSrg/N1K6ROoeMRwYMOMW3SOAr/2gF0=;
        b=h16VsWD4SET3woTvfTburdBKS+bYrQDH7OrA6P1JdTXmEn4WwCUReeL4oSv1tL4xRn
         oIR7AsAtnHi1t1lDHLtHX7Kyy31AkVPO7LKqgGR3pdkVILL1xUMiUf383D6yRqTixt+T
         AbDKSwvxCNjW6MAyzcNXO7bwPddg8I3gkMp7/2frbId6Rg9JILwt/3VskhCDJjB5hP5j
         /8N468sLF8/P0p4fJQMV0E7WpqejJUsvxiWe3iq/OfiiXnHYA9KaVftFoqP1bdQakY2N
         ajxJS4KggsHVUJ1OETmxewJdVFvvI1s37w0YmIN7OHKvI3VFHeXOJJLm7p5ourKV4n0w
         hLqw==
X-Forwarded-Encrypted: i=1; AJvYcCX6l4kge+6gOUK/MC9rpaqpfa5FcAMqqkoUJGXOi048g5k+R5J18AQtQKs2JEvQwBKD5mxq7XqnXgU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJDXQphn9aqnSL0x9NPUI2u4WTNA7c3SV1rhC6nuC2MStT7C9M
	qF9Xd3epQGF/gTxXA9iVuy0eQ73Q/+Ilp887e58ZrjK6WMsnmLyH0xDbUtut8sz3sZnM1kw3fju
	ev3qSm8rjpxR2YMsoP34mDr/Hc6oWQAk=
X-Gm-Gg: ATEYQzyBTVC4vFT28Ty/mebVQ11lKGGF3LNGESRZHRfZ0c83/vBl7/gcEvR41qugDdi
	GGysxifT9t2WgEiEK8eqaNlTgJ41jKLiLLr948hEcQT+/SBvWxdA5nip8rnpQf5HWvDZuuBdBev
	1gKynjhbVKVpbH3fPvGir+8OFKxfyjbRZeB3Vc3QPWvEbVmm/h29wQGPvXvMN5T1OtkIQ9LtfKk
	i8QLB0J1fDfu9SP8SGtxjbvDuy5352e3qoQgKJAKPhIDBUWK3VnCJxZZuMDBpYEFItpGBgIgWfp
	8t3IuZg7niDw2GJ4
X-Received: by 2002:a05:690c:46c4:b0:799:3a3:2f25 with SMTP id
 00721157ae682-79acf67c2cfmr77450957b3.38.1774516142930; Thu, 26 Mar 2026
 02:09:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326021642.29170-1-dqfext@gmail.com> <20260326081304.xKa7-s_1@linutronix.de>
 <CALW65jYdzn_rZWa2zwYd5J+Gd=kyaGMsVFyX0fMJfKfgULMO6w@mail.gmail.com> <20260326083020.2fOQj5br@linutronix.de>
In-Reply-To: <20260326083020.2fOQj5br@linutronix.de>
From: Qingfang Deng <dqfext@gmail.com>
Date: Thu, 26 Mar 2026 17:08:50 +0800
X-Gm-Features: AQROBzAFY5MiCnvJ2DMtdJfFsNq_yFZ6iw3jGYwdcM9wBpkBnMh9AY45ZZy5_aw
Message-ID: <CALW65jY48_cq7tZR2S_b+Y1zJw90PGtQcM9JzK1wDako4yUaWg@mail.gmail.com>
Subject: Re: [PATCH net-next v4] selftests: net: add tests for PPP
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Felix Maurer <fmaurer@redhat.com>, 
	Antonio Quartulli <antonio@openvpn.net>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>, 
	Guillaume Nault <gnault@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-449-lists,linux-ppp=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CAE523323B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 4:30=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> > AFAIK, this can only happen with PPTP or L2TP, which were not included
> > in this patch.
>
> Yeah, that one. I was sort of looking into but gave up after a while
> digging through code, since I had no idea how to setup that up=E2=80=A6

I used Google's Antigravity to generate the skeleton of the test, and
the rest was some manual tweak and trial and error.

Regards,
Qingfang

