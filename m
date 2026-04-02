Return-Path: <linux-ppp+bounces-479-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIf9Nh4+zmkImQYAu9opvQ
	(envelope-from <linux-ppp+bounces-479-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 11:59:58 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D21F387595
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 11:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C45EA3125114
	for <lists+linux-ppp@lfdr.de>; Thu,  2 Apr 2026 09:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470832EB0F;
	Thu,  2 Apr 2026 09:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KCWceTh6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z+kV8++Z"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795903D5658
	for <linux-ppp@vger.kernel.org>; Thu,  2 Apr 2026 09:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123335; cv=none; b=HeA4+hdc7yXGjTmglsjI/Mk7RT6QZMXkh2nV6q+v6rnMzk3si0vZE4kiEA8tDHriIqJNNZ9ryMGjAaploaizX5pSXQ0v7rqRBOZLrQBW9fJMdpTADfh9PDYq4pAeW8KNIn011oPoKX9OSlMJehhAIcyb9l253czb3mp755WxMSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123335; c=relaxed/simple;
	bh=FxR2bhBkRY0ikaJ1Hs1fd9nHf+FN0AGKBDKZwHlC+gg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6MHwx2C7aXCkZ2cf6/T/TtyUMAHce4WySXE0Ab4m1cqdxzMw+qyzDiTf4ijQ3D9VVZb7uh6V0GwNFw9ug8SGFNG/YulFCshJNi0ky7sK6IaxgtkrY4KyhR2h/UMDC8YHFfTS/3b+kMmhRL9xsS3CINQkroKbqC+qF7NOGyTQFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KCWceTh6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z+kV8++Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775123325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tLN44LxxXgYTiWrwLkxzAK8Zoqz3iKp5J7224wtn/u4=;
	b=KCWceTh6w59zPJbCslbmZrqWhnq2N5ye4Y4ty+BtL//6TQ2LRR8f0NQ2AfyuFCcJ2QRksF
	klh0RRVGkvNc/kbJseMAHyMeZO747MZlxvLPuFYp2BKZ1mtPNjyRxdg2BPeR5XdOdM7Wn+
	7aif9natp7gO7pdCDw33G5d84bTIbtc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354--lvtS7CTPmiYPlGX357IlA-1; Thu, 02 Apr 2026 05:48:43 -0400
X-MC-Unique: -lvtS7CTPmiYPlGX357IlA-1
X-Mimecast-MFC-AGG-ID: -lvtS7CTPmiYPlGX357IlA_1775123322
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4837bfcfe0dso10709875e9.1
        for <linux-ppp@vger.kernel.org>; Thu, 02 Apr 2026 02:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775123322; x=1775728122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tLN44LxxXgYTiWrwLkxzAK8Zoqz3iKp5J7224wtn/u4=;
        b=Z+kV8++ZG8I0b/VTs68aucsnVGe8e4N2ThrqekVy5f+PN469KC2Vpm51FR6lSWKBsN
         SvJrwCZd78z0vE5/PknU7G9YVW2qV60KqxLkhVkZ8CruVwX1QeFvy5vbBvhTZAohVbsP
         4jTYGTUHM8T9Nu5hIbn33hsmDmPa2uMwtqCZWwZyuyKTLsD9QM4wV5NUqfYtBG0sWV5W
         U5cNbV0B0FQ5fM1QuBboCQaaelwbqr8CqBCMY+jNmsCt5tS4uQ19EXBbhXtH8qWAgq7k
         gjt0LNNMWDHRIN/UiPtwU1GiE9aYN/4k+Bqfa8QI3yfJJBnVlpN/DUSZcWUJOwZt0kvY
         XllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775123322; x=1775728122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLN44LxxXgYTiWrwLkxzAK8Zoqz3iKp5J7224wtn/u4=;
        b=H9p1jmfIVbrPmw7K/OvyL0JSHUqdBlUmKMyNl7oFKNvidgqVc6rJpF50kgvGw/l1M5
         aGO1vnRZou/4gE7enBnFSQcw2ejyPd+7oJpjoniIIGT0glNYlxqqNHfVTjAxy7RxXY1u
         2IPKIx3AtbbIAKMgV18W8ubplXgXBFSF2k0739j6RYJzWt5sD8/1lzOmCgpaiQ/XeBjN
         FezNgbx1cdIqKUvQ4zdYSyIVZlKg6Oy15TpyPAbQe2Z/FAXQXJiE4L9W5s3fsxsw8pt8
         Y/nFB0XN4n4M9If4EmeNRZlqgR22/99Pn9+evNEnMOqAGCS/27Vef6nlrUpP8KdVw6rs
         6mtA==
X-Forwarded-Encrypted: i=1; AJvYcCXMdQNWI55l5uFKmos+C4+v6Yruu/5wDqvM+u/cKGJKUY/QDytry3h2nwJ3F8DNv6BQ+GmoGIrPVcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSwDFG8EombamjTu7rT+MmioMhFkI1Qkchy6l7Qx2sVBE595LY
	4f0MwkD/TN6H8LRNG0FzZ5Ieb41G4dr6HFh7jcyciKA/jUHeNlAuFiMvEULScWEk3I0CdFCO6f/
	98qQ31d6ErKSrSHQ6BM4GRPCNi3PwW78UdJbQ+PUHeaPFCnrvZ8zBW5XO0NwCqA==
X-Gm-Gg: ATEYQzyhAdJj764j3PWg8fv/iCxDOxsrfQMQnb7JS7zdsXlfo1SawM/SHzjkDWjP+a4
	GV4gznDpsnM6WZdaCJvJG89rgIpMaeZaGQWuhahtSNQl4PfCbGwSDCHe+idFGWfzFKPYPK1LLH9
	97DQcASbZgKkNClXPVfZ9Kti/rbJnVslCiZF4etf5ZSl4b+8nnhaove92jUKdqhaLBosl6VzfPp
	vC8brAaMlGc6lDhFzCsTBmm4oaWvKVKz+uu1tImcN4bWTRUPxC5kU4zLa2BP5Ox51wnlwJDvCJF
	s3h2jPl6u3NkcG62GvJRQrV5KUuggvcfkMBnI5LD5QDPQpKc58LhvL3j6rJk2fM8MqwdYMuk1KR
	kxZO+8wzvEC/8Wt+ZLoFvlKHmePa7JNlf0Nkl9jkWFNxq352XoK7kqhKuyg==
X-Received: by 2002:a05:600c:45c5:b0:483:6d42:25c6 with SMTP id 5b1f17b1804b1-48883592213mr114334155e9.23.1775123322330;
        Thu, 02 Apr 2026 02:48:42 -0700 (PDT)
X-Received: by 2002:a05:600c:45c5:b0:483:6d42:25c6 with SMTP id 5b1f17b1804b1-48883592213mr114333895e9.23.1775123321886;
        Thu, 02 Apr 2026 02:48:41 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8852a5sm148784745e9.9.2026.04.02.02.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:48:41 -0700 (PDT)
Message-ID: <50ae3c69-2c4e-499f-a46a-cbd207ff5f09@redhat.com>
Date: Thu, 2 Apr 2026 11:48:39 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7] selftests: net: add tests for PPP
To: Qingfang Deng <dqfext@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Dianne Skoll <dianne@skoll.ca>
Cc: Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Felix Maurer <fmaurer@redhat.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>
References: <20260330035604.133073-1-dqfext@gmail.com>
 <20260401081030.29b050d5@kernel.org>
 <CALW65jahWApDnVmFReW+Y3HDxBEmCwzsT1oyh03SW7X5ry6PzA@mail.gmail.com>
 <20260401175621.549c492e@kernel.org>
 <CALW65jaTbaosbO8ypKZ6G37HxuxXabeTaP_Fhq72xTovmDj+8g@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CALW65jaTbaosbO8ypKZ6G37HxuxXabeTaP_Fhq72xTovmDj+8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-479-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,skoll.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-ppp@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.961];
	TAGGED_RCPT(0.00)[linux-ppp];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pppoe.sh:url]
