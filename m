Return-Path: <linux-ppp+bounces-570-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNuMKUtR/GlOOAAAu9opvQ
	(envelope-from <linux-ppp+bounces-570-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 07 May 2026 10:46:03 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C259D4E50DC
	for <lists+linux-ppp@lfdr.de>; Thu, 07 May 2026 10:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70CE830FD367
	for <lists+linux-ppp@lfdr.de>; Thu,  7 May 2026 08:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F0A36166F;
	Thu,  7 May 2026 08:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FPzeOtX/"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A640A31E857
	for <linux-ppp@vger.kernel.org>; Thu,  7 May 2026 08:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142848; cv=none; b=cvsnMddP86/s7AY9qJHU0xYjZoJkjxhpr56ZetcHIxHZRtx8J2BAyuxwWft4TELME4bltVVafOXg2HEofdc0WwpkFc1MJs3mRq5i7vWfNPy/FjWvyvVenowQuLeyGnLDpq/r9PzNDXc9RBRTpYt1lK7GaaY7FebQHevGgozeJyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142848; c=relaxed/simple;
	bh=pvb1MHQLF11MJXf8+zcWPixcW83m0j26gAXbrydYl7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c9zhGGJD4mkgqFuQTA8UlVbqhei4OBnGnFe2h+gPQxjuEZ8DhvFgECHBX6DoPgo7oX0CZamkrBpN3VwM4oi9LEJIT+3Pp74XF/Zi0u5P9A4zTA74wJ2jI2uDMFsk5A8PXW6O5XSkVexVMdpvkmPwI8Xjb+W3CEvrC/oKwqJBcoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FPzeOtX/; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <a4216fa5-9576-4836-b202-d9c35f0e546a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778142832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pvb1MHQLF11MJXf8+zcWPixcW83m0j26gAXbrydYl7U=;
	b=FPzeOtX/dwacWuJxi1CtVFm+UdCNOBga4/j0JsjDwEFJLiZquZCWytLqY8xJ+E+HaMmBwU
	oYAmTGtoLVwa3OhJBWMVG/ljX9nWUxNkAF8b+6E6Ql41kgGBQxqyaPS5BuyA8zlqjMtD45
	yT+ZJ9owbVJ8zwyG33jWdqt1Yw/nNMo=
Date: Thu, 7 May 2026 16:33:36 +0800
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next 2/3] ppp: unify two channel structs
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 David Sterba <dsterba@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Chas Williams <3chas3@gmail.com>,
 Simon Horman <horms@kernel.org>, James Chapman <jchapman@katalix.com>,
 Kees Cook <kees@kernel.org>, Taegu Ha <hataegu0826@gmail.com>,
 Guillaume Nault <gnault@redhat.com>, Eric Woudstra <ericwouds@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Dawid Osuchowski <dawid.osuchowski@linux.intel.com>,
 Breno Leitao <leitao@debian.org>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net
References: <20260430090532.244758-1-qingfang.deng@linux.dev>
 <20260430090532.244758-2-qingfang.deng@linux.dev>
 <590d7931-02b0-45d6-8f43-ef909c9bde89@redhat.com>
 <c9993ee6-4023-4331-a1c1-4e30952146fe@linux.dev>
 <20260507074051.mqO5DaWL@linutronix.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <20260507074051.mqO5DaWL@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: C259D4E50DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-570-lists,linux-ppp=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,lunn.ch,davemloft.net,google.com,kernel.org,suse.com,linuxfoundation.org,gmail.com,katalix.com,arndb.de,linux.intel.com,debian.org,vger.kernel.org,lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Action: no action

On 2026/5/7 15:40, Sebastian Andrzej Siewior wrote:
> On 2026-05-07 13:53:30 [+0800], Qingfang Deng wrote:
>>> This patch is IMHO a bit too big and should be split. Also this kind of
>>> refactor looks very invasive and potentially regression prone. I think
>>> it should include a signficant self-test coverage increase.
>> This is indeed too big. But how do I split it without breaking the build?
> The current ppp tests would yell if you accidentally broke something?
By "breaking the build" I meant compile-time errors (due to API changes).

