Return-Path: <linux-ppp+bounces-432-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOJiAoXOu2mXogIAu9opvQ
	(envelope-from <linux-ppp+bounces-432-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 19 Mar 2026 11:23:01 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2822C968E
	for <lists+linux-ppp@lfdr.de>; Thu, 19 Mar 2026 11:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50102310907B
	for <lists+linux-ppp@lfdr.de>; Thu, 19 Mar 2026 10:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC7C37AA99;
	Thu, 19 Mar 2026 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLxfvGyk"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9859837A4AA;
	Thu, 19 Mar 2026 10:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773915614; cv=none; b=kj0fdlVUtWTyqVOta2Ubdbz4Gz9UjcnFHDuAcJDy1YiasdF6zb4/C/8YJ88ztGp8mrqvE59zbp1rR5Ko6TumenYY+2uD6yIkCkaAu/QNSCT+eaUC7jxzG1CVZFIw4imC37QZEAD27yNzMYDQL7MgmjHvALfXW/VqEK5enY4d4aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773915614; c=relaxed/simple;
	bh=OnXtvnbQHK2flsCEHfM2PVexlbobgVrSL8KsWzpCArw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dc5Xvca7zcrNVBxYxLCnlA5VrQKa6Y+n9qUJFKKjuv7PeavgNe6J18hoZrgwpX8R9QAYtOx5mtHUZf7nSbXRyhcjRjpEjUaikf15yZe60RXUEDmrdH6yuBYVsAaeLiG/7eM3XapSRi80MeQPLpVRSb+mrGtAXZNBEw8KzdxioRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLxfvGyk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5402C19424;
	Thu, 19 Mar 2026 10:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773915614;
	bh=OnXtvnbQHK2flsCEHfM2PVexlbobgVrSL8KsWzpCArw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dLxfvGykVOMovs7FsGRisJPWgl23tpLu8Y2IVWmRL89ax3L5EAVLj98j5w3ZPkIK/
	 j/1ECMKp046uc8zDw4r7wCpHMMMIKZQAl3Z2ZXfnN0fD/I8Uz3uQZASEEdbZmRefYW
	 UCenwBff0MkbN5IOWFbzthyeAEp6xZVTpHdAI4N+by5VnJewxGkMKiJWxw/CETnWv6
	 QRh7lKiK1qosws4r43va7kuRXyPMQWC/EgfXjfPNWCH6Z6Tg/GYQSQsl60wkMJSZ4J
	 lxrgsMjCcdgi7CpXqKvf63WWLEVkJTNaKA4P1XKF5SlKsWvsCBIOwlBWH2d6sxhKeZ
	 4WJcYWWLzyKfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FFBC3808200;
	Thu, 19 Mar 2026 10:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] l2tp: ppp: use max L2TP header size for PPP
 channel hdrlen
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177391560504.1132014.16515516280241252306.git-patchwork-notify@kernel.org>
Date: Thu, 19 Mar 2026 10:20:05 +0000
References: <20260317054141.524879-1-dqfext@gmail.com>
In-Reply-To: <20260317054141.524879-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-ppp@vger.kernel.org, jchapman@katalix.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-432-lists,linux-ppp=lfdr.de,netdevbpf];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C2822C968E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 17 Mar 2026 13:41:40 +0800 you wrote:
> chan.hdrlen is read once at channel registration by
> ppp_register_net_channel(), and used to set the PPP net device's
> hard_header_len. It was set to PPPOL2TP_L2TP_HDR_SIZE_NOSEQ (6), which
> is 4 bytes too small if sequence numbers are later enabled via
> setsockopt(PPPOL2TP_SO_SENDSEQ), causing unnecessary skb reallocations
> on the TX path.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] l2tp: ppp: use max L2TP header size for PPP channel hdrlen
    https://git.kernel.org/netdev/net-next/c/9f4960b94f1a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



