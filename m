Return-Path: <linux-ppp+bounces-326-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5E7B08E6F
	for <lists+linux-ppp@lfdr.de>; Thu, 17 Jul 2025 15:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF734560484
	for <lists+linux-ppp@lfdr.de>; Thu, 17 Jul 2025 13:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5A02E54A8;
	Thu, 17 Jul 2025 13:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TozdKuzr"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC152D8799
	for <linux-ppp@vger.kernel.org>; Thu, 17 Jul 2025 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752759619; cv=none; b=XNCetqpdnCw/5wojWTHWhjSF8hdqxgtZukmLoZT8Rf8gdDrXTEr/RmsQtTZRLY0vclAG0LE1vFugpYm0L0jb0ONQEqwUyGFAQIU8B0h2vGJO7l2n41A4lEHOAPO8JtSHipJ857c/OAzDxj0zz2Y968RKP4dkTEKJ1W4NFIakY3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752759619; c=relaxed/simple;
	bh=LuQfGUg7QimTZtMM6kIrGixSsVqH0rbo3bsIbi5btEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U2KT1/+tU0jU4EjWvgQ1UnuGdH3yVhPZj8xdxAUh0emOKTIpR2sP0i0N7P5JAWIxxzoluw8NP3cvwlzpOdcZFrUPF0zvQDfEM7fmNgjxEvELx7dqZi1pYrL0hZkMCz6l/k9RAivScunnftfuidbR2lWJ+ewcNOVCyj9EgQLZJrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TozdKuzr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752759616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bGPfxbk6jNUxyPOfM4/Z2ZLLJNVNzX1A59T5q3qLXtU=;
	b=TozdKuzr9KGTIK5OOZmt1ZDS/tbVEIsgXsZLnjwOYlElWRreNT8FoXPFyCyFB8wBq4hAmV
	JCVFOgnXFYdryi8WcdiQKaUsz4cRxBA0ZIThpz2SHswcjqTZZaCpvRSM02FrJOifGIyndU
	jIxQRga87AN4F7pWvzwxfMCnU+CI/Ls=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-6tX_sWnyO2eAww-NcIoTsg-1; Thu, 17 Jul 2025 09:40:13 -0400
X-MC-Unique: 6tX_sWnyO2eAww-NcIoTsg-1
X-Mimecast-MFC-AGG-ID: 6tX_sWnyO2eAww-NcIoTsg_1752759612
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b5f97cb8fbso471174f8f.3
        for <linux-ppp@vger.kernel.org>; Thu, 17 Jul 2025 06:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752759612; x=1753364412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bGPfxbk6jNUxyPOfM4/Z2ZLLJNVNzX1A59T5q3qLXtU=;
        b=szcYBI9U3Y+F0LvnxEjx79eYtwYI6naVPkNdXzE/eXvnQlQIRV3MnkTcqO/WTqmeEx
         WacU6EMGgYHI7ZbZVVOmAdTrLCLAfK5/uJ+sgOpidDx9egotzNBa8bYTQHTAHajpxxcw
         dDXBZWfBmAKk/fQJ5aNH1oiPYh1hwgJ9tUpN6OXQB9/UOSRG6PGbKhNdR68cQMWXWmCC
         8kuvdvbR4eamFpz7ojFg5chuKpIaTECKXtCxhJ2QexpdSyEuF4mC+60ApytbMeHAB+A2
         nq4xjxTLuC0pfz+eUvt4e7mGI90Js5CASc2tlHdZfqlSwuDE7Cqu4IvUQF3RHx3IMxpM
         BDqw==
X-Forwarded-Encrypted: i=1; AJvYcCWIRFSgIZVWeebyMblKeQKM+lDqszfi4Z6N8nCT+cmrYg69iCLvtlMQ3GP1Q+GreUoMdaR6C3nuqG8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1KpMXrL1R9G/Z8UKj8nxugORP/bjH+7FM9EZ9ZjJwwfUbu7Oi
	wt84ieViXUpjTIcMSaTKlDqZXF/dqxuzbdtGJU0c67h286XVFwKfc5FhEX72UZNF6QeeQN3vStR
	36cqGajkkBfgMSTyTRvfcu6WetQiE2kgh8XDafFzGfCo2upSpjVAPFHGrCPi35w==
X-Gm-Gg: ASbGnctLCfs7PDT9QQN+Vyu3LiJkgdezs2Djmp9+pdKdiEWG0skMCI3Miy9PVkR+8O/
	qc/F5iKBrBw6TQcdrcqodxSHvwy6EoJNtyxnbjnPzb8nkshnAZdD50/Ce8j/YtUFBsQJJtpctFp
	qQpbZVhZkMbc9OyNdEgi11WfWUMT7AdLIyFeI3k/OyK26RyPycVfrjEWAHl8/WX4hk8ZiMHQZDD
	K+VM3qGeX2s/y62iHf8WmmvNn5wKHKeriHYGMEP1tbm0wG+lZxaxquciDN+YkDcrJ8Qs+YxG3KC
	TRAlSbbsCMNcit4aRPpVUjwr4urav6q3MYEHKUmHIfVSS5gDR39gXN55wz3tU9q7aFCjdykTJKV
	rYBex/gFuw10=
X-Received: by 2002:a05:6000:2002:b0:3a3:ec58:ebf2 with SMTP id ffacd0b85a97d-3b60e4c4915mr3929314f8f.7.1752759612444;
        Thu, 17 Jul 2025 06:40:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAIardHgYCQYeh4W/Z6kkN3By8E1k+FByZrilW0zMomhGnQ/6ioH/KXKgCzHgSbmluM/sr9w==
X-Received: by 2002:a05:6000:2002:b0:3a3:ec58:ebf2 with SMTP id ffacd0b85a97d-3b60e4c4915mr3929281f8f.7.1752759611988;
        Thu, 17 Jul 2025 06:40:11 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5f16a6016sm18837512f8f.69.2025.07.17.06.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 06:40:11 -0700 (PDT)
Message-ID: <68a3115b-8ae6-47bc-aaf5-b38e4f83c5f9@redhat.com>
Date: Thu, 17 Jul 2025 15:40:10 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/1] ppp: Replace per-CPU recursion counter
 with lock-owner field
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 netdev@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 linux-ppp@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Clark Williams <clrkwllms@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, Guillaume Nault <gnault@redhat.com>
References: <20250715150806.700536-1-bigeasy@linutronix.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250715150806.700536-1-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/15/25 5:08 PM, Sebastian Andrzej Siewior wrote:
> This is another approach to avoid relying on local_bh_disable() for
> locking of per-CPU in ppp.
> 
> I redid it with the per-CPU lock and local_lock_nested_bh() as discussed
> in v1. The xmit_recursion counter has been removed since it served the
> same purpose as the owner field. Both were updated and checked.
> 
> The xmit_recursion looks like a counter in ppp_channel_push() but at
> this point, the counter should always be 0 so it always serves as a
> boolean. Therefore I removed it.
> 
> I do admit that this looks easier to review.

Thanks for reworking the change. I do agree with the above ;)

FTR no need to add a cover letter to a single patch series.

(but, since the matter at hand is IMHO non trivial, in this specific
case I'll preserve the cover letter)

/P


