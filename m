Return-Path: <linux-ppp+bounces-462-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO26OpFJx2l3VAUAu9opvQ
	(envelope-from <linux-ppp+bounces-462-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Sat, 28 Mar 2026 04:22:57 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFE834D277
	for <lists+linux-ppp@lfdr.de>; Sat, 28 Mar 2026 04:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACDFA305E33C
	for <lists+linux-ppp@lfdr.de>; Sat, 28 Mar 2026 03:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340EE25783C;
	Sat, 28 Mar 2026 03:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l01uCRhY"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11002262A6;
	Sat, 28 Mar 2026 03:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774667984; cv=none; b=kC0NLCxiT+yFZkqkimOhu3Hf8AHDZcDiMnrqppItS9mb21jgYj0xtin8CD/jPm0CmoG9P1bxLF896OCU4dJHdNmJrGhYauu78LFcfrHhe6Lg441WbYoNIsqQiT7ZSjV0m36BUYvzoB1ccrBhybRc4DkmJZQx2RXX/8aWJSamoNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774667984; c=relaxed/simple;
	bh=trtiJ8ZCxF65eZ3wvWMhaFiP+qCPUSG5fXwLTqNgZQc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BNEGrEHLZc511BLnjEIPA5a2pLecfMV4/KBDfLYnAIhXPQALxVaIi8N9FlKsBhHEQp+4s3DY9HIfFQbKzRhoFJAJkNT2vTxNhbXFoD8GCekCdE9UukT3m9Y2+xwVCa0HKzp6RCCkQwl84GA1/nG4GwuX1ELDdAurF6bcno5XlYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l01uCRhY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D12C19423;
	Sat, 28 Mar 2026 03:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774667983;
	bh=trtiJ8ZCxF65eZ3wvWMhaFiP+qCPUSG5fXwLTqNgZQc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=l01uCRhYj01QJbjUU3ljKvwSMseeSjKhiixZH8mJFaNMI2mAjERiqBJSqdvhAm+z0
	 BV+riBFoNekekz/DCdvHeWL7q6Ln4EVCf6RbzymEl1Roh8oTvZGBJf3EtFOf+9QL3o
	 mxYO+iIB8ax9aH2dAS6+glqaPHdqi+rexZgvcmXywavV6/WIQ4MsyDmGpIqzLw6cNj
	 9BpwIuByrVLPcUysC3lRR6bdahDTdTLsE8geN2OSukiWUVsKRcJFIqlQ3+8s0mjriT
	 bOdc6DoAFiBpR7KMOjoOe0c44YZFosxSgzXxFBb0BeTI8R0oYfitCU8eZFAlDUfI/4
	 x6Py/BjL+5wzQ==
Date: Fri, 27 Mar 2026 20:19:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Felix Maurer <fmaurer@redhat.com>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>, Antonio Quartulli
 <antonio@openvpn.net>, Petr Machata <petrm@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org, Paul Mackerras
 <paulus@ozlabs.org>
Subject: Re: [PATCH net-next v6] selftests: net: add tests for PPP
Message-ID: <20260327201942.3d8b8c33@kernel.org>
In-Reply-To: <20260327033438.125135-1-dqfext@gmail.com>
References: <20260327033438.125135-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-462-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7CFE834D277
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026 11:34:19 +0800 Qingfang Deng wrote:
> v6: fix SC2329 scope
>  https://lore.kernel.org/netdev/20260327024202.111655-1-dqfext@gmail.com/

At most one version every 24h, please:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#tl-dr
-- 
pv-bot: cr

