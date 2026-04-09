Return-Path: <linux-ppp+bounces-508-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKDwMKJ212nTOAgAu9opvQ
	(envelope-from <linux-ppp+bounces-508-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 09 Apr 2026 11:51:30 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 691823C8B9F
	for <lists+linux-ppp@lfdr.de>; Thu, 09 Apr 2026 11:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E059C3007B99
	for <lists+linux-ppp@lfdr.de>; Thu,  9 Apr 2026 09:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAFB3AF676;
	Thu,  9 Apr 2026 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IM0X4pn9"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41E8348866;
	Thu,  9 Apr 2026 09:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728286; cv=none; b=YMkL3auLd2cff8FDcNIgCPeWXjNrZkBpjnfceknqbUO4tI0peY1LsXI11JJ/j04cNS39ER5XtMb9rMO7XrjzjKkUTGYFjLzvm3iwhKhSIvaRAke9VAoJeG2fScx5SeNa/x/HyWBlHkhg7ft1BmSwOp9pohcne2X7TClVaB7reBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728286; c=relaxed/simple;
	bh=GuaMOXo1SjXgLhYkJk/nlDxDW3EE8q9QqfxOUTCKs3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WdF01CL3KtKutCNPrnCiAk6iGHGGMoINzmv4D8beXzviPduLQnmQfu+cT5PTnwfHBpdy/UFjvyeKKIk4OC5Q5zVXiDgRDwQ7qYgWkMBu51lkLW5de0J1Tll1fPN/oSC4RdAGIubLZMS53RB+CqpFz4ot+wKDCmdmmlTYPuD81qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IM0X4pn9; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <41ffbf37-8716-428f-9ad5-ad2c9a9034f0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775728272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3TQ/SAKITw7hz30BN7ZaQ+bq9XIDw7rEFZx/FEY27Ac=;
	b=IM0X4pn9jTVtuahOPe/9bRQBXC/7cb2MXj/5UuZAfqkYxhxoUqqbaDSv1VfpdpdmJuQtbn
	+CEp7eiJYbVMCPzx86S/JpwuxcvoiNlCUK9n0Q/AyP0e8T/1ipsy1ynk08E+H6ajKr2fQZ
	a5BNy8ngSfas0CV1F0oUkYK/8eQJNRA=
Date: Thu, 9 Apr 2026 17:50:38 +0800
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net v3] ppp: require CAP_NET_ADMIN in target netns for
 unattached ioctls
To: Taegu Ha <hataegu0826@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Kees Cook <kees@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Cyrill Gorcunov <gorcunov@gmail.com>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: gnault@redhat.com, jaco@uls.co.za, richardbgobert@gmail.com,
 ericwouds@gmail.com, teknoraver@meta.com,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
References: <20260409071117.4354-1-hataegu0826@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <20260409071117.4354-1-hataegu0826@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-508-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linutronix.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[redhat.com,uls.co.za,gmail.com,meta.com,kernel.org,suse.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 691823C8B9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/4/9 15:11, Taegu Ha wrote:
> /dev/ppp open is currently authorized against file->f_cred->user_ns,
> while unattached administrative ioctls operate on current->nsproxy->net_ns.
>
> As a result, a local unprivileged user can create a new user namespace
> with CLONE_NEWUSER, gain CAP_NET_ADMIN only in that new user namespace,
> and still issue PPPIOCNEWUNIT, PPPIOCATTACH, or PPPIOCATTCHAN against
> an inherited network namespace.
>
> Require CAP_NET_ADMIN in the user namespace that owns the target network
> namespace before handling unattached PPP administrative ioctls.
>
> This preserves normal pppd operation in the network namespace it is
> actually privileged in, while rejecting the userns-only inherited-netns
> case.
>
> Fixes: 273ec51dd7ce ("net: ppp_generic - introduce net-namespace functionality v2")
> Signed-off-by: Taegu Ha <hataegu0826@gmail.com>

LGTM.

Netns devs, could you please take a look?

> ---
>   drivers/net/ppp/ppp_generic.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index e9b41777be80..c2024684b10d 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -1057,6 +1057,9 @@ static int ppp_unattached_ioctl(struct net *net, struct ppp_file *pf,
>   	struct ppp_net *pn;
>   	int __user *p = (int __user *)arg;
>   
> +	if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
> +		return -EPERM;
> +
>   	switch (cmd) {
>   	case PPPIOCNEWUNIT:
>   		/* Create a new ppp unit */

