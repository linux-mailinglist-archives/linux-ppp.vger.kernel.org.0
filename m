Return-Path: <linux-ppp+bounces-555-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HpyEDQr82mwxgEAu9opvQ
	(envelope-from <linux-ppp+bounces-555-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 12:13:08 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EF64A0950
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 12:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF06A30D128F
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 10:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CBA3FF8A5;
	Thu, 30 Apr 2026 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZuQGiqjY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tDSFrHZe"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171C23FE665
	for <linux-ppp@vger.kernel.org>; Thu, 30 Apr 2026 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543483; cv=none; b=rvMUSUZMWQqgZf8cTNRyOlSReRX+ppwA1K6WO7cCmlddJvy20Mzf5ll47f4uVxYHU1jLiNBIjZ9ke0l2Y2Qey0zu2RCxE2gPLga+mJrjBEyAhI3X+JDt5roClyCc3nBDmQ0YOC1dzWt/vhB5PQGl37JjpTSz9WqVWyYLyHI7zzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543483; c=relaxed/simple;
	bh=P1D6A4ZZ/nk/jZDN2eR62W2Ir6JYW+HvVastsvEYnJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGdXTfu7+HoiZsrR/Di/r0+nhOkSct8cJrvCoIGNq3ZnkXu7joSUj1rP07d2yeMTXG6bNpbdi/Jy38o4hjtDfhglJoJHSxjYoHunc8MemF9bTJo94C7xwXK2Re/MRZGSOjT7dkjpa2Lvr3NaabL2+vJLw18kkM3GeOgc6E0yIFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZuQGiqjY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tDSFrHZe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777543481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rkvdRE+ryZql2LrgVEX/b6XOK1Q1y4i0xKrftOVwIEs=;
	b=ZuQGiqjYM/29n62R+uRCjLt73QIn2HmG4K+V/a2aCw1Pd331ELML4hX6Os/MCXjlCWHror
	awD6YakuPd9ZuDUOnKiJG8wdi9XFBQmsOMMEX+KeFsb3gr7Z/HTVLWw91LAc+yf8BoRcx+
	RDwvzGEarSzA4YLhKnati/yq8kN4uqs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-pI3cxCyZMe6dO5NxLNerCw-1; Thu, 30 Apr 2026 06:04:39 -0400
X-MC-Unique: pI3cxCyZMe6dO5NxLNerCw-1
X-Mimecast-MFC-AGG-ID: pI3cxCyZMe6dO5NxLNerCw_1777543479
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-488d9e1e61aso7538605e9.0
        for <linux-ppp@vger.kernel.org>; Thu, 30 Apr 2026 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777543479; x=1778148279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rkvdRE+ryZql2LrgVEX/b6XOK1Q1y4i0xKrftOVwIEs=;
        b=tDSFrHZeAk490jIej+EBytvuaHpZov0EqMDFdeKa+d647eEoPpsuRIORGVXY3GK0XA
         IJEmaajFb7XyxHwnQig1iky3Egu+GPKFK48nQJ+WA81gYtzhWDzWBZeHCrZSRY9fXF8w
         lg3tkncjKFIyf1JRvR37siiwg04BZkab7NKBP4WRa3c8sQmLNrFd345JyUZk6ufCxw1w
         cxzvWOsGrjM7Ojo8cGcvgmepq4BmknNGNEGO8kV0RpqJVNzm4aWQcfY9UsMxE8B1flzf
         UCeCNq2+rXUjJncbLM7R9IfNJtlSYzaZ/+Tais5+SFSCqTEE3pWP4XfdmC01qFIyiYGS
         Jl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777543479; x=1778148279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rkvdRE+ryZql2LrgVEX/b6XOK1Q1y4i0xKrftOVwIEs=;
        b=j1orq6R68lTlmm+wLZ1bd/yGjINqmon9BAcIYodzJE5wmkknf/ZK9jBaClKUbJrFcO
         dx/HcTJD4o6jGFdDFYgJdq+t6WaYEJ7r2IM39FoISB4uOxTDzNMzIsfE75Zex6Hm7zkU
         Ng1m/L9rOx84JqpFEwSl9LxDUcBk+NHU9S172Bty5BKfRp4xlHOb6eH227ymToCNHTdp
         25x72jf5T8ZwN0hT64YgKDTWm2zD5lEkUc4YdVDSInCFvNWe1AaW8Z2m5tWxs1v4zDiN
         5sTwvdAEbBJUCZNxNfqNLpKv7IyqLdfNo1IVrVPF1V/lxWaEBHC8Tgey14dcBdXFoycP
         Akrg==
X-Gm-Message-State: AOJu0YxH1/zeT6IQ6aruU0FvnOh4NA76ineq704NjZ7a/PEIzhcPwUM+
	KP5WTNsBatjr+VvQqJp6foDdcOcO1N95thpL9yQ9gOkU7lohRDZ06F8NQQysSb5qXmPjl7L4UYC
	K+ki39AcqSdgcz3Wz72j5fyDIAFNFzzOudjNuVsnrtSvEG/aqHO4X+UZbOQXCRQ==
X-Gm-Gg: AeBDieu6FsN1uE+7uyQwBoCdE08QncBa/PralsNRz5MuupDpgUhv8YjpcPlAasJjksO
	FJEE9NA1Rp+LkkjxFZQJUxH+eU/2r5+ynf91lLx0uk3qjDfqLEx8XQRoLx7eIqVLLC+r3hU8hGE
	2kM8Rlf35V8LC/6XYtfEO/NogMJtLr0Bg1f9k6DvF51hgxeGuAB2GasXM+1VyKiDjAqY+XVskEH
	4xIblb+sHqcHSpPEWXIMB+/uxdAmfEmRCzse/lFE8Euhfl7fXMgd9C9sXB4l0bFLllW0kWDMxb4
	Fu1I4UVBORGlr/2CF1/MgSPdmTbasf2g8B9ot+i258nw+2o7owrm9LC0/CMHyOhbZyIjHe2HnB9
	ew/dNjt2kNXiy1GJPymSVfEG//klpC+tcb+u7OwyZGjy8wE4JlE7BdVEGDeOq1n4sgQ==
X-Received: by 2002:a05:600c:6992:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-48a83d7b059mr40214055e9.11.1777543478525;
        Thu, 30 Apr 2026 03:04:38 -0700 (PDT)
X-Received: by 2002:a05:600c:6992:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-48a83d7b059mr40213275e9.11.1777543477963;
        Thu, 30 Apr 2026 03:04:37 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301adesm51714265e9.10.2026.04.30.03.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 03:04:37 -0700 (PDT)
Message-ID: <2a136e4a-46d5-4527-ab6b-cf61384a8ffe@redhat.com>
Date: Thu, 30 Apr 2026 12:04:36 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 2/2] selftests: net: test PPPoE packets in
 gro.sh
