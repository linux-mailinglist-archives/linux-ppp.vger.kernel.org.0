Return-Path: <linux-ppp+bounces-315-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA62AFC594
	for <lists+linux-ppp@lfdr.de>; Tue,  8 Jul 2025 10:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC7963A781A
	for <lists+linux-ppp@lfdr.de>; Tue,  8 Jul 2025 08:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448ED2BE029;
	Tue,  8 Jul 2025 08:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IS6YB+4U"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE692BE020
	for <linux-ppp@vger.kernel.org>; Tue,  8 Jul 2025 08:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963318; cv=none; b=H3iKkda3jk3yA23Rv2tFiMO1BMZM7D7YZFJsGp5uiGuYgOqiyTm2QyiUDSoO5iiBHHgF+LPJdAnkpJT4As1ifkrthrm3F0YtMme8T6xYo3l4j5LlSbrEEJ60hXiiRSN+Vr0SuYVzr3lFbtGnSz4JrrY05LH/LMnFHi0ME6e+yAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963318; c=relaxed/simple;
	bh=aTVqbBJCrpdA/23ncYm6csiwV9ujBFQ/Zovn7BQNI0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTx1nkA3PVkgxIrmdfvOTtI1fbmLUfs5xSUxuvtJaFg5GHxpzodAPU8qTJfSjAeZRqWk8EvUtEAuL6AwgKy2kLF4+6hoMsB4m3S8cT5t9BSkzpH4x5+TIcFFUA3ZcjFSdzsHJ/xGNfySMJgyf2BXRzJhsx5XygHsVONIg44gFxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IS6YB+4U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751963315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TxPFV3tFLky59XA4g/lfynYxXJjgy/YJX1OKkvxJ+rI=;
	b=IS6YB+4UpoMq7RoZMgTNfKe/Uy4JyhJduCcP/nGeS71v1PSn3LIB9czQ/yg5oLBFAazN0b
	XdExzQzJCz9QRfAamlXcDOna+SgAmMJSL0HCd59Sr/KgdU1jXWQUAZhk72FZKVRr//GaB6
	ZeojFFPMewjfuqRU8eSiSNtGT8pcIMo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-hHbvVSLePiCNeawWybL9AA-1; Tue, 08 Jul 2025 04:28:34 -0400
X-MC-Unique: hHbvVSLePiCNeawWybL9AA-1
X-Mimecast-MFC-AGG-ID: hHbvVSLePiCNeawWybL9AA_1751963313
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4530ec2c87cso29746675e9.0
        for <linux-ppp@vger.kernel.org>; Tue, 08 Jul 2025 01:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963313; x=1752568113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TxPFV3tFLky59XA4g/lfynYxXJjgy/YJX1OKkvxJ+rI=;
        b=DhZwl2Ti0PsMcnN/cfmFDhD9u+NGU5MshzX3vErwjGQnqM051XMttGHkLnllAwir8T
         QJIUfnxHjMS/blFvQ62+0tDuRA2Abi18CVR8U4HPn+/V4nOeCax8aVJqFQBjLRCIHPDs
         qemnYJe2RZtKPhihFnOlHUFt+7Rj1GKSnDrxh0Y1gFxT/q6jacHwFs47SC14Yo3gfCbI
         HAKbDcqiOk/Q/Y4yc3PK+PBnRm4fgalNaqDRh/DHCWbp/Ip1LdPz/UehsNAU9xzoSbh9
         Hv6nyxi8ds1OCSvwBbhXZdOV0xMM2ne2DT3SRMoenjhDRVOzLX1Y3gbZzBxfX0XtVHdS
         AvmA==
X-Gm-Message-State: AOJu0Yy/RgsQUyNEUlZxT/a74q9chDmvPINMp5tUbsoTDEYGHh68O97F
	jE19hp1qk5rz3InBLSgOu9WHm41Yf9eNt2QXTNPhzYzn1i2ArWJIdx6GbTeIHd5tWBbTn1abMtl
	4FS5MrPDLkZ5jh+UGyW6Hkm5hcOBWG4OduwdyGF7n/F+dsuUxcX36Lh8vxODWRA==
