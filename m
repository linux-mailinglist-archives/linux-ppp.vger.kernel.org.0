Return-Path: <linux-ppp+bounces-633-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Md0yKSQbV2rYFQEAu9opvQ
	(envelope-from <linux-ppp+bounces-633-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 15 Jul 2026 07:31:16 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB59A75AAF2
	for <lists+linux-ppp@lfdr.de>; Wed, 15 Jul 2026 07:31:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=SEVXk03s;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-633-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-ppp+bounces-633-lists+linux-ppp=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3C11303C00C
	for <lists+linux-ppp@lfdr.de>; Wed, 15 Jul 2026 05:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438A1258EF3;
	Wed, 15 Jul 2026 05:31:14 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB611A8F7B
	for <linux-ppp@vger.kernel.org>; Wed, 15 Jul 2026 05:31:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784093474; cv=none; b=RomSC2oYBSgZuPyyY4ndYmrC13iJml6EFSWo/XXl6oUw1GQwIbvFrdOAphQzczkFFuT8E32SJI1NnbtvqTrJxNrunOaAD66mU54ZGqIiKrSddocqKoqlFjuv5VdVgnT0pgQkHMiP1bu6Lwb+o1VkpcZNGK5mr+TEiPoaDWx2YR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784093474; c=relaxed/simple;
	bh=ugJnAwMrZudP5W6/NCbvXshsTfn6ZgiR1yUWNFxBKDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/LGKVgDiefmHZkf3dPH/anekuvQcjLfKMulCFW1D5tqK946YDfCt5CfYlLyQ0cK9VkQwPiWu52nSg18LgdotTH3QhjmU0ofPnzBLLlq2ZIqrFBPxjJthUQ8k7MDVXLV3+Z6FPEViGRamH88UIkzC7NeVxomlcO8Uw91+nR50b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SEVXk03s; arc=none smtp.client-ip=91.218.175.171
Message-ID: <e07c280b-d3a8-442d-bf19-f00d544ab26c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784093468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OnBUbq3k1b9tRTWvCLJ4zc2zppxBtgM0T1Bl95+DRd0=;
	b=SEVXk03sXpdnZ9KQ8ppgRaStRmjskPj2AxKXL6+3L/TrMPZAuiB86HoGkcllnBSMlqhnKC
	zecO0CGARsqgWXgVV4BhyACqxg71cJLpBC62wFIcSzsJMElWDIX7Cf7tmr5l+g2nuQaFjq
	CV1XjC+xxQlU45r3XuOvSUosyXjyklk=
Date: Wed, 15 Jul 2026 13:30:39 +0800
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next] ppp: reuse ppp_get_stats64() for ioctl stats
To: Zhixing Chen <running910@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org
References: <20260714091941.33783-1-running910@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <20260714091941.33783-1-running910@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-633-lists,linux-ppp=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:running910@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-ppp@vger.kernel.org,m:netdev@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com];
	FORGED_SENDER(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:from_mime,linux.dev:dkim,linux.dev:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB59A75AAF2

Hi,

On 2026/7/14 17:19, Zhixing Chen wrote:
> ppp_get_stats() open-codes the per-cpu tstats aggregation even though
> ppp_get_stats64() already collects the packet, byte and error counters
> needed by the legacy SIOCGPPPSTATS ioctl path.
>
> Reuse ppp_get_stats64() when filling struct ppp_stats. This keeps the
> ioctl stats path consistent with the netdev stats64 path and removes the
> open-coded per-cpu stats aggregation from the ioctl path.
>
> Signed-off-by: Zhixing Chen <running910@gmail.com>
> ---
>
> This is meant as a small cleanup. The ioctl path and the netdev stats64
> path already use the same underlying counters, so this just makes the
> ioctl path reuse ppp_get_stats64() instead of open-coding the per-cpu
> aggregation locally.

On a 32-bit architecture, this will introduce unnecessary seqlock 
overhead to get the upper 32-bit of a counter, which would then be 
immediately discarded.

Regards,

Qingfang


