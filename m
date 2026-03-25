Return-Path: <linux-ppp+bounces-440-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIA6M9V2xGn/zQQAu9opvQ
	(envelope-from <linux-ppp+bounces-440-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 00:59:17 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3419432D813
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 00:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20B2830214EC
	for <lists+linux-ppp@lfdr.de>; Wed, 25 Mar 2026 23:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADCE397697;
	Wed, 25 Mar 2026 23:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQHgXiVE"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578A438AC74;
	Wed, 25 Mar 2026 23:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774483152; cv=none; b=mA8VGa2l5qPaC78k/hLVhRctAGf8GaSskTW5Yyw31zjaGRErfrCd8TH5m1Rjq+ywnckQcGK/hvTJU0JVgNSNBiDIfbBZA+q3pQJ3r63hy+fqFmi1Km04y4d2cz0XgW//rB6JV341KVETOyH4KjfkdeIAIrz2PGV2IY5+4SF3K5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774483152; c=relaxed/simple;
	bh=Hn1v0LnfTjZavby0E//WtRInTPVh9TG66L/bScZCIFg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TfdDMduXCT+yhXOaBDP/zlKq/zSqYMCO7ACDE//Wap6J9e3cqU6+XFZMedwnuuGjQunnTLACV1DDk9er8ANe/ExSw3jv4GT0IodZ23jmQeanf1YYkZPBXy4w2yc6TYowol+9Q2oVJQVH2yogaJAosRmVEVN71VibdKkEk9OwvcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQHgXiVE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E38C4CEF7;
	Wed, 25 Mar 2026 23:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774483151;
	bh=Hn1v0LnfTjZavby0E//WtRInTPVh9TG66L/bScZCIFg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kQHgXiVE3KJFKn2OWKo3LE8s7HDbX3d9KKvliSB2+N3Q7zgNHhqEAEu83cgjOE+Vg
	 zARJzgdY5fpHRb14wY+36dR/UStMvrOkl1jyP/A9BsA85Nx0BMWxG3AgM9ozs+RRHb
	 bDJ+lIFfLXhMB4tvCQPUG3YVXtWtJk66FeCbtmOHOzAY3FmsP9tFv4v5wUxrlMJRcG
	 FLdCOdsQwZICVyoKuGPaOU5Kbzw9VBO1Pd6HdrxYFO8R0f9M77JvQzOTQC1uxQ+/Rd
	 Sft8QAqarJoWNssNRSFK4PjzdGHUd6cBVRFUqVMcUtjmc+HhrNJjFvKf8MJc1qkYOJ
	 FRcepJDRKpVLQ==
Date: Wed, 25 Mar 2026 16:59:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-ppp@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>, Simon Horman
 <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH net-next v5] net: pppoe: implement GRO/GSO support
Message-ID: <20260325165910.5bd7416c@kernel.org>
In-Reply-To: <CALW65jZv53Y4-H3civxZLT5RGypsKjb3JyiA6iy0pw-_RK-=Tw@mail.gmail.com>
References: <20260305013852.3769-1-dqfext@gmail.com>
	<20260306170411.49912ae1@kernel.org>
	<CALW65jatv71b7G6jpr4g-6j520RjLBDJMH8uta5MPJHmEM1S1g@mail.gmail.com>
	<20260309140127.465b6ccd@kernel.org>
	<CALW65jZv53Y4-H3civxZLT5RGypsKjb3JyiA6iy0pw-_RK-=Tw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
	TAGGED_FROM(0.00)[bounces-440-lists,linux-ppp=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3419432D813
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 17:23:39 +0800 Qingfang Deng wrote:
> > > I haven't written a kselftest before. What tests should I include?
> > >
> > > I think I can add a local ppp server and client over veth, and test
> > > the connection with ping and iperf3.  
> >
> > We have tools/testing/selftests/drivers/net/gro.c and associated Python
> > test. (note I have ambiguous feelings about adding ppp cases to this
> > file vs creating a new test, adding Willem to CC maybe he has some
> > guidance)  
> 
> He hasn't replied. What do you think?

He probably missed the mid-thread email. Proceed with whatever you feel
makes sense.

