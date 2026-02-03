Return-Path: <linux-ppp+bounces-378-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEBxEpIlgmnPPgMAu9opvQ
	(envelope-from <linux-ppp+bounces-378-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 03 Feb 2026 17:42:58 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB927DC278
	for <lists+linux-ppp@lfdr.de>; Tue, 03 Feb 2026 17:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBA62318B002
	for <lists+linux-ppp@lfdr.de>; Tue,  3 Feb 2026 16:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D73B3D2FFF;
	Tue,  3 Feb 2026 16:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K0+KU2yu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bQ0YlY5x"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9334313D8B1
	for <linux-ppp@vger.kernel.org>; Tue,  3 Feb 2026 16:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770136415; cv=none; b=kWzsJQJX8NJJy9QU36vtWKMNbHQ75SYINmpXdtRvdb+KahaoQmd7oW5iNFFrYkASkrBP8N9DPtAW8U9FfHpkpXPy8N4gEZFJGqRzF0TuzP4g4oUo9p+ILIpK0rN1nWiGJn2WE/P/evqqK8lrd1SfO9Pk7gfWSFCvGAsEy7KOF/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770136415; c=relaxed/simple;
	bh=F8wjmeMfqX/eySMR7Heo5WfimkNFAx9JYOVbb0IFb2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qA9OaZVeTW1eJRYBlVon/o1Lj5DCW/253ZXy8CPaUoktJV6CgusqGxnUDS/SRITnmZEGJZTwVktKWdplonz5O5MvcSLvG+oHSwzPGHC5q0ZV2BosrQXy+pN3HCay3kTTt7csabKVbRRZ9xS1cji6mnIp1+3mCPHUxxFLme8Brms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K0+KU2yu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bQ0YlY5x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770136412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MA2FBw+QPL7DD0FVi0rqzGoMagHrtWGBaDXuX/HF6VQ=;
	b=K0+KU2yu6/7q7GBwR5GfeX15/SkGQK7qGz7xPy1mwPR2ObS6Kb70tKI+6gKDfi4Vm70XfP
	E6fhC89bI80/fve1cJGSlUJbbIf5EyakP2q2E3tg+7BsSHyD7I8d8eDVyHjBnwMEapTlpV
	ahS6dVBGSfKiJ4sIpdXfdcfRz5HQceM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-37NAhreSPEiSDKRdY3STNw-1; Tue, 03 Feb 2026 11:33:31 -0500
X-MC-Unique: 37NAhreSPEiSDKRdY3STNw-1
X-Mimecast-MFC-AGG-ID: 37NAhreSPEiSDKRdY3STNw_1770136410
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4801bceb317so53913415e9.1
        for <linux-ppp@vger.kernel.org>; Tue, 03 Feb 2026 08:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770136410; x=1770741210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MA2FBw+QPL7DD0FVi0rqzGoMagHrtWGBaDXuX/HF6VQ=;
        b=bQ0YlY5xFx+s1BoS23B6Wcd2wlEn7YkObPotBk9ADY3upIg95aC4niUJDgEI1KIqM6
         OPxUz44yfEc1buXEHgj/i3wxQ/I0MI5l9hJ3/ajJxWgTjTXvGGzgutjvTxrtHAn9cvok
         Jzka07Jj6qMiWtTNv6nrCe74kfOUDDf2pBOo0NZbCx7jTZaMYE3YxjoQ8ONTlBSMnEeL
         I3bVDf8/XziCGlfBDga1nRTf117ASEJRg5pasQRDp8MUD3iuz7woJ8tFPcjST15bsPj7
         gE97JnogiHCLNzEd62ij5HQuhYvPRgDOLJysg3P08t7Fq0vctbruVO36TUojvGCgmfF3
         bU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770136410; x=1770741210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MA2FBw+QPL7DD0FVi0rqzGoMagHrtWGBaDXuX/HF6VQ=;
        b=MrdSaZ2HX6YcvekZEMBDZ14m6kvjnFjupO9xIn1f2cnHiEB0bdBZhjZaf+ezxZ9/59
         U3Nhnr5Bglsd1S2IqdLqmA5U3JlqrtACRD7fLtm0X9OAQnq92iqkoE84jxJuG2EFr+PC
         h9JeE3nNk2+AuBh+zbJ0vIdp9DZmTBLEEbEbYnw2twLAop7L6OdAX0K1FC5VQp1pRFot
         w51djUlMU94xGNU4weVy/jZs913/l2cdApEFwWWbTS70WtYkjXt/xPJ9leiozFUr+5FJ
         0jNgW6tKzzio9jOKtQh78PA6Bra5PH0oNdhozNXfcGOdXy/32I89LxQRe8E0U9kDmN1X
         OpBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa9PXCyj8EtCfAO51DxFSnyR3qZqsob8Q3/Z8AN6Xf4IV/GtQLaKajND9OfV3DsAU3KspRsYXEW1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIayz65xNaQRXA9CrOMTPERIBntE9nE2+CH7pF7SQImaOtS3tQ
	CtQ4Vzl9It/lI76N71Ytx7a6sVubbJUTx7d9FJ28kOKjFynTYruNHtbu8Kl1h/8RTyg7HdMCAED
	6mHeKcvZC85t4VuWRwPLmN4jtro/D+fCnHRcbzbR5yro74fqQEjXhsnC7L4wu2g==
X-Gm-Gg: AZuq6aJ+uBdqAgxiHNvDxSZ59lTwb7SX5Oud1Cd/LMITLoeRcOA8/R5sXrK5GXz3dtq
	Y12WO8G75No5lsPrdA0OK+Meyxz4o38KkwU9pwqPwdsiH2QDY7Tfwnhp15Ool+8bCsAdFXQTDq/
	/A23fKr0W+kuyYm3SzQ0/h9AnOzxg0Wmo3sftepS4hjtz5Ilj6CPEXklOMOtWXNCOyBiJCD2EjV
	yvqAPC2K6zzfO9WbFSE6eU69WkkT3nmVmIXQbQHmHr0K9My5H3vxL7QCIGYhCWTWG8GSTB6cBbg
	1x6PIKig6fVFKOQzC+fAqfIoRu/VvWbyqmb5iUrVlfzuPyellw7sWFNigcPvuXy5tDkI9BmE2yC
	GZpNwDyv9VQg=
X-Received: by 2002:a05:600c:4f09:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-4830e922912mr3902835e9.6.1770136409692;
        Tue, 03 Feb 2026 08:33:29 -0800 (PST)
X-Received: by 2002:a05:600c:4f09:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-4830e922912mr3902475e9.6.1770136409269;
        Tue, 03 Feb 2026 08:33:29 -0800 (PST)
Received: from [192.168.88.32] ([150.228.93.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830516a0a0sm72392825e9.15.2026.02.03.08.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 08:33:28 -0800 (PST)
Message-ID: <fee77ae1-0231-414f-be43-6dca8bdb0e20@redhat.com>
Date: Tue, 3 Feb 2026 17:33:24 +0100
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4] ppp: enable TX scatter-gather
To: Qingfang Deng <dqfext@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
References: <20260129012902.941-1-dqfext@gmail.com>
 <03c714f3-edd5-43fb-a0be-8c4a43bf6101@redhat.com>
 <CALW65jYYdX+NQ-6vNBdxDGHxDV1AdKQWenFZNjnqE9VQyC7fog@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CALW65jYYdX+NQ-6vNBdxDGHxDV1AdKQWenFZNjnqE9VQyC7fog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-378-lists,linux-ppp=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-ppp@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DB927DC278
X-Rspamd-Action: no action

On 2/3/26 4:08 PM, Qingfang Deng wrote:
> On Tue, Feb 3, 2026 at 6:55 PM Paolo Abeni <pabeni@redhat.com> wrote:
>> I'm sorry for missing this point before, but AFAICS channels with
>> chan->direct_xmit == 0 do not support GSO packets at all, and here such
>> packets will be transmitted after linearization (but still as GSO).
>>
>> I think that while transmitting over !chan->direct_xmit you additionally
>> need to check for GSO packet. If ppp features are recomputed depending
>> on the channels configuration, you could chose to drop such packets.
>> Otherwise you will need to segment them before transmission, and that
>> looks error prone in case of multilink.
> 
> I don't think that's true. Using the current features set (NETIF_F_SG
> | NETIF_F_FRAGLIST), the network core will only enable the generic
> software GSO (NETIF_F_GSO), and a GSO skb will be segmented in
> validate_xmit_skb before being passed to the PPP driver.

Right you are! I thought TSO was enabled here at some point but it's not
the case. No need to resubmit, let me resurrect this patch in PW.

Thanks,

Paolo



