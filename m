Return-Path: <linux-ppp+bounces-289-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC5BA811A8
	for <lists+linux-ppp@lfdr.de>; Tue,  8 Apr 2025 18:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 042444E1623
	for <lists+linux-ppp@lfdr.de>; Tue,  8 Apr 2025 16:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D0C22E3E2;
	Tue,  8 Apr 2025 15:58:45 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9E21E1C1F;
	Tue,  8 Apr 2025 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127925; cv=none; b=htjORQf6VJfAgkoTIYE6U+fdDZ+E2GeLTHDGkULLgFPhEnRI7MWsmCZ8xBdYuuMTSIoS3P20a5CINSW/+sv9X4HTNdudr67tLDVWov1mqNmuEXUDwJqLoKPvaxwzghdnMzwtCpff704bAdBeEoUrRqS336OPwasHhTgH5E2IccU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127925; c=relaxed/simple;
	bh=AHvLh3VHhH+8s0BqalzzLWIJRhM0DmQZyfPUYf0ycCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hVNstmxSrRMkXQthLuXagu9ik3f5sxKPbhSoKEHO0t2yYuISfHl9GKwrDHImH8vVKDhGTI+UdH1vwLXVIV+vR4gEPYI1Rn3wVohdbAqVs8t73KKsNymPUqFxCUrBbnH+NMGp+63r7h67anNd7J1F40xEl+iciKq+ymUM6oDm4tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from [IPV6:2a01:e0a:3e8:c0d0:9059:1ccf:a15c:f330] (unknown [IPv6:2a01:e0a:3e8:c0d0:9059:1ccf:a15c:f330])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 36E84487F4;
	Tue,  8 Apr 2025 15:58:40 +0000 (UTC)
Authentication-Results: Plesk;
        spf=pass (sender IP is 2a01:e0a:3e8:c0d0:9059:1ccf:a15c:f330) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=[IPV6:2a01:e0a:3e8:c0d0:9059:1ccf:a15c:f330]
Received-SPF: pass (Plesk: connection is authenticated)
Message-ID: <ba2f508e-20b1-4b5a-b512-a85efcf9ad50@arnaud-lcm.com>
Date: Tue, 8 Apr 2025 17:58:39 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: ppp: Add bound checking for skb d on ppp_sync_txmung
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
References: 
 <20250407-bound-checking-ppp_txmung-v1-1-cfcd2efe39e3@arnaud-lcm.com>
 <20250408153352.GY395307@horms.kernel.org>
Content-Language: en-US
From: Arnaud Lecomte <contact@arnaud-lcm.com>
In-Reply-To: <20250408153352.GY395307@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174412792069.11363.17962374028464217077@Plesk>
X-PPP-Vhost: arnaud-lcm.com

Thanks for the review.

You're right, using a merge commit in the `Fixes:` tag was not relevant.
I'll send a v2 shortly with the fix as well as the removal of the skb 
check as it is already done before.

On 08/04/2025 17:33, Simon Horman wrote:
> On Mon, Apr 07, 2025 at 05:26:21PM +0200, Arnaud Lecomte wrote:
>> Ensure we have enough data in linear buffer from skb before accessing
>> initial bytes. This prevents potential out-of-bounds accesses
>> when processing short packets.
>>
>> When ppp_sync_txmung receives an incoming package with an empty
>> payload:
>> (remote) gef➤  p *(struct pppoe_hdr *) (skb->head + skb->network_header)
>> $18 = {
>> 	type = 0x1,
>> 	ver = 0x1,
>> 	code = 0x0,
>> 	sid = 0x2,
>>          length = 0x0,
>> 	tag = 0xffff8880371cdb96
>> }
>>
>> from the skb struct (trimmed)
>>        tail = 0x16,
>>        end = 0x140,
>>        head = 0xffff88803346f400 "4",
>>        data = 0xffff88803346f416 ":\377",
>>        truesize = 0x380,
>>        len = 0x0,
>>        data_len = 0x0,
>>        mac_len = 0xe,
>>        hdr_len = 0x0,
>>
>> it is not safe to access data[2].
>>
>> Reported-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=29fc8991b0ecb186cf40
>> Tested-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
>> Fixes: 9946eaf552b1 ("Merge tag 'hardening-v6.14-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux")
> It doesn't seem right to use a Merge commit in a fixes tag.
>
> Looking over the code, the access to data[2] seems to have existed since
> the beginning of git history, in which case I think we can use this:
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>
>> Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
>> ---
>>   drivers/net/ppp/ppp_synctty.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
>> index 644e99fc3623..520d895acc60 100644
>> --- a/drivers/net/ppp/ppp_synctty.c
>> +++ b/drivers/net/ppp/ppp_synctty.c
>> @@ -506,6 +506,11 @@ ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *skb)
>>   	unsigned char *data;
>>   	int islcp;
>>   
>> +	/* Ensure we can safely access protocol field and LCP code */
>> +	if (!skb || !pskb_may_pull(skb, 3)) {
> I doubt that skb can be NULL.
>
>> +		kfree_skb(skb);
>> +		return NULL;
>> +	}
>>   	data  = skb->data;
>>   	proto = get_unaligned_be16(data);
>>   
>>
>> ---
>> base-commit: 9946eaf552b194bb352c2945b54ff98c8193b3f1
>> change-id: 20250405-bound-checking-ppp_txmung-4807c854ed85
>>
>> Best regards,
>> -- 
>> Arnaud Lecomte <contact@arnaud-lcm.com>
>>
>>

