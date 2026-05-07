Return-Path: <linux-ppp+bounces-567-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIxGNfEo/GmXMAAAu9opvQ
	(envelope-from <linux-ppp+bounces-567-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 07 May 2026 07:53:53 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 003A94E3419
	for <lists+linux-ppp@lfdr.de>; Thu, 07 May 2026 07:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF9073019901
	for <lists+linux-ppp@lfdr.de>; Thu,  7 May 2026 05:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8221431AAB8;
	Thu,  7 May 2026 05:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Vgr/HUtB"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61012EC57C;
	Thu,  7 May 2026 05:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778133230; cv=none; b=GjRNFD23ECOnwxx+RWlVovTRCJMjVVb6mrSSZUkJ/OcGUpLnd3EapJ/AbTTqylOxVY2xBlH00X6SRDaGiYoXIFlH0RFQTLfmp5rG43dwr9hl0s8DcrJYkEHyb1gMShrwN6UFvqG5ztxcmUAe3vLtqEO2li1u5PWRNxkqNjslDPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778133230; c=relaxed/simple;
	bh=1LrW5qCIbYeb/bX6ybBGiV+9rPWAOJqaKbnrQSaIt9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KPT7ybzwTjd75FTiNVXu5s4ZZjdzwVYwHIJ97dnRpRINsdx11ChNZN2VPs+QBarlScTXNvIxN+drJyCtMPAiHnNpf2Lg+xdUIIfGE1YdoJ0iyghLXAEod9/KsNfOLrYIuKhw6V/IMdC9Fs6A9lZDSdvj5CilFoYt+ICXMHFhwFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Vgr/HUtB; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <c9993ee6-4023-4331-a1c1-4e30952146fe@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778133225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VbGSu/85g0XblWRuECFeslO9kenoVrjTmkH45UYo96U=;
	b=Vgr/HUtB+VnkFQX0dQtT03258riDXLlIM9m/PeTvG3tf1tRlGkqkkuu0qewifW6W/hABie
	yJESxF+JatKhHcsZbl7utDYkhuEBB4/Li+Tn8KWQc6cIAOvILsmQtsBXgEsMMx1LyBo7k6
	J95Oa8iIXKmPJJu8cCe5YBss+U9bqEc=
Date: Thu, 7 May 2026 13:53:30 +0800
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next 2/3] ppp: unify two channel structs
To: Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 David Sterba <dsterba@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Mitchell Blank Jr <mitch@sfgoth.com>,
 Chas Williams <3chas3@gmail.com>, Simon Horman <horms@kernel.org>,
 James Chapman <jchapman@katalix.com>, Kees Cook <kees@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Taegu Ha <hataegu0826@gmail.com>, Guillaume Nault <gnault@redhat.com>,
 Eric Woudstra <ericwouds@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Dawid Osuchowski <dawid.osuchowski@linux.intel.com>,
 Breno Leitao <leitao@debian.org>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net
References: <20260430090532.244758-1-qingfang.deng@linux.dev>
 <20260430090532.244758-2-qingfang.deng@linux.dev>
 <590d7931-02b0-45d6-8f43-ef909c9bde89@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <590d7931-02b0-45d6-8f43-ef909c9bde89@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 003A94E3419
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-567-lists,linux-ppp=lfdr.de];
	FREEMAIL_TO(0.00)[redhat.com,lunn.ch,davemloft.net,google.com,kernel.org,suse.com,linuxfoundation.org,sfgoth.com,gmail.com,katalix.com,linutronix.de,arndb.de,linux.intel.com,debian.org,vger.kernel.org,lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:mid,linux.dev:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 2026/5/5 19:16, Paolo Abeni wrote:
> On 4/30/26 11:05 AM, Qingfang Deng wrote:
>> Historically, PPP maintained two separate structures for a channel:
>> 'struct channel' was internal to ppp_generic.c, while 'struct ppp_channel'
>> was the public interface that drivers were required to embed. This
>> duplication was redundant and forced drivers to manage the lifecycle of
>> the public structure.
>>
>> Unify these two structures into a single 'struct ppp_channel', which is
>> now internal to ppp_generic.c. Drivers now use a 'ppp_channel_conf'
>> structure to specify registration parameters and receive an opaque
>> pointer to the allocated channel.
>>
>> Key changes:
>> - ppp_register_channel() and ppp_register_net_channel() now return
>>    a 'struct ppp_channel *' instead of taking a pointer to a driver-
>>    embedded structure.
>> - 'struct ppp_channel_ops' methods now take the driver's 'private'
>>    pointer directly as their first argument, simplifying driver logic.
>> - ppp_unregister_channel() now takes the opaque pointer.
>> - Multilink-specific fields are unified and handled via the new
>>    configuration structure.
>>
>> This cleanup simplifies the driver interface and makes the channel
>> lifecycle management more robust by centralizing allocation in the PPP
>> generic layer.
>>
>> Assisted-by: Gemini:gemini-3-flash
>> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
>> ---
>>   drivers/net/ppp/ppp_async.c      |  51 +++++-----
>>   drivers/net/ppp/ppp_generic.c    | 161 +++++++++++++++----------------
>>   drivers/net/ppp/ppp_synctty.c    |  51 +++++-----
>>   drivers/net/ppp/pppoe.c          |  34 ++++---
>>   drivers/net/ppp/pppox.c          |   4 +-
>>   drivers/net/ppp/pptp.c           |  40 ++++----
>>   drivers/tty/ipwireless/network.c |  30 +++---
>>   include/linux/if_pppox.h         |   2 +-
>>   include/linux/ppp_channel.h      |  49 ++++++----
>>   net/atm/pppoatm.c                |  61 ++++++------
>>   net/l2tp/l2tp_ppp.c              |  34 ++++---
>>   11 files changed, 271 insertions(+), 246 deletions(-)
> This patch is IMHO a bit too big and should be split. Also this kind of
> refactor looks very invasive and potentially regression prone. I think
> it should include a signficant self-test coverage increase.
This is indeed too big. But how do I split it without breaking the build?

