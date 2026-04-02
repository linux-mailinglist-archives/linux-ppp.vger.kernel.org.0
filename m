Return-Path: <linux-ppp+bounces-483-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yO0TCV+AzmkqoAYAu9opvQ
	(envelope-from <linux-ppp+bounces-483-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 16:42:39 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD39C38AC03
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 16:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E970C30A77D8
	for <lists+linux-ppp@lfdr.de>; Thu,  2 Apr 2026 14:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B603E63B5;
	Thu,  2 Apr 2026 14:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="KsuNwpld"
X-Original-To: linux-ppp@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CCE3CA4AB;
	Thu,  2 Apr 2026 14:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775140646; cv=none; b=q4nxFrv5odopNaqGEfze2ROAf5+03422z4x2M/oRIbafvyhbxuEFQyIZKx30rKLxI8nssp5SUbBpHnRt6TE3hp3mcmCo3OT5PUntUvrHSIiBseqvBK1kfvBGntGJJHUJd+XsGeC9/nVaWc7HmU409+A2ItyyFdPmbaGcmtxCsRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775140646; c=relaxed/simple;
	bh=hFW1WirWB3PBVHlQq9qrz+g5bLZ5tFr+4BQGJ7+vcQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wt+uKGjm6SCu/Oai14td3b2j9X9CQ6OzE4JBGtrHNWgltAkEUp10qrfO529vir5PSPABgitvWaxMMmh3HDPEF8/gy+Xvvr4lDF22Lu1llW7lpcvAVbG7JRmSI41dMhFjgKMeforoFx5anDN/2d+vFRwHqC728Y7V5LCj4NCKsKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=KsuNwpld; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=T0tZRmojfGOL+npL3ZUwNlI8atXbTusRZk4xOnYHYNg=; b=Ks
	uNwpldTkYZHn0EYOV5BOZj/SoKQ8sJicSmjQaqJ9qIaaiAyRJnTFOnyRkkbK6TzTI7htQ4+VEK88/
	84mAEyDK7VHuFtAnqbnhm/GHQogNUKUcjdjKgma3chUBF/RFWQPzQCbm55AV0Uije02Jd1ZvWw+3N
	vkymZS45Ly/YFtM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w8JAL-00EWvA-4K; Thu, 02 Apr 2026 16:37:01 +0200
Date: Thu, 2 Apr 2026 16:37:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Dianne Skoll <dianne@skoll.ca>, Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
	Felix Maurer <fmaurer@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
	Paul Mackerras <paulus@ozlabs.org>, Jaco Kroon <jaco@uls.co.za>
Subject: Re: [PATCH net-next v7] selftests: net: add tests for PPP
Message-ID: <24aea6cc-d599-4935-8a75-34f38b852d1e@lunn.ch>
References: <20260330035604.133073-1-dqfext@gmail.com>
 <20260401081030.29b050d5@kernel.org>
 <CALW65jahWApDnVmFReW+Y3HDxBEmCwzsT1oyh03SW7X5ry6PzA@mail.gmail.com>
 <20260401175621.549c492e@kernel.org>
 <CALW65jaTbaosbO8ypKZ6G37HxuxXabeTaP_Fhq72xTovmDj+8g@mail.gmail.com>
 <50ae3c69-2c4e-499f-a46a-cbd207ff5f09@redhat.com>
 <CALW65ja1FV-OcqSazgKZhQhKf3oqr=kcGxyGkOGbhurGLOJ0-w@mail.gmail.com>
 <cb43761b-d414-4878-bf41-4ef6c988f881@redhat.com>
 <CALW65jZszAVHNSYgo9Fav8J-Ph9dXzR34CYr1-Ar776mOy4Lbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALW65jZszAVHNSYgo9Fav8J-Ph9dXzR34CYr1-Ar776mOy4Lbw@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-483-lists,linux-ppp=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rp-pppoe.so:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lunn.ch:dkim,lunn.ch:mid,pppoe.so:url]
X-Rspamd-Queue-Id: BD39C38AC03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 08:04:23PM +0800, Qingfang Deng wrote:
> On Thu, Apr 2, 2026 at 7:17 PM Paolo Abeni <pabeni@redhat.com> wrote:
> >
> > On 4/2/26 12:13 PM, Qingfang Deng wrote:
> >
> > > What distro do you run CI tests on? On Ubuntu 24.04, "rp-pppoe.so" is
> > > a symlink to "pppoe.so" in apt package "ppp". Maybe an additional
> > > package is required for the distro you use, or I may work around that
> > > by manually creating the symlink.
> >
> > It's fedora 43 with ppp and pppoe installed.
> >
> > ppp provides pppoe.so, and AFAICS nothink provides rp-pppoe.so, and the
> > pppoe-server is looking for a non existing /etc/ppp/plugins/rp-pppoe.so
> > plugin.
> >
> > Before I mess with the nipa testbed, could you please double check that
> >
> > ln -n /usr/lib64/pppd/2.5.1/pppoe.so /etc/ppp/plugins/rp-pppoe.so
> >
> > should solve?
> 
> Hard links will also work.
> Alternatively, if your rp-pppoe version is 4.0, you can use the new
> option `-g` to specify the full path of the pppoe.so plugin.

It should be possible for anybody to run these self tests. So we don't
want specially crafted setups, but generic setups which will work for
as many people as possible.

It looks like v4.0 we released 2024-09-09. So can we make that the
minimum version? Fail the test if an older version is found? Can the
test poke around the file system and find rp-pppoe.so and pass it
using -g?

      Andrew

