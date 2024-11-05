Return-Path: <linux-ppp+bounces-106-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDC29BCF88
	for <lists+linux-ppp@lfdr.de>; Tue,  5 Nov 2024 15:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C7BE286850
	for <lists+linux-ppp@lfdr.de>; Tue,  5 Nov 2024 14:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2CE1D88D4;
	Tue,  5 Nov 2024 14:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TfvX3nRW"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803801D90CD
	for <linux-ppp@vger.kernel.org>; Tue,  5 Nov 2024 14:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730817325; cv=none; b=mGsUO7pPNz9FR+cXTZJoi/GwzT5XoCwjicAnv2RyrOpEmejmyTwsOsZrzSu0SwQfo39YBWrwfBpNYa2Pha5xB6S4sij/ZoQnyt8QnPexNBcdYvkQa0cmdrHSwReR4r05XqqvloSQ6gixhDB01veoTTd0eG9yYbLEe0DNkXOLYXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730817325; c=relaxed/simple;
	bh=BwFe6Qgs1eGPR0J5xRfgTuAtKj98PLfxOLUK8c3Ajlo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MVWCmcJytu5CqfAeGEluQaMHu19ANAfSUsVFnsEix+LME2F/lRQ3PUd+usRAgcBO+a92ayGnSfnm/rr9d+dm80a9L30elhTz4/tqLVnWTdizBVLMXsbM/MXwbqVGG0aPFnYbCUsa+uNbXjR5OfaeDJz5jJOJWyzpcDzYIJ6Wpfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TfvX3nRW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730817322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BwFe6Qgs1eGPR0J5xRfgTuAtKj98PLfxOLUK8c3Ajlo=;
	b=TfvX3nRWQt6qVu43DbjwRRBoWFYN7vPs4pgd4+5h4GkRbH4syPetElnZZrTzs1YbeFG2Dr
	IQ7+FbtPovDLpMATbXO9i5kenLZLikvnoePNqgcVBleutwZJRApHYlrw76xg0iZdSLqJy7
	DnRzR2QgLsSizscYKS5Mk8A2S8wBEv4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-mqH3Ay-UN_y8ppdfe1Ks8A-1; Tue, 05 Nov 2024 09:35:21 -0500
X-MC-Unique: mqH3Ay-UN_y8ppdfe1Ks8A-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-37d59ad50f3so2453266f8f.0
        for <linux-ppp@vger.kernel.org>; Tue, 05 Nov 2024 06:35:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817320; x=1731422120;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwFe6Qgs1eGPR0J5xRfgTuAtKj98PLfxOLUK8c3Ajlo=;
        b=qmNluv1scvivAyMcZBli31qkDRi3KczDPAZBk9jItb63Id4+Cu/JO8vqyGOO9fqeOV
         DBcx/YKM98ZOIQjSWaSvM7tniAxzFsYbLPaIxeCDr0GwQnA5fdaPCzYCXr45CZ24Sw2o
         lSoxb0cClV3U82sXzZ/s3U/gl+z52NdU1sS8bUBpt7WUefcnOQdJ9gJlL7NNRUQimgfq
         YYxya2AjEzZ5tQoOCkjxDfxGoIDAbcdvaXVIBW4pwDyfuXI/EpNXhixIHI7Vh3Hi9ei8
         z38vxOGCwL7khnfuxIrvPWvZihRrPF7DP2X05WAwIvBEPlsoe+sF5CrGEFH1oZSq2XLA
         r51A==
X-Forwarded-Encrypted: i=1; AJvYcCUqwM0CiTrJogXFnTJmPhpCQ368t1xd+5H0YiFiRnQMq+S7s62Rtpx3b8I2xgjnFv68/QMJF+rFkgE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9M6fwbwNG8DSPTc2ubpokJQzQsgXTJoELBUt00w/HzDCrhaVT
	fHqEeZpGUImH6M4ygGEri+JSKHKkp1hwbyND2iFRDX9FkS7769KtTZG57osNQT0Tp/bbAoBO9m4
	orEsV+Kp0eUzG1X6NIc4eJSqk/FrQMUnWmv9Mg8jjVnwYwBOfq/BJoH8hGQ==
