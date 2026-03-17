Return-Path: <linux-ppp+bounces-425-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGhSC9fguWk7PAIAu9opvQ
	(envelope-from <linux-ppp+bounces-425-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 18 Mar 2026 00:16:39 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAF62B413A
	for <lists+linux-ppp@lfdr.de>; Wed, 18 Mar 2026 00:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E469830072AC
	for <lists+linux-ppp@lfdr.de>; Tue, 17 Mar 2026 23:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7B537646B;
	Tue, 17 Mar 2026 23:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uF2cjF2u"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA80F315D51;
	Tue, 17 Mar 2026 23:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773789285; cv=none; b=qCfSJELmj50LSjg1FBDHNT7sHw9hB5akWPrfcZKkcuuNZ5Ml4nclV/hoORs6iGx/KsnWtAKj8fVu6FDfyB14XtcJTHPMVut5rL4jiVYZ7x4iIBrh+Tb+2c3HdW9BViI2DoDJ6gSogLV3EpMw/KhFQByajXtnIQoYO7xpxnLYRb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773789285; c=relaxed/simple;
	bh=QpJowkMc/tH4ANWfBZVgPhBoFVmc+3haVzogo5ueys8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=brDKnX+d+mVu4jV+9TIemZtbuEnH8W/Dh2UxQZkUx/DBfsKWVQEldBUSRLW2Yl77+ljEkXNulDH5GejeNzxZh/0Em/pfcJtMuxJaGOsMrRAsn3aH4NM/PYyv4dCSHsLbs/9HjdGlH2XWFkF3HbYAgK+MQZZR+rPnFaV/9RW92xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uF2cjF2u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11E3C4CEF7;
	Tue, 17 Mar 2026 23:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773789285;
	bh=QpJowkMc/tH4ANWfBZVgPhBoFVmc+3haVzogo5ueys8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uF2cjF2u8fzyz+bHZOVHnOqMwNcnXP7m+9NKQxv92/1tA9QRqPXoumAMOX7mpwXYR
	 xZWIPT8dwlK74aDwsPc3bnJ9JhSrDF5AJMsAQSZjO5e2anhaVt+O0FbpQNzUOwuFsp
	 tH5U3+FznM3fdb9mzAjdvISnyLjzmVBzYjxe/Uv6+pjP0fOrMcdiZ/QR3bUQMqLO9B
	 RlMdoSmawHv5XO4DAnt2AYl5mo/duFufYSvuij5+anvecrnVmYbqKKFiHfLGl8I/6S
	 iSt3V3hDsgQQpC9AhH1H/eai2OQ5yx+xczRlJF/ednuFecBNljT3X0/Zc7jQ1zuWLN
	 kxzP5IvzfpHeQ==
Date: Tue, 17 Mar 2026 16:14:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: dqfext@gmail.com
Cc: Martin Olivier <martin.olivier@live.fr>, netdev@vger.kernel.org,
 linux-ppp@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] ppp: add IFLA_PPP_UNIT netlink attribute
Message-ID: <20260317161443.01eee26a@kernel.org>
In-Reply-To: <PAWP192MB2411A808BB36F0086A9B00B99742A@PAWP192MB2411.EURP192.PROD.OUTLOOK.COM>
References: <PAWP192MB2411A808BB36F0086A9B00B99742A@PAWP192MB2411.EURP192.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[live.fr,vger.kernel.org,lunn.ch,davemloft.net,google.com,redhat.com];
	TAGGED_FROM(0.00)[bounces-425-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4AAF62B413A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 14 Mar 2026 02:14:29 +0100 Martin Olivier wrote:
> Currently, the PPP rtnetlink API allows creating a new network interface
> with a custom ifname, but it lacks the ability to specify a custom PPP
> unit id.
> 
> Setting a specific unit id is currently only possible with the
> PPPIOCNEWUNIT ioctl. If a user-space program also requires a custom
> interface name, it must create the interface first with PPPIOCNEWUNIT
> and then rename it.
> 
> Resolve this by introducing the IFLA_PPP_UNIT netlink attribute. This
> allows user-space programs to atomically request both a custom ifname
> and a specific PPP unit id during the RTM_NEWLINK creation process,
> eliminating the post-creation renaming for this use case.

Qingfang Deng, you work on PPP, could you review this patch, please?

