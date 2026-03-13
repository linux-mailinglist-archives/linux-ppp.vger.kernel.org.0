Return-Path: <linux-ppp+bounces-415-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aycnLvVhs2neVgAAu9opvQ
	(envelope-from <linux-ppp+bounces-415-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Mar 2026 02:01:41 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5AC27C212
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Mar 2026 02:01:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52096300D347
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Mar 2026 01:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647CC21883E;
	Fri, 13 Mar 2026 01:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEzd11Tn"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4219C1DF970;
	Fri, 13 Mar 2026 01:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773363699; cv=none; b=tzQCRxnhRFc+2anckmcQe5Lbakw+qQ5hZPHejPRfcNIlOe4WG5l8PSrcS3nx+SixazJ1F7OGS2+dxvXtMGaiMjuvcb04s7POpl3xm/LekWToIkk+9QOx6wGM0xJCX7nm4Bjhi7CHazWrVMVY6CAFg65887nE0HD1Us2VS84eFE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773363699; c=relaxed/simple;
	bh=A8N4mNA/cJm5Ca8XQMZQYvtK9CC3RrwMJ6ljaCXLWrM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qStqsRmEmwLoa9H1M5MfkQtyOCM+4c4h+T8MetIy/b8PEPMiQoVi0jHddluYdK5kvf6DNWMK1FlbAGpLsIXDEk6dT0Aa93zeU3f5MBDLBKPOFz6nZsqfSx7Bn3WB0zPOn7G51Fo3vjXPifMjigJibRWcPqfM06CeUYfIiRmbZJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEzd11Tn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E91DC4CEF7;
	Fri, 13 Mar 2026 01:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773363698;
	bh=A8N4mNA/cJm5Ca8XQMZQYvtK9CC3RrwMJ6ljaCXLWrM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fEzd11Tn2ersXH607FOZzPCL6ekcZeGzR1t2RobYylH1CRet0LIdAQ1hiwodZWuOX
	 3Gwk0u4Zy9bbBGKznpFIvKHPAXHTxDGzEffhtcxyOMGQEs0IFNlyln3CG7DHZcu+2Q
	 yvbAOzwy7ADMEXGNxcCtlDGp+l5f2RptHsCLV25WSpCE8wb/0fPBeAsG4Ka6KKKtRt
	 5tFvaiv9y90zHxcL3ukYFRDG5pO5fGRxIXP/yiunlwX33iFJU/R/D+EBK9eusvWFSS
	 N0KjtcPU5THEUZVpmZpeNNA1vyqBjOVqPl9XrdR89B6RMywrw6syZNPHkraotfDCkL
	 G+sQ+AZHAB97g==
Date: Thu, 12 Mar 2026 18:01:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Martin Olivier <martin.olivier@live.fr>
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ppp: add IFLA_PPP_UNIT netlink attribute
Message-ID: <20260312180137.6c5cc6a2@kernel.org>
In-Reply-To: <PAWP192MB2411A5E7D3BE1B55E155A92F9747A@PAWP192MB2411.EURP192.PROD.OUTLOOK.COM>
References: <PAWP192MB2411A5E7D3BE1B55E155A92F9747A@PAWP192MB2411.EURP192.PROD.OUTLOOK.COM>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-415-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[live.fr];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5D5AC27C212
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 08:35:26 +0100 Martin Olivier wrote:
> +	if (data[IFLA_PPP_UNIT])
> +		conf.unit = nla_get_s32(data[IFLA_PPP_UNIT]);

You can also use nla_get_s32_default(data[IFLA_PPP_UNIT], 0)
but that one is more of an acquired taste.

