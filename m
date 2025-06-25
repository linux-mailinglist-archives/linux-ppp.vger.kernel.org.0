Return-Path: <linux-ppp+bounces-307-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04560AE79C7
	for <lists+linux-ppp@lfdr.de>; Wed, 25 Jun 2025 10:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B12E4A1941
	for <lists+linux-ppp@lfdr.de>; Wed, 25 Jun 2025 08:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EEF521171B;
	Wed, 25 Jun 2025 08:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="BnFbIaq6"
X-Original-To: linux-ppp@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6414D211290;
	Wed, 25 Jun 2025 08:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839389; cv=none; b=BVQ7q+ZKvg2QZZHQiHaSVUJ3c2ruHvkPjaYnK9CAs1FB8qtZMtfkCYb2pAlsVLU+qJGvJDnKh97dTbz50LPbf0N/qCFxdLNUmBqAavpPUSaqGjKYPAkk7SrokVJvwAwv7YIdgaHUGVNwbvA2Y37Ujp9M05X5NYCScStG4Hak0/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839389; c=relaxed/simple;
	bh=Tq7JiNhUc/TmZgnGqkVm2S6PN6rdSjbPFvW/AHOLB8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIppNeWXzNxeV5KsL8wuufaAnJJSxq/bw4KUyoSas+5gXfpdxraaHe0H6vlei0Nun2tQvB57hUjlC2wCxhyv5qNYE5BKNXQUEKWfBkkgx8j0dSRvWgTZVzUWGxSLQWS/nMHYq0xUKeLRZQkJ25ABaPd0eGdv8TU0WY/r4Uik1Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=BnFbIaq6; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Kmzfb1nkzdrlqwAWTt9ms5w6okRVCGLkfGIvWoO8lgk=; b=BnFbIaq61VP2otrUASU7ANP7VN
	8pPOx63R9LzJZ3WSQHnuS7afqC47qBYFhRwU4N59Ih0Hi2pzn+Z4h51OXEZS62lRZkkP3as6oxssY
	T8Wo2vKbk2mlfxKNoZMnVdsdcFQIZw6wVP+VXmNZz3qxunn/iPQ9SBSQyFmJKdMPrdPs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uULIu-00Gt4U-7j; Wed, 25 Jun 2025 10:16:24 +0200
Date: Wed, 25 Jun 2025 10:16:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guillaume Nault <gnault@redhat.com>
Subject: Re: [PATCH net-next 3/3] ppp: synchronize netstats updates
Message-ID: <e6110e8c-34cb-4152-8fce-4de7675b639d@lunn.ch>
References: <20250625034021.3650359-1-dqfext@gmail.com>
 <20250625034021.3650359-4-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625034021.3650359-4-dqfext@gmail.com>

On Wed, Jun 25, 2025 at 11:40:20AM +0800, Qingfang Deng wrote:
> The PPP receive path can now run concurrently across CPUs (after converting
> rlock to rwlock in an earlier patch). This may lead to data races on
> net_device->stats.
> 
> Convert all stats updates in both transmit and receive paths to use the
> DEV_STATS_INC() macro, which updates stats atomically.

Do you have benchmark numbers for these changes? How big an
improvement does it makes?

https://elixir.bootlin.com/linux/v6.15.3/source/include/linux/netdevice.h#L5549

/* Note: Avoid these macros in fast path, prefer per-cpu or per-queue counters. */
#define DEV_STATS_INC(DEV, FIELD) atomic_long_inc(&(DEV)->stats.__##FIELD)

As far as i can see, you only use DEV_STATS_INC() in error paths. It
might be worth mentioning this. As the comment says, you don't want to
use it on the hot path.


    Andrew

---
pw-bot: cr