X-Gm-Gg: ASbGncvvguRNgoGfLYXZgW6bVw/RdGBCEZQSEFPIQKOpthnO0Bx0tW9bsYDsSforst9
	onYIUGdKPGDCfr7mz+jB70LT8GRsmsSzd2S4kV/KoI6KB1N2UC6B8/vKKjaeNlrT/uqCUvyGP4j
	wOTwuMEbpLwCmKLrmBG0TZ/Vv9OrXa9DCud+uNXTt4huNll7dTDeic9UROzfExSkI+iY4nYvV/j
	0gXx+sks5plPZds+oP/0OhAdyvvsDV2xUxm+oFiCsC1FAcAVep3RXzyWiOVFwKo5cbLe/OwyNCk
	/cukImYVPaP+CDE6w3E6/Gxm62dmKHU9vAhzN2XgUFnh+3AnST/IlpUVHRDOMe6vg6Osbw==
X-Received: by 2002:a05:600c:a087:b0:454:ab1a:8c39 with SMTP id 5b1f17b1804b1-454b310d890mr135455845e9.26.1751963312714;
        Tue, 08 Jul 2025 01:28:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKeZmp4gshJPfdVZLft+U6QKBU434mwlK26v/9HLXxDoFpa/+j0LPJFeFl/k2mvKbg4sYKig==
X-Received: by 2002:a05:600c:a087:b0:454:ab1a:8c39 with SMTP id 5b1f17b1804b1-454b310d890mr135455575e9.26.1751963312271;
        Tue, 08 Jul 2025 01:28:32 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2717:8910:b663:3b86:247e:dba2? ([2a0d:3344:2717:8910:b663:3b86:247e:dba2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285c90esm12502048f8f.91.2025.07.08.01.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 01:28:31 -0700 (PDT)
Message-ID: <1eb149e6-68e7-4932-8090-34ee568c5832@redhat.com>
Date: Tue, 8 Jul 2025 10:28:24 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] ppp: Replace per-CPU recursion counter with
 lock-owner field
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Clark Williams <clrkwllms@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Gao Feng <gfree.wind@vip.163.com>, Guillaume Nault <g.nault@alphalink.fr>
References: <20250627105013.Qtv54bEk@linutronix.de>
 <9bffa021-2f33-4246-a8d4-cce0affe9efe@redhat.com>
 <20250704154806.twigjkbU@linutronix.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250704154806.twigjkbU@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I'm sorry for the latency, OoO here in between.

On 7/4/25 5:48 PM, Sebastian Andrzej Siewior wrote:
> On 2025-07-03 09:55:21 [+0200], Paolo Abeni wrote:
>> Is there any special reason to not use local_lock here? I find this
>> patch quite hard to read and follow, as opposed to the local_lock usage
>> pattern. Also the fact that the code change does not affect RT enabled
>> build only is IMHO a negative thing.
> 
> Adding a local_lock_t to "protect" the counter isn't that simple. I
> still have to check for the owner of the lock before the lock is
> acquired to avoid recursion on that local_lock_t. I need to acquire the
> lock before checking the counter because another task might have
> incremented the counter (so acquiring the lock would not deadlock). This
> is similar to the recursion detection in openvswitch. That means I would
> need to add the local_lock_t and an owner field next to the recursion
> counter.

IMHO using a similar approach to something already implemented is a
plus, and the OVS code did not look that scaring. Also it had the IMHO
significant advantage of keeping the changes constrained to the RT build.

> I've been looking at the counter and how it is used and it did not look
> right. The recursion, it should detect, was described in commit
> 55454a565836e ("ppp: avoid dealock on recursive xmit"). There are two
> locks that can be acquired due to recursion and that one counter is
> supposed to catch both cases based on current code flow.
> 
> It is also not obvious why ppp_channel_push() makes the difference
> depending on pch->ppp while ->start_xmit callback is invoked based on
> pch->chan.
> It looked more natural to avoid the per-CPU usage and detect the
> recursion based on the lock that might be acquired recursively. I hope
> this makes it easier to understand what is going on here.

Actually I'm a bit lost. According to 55454a565836e a single recursion
check in ppp_xmit_process() should be enough, and I think that keeping
the complexity constraint there be better.

> While looking through the code I wasn't sure if
> ppp_channel_bridge_input() requires the same kind of check for recursion
> but adding it based on the lock, that is about to be acquired, would be
> easier.

(still lost in PPP, but) The xmit -> input path transition should have
already break the recursion (via the backlog). Recursion check in tx
should be sufficient.

All in all I think it would be safer the local lock based approach.

Thanks,

Paolo


