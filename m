Return-Path: <linux-ppp+bounces-509-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODMEO1Bq2GkhdAgAu9opvQ
	(envelope-from <linux-ppp+bounces-509-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Apr 2026 05:11:12 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDA13D1BCD
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Apr 2026 05:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13F4A301159C
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Apr 2026 03:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3461B3126A0;
	Fri, 10 Apr 2026 03:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBlyzcWA"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094313112B7;
	Fri, 10 Apr 2026 03:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775790648; cv=none; b=RjpC9dzeyO2QCgg5HJansWc219yN9IWMciOL2883ogEQIkP28nvudxoXQJvRhu2W3FAXepWnyJsY51qkSY7m+mC03Inh1CrhXbeUXMJiVsvvzQf9Ob/p/DNLsaUC3DIQyjP/JV6+ZXx4n/7z4qJBJcl9DTa1x52Q6dtC8AnNNxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775790648; c=relaxed/simple;
	bh=xp6ZHUYBt+ipykwdir0bXRPLQgohL15IKSt2ViWcrak=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VvSeEO2CJa/gzgqgJ8DBGKsHdcE4UrKOAYy5MHZzNj+PcS5Q4jmITx5i1HC8a7STAdqRToXcxxss2N9CMT52tEr2r87R5f1I/2eY/ru+GEzKCeASbim44mpWZ3q+7TEHMK3hcwI1/6D6ejsSvDylG1FJm7pQymoCKcslI25t5AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBlyzcWA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52C9C4CEF7;
	Fri, 10 Apr 2026 03:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775790647;
	bh=xp6ZHUYBt+ipykwdir0bXRPLQgohL15IKSt2ViWcrak=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DBlyzcWAXjv8j1Vpzp98c3T8lssURRprc+vNrVbeM6yln5vSINzrTt+GcfuskCecy
	 ha1y7uDgDxiQ1N4Ek8j1qcbK47YVsRVbrlwAPQpYjnmOyXiR8ylakVnsfRpZQgYU57
	 cgT4wpo354fQiJr+7gEnrAtem3aWMNNnxu0jbVpr72DWL21kuy2/0e/DzIDAEE1Pwp
	 X0xpQ7gO7j3dSNW+2j+/EyILuR4eikhZQ5EjRQ6rv0gCW11gTRGW9Yu6LQfGCfs8UP
	 kYXKmzRF2PXbnMJNv6ouWH21pNIxEgkqdtB157UoCJWSAgHO6R7LGZS3YgBR5PnZHC
	 cU5t/GAh3OYmQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD0E3809A22;
	Fri, 10 Apr 2026 03:10:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] ppp: consolidate refcount decrements
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177579062304.1844106.12587043725486867859.git-patchwork-notify@kernel.org>
Date: Fri, 10 Apr 2026 03:10:23 +0000
References: <20260407094058.257246-1-qingfang.deng@linux.dev>
In-Reply-To: <20260407094058.257246-1-qingfang.deng@linux.dev>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, bigeasy@linutronix.de, kees@kernel.org,
 kuniyu@google.com, linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-509-lists,linux-ppp=lfdr.de,netdevbpf];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8CDA13D1BCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  7 Apr 2026 17:40:56 +0800 you wrote:
> ppp_destroy_{channel,interface} are always called after
> refcount_dec_and_test().
> 
> To reduce boilerplate code, consolidate the decrements by moving them
> into the two functions. To reflect this change in semantics, rename the
> functions to ppp_release_*.
> 
> [...]

Here is the summary with links:
  - [net-next] ppp: consolidate refcount decrements
    https://git.kernel.org/netdev/net-next/c/5ecbebc9483c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



