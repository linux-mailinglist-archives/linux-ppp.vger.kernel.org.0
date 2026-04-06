Return-Path: <linux-ppp+bounces-490-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFv4CMbH02lNmAcAu9opvQ
	(envelope-from <linux-ppp+bounces-490-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Mon, 06 Apr 2026 16:48:38 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 772A43A4622
	for <lists+linux-ppp@lfdr.de>; Mon, 06 Apr 2026 16:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 297163008795
	for <lists+linux-ppp@lfdr.de>; Mon,  6 Apr 2026 14:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66C83845C8;
	Mon,  6 Apr 2026 14:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTsk1luo"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815AF31715A;
	Mon,  6 Apr 2026 14:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486914; cv=none; b=gZJByxvS5sB5SuIFNaTtuCCGmxk9oeq6kv1Lp2ZcQCyzUyoSLl+zBetthctAzZhSwzXiMAbTtIKCPjpDxQuxTkELa1ccAzTseaGB7cjCQ9xow4uqih+0PTUCIAg6iqvDz+rFR8Y6nKfxUKzEF6FhFXcJcVU3RPoQ+pJEbmkhf10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486914; c=relaxed/simple;
	bh=JJzRvOTBfCl12UjvxkxkFsfOrMD8gCguyWd+bgCh2e4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrP0T31xnqDw1HXwjNps05LiPpJz8acKHCUAVcELzQcyNwO+yjWApMudNfheOHygoe1dTfwppG/Ez+R3J7OqgGdWsV9IiTw48BD6EjZnwdqai/7aw8LyluBRfEXZcuoYIHDOTj5wG0xZyXxwGeWRRuyHUhvVlQjaB/+yfNF7l5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTsk1luo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B660C4CEF7;
	Mon,  6 Apr 2026 14:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775486914;
	bh=JJzRvOTBfCl12UjvxkxkFsfOrMD8gCguyWd+bgCh2e4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rTsk1luozY5LBfKlfRYe1suIMXLh1BzyD4K69CSGd/NrGXhlt0GfxCbWaj7RNXmMP
	 iLczCLp0cWmTxb5VHYQ1aQzvNg38XPVOKXzE6UmdLynobzCAzZ2d1IXf5sujPsxYg8
	 IMXO1yWt8KQNK//e2vnpXnaaISObavYsqHPE6EweICOy06slzGN2Ebw5+yPQiC8jXk
	 3zZliK7wGM3ItXv0MHGCiXAySgOcdq4GgiRNP2lTy9IwBI/AWDxyVDezKb4UXi5SGq
	 +aIuqGkrrpxXwMqqvDg3BTFdE/bSjTTP0KuYvsXWQp5ODbl7WyHyNATWPxOHW/PZ8V
	 pUnz7b0hT579Q==
Date: Mon, 6 Apr 2026 15:48:28 +0100
From: Simon Horman <horms@kernel.org>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: linux-ppp@vger.kernel.org, Michal Ostrowski <mostrows@earthlink.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Paul Mackerras <paulus@ozlabs.org>, Jaco Kroon <jaco@uls.co.za>,
	James Carlson <carlsonj@workingcode.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Guillaume Nault <gnault@redhat.com>
Subject: Re: [PATCH net-next] pppoe: drop PFC frames
Message-ID: <20260406144828.GH395680@kernel.org>
References: <20260403083926.68320-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403083926.68320-1-qingfang.deng@linux.dev>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-490-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,earthlink.net,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,ozlabs.org,uls.co.za,workingcode.com,intel.com];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email]
X-Rspamd-Queue-Id: 772A43A4622
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 04:39:26PM +0800, Qingfang Deng wrote:
> RFC 2516 Section 7 states that Protocol Field Compression (PFC) is NOT
> RECOMMENDED for PPPoE. In practice, pppd does not support negotiating
> PFC for PPPoE sessions, and the current PPPoE driver assumes an
> uncompressed (2-byte) protocol field.
> 
> If a peer with a broken implementation or an attacker sends a frame with
> a compressed (1-byte) protocol field, the subsequent PPP payload is
> shifted by one byte. This causes the network header to be 4-byte
> misaligned, which may trigger unaligned access exceptions on some
> architectures.
> 
> To reduce the attack surface, drop the compressed protocol field frames.
> 
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
>  drivers/net/ppp/pppoe.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
> index 1ac61c273b28..457a83c73293 100644
> --- a/drivers/net/ppp/pppoe.c
> +++ b/drivers/net/ppp/pppoe.c
> @@ -393,7 +393,7 @@ static int pppoe_rcv(struct sk_buff *skb, struct net_device *dev,
>  	if (skb_mac_header_len(skb) < ETH_HLEN)
>  		goto drop;
>  
> -	if (!pskb_may_pull(skb, sizeof(struct pppoe_hdr)))
> +	if (!pskb_may_pull(skb, PPPOE_SES_HLEN))
>  		goto drop;
>  
>  	ph = pppoe_hdr(skb);
> @@ -403,6 +403,10 @@ static int pppoe_rcv(struct sk_buff *skb, struct net_device *dev,
>  	if (skb->len < len)
>  		goto drop;
>  
> +	/* drop PFC frames */
> +	if (unlikely(skb->data[0] & 0x01))
> +		goto drop;

Hi,

I think it would be best to add/use a #define rather than
open coding the magic value 0x01. And perhaps expanding
the comment to note that skb->data[0] is the first byte
of the PPP protocol would be nice too.

> +
>  	if (pskb_trim_rcsum(skb, len))
>  		goto drop;
>  
> -- 
> 2.43.0
> 

