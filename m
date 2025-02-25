Return-Path: <linux-ppp+bounces-258-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BE0A43516
	for <lists+linux-ppp@lfdr.de>; Tue, 25 Feb 2025 07:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8390E189B27C
	for <lists+linux-ppp@lfdr.de>; Tue, 25 Feb 2025 06:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB55256C7D;
	Tue, 25 Feb 2025 06:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzPr87bH"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66485182D9;
	Tue, 25 Feb 2025 06:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740464458; cv=none; b=fh1azbrfDBj/RDY3ltjhJqtCx3kqMmqp+5vO27pO6RX6NlvgnXZ39LJldZ5+332690XbQX7Fejbp4bUknjoUGlKnNDOipwqUQxMqGNKIK8djoLhSMtv0A6sYfJuv+7oaQL2e/E7fIzyvnvi0pje07F0NMVEe4UgrcOn75yfbZ24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740464458; c=relaxed/simple;
	bh=5OKb51izA80yh4zy5cydeniYSGVGNjdKJPweeJv8nx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pj9MB2eZ+ghH/7ccZMrmsnS4n87J9b3hD7phJMsq5kNzxOXhNFlCsz0pPA6smC7fvhQtoZVbR7VXPjckh+/essP66hidea+AI/J/cB0vMnCpkHzY+h3dFmphIBi4bvdhGPJLBoTZO/I9Cym335InuhbI2iYuo89QF1ElG6kVcTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzPr87bH; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22128b7d587so100474635ad.3;
        Mon, 24 Feb 2025 22:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740464456; x=1741069256; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ULxxZ3EpvZ0eV4eBI5zdwhpaLVGTbquNxWTjT5AEwZk=;
        b=dzPr87bHzaUpAXechKA+FE7MiM6Gu5ZHwPaxLfA1eCPSzpL+SwRDYZCS/FeYEi4CkJ
         Eyo0oCgs5g6gHgrSXsvXS8BqiBLqK8r6MsRP0+Jb56Jaa9j0c4+h+fpN5oAqV4pknd7R
         3dvTkn6F5ryZoi1bQ9P8YVJGc0JR/pHWXZWEDLKFtslH/azOhhePv5QgxbbXka534/85
         pSEbEW8QplSyKXP7xtRHy1qwBWQaFgiffBy4a6A8KAKQn6AaLpfQY7KL+uTv9cX/jvJa
         4gk1/q5QbvYSvfEuv3HtkntLDJxf6wPUZPfqvROMtpfE/QmcSsmsl9iyqBLAdJjLVdEJ
         KEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740464456; x=1741069256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ULxxZ3EpvZ0eV4eBI5zdwhpaLVGTbquNxWTjT5AEwZk=;
        b=xUUqlZjsWRKWQCAOPXU1j+v8XiMkXcja+VjxT1owWtUMnq7h0ywKQoEBHSI3hqGKQ/
         x1wW5e8EMlUvTcAzQM0dinesvzNs0zdYfEK6YnowdiptNy47ZO9r4MI1HONLvBz+bZOs
         CyuvgdO0RNHxXJyx/B2z7onfyGcBOUTf1TmOQ6ni9TN42NuIdO66WZa4rbm+khRmpslt
         aGvD35LxVXTPJlFhmiWew4aoFifpkivr3qas9tX/L5zTA7f2zkZZUy6DsnRaREPLWvlN
         /M0ORNo6UBTlwLdJyEGvK8oi78yist9C2SCXTmfAGNxxu/us4WSMyHrg/801jwidOqiB
         oTlg==
X-Forwarded-Encrypted: i=1; AJvYcCUUF8KhYu+98V2FrRHsR7oVPtubS6771n3u+C5Vf6tbvaNPiOmOnBw6WZhKi649RDcefCSjV2Ra@vger.kernel.org, AJvYcCVffPBoC3D7WKL8M7zwNpx2cYS4iPdCgBqKS+4+9oStKGCqlzeaR5fSihnhbeWssFkK0978T3jmA5CJ6+Y=@vger.kernel.org, AJvYcCWvgFo2hpBpnxxFsPOQIOLMws2XEqmSQaHNL5mI2SirUIMkEWvPcmNx5Dq6azUPRGAj5hWhOkJfolXb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz51kPPKP2yjvOgmSTcuITAiS0EiRareDkAo/hG1u3bk87zqgx4
	0DpCIZYRNTXxEPlBwacGVBJr1tx7zmXvjO0TK+nujkSKmj9rJg2p