X-Received: by 2002:adf:9793:0:b0:367:9881:7d66 with SMTP id ffacd0b85a97d-380612008e6mr26169842f8f.41.1730817320321;
        Tue, 05 Nov 2024 06:35:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2oZ/wH7ZiBKTE5K8fTDbHsfsL4Jv8pl7bu57PIoWul1kpD6bhk/AsEHETjT5Vs7lX+3pXKg==
X-Received: by 2002:adf:9793:0:b0:367:9881:7d66 with SMTP id ffacd0b85a97d-380612008e6mr26169823f8f.41.1730817319957;
        Tue, 05 Nov 2024 06:35:19 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e7387sm16276544f8f.51.2024.11.05.06.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:35:19 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 4F73E164C253; Tue, 05 Nov 2024 15:35:18 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ppp@vger.kernel.org
Subject: Re: [RFC PATCH net-next] net: ppp: convert to IFF_NO_QUEUE
In-Reply-To: <CALW65jbz=3JNTx-SWk21DT4yc+oD3Dsz49z__zgDXF7TjUV7Lw@mail.gmail.com>
References: <20241029103656.2151-1-dqfext@gmail.com>
 <87msid98dc.fsf@toke.dk>
 <CALW65jbz=3JNTx-SWk21DT4yc+oD3Dsz49z__zgDXF7TjUV7Lw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 05 Nov 2024 15:35:18 +0100
Message-ID: <87a5ed92ah.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Qingfang Deng <dqfext@gmail.com> writes:

> Hi Toke,
>
> On Tue, Nov 5, 2024 at 8:24=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen <=
toke@redhat.com> wrote:
>>
>> Qingfang Deng <dqfext@gmail.com> writes:
>>
>> > When testing the parallel TX performance of a single PPPoE interface
>> > over a 2.5GbE link with multiple hardware queues, the throughput could
>> > not exceed 1.9Gbps, even with low CPU usage.
>> >
>> > This issue arises because the PPP interface is registered with a single
>> > queue and a tx_queue_len of 3. This default behavior dates back to Lin=
ux
>> > 2.3.13, which was suitable for slower serial ports. However, in modern
>> > devices with multiple processors and hardware queues, this configurati=
on
>> > can lead to congestion.
>> >
>> > For PPPoE/PPTP, the lower interface should handle qdisc, so we need to
>> > set IFF_NO_QUEUE.
>>
>> This bit makes sense - the PPPoE and PPTP channel types call through to
>> the underlying network stack, and their start_xmit() ops never return
>> anything other than 1 (so there's no pushback against the upper PPP
>> device anyway). The same goes for the L2TP PPP channel driver.
>>
>> > For PPP over a serial port, we don't benefit from a qdisc with such a
>> > short TX queue, so handling TX queueing in the driver and setting
>> > IFF_NO_QUEUE is more effective.
>>
>> However, this bit is certainly not true. For the channel drivers that
>> do push back (which is everything apart from the three mentioned above,
>> AFAICT), we absolutely do want a qdisc to store the packets, instead of
>> this arbitrary 32-packet FIFO inside the driver. Your comment about the
>> short TX queue only holds for the pfifo_fast qdisc (that's the only one
>> that uses the tx_queue_len for anything), anything else will do its own
>> thing.
>>
>> (Side note: don't use pfifo_fast!)
>>
>> I suppose one option here could be to set the IFF_NO_QUEUE flag
>> conditionally depending on whether the underlying channel driver does
>> pushback against the PPP device or not (add a channel flag to indicate
>> this, or something), and then call the netif_{wake,stop}_queue()
>> functions conditionally depending on this. But setting the noqueue flag
>> unconditionally like this patch does, is definitely not a good idea!
>
> I agree. Then the problem becomes how to test if a PPP device is a PPPoE.
> It seems like PPPoE is the only one that implements
> ops->fill_forward_path, should I use that? Or is there a better way?

Just add a new field to struct ppp_channel and have the PPoE channel
driver set that? Could be a flags field, or even just a 'bool
direct_xmit' field...

-Toke


