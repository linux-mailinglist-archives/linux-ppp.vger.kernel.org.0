Return-Path: <linux-ppp+bounces-111-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0949C1858
	for <lists+linux-ppp@lfdr.de>; Fri,  8 Nov 2024 09:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 911951F24403
	for <lists+linux-ppp@lfdr.de>; Fri,  8 Nov 2024 08:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDA91DFE26;
	Fri,  8 Nov 2024 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hAzQa9g7"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7D21DEFC2
	for <linux-ppp@vger.kernel.org>; Fri,  8 Nov 2024 08:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731055718; cv=none; b=gp7ZP9dXhJ42xqKcIYPH8X8FluswBU+wK63dDavD+qcIq1xXoLOftNyPw/iB1mRj2tDSJ2AiprircyVAsAmsjSbKJXxqIi1CKwcmAU958lnvk+mLb7V4BBhjcavmawlUtfu4rYeH9eKRybPtwG9y2O15iRmUASCn6fWQfWH8eL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731055718; c=relaxed/simple;
	bh=QUMslSd5+7vmPhBvFqJFbLH0QvtylNmBG3Rd0BiAc18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TC+0W2gpnCJgmy0p2/YZ8xHZ9PONOhdwZ/u4svQ5I0LnXEWw3lI4L9kZRC+K50xD/FFMjZEQxzbMd+LgRYwvflzz1ARi2LlVIj01lA8xO7FupdIGxso/jklRUrcuGRc4TAqKHFRG73gCIKjhBqcKMF01FQLjEDQ4wo2qEeLm1Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hAzQa9g7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731055715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uYHTkptT6ou5l6p02xIsQwxrcvbgxf99D1myY1C6iho=;
	b=hAzQa9g7wc3zuW+73/GqvjLVL4JG1D84K7gQlIKWa4KVeN6zEmbd6ucJBDnqT/WrtKvkIU
	TvLhAdk73r2KC1UHTIXDP2NTxizbuBCQT65GmcZyqjmG6w2/Qi07zYxu8nM5DwevTzDZYQ
	FD6z3S0wrpuUTldfUFZB/Mb6OtTV5Mk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-RUrYj9MJNrWxJhHqVohf4A-1; Fri, 08 Nov 2024 03:48:31 -0500
X-MC-Unique: RUrYj9MJNrWxJhHqVohf4A-1
X-Mimecast-MFC-AGG-ID: RUrYj9MJNrWxJhHqVohf4A
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37d4cf04bcfso935834f8f.2
        for <linux-ppp@vger.kernel.org>; Fri, 08 Nov 2024 00:48:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731055710; x=1731660510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYHTkptT6ou5l6p02xIsQwxrcvbgxf99D1myY1C6iho=;
        b=ZHzPWrwaNfeHpOnOL396nftycQejhEzxPbAlBgGs52gbNOpv0MnP3xdz2SDK3wjgEK
         2jVDMOTfnGBpsC5WjxN5PcklArmBrpG+WNXxPFc/zSMPbC5mpgieWsI4lcfM91gw+HKC
         SzhH28rPhxGsl0qtD4d2dlzzNeHVttAoWMyupvj6ElBiSTBntktcB62lQodv9nhiIJyG
         JtW9fCU1gvBdUK20PZX/wYivr1c97UM390XmcVDKvLc/JF67r7GAM6jh0al9K6V5dFJL
         uH2TdPMytTggI7sYSHtNkDNi4eHExS3hybCEPpW59ehmMKJjHt+NCKEmLd556gURXb/y
         DRgA==
X-Forwarded-Encrypted: i=1; AJvYcCVBJ/v9QaA06yHCpSirrwnqhhAut/VB+v9yKl/3jtNysC1Ydc25qXOX6sV3SfKR38ViP9Pom6gKNJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQexzt3rDT1cSrDk8UnqT746T4tH9Ep2DjjUFjLTYjT4wHlU8E
	sOE4uJU/LqG958z0a1BdTajdMVc0pDW66iY/1VT8ZIJv65kyxSpNFMvH80ynoYLOgzrlj31HGzc
	cz8XxzTwMI/mj8uQcRQkMYECWB07N/9e8NxBTbDuqcT4sKluGzr4xO8Or2A==
X-Received: by 2002:a05:6000:1548:b0:381:eb8a:7ddd with SMTP id ffacd0b85a97d-381f1866989mr1759289f8f.15.1731055710711;
        Fri, 08 Nov 2024 00:48:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIaAbzDhaCkwg/UVIfjicTfoiBdfShUzYxSOC6+qJlzAeZo1U91jzrukrCO0X0SBMgRzrjVg==
X-Received: by 2002:a05:6000:1548:b0:381:eb8a:7ddd with SMTP id ffacd0b85a97d-381f1866989mr1759271f8f.15.1731055710387;
        Fri, 08 Nov 2024 00:48:30 -0800 (PST)
Received: from [192.168.88.24] (146-241-44-112.dyn.eolo.it. [146.241.44.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9f8f0asm4046400f8f.79.2024.11.08.00.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 00:48:29 -0800 (PST)
Message-ID: <54bbccb2-6633-4638-9dce-14683b4e320b@redhat.com>
Date: Fri, 8 Nov 2024 09:48:28 +0100
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: ppp: remove ppp->closing check
To: Qingfang Deng <dqfext@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241104092434.2677-1-dqfext@gmail.com>
 <7e0df321-e297-4d32-aac5-a885de906ad5@redhat.com>
 <CALW65jaKn7HQth6oYYHWYvg7CTZJj2QH66nHyo41BNjAA15Y7g@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CALW65jaKn7HQth6oYYHWYvg7CTZJj2QH66nHyo41BNjAA15Y7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/8/24 07:09, Qingfang Deng wrote:
> On Thu, Nov 7, 2024 at 8:08 PM Paolo Abeni <pabeni@redhat.com> wrote:
>> On 11/4/24 10:24, Qingfang Deng wrote:
>>> ppp->closing was used to test if an interface is closing down. But upon
>>> .ndo_uninit() where ppp->closing is set to 1, dev_close() is already
>>> called to bring down an interface and a synchronize_net() guarantees
>>> that no pending TX/RX can take place, so the check is unnecessary.
>>> Remove the check.
>>
>> I'm unsure we can remote such check. The TX callback can be triggered
>> even from a write on the controlling file, and it looks like such file
>> will be untouched by uninit.
> 
> ppp_release (when the file is closed) calls unregister_netdevice, and
> no more writes can happen after that.

AFAICS the device can be deleted even without closing the file, via
netlink or deleting the namespace. In such cases, AFAICS, the file is
still alive.

In any case we need a more solid explanation describing why the change
is safe (and possibly a test-case deleting the device in different ways).

/P


