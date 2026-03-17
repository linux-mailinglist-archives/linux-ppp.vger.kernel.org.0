Return-Path: <linux-ppp+bounces-419-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAe1CvTCuGlWjAEAu9opvQ
	(envelope-from <linux-ppp+bounces-419-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 17 Mar 2026 03:56:52 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FFD2A2F80
	for <lists+linux-ppp@lfdr.de>; Tue, 17 Mar 2026 03:56:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 173CF3009157
	for <lists+linux-ppp@lfdr.de>; Tue, 17 Mar 2026 02:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739592BD5BF;
	Tue, 17 Mar 2026 02:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBQNQjbG"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5147229B789;
	Tue, 17 Mar 2026 02:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773716101; cv=none; b=fYyG4RpDjQUXwteFcsY+iAibHeTBlGQlGfpOLvgOiop2Zg5Fzk4UErKnSb9gNVEzR0w9bXbZw4OjtOSbuB5hRum34MkIdLcgN9q07rkXtY1TINjpTb2fNn7ADD8J5GwKxX5pFie6X2hYPtYg7BrRtC1Mqf90PP1iDygLOSdeX5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773716101; c=relaxed/simple;
	bh=Z4eVxfTOXAxJwAikqB+iCh+6xG7rIQq8g2sRZSUuTYI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UyNHabjAzFf+eouUwiedZQdOWleBlBEvOJ2Dvah26i/TFTkakVppml/pLmn4Sur/uXFE23lpEaDrMR5NCT3DoL8pSxCSrW5F18EXtVF5KqyAlu+WxkQIO9rMzfMyPtsgwOmlxrDQy/QRxgnMweYG/bYwKmKoh6PVH+wP1XKkPLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBQNQjbG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF29AC19421;
	Tue, 17 Mar 2026 02:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773716101;
	bh=Z4eVxfTOXAxJwAikqB+iCh+6xG7rIQq8g2sRZSUuTYI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YBQNQjbGH/rHtnt4VtCqjLpWi41SnGKDngcFGR6hDu9osRiywbA5eXhUH6bB/Nl1f
	 rCY8u22qfp++uf630TW0TdnXjEJATK3ZLfamlrYV09X0cf4Zk9OSi/JMD/Ik0woMA2
	 WeacdpsIo/Fx+Wkd14ZXejsfJUmaet8ilFUgDpH5jdN0waTDcwF/Xhg751X8rzIM9z
	 7HfH8Z9rEMXf6PbBAk9NWB3lcY7PPv1I+SkgLjZNIhsNMs9P8N38MHuS1Fjocv/S44
	 USat5aDRUGfSFR5T9c9bptgO/HmkhgAnQXtdau/Qm9TPSntGaF1IwgXuXTA/oLs1De
	 KPeXhh4HtOruQ==
Date: Mon, 16 Mar 2026 19:54:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-ppp@vger.kernel.org, James Chapman <jchapman@katalix.com>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] l2tp: ppp: use max L2TP header size for PPP channel
 hdrlen
Message-ID: <20260316195459.6e4d6d9b@kernel.org>
In-Reply-To: <20260313034732.209792-1-dqfext@gmail.com>
References: <20260313034732.209792-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-419-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-ppp@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 84FFD2A2F80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 13 Mar 2026 11:47:31 +0800 Qingfang Deng wrote:
> chan.hdrlen is read once at channel registration by
> ppp_register_net_channel(), and used to set the PPP net device's
> hard_header_len. It was set to PPPOL2TP_L2TP_HDR_SIZE_NOSEQ (6), which
> is 4 bytes too small if sequence numbers are later enabled via
> setsockopt(PPPOL2TP_SO_SENDSEQ), causing unnecessary skb reallocations
> on the TX path.

If the main effect of this patch is that we avoid reallocations I think
this is an optimization and should go to net-next? If there's more to
it please explain in the commit msg a bit more.
-- 
pw-bot: cr

