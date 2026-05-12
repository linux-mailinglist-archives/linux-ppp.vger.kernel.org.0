Return-Path: <linux-ppp+bounces-578-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EjRBuzeAmoMyQEAu9opvQ
	(envelope-from <linux-ppp+bounces-578-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 12 May 2026 10:03:56 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A784F51C5DB
	for <lists+linux-ppp@lfdr.de>; Tue, 12 May 2026 10:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A80B4307BCC7
	for <lists+linux-ppp@lfdr.de>; Tue, 12 May 2026 08:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713FD46AF0A;
	Tue, 12 May 2026 08:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YPqrRxta";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PBKWHRPL"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEF247D951
	for <linux-ppp@vger.kernel.org>; Tue, 12 May 2026 08:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778572812; cv=none; b=e0i4sfbYBZ2DV3qmBB9p79L6k+fhz5nPf02HGOVT1ua/xwLEvCpTO9YHbq9K8nM/UcSfUNjeXRy3+hvWKHi3KDw7T3SpvzzUbk1Yvw5qEP1dKfpOhMXQbDKR4uvqLXJXkKWYAVFdyC5y0k80/SczXZyM05mQHGXPrJABw/AiUr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778572812; c=relaxed/simple;
	bh=GJ/y7fGortN5jBu8cvpMLctnF416622K/5UMEtlQUdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QXElieNHVFd3HfyLlRjGcSD33PbmVYwXLhUjA7dADRyMzFFVZO6zaB1MToMa3iKIRtYpZOfm9sMMsY7TFuXXN42cBCccgPmVVtw2hqcC9Hsjsp14BV/rEIX5HPfSKl9QAJDXUuTKkE99GVQyokpu+8elU/G0hzXQfyWZoJYth/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YPqrRxta; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PBKWHRPL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778572810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyFGEYlHjHtjEOVbVD/w/qb9ux9FYhsyRj3ILgwVqco=;
	b=YPqrRxta28fg5Ut0OoABBmuqzSs5JvS3UBf2C5MYBISInlow/EmbTgpCNCcLB3NGsXviwC
	WcLklQhf6Ogi2kiD4Djuxzn7U6yNXss6qFm5elZzsd7a7O4EDEcywgQcJyY4IbYUTrKxjZ
	62OfOt/434uiF20dG30SvXHmwswNpuc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-9nRsZKniPD26xfpIJhLZJQ-1; Tue, 12 May 2026 04:00:08 -0400
X-MC-Unique: 9nRsZKniPD26xfpIJhLZJQ-1
X-Mimecast-MFC-AGG-ID: 9nRsZKniPD26xfpIJhLZJQ_1778572807
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48d0889c1ecso31690885e9.0
        for <linux-ppp@vger.kernel.org>; Tue, 12 May 2026 01:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778572807; x=1779177607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cyFGEYlHjHtjEOVbVD/w/qb9ux9FYhsyRj3ILgwVqco=;
        b=PBKWHRPLSFQ81JZXg4exmDy54W7DFV8vj8LhKgL6bWbTyXRLyhtTzQHYYphHGRH/C3
         ZpQX3UZTJUjxaafMamXUXykVZaX5x6LUY9YfuL8yTfNSuaQuUARe1Kx7PbysEEVsLguc
         RCaG7OywfbPWCuY8R2fndCs/wgQBtBQzE1dOAU24CwvGF6de7lBEyG7RU3B/ROp195IC
         8GjvX7f/moDV6OYQA+AQ7ehzejFWSfgsJW7npxHPLIF3Ve9U+XxoBmDUcHQa6FxpCmSS
         HAWZHiK+pHtcbU7ioA7jG5u+YDQUwGtVs2/dZhNBz4l9QrBLg4lb1JhZfsyY3NhgvrBB
         casA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778572807; x=1779177607;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyFGEYlHjHtjEOVbVD/w/qb9ux9FYhsyRj3ILgwVqco=;
        b=RVLp/Zffjgf59C09fxUqRLnvSCZUnaJxpZPjVXMck5RCMricdjWjHOaW1Gufa86KwG
         X+401+uo5LFL+gR3IYanjuLw/g+ua2phmi+zLAYycrSYoOMVsQ4dadFb6gufjPdudY5b
         oAF3UmyY0VyWLsSXJyyd7hQLP3+pILyT5CaJPEYWAlBNM8RcIii0iu43LrzUJ4/wlX2a
         OvnIOcvHHQUQ7GkGW/ofqdkIy/9hZdIr4+bmQskrBqYJ5a93HXJqP+z9+XWjwXG7bafu
         Q82lPSpY2d5u5Bf7ktpYELh7MFcsK7cRlEc1VX5xTiElQj2yWUtIb2Nfqgt7cjOqnIKw
         L8UA==
X-Forwarded-Encrypted: i=1; AFNElJ8++zI1uCS255OLZW2qhOL5C62xcjy8KCy4RQOEzpchzdqvXWZGdT8W7OGYOKQ5/R2dRkxm8c2X/ao=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUNhQSMDKRsJjBC7xUARKsZdCaVq3N40RwfN4Y5a9ddvtDPsEd
	8unv1q0IsyqaQ3JdYBkDeePRgC7NcICFNs2z1pzwBMrIsnwV+11PCy1GumWAuVIFic/Lt6uyv3B
	ZmDDTAI5Egz3+mhPHTLI7Bo/cRzMTnBJydlZRHGK/+IZc6McdUrxlBHyHgHmHpg==
X-Gm-Gg: Acq92OFGWE4YrZhrPaZ9ivPAfg8YUXb2ZnumxwMoxZYiOLWpCnWUtk3pbSDa/wpgZGo
	8xsTG+M0Az28cR1Ahc9as15dyzhCVoIgwQuJ1v82Iq2Ynm3KUr9hJFZIglPUqNpQBLb7XR7k+Ay
	YYUJm6CUDL2of5zFX9jbMkwjLzS5qja5eZc/09YFFEucNlsHRo/TtlXHaHLeCECaeYU+2p3tbry
	DPfHFjJHfjv5BJvB4W8hObW8pjdn+t6osFNuXenmwHiFEtYcYxF8GqmCHJVQZtDrSkixr3U4U/O
	nCogI50jW1otfoa3RtTi51iLvyocx4ZF6N6yMVzJR1SKLZvD+qXy/TDFpQnNcwvK3rQtPnXBUHD
	/582yfUFoVDzhghmC8yRFhbWgTK+JvPMvUu3YSEjY0d7IE0EsexK92t8=
X-Received: by 2002:a05:600c:46d2:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-48e51f32aebmr396266545e9.16.1778572806219;
        Tue, 12 May 2026 01:00:06 -0700 (PDT)
X-Received: by 2002:a05:600c:46d2:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-48e51f32aebmr396265385e9.16.1778572805618;
        Tue, 12 May 2026 01:00:05 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.9.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e906a0debsm41474895e9.3.2026.05.12.01.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:00:05 -0700 (PDT)
Message-ID: <05927f32-8df5-4a78-a188-5a4c2b82a85a@redhat.com>
Date: Tue, 12 May 2026 10:00:03 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] selftests: net: add tests for PPPoL2TP
To: Qingfang Deng <qingfang.deng@linux.dev>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Felix Maurer <fmaurer@redhat.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Petr Machata <petrm@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260508032158.67887-1-qingfang.deng@linux.dev>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260508032158.67887-1-qingfang.deng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A784F51C5DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-578-lists,linux-ppp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-ppp@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ppp];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ppp_common.sh:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/8/26 5:21 AM, Qingfang Deng wrote:
> diff --git a/tools/testing/selftests/net/ppp/pppol2tp.sh b/tools/testing/selftests/net/ppp/pppol2tp.sh
> new file mode 100755
> index 000000000000..5ddcc6c41c33
> --- /dev/null
> +++ b/tools/testing/selftests/net/ppp/pppol2tp.sh
> @@ -0,0 +1,93 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +source ppp_common.sh
> +
> +NK_SERVER="nk0"
> +NK_CLIENT="nk1"
> +OUTER_IP_SERVER="172.16.1.1"
> +OUTER_IP_CLIENT="172.16.1.2"
> +
> +PPPOL2TP_DIR=$(mktemp -d /tmp/pppol2tp.XXXXXX)

