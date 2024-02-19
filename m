Return-Path: <linux-ppp+bounces-25-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B1485A244
	for <lists+linux-ppp@lfdr.de>; Mon, 19 Feb 2024 12:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 278A41C20939
	for <lists+linux-ppp@lfdr.de>; Mon, 19 Feb 2024 11:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847F02C69E;
	Mon, 19 Feb 2024 11:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VmUl9kdh"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B3428E09
	for <linux-ppp@vger.kernel.org>; Mon, 19 Feb 2024 11:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708343067; cv=none; b=tktw1IeD/OQrsE80QUKnbfufoWPW1XEdXGgs08JjtWHmoyz58z5KDvogUVXpaQCNqA2fd/9oZKr3JQpahK7mt+RBELBQYXdrfYO3vPdPdbfqZei7y2kJ/yyyxjZlFnuMm4FfKmLKmp94PWst33OsgWppCsobNoNoh5gGYtYUrZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708343067; c=relaxed/simple;
	bh=gUntlLLADUk9fOwIp7/2ak+sHS72oT6rdDnXj0smozo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=csP3n2F30MLNio+kBbE09ebFZiQVFXR2EYUVH3fEFDTRwMc+eXYS6YYTRgBteivXxQkxa4QettPG2wdpiWtmcsYvAEylQ8LcRK3Y2FdRwBoXNJj7txexesrfUl5eU61qBBJ8Lw4XTw1sVR13CNE2534Oexwfn7gUMpgMhy8/W6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VmUl9kdh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708343064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gUntlLLADUk9fOwIp7/2ak+sHS72oT6rdDnXj0smozo=;
	b=VmUl9kdhUJbqQz6ztop1rq5ZFSDEZ6DuJblj3PLkvPejDWgcZ84sqzy7ixwezOiyXyksSE
	yR2lOwQ7EqMKc/6xH0CNCElKDkbOUDf4G5ZZvwmYdyok/Izx1XljGPdaOEqnsL8LgXds5T
	xn4zxYQoLDKf5QvwRnsRMvykYeyBLTc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-Io9MaMZSOOGNrIZV5Bciuw-1; Mon, 19 Feb 2024 06:44:23 -0500
X-MC-Unique: Io9MaMZSOOGNrIZV5Bciuw-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6800a9505ddso75173476d6.3
        for <linux-ppp@vger.kernel.org>; Mon, 19 Feb 2024 03:44:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708343063; x=1708947863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUntlLLADUk9fOwIp7/2ak+sHS72oT6rdDnXj0smozo=;
        b=UiEC7s7QQmAikJ7DY6ltcXoNvQKaP9KdEBQzrBtKoNIeJy2h8QpvYfSd5dhJYR5sju
         IKxpUKEINOzpyxHV07XD6CwvanJM1GEZIh2LFLg9rLDh20sDR3Xu9HDKvbwmVIGROp9x
         XbwLOCICdfRReoF0TLGjL8Y9zdlDy4fuj/v8URpCUlZLyayS/wBdY7MTBphL7Qpy5RI5
         bRKFzYPGf+mY/OZtAolEpdzqh6RxtaQZh+Wf8TwzZFEzBwVWwzFpGHnwMsg6c5cjaPSy
         sulDAt5+xmzMl7tOkdiMFZqRQkfHao2TQl5Ckr6L7m6eJAFeHG5lQdPnyJCyz3ey0//0
         vZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCW9fHCHGutxlpyhhUr368qL8lLYjsOI3aOKVj1I+2wlFFLVVgREbtUTYUz5wzxKN5iJI4cePfqTFOYUaNZdQ7K+HPcPq0DLMzEV
X-Gm-Message-State: AOJu0Yxs+zuqU1MpEVq/3kzB/4+UtkxG6UFcGib+Ux98NpQ+qqct0J+m
	CRMI05m+oX1SF8emSZgTE3Rb8jWMrzzxjnGW6aOkMaMIHsFgvVypKCHYnDdZGOI1TYuLgNwp6SY
	F1Fd3yISADPKnlpymay/kN1r+1g8chKSMX1lw6PHZyOZ3g5S7AMXp2bACeg==
X-Received: by 2002:ad4:5d69:0:b0:68f:4645:8cad with SMTP id fn9-20020ad45d69000000b0068f46458cadmr2351892qvb.57.1708343063343;
        Mon, 19 Feb 2024 03:44:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLbhd1hRBa1Vi4h+/NrkLkws+Hyd7ejD07jtvzpsrfiTatFhwS2ruE/0PimVLy9ybIJlmUWQ==
X-Received: by 2002:ad4:5d69:0:b0:68f:4645:8cad with SMTP id fn9-20020ad45d69000000b0068f46458cadmr2351886qvb.57.1708343063103;
        Mon, 19 Feb 2024 03:44:23 -0800 (PST)
Received: from debian (2a01cb058d23d600e55283140c56efd3.ipv6.abo.wanadoo.fr. [2a01:cb05:8d23:d600:e552:8314:c56:efd3])
        by smtp.gmail.com with ESMTPSA id d11-20020a05621416cb00b0068d11cf887bsm3121135qvz.55.2024.02.19.03.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 03:44:22 -0800 (PST)
Date: Mon, 19 Feb 2024 12:44:18 +0100
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
Subject: Re: [PATCH 05/12] net: ppp: constify the struct device_type usage
Message-ID: <ZdM/EjzGrmdGIpvg@debian>
References: <20240217-device_cleanup-net-v1-0-1eb31fb689f7@marliere.net>
 <20240217-device_cleanup-net-v1-5-1eb31fb689f7@marliere.net>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240217-device_cleanup-net-v1-5-1eb31fb689f7@marliere.net>

On Sat, Feb 17, 2024 at 05:13:27PM -0300, Ricardo B. Marliere wrote:
> Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
> core can properly handle constant struct device_type. Move the ppp_type
> variable to be a constant structure as well, placing it into read-only
> memory which can not be modified at runtime.

Reviewed-by: Guillaume Nault <gnault@redhat.com>