To: Qingfang Deng <qingfang.deng@linux.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>,
 Petr Machata <petrm@nvidia.com>, Anubhav Singh <anubhavsinggh@google.com>,
 Richard Gobert <richardbgobert@gmail.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-ppp@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>
References: <20260428064717.74794-1-qingfang.deng@linux.dev>
 <20260428064717.74794-2-qingfang.deng@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260428064717.74794-2-qingfang.deng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D3EF64A0950
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-555-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,lunn.ch,davemloft.net,google.com,kernel.org,nvidia.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email]

On 4/28/26 8:47 AM, Qingfang Deng wrote:
> Add PPPoE test-cases to the GRO selftest. Only run a subset of
> common_tests to avoid changing the hardcoded L3 offsets everywhere.
> Add a new "pppoe_sid" test case to verify that packets with different
> PPPoE session IDs are correctly identified as separate flows and not
> coalesced.
> 
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
> v7:
>  - Do not run all the tests for PPPoE
>  - Add a new test for PPPoE
> v6: https://lore.kernel.org/netdev/20260326081127.61229-2-dqfext@gmail.com
> 
>  tools/testing/selftests/drivers/net/config |  2 +
>  tools/testing/selftests/drivers/net/gro.py | 11 +++
>  tools/testing/selftests/net/lib/gro.c      | 99 ++++++++++++++++++----
>  3 files changed, 96 insertions(+), 16 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/config b/tools/testing/selftests/drivers/net/config
> index fd16994366f4..07e386895b94 100644
> --- a/tools/testing/selftests/drivers/net/config
> +++ b/tools/testing/selftests/drivers/net/config
> @@ -8,5 +8,7 @@ CONFIG_NETCONSOLE=m
>  CONFIG_NETCONSOLE_DYNAMIC=y
>  CONFIG_NETCONSOLE_EXTENDED_LOG=y
>  CONFIG_NETDEVSIM=m
> +CONFIG_PPP=y
> +CONFIG_PPPOE=y
>  CONFIG_VLAN_8021Q=m
>  CONFIG_XDP_SOCKETS=y
> diff --git a/tools/testing/selftests/drivers/net/gro.py b/tools/testing/selftests/drivers/net/gro.py
> index 221f27e57147..ad7c80f7ba96 100755
> --- a/tools/testing/selftests/drivers/net/gro.py
> +++ b/tools/testing/selftests/drivers/net/gro.py
> @@ -313,6 +313,12 @@ def _gro_variants():
>          "ip_frag6", "ip_v6ext_same", "ip_v6ext_diff",
>      ]
>  
> +    # Tests specific to PPPoE
> +    pppoe_tests = [
> +        "data_same", "data_lrg_sml", "data_sml_lrg", "data_lrg_1byte",
> +        "data_burst", "pppoe_sid",
> +    ]
> +
>      for mode in ["sw", "hw", "lro"]:
>          for protocol in ["ipv4", "ipv6", "ipip", "ip6ip6"]:
>              for test_name in common_tests:
> @@ -325,6 +331,11 @@ def _gro_variants():
>                  for test_name in ipv6_tests:
>                      yield mode, protocol, test_name
>  
> +    for mode in ["sw"]:
> +        for protocol in ["pppoev4", "pppoev6"]:
> +            for test_name in pppoe_tests:
> +                yield mode, protocol, test_name
> +
>  
>  @ksft_variants(_gro_variants())
>  def test(cfg, mode, protocol, test_name):
> diff --git a/tools/testing/selftests/net/lib/gro.c b/tools/testing/selftests/net/lib/gro.c
> index 11b16ae5f0e8..0da55b757bcc 100644
> --- a/tools/testing/selftests/net/lib/gro.c
> +++ b/tools/testing/selftests/net/lib/gro.c
> @@ -67,12 +67,14 @@
>  #include <errno.h>
>  #include <error.h>
>  #include <getopt.h>
> +#include <net/ethernet.h>
> +#include <net/if.h>
>  #include <linux/filter.h>
>  #include <linux/if_packet.h>
> +#include <linux/if_pppox.h>
>  #include <linux/ipv6.h>
>  #include <linux/net_tstamp.h>
> -#include <net/ethernet.h>
> -#include <net/if.h>
> +#include <linux/ppp_defs.h>
>  #include <netinet/in.h>
>  #include <netinet/ip.h>
>  #include <netinet/ip6.h>
> @@ -134,6 +136,7 @@ static int total_hdr_len = -1;
>  static int ethhdr_proto = -1;
>  static bool ipip;
>  static bool ip6ip6;
> +static bool pppoe;
>  static uint64_t txtime_ns;
>  static int num_flows = 4;
>  static bool order_check;
> @@ -171,6 +174,22 @@ static void vlog(const char *fmt, ...)
>  	}
>  }
>  
> +static void fill_pppoelayer(void *buf, int payload_len, uint16_t sid)
> +{
> +	struct pppoe_ppp_hdr {
> +		struct pppoe_hdr eh;
> +		__be16 proto;
> +	} *ph = buf;
> +
> +	payload_len += sizeof(struct tcphdr);
> +	ph->eh.type = 1;
> +	ph->eh.ver = 1;
> +	ph->eh.code = 0;
> +	ph->eh.sid = htons(sid);
> +	ph->eh.length = htons(payload_len + sizeof(ph->proto));
> +	ph->proto = htons(proto == PF_INET ? PPP_IP : PPP_IPV6);
> +}
> +
>  static void setup_sock_filter(int fd)
>  {
>  	const int dport_off = tcp_offset + offsetof(struct tcphdr, dest);
> @@ -412,11 +431,15 @@ static void create_packet(void *buf, int seq_offset, int ack_offset,
>  
>  	fill_networklayer(buf + inner_ip_off, payload_len, IPPROTO_TCP);
>  	if (inner_ip_off > ETH_HLEN) {
> -		int encap_proto = (proto == PF_INET) ?
> -				  IPPROTO_IPIP : IPPROTO_IPV6;
> +		if (pppoe) {
> +			fill_pppoelayer(buf + ETH_HLEN, payload_len + ip_hdr_len, 0x1234);
> +		} else {
> +			int encap_proto = (proto == PF_INET) ?
> +					  IPPROTO_IPIP : IPPROTO_IPV6;
>  
> -		fill_networklayer(buf + ETH_HLEN,
> -				  payload_len + ip_hdr_len, encap_proto);
> +			fill_networklayer(buf + ETH_HLEN,
> +					  payload_len + ip_hdr_len, encap_proto);
> +		}
>  	}
>  
>  	fill_datalinklayer(buf);
> @@ -526,7 +549,7 @@ static void send_flags(int fd, struct sockaddr_ll *daddr, int psh, int syn,
>  static void send_data_pkts(int fd, struct sockaddr_ll *daddr,
>  			   int payload_len1, int payload_len2)
>  {
> -	static char buf[ETH_HLEN + IP_MAXPACKET];
> +	static char buf[MAX_HDR_LEN + IP_MAXPACKET];

Why MAX_HDR_LEN? I think you should add a new define alike:

#define L2_HLEN_MAX	(ETH_HLEN + PPPOE_SES_HLEN)

/P


