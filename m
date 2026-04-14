Return-Path: <linux-ppp+bounces-528-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMYUDL503mkqEgAAu9opvQ
	(envelope-from <linux-ppp+bounces-528-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 14 Apr 2026 19:09:18 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9183FCD9A
	for <lists+linux-ppp@lfdr.de>; Tue, 14 Apr 2026 19:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F1163009F8A
	for <lists+linux-ppp@lfdr.de>; Tue, 14 Apr 2026 17:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0C12EC090;
	Tue, 14 Apr 2026 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FArvBtao"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C592E8B9B;
	Tue, 14 Apr 2026 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776186518; cv=none; b=LwBZEBch/knRj9th3PAF7RdO+/OpAYst5KmKSiDWSdTugd3TRRlwkTz+AaCrg3PhF3gHz50K28OWNv+bDG3hnofyKjf/GMaDrpyb25orjd7MOChy5xDII3JP4/GmGkKi2g9X244imUYKVbEaKR2DX+gvVZISWqe3fgYjbSpbgUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776186518; c=relaxed/simple;
	bh=vKs+gWxdRfR0fLmOIUgbDBGc6PxJXrnR6lXTej2mrEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4sglLGpO36ZDBy741eKrDGN5CJ07a3H392rbOxquJXhOt8RbFHGkUlWoUpl+DyNuFep1/nhCP0MUP6x+eFzf/ogBAliCjrMvuThywuWpoUOb+NF8ofS+6r0CC8CRy7ItlflMHxW8ZSr+0WLQr+EQ6ikFxTd3z/Aa0MKM4KDIw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FArvBtao; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A974C19425;
	Tue, 14 Apr 2026 17:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776186518;
	bh=vKs+gWxdRfR0fLmOIUgbDBGc6PxJXrnR6lXTej2mrEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FArvBtaocYCI8ri7juv9TQmMH6xhe16gS2YBBBr8ytQeLt9UciyEDIOG2K5Py1FAl
	 te1/nXiV54qnAEzS3kSOxdyovUEErDALSPDTWm/4rl++/Q88fxYzOTlu60iyPEvosS
	 kRo1aLNhx4bBewyR/+5byZSra5+vJThsQWavDaXLxPPL9QX1Ql7ojNyYaXjx4++6Gd
	 x1ZDexKwNfwz94Q6kANifRMKcH3mD1Fae3SuOhPt0oXZsaMmPRD+zXj5lfhY8a+q3n
	 MIXM8iT2BoSk/FBgk1/e/3MVLaGX5iKHUXF+g1UuXB09pxKPbG2kq1g0YGdtmyQ54J
	 iH9kQ2yZWMO1Q==
Date: Tue, 14 Apr 2026 18:08:32 +0100
From: Simon Horman <horms@kernel.org>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: linux-ppp@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Guillaume Nault <gnault@redhat.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
	Jaco Kroon <jaco@uls.co.za>,
	James Carlson <carlsonj@workingcode.com>,
	Marcin Szycik <marcin.szycik@linux.intel.com>
Subject: Re: [PATCH net v5 1/2] flow_dissector: do not dissect PPPoE PFC
 frames
Message-ID: <20260414170745.GA772482@horms.kernel.org>
References: <20260414021353.23471-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414021353.23471-1-qingfang.deng@linux.dev>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-528-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[horms.kernel.org:mid,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7F9183FCD9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:13:48AM +0800, Qingfang Deng wrote:
> RFC 2516 Section 7 states that Protocol Field Compression (PFC) is NOT
> RECOMMENDED for PPPoE. In practice, pppd does not support negotiating
> PFC for PPPoE sessions, and the flow dissector driver has assumed an
> uncompressed frame until the blamed commit.
> 
> During the review process of that commit [1], support for PFC is
> suggested. However, having a compressed (1-byte) protocol field means
> the subsequent PPP payload is shifted by one byte, causing 4-byte
> misalignment for the network header and an unaligned access exception
> on some architectures.
> 
> The exception can be reproduced by sending a PPPoE PFC frame to an
> ethernet interface of a MIPS board, with RPS enabled, even if no PPPoE
> session is active on that interface:
> 
> $ 0   : 00000000 80c40000 00000000 85144817
> $ 4   : 00000008 00000100 80a75758 81dc9bb8
> $ 8   : 00000010 8087ae2c 0000003d 00000000
> $12   : 000000e0 00000039 00000000 00000000
> $16   : 85043240 80a75758 81dc9bb8 00006488
> $20   : 0000002f 00000007 85144810 80a70000
> $24   : 81d1bda0 00000000
> $28   : 81dc8000 81dc9aa8 00000000 805ead08
> Hi    : 00009d51
> Lo    : 2163358a
> epc   : 805e91f0 __skb_flow_dissect+0x1b0/0x1b50
> ra    : 805ead08 __skb_get_hash_net+0x74/0x12c
> Status: 11000403        KERNEL EXL IE
> Cause : 40800010 (ExcCode 04)
> BadVA : 85144817
> PrId  : 0001992f (MIPS 1004Kc)
> Call Trace:
> [<805e91f0>] __skb_flow_dissect+0x1b0/0x1b50
> [<805ead08>] __skb_get_hash_net+0x74/0x12c
> [<805ef330>] get_rps_cpu+0x1b8/0x3fc
> [<805fca70>] netif_receive_skb_list_internal+0x324/0x364
> [<805fd120>] napi_complete_done+0x68/0x2a4
> [<8058de5c>] mtk_napi_rx+0x228/0xfec
> [<805fd398>] __napi_poll+0x3c/0x1c4
> [<805fd754>] napi_threaded_poll_loop+0x234/0x29c
> [<805fd848>] napi_threaded_poll+0x8c/0xb0
> [<80053544>] kthread+0x104/0x12c
> [<80002bd8>] ret_from_kernel_thread+0x14/0x1c
> 
> Code: 02d51821  1060045b  00000000 <8c640000> 3084000f  2c820005  144001a2  00042080  8e220000
> 
> To reduce the attack surface and maintain performance, do not process
> PPPoE PFC frames.
> 
> [1] https://patch.msgid.link/20220630231016.GA392@debian.home
> Fixes: 46126db9c861 ("flow_dissector: Add PPPoE dissectors")
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
> Changes in v5: drop byte-swap change
>  Link to v4: https://lore.kernel.org/netdev/20260410033627.93786-1-qingfang.deng@linux.dev/
> 
>  net/core/flow_dissector.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/net/core/flow_dissector.c b/net/core/flow_dissector.c
> index 1b61bb25ba0e..f9aaba554128 100644
> --- a/net/core/flow_dissector.c
> +++ b/net/core/flow_dissector.c
> @@ -1374,16 +1374,8 @@ bool __skb_flow_dissect(const struct net *net,
>  			break;
>  		}
>  
> -		/* least significant bit of the most significant octet
> -		 * indicates if protocol field was compressed
> -		 */
>  		ppp_proto = ntohs(hdr->proto);
> -		if (ppp_proto & 0x0100) {
> -			ppp_proto = ppp_proto >> 8;
> -			nhoff += PPPOE_SES_HLEN - 1;
> -		} else {
> -			nhoff += PPPOE_SES_HLEN;
> -		}

I think it would be good to add a comment around here
describing how PFC is safely handled in this function.

> +		nhoff += PPPOE_SES_HLEN;
>  
>  		if (ppp_proto == PPP_IP) {
>  			proto = htons(ETH_P_IP);
> -- 
> 2.43.0
> 

