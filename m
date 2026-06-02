Return-Path: <linux-ppp+bounces-598-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0EvOH+8lH2qTiAAAu9opvQ
	(envelope-from <linux-ppp+bounces-598-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 02 Jun 2026 20:50:23 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D22AC631358
	for <lists+linux-ppp@lfdr.de>; Tue, 02 Jun 2026 20:50:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Z+cnNm2K;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-598-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-ppp+bounces-598-lists+linux-ppp=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 436CE302F41F
	for <lists+linux-ppp@lfdr.de>; Tue,  2 Jun 2026 18:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D9339A4CE;
	Tue,  2 Jun 2026 18:50:19 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C2C399D00;
	Tue,  2 Jun 2026 18:50:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780426219; cv=none; b=RGjR2tzoBSt1/jCpQyBLgxB6DgbZAvxfmeXRWxWBn3j9zLenqXzAS+gl5cX6mOTrCXtFMne80QsR0O0qJhIQ3NfHYN4ZCwEvi1iq/XZkhI7aDzhd7U5+Fav6ZZpgNl77HAAGkf/9sO0wyu3s3j6sGhB6JIBF/ErdAuFYaSGjxSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780426219; c=relaxed/simple;
	bh=QSk++S47jHmW1xEeIPqnE9CdkO1SrS5VW9YWMVuFMHA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=X3vYPl713SVP4J10Wgiq4sRp18GPzw5KR/8gIyIjKiXFU/Y3hVV9kMisHb47X8pMuCZdGn7b5bn+1/VftvLXpjz/8OY0XlflkJxlquZnKMt5t7pPUuSP9f2yryZ+QEe8v9ddG/6nuXXTrJRVQ1yXwKqP4m9EqH0HGhGrvxEtFqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+cnNm2K; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC3D1F00893;
	Tue,  2 Jun 2026 18:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780426218;
	bh=2ag8w9Nmp3/93BlOzXRA3+/ozK3DGxGzi4HvpeQzvxs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Z+cnNm2KTFPeDLUjjnDEHjm6PVVNH6quXwHACooLA7hkGzAPTjXcMXd97chKCCZrO
	 HWmGJprcVAzpzSE3qnYSvrZgXnjiOyF7XhLKHW+GozGcFBqHeE6N4A5bxCkplL5grs
	 DIa2GHQ0t8+PgJSLr8VdsitbQzXC3+WbuD45EW8P/J+P5SNQ0vz9CwCKuojF0diSDV
	 FMwtBT2V793KEzpssCR+ekC11rma+jZKNYjHTuLE6PHBt1U3rMDQt5GiaTgiRq5ov0
	 ujX2I7eCg/1d7H2HBpjiK0SKIS1KES4ltybWfM93nKH2OG07Ox9AyPIo6Ip466PtEh
	 6x+auwPF/4O/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56C003811A6C;
	Tue,  2 Jun 2026 18:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] selftests: net: add socat syslog for PPPoL2TP
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178042621989.1003781.10061916894676699297.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jun 2026 18:50:19 +0000
References: <20260529021146.5739-1-qingfang.deng@linux.dev>
In-Reply-To: <20260529021146.5739-1-qingfang.deng@linux.dev>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 matttbe@kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-598-lists,linux-ppp=lfdr.de,netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:qingfang.deng@linux.dev,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:shuah@kernel.org,m:linux-ppp@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matttbe@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-ppp@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D22AC631358

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 29 May 2026 10:11:42 +0800 you wrote:
> As done in pppoe.sh, start socat as the syslog listener. In case the
> test fails, dump its log to see what's going on.
> 
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
> v2: move syslog dump to the end and use EXIT_STATUS
> v1: https://lore.kernel.org/netdev/20260526014152.532505-1-qingfang.deng@linux.dev/
>  tools/testing/selftests/net/ppp/pppol2tp.sh | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Here is the summary with links:
  - [net-next,v2] selftests: net: add socat syslog for PPPoL2TP
    https://git.kernel.org/netdev/net-next/c/ae4ef7271c28

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



