Return-Path: <linux-ppp+bounces-429-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMlrE+t1ummTWwIAu9opvQ
	(envelope-from <linux-ppp+bounces-429-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 18 Mar 2026 10:52:43 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7E32B9738
	for <lists+linux-ppp@lfdr.de>; Wed, 18 Mar 2026 10:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 84AE43019825
	for <lists+linux-ppp@lfdr.de>; Wed, 18 Mar 2026 09:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B043AEF57;
	Wed, 18 Mar 2026 09:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BmpTuKkp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CXQ8AVt4"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483B23A875E
	for <linux-ppp@vger.kernel.org>; Wed, 18 Mar 2026 09:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827376; cv=none; b=D4pteXqYXnVJ37HSqdhJCNRKoWyaTuTozanSzbHdATQ/X/LX+/ewcMq2hQpu4bL4TnTMkoI4gd1TmUczCguNrSL796+IEjC2FMfT3To+npkIfrYbiCvg5BGKy9qtFE6xThc2Fe9JU1shJqkoQoLfnQBmtzjgSYyZ5xHA/P2N5mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827376; c=relaxed/simple;
	bh=cTCC7w9f8PR0d94N69YTK7ENPP3u+ePq7cM2OGA7y/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLiYaqJK/x8brkdfkj5g8UXuRrVtzTVYgSs69q5VNDHko1VXz9tC4vLScBPY6UXbNcKn6P9cy2KeTqPtz/w1plRf3nXiYSSLTi8t/Q86M4mvPtKKGQNrjhjQNVZfEhfF8SpY559+bLBM205QOSGlPhOg8CRXHvBqFXddihJeBXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BmpTuKkp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CXQ8AVt4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773827368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ePMb9OZqcDJWUHQOQ+oipDwj+1eLe3lTWhpodjf3fTo=;
	b=BmpTuKkp7HX2zkOHrx9yqnr+Kltgv4MuUW9WWn5RoVdX4DI50sjwtZXvCtBExyCmCNWFUM
	2673vf77eAsLJQihoHkyyOsgWO4cMVMY+IQhvTKzQIahL5hRDjy/EdNLEBiAu+iKNflld+
	3b2X2yVrRmPLVv8WC/2cQF6Wj3ZvvGw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-LfUmx2hAMZiPrxdRiNDGWQ-1; Wed, 18 Mar 2026 05:49:26 -0400
X-MC-Unique: LfUmx2hAMZiPrxdRiNDGWQ-1
X-Mimecast-MFC-AGG-ID: LfUmx2hAMZiPrxdRiNDGWQ_1773827365
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48535f4d5e1so67633245e9.0
        for <linux-ppp@vger.kernel.org>; Wed, 18 Mar 2026 02:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773827365; x=1774432165; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ePMb9OZqcDJWUHQOQ+oipDwj+1eLe3lTWhpodjf3fTo=;
        b=CXQ8AVt4DuiJqBz7apb3zNQkgIQYowd5/04nR9SfMW5SLMNFsSb5JJMtPRiRsvasaL
         dG6G1CDuz4M6Nymxt6lGNZiLcp16y7Oli0Uu3g+apKt2KQe7UQgm34AiA3YR3tJ1C5vC
         bkVaPREnKJ8PAbTy0A3TEvUNnyDyNNIcKXF4fxqI5FANEZ39Yy4X45ncea90ymBW6BN2
         VW47Sqs1ozzRTp9mJsFHxZRppi0P9ILbt+7jt6t/K0MVgs0LnnbHiCrcZaoYWO8TYsX1
         ruRucYWYR/kOVaNXTCkjAoGH6BGr7q56RT/smTm7daO/5w76KpOR7Moq8w19uIqOb0fL
         vPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773827365; x=1774432165;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePMb9OZqcDJWUHQOQ+oipDwj+1eLe3lTWhpodjf3fTo=;
        b=VwupdWIQDIcYnm5NK/nSJ/Z+canKSfTMYuD3PyjM4sWaZlLDuCx7d4r1N4gNdjwtUE
         GL86nrboKV5d2hhrKi3WM+orZX33s8S1cufZLVIpBhocTEeDaQ54RKWiTyZTOPt0xI4g
         oyBuuLTewRWpfxnuwAabQmOsgtcu1mv7f9eouNwW00jOxEIzLrf4fsKm44DZyX75eqLr
         tiHYMHjJ09WWRPmOsulx+vYI8DDAsC1/V2RKON3H0KlcvG5x2EId6hIvQw4caMRHog0k
         KSSIawWkVGSVHAgYOCZnNQ8jtuESYn0D0qKiboBW3DCBA5RVLfE70DAR10m1O5QOUJBg
         xDMA==
X-Forwarded-Encrypted: i=1; AJvYcCUNk5m2BrvoissSPI1Xwp//jbwzKR7TDEj2jY718carFaLQp3/JfAfbwVUHkrpXYm/7ihHr+AnQl+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF+ZKg+mAarpvanNpycigbqTtN3V5AOTTpBMoGJqU5HwtK7j3c
	kx+TOm2c73tDYx4mqqm/0HYo7DWjfl1QibFI+y7nFk1BO54dfRHJ2T1Kp+1Xa+jJs3KlcBa8mja
	sPfbyikvDXzYL8P6wvdXXLXNVA98WV/joVhlpW0k4oRwNAn6Dd2U5WigPpybalg==
X-Gm-Gg: ATEYQzwM8kK7yOIQ9QL6i5FGk1Mwq81qMTWdXLRClehGtW4s8d9/ntvD7NvNtWv3sEt
	jt9gX396U+ST1vdaz7TR6IrfcBodZH+VZWHTVkJesXsNwEvggiExIRXpPk/fGPOXlEsZz9PThKV
	8D6LxIsYVEcuEH9fEJ06X4NQsVnpzkNb0bti6Cf96hfuFInnRTbU9mn4lG3eLgaPm7wR1665EAN
	WbcwpIuazrD7ohTevFcSqbab8uY2FnQrhb/W5YM4Q3psOyy3PSV6reHQlk4VTw5ifQ2eOVyVOnl
	Hv6l3PIdUk08iekWSBJyn26MFYIOLU7sC7cvKtiuj5Q0m/nTS50UZoocRrQe1xQfpA5Ckc3taQp
	DFv0Potvhw0XGKM9AukURtKXPuyJDKekgGO9v2A8Z8R3YmN8KF/jiFS+XkwOIWcYJY0KiJSJ278
	5w
X-Received: by 2002:a05:600c:450c:b0:486:c4f0:1a37 with SMTP id 5b1f17b1804b1-486f4457a6fmr44895295e9.24.1773827365105;
        Wed, 18 Mar 2026 02:49:25 -0700 (PDT)
X-Received: by 2002:a05:600c:450c:b0:486:c4f0:1a37 with SMTP id 5b1f17b1804b1-486f4457a6fmr44894965e9.24.1773827364655;
        Wed, 18 Mar 2026 02:49:24 -0700 (PDT)
Received: from debian (2a01cb05923c9a0070912cd5af4725fd.ipv6.abo.wanadoo.fr. [2a01:cb05:923c:9a00:7091:2cd5:af47:25fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4214664sm47282025e9.4.2026.03.18.02.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:49:23 -0700 (PDT)
Date: Wed, 18 Mar 2026 10:49:21 +0100
From: Guillaume Nault <gnault@redhat.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Martin Olivier <martin.olivier@live.fr>, netdev@vger.kernel.org,
	linux-ppp@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linux-kernel@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH net-next v2] ppp: add IFLA_PPP_UNIT netlink attribute
Message-ID: <abp1Ie88QmHthYkR@debian>
References: <PAWP192MB2411A808BB36F0086A9B00B99742A@PAWP192MB2411.EURP192.PROD.OUTLOOK.COM>
 <20260318015937.239409-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318015937.239409-1-dqfext@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-429-lists,linux-ppp=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[live.fr,vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gnault@redhat.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BA7E32B9738
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 09:59:29AM +0800, Qingfang Deng wrote:
> On Sat, 14 Mar 2026 02:14:29 +0100, Martin Olivier wrote:
> > Currently, the PPP rtnetlink API allows creating a new network interface
> > with a custom ifname, but it lacks the ability to specify a custom PPP
> > unit id.
> > 
> > Setting a specific unit id is currently only possible with the
> > PPPIOCNEWUNIT ioctl. If a user-space program also requires a custom
> > interface name, it must create the interface first with PPPIOCNEWUNIT
> > and then rename it.
> > 
> > Resolve this by introducing the IFLA_PPP_UNIT netlink attribute. This
> > allows user-space programs to atomically request both a custom ifname
> > and a specific PPP unit id during the RTM_NEWLINK creation process,
> > eliminating the post-creation renaming for this use case.
> > 
> > Signed-off-by: Martin Olivier <martin.olivier@live.fr>
> > ---
> > Changes in v2:
> > - use nl policy to set IFLA_PPP_UNIT min allowed value instead of a manual check in ppp_nl_validate()
> > - use of nla_get_s32_default() to collect IFLA_PPP_UNIT value
> > Link to v1: https://lore.kernel.org/netdev/PAWP192MB2411A5E7D3BE1B55E155A92F9747A@PAWP192MB2411.EURP192.PROD.OUTLOOK.COM/
> 
> The patch itself looks good to me, but I would like to check the
> userspace changes too. Please create a pull request at
> https://github.com/ppp-project/ppp/pulls
> 
> +Cc: Paul Mackerras, Guillaume Nault, Pali Rohár

As far as I understand, the original ioctl API allowed setting the unit
id for only one reason: to allow userspace to influence the name of the
ppp device to be created.

The netlink interface on the other hand already allows to set the
device name, without needing to play with the unit id. So what's the
use case for setting the unit id with netlink?

> Regards,
> Qingfang
> 


