Return-Path: <linux-ppp+bounces-561-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJCVOLBf9Wn7KgIAu9opvQ
	(envelope-from <linux-ppp+bounces-561-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Sat, 02 May 2026 04:21:36 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 513034B0AE1
	for <lists+linux-ppp@lfdr.de>; Sat, 02 May 2026 04:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97C1A30262E4
	for <lists+linux-ppp@lfdr.de>; Sat,  2 May 2026 02:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6DC2D060B;
	Sat,  2 May 2026 02:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3DcAmte"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA40A2C3255;
	Sat,  2 May 2026 02:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777688460; cv=none; b=a4h7HUlv3kIkCSZ+RdtgXHgvdm/CA1hq84nerxtg7zQpJOgMhUAtWMFiC68awHDXNEDa0DLyoZszYXRJjW32O3Ts6p0J4f5EbolgPBqbY461qwCOUnGCj3PM7mr1c5aWFincIBOh9t2wBpYAxRKcXZb9IxIhNhbM6siT/CeYn0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777688460; c=relaxed/simple;
	bh=Ofgt7btGVpRvKmq+6gkx38eG92/3wWrFThkzMqOx1ss=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=upm9e4xxcU2RYWjOpI+UXdpUNVmCpxc+NXuBgF+XrhTWqbhUBIx4TKtWYYV8Wnjxr4MNVqUnxeQ+G9m4UvZbHiVx5XowVXvJhrYRwngdne+MEDLLuxi149Ood0DwGgAFkBzmbW0m+0Qz/9AtQ/2sfNqlV9R5rUHxwLT/KxON+xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3DcAmte; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C8BC2BCB4;
	Sat,  2 May 2026 02:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777688460;
	bh=Ofgt7btGVpRvKmq+6gkx38eG92/3wWrFThkzMqOx1ss=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=D3DcAmteF8lbzYTiPxzjSbumF5SVoMQ5gAIlY0lDCUDp84FspErdE0byKluDySHlY
	 t5P6VfRV0A4GR+0+VZeF53fv7lH/qH/MFWhmAaWcW2xqcKjlXo3LhQpSlMzqg2Nmim
	 60OHMMoMxcw7JorrfGBJ7jcqxioCTp9CqHL5cRCFPkJGiAUYC0X2loegKmthVDQbFa
	 4xSY8ZHMU4FKaHXEl63f+67D8J2SarmcKIdhJwb6hMB6vXuBZ2V2CYBip4k/lc/xqE
	 MuTHNQUaDapxuEkwnR73/wojbsNlrBnmt16Kp8PLkW6G4QsmCgPOU5Q51rHIs+CWMI
	 mRuVTnx3bKTjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E4D380CEF5;
	Sat,  2 May 2026 02:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] pppoe: optimize hash with word access
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177768841354.3694990.3487399216573568598.git-patchwork-notify@kernel.org>
Date: Sat, 02 May 2026 02:20:13 +0000
References: <20260429023848.153425-1-qingfang.deng@linux.dev>
In-Reply-To: <20260429023848.153425-1-qingfang.deng@linux.dev>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, gnault@redhat.com, kees@kernel.org,
 ericwouds@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ppp@vger.kernel.org
X-Rspamd-Queue-Id: 513034B0AE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-561-lists,linux-ppp=lfdr.de,netdevbpf];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 29 Apr 2026 10:38:46 +0800 you wrote:
> Currently, hash_item() processes the 6-byte Ethernet address and the
> 2-byte session ID byte-wise to compute a hash.
> 
> Optimize this by using 16-bit word operations: XOR three 16-bit words
> from the Ethernet address and the 16-bit session ID, then fold the
> result. This reduces the total number of loads and XORs. The Ethernet
> addresses in a skb and struct pppoe_addr are both 2-byte aligned, so the
> u16 pointer cast is safe.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] pppoe: optimize hash with word access
    https://git.kernel.org/netdev/net-next/c/ff393252f99f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



