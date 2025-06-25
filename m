Return-Path: <linux-ppp+bounces-306-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8DDAE79A4
	for <lists+linux-ppp@lfdr.de>; Wed, 25 Jun 2025 10:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08B427A2825
	for <lists+linux-ppp@lfdr.de>; Wed, 25 Jun 2025 08:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E46420CCE5;
	Wed, 25 Jun 2025 08:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ZqOItU6W"
X-Original-To: linux-ppp@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8506B72626;
	Wed, 25 Jun 2025 08:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839101; cv=none; b=Fc8oDOXApKM5mFuml/Acp36lusTwWi6odDhJTZZaSfCqIEmjlMVYFintGG6U0SaXSzEr2bX+sQbouBmA38an3Mdd3Xqgu41eykOgTlyPgu1v3d8aI5QXwx0/409HsUrm/VEbCCGRetFmi9UDhc38fCrpztXrs8iwbA8AG8efgDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839101; c=relaxed/simple;
	bh=jVuJDCIwDzf3NFdcFh/CU7NRT8EoqQ7c9r4TyfsvxxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TU536EIO4klH4Vsv2TJpF0BZQ4eHhamXfhUjN1xEOtwFZR5uMApfaIqVX0F1olo6GE+3WWdjJHbTZpcJQWRZe7svmIyfCNxwh8OQ5jc/v6iETM6BgeS6yh38M+hIC42bn+VTUb+IzhdE9gdm2jf1JgCOO66rDYwJULimNg8m+78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ZqOItU6W; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5ttrqB6Re8Lm6BJNJnP255dFExkdnIWrJLmm7SAWYcs=; b=ZqOItU6WkrfEMyogqc4WxVgWWn
	PeLARWQH5cvUgc9h4rXSpXSdvEjSA3CAoVUBBkatTDvamDq+DGHYYVJHpQgZbss9jxboLU02mvtBI
	8uoUqDafdWFmQvDdGQOmxYKKBn6KXn7ZM8p0KGbZQ5rUNNnR62gNNQATb7u+p+N362Gk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uULEF-00Gt2t-5K; Wed, 25 Jun 2025 10:11:35 +0200
Date: Wed, 25 Jun 2025 10:11:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guillaume Nault <gnault@redhat.com>
Subject: Re: [PATCH net-next 1/3] ppp: convert rlock to rwlock to improve RX
 concurrency
Message-ID: <224c4c68-6e6e-4109-9933-2ab1bdb5eedd@lunn.ch>
References: <20250625034021.3650359-1-dqfext@gmail.com>
 <20250625034021.3650359-2-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625034021.3650359-2-dqfext@gmail.com>

>  #define ppp_xmit_lock(ppp)	spin_lock_bh(&(ppp)->wlock)
>  #define ppp_xmit_unlock(ppp)	spin_unlock_bh(&(ppp)->wlock)
> -#define ppp_recv_lock(ppp)	spin_lock_bh(&(ppp)->rlock)
> -#define ppp_recv_unlock(ppp)	spin_unlock_bh(&(ppp)->rlock)
> +#define ppp_recv_lock(ppp)	write_lock_bh(&(ppp)->rlock)
> +#define ppp_recv_unlock(ppp)	write_unlock_bh(&(ppp)->rlock)
>  #define ppp_lock(ppp)		do { ppp_xmit_lock(ppp); \
>  				     ppp_recv_lock(ppp); } while (0)
>  #define ppp_unlock(ppp)		do { ppp_recv_unlock(ppp); \
>  				     ppp_xmit_unlock(ppp); } while (0)
> +#define ppp_recv_read_lock(ppp)		read_lock_bh(&(ppp)->rlock)
> +#define ppp_recv_read_unlock(ppp)	read_unlock_bh(&(ppp)->rlock)

Given the _read_ in ppp_recv_read_lock(), maybe ppp_recv_lock() should
be ppp_recv_write_lock()? Makes it symmetrical, and clearer there is a
read/write lock.

	Andrew

