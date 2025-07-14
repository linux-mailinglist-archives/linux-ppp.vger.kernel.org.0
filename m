Return-Path: <linux-ppp+bounces-320-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FC8B04519
	for <lists+linux-ppp@lfdr.de>; Mon, 14 Jul 2025 18:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C7E0172C9D
	for <lists+linux-ppp@lfdr.de>; Mon, 14 Jul 2025 16:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE5325EF81;
	Mon, 14 Jul 2025 16:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KdwecsAf"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA5023D280
	for <linux-ppp@vger.kernel.org>; Mon, 14 Jul 2025 16:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752509457; cv=none; b=HQdsvkgDPKWfZoUQNJb0Cd3Baf6hyjJb7ta+7gTFLcIDRFGaHvf4DTfxLsm70m2tf8Zc9KQjVa8fAOJjGNmtG5P2Iq4Nugtr9WOyQwrCuZj9m1CUPuy5s8xkhCMb/NaN3Ff/2+/9XAZW2rCgIZBAld2FnDIzLULomNb28qiPKCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752509457; c=relaxed/simple;
	bh=TXBhF2hsvFF6n7aCSxrTP5ln0Far7SI/YRoW6S4tmUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCNI4gnmvGbK9PUz2xf4HJAZLpfLdjbzLd4PKg+dGHaP+EhWFU1SLJe3abSXbblWhUwAigPdec7MnOIL4XN3VwYedcbCSZ6gvZ4vHkTEYWUuLQhf9vAjHYewy0s/hH+hYOPJ3MDVE/Ahd0UeFyUln/O7lg6QwOXdbX7Yg49wScA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KdwecsAf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752509454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hJded38NkCminVRmf+Vkk9veSOaA59XspWkWKEaxDxE=;
	b=KdwecsAf6q0sIAJ+X1HSh/+ILubUlJ9VpzrSCpb1PhDJUldNvVaCAbFK0TQq4KkY3RdEn9
	O2fmoxsXgLWEg33sxTMvf9TS5PkYLEGMyE+kH3K1akHukSza+M2ZvZWeRw+0KcGJwE34dA
	CFmHkpFqjvxlMuwwHaI2FQl/7owzGZs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-biWYoCk-OKmZ8xFhzE3XiA-1; Mon, 14 Jul 2025 12:10:53 -0400
X-MC-Unique: biWYoCk-OKmZ8xFhzE3XiA-1
X-Mimecast-MFC-AGG-ID: biWYoCk-OKmZ8xFhzE3XiA_1752509452
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45597cc95d5so16942295e9.1
        for <linux-ppp@vger.kernel.org>; Mon, 14 Jul 2025 09:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752509452; x=1753114252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJded38NkCminVRmf+Vkk9veSOaA59XspWkWKEaxDxE=;
        b=wMb87W8S1yWAVTP3SyPumrmmX3Q+RmXOS5KnrAZI/eLEwRa/2tib2YEKg3uf5vpNBc
         7y64EB9NgZHhMJ7EDYX3cAcP96fD0cuyzhSPAftUBXrC8vVxYumpQlWZtfbeU/YfO3Jz
         c7csfA3+kn/gSsAQPGSfI6kJUrCrbBTFEEt7d5oBLnBGI5SoyxW3ohLdGTOhSXG6hbNA
         QNOugE7AMIVRES1vVNglAE9X0YlM1mk4J4x8DRoc5gHXsRWYy9xxPc/ie5BDQahKzdic
         2R6AOIZUKc6aY6KkFzgKaZpC1doZXu100wNqjyiGm+9K6hkAD1DyrKo/+AuT/YZlB/o9
         EeBw==
X-Forwarded-Encrypted: i=1; AJvYcCXXukGl7TE8SaKLv9ubvSCOKdoNGZx+/zZEnKK3JXFI0JXsTst3gYbep8RlpvgaumpEQiE/LTGViWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrOVI1MkcvZ+E5m3PulDxlOuIQrjezZoGp6mMbn02Ho1KFIb+r
	q2PwltN1+4/m1tmfvMSFZcrFc2KHHjBK4rquXOcepy4MINu5HGOsuCyOOVf9w6QRpQLbawY3wR5
	b+/gqfneVUoSvX9iwZH1UpCcCh4FH2e/0Dr8USBCug5zcDMG8T4UlCFMP7JGmVA==
