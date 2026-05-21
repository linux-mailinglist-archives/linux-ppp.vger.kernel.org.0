Return-Path: <linux-ppp+bounces-589-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGeTFm6yDmr6AwYAu9opvQ
	(envelope-from <linux-ppp+bounces-589-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 21 May 2026 09:21:18 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A712B5A0081
	for <lists+linux-ppp@lfdr.de>; Thu, 21 May 2026 09:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 341CC30234CC
	for <lists+linux-ppp@lfdr.de>; Thu, 21 May 2026 07:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B94397B0B;
	Thu, 21 May 2026 07:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="l3vdo4Gv"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659FA377EBF
	for <linux-ppp@vger.kernel.org>; Thu, 21 May 2026 07:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779347971; cv=none; b=rQJuukcud3yEQNWk7FclhLX+fO3KGW9jx8TLOKMhGm4UKn2+XWL1Vzz1Lv8xw/fc1GVZHL3DVRwoo2SIOVdmPRLinS/c7sgBwtCCS99rlIV5Nb5QJASuO3KHsFnXbnDw/b5HtJKCMFxV2Xqui00js3QA1aC/EkdIIQwA7TLEh+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779347971; c=relaxed/simple;
	bh=FMVVGLHw/7AwnWgP71qQkYBp+odBo+vxIvPr29w2bec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9PZIiLmjMYdC2WO9d4DQWzigYh3yK0F6w2GHUBgU3HE3aEgvq7BFsUR/TQmo/AINiAewBS0SpyocNUJjC1udp4nvsb3MI2kJ+YlROtFbE4LjSedY5QjTMsKHlpl41y9MDrfXhNwr6LLkAyMpkoDzhjKbt/S67jSZFVN76LIkfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=l3vdo4Gv; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <0e6fa578-15b2-43c5-b5f5-a6e0a34c103b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779347958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z8k65NgcvE3tFcimhbZRamCjGFis6203SgZTsSSdYZg=;
	b=l3vdo4GvGtcSCeZDb8HLt2govCmlgjfqBGXCI81e07jXvejthoIcT87uJ/Oz5hVEF5cnEK
	DvomknICaJcxvJDqZqZUurXF3fkHS5tpypvuNaKmJGcOKZcoTleFm2MqySpPQ1kEQ4Umto
	G3P8R7lcXkwKwAE7Mt8GHvGK7PSvbNE=
Date: Thu, 21 May 2026 15:18:51 +0800
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2] selftests: net: add tests for PPPoL2TP
To: Matthieu Baerts <matttbe@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Felix Maurer <fmaurer@redhat.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Petr Machata <petrm@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260514015743.37869-1-qingfang.deng@linux.dev>
 <92da057f-7e97-405c-877f-ad6a64e3553e@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <92da057f-7e97-405c-877f-ad6a64e3553e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-589-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ppp];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A712B5A0081
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 2026/5/21 10:24, Matthieu Baerts wrote:
> Hi Qingfang,
>
> On 14/05/2026 11:57, Qingfang Deng wrote:
>> Add ping, iperf3, and recursion tests for PPPoL2TP.
> Thank you for the new test!
>
> I recently modified NIPA to be able to execute this test by adding
> xl2tpd 1.3.20, but it looks like this test is flaky:
>
>    https://netdev.bots.linux.dev/contest.html?skip=0&test=pppol2tp-sh
>
> The results are now ignored.
>
> Do you mind fixing that, please?


Looks like pppd exited unexpectedly, but I could not locally reproduce 
this issue.

You can start a socat instance to listen on syslog (as done in pppoe.sh 
test) to see what's going on.

Regards,

Qingfang


