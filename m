Return-Path: <linux-ppp+bounces-290-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E32AA83EFA
	for <lists+linux-ppp@lfdr.de>; Thu, 10 Apr 2025 11:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 922B03B4E07
	for <lists+linux-ppp@lfdr.de>; Thu, 10 Apr 2025 09:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2632A267725;
	Thu, 10 Apr 2025 09:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Byc2DOiu"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038B8266B5D
	for <linux-ppp@vger.kernel.org>; Thu, 10 Apr 2025 09:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277467; cv=none; b=JOiHluCYgAZKJGlEej0Ie0VDpDpj56nhq/MBUDyZfwuHfh/DAwCBOqZSRAl3F4BERj2QGQI039+oOaguhSoMisH4C0M793wHb2OLXVuAyT7FtdguRSQl+KtvnkEShl7iXo5vEC30RQMRV80+aqwo0Go37svry7lLIhQmqdqux1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277467; c=relaxed/simple;
	bh=p8WnN1jop2bnv+TBKh5ZzVW7Loud1RsCr86Lhw1nSC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AA/3nFsiKSZce640v5j2LyWl4Aj5R4GKFAhA4vvgTIQSN6tMnRbXP7lKK5tEyCYI5gss592lfNtO7OFxzesMxW2TNkg6NlbIpoBGHraXQglgVxtgJP72OeYIK77YDFTrQgFCgOc4AFwAX0Bgk0KL4yDNMCElXkUOoRpm18Haxe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Byc2DOiu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744277462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVfmgRn9b+MKfQINqgY7O8gFSVgjcr0dyC/SYpb7QXA=;
	b=Byc2DOiuIxr7B13Vco52L1NfV4xSYlr3ZGmr+QZ0Agv6vYRssPP30qkOSYBYX4E4p0kkkN
	WnRcN6MPAL5tEZ5dQYrUIQiHvAu6QdoKf8zrEJMWTKv/Abe1G7vahN5cB94RYf4SqFTFlY
	RCVp0vmUZ58ziO//7685pV/AccIREbo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-wazFTnsQMJyDx_JAdZEDFg-1; Thu, 10 Apr 2025 05:31:01 -0400
X-MC-Unique: wazFTnsQMJyDx_JAdZEDFg-1
X-Mimecast-MFC-AGG-ID: wazFTnsQMJyDx_JAdZEDFg_1744277460
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912fe32b08so295759f8f.3
        for <linux-ppp@vger.kernel.org>; Thu, 10 Apr 2025 02:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277460; x=1744882260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mVfmgRn9b+MKfQINqgY7O8gFSVgjcr0dyC/SYpb7QXA=;
        b=w+LrkcYg71PRQ33NzBHs34vFEksQGFxn0MNB29Eunn+5QK9IDc8rH6nb5DepGGSc9a
         kgL7Q/sI5t3utjdhmtfNKvFbQY/qo6H4oBBGaYlz8ttlYr2mm4kM2bggwQMQa3DT+rmk
         c2IA2gazmvYQdg2WA6kIQqXCnnWRHb2IUNfkEx/l9X38a12koh7wRRCWaUNWp7+J29wu
         2uEgGAyil18Smhx0IwbhO5yC3qB9KHjFJVWXOYjrMnvY0kVmLqImhF/mJxwnVZ6BZ1fi
         i2usikVVXLMmOmKXSoJvbjRFFTjvwInEgHOh92bHIj+ymJw4PwSt+GAoQfJV1b+brWlC
         Sb7g==
X-Gm-Message-State: AOJu0YynQm+R8mpnugnSaUmz9dibLyT3DtRcFwd9qnDZ0YPS0l9uqkbj
	4/hmQ7bwkKrSh0GQdWVcu1RofQSWDQ5RxTYAMru3ssi4nXUIq9E9wOAr244sEl7rn5tb2F7hHwb
	A+aDXho1n5WlQfdYSKy+7xfzQ39IVCTVnZU312/lhyXjGCNrxdRxkz3ILvw==
X-Gm-Gg: ASbGncvM9Mg+bhDu09HyHB/CoaQ/G6v1OjyW7UZ/5hRPFxblmZQnPE7xw7BIt+Yfgwd
	PdsmBdMJidQWUYi2M9kj/DjFmTjxEdXl0Y3vV02WvZIHui97xQo3GxfDE/0iq6te8n3pcraJNQC
	+NGiHlDnSO4VvJ9T5CV5gmYbczpGNGWC7lmoXxmlLOexvDXk2SlGsY6kiyvUZBHvVwEmFB7DMEB
	WjkzceDoBjQtkWjL74HXDFa7I7vvOngLA+W/0B3umscsBxm/7CPpbF5+6noT0rqZPPtJbmNmKQs
	z8tsXH7ibROK+OxCyhN4gfbTRthXPwe50vsscS4=
X-Received: by 2002:a05:6000:4202:b0:391:487f:2828 with SMTP id ffacd0b85a97d-39d8f4657abmr1372762f8f.10.1744277460111;
        Thu, 10 Apr 2025 02:31:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsq3LGvvA3jJ5Ac8MsDzHgTZ2+T6jVK8OnBPioVOk7F1bhAo8k8hGKF874SxsPTxBYjyatKA==
X-Received: by 2002:a05:6000:4202:b0:391:487f:2828 with SMTP id ffacd0b85a97d-39d8f4657abmr1372740f8f.10.1744277459756;
        Thu, 10 Apr 2025 02:30:59 -0700 (PDT)
Received: from [192.168.88.253] (146-241-84-24.dyn.eolo.it. [146.241.84.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572c4esm45760155e9.26.2025.04.10.02.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 02:30:58 -0700 (PDT)
Message-ID: <09aeed01-405d-4eb7-9a12-297203f1edcc@redhat.com>
Date: Thu, 10 Apr 2025 11:30:56 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: ppp: Add bound checking for skb d on
 ppp_sync_txmung
To: Arnaud Lecomte <contact@arnaud-lcm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
References: <20250408-bound-checking-ppp_txmung-v2-1-94bb6e1b92d0@arnaud-lcm.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250408-bound-checking-ppp_txmung-v2-1-94bb6e1b92d0@arnaud-lcm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/8/25 5:55 PM, Arnaud Lecomte wrote:
> Ensure we have enough data in linear buffer from skb before accessing
> initial bytes. This prevents potential out-of-bounds accesses
> when processing short packets.
> 
> When ppp_sync_txmung receives an incoming package with an empty
> payload:
> (remote) gef➤  p *(struct pppoe_hdr *) (skb->head + skb->network_header)
> $18 = {
> 	type = 0x1,
> 	ver = 0x1,
> 	code = 0x0,
> 	sid = 0x2,
>         length = 0x0,
> 	tag = 0xffff8880371cdb96
> }
> 
> from the skb struct (trimmed)
>       tail = 0x16,
>       end = 0x140,
>       head = 0xffff88803346f400 "4",
>       data = 0xffff88803346f416 ":\377",
>       truesize = 0x380,
>       len = 0x0,
>       data_len = 0x0,
>       mac_len = 0xe,
>       hdr_len = 0x0,
> 
> it is not safe to access data[2].
> 
> Reported-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=29fc8991b0ecb186cf40
> Tested-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>

A couple of notes for future submission: you should have included the
target tree in the subj prefix (in this case: "[PATCH net v2]..."), and
there is a small typo in the subjected (skb d -> skb data). The patch
looks good I'm applying it.

Thanks,

Paolo


