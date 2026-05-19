Return-Path: <linux-ppp+bounces-586-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHrJCYgbDGpJWQUAu9opvQ
	(envelope-from <linux-ppp+bounces-586-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 19 May 2026 10:12:56 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8211E579BE7
	for <lists+linux-ppp@lfdr.de>; Tue, 19 May 2026 10:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C714F300EFA0
	for <lists+linux-ppp@lfdr.de>; Tue, 19 May 2026 08:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061E73E00B0;
	Tue, 19 May 2026 08:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4+0yZwN"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42543E00A2;
	Tue, 19 May 2026 08:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178195; cv=none; b=e9oZjAF38buM6XNkI46of1UB2J7MXwCvszlovGWaIoK+VwkmUCcVByX5P66teQVkADWS7vjdLaGLlpArguRmlWVLb7lPTD8YGKL9ek5GCgLA+OnQhmDM6nlXhSTGSqxdbHtGrM9lDNYdTwjCAce3KklxzrKeA+PvVnLpSUGVxOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178195; c=relaxed/simple;
	bh=VmMmEMWfS9cFzB7Eeb6N342RO4jFNK5fLY7jxXQmAPs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dlDx/vCdyc+ydN5KmEban8APIAhDTML9mc9tGYNmgZ+WHSbQUs43vRTU8yWXeqcXGrYUaUJi+JmIpL81f+Dxv8s9eDfbe2+eUSj9Y5VgI9jGBqpjmMkOAG1zWgdmJFF+0qVJn2lZMDyryehPaJ3Rd+PwFepcVo+kekawDXBzeX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4+0yZwN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772BAC2BCB3;
	Tue, 19 May 2026 08:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779178195;
	bh=VmMmEMWfS9cFzB7Eeb6N342RO4jFNK5fLY7jxXQmAPs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=m4+0yZwNfqlEewvcJ5Okf8UjI/B3MVv3Aliy//dhO2yniYblDyT+fWU3xppffv8Z6
	 3TfGsGbHX/hfDqO05R+ZOJfucgSksIEDh5m/+Jj4cu5gaRs4AmDVnRv7Aw4g+IzrkL
	 qQ9VFgGKlbTUXK+vvH4gEZFs5lwX5fuC0AODbl/ovcwo9EJ9TGZQ5jlxqVTRirb784
	 t4yMznLj+2in0aNhd9iRmS1N/QeL+k3vkBi6pvdgpZHzIdgqzU0gxKw4NF8+ACMX64
	 bi4S+Pb+gEpmMtXHaksU7uPyoBDdc5KLcom5rofCwYCvUZUL4VgWEkNfKEkAw/MI0E
	 Y5xZqn1O9IGVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A4D3930DC3;
	Tue, 19 May 2026 08:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v10 1/2] net: pppoe: implement GRO/GSO support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177917820664.2159730.6924688114154497068.git-patchwork-notify@kernel.org>
Date: Tue, 19 May 2026 08:10:06 +0000
References: <20260513013400.7467-1-qingfang.deng@linux.dev>
In-Reply-To: <20260513013400.7467-1-qingfang.deng@linux.dev>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org,
 idosch@nvidia.com, gnault@redhat.com, kees@kernel.org, nbd@nbd.name,
 ericwouds@gmail.com, willemb@google.com, kuniyu@google.com,
 richardbgobert@gmail.com, jiayuan.chen@linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, pablo@netfilter.org,
 aleksander.lobakin@intel.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-586-lists,linux-ppp=lfdr.de,netdevbpf];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,nvidia.com,nbd.name,gmail.com,linux.dev,vger.kernel.org,netfilter.org,intel.com];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8211E579BE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 13 May 2026 09:33:48 +0800 you wrote:
> From: Felix Fietkau <nbd@nbd.name>
> 
> Only handles packets where the pppoe header length field matches the exact
> packet length. Significantly improves rx throughput.
> 
> When running NAT traffic through a MediaTek MT7621 devices from a host
> behind PPPoE to a host directly connected via ethernet, the TCP throughput
> that the device is able to handle improves from ~130 Mbit/s to ~630 Mbit/s,
> using fraglist GRO.
> 
> [...]

Here is the summary with links:
  - [net-next,v10,1/2] net: pppoe: implement GRO/GSO support
    https://git.kernel.org/netdev/net-next/c/55a5d8fca836
  - [net-next,v10,2/2] selftests: net: test PPPoE packets in gro.sh
    https://git.kernel.org/netdev/net-next/c/6160ec9d03d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



