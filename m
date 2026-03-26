Return-Path: <linux-ppp+bounces-448-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFsPKEDwxGnv5AQAu9opvQ
	(envelope-from <linux-ppp+bounces-448-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 09:37:20 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA0F33176A
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 09:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE6E63013241
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 08:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B228C369229;
	Thu, 26 Mar 2026 08:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CgI7u7pv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0PoPML93"
X-Original-To: linux-ppp@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F70040DFB0;
	Thu, 26 Mar 2026 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513824; cv=none; b=WEdEtH3HoQDnjE7e1M3SRrPr0k9dMyYgfF4g5u5neVDJWZxboS7/E5WzLGIhN1osNcg/7F+scAcht5vaSdQOVj/ia0k5SXayT7G8HbL5YPK4cjEGkJ++9yjVFGECt2tWzDwUAFSOm22pFCagIDHJaj3QKtcV3KC+TOeqSXMTylE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513824; c=relaxed/simple;
	bh=TqOkjz5kCueNamDei3AnmFETLiBpqvS07zVsHNmVrHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OOsV8IG3xPUxGSikDi1PceDptJH3P56I9K4KKs1+5hmtGEg6eK962yDG1IJF27uF+JMLJtUmB0uuqactAPCyd72lr5VuJxTWYMK/2/HJtfLEjko2/sy8IGHx60nUSB49tQVKPMjAktAI/CsDuLykgJlrjFSowTKMkO6d9AWtTTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CgI7u7pv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0PoPML93; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 26 Mar 2026 09:30:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774513821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TqOkjz5kCueNamDei3AnmFETLiBpqvS07zVsHNmVrHI=;
	b=CgI7u7pvyWpAhAIaFqT/W9Ery+wogMZEg4tf/uTzyuQuOr/mPNWp94Q23NRcheoTBnC2Fv
	DriYZg6lKMp5EEe/n2qDk6PHnm8KX0rmf0Pl1UdzBS53xaEshttImS9eFNfGp02AMXWIQl
	KfBJvHCxR+VxaHVUXwMCa6+pbByROj0WSFMgnz7vhliGZJzDxo27aIr5fQbx3/uWz4k1O/
	tGUxd/7R8+nvPb9UGVSitfIQRWouIIJmctQZKbYvbjNV0MKydydS3rejm36xj5K+fzErOp
	ii8RnY9KjiMkNnhPHMeHfptLIcGlirbXY8RoRbMMGWS+cIUwUiL4tyYibAP6Ag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774513821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TqOkjz5kCueNamDei3AnmFETLiBpqvS07zVsHNmVrHI=;
	b=0PoPML93HY+Bm3PCUxhSrvyDqD2qs6QUYlc5dpt6yTIDvyNS8Yc7gVCR+vD7v56AQegZT+
	iTN9DmPYmvg5LZAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Felix Maurer <fmaurer@redhat.com>,
	Antonio Quartulli <antonio@openvpn.net>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
	Paul Mackerras <paulus@ozlabs.org>,
	Guillaume Nault <gnault@redhat.com>
Subject: Re: [PATCH net-next v4] selftests: net: add tests for PPP
Message-ID: <20260326083020.2fOQj5br@linutronix.de>
References: <20260326021642.29170-1-dqfext@gmail.com>
 <20260326081304.xKa7-s_1@linutronix.de>
 <CALW65jYdzn_rZWa2zwYd5J+Gd=kyaGMsVFyX0fMJfKfgULMO6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CALW65jYdzn_rZWa2zwYd5J+Gd=kyaGMsVFyX0fMJfKfgULMO6w@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-448-lists,linux-ppp=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:dkim,linutronix.de:email,linutronix.de:mid]
X-Rspamd-Queue-Id: 4CA0F33176A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-26 16:26:23 [+0800], Qingfang Deng wrote:
> Hi Sebastian,
Hi Qingfang,

> On Thu, Mar 26, 2026 at 4:13=E2=80=AFPM Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
> >
> > On 2026-03-26 10:16:24 [+0800], Qingfang Deng wrote:
> > > Add ping and iperf3 tests for ppp_async.c and pppoe.c.
> >
> > Oh thank you for doing this.
> > I haven't look in detail but this cover the "invalid loop" cases that
> > ppp tries to catch?
>=20
> By "invalid loop", do you mean transmit recursion?
> https://lore.kernel.org/all/20250715150806.700536-2-bigeasy@linutronix.de/
>=20
> AFAIK, this can only happen with PPTP or L2TP, which were not included
> in this patch.

Yeah, that one. I was sort of looking into but gave up after a while
digging through code, since I had no idea how to setup that up=E2=80=A6

> Add Cc: Guillaume Nault
>=20
>=20
> Regards,
> Qingfang

Sebastian

