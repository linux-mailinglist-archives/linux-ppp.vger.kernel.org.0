Return-Path: <linux-ppp+bounces-70-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A4592B225
	for <lists+linux-ppp@lfdr.de>; Tue,  9 Jul 2024 10:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 584981C2184C
	for <lists+linux-ppp@lfdr.de>; Tue,  9 Jul 2024 08:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C77B13DDAA;
	Tue,  9 Jul 2024 08:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnkDRVMz"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EA813A899;
	Tue,  9 Jul 2024 08:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720513818; cv=none; b=Ir62tx4M4asOi4pMUdiBHDjoQIq7M7wq18vfcRxWcgk/tB5b2sTNOhI5Ycsfm4kKP80JgKQTq8rRtta8u22zxP0RGEikTd/2tepUXl9sbXoeD/6GZb+s8IPkO/M0o8BjyS7spw8YImMUrPeaRaEmihA2mdc9drr316qU6tCHlmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720513818; c=relaxed/simple;
	bh=ftRqrj+DQcHMqMx1u4nErFljIz23Dp7EZdtDudv9kuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNa8AKI23/7FS4WuygJS+xn5Tr3ECRBNBgn7NH102JdR00bOGyiAJdDbft7FS9kGkj1wmqEQyZ+lL4RuvVxc3LtO8xceRiSDAXaesqbin2WgFqU4AXAwUJDKbVKWe2U/slkr+P99jW/mK2FOhqiwb1a1xeRy7ovxGB2m91dnP/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnkDRVMz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59917C3277B;
	Tue,  9 Jul 2024 08:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720513817;
	bh=ftRqrj+DQcHMqMx1u4nErFljIz23Dp7EZdtDudv9kuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NnkDRVMzsTf/gSIO9nDXfQvLW8dqb4w/lXsOKV7hWQ+SCrJbl+nx44BiGLv/5WsHT
	 J1QgHf4rqNyzqtjjsM0frta9HrJOFZnEkxPoUaVZTeXxYs1TioAt0K88jB6m/KGpbc
	 FXGDTynIkdUOFu0f+xZORAJgK08Ed57myEgfFPD4BsIj6uXTZJ2qWFhYW95D77k1lp
	 dwwU3ex/rJlbIuK+9ylkxuRHioYjpUzaYM6baq15xLPbL0LSdVT267mAhn6/+1sKIo
	 jTYyrzs73zn7xHQ/wlprkRaVaua94EkP4P8ksmXNRHI1+kDBzPNv094zBFOC0CPigz
	 zfw0SRjiUvcBA==
Date: Tue, 9 Jul 2024 09:30:12 +0100
From: Simon Horman <horms@kernel.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: "David S. Miller" <davem@davemloft.net>,
	"Ricardo B. Marliere" <ricardo@marliere.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
	lvc-project@linuxtesting.org,
	syzbot+ec0723ba9605678b14bf@syzkaller.appspotmail.com,
	Guillaume Nault <gnault@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net v2] ppp: reject claimed-as-LCP but actually malformed
 packets
Message-ID: <20240709083012.GD346094@kernel.org>
References: <20240706093545.GA1481495@kernel.org>
 <20240708115615.134770-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708115615.134770-1-dmantipov@yandex.ru>

+ Guillaume, Jakub

On Mon, Jul 08, 2024 at 02:56:15PM +0300, Dmitry Antipov wrote:
> Since 'ppp_async_encode()' assumes valid LCP packets (with code
> from 1 to 7 inclusive), add 'ppp_check_packet()' to ensure that
> LCP packet has an actual body beyond PPP_LCP header bytes, and
> reject claimed-as-LCP but actually malformed data otherwise.
> 
> Reported-by: syzbot+ec0723ba9605678b14bf@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=ec0723ba9605678b14bf
> Fixes: 44073187990d ("ppp: ensure minimum packet size in ppp_write()")

Sorry for not noticing this earlier.

I think that the cited commit is not where this problem was introduced.
What that commit does is to introduce a length check.
And what this patch does is to add another, more specific length check.
But the problem fixed by this patch existed before the cited commit.

I expect that, like the cited commit, this patch:

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
> v2: style, comments, and metadata adjustments suggested by Simon Horman

Thanks, other than the Fixes tag, this looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

...

