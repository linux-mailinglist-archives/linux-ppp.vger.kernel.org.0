Return-Path: <linux-ppp+bounces-219-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 035CAA39367
	for <lists+linux-ppp@lfdr.de>; Tue, 18 Feb 2025 07:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 781217A3746
	for <lists+linux-ppp@lfdr.de>; Tue, 18 Feb 2025 06:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991101B21B4;
	Tue, 18 Feb 2025 06:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbRIvs8j"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118312753FC;
	Tue, 18 Feb 2025 06:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739860108; cv=none; b=bLg5crgJAeUgIVCqyCrljBir+ctfU7EXE9UUyk0UTVTvP0k8sXnwO3IKQNFE3hYg6iHP06qFaAiDL5egNmLRslK7knyQHItZg1g+n5fmi/woIg23GWEzppfCBcr1SqqQFKTdAFbn4Xs09EZMRCj2g8/RAJtU89hKu8hYa0gnB5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739860108; c=relaxed/simple;
	bh=F5ALLOTfKIxoDQV+9LdTOQzbK7uCmA5Ab9iOvBFq850=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXxUx/q/0cvrfSiwz4zlAQsCZ/SNiPbZOjR8jV2snmcrR/yjIF0ZrK5JCz4+Ea0kEhX9bHxjTgqQV+Y/UZaiyAGsUF/gt5XOoFJ9EnDl5MTQKBTJ3XMJZGahNpICzL1uspIntS9SDBeU+CfXd52FmJHnDIy3Asttrw9NBnooKxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbRIvs8j; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21c2f1b610dso128632225ad.0;
        Mon, 17 Feb 2025 22:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739860106; x=1740464906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LBVDLhN7n+iaRHCqHeBO+4D2+36F3hyQBNFUiOgSErE=;
        b=AbRIvs8jvy7Hr5eTnE2nX5FgszEGA7eVvY112yZ2Xq9FrhulqRLt6Ln2s4Ieubtm2b
         72sTuANrNDT/bvolZmf02h+XlS3/uVtY4Nt2L/MozUUdK43BQOZuI+2pBCS3JX5G009q
         pwa+f9nv2z/ABWSlbdF1bRBvieaoY3y3cjSLWb2vU46WLj+uk5eMUe0n5DsTY8lIo03M
         Q75SZq8N05Op0Z0I9drO39w0FIUXlc/FDSgSmQa9flYs5dqYIbNkJxqeP9whEZs0xV13
         3KDp/+5vnMww7DRXAuANODk0/34VkFr3U9bIs8kgWicD9TdvadjiwhNsFJlriAmVcggR
         Nhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739860106; x=1740464906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LBVDLhN7n+iaRHCqHeBO+4D2+36F3hyQBNFUiOgSErE=;
        b=saSpZTHBVazSxpFezKiW+4C3vt7TGpLYhJDtjehv6t63zzSzDu+aZynyXflu2hv39r
         W4FiYFzk2xXs8oPsUikoPLvziuCQ1P9DnFLrtYt2yNcGgHtQGEfu6/hIKcfcvA5x5xeO
         HxucjFmFJz1b21/jbdoLqmHE89zBW+JbJ2+E2GOqv5AaUIsWk7CLxn3eWfrgJg/1eTdF
         eC3Raz60O1xZGU5/uR0cvNHw3casBW9axAni9GZp/y0JLtMfYAvtuNApOpsH8qNoObXV
         pSfXG2P6Hz+b/6JaqdPGoCv41/zH6HLkFwcDoy1CRu3LgYOetjBpMk7edyzh4W04GNJI
         s7gw==
X-Forwarded-Encrypted: i=1; AJvYcCVQpeiEYbTva0s10enT/cuj13QbN1w3eImDAnpB1qSCekhdtaEE+KeHNMS6wMxQvBsTLsurbGwCO3YYiy8=@vger.kernel.org, AJvYcCVp3HLDYUe9BHYeNiX4Gx96YRMK9VMa31P5b4yMdHYTqvmOZTB1ESz7zJiBMl+Ma0En2Y7Abl91jItR@vger.kernel.org, AJvYcCW/VBLrGAy4orU13cofrHFbO8b0pIaKwcwAd3RAAudrT9dByudxKEQ8qB6CiwDiZbMtxaKW/Pnu@vger.kernel.org
X-Gm-Message-State: AOJu0YzgqZw4ylzmB/25XAi4sa76fI9fYFfTnLImOjMlUBDNgpjHBFqo
	FZm7ZxqKQc7FCy/niAAOh/lF2gwSd9IE+MMB8SxZ3/gXzB7clqgi
X-Gm-Gg: ASbGncsqSPhK2VtRdN5db/hcL6qAfY8uOaBMm5n96cmi0pxx+i8IcPy4J7k2vriSE4D
	uKnuhW81tFy2s3Y4BboWqpjBf2q/MOWjUSeYIA2kgiFxi2OqaWjfEd6dtHNPzauhEUqi6uo5Yz0
	KGYbr+Awu4VSg0ucETn6R33PFvQcg0tr5TY+WzU0qxw+u5n7M8fft4WGU20MKm5U00a+GZ6FWmU
	TJ9mUH1XQoNURu5QIhf9Uf0Y6nm7ojcrobDK31Usb8iJnNRgPiYAfaTVMVUXrQC2F0rw/kqjV/u
	NCBB7l4/CqSwxRoP16ykGDSOAk4rmuH1j8T77G3f6MTtCR2X36YLnhcIKx5fP8U6
X-Google-Smtp-Source: AGHT+IFRvyHARKf1rL2r38OwkJzVYT1Ya60dDr5mJ/jPVVRv1O68E199AkkCqFWkSrQFnwNupWLjWA==
X-Received: by 2002:a05:6a20:2444:b0:1ee:8bf0:312c with SMTP id adf61e73a8af0-1ee8cc162f4mr23225514637.34.1739860106155;
        Mon, 17 Feb 2025 22:28:26 -0800 (PST)
Received: from ?IPV6:2409:40c0:1b:6181:5a46:2d42:e8d9:2af2? ([2409:40c0:1b:6181:5a46:2d42:e8d9:2af2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm9315416b3a.24.2025.02.17.22.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 22:28:25 -0800 (PST)
Message-ID: <1e906059-83c7-4f29-a026-76cd73d8b6fa@gmail.com>
Date: Tue, 18 Feb 2025 11:58:17 +0530
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
References: <20250216060446.9320-1-purvayeshi550@gmail.com>
 <20250217211609.60862-1-kuniyu@amazon.com>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <20250217211609.60862-1-kuniyu@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/02/25 02:46, Kuniyuki Iwashima wrote:
> From: Purva Yeshi <purvayeshi550@gmail.com>
> Date: Sun, 16 Feb 2025 11:34:46 +0530
>> Fix an issue detected by syzbot with KMSAN:
>>
>> BUG: KMSAN: uninit-value in ppp_sync_txmunge
>> drivers/net/ppp/ppp_synctty.c:516 [inline]
>> BUG: KMSAN: uninit-value in ppp_sync_send+0x21c/0xb00
>> drivers/net/ppp/ppp_synctty.c:568
>>
>> Ensure sk_buff is valid and has at least 3 bytes before accessing its
>> data field in ppp_sync_txmunge(). Without this check, the function may
>> attempt to read uninitialized or invalid memory, leading to undefined
>> behavior.
>>
>> To address this, add a validation check at the beginning of the function
>> to safely handle cases where skb is NULL or too small. If either condition
>> is met, free the skb and return NULL to prevent processing an invalid
>> packet.
>>
>> Reported-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=29fc8991b0ecb186cf40
>> Tested-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
>> ---
>>   drivers/net/ppp/ppp_synctty.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
>> index 644e99fc3..e537ea3d9 100644
>> --- a/drivers/net/ppp/ppp_synctty.c
>> +++ b/drivers/net/ppp/ppp_synctty.c
>> @@ -506,6 +506,12 @@ ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *skb)
>>   	unsigned char *data;
>>   	int islcp;
>>   
>> +	/* Ensure skb is not NULL and has at least 3 bytes */
>> +	if (!skb || skb->len < 3) {
> 
> When is skb NULL ?

skb pointer can be NULL in cases where memory allocation for the socket 
buffer fails, or if an upstream function incorrectly passes a NULL 
reference due to improper error handling.

Additionally, skb->len being less than 3 can occur if the received 
packet is truncated or malformed, leading to out-of-bounds memory access 
when attempting to read data[2].

> 
> 
>> +		kfree_skb(skb);
>> +		return NULL;
>> +	}
>> +
>>   	data  = skb->data;
>>   	proto = get_unaligned_be16(data);
>>   
>> -- 
>> 2.34.1