X-Gm-Gg: ASbGncu3l++2gj1J5zCoHLIoRmYQ4kNy64OBk8jhUrANsGr8m8j/bGreNJ4Rr6bFP5w
	Eq8U/Ue/8jjQsqWGMbarr/Ow1NwIckI3x9cFsKBW3ir8CKUbh0xRXj7R4Lf0imrly/dsvYoIBSF
	TsxhBhoDjL7pOL2EliNdUOnQGzT2aR6B83t5gj5l2wulVzJ8WPpe4zcudVIuG2L8YEikigaVcS/
	tR4kQ8oZBj+rShQrA6oA1gfiDU5F1v8ideX8i92+y9MKMkFevaYpAFLw4Oy8db4L8FQlIGQ7rYY
	L4YaFOEi1XrLSefdKyleDG+L8RgFuTqmuvBT03ZhKinpHGa/gX+rZnwLMOS2BqSXSAhReFBAuRl
	kcrpbtQ==
X-Google-Smtp-Source: AGHT+IGZuSb5qFFIyeaeG2RR3Qcw8TbVF5PhtTliQgdhjGn7cRZjmzdvZC1t+L7d4J6FNqz8dddNrA==
X-Received: by 2002:a17:902:ce86:b0:21f:4c65:6290 with SMTP id d9443c01a7336-2219ff32f58mr258970425ad.1.1740464456487;
        Mon, 24 Feb 2025 22:20:56 -0800 (PST)
Received: from ?IPV6:2402:3a80:428b:35ff:dd92:c12f:8ec5:287b? ([2402:3a80:428b:35ff:dd92:c12f:8ec5:287b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0008b4sm6398785ad.31.2025.02.24.22.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 22:20:56 -0800 (PST)
Message-ID: <d22a1b92-294c-498c-8719-9776c48984ed@gmail.com>
Date: Tue, 25 Feb 2025 11:50:42 +0530
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ppp: Prevent out-of-bounds access in ppp_sync_txmunge
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, skhan@linuxfoundation.org,
 syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
References: <1e906059-83c7-4f29-a026-76cd73d8b6fa@gmail.com>
 <20250218185033.26399-1-kuniyu@amazon.com>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <20250218185033.26399-1-kuniyu@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/02/25 00:20, Kuniyuki Iwashima wrote:
> From: Purva Yeshi <purvayeshi550@gmail.com>
> Date: Tue, 18 Feb 2025 11:58:17 +0530
>> On 18/02/25 02:46, Kuniyuki Iwashima wrote:
>>> From: Purva Yeshi <purvayeshi550@gmail.com>
>>> Date: Sun, 16 Feb 2025 11:34:46 +0530
>>>> Fix an issue detected by syzbot with KMSAN:
>>>>
>>>> BUG: KMSAN: uninit-value in ppp_sync_txmunge
>>>> drivers/net/ppp/ppp_synctty.c:516 [inline]
>>>> BUG: KMSAN: uninit-value in ppp_sync_send+0x21c/0xb00
>>>> drivers/net/ppp/ppp_synctty.c:568
>>>>
>>>> Ensure sk_buff is valid and has at least 3 bytes before accessing its
>>>> data field in ppp_sync_txmunge(). Without this check, the function may
>>>> attempt to read uninitialized or invalid memory, leading to undefined
>>>> behavior.
>>>>
>>>> To address this, add a validation check at the beginning of the function
>>>> to safely handle cases where skb is NULL or too small. If either condition
>>>> is met, free the skb and return NULL to prevent processing an invalid
>>>> packet.
>>>>
>>>> Reported-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
>>>> Closes: https://syzkaller.appspot.com/bug?extid=29fc8991b0ecb186cf40
>>>> Tested-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
>>>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
>>>> ---
>>>>    drivers/net/ppp/ppp_synctty.c | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
>>>> index 644e99fc3..e537ea3d9 100644
>>>> --- a/drivers/net/ppp/ppp_synctty.c
>>>> +++ b/drivers/net/ppp/ppp_synctty.c
>>>> @@ -506,6 +506,12 @@ ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *skb)
>>>>    	unsigned char *data;
>>>>    	int islcp;
>>>>    
>>>> +	/* Ensure skb is not NULL and has at least 3 bytes */
>>>> +	if (!skb || skb->len < 3) {
>>>
>>> When is skb NULL ?
>>
>> skb pointer can be NULL in cases where memory allocation for the socket
>> buffer fails, or if an upstream function incorrectly passes a NULL
>> reference due to improper error handling.
> 
> Which caller passes NULL skb ?
> 
> If it's really possible, you'll see null-ptr-deref at
> 
>    data = skb->data;
> 
> below instead of KMSAN's uninit splat.

Understood. I’ll check where the skb pointer is receiving uninitialized 
data.

> 
> 
>>
>> Additionally, skb->len being less than 3 can occur if the received
>> packet is truncated or malformed, leading to out-of-bounds memory access
>> when attempting to read data[2].
>>
>>>
>>>
>>>> +		kfree_skb(skb);
>>>> +		return NULL;
>>>> +	}
>>>> +
>>>>    	data  = skb->data;
>>>>    	proto = get_unaligned_be16(data);
>>>>    
>>>> -- 
>>>> 2.34.1


