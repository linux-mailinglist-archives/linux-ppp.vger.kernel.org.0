Return-Path: <linux-ppp+bounces-332-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B64C5B1BCE8
	for <lists+linux-ppp@lfdr.de>; Wed,  6 Aug 2025 01:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8535D18A73EE
	for <lists+linux-ppp@lfdr.de>; Tue,  5 Aug 2025 23:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64392BD586;
	Tue,  5 Aug 2025 23:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pb2mgmIZ"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACFC285069;
	Tue,  5 Aug 2025 23:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754435018; cv=none; b=lOj31FDlzQwEb3Ahk2TjoTxVJGPjPbViPxKV4Fs2W5voFqrGfCGa/cHiF+7OGZWTwrbNQyQoeECeay/hrjuvAVcixqUz1qEN1V5gkIJQcMWrOpqKV3AKZG/PtLikMzJ8RUTQBX3MUDLIZ7JUMABcvN4DZ6BX1qar6g1VA2Vz3tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754435018; c=relaxed/simple;
	bh=7Ups/RGUjv1LIIm/fio9SMuzA1Vx0XSASLqIG36D+TQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iUGuXFVHOoLTbAZ6zQbqygy+ctqbv23J76m6Rr32McaUAT5yb69La8G3Kbll87OOeDXpCQoxC7fz/5LT6FrRDTVm4La4t+NJO9KA+oRlM3frbFkKHYg6/nezuqvRYvTbE57IAGFFFT7eNn/dOme2rSyvKaCVsHN8f3OdNxHf8O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pb2mgmIZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFCE2C4CEF0;
	Tue,  5 Aug 2025 23:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754435015;
	bh=7Ups/RGUjv1LIIm/fio9SMuzA1Vx0XSASLqIG36D+TQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Pb2mgmIZSfUa3/mPZ0h/Tx/57asgu2ViqUz2QxOaezyHvTi+lW9NvT7XuogDiWmF4
	 zUflvO/GEbe/Gqd5qQkz+j83pTaGMqCNAOQZrYMqO7vjt5c0UXISpfADBqO69OtW4a
	 JvuOuFCbSaQB8xh9KdxP3MInbvLGuTq8cWj1wm38b2aLLaTyA24MFqMEmd9Us9bmkT
	 Pi5Yl/77t7Y4RH4ydzk0f1x6t/vOv9W6gikWJNEvrS3EsfPycozDX3jYiTkp0dwZQP
	 Fui+TFCjzrivXpOGyWM8pwbaseWS6LSYCwMoQgE/bojYVH8vVzu61jt/A9EPqfK5Nk
	 w3ZBsijNYS0Ww==
Date: Tue, 5 Aug 2025 16:03:33 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] ppp: remove rwlock usage
Message-ID: <20250805160333.3bee2d40@kernel.org>
In-Reply-To: <20250805024933.754-1-dqfext@gmail.com>
References: <20250805024933.754-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  5 Aug 2025 10:49:33 +0800 Qingfang Deng wrote:
> In struct channel, the upl lock is implemented using rwlock_t,
> protecting access to pch->ppp and pch->bridge.
> 
> As previously discussed on the list, using rwlock in the network fast
> path is not recommended.
> This patch replaces the rwlock with a spinlock for writers, and uses RCU
> for readers.
> 
> - pch->ppp and pch->bridge are now declared as __rcu pointers.
> - Readers use rcu_dereference_bh() under rcu_read_lock_bh().
> - Writers use spin_lock() to update, followed by synchronize_rcu()
>   where required.

## Form letter - net-next-closed

We have already submitted our pull request with net-next material for v6.17,
and therefore net-next is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Aug 11th.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed


