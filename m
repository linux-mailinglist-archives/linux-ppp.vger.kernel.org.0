Return-Path: <linux-ppp+bounces-557-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEWSNwZ882nH4QEAu9opvQ
	(envelope-from <linux-ppp+bounces-557-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 17:57:58 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D424A539F
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 17:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E89763001D41
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 15:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DBD428474;
	Thu, 30 Apr 2026 15:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="DDwGkzxI"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9C13382E5;
	Thu, 30 Apr 2026 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564676; cv=none; b=Gy3U1qWtEKLwtRAa8BDlob0q82dgMhyJB46bQQZdaFrGWoIrr9mypE6o+ekt8LZ9GQrU/jX83nWj4qyhObXkTQmaOUKzdFTjJ4e/AvyHUBvu1vpOxfz7+Yvtu7iSEUWoKYH7bctjaICMAbn8M0Ms6syjm1pBmCwXnjD7uSG96P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564676; c=relaxed/simple;
	bh=NBbW+I5HblCuhQGuDtTWvOWuXyeopGFsbAAGTugsplE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sprz7xuuvRLlpqOElVcLSXWOXGL42w9uyDWljJeCOVtOrwp8Obs6NbdE64coUZrubSEUnT6BFqJIGbDWExOYrZ7IEEOta3hx8pxGc8LxY6B7o6wIqhrVs0GkUsA0QE22nLHb5mN5yqRtlJ1LKyFNBX+2PwptZUOE4L1LlALMs9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=DDwGkzxI; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 2294F60263;
	Thu, 30 Apr 2026 17:57:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1777564673;
	bh=x8RLS4IOBlLKzzcEugB33op1GEA4JAgsxvw3AAn9dd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DDwGkzxIgHG8UjM/zW6YYAp+v/nB8UFgFJAEXQMHudNeizLwQ4b8LOT9gU1p+vhNP
	 huy/AvrirTwKOZ+C3PSzhsccETYGbNrqXB/dfGzOawIDZu0o3X0loIMGR+U6Ad6k/+
	 5YyzFaljafsuRgYHrUj+j2W7+N6t8F3KgumfePcJMa0e+fmcLf/8JtlVU5Bd1E07/G
	 jZKt0PipirBeUlyzYtAPgWJ4EHRkvW2cPtMlNimIDBikzLMaAwl4Xn97KzjL32s30e
	 dyYNQ7bnst6Bw6CfU0JJNANHNaZ6XCPQKcu0XM0hTyO2D1YIB8TpYqheeg9tU6VLTH
	 KPFUXFX5SjZBA==
Date: Thu, 30 Apr 2026 17:57:50 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org
Subject: Re: [RFC PATCH net-next v6 1/2] net: pppoe: implement GRO/GSO support
Message-ID: <afN7_oBICMZ_45Zh@chamomile>
References: <20260326081127.61229-1-dqfext@gmail.com>
 <9d7f1bbc-155d-4c18-bcf7-732ebe4cbf67@redhat.com>
 <CALW65jYB1jWS5LnSxRCrEeCpPfhA8saqbYYfU-LkPh_25gWfsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALW65jYB1jWS5LnSxRCrEeCpPfhA8saqbYYfU-LkPh_25gWfsw@mail.gmail.com>
X-Rspamd-Queue-Id: 80D424A539F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[netfilter.org:s=2025];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[netfilter.org];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[netfilter.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pablo@netfilter.org,linux-ppp@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-557-lists,linux-ppp=lfdr.de];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,netfilter.org:dkim]

Hi Paolo,

On Thu, Apr 30, 2026 at 11:47:57PM +0800, Qingfang Deng wrote:
> On Thu, Apr 30, 2026 at 5:34 PM Paolo Abeni <pabeni@redhat.com> wrote:
> >
> > AFAICS, when the computed len is >= 64K, and the above min() will
> > truncate it, later pppoe_rcv() will drop the packet.
> 
> pppoe_rcv() does _not_ drop such packets.
> The drop condition is "skb->len < ntohs(ph->length)", not the other way around.
> 
> > > +     skb = segs;
> > > +     do {
> > > +             phdr = (struct pppoe_hdr *)(skb_mac_header(skb) + nhoff);
> > > +             len = skb->len - (nhoff + sizeof(*phdr));
> > > +             phdr->length = cpu_to_be16(len);
> > > +             skb->network_header = (u8 *)phdr - skb->head;
> >
> > I understand is quite late for the following question, but...
> > The network headers points to the pppoe hdr. Should it point to the
> > actual IP hdr?

This is the same with double-tagged-vlan, the network header also
points to the inner vlan in the skb payload. Changing this would
require to revisit all users in the tree that are already assuming
this.

> > Why not? A comment in the code or in the commit message would be
> > appreciated.
> 
> I'm not sure about the GSO stuff. This code is carried over from
> Felix's v3 patch unmodified and I haven't noticed any issues. Maybe he
> has the answer.
> 
> FYI, Pablo Neira Ayuso is adding the "inline PPPoE GSO" to Netfilter
> flowtable: https://lore.kernel.org/netfilter-devel/20260430055836.223494-2-pablo@netfilter.org/
> to work around missing GSO support in PPPoE driver, prior to this
> patch.

