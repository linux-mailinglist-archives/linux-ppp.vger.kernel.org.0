Return-Path: <linux-ppp+bounces-520-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOPDNLUF3GkgLQkAu9opvQ
	(envelope-from <linux-ppp+bounces-520-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Sun, 12 Apr 2026 22:51:01 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF763E5F16
	for <lists+linux-ppp@lfdr.de>; Sun, 12 Apr 2026 22:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F255A3008201
	for <lists+linux-ppp@lfdr.de>; Sun, 12 Apr 2026 20:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0086637F8B1;
	Sun, 12 Apr 2026 20:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="buhfVgRr"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D206B37F72E;
	Sun, 12 Apr 2026 20:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776027038; cv=none; b=tC3mUsQj2y3PD14pigcKnHIq5lq5Z+/vCXciB4gHHso/CAdcYtVr0xttjpZ/d1//qWlkA5r3+mm+BmsT1+Cc7zV5gLE7Hnxc7CoATRFwgO4nbnWrC2MXA+QGlQc9EuQNt3zkT0CGiieVj+U3C3l4mc72+Yjm+VCQDHymUV46fuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776027038; c=relaxed/simple;
	bh=w1bwdPfCZ0VJWoj41Ih1dh8BxW9pX3m0wzHksJTVOo8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KpSgNRGP/GfEDQ3hafhzY+3j0qpPyARaQYsbBmI+VB8QrvyzBqH1hlXWuzoE3FZN6YN0IjzytoxLcUJ7zNtvT09c/4aR/QWuxijPtY35cGi1m4uynBKdyyWLKCHfREYfN6FWcnJN4g5PJ/LaE8As1+IXYW6HOkAwqFQ41hwUTq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=buhfVgRr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80C2C19424;
	Sun, 12 Apr 2026 20:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776027038;
	bh=w1bwdPfCZ0VJWoj41Ih1dh8BxW9pX3m0wzHksJTVOo8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=buhfVgRrAtHFsoPUIxIt6WaGq5+prXzwODs+UfwMj6UANutuibQo/il+m21X9oxDS
	 VTbz9h6lHj98tq1rn1MTQFbXfUPUDKFwjhs9zuw8vAuuxG6afVQzEb0RaiflN3MIdW
	 RkMkNI8947UIkbsB/wsK46yLGp0RdkyxwSrMur5Si9x/iG2KYV2yTDZ1T6EqkZ/VU2
	 OpTEij4DVtKcxP4RkWcPfUETR7wPWyVLfpm7ElyBQDgWydn+7R4wKSr2usZgQ9EsZh
	 Y/ANL9n0Nvs6r/rduCfNJP5Syf/aWJS3WpS/oZ49/oo/FN5ZBvgoIPFwxr8Z1KBGyB
	 JzD9i2OETjCzw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD2B3809A8C;
	Sun, 12 Apr 2026 20:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] ppp: require CAP_NET_ADMIN in target netns for
 unattached ioctls
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177602701104.3405581.2910022095376672585.git-patchwork-notify@kernel.org>
Date: Sun, 12 Apr 2026 20:50:11 +0000
References: <20260409071117.4354-1-hataegu0826@gmail.com>
In-Reply-To: <20260409071117.4354-1-hataegu0826@gmail.com>
To: =?utf-8?b?7ZWY7YOc6rWsIDxoYXRhZWd1MDgyNkBnbWFpbC5jb20+?=@codeaurora.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, dqfext@gmail.com, kees@kernel.org,
 kuniyu@google.com, bigeasy@linutronix.de, gorcunov@gmail.com,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, qingfang.deng@linux.dev, gnault@redhat.com,
 jaco@uls.co.za, richardbgobert@gmail.com, ericwouds@gmail.com,
 teknoraver@meta.com
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,linutronix.de,vger.kernel.org,linux.dev,uls.co.za,meta.com];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	NEURAL_SPAM(0.00)[0.954];
	TAGGED_FROM(0.00)[bounces-520-lists,linux-ppp=lfdr.de,netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,codeaurora.org];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,?=,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3FF763E5F16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  9 Apr 2026 16:11:15 +0900 you wrote:
> /dev/ppp open is currently authorized against file->f_cred->user_ns,
> while unattached administrative ioctls operate on current->nsproxy->net_ns.
> 
> As a result, a local unprivileged user can create a new user namespace
> with CLONE_NEWUSER, gain CAP_NET_ADMIN only in that new user namespace,
> and still issue PPPIOCNEWUNIT, PPPIOCATTACH, or PPPIOCATTCHAN against
> an inherited network namespace.
> 
> [...]

Here is the summary with links:
  - [net,v3] ppp: require CAP_NET_ADMIN in target netns for unattached ioctls
    https://git.kernel.org/netdev/net/c/2bb6379416fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



