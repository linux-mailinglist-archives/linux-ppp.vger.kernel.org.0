Return-Path: <linux-ppp+bounces-527-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJ5CJeti3mlqDgAAu9opvQ
	(envelope-from <linux-ppp+bounces-527-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 14 Apr 2026 17:53:15 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BFE3FC2C3
	for <lists+linux-ppp@lfdr.de>; Tue, 14 Apr 2026 17:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9703B3066892
	for <lists+linux-ppp@lfdr.de>; Tue, 14 Apr 2026 15:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1F23ED100;
	Tue, 14 Apr 2026 15:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3jLoy1W"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CCC3ECBFB;
	Tue, 14 Apr 2026 15:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776181838; cv=none; b=GlraeukilOJ3YjLdNSpM402k5b2tyzIwXaxdFxz2zlo2GfRxHFGI+QrO6yXEF1edSqgN/DiQsEMdmJ4VGkynmN+Q6R5P79VWSCGqByvf2b0A046wXOkYNYvePp5LxgODzvPCsMMCjatwVvd5Osd8ILmqGngBkK4gL/dGNNu36eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776181838; c=relaxed/simple;
	bh=XyOJ+1EGDC2D3hC9IlmWWA2HKrNhgTpuv0XWsgUitSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdNsXan7bYQdzlcuROnkQck67+7/zD6JoD/uUnnncDRvEKEnA4IsJLxgFhOY+DvoEqfIKxnewrGGpAORqt6ChMoQpYZbIP/+/d9+YKJVB26QBAXe2MjFG6F4VA87t6yZ5la0X4Dz8RyrYP5AjQONmGD/yfwRGTTp0RQ5kbq83qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3jLoy1W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13C8C19425;
	Tue, 14 Apr 2026 15:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776181837;
	bh=XyOJ+1EGDC2D3hC9IlmWWA2HKrNhgTpuv0XWsgUitSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A3jLoy1W8ibYYiFkX7Tibcg56i7dbrtR7s9rUXYlQsIOxYFPl0WH9xZWeR9l//3SE
	 hyGB9R4t+58+Q07plHTkq2OKfJpmvc23n0p4uCWZQbkshNV9TsViFYSp0HR3m1ej9D
	 STUv0GOThiAhybBomi1jbZ1vNgQFlDAcnCnKICM+RDGHcxJoonN0gQ4ei/KNFuRli9
	 BCI7VPIBDTi5WDZWD4xj9T0QRF8lSEnucc5r0xrYoXqqOysHM5h+Om8Xft3kZ38TZf
	 peCAYQWw21SVULAqeYDiflIRhIevlq/H45OuUXH17eXW60NrMroj+aUHfKawgX7Fjp
	 luPtZdCeZfwyA==
Date: Tue, 14 Apr 2026 16:50:32 +0100
From: Simon Horman <horms@kernel.org>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: linux-ppp@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Guillaume Nault <gnault@redhat.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Paul Mackerras <paulus@ozlabs.org>, Jaco Kroon <jaco@uls.co.za>,
	James Carlson <carlsonj@workingcode.com>,
	Marcin Szycik <marcin.szycik@linux.intel.com>
Subject: Re: [PATCH net v4 1/2] flow_dissector: do not dissect PPPoE PFC
 frames
Message-ID: <20260414155032.GJ469338@kernel.org>
References: <20260410033627.93786-1-qingfang.deng@linux.dev>
 <20260410171056.GD469338@kernel.org>
 <717da5ac-a020-4710-8ebb-6ed9d6e48bf4@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <717da5ac-a020-4710-8ebb-6ed9d6e48bf4@linux.dev>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-527-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 11BFE3FC2C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 11:56:30AM +0800, Qingfang Deng wrote:
> Hi,
> 
> On 4/11/2026 1:10 AM, Simon Horman wrote:
> > On Fri, Apr 10, 2026 at 11:36:20AM +0800, Qingfang Deng wrote:
> > > @@ -1361,7 +1376,7 @@ bool __skb_flow_dissect(const struct net *net,
> > >   			struct pppoe_hdr hdr;
> > >   			__be16 proto;
> > >   		} *hdr, _hdr;
> > > -		u16 ppp_proto;
> > > +		__be16 ppp_proto;
> > 
> > I'm unclear of the relationship between changing the type of ppp_proto
> > and the problem described in the patch description. And it
> > is creating a log of churn in this patch. I suggest dropping it.
> 
> The intention is to restore the original behavior before the blamed commit.
> If you find it too verbose for a fix, I can drop it and then repost that
> part later to net-next.

Thanks, I see you have posted v5, which I plan to review.
FTR: I think it is best to split the fix, for net, from
other changes for net-next.

...

