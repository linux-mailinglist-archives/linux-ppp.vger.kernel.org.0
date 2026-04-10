Return-Path: <linux-ppp+bounces-515-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOfUGLgq2WnhmwgAu9opvQ
	(envelope-from <linux-ppp+bounces-515-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Apr 2026 18:52:08 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1323DABBD
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Apr 2026 18:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD5C73038F58
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Apr 2026 16:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302173DD525;
	Fri, 10 Apr 2026 16:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QzX2XFCU"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3463C945E;
	Fri, 10 Apr 2026 16:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839489; cv=none; b=I9LyLyFx8JAggMLuQhqglk2bFLslBSgY/cS/73QrcSN90WYQ2T1htJnpWt0ZG4DvVIj4SegXC4cwuCkxKlpJM1BWz9EZ9nNQZz5JY7nomd8guPpzVM36pBVmuDqsuJ3XOr6jHlxAKw+F58R5I2rsN32X6hy2aLSQBuR8KjhNYwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839489; c=relaxed/simple;
	bh=PW7zS/zscAmiEdr528A9pKocKrhzul89xoiJ7EJzGLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+3H+BflrvSSOLSn5HiqydaocSP8QRiBGucRRoLi7ruEMLI41V+cjXuvAphafTyTy3j3/mL2Wapod/j2o3wEXWYqQ+pfaL6+z8RhaePqeDeNcLOqIuKdggjGBN5wxl84ZBRQg3CU8uq2YLFDgKtOtQN1c+OreYVXQOu8aoUZ2DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QzX2XFCU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12632C19421;
	Fri, 10 Apr 2026 16:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775839488;
	bh=PW7zS/zscAmiEdr528A9pKocKrhzul89xoiJ7EJzGLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QzX2XFCUC8XvCTYBV8x5Z8MA5oxnQf80JYIxISoUSAos7jblImGKo5DrVDTfOpTt1
	 oQW1MbP66Lh3wM9WZXzJqUu1QK0/n1zf2K58gu2SuySVCgVwNo+FAHc1F24q9AygG+
	 0f3yI4E758sAds2hkKJsiBaFOawdcLU94z0BYV7wWiAROSSdOO1sWBUfJFO/bs78sd
	 Z+pYGU7hTW1mMY6oNnTDq4EZMCczEQGjgnGnMhI/CcvzHlqM0iFLXlyXB8Kls0mULM
	 RsVs38avWIHK44Yt5di0u4V59z/+vWkx9aQiUZe/RFSs0on/VQWbPF9KNdA6VObiyG
	 n2NlMGU5hQGJA==
Date: Fri, 10 Apr 2026 17:44:42 +0100
From: Simon Horman <horms@kernel.org>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: linux-ppp@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Ostrowski <mostrows@gmail.com>,
	Yue Haibing <yuehaibing@huawei.com>,
	Breno Leitao <leitao@debian.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Kees Cook <kees@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
	Jaco Kroon <jaco@uls.co.za>,
	James Carlson <carlsonj@workingcode.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Guillaume Nault <gnault@redhat.com>
Subject: Re: [PATCH net v2] pppoe: drop PFC frames
Message-ID: <20260410164442.GB469338@kernel.org>
References: <20260408024245.312732-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408024245.312732-1-qingfang.deng@linux.dev>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-515-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,huawei.com,debian.org,linutronix.de,ozlabs.org,uls.co.za,workingcode.com,intel.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email]
X-Rspamd-Queue-Id: BA1323DABBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 10:42:39AM +0800, Qingfang Deng wrote:
> RFC 2516 Section 7 states that Protocol Field Compression (PFC) is NOT
> RECOMMENDED for PPPoE. In practice, pppd does not support negotiating
> PFC for PPPoE sessions, and the current PPPoE driver assumes an
> uncompressed (2-byte) protocol field. However, the generic PPP layer
> function ppp_input() is not aware of the negotiation result, and still
> accepts PFC frames.
> 
> If a peer with a broken implementation or an attacker sends a frame with
> a compressed (1-byte) protocol field, the subsequent PPP payload is
> shifted by one byte. This causes the network header to be 4-byte
> misaligned, which may trigger unaligned access exceptions on some
> architectures.
> 
> To reduce the attack surface, drop PPPoE PFC frames. Introduce
> ppp_skb_is_compressed_proto() helper function to be used in both
> ppp_generic.c and pppoe.c to avoid open-coding.
> 
> Fixes: 224cf5ad14c0 ("ppp: Move the PPP drivers")

AI generated review points out that the commit cited above only moves code
around. And thus while it may show up in git annotate as the source
of the buggy lines of code, actually it predates that commit.

AI generated code suggests an earlier commit that adds
the length check. But I believe that the bug predates that too.
And that the bug is present, in some form, since the beginning of
git history, because at that time fields of the ppp header was read without
taking PFC into account.

So I suggest:

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

Unless there is other review you probably don't need to repost just
to address this.

> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
> v2: retarget to net, and add a helper function
>  https://lore.kernel.org/netdev/20260403083926.68320-1-qingfang.deng@linux.dev/

Reviewed-by: Simon Horman <horms@kernel.org>


