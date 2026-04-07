Return-Path: <linux-ppp+bounces-493-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IaqIsbX1GlxyAcAu9opvQ
	(envelope-from <linux-ppp+bounces-493-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 07 Apr 2026 12:09:10 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E19713AC8B6
	for <lists+linux-ppp@lfdr.de>; Tue, 07 Apr 2026 12:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 803633034574
	for <lists+linux-ppp@lfdr.de>; Tue,  7 Apr 2026 10:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5F02F532F;
	Tue,  7 Apr 2026 10:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aq3Ugf/L";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M8jes2Ew"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B555B3559DF
	for <linux-ppp@vger.kernel.org>; Tue,  7 Apr 2026 10:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556518; cv=none; b=ivAlGmgBYwNPrHogenk7+gfP2ra4rwJjRPQW8jzJUFxu4QsrSU0uv40N+KownHAxFFXkXE8cS3AaKb1SHRmIoXAaAqajn9iAsw3U5qkLC5Ku0Q0uC4NgvZjNp6DJdVM5/w0Pmu867AMc5AY4+u80xnhRQJG/L30GZen9E034p+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556518; c=relaxed/simple;
	bh=R9vZ3elU3V/8wueZHLI+PW4ahWXh1+tFL5xZ/WFiw88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6HdFMtETC3SXtrqFL87m8ilJ0/9u1bJtKVRGMc/DOlK2e1EETHB8KqW1tZovYXV71HRsBO1MtK7YrYBE1KIsQnaH7M5dkhcUX+lxDNwAGEVcEeiw1rL92N32SKtaUX54GXyUuwVt5kUU9KVJcad8a0YaSMtOpGm6ouuF3RK21Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aq3Ugf/L; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M8jes2Ew; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775556516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oPcG9Tk4uGB6LgSxC9DcNHhtfMDfGqAMPkqOmu5DgYI=;
	b=aq3Ugf/LxDshsl9xWJ1eY5oMtuCciGOZ5fTGPKkjLmUJGL53e5ukYgRiUxWl6WLSKCjAio
	LxS0xiYVcZCfbdzIjLDeeqiLtq7aVjs54BC8nVDbs9mYx1gxJv3sWeoVElyPeLpc48f9JL
	YyqpBLRIJOtM/TcKdo66Whe8ryZ6FPc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-TKjOYOrUNymTrPmQRWiFKA-1; Tue, 07 Apr 2026 06:08:35 -0400
X-MC-Unique: TKjOYOrUNymTrPmQRWiFKA-1
X-Mimecast-MFC-AGG-ID: TKjOYOrUNymTrPmQRWiFKA_1775556514
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-488c213b485so1309445e9.2
        for <linux-ppp@vger.kernel.org>; Tue, 07 Apr 2026 03:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775556514; x=1776161314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oPcG9Tk4uGB6LgSxC9DcNHhtfMDfGqAMPkqOmu5DgYI=;
        b=M8jes2EwdqliXQmR28jCAmpye8JSHnU94CDurVBZCR7cvRCZJGpUVyapC2DvX7pElK
         ydlbDHOPn+eX3SCc2fp06QogmDAML5q0IPsNLgEZYroAwsR0kTKc4ve7dsyL8XFJNlit
         5Z0FyeJ2fLX473lYmaMXc6K0K04hQ8CbKajqxowB9Z0QQIAShszM5/T/ZS6XmCPlyCJp
         fMElS+iRfsw5pkl7bZZIpO418/aDoOJQgKjWvmRk9RO9vvK52iKyLfxuKwRbNtEuYx3a
         DgsH2Q2GT2WkiHPCZsk/AuLrNzFMpf3YB6KwvShUuwGJm0PfM/OB3f9jv7I1vwvzbVXi
         R+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775556514; x=1776161314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPcG9Tk4uGB6LgSxC9DcNHhtfMDfGqAMPkqOmu5DgYI=;
        b=Fky5USuMHn3yuUWgrA9fMBBURqJrePZwYCtrHG3mG/XrNO8CQ+3IdohdZhZmLC+oC6
         lKYPDdyXEtTw3wBD17amsfU/GDugPR7373/caLivKR0DnXvvNtmMallAAOHQu/Pvxs0O
         ZBDE4JvQZGzi0btMQYm3WhQncYJpcY2BDSnryb779HP9Xnzc6tlayTAacJkgIelm7jz2
         5BPgfyVo2IgTLaV77v9MmvaAe5MSikxAjzFZQqBHk6hp6huSqp72Iah9VPMshgVcU+fw
         xdfHek1/A0bgUpuLAVcgwev18hOIYG5RJG5eldIA5bvBwvxGsUH11ihG6P7RaKlsE4xC
         F22g==
X-Forwarded-Encrypted: i=1; AJvYcCWI85gaPRmiNLiwNFJL3aeYRjH7XiQL0PEOmZKLmGBtA7eaCGE5DJ2RyAeXJyiPw1ZdXgLYIEU8Ut8=@vger.kernel.org
X-Gm-Message-State: AOJu0YygXwmq4OZ9YA5NrHqlmIgYqhZP09I6NLMKSe9f3GzkBXvgPhUQ
	0U7ruioALbdEaCMCoXHVcSUUKLihyPG3pXYm2bLw6g42rUi+sPMUXub+tgJCVhZEQrZztt967bi
	SseUFNlwqAzrTOMor66w/LD3SDmKP/352kTvpDo6Ko1bEXsEfn6N3GhQY5w9XlA==
X-Gm-Gg: AeBDieslgAiIR8UFTqDfOUewnTF4uXgwdGQGW6LJgRwrE+aQzYvXD0pBvVppliJuIbR
	T6Do3exyGpaLZOEv2kWRiGmGItZ/vH6PrtVHjDUyPnHAxn7C4J0z10ZuIlPiwNvpsV77+Up0xL3
	IZz94ti3+L2YpV5y2PKUzNxIdAHQKcYV76MOkhuWQQTUxTr8WB9XJajxh0Hyir+SlSJvQVfWf9P
	aboHd4+fDG3fBIuYh2OCFkGGp84z5n+MeYaElETCa09Dw0URE3FElX4stouS7ym6HOr8aIXcaas
	8BssLeAbyANcODHCsoqlw+gNcqOoOsbddnCKUbgYC2OtEwsJims7pIcjnG07n+h/dPohidMVNdd
	IWPFZa6iifms6C2s0T0330/qyyCzqZdSQ4KDlZDSlmbMEZgbYKcgVS4Wcew==
X-Received: by 2002:a05:600c:e40b:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-488997aafe8mr177853495e9.20.1775556513878;
        Tue, 07 Apr 2026 03:08:33 -0700 (PDT)
X-Received: by 2002:a05:600c:e40b:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-488997aafe8mr177853105e9.20.1775556513445;
        Tue, 07 Apr 2026 03:08:33 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e952b0bsm531203475e9.12.2026.04.07.03.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:08:32 -0700 (PDT)
Message-ID: <3ae4bb0b-6f4c-4477-9c67-f2122eedad8c@redhat.com>
Date: Tue, 7 Apr 2026 12:08:30 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8] selftests: net: add tests for PPP
To: Qingfang Deng <qingfang.deng@linux.dev>, linux-ppp@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Felix Maurer <fmaurer@redhat.com>, Petr Machata <petrm@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>, Dianne Skoll <dianne@skoll.ca>,
 Jaco Kroon <jaco@uls.co.za>, James Carlson <carlsonj@workingcode.com>,
 Andrew Lunn <andrew@lunn.ch>