Sashiko (gemini) reports an unhandled error condition here. AFAICS that
is irrelevant as it could happen only on a broken system.

> +
> +# shellcheck disable=SC2329
> +cleanup() {
> +	cleanup_all_ns
> +	rm -rf "$PPPOL2TP_DIR"
> +}
> +
> +trap cleanup EXIT
> +
> +require_command xl2tpd
> +ppp_common_init
> +modprobe -q l2tp_ppp
> +
> +# Create the netkit pair
> +ip -netns "$NS_CLIENT" link add "$NK_CLIENT" type netkit
> +ip -netns "$NS_CLIENT" link set "$NK_SERVER" netns "$NS_SERVER"
> +ip -netns "$NS_SERVER" link set "$NK_SERVER" up
> +ip -netns "$NS_CLIENT" link set "$NK_CLIENT" up
> +ip -netns "$NS_SERVER" address add dev "$NK_SERVER" "$OUTER_IP_SERVER" peer "$OUTER_IP_CLIENT"
> +ip -netns "$NS_CLIENT" address add dev "$NK_CLIENT" "$OUTER_IP_CLIENT" peer "$OUTER_IP_SERVER"
> +
> +# Generate configuration files
> +cat > "$PPPOL2TP_DIR/l2tp-server.conf" <<EOF
> +[global]
> +listen-addr = $OUTER_IP_SERVER
> +access control = no
> +
> +[lns default]
> +ip range = $IP_CLIENT
> +local ip = $IP_SERVER
> +require authentication = no
> +require chap = no
> +require pap = no
> +ppp debug = yes
> +pppoptfile = $(pwd)/pppoe-server-options
> +EOF
> +
> +cat > "$PPPOL2TP_DIR/l2tp-client.conf" <<EOF
> +[global]
> +listen-addr = $OUTER_IP_CLIENT
> +access control = no
> +
> +[lac server]
> +lns = $OUTER_IP_SERVER
> +require authentication = no
> +require chap = no
> +require pap = no
> +ppp debug = yes
> +pppoptfile = $(pwd)/pppoe-server-options
> +EOF
> +
> +# Start the L2TP Server
> +ip netns exec "$NS_SERVER" xl2tpd -D -c "$PPPOL2TP_DIR/l2tp-server.conf" \
> +	-p "$PPPOL2TP_DIR/l2tp-server.pid" -C "$PPPOL2TP_DIR/l2tp-server.control" &
> +
> +# Start the L2TP Client
> +ip netns exec "$NS_CLIENT" xl2tpd -D -c "$PPPOL2TP_DIR/l2tp-client.conf" \
> +	-p "$PPPOL2TP_DIR/l2tp-client.pid" -C "$PPPOL2TP_DIR/l2tp-client.control" &
> +
> +# Wait for xl2tpd to start and open their control pipes
> +slowwait 2 [ -p "$PPPOL2TP_DIR/l2tp-server.control" ]
> +slowwait 2 [ -p "$PPPOL2TP_DIR/l2tp-client.control" ]
> +
> +# Connect LAC to LNS
> +echo "c server" > "$PPPOL2TP_DIR/l2tp-client.control"
> +
> +ppp_test_connectivity
> +
> +log_test "PPPoL2TP"
> +
> +# Recursion test
> +# Delete route to LNS IP
> +ip -netns "$NS_CLIENT" route del "$OUTER_IP_SERVER"
> +# Add default route through ppp0
> +ip -netns "$NS_CLIENT" route add default dev ppp0
> +# ping (we expect the ping to fail but not deadlock the system)
> +ip netns exec "$NS_CLIENT" ping -c 1 "$IP_SERVER" -w 1
> +check_fail $?

Sashiko notes you should clear the RET global variable before any direct
or indirect invocation of check_err

/P


