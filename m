Return-Path: <linux-ppp+bounces-494-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MSTMoDa1GlxyAcAu9opvQ
	(envelope-from <linux-ppp+bounces-494-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 07 Apr 2026 12:20:48 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 210DC3ACB53
	for <lists+linux-ppp@lfdr.de>; Tue, 07 Apr 2026 12:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F0983014F5D
	for <lists+linux-ppp@lfdr.de>; Tue,  7 Apr 2026 10:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3403A7F5F;
	Tue,  7 Apr 2026 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jC7/+l38"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A67B3A4F3F;
	Tue,  7 Apr 2026 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557228; cv=none; b=NVbSwxZ28Esb1Imr6A6o0bQWjg1YvuFuMe7zvBdacMI8lOLXnYI4IqSAgeXhekgMmShmozpaK8yarCbUcWNphiclOIUgiKWZIfOXuKAlzXhevP4VOCxNKUD0wUWzx63+aeT0jyEwA1jFm3CEUC33g7e34+CCVxdL9WrbZcr5R0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557228; c=relaxed/simple;
	bh=BgrqH19s4U795fBMpKD6PT+rWQJV1FNyQlaoQQ7325A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZZb0BoJQ9E7zNL1GqAdEbNnviXv4LADF5pZMouACAt/BbKVE2Z+6Fhc00TYvVTYAvj7b1BrRd3wJbOtEqlV8BdbIfdfFFILgyToW+ImsSeas7QUObpkuHr0BzZqy8nlNhKL3a4Yp2g0P6NLT81cpcYbr8l9Kz/nCXzC6F7y74Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jC7/+l38; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8965C116C6;
	Tue,  7 Apr 2026 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775557227;
	bh=BgrqH19s4U795fBMpKD6PT+rWQJV1FNyQlaoQQ7325A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jC7/+l38ApsiaYucwX5mB3kg3p/WmGnj7KNogOi6EJ59Pg5SiMYwijdSjCb/RVqqo
	 pIZHuGYSkzS/JGiQbD2YJn2M8eqyANMWKBzI8jYdQofvP69CWpQ5vJ8xihi3QGfcUK
	 TxCd+OpNVBhLAVS037XiQ+o3+xS5otI+Ee4jCYH33mIk5Q7w49dfyQf6MjryQMtq9Y
	 h4D9436WJjb55T8Whlctri1ZEOuyOZtEn1uXn8wJihNWAZBTsuh0wjpDSdmW3elntm
	 F+orzVuCjt/g+tuaQl26mDrQddutat0CRvzeY/8hZBRZzRGv+MVLJ/vu3zlPMcX25p
	 /g2w7/eCzmt/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02C893809A28;
	Tue,  7 Apr 2026 10:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v8] selftests: net: add tests for PPP
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177555720555.3496835.4333765541275233582.git-patchwork-notify@kernel.org>
Date: Tue, 07 Apr 2026 10:20:05 +0000
References: <20260403034908.30017-1-qingfang.deng@linux.dev>
In-Reply-To: <20260403034908.30017-1-qingfang.deng@linux.dev>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: linux-ppp@vger.kernel.org, shuah@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 bigeasy@linutronix.de, fmaurer@redhat.com, petrm@nvidia.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org, paulus@ozlabs.org, dianne@skoll.ca, jaco@uls.co.za,
 carlsonj@workingcode.com, andrew@lunn.ch
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-494-lists,linux-ppp=lfdr.de,netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pppoe.so:url]
X-Rspamd-Queue-Id: 210DC3ACB53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri,  3 Apr 2026 11:48:47 +0800 you wrote:
> Add ping and iperf3 tests for ppp_async.c and pppoe.c.
> 
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
> v8:
>  - locate pppoe.so and pass it to pppoe-server
>  - start socat as a syslog listener and dump the log messages if the test fails
>  https://lore.kernel.org/netdev/20260330035604.133073-1-dqfext@gmail.com/
> 
> [...]

Here is the summary with links:
  - [net-next,v8] selftests: net: add tests for PPP
    https://git.kernel.org/netdev/net-next/c/dfecb0c5af3b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



