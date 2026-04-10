Return-Path: <linux-ppp+bounces-516-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GH+eJCAr2WnhmwgAu9opvQ
	(envelope-from <linux-ppp+bounces-516-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Apr 2026 18:53:52 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DCE3DABFB
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Apr 2026 18:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5DEE7302403A
	for <lists+linux-ppp@lfdr.de>; Fri, 10 Apr 2026 16:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7354D3DFC87;
	Fri, 10 Apr 2026 16:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJfXSJIx"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0FE3E276D;
	Fri, 10 Apr 2026 16:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839780; cv=none; b=ZsQ5R0c6nQaSnyH243ygCnCAyYPaFxiik5RcbENziIANKxXV+iPi0c1SCRioDORk7O0QaXZJge3WppeT4EoDBlO0TmxECh+4xuQBErVPHlqIeW9J3km+JdI/a5XxiYpcfZkawcBSzMB4urvRIGnXyHvUnNp9OX7SlrSWTIyh5ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839780; c=relaxed/simple;
	bh=N3tys/OQ0a/0+XTHyahA8ZAfYQpRoDsXjmXq4uyyPSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLGi8t87u+cK4aDP2Wbip/jXK6+rX+KDei22g8PxmM2x7xeGd0dUNWxHDsKQr6QBgtMI9EeEjzRd3yUN2M4hp2RcF02jDTnZk8t5YlGM0sYMhs5QE3QxZxtXmpq5KC90o5/qAVtRfIzkmjua9II/pMUhBsVSV/KO4DSS0UNzG1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJfXSJIx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8265BC19421;
	Fri, 10 Apr 2026 16:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775839779;
	bh=N3tys/OQ0a/0+XTHyahA8ZAfYQpRoDsXjmXq4uyyPSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cJfXSJIxlDgSWSqEvS/rg2A5Gbt37sp7984/tuHXKC51mh4p2imfDlw3tfLbmS9BT
	 +APzaRx7ucZe3WBxDSHT2hYaIH1UsWpeopmTAh5Rum/+jc2GP7BL8c8XvoSc0esRpR
	 3C8QnvGwO1X8wDAeNt1PF5kPjI810AsA6R+jGFrFUxRdnJfDXe2E8eDOnI8E32x79J
	 uCJvPZi3ao0tGIJexPn2sWTLfEt2ZD3g2cqyRZQMmqGx5RNMPgu6OI58OMZTdJoyfg
	 iZ43ypjbWM5ea5tg/PI7+2a6YnjiamWqrzR4a3C6N/FqFG3RddaIM7b1uBOoBWzeA0
	 uuRFE9hAo1iZg==
Date: Fri, 10 Apr 2026 17:49:33 +0100
From: Simon Horman <horms@kernel.org>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: linux-ppp@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Ostrowski <mostrows@gmail.com>,
	Yue Haibing <yuehaibing@huawei.com>,
	Breno Leitao <leitao@debian.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Kees Cook <kees@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
	Jaco Kroon <jaco@uls.co.za>,
	James Carlson <carlsonj@workingcode.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Guillaume Nault <gnault@redhat.com>
Subject: Re: [PATCH net v2] pppoe: drop PFC frames
Message-ID: <20260410164933.GC469338@kernel.org>
References: <20260408024245.312732-1-qingfang.deng@linux.dev>
 <20260410164442.GB469338@kernel.org>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410164442.GB469338@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-516-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,huawei.com,debian.org,linutronix.de,ozlabs.org,uls.co.za,workingcode.com,intel.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 76DCE3DABFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:44:42PM +0100, Simon Horman wrote:
> On Wed, Apr 08, 2026 at 10:42:39AM +0800, Qingfang Deng wrote:
> > RFC 2516 Section 7 states that Protocol Field Compression (PFC) is NOT
> > RECOMMENDED for PPPoE. In practice, pppd does not support negotiating
> > PFC for PPPoE sessions, and the current PPPoE driver assumes an
> > uncompressed (2-byte) protocol field. However, the generic PPP layer
> > function ppp_input() is not aware of the negotiation result, and still
> > accepts PFC frames.
> > 
> > If a peer with a broken implementation or an attacker sends a frame with
> > a compressed (1-byte) protocol field, the subsequent PPP payload is
> > shifted by one byte. This causes the network header to be 4-byte
> > misaligned, which may trigger unaligned access exceptions on some
> > architectures.
> > 
> > To reduce the attack surface, drop PPPoE PFC frames. Introduce
> > ppp_skb_is_compressed_proto() helper function to be used in both
> > ppp_generic.c and pppoe.c to avoid open-coding.
> > 
> > Fixes: 224cf5ad14c0 ("ppp: Move the PPP drivers")
> 
> AI generated review points out that the commit cited above only moves code
> around. And thus while it may show up in git annotate as the source
> of the buggy lines of code, actually it predates that commit.
> 
> AI generated code suggests an earlier commit that adds
> the length check. But I believe that the bug predates that too.
> And that the bug is present, in some form, since the beginning of
> git history, because at that time fields of the ppp header was read without
> taking PFC into account.
> 
> So I suggest:
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> 
> Unless there is other review you probably don't need to repost just
> to address this.

Sorry, I now see there is a v3 and v4.
I will follow-up there.

-- 
pw-bot: superseded

