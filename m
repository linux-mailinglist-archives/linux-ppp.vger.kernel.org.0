Return-Path: <linux-ppp+bounces-276-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DE1A4BC3E
	for <lists+linux-ppp@lfdr.de>; Mon,  3 Mar 2025 11:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E53E116E8D2
	for <lists+linux-ppp@lfdr.de>; Mon,  3 Mar 2025 10:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA661F3BBF;
	Mon,  3 Mar 2025 10:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gp4f0Qjb"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BE21F2C5B
	for <linux-ppp@vger.kernel.org>; Mon,  3 Mar 2025 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740997737; cv=none; b=a4e/yXVjGJhtGQccUg7bGM4RDP5zYbZ7uxoKKdrT6gzO+smG+0+Vyg7yZy0f5yhSwMlBKRmPkoCSgNJHmAtCNrLiaEUrzDEqSkfWuukqTmHPTykyG/6E+nWKPfbVce2GYGzXq94462XHZRvNZneoSt9mstiN85AtzKCE1G1nGvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740997737; c=relaxed/simple;
	bh=srl1pIA+ThlTF11L33x8WkwY3Gi/4wZSgcLDLWp5Epw=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fsrKfn+y1cwERLZygPMf1e7pUjR8PjFxhEtDMMM6CterRZffhNkmhgZ+VV3xQj9/mXrzh876N3tcZHB3D52s0b3SctZRj5NB6bgQC5I9mSrch5M+iUZcgd6PXPbFOrPCfD1XNCudiQNV/J1vmtNderk3pNYMZCEI/nPbUi1fC5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gp4f0Qjb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740997734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=srl1pIA+ThlTF11L33x8WkwY3Gi/4wZSgcLDLWp5Epw=;
	b=Gp4f0QjbIP1Wn4qm3jDcmmevsaB6So37hMAeZzwwOlWIgDWKta6z0KvKjAYkwcgENOmTHU
	jKhmhF1wL+LUFvqgsE5f+I/CSjVOb0gm8+h+xVNJYaMTJMWsUosEzIV7KH0KeEG3pjvHzu
	g1RJvYPmY7I72t0PHydJ1tkxE9RfHPw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-_1EYnoyUOIm7dXJmVMx-uQ-1; Mon, 03 Mar 2025 05:28:43 -0500
X-MC-Unique: _1EYnoyUOIm7dXJmVMx-uQ-1
X-Mimecast-MFC-AGG-ID: _1EYnoyUOIm7dXJmVMx-uQ_1740997722
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac1dca8720cso58380966b.0
        for <linux-ppp@vger.kernel.org>; Mon, 03 Mar 2025 02:28:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740997722; x=1741602522;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=srl1pIA+ThlTF11L33x8WkwY3Gi/4wZSgcLDLWp5Epw=;
        b=rDdcfHPWI5xYswjOla19vrPKZb/W1+XBrNcmKH7tLp+MNcXekwLzQfTn2uKmAf4R4d
         jm7vFHX2F9AT/xbJGJZGztNiTPhn8Sddn0BqEBh3qWd/PdaviwvKAJgtQQmH1eRfgEIg
         OwdoFK9fynIF1LE7rusU6vLSiJr5CRVsDaGt4vdRMcJLyOWqkUduzoXLH1NExL6Cq9fL
         GsolRiD8t6pb4Gyruj6Z8hCPoMfMazrZ+TFMqezdv42USWIqR8INRo16OlvO8Qc+MAe+
         a7KdtvyfV9ptC6AL0UHhLW4kyMA4UY1UhLImd93ivlkAWT53FKGk1T/a/EnAvn+Fq7LN
         6gKA==
X-Forwarded-Encrypted: i=1; AJvYcCWgt9nyXk3isrYzkqdFdsW+3ZNjEGWBd19YiU3hvFT94l7ciymXxaDuts/dXIpuP9dhMhSik+lCeEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXod0cXF/7vxoApv3OnB5rzsCrz7XKxc9hmXUm3RhoDN75tmCE
	SJ88vfISLuG09TMgsykT+KjACN5xFNY76JpkJIbW2F80Ov/j/X8e61OFn1JOlptaygOKzP5+MKl
	5TzrRztPql/jeyJI15C/KPBV0sIMFIQkPScG5/IbjU2g5e6BxC0MztOrfWw==
X-Gm-Gg: ASbGncvnUy55xIzotKxG2JAgeXHHb8tNGtZKJqEYwbzDXvvXY2ntAqCRDPM2D146P8/
	MxrC3KX8uatMrxCkQ832U5YkEFKL1qufaHSsYLPf5H6fzBI3zL6CEVk9DzCDPLVzKPKs9wjI6DC
	YOIHxpXgDuugsYpVunKf+6Ui8vk6WqlMJoeaQt8iUjBKtR7dv3F97Yvbivmi/m5pqzm5zJ9nqgJ
	YUHEpFaQ1wqtdYZOPm1PCKm+OTyeGZ7R9ajCOErLndhaTLXlP5AWAlg1H7e9HnroIJ3NDye39FJ
	OUdgLOwU/IB4
X-Received: by 2002:a17:907:6a0e:b0:abf:4ca9:55ff with SMTP id a640c23a62f3a-abf4ca9583dmr1015487566b.32.1740997721884;
        Mon, 03 Mar 2025 02:28:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7aUVBrdX1KlvAg+sycMlUbpc7AuA9RpLTN4rd3uI2Rj9vDiIS1Rku9nxqomui03mBJPMx3Q==
X-Received: by 2002:a17:907:6a0e:b0:abf:4ca9:55ff with SMTP id a640c23a62f3a-abf4ca9583dmr1015485966b.32.1740997721466;
        Mon, 03 Mar 2025 02:28:41 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1debb25adsm77555966b.106.2025.03.03.02.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 02:28:40 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id B0A1F18B6F1E; Mon, 03 Mar 2025 11:28:39 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Qingfang Deng <dqfext@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Michal Ostrowski <mostrows@earthlink.net>, James
 Chapman <jchapman@katalix.com>, Simon Horman <horms@kernel.org>,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] ppp: use IFF_NO_QUEUE in virtual interfaces
In-Reply-To: <20250301135517.695809-1-dqfext@gmail.com>
References: <20250301135517.695809-1-dqfext@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Mon, 03 Mar 2025 11:28:39 +0100
Message-ID: <87mse2z9uw.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Qingfang Deng <dqfext@gmail.com> writes:

> For PPPoE, PPTP, and PPPoL2TP, the start_xmit() function directly
> forwards packets to the underlying network stack and never returns
> anything other than 1. So these interfaces do not require a qdisc,
> and the IFF_NO_QUEUE flag should be set.
>
> Introduces a direct_xmit flag in struct ppp_channel to indicate when
> IFF_NO_QUEUE should be applied. The flag is set in ppp_connect_channel()
> for relevant protocols.
>
> While at it, remove the usused latency member from struct ppp_channel.
>
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>


