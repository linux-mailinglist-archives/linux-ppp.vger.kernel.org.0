Return-Path: <linux-ppp+bounces-634-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uY3WLttNV2rGIwEAu9opvQ
	(envelope-from <linux-ppp+bounces-634-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 15 Jul 2026 11:07:39 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 320B375C3D3
	for <lists+linux-ppp@lfdr.de>; Wed, 15 Jul 2026 11:07:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=e67TCDDc;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-634-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-ppp+bounces-634-lists+linux-ppp=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6660311FB98
	for <lists+linux-ppp@lfdr.de>; Wed, 15 Jul 2026 08:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A6B3D8911;
	Wed, 15 Jul 2026 08:59:10 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAC23DA5DE
	for <linux-ppp@vger.kernel.org>; Wed, 15 Jul 2026 08:59:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105949; cv=pass; b=U35uaNYa8I9gsM7SlxFP9EG7uVVBAOH+FpRWvfxh8hTlxpZp+t4VrbsFblUpu9T8DHILTrNIVl4XAFcRBjeNCIB7h9Hf0urwXZusou+2dlOQjzh/uo+nZJWLXGS8w3ZJE/MwnfFEQoskdTrZIEofTeufCCtGIu6qHmwiOS7pWGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105949; c=relaxed/simple;
	bh=Dre0rhAOMbA2vc6z96CSk0Yv6aG6tGAoHo0wVAUQlvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMNSZx8LT55JIBq5OPxhyXFzAOx5QCJLKNc6h0CoCdu/wbzXPORCZe+gSMNg1L5eiRJvLQXQlQt0JcGYS4dAqGaJ3L81x5OIVM8T4Xn7PhdpMW+JBtpHFQaIePjINd4NscFhNlcaxyOHhkAQl18d3GnkQTvU0vhKPqe7Y7aQOQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e67TCDDc; arc=pass smtp.client-ip=209.85.218.47
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15c42a45adso66161266b.0
        for <linux-ppp@vger.kernel.org>; Wed, 15 Jul 2026 01:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784105946; cv=none;
        d=google.com; s=arc-20260327;
        b=alwsLRj5EIvRQlJKzLrq8fbETjI2uVyiWUHdbp0+fcp/08R6HIrDjCNV6yW3A9dXzD
         +tfvuclPHXzQosd0MpbeDDNwBh2lKaneEcn9sRpBeyU3pQvmPYMBm+jkeJ1RBWQrVpTu
         nDhZOygnqmQdttO8OWLp0clkjH0Pj0DsJIgBj7c29fmpIIKA8iibV15HJAl9+u+re5DJ
         2XsDVO+IVpK6dN10BB83oAUqsV5prCPkJWy9+nfD5g+NxrSZkqi3Y5tFs7UrzQhUHQTN
         JeoMgd8+ypvOf4w95mM08t67CQAV8HLQ2qjya+rSR/pGB/w7So6QHfrVqsCjUS38euC/
         Zcog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Dre0rhAOMbA2vc6z96CSk0Yv6aG6tGAoHo0wVAUQlvI=;
        fh=zAbu8LYUuETY2znz5ZUOvZ12Bmqa/1dMk4bZEuicybQ=;
        b=r8dZQkJmqUnztXHumFQg4bw0EGUxrdZ1EhIqdBDqdgjNALENV0etOu4K3k3teUKoro
         Sr86DdP/Vz96nIzY45CWPS+STFmLfU0aszmC+mpZ+w+jpaWHxk9bQXDMxYMrgMVMA6jK
         JWbi5pg1jVqvI2eufeY5bCoCuVL0dcaKvxYEUR/V4Puxsl+2jJ81NI5Vr0QsIVcGeeCr
         /BN37AykUmpUZsIydn56/R//S/tj+OdpRwGwCqje6zXlXvT7x+OrozpazF5VDlZS7fHc
         Agjs3Eeqo3khrh57jaa8/01IFq9zVE09VHwFgxVun25u8vQa3TgrmFilgzmiDzaHUDD5
         /dQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784105946; x=1784710746; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dre0rhAOMbA2vc6z96CSk0Yv6aG6tGAoHo0wVAUQlvI=;
        b=e67TCDDccA9L7FuOu57iyIsXtR2nSVBTFjv19s3OCw7pWt0ld/RGFiFwgRFhmpWHny
         uGGCnNnTUVo+6z/Z+i677cMDnWNb+iAB0xZMhJqk7vegolSWIBdxV6CNJcsRvovxjOOv
         V9/TKnE8BNkFZrYnizGSuJDqsXJYKR/1zFGoHmy+hkh4OfrFqBdp2j07EMVXhsmbaScp
         eUs5InN0suxRZBpxm37M6E+vuU3DU/1yvmU7siCzWGAUo1prFZnC6M26BvzFiaGPeRCu
         evehc++O9PeBasauBNDSWog16q0r++L6sawu9Ef/CZfEuDdoGrVA/OUz7EBDAXh2QzFK
         vnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105946; x=1784710746;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dre0rhAOMbA2vc6z96CSk0Yv6aG6tGAoHo0wVAUQlvI=;
        b=KpXaSVzahO7ObFP50NsYNNkkoOjVrpgSOFrrPBWscg4LLtIsI6/58jOfJ6fCNFtYV4
         y78Z4VnW6baKYKEesDMtOmR/BI4+j8Ho2SsLRi1iYGBlKT5u9sxyqCWMSGfWUpOYoPKq
         OtPTbA8vtaHZlrtsfR7MEWTmnMl+YSgnB6DL6Jo+eskLVhji0Uaql6lViVHzqJ0uz3SJ
         3KC1D9S6xA+XTOdiRPm1iEIyZ7QSV9UHFdrJ2wLeTtPuDIpzM2cDOTq1PK3yiNvllJdv
         eZK/cKe3pvfaNdbhLZ5KEXhFbouMNSEUbVhD6xCb5kuS5VhWBo0/EVTA6He5/V61OAq8
         5uZw==
X-Forwarded-Encrypted: i=1; AHgh+Rqtw+IxYxLYHOefYTwq+LwLgwg2WuvDt9CW1B3M/+1oIBbZBLVlHnWt6jcHxPTvLAX5Bc/1sJBIzUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YymcrZOBVnUuIAK7AP3wX0UUTalZmuyFSwQ2hF0yCs4tLoGjZa5
	eR8XFANCIAlyQRBmWT80JZRl7+PF6ERe/Yom4PsN5fJKfUQHEWHLCKMy6fHak7RiOljjyCxYy6F
	QoGUve/fQotO9vhp1Uun+UXbm6yXGsf8=
X-Gm-Gg: AfdE7cm8NrQ8vuCtJixepvMHdvnL4uFRWjc99BERrS4wkfjNG5J0IYLiMAFMyqC/XVM
	x6ywk0M796zcqfS5QpxfjBth+gqJs6+phyUVhId7RXcyKgpNhRSTlQIuvMLHlcRmNa/LvETFn5M
	mB9nj7SB8Mz7GIhz//OzrxqmTnJ7b6BdgVGIWnuNCBnUDsuH3bsuLwbF/JaB/f7zFwDKEntHsxq
	FA1nLgLAUdEN5ml+kLvTclnvmKP+JPcNuOCiUiP1lBCOTlXkKsLQFJV7wLREmBoR4PCaaA=
X-Received: by 2002:a17:906:2443:b0:c12:707a:8372 with SMTP id
 a640c23a62f3a-c161e992d2cmr680722966b.21.1784105945500; Wed, 15 Jul 2026
 01:59:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714091941.33783-1-running910@gmail.com> <e07c280b-d3a8-442d-bf19-f00d544ab26c@linux.dev>
In-Reply-To: <e07c280b-d3a8-442d-bf19-f00d544ab26c@linux.dev>
From: Zhixing Chen <running910@gmail.com>
Date: Wed, 15 Jul 2026 16:58:53 +0800
X-Gm-Features: AUfX_myTUoJp1A8VmbhBzNhWx8N3kj5HpN3fRLOHmuaZlWQoHn4_65qgWOT00kM
Message-ID: <CAMyuFdXdYWyHwYRBQb66GWycWZ=ZYXaca664Cq_TCNuhuKk0ew@mail.gmail.com>
Subject: Re: [PATCH net-next] ppp: reuse ppp_get_stats64() for ioctl stats
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-634-lists,linux-ppp=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[running910@gmail.com,linux-ppp@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qingfang.deng@linux.dev,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-ppp@vger.kernel.org,m:netdev@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[running910@gmail.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 320B375C3D3

Hi Qingfang,

Thanks a lot for pointing this out.

> On a 32-bit architecture, this will introduce unnecessary seqlock
> overhead to get the upper 32-bit of a counter, which would then be
> immediately discarded.

That makes sense. I missed that reusing ppp_get_stats64() would add
unnecessary 64-bit stats read overhead on 32-bit architectures, while the
ioctl path only returns 32-bit counters. I agree this is not a good
trade-off for a cleanup.

Please ignore this patch.

Thanks again,
Zhixing

