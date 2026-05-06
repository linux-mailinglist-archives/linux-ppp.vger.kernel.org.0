Return-Path: <linux-ppp+bounces-565-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAx0A8kw+2lxXQMAu9opvQ
	(envelope-from <linux-ppp+bounces-565-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 06 May 2026 14:15:05 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 795284DA086
	for <lists+linux-ppp@lfdr.de>; Wed, 06 May 2026 14:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 038893014879
	for <lists+linux-ppp@lfdr.de>; Wed,  6 May 2026 12:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBB4441048;
	Wed,  6 May 2026 12:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhqdXZ1M"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484DD3DFC68;
	Wed,  6 May 2026 12:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778069702; cv=none; b=jB92CO7QHpUM0JDK/yVY/8GWQAzS8uNAFxwFADqgc9fkxuKyj0XxPTgUxYSQcXvTcLzXdnN2du4k83EyRWjQVlJcrfFrLfaeMWyns+cCzYlt9/uHOXQExHrdBFPhLwOuyHCNiHWdwv2RQqBDA0OieK57AbwdwP4Ck1Mag9DaC18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778069702; c=relaxed/simple;
	bh=W/kdTc73sAr9ywWuVImHdr8H4/gzoh0lhVnQZ432zjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oN0+oKvfEKSpyl/DZO517IoqyLZXiYQZoNlhlL5XsO0lD7VKtQDYMD37V2AGcRcJC9VeCPtmFA0Iak1cuA5bkiE3J3K1myAWfNzadK011XEyNMo4rKb1BRZqol3tOk9VKfAeKqf9P1mVnt7leSEx/4+S0m9pxHCqCdz4xrrQ6CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhqdXZ1M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCED0C2BCB8;
	Wed,  6 May 2026 12:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778069702;
	bh=W/kdTc73sAr9ywWuVImHdr8H4/gzoh0lhVnQZ432zjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RhqdXZ1MC0+rmdSLPBFDfHc6SiLyVuOvXyjoGyzEQ0rkw2tdH4KTyHxWdlMHoiMPh
	 XBBijHoUTnPyWNDFvhP2UW9hss/Qd/1yp/qbGUaPjbKJx//FfkD8tEkJaOraleVMGO
	 IAZiNAlgsJpqr/0pifNeK2RxsDJkm9ZLs70P7CQyoM2yxZvneLUETGsmznnOK4MvNS
	 pr03WfTd3atEml1CLrVDJ8FMsa7blxXOcervTTSWv0+ADWmNfKcN8ln+YqMlvfjk8X
	 G8Za0xWxp8XaSMi0MN06odvGkyADJWTK7lqUo2ssdkjlBS1zas6Bk7PVj+aGZfZN0P
	 ORFun/9As8QRw==
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
Subject: Re: [PATCH net-next v8 2/2] selftests: net: test PPPoE packets in gro.sh
Date: Wed,  6 May 2026 13:14:54 +0100
Message-ID: <20260506121454.652034-1-horms@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501035102.293031-2-qingfang.deng@linux.dev>
References: <20260501035102.293031-2-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 795284DA086
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
	TAGGED_FROM(0.00)[bounces-565-lists,linux-ppp=lfdr.de];
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
selftests: net: test PPPoE packets in gro.sh
    
This commit adds PPPoE test-cases to the GRO selftest and a new "pppoe_sid"
test case to verify that packets with different PPPoE session IDs are correctly
identified as separate flows.

> diff --git a/tools/testing/selftests/net/lib/gro.c b/tools/testing/selftests/net/lib/gro.c
> index 11b16ae5f0e83..4ffb0491c0da7 100644
> --- a/tools/testing/selftests/net/lib/gro.c
> +++ b/tools/testing/selftests/net/lib/gro.c

[ ... ]

> @@ -1071,6 +1095,20 @@ static void send_fragment6(int fd, struct sockaddr_ll *daddr)
>  	write_packet(fd, buf, bufpkt_len, daddr);
>  }
>  
> +static void send_changed_pppoe_sid(int fd, struct sockaddr_ll *daddr)
> +{
> +	static char buf[L2_HLEN_MAX + PAYLOAD_LEN];
> +	int pkt_size = total_hdr_len + PAYLOAD_LEN;
> +	struct pppoe_hdr *hdr = (struct pppoe_hdr *)(buf + ETH_HLEN);
> +
> +	create_packet(buf, 0, 0, PAYLOAD_LEN, 0);

Will this write past the end of the buffer?

When create_packet() is called, it writes total_hdr_len + PAYLOAD_LEN bytes:

tools/testing/selftests/net/lib/gro.c:create_packet() {
    ...
    memset(buf, 0, total_hdr_len);
    memset(buf + total_hdr_len, 'a', payload_len);
    ...
}

However, buf is only sized for L2_HLEN_MAX + PAYLOAD_LEN. L2_HLEN_MAX
evaluates to 22 bytes (ETH_HLEN + PPPOE_SES_HLEN). For IPv6 PPPoE packets,
total_hdr_len can be up to 82 bytes (14 ETH + 8 PPPoE + 40 IPv6 + 20 TCP).

Does this result in an out-of-bounds write of 60 bytes when setting up the
IPv6 test case?

> +	write_packet(fd, buf, pkt_size, daddr);
> +
> +	create_packet(buf, PAYLOAD_LEN, 0, PAYLOAD_LEN, 0);
> +	hdr->sid = htons(0x4321);
> +	write_packet(fd, buf, pkt_size, daddr);
> +}