References: <20260403034908.30017-1-qingfang.deng@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260403034908.30017-1-qingfang.deng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-493-lists,linux-ppp=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ppp_common.sh:url,pppoe.so:url]
X-Rspamd-Queue-Id: E19713AC8B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 5:48 AM, Qingfang Deng wrote:
> diff --git a/tools/testing/selftests/net/ppp/pppoe.sh b/tools/testing/selftests/net/ppp/pppoe.sh
> new file mode 100755
> index 000000000000..f67b51df7490
> --- /dev/null
> +++ b/tools/testing/selftests/net/ppp/pppoe.sh
> @@ -0,0 +1,65 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +source ppp_common.sh
> +
> +VETH_SERVER="veth-server"
> +VETH_CLIENT="veth-client"
> +PPPOE_LOG=$(mktemp /tmp/pppoe.XXXXXX)
> +
> +# shellcheck disable=SC2329
> +cleanup() {
> +	cleanup_all_ns
> +	[ -n "$SOCAT_PID" ] && kill_process "$SOCAT_PID"
> +	rm -f "$PPPOE_LOG"
> +}
> +
> +trap cleanup EXIT
> +
> +require_command pppoe-server
> +ppp_common_init
> +modprobe -q pppoe
> +
> +# Try to locate pppoe.so plugin
> +PPPOE_PLUGIN=$(find /usr/{lib,lib64,lib32}/pppd/ -name pppoe.so -type f -print -quit)

Minor nit: here stderr could be redirected to /dev/null, since the
command will likely emit at least an error message on most systems.

Could be a follow-up or added if/when you will expand the self-tests.

/P