X-Gm-Gg: ASbGncur1qD9HulTzkWcf5gYB3UO6ioJZhD3hvXTQFHnCFZYM7egpocnlHWDFadPQFj
	BKBLVRrw9PhBqaKMXvU0v+6XAke89Hxe4RTrmvzTTnSAPJXi/tVncbS9jRXvh2EprYAXiKutf1h
	M2d3q0eaGVSKj9tGV/B7+CZNmNDpz/xaUcD2U8D0F5+HTMh/PKXxxkmqBa+zWk7Mj43QHONvLGP
	3sxuUOxZ0RDZkHc5F+KutEio430ErzGlOuJWR7hhCgW1bEkzJqfre5lG6c/qeYGqahq7+6B4oLf
	d6MQbmuLCE2ietabTX1+/ZjRzGw=
X-Received: by 2002:a05:600c:1e04:b0:456:c48:491f with SMTP id 5b1f17b1804b1-4560c484fbbmr93343535e9.10.1752509451774;
        Mon, 14 Jul 2025 09:10:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu0KDsL3bCGkwFYj1hHtAGF4TYYoQuLK07nUMMS0J4mW+mZWbbAYRS4px+NSDCrvU4TmUMTA==
X-Received: by 2002:a05:600c:1e04:b0:456:c48:491f with SMTP id 5b1f17b1804b1-4560c484fbbmr93343185e9.10.1752509451327;
        Mon, 14 Jul 2025 09:10:51 -0700 (PDT)
Received: from debian ([2001:4649:f075:0:a45e:6b9:73fc:f9aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45623f4f838sm5268045e9.1.2025.07.14.09.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:10:50 -0700 (PDT)
Date: Mon, 14 Jul 2025 18:10:47 +0200
From: Guillaume Nault <gnault@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: netdev@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	linux-ppp@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Williams <clrkwllms@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH net-next v2 1/1] ppp: Replace per-CPU recursion counter
 with lock-owner field
Message-ID: <aHUsB04j+uFrUkpd@debian>
References: <20250710162403.402739-1-bigeasy@linutronix.de>
 <20250710162403.402739-2-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710162403.402739-2-bigeasy@linutronix.de>

On Thu, Jul 10, 2025 at 06:24:03PM +0200, Sebastian Andrzej Siewior wrote:
> The per-CPU variable ppp::xmit_recursion is protecting against recursion
> due to wrong configuration of the ppp channels. The per-CPU variable

I'd rather say that it's the ppp unit that is badly configured: it's
the ppp unit that can creates the loop (as it creates a networking
interface).

> relies on disabled BH for its locking. Without per-CPU locking in
> local_bh_disable() on PREEMPT_RT this data structure requires explicit
> locking.
> 
> The ppp::xmit_recursion is used as a per-CPU boolean. The counter is
> checked early in the send routing and the transmit path is only entered
> if the counter is zero. Then the counter is incremented to avoid
> recursion. It used to detect recursion on channel::downl and
> ppp::wlock.
> 
> Create a struct ppp_xmit_recursion and move the counter into it.
> Add local_lock_t to the struct and use local_lock_nested_bh() for
> locking. Due to possible nesting, the lock cannot be acquired
> unconditionally but it requires an owner field to identify recursion
> before attempting to acquire the lock.
> 
> The counter is incremented and checked only after the lock is acquired.
> Since it functions as a boolean rather than a count, and its role is now
> superseded by the owner field, it can be safely removed.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/net/ppp/ppp_generic.c | 38 ++++++++++++++++++++++++++---------
>  1 file changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index def84e87e05b2..0edc916e0a411 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -119,6 +119,11 @@ struct ppp_link_stats {
>  	u64 tx_bytes;
>  };
>  
> +struct ppp_xmit_recursion {
> +	struct task_struct *owner;
> +	local_lock_t bh_lock;
> +};
> +

This hunk conflicts with latest changes in net-next.

Apart from the two minor comments above, the patch looks good to me.
Thanks!


