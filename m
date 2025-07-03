Return-Path: <linux-ppp+bounces-313-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F92AF6C26
	for <lists+linux-ppp@lfdr.de>; Thu,  3 Jul 2025 09:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DFA41C47E64
	for <lists+linux-ppp@lfdr.de>; Thu,  3 Jul 2025 07:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C64C2BF3DF;
	Thu,  3 Jul 2025 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gF9ILZ8D"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3D529B8C6
	for <linux-ppp@vger.kernel.org>; Thu,  3 Jul 2025 07:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529329; cv=none; b=ViRth5QmLIgow0GwZFK+T8ZcasENvHhR+Y5egqI7VSGaN7inS7MH5KlB5LlKYqavvoMxHu4PlT/JxmeHaQn+yfroQq+u7gWDKsrrbgGjaR0HC/cBRgKPnI0686AjeDcuGnb/3Dh8CQ45VJYyCK/jTjvq0P19teWTCBS8NxhUheA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529329; c=relaxed/simple;
	bh=4eQMR5Cxv3vb5mcNACtf57k9qc9ksHsIKZzfmokX3jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xv48X3OoT6rEr6OloNjLK85jDomtGaP4yjVeBjC57wE6CU3kOx6Z0ilody79o+pUWQTMFzLSmiYzApNsE79bOOUlKnAquGVMwjA36W/fenLX/ZiRPnfGJLVV0HfvdfaGuzEWwXRHW0AkEiei5Z8gQJBjMQphV0dYTtSgK46znlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gF9ILZ8D; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751529326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rHZg+urUsTPRagTEEFZ2q0TPLV/wheKvXpnortkonGg=;
	b=gF9ILZ8DK/EUpzvOSA3afD5uAWFNELL5Eq3ik5ey8u/EZubGhDccaSQOqIReJL/dI2JJ8K
	0upBDewg+TO5W7I9supjTHYZ3kVFLhyjYiWpfWV55GS2h6BCyex0OkmR2VJaVgcpyM+qhO
	aPe/IPQJMhHWD45O1QTk3X5NId0x1xw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-r3Gaic8FPl-PDNaecoPybg-1; Thu, 03 Jul 2025 03:55:25 -0400
X-MC-Unique: r3Gaic8FPl-PDNaecoPybg-1
X-Mimecast-MFC-AGG-ID: r3Gaic8FPl-PDNaecoPybg_1751529324
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4530ec2c87cso34179515e9.0
        for <linux-ppp@vger.kernel.org>; Thu, 03 Jul 2025 00:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751529324; x=1752134124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rHZg+urUsTPRagTEEFZ2q0TPLV/wheKvXpnortkonGg=;
        b=tHlCJPyd3ilWmXwUURgB5iGUWm2CXTPoQij46HUQEP0OPKmaMC7HCotXX+KdlnoprJ
         Zshx3pylCvfJO9yOqFhz9NEKS3MODml2JGNmEqtj62L2AGs62Bx2m0Pg9Jq6GD0V+Urk
         ide35D86ZpkuYF+zVHpTRf7WPzejImZAI1CU8y31a9SCl2dnMU1wai7c78qCAFR4FI3E
         r06ky+4/43Rz9P8lFu3Zszj9sYvR18JfUUbz/0BgohnEhZofJmU7gmhjA30GP4JHs7P6
         xNXeMIfmXqiAwbjXqEEK2A9CAS9a2GFmqDPETjZVBheTR6KsPrPI6n97BUPvxZ9SYYFi
         LZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNGvy+F9XiXPfA78Q+id1MI4HNGJIPEzepzuiAjYBrkcuD2xjYNKAR0l3jf/pVNVr56kY44J27pLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlENKqSJpNJIpOH4XuVhFVxus+JdhurUe0vj2THx3lB3zjcWel
	XU9ct2A4yP/zStr08ksgcTfol6QFp6ydxkKQnmvtCvl9EwzDTwwkk7pxZ6r3c0dOuQ0eVkqcq4J
	b7xLt0cA1HPJOxdX7JHX4S1Q/CxMclLhUzPn8MCJCrxnb34Pv2TyjjABs8OcA1Q==
