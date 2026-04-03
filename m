Return-Path: <linux-ppp+bounces-489-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILgpEmxJ0Glu5gYAu9opvQ
	(envelope-from <linux-ppp+bounces-489-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Sat, 04 Apr 2026 01:12:44 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B05398FDF
	for <lists+linux-ppp@lfdr.de>; Sat, 04 Apr 2026 01:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10371301840A
	for <lists+linux-ppp@lfdr.de>; Fri,  3 Apr 2026 23:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04BE38C434;
	Fri,  3 Apr 2026 23:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+BGEeaU"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF7B38AC96;
	Fri,  3 Apr 2026 23:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775257862; cv=none; b=ZYADXYm00PodvnhLL1Nd27IVAD8eGsFvFtyqlhhUs35PbUfU+fShotnyt2kIMz/KCLvsRdA1R9WsMPlCJ/5GeiXT1X0Djww63kuaVaxnm5GjbdcGsJ/ybfCxRkJlEYYOjmedP+j8nvJYkHoJhx8mnnv7ssc/2qIDU+eT/oq9J1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775257862; c=relaxed/simple;
	bh=Ix2IRtcBe4TdSRrbrGQsg4zxILQHqed8Jj50AlSSFKw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=d0OvGIhn5yqPQJLmch/IgnoUidn77+4RsD7elht5tmR3FR1xQzVoy0rd+yN5CvCKAErQBXsmI4GuZyIrGntlykrCSaCaSBsqugzvvz89Ewb0MlfopMJJEXToRRt2k4XmMhfKOMlg/KlHvUglXBsUvupRPmy0J5Df0XB7LVsbmTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+BGEeaU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EABAC19423;
	Fri,  3 Apr 2026 23:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775257862;
	bh=Ix2IRtcBe4TdSRrbrGQsg4zxILQHqed8Jj50AlSSFKw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=l+BGEeaUXGXGiuqza2rMj/C8Pwd+lHAvH6Wqh4siKoOD1IO9tNQYNquuciKnCFZIs
	 KbzgdRF2qc9oHFe68kfD2H/n6gilXKPBs+A2oG/GNfy/Z+OidU62BI3jDNoDEuEFdH
	 t5G7VbJHfqjSj6+nfnmwRkjtHQoixKMLOm5OqC2GwJx+aV/T18S76bS0HZI+hb16C4
	 iTeD9gyvaPX2vKnFuk1/H5Mh42vX820uA/Ea0neWggMuUrALdauETT2BL+1jI00tP4
	 KBLSVjenSNEeGhHuAxZ3YSGgrH7Ae8o12TsD2G2fdAp+jRrqXE+kyG4X/fcAt3UyV3
	 1m0svJmXE+Heg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FCCB3809A14;
	Fri,  3 Apr 2026 23:10:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] ppp: update Kconfig help message
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177525784378.1484550.10647579476191205570.git-patchwork-notify@kernel.org>
Date: Fri, 03 Apr 2026 23:10:43 +0000
References: <20260402050053.144250-1-qingfang.deng@linux.dev>
In-Reply-To: <20260402050053.144250-1-qingfang.deng@linux.dev>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: linux-ppp@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 julianbraha@gmail.com, ebiggers@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, paulus@ozlabs.org, dianne@skoll.ca,
 jaco@uls.co.za, carlsonj@workingcode.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-489-lists,linux-ppp=lfdr.de,netdevbpf];
	FREEMAIL_CC(0.00)[vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,ozlabs.org,skoll.ca,uls.co.za,workingcode.com];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0B05398FDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  2 Apr 2026 13:00:50 +0800 you wrote:
> Both links of the PPPoE section are no longer valid, and the CVS version
> is no longer relevant.
> 
> - Replace the TLDP URL with the pppd project homepage.
> - Update pppd version requirement for PPPoE.
> - Update RP-PPPoE project homepage, and clarify that it's only needed
>   for server mode.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] ppp: update Kconfig help message
    https://git.kernel.org/netdev/net-next/c/779fae61a3c8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



