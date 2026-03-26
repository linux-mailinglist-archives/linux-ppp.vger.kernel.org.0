Return-Path: <linux-ppp+bounces-442-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGWVE5WdxGle1gQAu9opvQ
	(envelope-from <linux-ppp+bounces-442-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 03:44:37 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A765932E743
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 03:44:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C96930210D2
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 02:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00FC38CFFE;
	Thu, 26 Mar 2026 02:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5Jr3sSF"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AED28314C
	for <linux-ppp@vger.kernel.org>; Thu, 26 Mar 2026 02:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774492788; cv=none; b=sYuFdH1tg97yK9TdoH1MF1BEi0/KeVEFDmjrY6b9h8/klKJc7GRRHb7gEKWlVOyR+q5ONIc5o+onX+uOJ7QP1a8R3G3Ncd0iQjg4rOFW9LN/yuTtzouvL6xLp50iCfx3de3K0EFKsxbydKDuTKsh2aVa3QtnUWPscJkt+znYsnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774492788; c=relaxed/simple;
	bh=oFuA9HJCp2JlyvrW6KQhqav2hsUc20F0Uqi2S8sqkmA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=a4VOa5XiOFe5MWtcqHPni+PmnuiWHL/3TemslaYgG0oPIHnKffdR4zqMTM4bi3GmwMjhDLeXjRkvzGZJtIv7Es3W3Hk85Qq3PpJbWHxTjfWWI0YX3BR2RfO+iv17rTT7mC7tZV+I47EKyBVd421HpVgwcMkwsuzJ099ZHgyzbjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5Jr3sSF; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64ae222d87dso523351d50.2
        for <linux-ppp@vger.kernel.org>; Wed, 25 Mar 2026 19:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774492786; x=1775097586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkKASDSS27GIMRV0i5mmWnYYUA/gqbOObp0Nx68p+B4=;
        b=F5Jr3sSFzM6qt6olpiFaPQHyixDsqRB6iQKwLiLCojGBU7Cej2RJLy1JdMogIsHxbG
         v09HU7rhILLB5bbM8hYZ6u40TAhpZ1Vx20Mz+Ui/pJv2nQXy39mYSGL7tqDBLCHYhlQG
         6heOp93kwyN2mF2wHrYOj9AbZcbwS/yCqYHNIBzrNb8WWdXJs4Je5S/ue/6MJFi/JZSD
         gKoJfh2VRkvoXoKuzZ+dLMX9fVYiqwBy6cYr5Xdcn2qe6BG/5qNDebA7BGmqdr44cTuo
         gldphnvkoQOkpmGixirsSqv/a7mOpknwMFZkmCHGC9GXQ6Vro+16xs+m7Mt+dESYT58P
         MzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774492786; x=1775097586;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OkKASDSS27GIMRV0i5mmWnYYUA/gqbOObp0Nx68p+B4=;
        b=o6pinoaPuB0oRZaiJ2L01VIDBamVjv9kUZFaMEuPWkhVMKuCucO5gh7AFv6SNgYdYR
         lI3rNppDieHzUiX4GTkT1GuIz0Ho3suSsqWfMT+dDQQ0U7I0WggQBOSuFC1/mjMISV0e
         DUEa4ONLmb7+1BqxJCGCaDOUKZ4+gQ9AYBe4MD1nVT10peXzOgCUJiTY3RNgHf7f4h4K
         j03mXmKp/yWBgaTNTkdDt0dv+9sDsVURI4mfYFgyRnHw5LSmY6ySwJZcceTrXlezowph
         AkA4puwLT1EuXrTMo/KSqtDpfEfuFb4BGbTapnso/5NKWaG2s0lY77w0Dt5Tgv03c+XL
         P8JA==
X-Gm-Message-State: AOJu0YyV/hfBBz5iHX6bDY+I0ca82QGMpkRy324C6vcLrvq1cn3/xxUD
	q9sKeKI8d8byU7g/nLIVZVqbmuGExH5SLVG042mjbj4LyIb4ErXJh0oa
X-Gm-Gg: ATEYQzz+VWj6CJp3LwTE4prl42J90xcw75DN1aPuj7IqIEvENzSXlFmp+PdzidWlQeg
	u6kCrcumOhImitv5eJwjmYkS4a80Qo1y78m5XSvflpIUP4IBs6Z4d8pec4AbyW9H6prGeGV9t+Z
	OwFWkfEKY6wXNcELLl/aO2wVWf4YPyQpbpO+z1HByjZsC0oBQz5+uCnFif03GE7uzfeRNWpu3BN
	b/nz2RmADTa9BJzGj5eQzZyiqaImP+ODCYfSj5Z3BT6SwH8H/o3nVvyIiC04bp78FVHz/Xeu5SH
	+Tqv8T2drCotgQrNo55geYviBv+P04W1HGtoKsSWW7WFS2hLa8acRsZDDObp5dzULEZaFW6JL97
	gHI/tO+YaGa6VGZ6jg8uOW5RObxlfyWKTIgMgzPpdEwuHf18/XYjVgj1MNNcVttlGJJaYg9I45L
	oSUjfhQ6D9c+/CMT2unRdFJPAU36H7AsnKIRXI0c8tiDQ0E9SZ/Q2Fazp2QfaqIjS1DtIaT0wAh
	uD/
X-Received: by 2002:a05:690e:43c1:b0:64e:9dc7:90ae with SMTP id 956f58d0204a3-64ee612f985mr3789416d50.43.1774492786528;
        Wed, 25 Mar 2026 19:39:46 -0700 (PDT)
Received: from gmail.com (180.134.85.34.bc.googleusercontent.com. [34.85.134.180])
        by smtp.gmail.com with UTF8SMTPSA id 956f58d0204a3-64ef6c08f2esm868428d50.14.2026.03.25.19.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 19:39:45 -0700 (PDT)
Date: Wed, 25 Mar 2026 22:39:45 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Qingfang Deng <dqfext@gmail.com>
Cc: linux-ppp@vger.kernel.org, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, 
 David Ahern <dsahern@kernel.org>, 
 Simon Horman <horms@kernel.org>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Felix Fietkau <nbd@nbd.name>, 
 Willem de Bruijn <willemb@google.com>
Message-ID: <willemdebruijn.kernel.f147059acc3e@gmail.com>
In-Reply-To: <20260325165910.5bd7416c@kernel.org>
References: <20260305013852.3769-1-dqfext@gmail.com>
 <20260306170411.49912ae1@kernel.org>
 <CALW65jatv71b7G6jpr4g-6j520RjLBDJMH8uta5MPJHmEM1S1g@mail.gmail.com>
 <20260309140127.465b6ccd@kernel.org>
 <CALW65jZv53Y4-H3civxZLT5RGypsKjb3JyiA6iy0pw-_RK-=Tw@mail.gmail.com>
 <20260325165910.5bd7416c@kernel.org>
Subject: Re: [PATCH net-next v5] net: pppoe: implement GRO/GSO support
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-442-lists,linux-ppp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willemdebruijnkernel@gmail.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A765932E743
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Jakub Kicinski wrote:
> On Wed, 25 Mar 2026 17:23:39 +0800 Qingfang Deng wrote:
> > > > I haven't written a kselftest before. What tests should I include?
> > > >
> > > > I think I can add a local ppp server and client over veth, and test
> > > > the connection with ping and iperf3.  
> > >
> > > We have tools/testing/selftests/drivers/net/gro.c and associated Python
> > > test. (note I have ambiguous feelings about adding ppp cases to this
> > > file vs creating a new test, adding Willem to CC maybe he has some
> > > guidance)  
> > 
> > He hasn't replied. What do you think?
> 
> He probably missed the mid-thread email. Proceed with whatever you feel
> makes sense.

Sorry I missed this.

It's hard to say without seeing the code. Perhaps code it up as an
extension to gro.c. If the code changes are manageable, send that. Else,
consider moving it into a stand-alone test.

