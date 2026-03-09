Return-Path: <linux-ppp+bounces-409-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMDDIao1r2kPQQIAu9opvQ
	(envelope-from <linux-ppp+bounces-409-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Mon, 09 Mar 2026 22:03:38 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A88241497
	for <lists+linux-ppp@lfdr.de>; Mon, 09 Mar 2026 22:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2AD830E0DD7
	for <lists+linux-ppp@lfdr.de>; Mon,  9 Mar 2026 21:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4720B369201;
	Mon,  9 Mar 2026 21:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VN2G6eGh"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AFC33FE09;
	Mon,  9 Mar 2026 21:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773090089; cv=none; b=Qmk/ls8+hDXa+v8OpdTbkMx4I2NiH2ftaOZvXs32b1h7NL0ie9mrXWsY/gckf63elXbxeTAptprcLr4krBCoSX2zNOXYZgSOVc1pN0SI8tIiLGL28XLGqvmKtiQdnN1g3Pq3bZv54Vh6qMPGKZ5jdRPnKIalkPUlO973XL7Mmn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773090089; c=relaxed/simple;
	bh=eWuwbM/YVSHop4C2+irDcn4M6R812zJY3pH6YRcKOH0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nT+VXPZyznjbd5iisdcu2f8L1oDcFxlmsTbDS/9cODbvAuCd0kF2u+SRAgKGBoqv4GCYiMQAcfe+7qhunyadoDqdZEpW2JuVGf14y+RWps3QQYPDdGq8QH5y0DFwi4gZUXN94XBkI8wXdKds6SbRujgzKpvLXzuguekYXYf/2bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VN2G6eGh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C6EC4CEF7;
	Mon,  9 Mar 2026 21:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773090088;
	bh=eWuwbM/YVSHop4C2+irDcn4M6R812zJY3pH6YRcKOH0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VN2G6eGhskvUChY8yyvklZoy8uenXvU6kqtOk05QtHv+MEkajT5HOSu8asxDNGnDG
	 y25ZrbP+1xVs7OizRBPv5P08o/nmLnM5UsqARA6zAjz0zGYmqXGU0XTOE3MK3oFC/K
	 /DSLbvgW2GQi3vuVV660EsElmySC2d7cNKeqGpMNwleetgrmX3Fa77actvKxg/sJSH
	 6XrS0xSgLXBw5bJm3pefoPRPpGlH1A7V8phrKK4sigXynaMCiuASEOsAI8v+fYekYn
	 Bc5JK0He9E4VKl7HojpuIIAJ6fVRM48vFnJFLuc0qsOiGirvADuoOqvNA1V6PHRr1L
	 Woi94iVO+RTLQ==
Date: Mon, 9 Mar 2026 14:01:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-ppp@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>, Simon Horman
 <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH net-next v5] net: pppoe: implement GRO/GSO support
Message-ID: <20260309140127.465b6ccd@kernel.org>
In-Reply-To: <CALW65jatv71b7G6jpr4g-6j520RjLBDJMH8uta5MPJHmEM1S1g@mail.gmail.com>
References: <20260305013852.3769-1-dqfext@gmail.com>
	<20260306170411.49912ae1@kernel.org>
	<CALW65jatv71b7G6jpr4g-6j520RjLBDJMH8uta5MPJHmEM1S1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 21A88241497
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-409-lists,linux-ppp=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, 9 Mar 2026 18:46:59 +0800 Qingfang Deng wrote:
> > Please add some selftests.  
> 
> I haven't written a kselftest before. What tests should I include?
> 
> I think I can add a local ppp server and client over veth, and test
> the connection with ping and iperf3.

We have tools/testing/selftests/drivers/net/gro.c and associated Python
test. (note I have ambiguous feelings about adding ppp cases to this
file vs creating a new test, adding Willem to CC maybe he has some
guidance)

The test itself should send and receive raw packets using packet
sockets. That way you can easily inject arbitrary fragmented frames 
on one end and check if they are coalesced correctly on the other.

