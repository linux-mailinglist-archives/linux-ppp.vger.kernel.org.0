Return-Path: <linux-ppp+bounces-485-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ItMEP+Dzmm4oAYAu9opvQ
	(envelope-from <linux-ppp+bounces-485-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 16:58:07 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 866E138ADF6
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 16:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A16CA301D685
	for <lists+linux-ppp@lfdr.de>; Thu,  2 Apr 2026 14:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA96B3ED5A2;
	Thu,  2 Apr 2026 14:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtDrquX1"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C555A2E2852;
	Thu,  2 Apr 2026 14:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141722; cv=none; b=c0NqDbfZHSkBC3aLZ0I3I37GjpvVorVlo+TgqsXn9bSL6w73DMnEktov74uHmxFRbT2DPpzR4K6K84b7sFsoO8jeLNMn9IukR/SlEp0aZ/d+mPUq9RB0f9ilbs96bHZHvsdrHsLkSP8XA23sIBrbw9tW0kr5A8tvxNISXLXAf6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141722; c=relaxed/simple;
	bh=4KvT27Phmqs/LlOjBq1SFGpQjW+saLchZ2yPAp7bUp8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lVIxiITm0kE0wCE7JmP7f4Y7BwQgI0TRFHKimxiSAOym/BA1U4D1uA/x5aOTNDSNgmEVkfvCYk6ATpm958KSqqphQlYk5PHSnpj9shc8MyQrh0y2ov6MpW+6U0fmowQcoLPDiT1VmVH9632qY9sGvw/U2+1Fvta+wjM7CrcFy5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtDrquX1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98509C116C6;
	Thu,  2 Apr 2026 14:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775141722;
	bh=4KvT27Phmqs/LlOjBq1SFGpQjW+saLchZ2yPAp7bUp8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZtDrquX169hQ4SwOdyyHgtr7A5xDfeZS3hAr+B/P+os04BP2c1VDqVAtuXsC5qfzC
	 hRbMYZNG2pJlBwjZQlRsww2Yidq205nkldgssA5espSsSUJCQCFPm8wshKrGMwEpUB
	 MsnRuKnyFtNw96+Hnq/6skFkLh4pcl3ldKrIcnhq7j0+ML3cTf46lSzw4aUcaR5rtG
	 z0Kqu4x60XtmYEOhcxfWfcNR2PzQBS/AfzFJarlZv20AvroSCE7On2sYp094BW8rxw
	 LHpzZErbpdADCIUYe6hu/lN2ycHXis5yVlZ3ZGbqz7m6/x4qgqckhiIrqOwkADLHp9
	 Zm7SWL3eGf2TQ==
Date: Thu, 2 Apr 2026 07:55:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Qingfang Deng <dqfext@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Dianne Skoll <dianne@skoll.ca>, Shuah Khan <shuah@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Simon
 Horman <horms@kernel.org>, Felix Maurer <fmaurer@redhat.com>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>, "Matthieu Baerts (NGI0)"
 <matttbe@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>, Jaco Kroon
 <jaco@uls.co.za>
Subject: Re: [PATCH net-next v7] selftests: net: add tests for PPP
Message-ID: <20260402075520.313832ac@kernel.org>
In-Reply-To: <24aea6cc-d599-4935-8a75-34f38b852d1e@lunn.ch>
References: <20260330035604.133073-1-dqfext@gmail.com>
	<20260401081030.29b050d5@kernel.org>
	<CALW65jahWApDnVmFReW+Y3HDxBEmCwzsT1oyh03SW7X5ry6PzA@mail.gmail.com>
	<20260401175621.549c492e@kernel.org>
	<CALW65jaTbaosbO8ypKZ6G37HxuxXabeTaP_Fhq72xTovmDj+8g@mail.gmail.com>
	<50ae3c69-2c4e-499f-a46a-cbd207ff5f09@redhat.com>
	<CALW65ja1FV-OcqSazgKZhQhKf3oqr=kcGxyGkOGbhurGLOJ0-w@mail.gmail.com>
	<cb43761b-d414-4878-bf41-4ef6c988f881@redhat.com>
	<CALW65jZszAVHNSYgo9Fav8J-Ph9dXzR34CYr1-Ar776mOy4Lbw@mail.gmail.com>
	<24aea6cc-d599-4935-8a75-34f38b852d1e@lunn.ch>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,redhat.com,skoll.ca,kernel.org,davemloft.net,google.com,linutronix.de,vger.kernel.org,ozlabs.org,uls.co.za];
	TAGGED_FROM(0.00)[bounces-485-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pppoe.so:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 866E138ADF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2 Apr 2026 16:37:01 +0200 Andrew Lunn wrote:
> > > ln -n /usr/lib64/pppd/2.5.1/pppoe.so /etc/ppp/plugins/rp-pppoe.so
> > >
> > > should solve?  
> > 
> > Hard links will also work.
> > Alternatively, if your rp-pppoe version is 4.0, you can use the new
> > option `-g` to specify the full path of the pppoe.so plugin.  
> 
> It should be possible for anybody to run these self tests. So we don't
> want specially crafted setups, but generic setups which will work for
> as many people as possible.

+1 let's try not to tweak the underlying OS.

