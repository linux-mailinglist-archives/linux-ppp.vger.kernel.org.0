Return-Path: <linux-ppp+bounces-24-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4597285A241
	for <lists+linux-ppp@lfdr.de>; Mon, 19 Feb 2024 12:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC4F81F249CF
	for <lists+linux-ppp@lfdr.de>; Mon, 19 Feb 2024 11:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2192C857;
	Mon, 19 Feb 2024 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BzddOlzg"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA6B28E09
	for <linux-ppp@vger.kernel.org>; Mon, 19 Feb 2024 11:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708343021; cv=none; b=ofXThPblNeL7yzgXkGEY0AjTo/49Ob3aWS1Y1FK9vkYLHZMdF5lslTVShR6MLvfhFlCRCx7yuxf4Pn262omIYbe0TQGYr1OXKUAGzL+Hu604FDwCw82Y15MYXy3veJ8m3ITVdq4c2ycfxm4K1z5nGqWI/S879Oxb/zSjfDCKdVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708343021; c=relaxed/simple;
	bh=UT1lPa/2yb85M5r4o3D5dus2HraX5x5mzr0FhmB6TGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jgYN6oo2VL/FVIV3WnsioxCJenCqA+upnnjKJTkQfIQ6SnxYk3zddOTs6UMsSmy48vNn4q1RK++sa7E96LUiEJQJ6NrSh7KUpNVwuFg/85f7yICQYznB8E+nkDQlqzid07eDxfmQfA6aNkvgrzkhslhdtCc6xJfArYdfyG3Y8iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BzddOlzg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708343017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UT1lPa/2yb85M5r4o3D5dus2HraX5x5mzr0FhmB6TGc=;
	b=BzddOlzg6j9TlmdTRLejMmv7U9U21i9uGd98fsVZd3pFR0a/jMlD1BI6TNZ8rkCYbKZUsN
	kIp8EpbJY6VlcuMQUC/YMu7TgCO9oGP+fugQ5ckXVXuNdf7B0Mxp/mKCu+kxry2hYW12lO
	8qeWVsgvtvJb0j84Og3yHmz3QsfrmWM=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-h3LohznzM6G6ejzUIVYozQ-1; Mon, 19 Feb 2024 06:43:36 -0500
X-MC-Unique: h3LohznzM6G6ejzUIVYozQ-1
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-7d2d72f7965so1952010241.2
        for <linux-ppp@vger.kernel.org>; Mon, 19 Feb 2024 03:43:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708343016; x=1708947816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UT1lPa/2yb85M5r4o3D5dus2HraX5x5mzr0FhmB6TGc=;
        b=xReJX8PewL9lUxbY+BF6M7Ol4DN5DEbEtOtE/rXh1OClU+Xbq7Ku7L71f2inydTgzb
         wrCweNzR4eONCZiDKPX4ZXpQRwATgpqFljqa7ujdHSqn0IT4z//9NyrXZUr4duDxr/cF
         J3UMnM0Va+aLkNdDDXEJcYEdzNGSp8nV9tGmr0W2aigeUrRj4dYeKexeMvMOlBWX73GC
         OzkkJUFKyX1icW8oBW6KWugqfS9/vyRU+4v50KNlSdJ9FjC2vA253hFdkUFpG/EFqqEb
         vLcfrA8FSKofznhUObRNT1jH3VLILDSKuXG+29zEjwMqlU7TqSv6v6IC4cmfXQ2PBO5T
         Wbyg==
X-Forwarded-Encrypted: i=1; AJvYcCWha8qZUBh84E22nPF2H05xbB0KpZQhtOBkqiTW3ejLDfSDWp63KAD029depkxwjE6YpcW2SeVqo1AaEpLIiXcu/Mkx4FsMBmhn
X-Gm-Message-State: AOJu0YwPNRMEap4TF95OnLMvosQV3gdMj99wr95pHmExUgIqj4tA0IM+
	E38SAS62hsUGKxkNf1qFUW9sttBMO6PviPxq1hxED80YXnD7CEpMaGP1cBLiVul9kSqy4wWovmb
	2uzG4Q1gNnW1BWX85+0ADhsy2dcOO5fWuVsvUIDwhpsDOy9b1w8sDUmZ89w==
X-Received: by 2002:a05:6102:c4f:b0:470:5d2b:d3af with SMTP id y15-20020a0561020c4f00b004705d2bd3afmr1232155vss.32.1708343015888;
        Mon, 19 Feb 2024 03:43:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcM4hsvYF0Fkc6wNPR39b7BLYIzpcoNtkCS5Zhj9FBZ5j1bMr2hWobtFDKi/HpuXRX7eZKug==
X-Received: by 2002:a05:6102:c4f:b0:470:5d2b:d3af with SMTP id y15-20020a0561020c4f00b004705d2bd3afmr1232149vss.32.1708343015592;
        Mon, 19 Feb 2024 03:43:35 -0800 (PST)
Received: from debian (2a01cb058d23d600e55283140c56efd3.ipv6.abo.wanadoo.fr. [2a01:cb05:8d23:d600:e552:8314:c56:efd3])
        by smtp.gmail.com with ESMTPSA id kk12-20020a05622a2c0c00b0042c7145fd19sm2473479qtb.12.2024.02.19.03.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 03:43:35 -0800 (PST)
Date: Mon, 19 Feb 2024 12:43:30 +0100
From: Guillaume Nault <gnault@redhat.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Oliver Neukum <oneukum@suse.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	bridge@lists.linux.dev, linux-ppp@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 04/12] net: vxlan: constify the struct device_type usage
Message-ID: <ZdM+4uKE83V2j4o8@debian>
References: <20240217-device_cleanup-net-v1-0-1eb31fb689f7@marliere.net>
 <20240217-device_cleanup-net-v1-4-1eb31fb689f7@marliere.net>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240217-device_cleanup-net-v1-4-1eb31fb689f7@marliere.net>

On Sat, Feb 17, 2024 at 05:13:26PM -0300, Ricardo B. Marliere wrote:
> Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
> core can properly handle constant struct device_type. Move the vxlan_type
> variable to be a constant structure as well, placing it into read-only
> memory which can not be modified at runtime.

Reviewed-by: Guillaume Nault <gnault@redhat.com>

Note: To help maintainers (and potentially reviewers) work please
write in the subject prefix which tree you're targetting. For this
series, it should be "[PATCH net-next xx/yy]".


