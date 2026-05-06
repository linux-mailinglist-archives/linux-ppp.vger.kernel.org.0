Return-Path: <linux-ppp+bounces-564-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DkJIpww+2lxXQMAu9opvQ
	(envelope-from <linux-ppp+bounces-564-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 06 May 2026 14:14:20 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F193D4DA059
	for <lists+linux-ppp@lfdr.de>; Wed, 06 May 2026 14:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD79B3014865
	for <lists+linux-ppp@lfdr.de>; Wed,  6 May 2026 12:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5F443E48A;
	Wed,  6 May 2026 12:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6VKFf6T"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440753368B7;
	Wed,  6 May 2026 12:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778069657; cv=none; b=ZjZPILo+4TOQE19nyKu2hWHvIJ6fjiR//1nBSjEGhJbB7u/yUV3KmzDAYxv3i+YoVIC8o/C9qT8SqLHprl5G8+xwaCPJE93kd4FjP39bIZQVtLAcLmFv1EkPIbM1vSlRU+j8t7lZSqCS8dyIuoxkna/q7FhZl6jg+z7lqu0pnII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778069657; c=relaxed/simple;
	bh=tPtGxWRosLrlwCndxfo3VTI0LuICQw7db3oOBpfe1dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQITHS799aQUsOjT6HfbclUAaWH2fVGVm8oQtKiGOLOcNKXuFd68M4s3b5hY83wTABF4FlNi/eYM0wxE28M+VtDdXwr/2nFGT6APmiP/j0kkzSdKNWVFYbDs8SzS7LrSGz+BA4IPGqFtTX7+HozpH8raoqlsXezM9bKwzyPTw+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6VKFf6T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BACC2BCB8;
	Wed,  6 May 2026 12:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778069656;
	bh=tPtGxWRosLrlwCndxfo3VTI0LuICQw7db3oOBpfe1dk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G6VKFf6TsZGaPvAILfKboCR7usJIF2c9WZ8UoNTsmUQivTbbVnIB0ow/1kjRQYZGT
	 fyd0sOMRUGG59NWWGrQSUOYDCzAUifuDMLVxIJm4TLKISiSQ33TKR1xuuoet1yVw/M
	 lXg1VXQdgptj8bIfyAK1Bgc9RLSdVyQcLJX4PTa0DznjF6EwJ/HsLpNDLj1XC11U2M
	 SkS2NggVq/QlT9HfKhbhOpfnBna1Nxx0YtAsiHq8FYmiVbTdshMO3tS8gnx8qdRmp2
	 8zE5yP+3S1yXQbsrdBngjLjlnPuqnuFyuWNpCHtuATRsWdHxi8INCzvZRIg9nXRcI2
	 PEOB7SiC6OERQ==
From: Simon Horman <horms@kernel.org>
To: qingfang.deng@linux.dev
Cc: 'Simon Horman' <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	willemb@google.com,
	petrm@nvidia.com,
	anubhavsinggh@google.com,
	richardbgobert@gmail.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ppp@vger.kernel.org
Subject: Re: [PATCH net-next v8 1/2] net: pppoe: implement GRO/GSO support
Date: Wed,  6 May 2026 13:14:01 +0100
Message-ID: <20260506121401.651540-1-horms@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501035102.293031-1-qingfang.deng@linux.dev>
References: <20260501035102.293031-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F193D4DA059
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,nvidia.com,gmail.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-564-lists,linux-ppp=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url]

From: 'Simon Horman' <horms@kernel.org>

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev
---
net: pppoe: implement GRO/GSO support

This commit adds GRO and GSO support for PPPoE, which improves rx throughput
significantly by handling packets where the pppoe header length field matches
the exact packet length.

> diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
> index bdd61c504a1c4..363204e0c49a1 100644
> --- a/drivers/net/ppp/pppoe.c
> +++ b/drivers/net/ppp/pppoe.c
[ ... ]
> @@ -1103,6 +1104,164 @@ static struct pernet_operations pppoe_net_ops = {
>  	.size = sizeof(struct pppoe_net),
>  };
>  
> +static u16
> +compare_pppoe_header(const struct pppoe_hdr *phdr,
> +		     const struct pppoe_hdr *phdr2)
> +{
> +	__be16 proto = *(const __be16 *)(phdr + 1);

Because struct pppoe_hdr is packed, the compiler assigns it 1-byte alignment
semantics, which phdr + 1 inherits.

Does explicitly casting this to __be16 * bypass the compiler's unaligned access
protections?

If skb->data has an odd alignment from the NIC, this could trigger a fatal
unaligned memory access exception on strict-alignment architectures. Would it
be safer to use get_unaligned() here?

> +	__be16 proto2 = *(const __be16 *)(phdr2 + 1);
> +
> +	return (__force u16)((phdr->sid ^ phdr2->sid) | (proto ^ proto2));
> +}
> +
> +static __be16 pppoe_hdr_proto(const struct pppoe_hdr *phdr)
> +{
> +	__be16 proto = *(const __be16 *)(phdr + 1);

Could this also result in an unaligned access regression for the same reason?

[ ... ]
> +static struct sk_buff *pppoe_gro_receive(struct list_head *head,
> +					 struct sk_buff *skb)
> +{
[ ... ]
> +	off_pppoe = skb_gro_offset(skb);
> +	hlen = off_pppoe + PPPOE_SES_HLEN;
> +	phdr = skb_gro_header(skb, hlen, off_pppoe);
> +	if (unlikely(!phdr))
> +		goto out;
> +
> +	/* filter for session packets (type:1, ver:1, code:0) */
> +	if (*(const __be16 *)phdr != cpu_to_be16(0x1100))

Is it possible this cast could similarly trigger an unaligned access exception
if the header offset is oddly aligned?

[ ... ]
> +static struct sk_buff *pppoe_gso_segment(struct sk_buff *skb,
> +					 netdev_features_t features)
> +{
[ ... ]
> +	segs = ptype->callbacks.gso_segment(skb, features);
> +	if (IS_ERR_OR_NULL(segs)) {
> +		skb_gso_error_unwind(skb, orig_type, PPPOE_SES_HLEN, mac_offset,
> +				     mac_len);

If the inner protocol's gso_segment callback returns NULL (indicating the
hardware can natively offload the segmentation), skb_gso_error_unwind() will
be called.

skb_gso_error_unwind() unconditionally sets skb->encapsulation = 1. However,
PPPoE does not configure the inner header offsets (such as
skb->inner_network_header).

When the driver sees skb->encapsulation == 1, could it attempt to read the
uninitialized inner header offsets, parsing the outer MAC header as an inner
IP header and misprogramming the hardware TSO context?

Does PPPoE need to explicitly clear TSO features before calling the inner
segmentation to force software segmentation, avoiding the need for
skb_gso_error_unwind() here entirely?

> +		goto out;
> +	}
[ ... ]
-- 
pw-bot: changes-requested