X-Rspamd-Queue-Id: 5D21F387595
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 4:26 AM, Qingfang Deng wrote:
> On Thu, Apr 2, 2026 at 8:56 AM Jakub Kicinski <kuba@kernel.org> wrote:
>> On Wed, 1 Apr 2026 23:45:38 +0800 Qingfang Deng wrote:
>>>> # iperf3: error - unable to connect to server - server may have stopped running or use a different port, firewall issue, etc.: Network is unreachable
>>>> # TEST: PPPoE                                                         [FAIL]
>>>> not ok 1 selftests: net/ppp: pppoe.sh # exit=1
>>>
>>> It looks like pppoe-server fails to start. You may check the syslog to
>>> see what's going on.
>>
>> Hm, we don't capture syslog automatically :S We capture stdout and
>> stderr
>>
>> I'm not even sure there's something listening on syslog in virtme-ng
>> Is it possible to make the daemon log to stdout or a file and dump
>> that file to stdout on failure? Even if we fix the current issue
>> it will be quite inconvenient if we have to go into syslog every time
>> the test is failing. The test output should provide enough info to
>> debug failures.
> 
> Add Cc: Dianne
> 
> I checked the man page of pppoe-server and did not find such option.
> We can instead start our own listener and redirect the syslog to a
> file or stdout:
> 
> socat -u UNIX-RECV:/dev/log,ignoreeof STDOUT &

Note that similar failures in the past in other test-cases were usually
due to timing issues. i.e. the pppoe-server starts in background too
late for the client.

Possibly a somewhat clean solution is to wait in a loop for the
'pppoe-server ready' event, somewhat similar to wait_local_port_listen().

Otherwise an hackish sleep in between should do.

Note that you should be possibly able to reproduce this kind of failure
in a virtualized/slow enough environment (i.e. using vng as described on
nipa wiki)

Finally, note that in this test script you should start the socat
listener only if /dev/log does not exists, or ignore socat startup
errors - because self-test should run also on different systems.

/P



