Return-Path: <linux-ppp+bounces-292-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2C7A842E2
	for <lists+linux-ppp@lfdr.de>; Thu, 10 Apr 2025 14:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EA3D8C045C
	for <lists+linux-ppp@lfdr.de>; Thu, 10 Apr 2025 12:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79700283CB8;
	Thu, 10 Apr 2025 12:19:40 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7AF2836A2;
	Thu, 10 Apr 2025 12:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744287580; cv=none; b=kPSnytZMqoVvuVZ683eff5/bJYyO8T2Gh/ByMwn499gmoN8+pH7n7fi4Ldo3W9cZtFFFoxY4vwg8rluzguS5ovrBPcFEkQgeSEYSNHXJ8Ib2zcmJhhqd+8n55kG4q969aUi247HC3qF+0zdG5veCJDQf56IDyjCdABpAPM6UdoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744287580; c=relaxed/simple;
	bh=+bkcC9ICduzN8N8QJYZdisyD3IQ13VyfzY/5VkBa+6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Na1oZEUghK8dpTCfdfAqLsPNOz368wnP6KDOMRD9D5/8EKObVqmx81GhrfbCBBvPO274nzLARViSXCa3nUe/R+Out8F55kmHHXd5DuLn/fPqwkUZf31nmELqJSGJQ2vEr4CHu/a3C7YQOf/O7r/GSESfxd4aVnX8FxIsQmz4vD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from [IPV6:2a01:e0a:3e8:c0d0:e821:d300:7d96:6ab2] (unknown [IPv6:2a01:e0a:3e8:c0d0:e821:d300:7d96:6ab2])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 6775B325F8B;
	Thu, 10 Apr 2025 12:19:29 +0000 (UTC)
Authentication-Results: Plesk;
        spf=pass (sender IP is 2a01:e0a:3e8:c0d0:e821:d300:7d96:6ab2) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=[IPV6:2a01:e0a:3e8:c0d0:e821:d300:7d96:6ab2]
Received-SPF: pass (Plesk: connection is authenticated)
Message-ID: <05ee21e6-ff5a-4ee2-a918-f4d7d0cf686c@arnaud-lcm.com>
Date: Thu, 10 Apr 2025 14:19:27 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: ppp: Add bound checking for skb d on
 ppp_sync_txmung
To: Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
References: 
 <20250408-bound-checking-ppp_txmung-v2-1-94bb6e1b92d0@arnaud-lcm.com>
 <09aeed01-405d-4eb7-9a12-297203f1edcc@redhat.com>
Content-Language: en-US
From: Arnaud Lecomte <contact@arnaud-lcm.com>
In-Reply-To: <09aeed01-405d-4eb7-9a12-297203f1edcc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174428756993.4472.15861295526733373794@Plesk>
X-PPP-Vhost: arnaud-lcm.com

Thanks Paolo for the feedback, I'll make sure to follow your 
recommendations next time.

Have a lovely day,

Arnaud

On 10/04/2025 11:30, Paolo Abeni wrote:
> On 4/8/25 5:55 PM, Arnaud Lecomte wrote:
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
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>> Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
> A couple of notes for future submission: you should have included the
> target tree in the subj prefix (in this case: "[PATCH net v2]..."), and
> there is a small typo in the subjected (skb d -> skb data). The patch
> looks good I'm applying it.
>
> Thanks,
>
> Paolo
>

