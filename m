Return-Path: <linux-ppp+bounces-414-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKqtA3Jis2lcVgAAu9opvQ
	(envelope-from <linux-ppp+bounces-414-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Mar 2026 02:03:46 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F60727C258
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Mar 2026 02:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB28630ECEB2
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Mar 2026 01:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C4D2BDC32;
	Fri, 13 Mar 2026 01:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sdlfykkT"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7655330498E;
	Fri, 13 Mar 2026 01:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773363641; cv=none; b=iKA/6KI9FB4senmRPOoJ2MEOUpY7vrbSifCTvSJdlKiQ22gsCqO40vU5tZbqagzA1NKeLG0vq/v6sU8Ls/zyksYE09DNF7jADJn09YiWGBxsSUJHDn07zr2oJAFRnQsrlDsFrZ11pECi/O7ccw//rg5rxWS6LlM1IW4g/canZvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773363641; c=relaxed/simple;
	bh=M8OtnN1rvksBo+7fIEl1ge2cOUq0aHj9k7lajVTLv/I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QqjAwqURjzqsn7sYV8PfikTN6t0hCck89J1aLVHD7Idd09VC4iXq1I96S0ZuXrRMauVxa4gGke2QyfXl6PzOjmzGcNJibHwAhydtguA44rBhLjOg4bysTyZdoKGLAclYYSrFDMhjQihokqKUnMi1bWMpiS1ZctRbkRxazL3Do8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sdlfykkT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E149C4CEF7;
	Fri, 13 Mar 2026 01:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773363640;
	bh=M8OtnN1rvksBo+7fIEl1ge2cOUq0aHj9k7lajVTLv/I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sdlfykkTNaj9sebOkHXQvDpuFK2f1th5ZzftJOkcHQnWBuA8lXmxCE9iF/+4nFxzP
	 X9ff7x3BH93yLSRWLOyhFmhHnNARfsGNsT1ESIRhecRBqCVx1lhH2zZv8fGm/VaMLI
	 8u8ghrawIBPoW5wPvbdosnpf4kS7Zlai54rc+8xS+W8tluTnOzL18+J5ZXHTnRjNeG
	 OAaPBSWuNlpkoc/jFOWoQytrb/7J1nIx4SEWCLmiBpJbm/95itkSsIqBzz6Ypzm90s
	 Sui4/6lr7e1Rp4w16ayICkpG0SO1xHguy7XqVgw25YAFsL4O5uNUgS8oO+fuWB1Eki
	 1BDHNiGex2j9g==
Date: Thu, 12 Mar 2026 18:00:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Martin Olivier <martin.olivier@live.fr>
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ppp: add IFLA_PPP_UNIT netlink attribute
Message-ID: <20260312180039.436ca9c2@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-414-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[live.fr];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8F60727C258
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 08:35:26 +0100 Martin Olivier wrote:
> +	[IFLA_PPP_UNIT]		= { .type = NLA_S32 },

	[IFLA_PPP_UNIT]		= NLA_POLICY_MIN(NLA_S32, 0)

and then you can remove the manual check in validate?
-- 
pw-bot: cr

