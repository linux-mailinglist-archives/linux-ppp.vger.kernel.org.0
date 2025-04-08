Return-Path: <linux-ppp+bounces-287-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62285A81050
	for <lists+linux-ppp@lfdr.de>; Tue,  8 Apr 2025 17:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 507851BA04AC
	for <lists+linux-ppp@lfdr.de>; Tue,  8 Apr 2025 15:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47B322B5AC;
	Tue,  8 Apr 2025 15:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WO+LV9dH"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8784A1862BB;
	Tue,  8 Apr 2025 15:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126437; cv=none; b=bF9ZOk+HAwJHslnTCHqckL2uYQpdkVj6XOfc8I/3SoBSn2pE6d5Y5lpDVm7zgYjQCScosMVH94RuszzQNGLfo32uMzP6gx1ENBtwC2v0bbYqdf8mlNK+5iLlZdnKn/5CVu5vtuxFazx8QrDr9gwG6OSVSJizqeE0wov9viKFzn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126437; c=relaxed/simple;
	bh=hkj33HvWH7z+7npHbhB7B8fe/3fPCZataiCitI6mP3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eF1/oXx/qdFPrpT9A3ztg9qNa4+V8LClXyLUxYpIbZM1BIOinoxcuf80LCfKYvxvkxar5T7rLcTnHmzNXenILmacM+2D0n/GLWxYCV67t88JR2F9+XyIC2+l44DM63vfmk2kDMGQx83ETaE3+kj6upyRBdR5qTG35u8ntRDw6Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WO+LV9dH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1AB6C4CEE5;
	Tue,  8 Apr 2025 15:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744126437;
	bh=hkj33HvWH7z+7npHbhB7B8fe/3fPCZataiCitI6mP3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WO+LV9dH9KaSOGuQfz83Y4tIchSpkxL1l+QiLyn2ZTJ01hG1Grx2Wdl6tQnEKAUBM
	 lT1CUoxF+v+Zs8TrpSj8dNK5ERXUNiONbaKeSpfiLZ3QSZcbv+5VTkwU7kWbJ/7UHs
	 v8jLJuyKe4Q83dZlUFzB36whZ+2x1/NW0WJE0i2+ejkBjTfzDhe/crW8tkanh156jA
	 g3LyGlo7gpbFkwYhWRvmOEJgiFoAmePVplYvx7cLYto4eLjnHPyZNyZllsH9bACupg
	 0SUGhBibOu4YYM8Rz3e0s7gU1mNutbiGMgQKmriamamrsoqk/+XpfD4PXFIAmBLZKz
	 SOVZazRk7PpPw==
Date: Tue, 8 Apr 2025 16:33:52 +0100
From: Simon Horman <horms@kernel.org>
To: Arnaud Lecomte <contact@arnaud-lcm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
Subject: Re: [PATCH] net: ppp: Add bound checking for skb d on ppp_sync_txmung
Message-ID: <20250408153352.GY395307@horms.kernel.org>
References: <20250407-bound-checking-ppp_txmung-v1-1-cfcd2efe39e3@arnaud-lcm.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407-bound-checking-ppp_txmung-v1-1-cfcd2efe39e3@arnaud-lcm.com>

On Mon, Apr 07, 2025 at 05:26:21PM +0200, Arnaud Lecomte wrote:
> Ensure we have enough data in linear buffer from skb before accessing
> initial bytes. This prevents potential out-of-bounds accesses
> when processing short packets.
> 
> When ppp_sync_txmung receives an incoming package with an empty
> payload:
> (remote) gef➤  p *(struct pppoe_hdr *) (skb->head + skb->network_header)
> $18 = {
> 	type = 0x1,
> 	ver = 0x1,
> 	code = 0x0,
> 	sid = 0x2,
>         length = 0x0,
> 	tag = 0xffff8880371cdb96
> }
> 
> from the skb struct (trimmed)
>       tail = 0x16,
>       end = 0x140,
>       head = 0xffff88803346f400 "4",
>       data = 0xffff88803346f416 ":\377",
>       truesize = 0x380,
>       len = 0x0,
>       data_len = 0x0,
>       mac_len = 0xe,
>       hdr_len = 0x0,
> 
> it is not safe to access data[2].
> 
> Reported-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=29fc8991b0ecb186cf40
> Tested-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
> Fixes: 9946eaf552b1 ("Merge tag 'hardening-v6.14-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux")

It doesn't seem right to use a Merge commit in a fixes tag.

Looking over the code, the access to data[2] seems to have existed since
the beginning of git history, in which case I think we can use this:

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

> Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
> ---
>  drivers/net/ppp/ppp_synctty.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
> index 644e99fc3623..520d895acc60 100644
> --- a/drivers/net/ppp/ppp_synctty.c
> +++ b/drivers/net/ppp/ppp_synctty.c
> @@ -506,6 +506,11 @@ ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *skb)
>  	unsigned char *data;
>  	int islcp;
>  
> +	/* Ensure we can safely access protocol field and LCP code */
> +	if (!skb || !pskb_may_pull(skb, 3)) {

I doubt that skb can be NULL.

> +		kfree_skb(skb);
> +		return NULL;
> +	}
>  	data  = skb->data;
>  	proto = get_unaligned_be16(data);
>  
> 
> ---
> base-commit: 9946eaf552b194bb352c2945b54ff98c8193b3f1
> change-id: 20250405-bound-checking-ppp_txmung-4807c854ed85
> 
> Best regards,
> -- 
> Arnaud Lecomte <contact@arnaud-lcm.com>
> 
> 

