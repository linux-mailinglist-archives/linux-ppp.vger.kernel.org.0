Return-Path: <linux-ppp+bounces-581-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PVcCBPUA2ol/AEAu9opvQ
	(envelope-from <linux-ppp+bounces-581-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 13 May 2026 03:29:55 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7324052BE28
	for <lists+linux-ppp@lfdr.de>; Wed, 13 May 2026 03:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E45330D38F1
	for <lists+linux-ppp@lfdr.de>; Wed, 13 May 2026 01:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17063377EC3;
	Wed, 13 May 2026 01:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gcnNJzu2"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93915372070;
	Wed, 13 May 2026 01:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778635637; cv=none; b=HQgVgeJSQq95QN2VL5rD1kYy6+DFZVY57d5Prmah1gMEVH6bpJzWDiiHiHO619Wj8gTJunHFv0KG4bE2iHF9Am0HFTnO6RjoBy/DJsc1/4l/ZQDoUxpt/Zgsr7/x7FUGOJBdFDY3lpFQkJ5OGAabTC0neRfVII+upRcKFnd4v6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778635637; c=relaxed/simple;
	bh=TnPUINJyn6PSHuLu1gstbRWe/QwCMgAzrJLX58enzVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=otCD/YCZXm8GpXVYDUMlY7iKiDesUgtmSG+/jej791gzmxhNuEdu7iGPGHvX0DyCd0XTnb3y5JzB2tMx1zjhQep23/zxAPoDlVjmcswM1JY6VyMVbwYL7qKXWlqasFcgzWFll8OMRFfjT2KDONdRllc+oheaxRWae+rZgScBBIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gcnNJzu2; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778635616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yXDkhGNFKR9D13wH3Aimd/W/T350h2uBDl+jL3kz9Z4=;
	b=gcnNJzu2SukDxzPLcIgvZbWCubuSJpeLvLsieiA8LnGNVPcHsLvK2tCxpQr/TaeDmMvzs5
	JK46q5FcAPMlUwQkKZ1VKo7VXFTPqtgX/yxmJ5C4AL/ccv3V/vnP41oXYL3FAluLLmvI6p
	q8Ma3TlT32hZAKjTpBO//KvGYTmQXY4=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Kees Cook <kees@kernel.org>,
	Guillaume Nault <gnault@redhat.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Willem de Bruijn <willemb@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Richard Gobert <richardbgobert@gmail.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ppp@vger.kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: Re: [PATCH net-next v9 1/2] net: pppoe: implement GRO/GSO support
Date: Wed, 13 May 2026 09:26:39 +0800
Message-ID: <20260513012641.5325-1-qingfang.deng@linux.dev>
In-Reply-To: <agNkIrRFPP0pYcfz@chamomile>
References: <20260509030507.387050-1-qingfang.deng@linux.dev> <a5b3ac22-1515-4642-ad55-1f8b564cc140@redhat.com> <agNkIrRFPP0pYcfz@chamomile>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 7324052BE28
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[redhat.com,linux.dev,lunn.ch,davemloft.net,google.com,kernel.org,nvidia.com,gmail.com,nbd.name,vger.kernel.org,intel.com];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-581-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, 12 May 2026 at 19:32:45 +0200, Pablo Neira Ayuso wrote:
> diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_table_ip.c
> index 9c05a50d6013..270c3d0233ad 100644
> --- a/net/netfilter/nf_flow_table_ip.c
> +++ b/net/netfilter/nf_flow_table_ip.c
> @@ -577,6 +577,10 @@ static int nf_flow_pppoe_push(struct sk_buff *skb, u16 id,
>  		return -1;
>  	}
>  
> +	skb_set_inner_transport_header(skb, skb_transport_offset(skb));
> +	skb_set_inner_protocol(skb, skb->protocol);
> +	skb->encapsulation = 1;
> +

Is this change needed? The PPPoE driver does not touch these fields.

>  	__skb_push(skb, PPPOE_SES_HLEN);
>  	skb_reset_network_header(skb);
>  

Thanks for your tests. 

Regards,
Qingfang

