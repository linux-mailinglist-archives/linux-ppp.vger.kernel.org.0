Return-Path: <linux-ppp+bounces-491-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIdJBuZ31GkxuQcAu9opvQ
	(envelope-from <linux-ppp+bounces-491-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 07 Apr 2026 05:20:06 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 886333A9603
	for <lists+linux-ppp@lfdr.de>; Tue, 07 Apr 2026 05:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AD2A3017253
	for <lists+linux-ppp@lfdr.de>; Tue,  7 Apr 2026 03:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE6D372EFF;
	Tue,  7 Apr 2026 03:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U6yLraf8"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505E534DB74
	for <linux-ppp@vger.kernel.org>; Tue,  7 Apr 2026 03:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775532003; cv=none; b=s9h4bwY/SYAjAaL2QjqVNdbV60H8dD+L5cZQrvnRTXN5tRIWV3/wLKPgTtpI4feNQrX2CaDBzHyYe1tBM1zi9wqwc6p3CUQvhw2fU0z8NoqPNERtG0NtlT1jiItc4tbdzMtcI9KhEjbSvoE/TSEmaURiUzbczPZfUavlMfaSZXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775532003; c=relaxed/simple;
	bh=Qoc9FcsWY0971Mtxw9re92jKrcBSoFbO9WY3rC0dWAM=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=J1SgzKzhm4EBNEPZDLsDsrvgTv16VjujoUNFu66w1rWA4AYLOqrZzyW7hNkljVsfHaZIaloZ2q1yk51XD/v0xa6c0jDqTHuzkVLLEIq84b1S5LDgBEgGRYbrrv5O6WpBKpBb9IQH9y/sKN5RB+7wZ13QMYBcZ2P5M7eNsjYko+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U6yLraf8; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775531990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q3AInkdi6HcxeRmbGw4wszTC0bpMLALoEye9TJbgSw4=;
	b=U6yLraf8ZRVDW9ugsvvSN+oW6/LAKe+N2WbcSslZPfUGjTdAmROE0d/BvsJpNoBgUYDC+R
	SKDeXyqLvaPE7bhHN463+P2ql1fb3ec8VfG1CCKZMkK73ZCiakwAXyL88MIp5kLnWyzUXG
	z7+Gyza4Vh11bKoA6Ski6dJcF0wbFxY=
Date: Tue, 07 Apr 2026 03:19:45 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: qingfang.deng@linux.dev
Message-ID: <e3ada3f0bb0c389d592657b37c462944e633a0d6@linux.dev>
TLS-Required: No
Subject: Re: [PATCH net-next] pppoe: drop PFC frames
To: "Simon Horman" <horms@kernel.org>
Cc: linux-ppp@vger.kernel.org, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "Paul Mackerras"
 <paulus@ozlabs.org>, "Jaco Kroon" <jaco@uls.co.za>, "James Carlson"
 <carlsonj@workingcode.com>, "Wojciech Drewek"
 <wojciech.drewek@intel.com>, "Guillaume Nault" <gnault@redhat.com>
In-Reply-To: <20260406144828.GH395680@kernel.org>
References: <20260403083926.68320-1-qingfang.deng@linux.dev>
 <20260406144828.GH395680@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-491-lists,linux-ppp=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 886333A9603
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,


April 6, 2026 at 10:48 PM, Simon Horman wrote:
>=20
>=20Hi,
>=20
>=20I think it would be best to add/use a #define rather than
> open coding the magic value 0x01. And perhaps expanding
> the comment to note that skb->data[0] is the first byte
> of the PPP protocol would be nice too.

The field does not have a canonical name. As per RFC1661, the LSB of the=
=20
first=20octet is used to test if the protocol field is compressed, and th=
e=20
same=20code snippet is used in ppp_generic.c.

I could instead add a helper function:

static inline bool ppp_skb_is_compressed_proto(const struct sk_buff *skb)
{
	return skb->data[0] & 0x01;
}

What do you think?

Regards,
Qingfang

