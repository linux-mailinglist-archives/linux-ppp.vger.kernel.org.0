Return-Path: <linux-ppp+bounces-500-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFYVCFv21Wn4/gcAu9opvQ
	(envelope-from <linux-ppp+bounces-500-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Apr 2026 08:31:55 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACEC3B7958
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Apr 2026 08:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B56DF3054C1B
	for <lists+linux-ppp@lfdr.de>; Wed,  8 Apr 2026 06:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC123630AE;
	Wed,  8 Apr 2026 06:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G3imsfTf"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E1A339708
	for <linux-ppp@vger.kernel.org>; Wed,  8 Apr 2026 06:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775629743; cv=none; b=t4vTVTK366cla84sLkb+LmeJz60TaKcXEysqPbEGNIVr+yxbXCMplDte5M0yx1fxoyJsNaX4nCzGQ1lUFq43PsUJACvO5OzJVYTMLHk8yQsO9pwOcNgwahDbIVmuBjPIqbhtpb8j4zuuMUFbWFz+lS+gUw4fyPZ8DKinIWLLvYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775629743; c=relaxed/simple;
	bh=t8FAJtCeUfAC/CTlET9xn0DuAuKTJkSWMfexIMhBFQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c2j+PEVJuBKQPVgMbOig7TIg7agOZ/657jZOnI8gMrggbpvYCq3j1gKiF8dAVKJLFR2wt4CJuHoB3rLtncRFlfvmAbe9i+achGj+qgWUOD+sJzeGemUz1arqBL07f628/z4sVoUgtg2HCscqeZ2KwcQC4hqQdq+RCixKr3IKZdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G3imsfTf; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <59d11588-0af2-42e6-a030-83240a0a5512@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775629729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8aFfmifB7q1gLRzmTxqymM8xXpXF6N+3LNyHdfnhsGY=;
	b=G3imsfTfc2RoHKnrxcrD/4JUi/AvuuRDkysT/qlds5JqPUUC6rcrV7YiDijKu9iABK9xbm
	xRZ7rL+tkf+g6ueubF8r7+Bz4nfpTYFk12IHLHeBcQYye/F3D8Wm5DAKLJNJcppHezqTeb
	OFHMQSgZ/SWpSWUeXFkrbK6gkBCYvj0=
Date: Wed, 8 Apr 2026 14:28:39 +0800
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ppp: require CAP_NET_ADMIN in target netns for unattached
 ioctls
To: Taegu Ha <hataegu0826@gmail.com>, netdev@vger.kernel.org
Cc: linux-ppp@vger.kernel.org, gnault@redhat.com, jaco@uls.co.za,
 richardbgobert@gmail.com, ericwouds@gmail.com,
 Cyrill Gorcunov <gorcunov@gmail.com>, Matteo Croce <teknoraver@meta.com>
References: <20260408042345.1011-1-hataegu0826@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <20260408042345.1011-1-hataegu0826@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-500-lists,linux-ppp=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,redhat.com,uls.co.za,gmail.com,meta.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:dkim,linux.dev:mid]
X-Rspamd-Queue-Id: 7ACEC3B7958
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Added Cc: Cyrill, and Matteo

On 2026/4/8 12:23, Taegu Ha wrote:
> /dev/ppp open is currently authorized against file->f_cred->user_ns,
> while unattached administrative ioctls operate on current->nsproxy->net_ns.
>
> As a result, a local unprivileged user can create a new user namespace
> with CLONE_NEWUSER, gain CAP_NET_ADMIN only in that new user namespace,
> and still issue PPPIOCNEWUNIT, PPPIOCATTACH, or PPPIOCATTCHAN against
> an inherited network namespace.
>
> Require CAP_NET_ADMIN in the user namespace that owns the target network
> namespace before handling these unattached PPP administrative ioctls.
>
> This preserves normal pppd operation in the network namespace it is
> actually privileged in, while rejecting the userns-only inherited-netns
> case.
>
> Fixes: 273ec51dd7ce ("net: ppp_generic - introduce net-namespace functionality v2")

For fixes, you should set the target tree to "net" in the patch subject, 
using:

git format-patch --subject-prefix="PATCH net"


> Reported-by: Taegu Ha <hataegu0826@gmail.com>

Minor nit: Reported-by tag is not needed if it's the same user as Signed-off-by.

> Signed-off-by: Taegu Ha <hataegu0826@gmail.com>
> ---
>   drivers/net/ppp/ppp_generic.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index e9b41777be80..99a8557188c0 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -1059,6 +1059,9 @@ static int ppp_unattached_ioctl(struct net *net, struct ppp_file *pf,
>   
>   	switch (cmd) {
>   	case PPPIOCNEWUNIT:
> +		if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
> +			return -EPERM;
> +


These three identical checks can be combined into one and placed before 
the switch statement.


>   		/* Create a new ppp unit */
>   		if (get_user(unit, p))
>   			break;
> @@ -1073,6 +1076,9 @@ static int ppp_unattached_ioctl(struct net *net, struct ppp_file *pf,
>   		break;
>   
>   	case PPPIOCATTACH:
> +		if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
> +			return -EPERM;
> +
>   		/* Attach to an existing ppp unit */
>   		if (get_user(unit, p))
>   			break;
> @@ -1089,6 +1095,9 @@ static int ppp_unattached_ioctl(struct net *net, struct ppp_file *pf,
>   		break;
>   
>   	case PPPIOCATTCHAN:
> +		if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
> +			return -EPERM;
> +
>   		if (get_user(unit, p))
>   			break;
>   		err = -ENXIO;

