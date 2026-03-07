Return-Path: <linux-ppp+bounces-407-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEVZNZV5q2nsdQEAu9opvQ
	(envelope-from <linux-ppp+bounces-407-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Sat, 07 Mar 2026 02:04:21 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2415C22936F
	for <lists+linux-ppp@lfdr.de>; Sat, 07 Mar 2026 02:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4778D304946F
	for <lists+linux-ppp@lfdr.de>; Sat,  7 Mar 2026 01:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46ED428689B;
	Sat,  7 Mar 2026 01:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jg+bQZXT"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20045284B2F;
	Sat,  7 Mar 2026 01:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772845453; cv=none; b=AwB/yFBPrGf8NvPQFBIPgaPsd9iz524aLxkGAvRl/3GCnPfkDsCM8BX7AW0pTvK5EyCsL6BnHgVFRltcluxbu+Hm+RqlXtZGeFQnBZAb/O1HUbu4n5Hb55cL4KUS7tCEoJWDPXJgQ4bn8nZp0lZdTMSiCBc9CgbrC7d99s0/1ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772845453; c=relaxed/simple;
	bh=QcYejuNXCN3pAPbk2hDmY8EAb24Vn+iam/tjxfo247o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NHt6/4qvOqYEQqUiXxFASUyKq7KUWLadRT30tgXa/1K7ySeLYkg03JBp9Aob9eu0NFlLkLxDloXZBaGKotUngr9f2mBGQvzLoEXvNkvq7relQnDUOtri42OWDG0UYAUfyadqj+SatPE5CptTZ5BcDvIvqU8/E9HORkQs0N8lveY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jg+bQZXT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27705C2BC9E;
	Sat,  7 Mar 2026 01:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772845452;
	bh=QcYejuNXCN3pAPbk2hDmY8EAb24Vn+iam/tjxfo247o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Jg+bQZXTCBrIVFPaV9pjLsrYQtBPtQcMzIWsEbtmbhj+500mWoCypoUuRJD/ufmo+
	 OXx/KSLsIKeX+IlSudBOqBUe3lTsPonSyJvqkAFr+hkodxVIgiRxGek5aCJi5Ufdfw
	 V4Qo9qhBxGBLl+PcR4QviIR2kQvVg3nzkqsI8fYDCL0tU6aHEvruOF8JB9J1hD9bTh
	 OK5ExrfNgrHluIXHYdvEp/gQlu466olkRH1j8zOZbWaRmQ6sQwTtekgCCzCy6DWrBi
	 OYgcPLwyk08PwKne0knvZljg+aWILeOgobUSaZx2QfPkpmBcIoKLpH5AhuDZ78huxf
	 zaN1YBPFEvrCQ==
Date: Fri, 6 Mar 2026 17:04:11 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-ppp@vger.kernel.org, Michal Ostrowski <mostrows@earthlink.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>, Simon Horman
 <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net-next v5] net: pppoe: implement GRO/GSO support
Message-ID: <20260306170411.49912ae1@kernel.org>
In-Reply-To: <20260305013852.3769-1-dqfext@gmail.com>
References: <20260305013852.3769-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2415C22936F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-407-lists,linux-ppp=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,earthlink.net,lunn.ch,davemloft.net,google.com,redhat.com,kernel.org,nbd.name];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nbd.name:email]
X-Rspamd-Action: no action

On Thu,  5 Mar 2026 09:38:52 +0800 Qingfang Deng wrote:
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
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>

Please add some selftests.
-- 
pw-bot: cr

