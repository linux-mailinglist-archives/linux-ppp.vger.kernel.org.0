Return-Path: <linux-ppp+bounces-540-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOu6HPOh5mkrzAEAu9opvQ
	(envelope-from <linux-ppp+bounces-540-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 21 Apr 2026 00:00:19 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D77DC434685
	for <lists+linux-ppp@lfdr.de>; Tue, 21 Apr 2026 00:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D00F3014111
	for <lists+linux-ppp@lfdr.de>; Mon, 20 Apr 2026 22:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CA83C872E;
	Mon, 20 Apr 2026 22:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsSRC5On"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6020F38839E;
	Mon, 20 Apr 2026 22:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776722416; cv=none; b=KGBy674pri8h73EAXpr2j6bPPjW+Bh9i9shfBsxt0JWOEPrugU/5MoiL61smOfsWQxRoM0F81TyFRO52/Y0tyezNO+8YHvSXrOQKmj0O2KypjxvbFLlVOHyhIT/+5GHBuZDTQF+4gGuACobzdrhMRWNCQ3SR0kKrold/Ty6ajQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776722416; c=relaxed/simple;
	bh=QR/8cHnqd6+vOK0xUfqu7iYxojV1Ntv/Ki9++Wao/Rw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tDzcjmqAkYsoM9gyTgnMT07L4qeazzRzYwFJdFsZA1UXfIEwwihkrYWBbK/ihiN5tYLFPW7OhAxAYUdYNjnwvQrEm3b8xscy14qgaRzk1MkxgvR3eOTNa8W6vA9pIiHgJ1GQHVLHpoh/uhr25RuUy7m4tN2OaHHBDuK0ESdP/yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsSRC5On; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7705C19425;
	Mon, 20 Apr 2026 22:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776722416;
	bh=QR/8cHnqd6+vOK0xUfqu7iYxojV1Ntv/Ki9++Wao/Rw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SsSRC5OnWD9AXK8gICPErZJeizfMCVnOPytk11QIXjMqKI296I4wGpqicGozS5s2L
	 SNls9RZYAWod4mtXbWIEZDacQWLd0fSovBT+RTTgoSFmNladZu1k2a+mVMD14RQLD+
	 Tk+ph+wWT5QJ68nJqrJQTcD/FiVTqRQaWpBF4PivGLa5SFilMuqG2APznYguMJVxt7
	 11wg+ifBw5Qh4VCwUQZ8yrEt0N/bZpr33KqJUpBvw8JrLzV4IiXMisVrr9A6aJEjko
	 7DwRylYSnqZmqjguzY8/RQ4kgH+jo5mOcJnZJAAVq0q6tzp7Cior9GknSmjtUvt+Ib
	 ZqjAc097n3DCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D1D63930022;
	Mon, 20 Apr 2026 21:59:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v6 1/2] flow_dissector: do not dissect PPPoE PFC
 frames
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177672238004.1802062.14523487791539173606.git-patchwork-notify@kernel.org>
Date: Mon, 20 Apr 2026 21:59:40 +0000
References: <20260415022456.141758-1-qingfang.deng@linux.dev>
In-Reply-To: <20260415022456.141758-1-qingfang.deng@linux.dev>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: linux-ppp@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, gnault@redhat.com,
 wojciech.drewek@intel.com, anthony.l.nguyen@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, paulus@ozlabs.org,
 jaco@uls.co.za, carlsonj@workingcode.com, marcin.szycik@linux.intel.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-540-lists,linux-ppp=lfdr.de,netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D77DC434685
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 15 Apr 2026 10:24:50 +0800 you wrote:
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
> [...]

Here is the summary with links:
  - [net,v6,1/2] flow_dissector: do not dissect PPPoE PFC frames
    https://git.kernel.org/netdev/net/c/d6c19b31a3c1
  - [net,v6,2/2] pppoe: drop PFC frames
    https://git.kernel.org/netdev/net/c/cc1ff87bce1c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



