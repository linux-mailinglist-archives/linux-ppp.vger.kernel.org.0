Return-Path: <linux-ppp+bounces-627-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UwE0OoMzTmrgGwIAu9opvQ
	(envelope-from <linux-ppp+bounces-627-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Jul 2026 13:24:51 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 848FE724F06
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Jul 2026 13:24:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=g1x4puQ4;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-627-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-ppp+bounces-627-lists+linux-ppp=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B55A3301B738
	for <lists+linux-ppp@lfdr.de>; Wed,  8 Jul 2026 11:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E222C477E48;
	Wed,  8 Jul 2026 11:20:27 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75E2437864;
	Wed,  8 Jul 2026 11:20:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509627; cv=none; b=iNLok5+HIZ8wmv/zKuMl/YnOvb/p/VNdrWVpnyPqDmZsyaU1lnzN+0nDroKHPxHDADrcAZlQHeErAk3MLiPySMdwrD1Wlpu4xjgPGUMCur2IpbeDk9oeNL0KRatoyqkv+E6omA5BfiUHX3IaXXaUlCvGbGhVElIbZoPvpmpV5t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509627; c=relaxed/simple;
	bh=naTLxVv/Y3+9ERX1j0xr+5nj/poeZC/gIQxlXs0FlG4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tV4Y3Vtb4OkGeFYihFNBBBRwwYpR4ZeHs9zsVFaVXJdhd3YeID3z6OeyJ2xc1jQYs3tvxJ4GT2GHh1iYWwIjY/iiO0V40ueegO596A9NbyYY3dqasJu9ZvJ6MvqA/kbvWd4JblzA8RcDK4FHiewAlR7koJONmksM2YshAKmcOEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1x4puQ4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532061F000E9;
	Wed,  8 Jul 2026 11:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783509626;
	bh=AlmlQCmyiMaFrtx4Cjr1TuapotDHv/aiEeNOwcW3/n8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=g1x4puQ4PP8btquU8CG5zu4KwIMmALu+i8Evwq2BgnwCfTye0eRBvTLaJsD8Oqi/+
	 dGJaIT4xBfqF+LlpXMSGa4MVt1TyecGfyp3KQun2nAFmyg2ILL2MqDFzS+ke11h/rQ
	 t6gA+OVsiJmfvo7hqqCH+i9HomM8l4gsPuG7MJa68FSqmshVpem6Rqdd9F0anB6qdD
	 oVvra+0/KpOToqp+H9Lj7HEu76RcdVCa6PXloOSQE0RJ9GM/h6nYvwscHPODuBo01r
	 pr7nvxgKwHOhELk67ruWhCd/N5b04wY8DMyzz83G9s6PBUzH2YRJj8xB3Op2S87N0O
	 axmHah6Tq/fxA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0C44392666F;
	Wed,  8 Jul 2026 11:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ppp/ppp_{async,synctty}: drop unused
 {a,}syncppp::bytes_{sent,rcvd}
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178350960564.2449791.1582849842162293264.git-patchwork-notify@kernel.org>
Date: Wed, 08 Jul 2026 11:20:05 +0000
References: <20260702060420.95023-1-jirislaby@kernel.org>
In-Reply-To: <20260702060420.95023-1-jirislaby@kernel.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: kuba@kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-627-lists,linux-ppp=lfdr.de,netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jirislaby@kernel.org,m:kuba@kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:linux-ppp@vger.kernel.org,m:netdev@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 848FE724F06

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu,  2 Jul 2026 08:04:20 +0200 you wrote:
> The bytes_sent and bytes_rcvd members of structs asyncppp and syncppp
> are not used. Drop them.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Andrew Lunn <andrew+netdev@lunn.ch>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> 
> [...]

Here is the summary with links:
  - ppp/ppp_{async,synctty}: drop unused {a,}syncppp::bytes_{sent,rcvd}
    https://git.kernel.org/netdev/net-next/c/155c68aef239

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



