Return-Path: <linux-ppp+bounces-337-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D63B227B1
	for <lists+linux-ppp@lfdr.de>; Tue, 12 Aug 2025 15:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 002D94E3B77
	for <lists+linux-ppp@lfdr.de>; Tue, 12 Aug 2025 13:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5EF26A0E0;
	Tue, 12 Aug 2025 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="oKY5UMkr";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="gXIwkCQ1"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65B119ADA2;
	Tue, 12 Aug 2025 13:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755003765; cv=none; b=XPCL+JIsyMStx0WNtHemGhmDR/EchNP1Xs3OsXN8nwvziqWiZmR98k4Bsbk88ca6WbCRDak3BrTTkKx7ARriyixRlHdZsyQnD56HS4HyHncZCkjwSV8EfGuM+uZLriATjXLKSoUm/XfYvbMhkyY8xK+lRt4L2QDq5JzfvEJsJHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755003765; c=relaxed/simple;
	bh=hF4N0ur3iJ8jD2s2cmdeDWXctMqDSnF4apK66vD/nQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLTFAOF42lkXV9YpGqb4yKXhnOwCQRogflN7s8Dk+Doj5zVkGEj4dp/+qF9HBLBCigq4qjpEk+aahSErCxLIAuvgc4proInN1exoYoIABWKCsB6PPj+n2Ux4vLJoRGOQMvQM6X5ToJN+SV40YN+kONjRIl+R10lceYGfWi4WZs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=oKY5UMkr; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=gXIwkCQ1; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 2824E606FC; Tue, 12 Aug 2025 15:02:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1755003761;
	bh=evoH9a8QCOaR7pv6eWp+7tmYBWdbldvMsHMUrW2jCVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oKY5UMkrnyeA2SeEorRyk9mEs7SHjXbd7Tb1xNEkkRr2wXL5M6Bu99+V7PapIOFO2
	 Z/EhzIRls6e+pbNcJuhguVFVR+shSLnNo6/w8LCCEoscDILEayBIMgt91dbv8vwirY
	 6xtzvap503KI5lM8ClTZV6ULZydgk0sYk8valh01byQ+HopCXKrHMkYBrzY5lsjtpM
	 3TNiTMrkb3jFYFD5RqGRtaVASyDEdMsIc0eoOmntK2zbgj3ibgh+iPshhsu2U5OINo
	 l7U0cxKmZJQn0jWQTZyaJo6vGtfVpowRYwqdpYMdrme8OFyYCYkH8Us66re76+T3R5
	 5nvwGQXOJB8Eg==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id B614A606FC;
	Tue, 12 Aug 2025 15:02:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1755003758;
	bh=evoH9a8QCOaR7pv6eWp+7tmYBWdbldvMsHMUrW2jCVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gXIwkCQ1uYAnGRGAPS+tUxNiGkuBwClHbgrCcxL6V7x5Zw7J5JuivP6EFIzT/KY7J
	 ZQxVm0GA8FueH9ZFdZOUd5xX5irkvrihTxHpUq0AOtF+5R14Yj0GUPRPolmpVJVNks
	 1PTmTGRtAWzcteGFmEP1bTeJKSoeQDZXja00Oqx19K42szRgWJ1I8i+U9LsfJ0CZ9d
	 ELFB9VlcHJEnfOuiENkO4V5CHmaek8BTxWlKCzqU8cHN7lrM3kRC8dCJXzRzqdcFZu
	 qPFG2MWKGDSHnWtxyifUtW1udgxIZ4vkeljM1iABPjxnV9eefPUjfL1in/LyyhMONH
	 tfApuC6OLLLLg==
Date: Tue, 12 Aug 2025 15:02:35 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] ppp: fix race conditions in ppp_fill_forward_path
Message-ID: <aJs7az9VnJ6aUwQT@calendula>
References: <20250811084427.178739-1-dqfext@gmail.com>
 <CANn89iLEMss3VGiJCo=XGVFBSA12bz0y01vVdmBN7WysBLtoUA@mail.gmail.com>
 <CALW65jZ-uBWOkxPVMQc3Yg-KEoVRdPQYVC3+q5MiQbvpDZBKTQ@mail.gmail.com>
 <CALW65jYNMNArwzmpHhYj3fpfL0Oz2fRYsJz0JMDUnyByu-8z3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALW65jYNMNArwzmpHhYj3fpfL0Oz2fRYsJz0JMDUnyByu-8z3w@mail.gmail.com>

On Tue, Aug 12, 2025 at 05:38:02PM +0800, Qingfang Deng wrote:
> On Mon, Aug 11, 2025 at 5:35 PM Qingfang Deng <dqfext@gmail.com> wrote:
> >
> > On Mon, Aug 11, 2025 at 5:19 PM Eric Dumazet <edumazet@google.com> wrote:
> > >
> > > On Mon, Aug 11, 2025 at 1:44 AM Qingfang Deng <dqfext@gmail.com> wrote:
> > > It is unclear if rcu_read_lock() is held at this point.
> > >
> > > list_first_or_null_rcu() does not have a builtin __list_check_rcu()
> >
> > ndo_fill_forward_path() is called by nf_tables chains, which is inside
> > an RCU critical section.
> 
> Update: mtk_flow_get_wdma_info() in mtk_ppe_offload.c calls
> dev_fill_forward_path() in process context without RCU, so
> ppp_fill_forward_path() can be called from two different contexts.
> Should I add rcu_read_lock() to mtk_flow_get_wdma_info() or
> ppp_fill_forward_path()?

mtk_flow_get_wdma_info() seems to be the exception at this point, so
I'm inclined to add rcu_read_lock() to mtk_flow_get_wdma_info().

