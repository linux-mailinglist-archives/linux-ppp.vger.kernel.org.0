Return-Path: <linux-ppp+bounces-536-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKPAK7AL4WnoogAAu9opvQ
	(envelope-from <linux-ppp+bounces-536-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 16 Apr 2026 18:17:52 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD404118B0
	for <lists+linux-ppp@lfdr.de>; Thu, 16 Apr 2026 18:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DA45303B4E4
	for <lists+linux-ppp@lfdr.de>; Thu, 16 Apr 2026 16:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D083F3914E7;
	Thu, 16 Apr 2026 16:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0q7QJFf"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA739358379;
	Thu, 16 Apr 2026 16:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776356269; cv=none; b=FydprcsegloJ1mNuOHTzhOi7DF0tWZYgK+UXOGfHB5SWbdiXMsdl+2cRJ/LYebNICi2Nda8CM6XMKgUeof9DwpYn3ukebndPesG/A4HTkCdAcnGCIVIlKwlZamEWR9pi64eeNxQ/NxhvCZ5i4rFGgIT5NyVHTh4pqEItPGagRZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776356269; c=relaxed/simple;
	bh=xwiKfNC6pMyp+Z/mgKpx9lgG8LjrpI5fnBJN2XBeGKk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UYCCsUC/VFkj4nQl/qM9Fo/ZsTjkajDu/81YZEJM4+DHdpM3aKDfvwW5rVuYisp1YorR9Oz+bJhLkG3vn27rmaeFUpiCvuqkD0Eu2vJ+8uqVPpQb9C1GLO+b/VTMkghvyZtS5OsW8EwrkbVl+8Pp8LP5OFoXPFbjQvPBk3in39o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0q7QJFf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A48C2BCAF;
	Thu, 16 Apr 2026 16:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776356269;
	bh=xwiKfNC6pMyp+Z/mgKpx9lgG8LjrpI5fnBJN2XBeGKk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h0q7QJFfvsdzVnwYqMmh8XFCwO9Wr/l/AFCvSrh7+kGz7K/EbLqHSZOBnh44aToMM
	 QHRzVArC35Fx0XaAr59kppoomyN2uDoOBjeFEc+Y6GAkjwogBi2dOJ0tlOLsrbOtOu
	 VJdcDrQb4YfTL1wFekFKl44L0ON+rLBVRyKdIWF8nYhMTuFT06T0yrIgpU5HtsAs2Y
	 8CeWMnrJ5uJktbqm4C+KZTpOczXVKkrBv4XsKNAzo8k8CtFUpHleiRGFdIp7+EbpU1
	 ipnGHT3kC8cDVmBeWe6won3diA+Bire+f/mYh5ad5THyAG7KV/PD/5iWsi++slt9xY
	 0Fsi9nCllS8Tg==
Date: Thu, 16 Apr 2026 09:17:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: linux-ppp@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v6 1/2] flow_dissector: do not dissect PPPoE PFC
 frames
Message-ID: <20260416091745.3c493d72@kernel.org>
In-Reply-To: <e1fd74dd-4fd5-4a67-b4c5-5911395b9dbe@linux.dev>
References: <20260415022456.141758-1-qingfang.deng@linux.dev>
	<e1fd74dd-4fd5-4a67-b4c5-5911395b9dbe@linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-536-lists,linux-ppp=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-ppp@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4DD404118B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 15 Apr 2026 21:42:09 +0800 Qingfang Deng wrote:
> The patch state is "Changes Requested" in patchwork but I haven't 
> received any feedback. Was it set by mistake?

Fixed, thanks for the report.

