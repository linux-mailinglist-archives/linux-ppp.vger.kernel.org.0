Return-Path: <linux-ppp+bounces-522-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKhKBhMd3GmAMwkAu9opvQ
	(envelope-from <linux-ppp+bounces-522-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Mon, 13 Apr 2026 00:30:43 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 489243E648B
	for <lists+linux-ppp@lfdr.de>; Mon, 13 Apr 2026 00:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 448F6300B98E
	for <lists+linux-ppp@lfdr.de>; Sun, 12 Apr 2026 22:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412DB313E07;
	Sun, 12 Apr 2026 22:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/uE9aEN"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1B727603C;
	Sun, 12 Apr 2026 22:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776033038; cv=none; b=d2BXNFFHv33Fd3DvbR+mNTkyJYn/qVnvfCzgR3Ju3X+2l6HWGlS/NU79JtvnwBn9RvGac+t/TJNU5B4pDVIsLzArOYi7fSTHe3UQuJ6kwbRhovYrXa5ul8xzwf3SBH6f+Z5R4lPBBcChlqCbfKJXmGJ6F8dOHQzeCphIELyti3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776033038; c=relaxed/simple;
	bh=aA+ku4Sz8/F8R0EYCaVyhBIbejupgxFNVHSxz/AD17I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TXBd2drljBetWnZkjz5PkKJCXU664dyt8Hk3nmLNPRTWPANquxmv/teG2M5PJLIGebhv2869fCNISGmex2EOk9hZIi8Q5Iv44gyFKPrNbtH+W/Jjq2L+/82DWuRbAm/Y9u/fpEOhSp7R9N9a4ONlF7g4PYSYhRPPyg29GvXvMCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/uE9aEN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF169C19424;
	Sun, 12 Apr 2026 22:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776033037;
	bh=aA+ku4Sz8/F8R0EYCaVyhBIbejupgxFNVHSxz/AD17I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S/uE9aENh/HD9h+qxIoLm56W9JYkooMTP953yZR202fwF1jI24cNj8srRxuSGqeMs
	 qHwf6sAmTgzXpt0LEtkr88RTwrVa26fMuQ8gy+Vv3lGUN2eeFoamDmQGowtDUUIXqc
	 xSv/tMrmHluzfmIsg2VNqxO5cfs7iu0BpotvywCBVtHvY1LH0ZqW6WOgwv1jdYLbHr
	 7HFzC6Ai7+MzPBlPgtCQv49n6HFq2lcB1T/4q5lWp5UXB6dEi2DhzCoFrYLpYTbZOj
	 0UbMhdr1ZUKWd1CsPfj4qUmmNd/uoLohexrWTSLuzz8iDHjJUXNvnyOa1mdrX2HBY4
	 0YqX91mX/le9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FC6D3809A8C;
	Sun, 12 Apr 2026 22:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 1/2] pppox: remove sk_pppox() helper
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177603300979.3841629.1311062865318467682.git-patchwork-notify@kernel.org>
Date: Sun, 12 Apr 2026 22:30:09 +0000
References: <20260410054954.114031-1-qingfang.deng@linux.dev>
In-Reply-To: <20260410054954.114031-1-qingfang.deng@linux.dev>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, kees@kernel.org, gnault@redhat.com,
 ericwouds@gmail.com, dawid.osuchowski@linux.intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ppp@vger.kernel.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,linux.intel.com,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-522-lists,linux-ppp=lfdr.de,netdevbpf];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 489243E648B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 10 Apr 2026 13:49:49 +0800 you wrote:
> The sk member can be directly accessed from struct pppox_sock without
> relying on type casting. Remove the sk_pppox() helper and update all
> call sites to use po->sk directly.
> 
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
> Changes in v2: none
>  Link to v1: https://lore.kernel.org/r/20260408015138.280687-1-qingfang.deng@linux.dev
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] pppox: remove sk_pppox() helper
    https://git.kernel.org/netdev/net-next/c/105369d627b9
  - [net-next,v2,2/2] pppox: convert pppox_sk() to use container_of()
    https://git.kernel.org/netdev/net-next/c/6bc78039a77a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



