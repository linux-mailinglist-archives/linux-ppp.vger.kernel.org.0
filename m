Return-Path: <linux-ppp+bounces-484-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDESGkuBzmkqoAYAu9opvQ
	(envelope-from <linux-ppp+bounces-484-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 16:46:35 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF42C38AC6F
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 16:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC0B530480A4
	for <lists+linux-ppp@lfdr.de>; Thu,  2 Apr 2026 14:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FB830FC2E;
	Thu,  2 Apr 2026 14:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYNVAt6w"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BB52FE591
	for <linux-ppp@vger.kernel.org>; Thu,  2 Apr 2026 14:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141001; cv=none; b=bjx84e5rEeZL67Jb+oeXRt7FBZe7XuNn2gNvphPlgXONdJpp0c210La0NXUIdxUuBn3k+/lsP+Kcy1yLCiElA/uQdLx2jZ+bhdPAGXldty/+VbhkUFaWEbhbgmAs1bHzqL9LjRirgHmB4OSoaY+vZwb+Vw2gu1x1TxGzWInplbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141001; c=relaxed/simple;
	bh=+1DtgmBJGYL+AI6qq5AuRnLqe+hKgZDdNkl7qsLrNxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=byIroA0unq3STpdUvNBzlBPUKy6tgG/ob7zP3j6RrWBz74rVL8bcHjIlJ8bhEtWorjjrHiFe9bILffd4kIXfMJ2GLDUO6AJje3H45Nx8WTkGXs3YbnHAuIuy1EOnuhp1Gt7YES1eW9cqQefgE97C1mfQZINfo/zv7hBYZOrVdYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYNVAt6w; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483487335c2so9434885e9.2
        for <linux-ppp@vger.kernel.org>; Thu, 02 Apr 2026 07:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775140997; x=1775745797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+1DtgmBJGYL+AI6qq5AuRnLqe+hKgZDdNkl7qsLrNxg=;
        b=ZYNVAt6wUUA9TMrfqgxDS5Nsb0LQtwGgf+LFU9B4Dh+M/j2lWwtnkZRRnMtM/eWqQc
         jNCCNdTBCQI2lQw1SNIGLK5Mp1OtkvoZUHqVzElE0/OorxXNkUEIiffu3zuPI7tNOPjs
         slxKMjzXH2Dga+iJ1AZSy+lppbY96MSHNugB87YFwX498TQjspUJ7gD5bs74drJ7MZpW
         glL9uMmc322W0pZ5NF/wIt/eunR+eaIHvSef+dXi+CRRCzcCUVOCvTLdfzBiefjzQo29
         x07rzer/r+SgTAiyTlntlCDk6tzmYwJTmD9fPe4BZhUOZxhp7yJZtWRDK+/Xqgr842r/
         mfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775140997; x=1775745797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1DtgmBJGYL+AI6qq5AuRnLqe+hKgZDdNkl7qsLrNxg=;
        b=YYcCLRYefEyXQpKS7W7dayTCwgotdikEol7Dfhx9ZkC+FtyytkG/7rqDza7srt0kVr
         vVcGSQrpgWUMa/CGdf5ESiPOsbYevck+dYQNiLHVqLuUQPGxC6B+MzMWjkK5OVhiakvJ
         pBS8YuTx7r2lwTxCrH54Vmro/mT6VJN3WEeEvbMzL/Ge6tKkDdGbn/EdIQwRQST7nRrN
         1H11OvDXjHmQSIE7S13dtMaLL8ORK5DU9QAU6RbdCvXiyjEOrm7Ei8rjWT3R+R8XthDt
         G537NSKKQ3YObxvSP+NuqydD7oEH91637WfmabSw7TU+177868XzR6mI8RSGHi7xi5mj
         8+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCX3R0d2NH9YlxaA2NqtZKqj2FG20yDi+7ro0ThnsK/oyFLwn0bkA/RmkSaQkHWakpwieE9IfJx60Eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYkUYf55xJjygZdM22Py39e60ECwcwKK5oK3ngDuO2UU7SwkE8
	4nkgtOl6de+E7u47Lk6JQzZUy7toKqH6hmEsXK4gNs3Sg4qiN2MDYU7Y
X-Gm-Gg: ATEYQzxGLhZcXS18NK/rgHrjqe56s0Z0e4LX0NVxGOi7MBev6wpODukqSeL1xFKUpnk
	SugUrBa8Aj4DZFqQAAdrfpd8pRWIr0wS3wdbjXvHE6/X3xZM91ubrnefLqqmrky894bBDXcRTjW
	nJ5pi8u7b1iizAxxfmEu4M4iq2EcT7C0Rk+3xDuzbccYSuhPEb3vyT0VYlo5Omkw/XvJA7uAObR
	GomVeF15Q+ZkArxuhzKEReHsFTi/AYe5Fd/doF1m721MYmx5kIJ3Wd+SJRVGcXe7p89YGHIhzR5
	c32KAzI7LdfPuoIdJe/JCICQWrYNdZ8/zxITv+9kKR6bTnGIGyaLezS/VBvr0tA+plGlq6EAArx
	FLNfgtJq2AtPirzg7fhXTql2pWZjcqv8084iRxO7AZYL7ZmyMhnvOo71gV2B1ceIRoxpwqn/Hfw
	QQprM8bRKhsLYfJHoOCdbCwgJwH761mAAjaRSon25jieoKppC5LLhjV+3batJxULtPRjeI
X-Received: by 2002:a05:600c:1d16:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-4888359dc45mr133537805e9.20.1775140996932;
        Thu, 02 Apr 2026 07:43:16 -0700 (PDT)
Received: from [10.128.11.51] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887a630922sm249922365e9.0.2026.04.02.07.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 07:43:16 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <4ff8ce01-6001-412e-aa70-5ec2961f8c57@gmail.com>
Date: Thu, 2 Apr 2026 15:43:14 +0100
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] ppp: update Kconfig help message
To: Qingfang Deng <qingfang.deng@linux.dev>, linux-ppp@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Biggers <ebiggers@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>, Dianne Skoll <dianne@skoll.ca>,
 Jaco Kroon <jaco@uls.co.za>, James Carlson <carlsonj@workingcode.com>
References: <20260402050053.144250-1-qingfang.deng@linux.dev>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260402050053.144250-1-qingfang.deng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-484-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF42C38AC6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I didn't realize there were dead links in the Kconfig help texts.
I've added a check for this to kconfirm and found many more instances!
In most cases, I'm not the right person to be replacing these links;
I'll send out a message soon to the mailing list with what's been
detected. Thanks for the inspiration, Qingfang!

Also, LGTM, so:
Reviewed-by: Julian Braha <julianbraha@gmail.com>