X-Gm-Gg: ASbGncu/El/4Dl0117WEPoUefYJnVljcWey73oPYWWVgntBnmcDc/8Nr/9m3cfvMrkE
	uZsfwZNHDU5TG5bG5hcdNCVS8qibr8OoJ9O7/iFMmSqXNqfBCzZnNnzfPWEfo3zIjvOHuDOweLm
	eAOxzB0DSCYSw8Xre9zX0/NTggLh1usxo6zEIpYjC1o5Af2J0KCHi3tomclTVltHsw2s1XSChVt
	t7zAhikKy9ata8HM31DtfpzAT2ocp9l4X/55aSoxMaYZcaL5dItZW0goLobjl9Is42PphiIpmF3
	4CfT1yZLY8p58Cml0lQ7Na1hQheWVLPRCEo69T3u0crwPH05fEg8tguEXKdfLAeMRVI=
X-Received: by 2002:a05:600c:8208:b0:453:b44:eb69 with SMTP id 5b1f17b1804b1-454a9c7bb55mr26672225e9.13.1751529323693;
        Thu, 03 Jul 2025 00:55:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiHFj1UwVxSDWdgovCLzh2YT1kL2uHoVeghrzdOqaM06vcAM7xPfEjdU057FfSSf2GyYXOsA==
X-Received: by 2002:a05:600c:8208:b0:453:b44:eb69 with SMTP id 5b1f17b1804b1-454a9c7bb55mr26671865e9.13.1751529323186;
        Thu, 03 Jul 2025 00:55:23 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314? ([2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa54dsm17665107f8f.23.2025.07.03.00.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 00:55:22 -0700 (PDT)
Message-ID: <9bffa021-2f33-4246-a8d4-cce0affe9efe@redhat.com>
Date: Thu, 3 Jul 2025 09:55:21 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] ppp: Replace per-CPU recursion counter with
 lock-owner field
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Cc: "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Clark Williams <clrkwllms@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Gao Feng <gfree.wind@vip.163.com>, Guillaume Nault <g.nault@alphalink.fr>
References: <20250627105013.Qtv54bEk@linutronix.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250627105013.Qtv54bEk@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/27/25 12:50 PM, Sebastian Andrzej Siewior wrote:
> The per-CPU variable ppp::xmit_recursion is protecting against recursion
> due to wrong configuration of the ppp channels. The per-CPU variable
> relies on disabled BH for its locking. Without per-CPU locking in
> local_bh_disable() on PREEMPT_RT this data structure requires explicit
> locking.
> 
> The ppp::xmit_recursion is used as a per-CPU boolean. The counter is
> checked early in the send routing and the transmit path is only entered
> if the counter is zero. Then the counter is incremented to avoid
> recursion. It used to detect recursion on channel::downl and
> ppp::wlock.
> 
> Replace the per-CPU ppp:xmit_recursion counter with an explicit owner
> field for both structs.
> pch_downl_lock() is helper to check for recursion on channel::downl and
> either assign the owner field if there is no recursion.
> __ppp_channel_push() is moved into ppp_channel_push() and gets the
> recursion check unconditionally because it is based on the lock now.
> The recursion check in ppp_xmit_process() is based on ppp::wlock which
> is acquired by ppp_xmit_lock(). The locking is moved from
> __ppp_xmit_process() into ppp_xmit_lock() to check the owner, lock and
> then assign the owner in one spot.
> The local_bh_disable() in ppp_xmit_lock() can be removed because
> ppp_xmit_lock() disables BH as part of the locking.
> 
> Cc: Gao Feng <gfree.wind@vip.163.com>
> Cc: Guillaume Nault <g.nault@alphalink.fr>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Is there any special reason to not use local_lock here? I find this
patch quite hard to read and follow, as opposed to the local_lock usage
pattern. Also the fact that the code change does not affect RT enabled
build only is IMHO a negative thing.

/P


