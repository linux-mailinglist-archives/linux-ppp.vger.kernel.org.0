Return-Path: <linux-ppp+bounces-595-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIMWGjjAFWrYZgcAu9opvQ
	(envelope-from <linux-ppp+bounces-595-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 26 May 2026 17:46:00 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A145D8FBA
	for <lists+linux-ppp@lfdr.de>; Tue, 26 May 2026 17:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F1263098FAF
	for <lists+linux-ppp@lfdr.de>; Tue, 26 May 2026 15:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBDD31F98F;
	Tue, 26 May 2026 15:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="h+MbZAcN"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD301C84A6;
	Tue, 26 May 2026 15:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809031; cv=none; b=Z0GIXoK2dJ5TB83Uap3zoojPBKhJjCG6yuv/wzgxx4J59268XGsG54E4aElE82L8gVhkG7708nWJKvtn/3ioW1gy7irEUbmh7EVVasq+Ue+93ZOhD0ua/oQh0IJeRXLJsa5Jw7tZQs9Jq5zP3zDg1xcYapn26rSRHRpmcMMd4OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809031; c=relaxed/simple;
	bh=3e1zqRl6zwuIULkAIQGfKTuvCcLwuUU1UmQkPmbiYyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MyC3rK13LpYZVXM8LjBrUMTvo5nEExI+6R/nNvzboQyJff371jxE4w9waj3uzD8zhnCCn6DP+nMI8etWP306X1SiKMDJTVpyENfKuSbQQO8HuyAqpGi+MSUhY79l8C+gM0L3bRl3Uav4SCZQaFrxcvNSlcWeH83JXw20AS4HpCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=h+MbZAcN; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <7b39dacb-6c4c-430a-9bc8-4d53d4f1f404@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779809026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2nMO/6+hfT/3RY3sEQzw7Qj/Aa7bcOJh/efr+qadybA=;
	b=h+MbZAcNxDO5wsXuQqSje6WXoMPIskPmshBO1G1lCShxXvRfpeMmBHejkMhiqzZN2ii8b2
	il/jgFUUkpd9QCq8eUkbs06WZ62i1L0JPFH48jaJQZDBHrg+ToqUElMvkTJzoQf5oJovvz
	kDZXNgN5UDQAdSPnUFri5Jox5ptwIFg=
Date: Tue, 26 May 2026 23:23:36 +0800
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next] selftests: net: add socat syslog for PPPoL2TP
To: Matthieu Baerts <matttbe@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260526014152.532505-1-qingfang.deng@linux.dev>
 <60b50562-3351-49da-ab6b-953270380314@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <60b50562-3351-49da-ab6b-953270380314@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-595-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linux.dev:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: 23A145D8FBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/26/2026 4:10 PM, Matthieu Baerts wrote:
> Hi Qingfang,
> 
> On 26/05/2026 11:41, Qingfang Deng wrote:
>> As done in pppoe.sh, start socat as the syslog listener. In case the
>> test fails, dump its log to see what's going on.
> 
> (...)
> 
>> diff --git a/tools/testing/selftests/net/ppp/pppol2tp.sh b/tools/testing/selftests/net/ppp/pppol2tp.sh
>> index 5b592785f1f9..96786267ccc7 100755
>> --- a/tools/testing/selftests/net/ppp/pppol2tp.sh
>> +++ b/tools/testing/selftests/net/ppp/pppol2tp.sh
> 
> (...)
> 
>> +# Dump syslog messages if the test failed
>> +if [ "$RET" -ne 0 ]; then
> 
> This only checks for errors with the first test, not with the second one
> below. Should you create a new helper and call it here and below? Or
> only once at the end, using ${EXIT_STATUS} instead?

I'll move it to the end, thanks.

>> +	while read -r _sign _date _time len _from _to
>> +	do      len=${len##*=}
>> +		read -n "$len" -r LINE
>> +		echo "$LINE"
>> +	done < "$PPPOL2TP_LOG"
>> +fi
>> +
>>   # Recursion test
>>   RET=0
>>   # Delete route to LNS IP
> 
> Cheers,
> Matt
> 


