Return-Path: <linux-ppp+bounces-631-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RihDKlfbUGp36QIAu9opvQ
	(envelope-from <linux-ppp+bounces-631-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Jul 2026 13:45:27 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C720773A5FB
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Jul 2026 13:45:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fDJZdJQI;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-631-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-ppp+bounces-631-lists+linux-ppp=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1CB4D302F52E
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Jul 2026 11:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFEB4229C9;
	Fri, 10 Jul 2026 11:41:01 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C801341DEE4;
	Fri, 10 Jul 2026 11:40:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683658; cv=none; b=m4QhqsqSOX9OkHnpgFurNN1VW34ZJ+S5cz8mEF5KGBqEeCQHrW//TBlEqTs9oGYNKp5r49PDV51ja86f21+Tez27CwOarhM3M5rfDcu8bGEoT92ZdMtgXS0nF2wpu4tfApi7/8Xs0dUi7uWA2NhUEnllGvU0b/8/7Chd7M0kD6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683658; c=relaxed/simple;
	bh=Qiw8sO7D9OfWIkFKgSmfbQU5FuDCSZxhLrFe/qiy1ys=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=EVh/USz52jse7V4bXo5zBXSWMSS+XpS6vhyi6TD4i4ZYXHSaooMqzqbIxqk/9aSjwdXNMyelhK4Eavh1yv55g6GeO5WPklG6964aMB1EQtp+A7DkhdAy2DP+Sr1/WVFONaeL5pcU06kbJDqvtAg9xsjWVEGrV0A7Trbz4vaHkyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDJZdJQI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950D81F000E9;
	Fri, 10 Jul 2026 11:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783683632;
	bh=wOafub/PHc72pays8fyMJ0bla9fiEDFv5P07yKezDtI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=fDJZdJQI/AgRPokdECJbmsj+7q72wFddNGi00LXMs3B1jxEiS0D+nk3gb66BW7370
	 vejQ38EUDhYctxb62Si+0CyEL3mh1y3EPIHGPPaSYkEOUqKs9aXQxIb5LKl7ObJdeN
	 rfXbB4v7xiBrvM6sFRYj/0gDUsrF0M3JQe9LtAzs/xoY1UD+7oMUA2C5vCRSQRFxUa
	 I7D0MXeDmePXlPA8BS3DjodXLZJ/OYOuh3BnZKYvhiVu44Fnp3MAd/HbOnXrORN8fp
	 9EDkVnzkt1FDB+2WB7Rpgka9beNRxSVvOdPxEJYlKwYawdigygNz3QRnL658ytcC3L
	 WatHt9YqGmJmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B683A3924F8A;
	Fri, 10 Jul 2026 11:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] ppp: defer channel free to an RCU grace period to
 fix
 pppol2tp RX UAF
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178368361038.197766.8115253096775560860.git-patchwork-notify@kernel.org>
Date: Fri, 10 Jul 2026 11:40:10 +0000
References: <E793FCF2-58DE-4387-A983-C7B4BC3158BD@doyensec.com>
In-Reply-To: <E793FCF2-58DE-4387-A983-C7B4BC3158BD@doyensec.com>
To: Norbert Szetei <norbert@doyensec.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 qingfang.deng@linux.dev, yuehaibing@huawei.com, gnault@redhat.com,
 kees@kernel.org, hataegu0826@gmail.com, linux-ppp@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linux.dev,huawei.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-631-lists,linux-ppp=lfdr.de,netdevbpf];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:norbert@doyensec.com,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:qingfang.deng@linux.dev,m:yuehaibing@huawei.com,m:gnault@redhat.com,m:kees@kernel.org,m:hataegu0826@gmail.com,m:linux-ppp@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C720773A5FB

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 6 Jul 2026 11:01:59 +0200 you wrote:
> pppol2tp_recv() runs in the L2TP UDP-encap softirq RX path:
> 
>  l2tp_udp_encap_recv() -> l2tp_recv_common() -> pppol2tp_recv()
>    -> ppp_input(&po->chan)
> 
> It runs under rcu_read_lock() holding only an l2tp_session reference and
> takes NO reference on the internal PPP channel (struct channel,
> chan->ppp) that ppp_input() dereferences.
> 
> [...]

Here is the summary with links:
  - [net,v3] ppp: defer channel free to an RCU grace period to fix pppol2tp RX UAF
    https://git.kernel.org/netdev/net/c/ec4215683e47

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



