Return-Path: <linux-ppp+bounces-623-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id StYqCh4dTWouvQEAu9opvQ
	(envelope-from <linux-ppp+bounces-623-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 07 Jul 2026 17:37:02 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9473C71D592
	for <lists+linux-ppp@lfdr.de>; Tue, 07 Jul 2026 17:37:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=cpBDC8vT;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-623-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-ppp+bounces-623-lists+linux-ppp=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99482302A7E0
	for <lists+linux-ppp@lfdr.de>; Tue,  7 Jul 2026 15:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3036F37FF46;
	Tue,  7 Jul 2026 15:32:16 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0B43101B6
	for <linux-ppp@vger.kernel.org>; Tue,  7 Jul 2026 15:32:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783438336; cv=none; b=JSUeecwbJdzqjSFGjDPSnymeEOXJOYm0fuRVrWw8BrTqK061LPK8uqB7i8GhlmOhSIdPZrry57qS7LmAuAuiAcTX6/RzFk1fPsHS6nmv1A6Jd8Gfwbez+Kbx6nu0GvZveJUPdiJUCIYIyA+eNoJ7V8OUop7/nju9hCZGIKardGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783438336; c=relaxed/simple;
	bh=+pVfGy+q5xijHnzCvygCiL8Dx41ukdWBcc4R5yitQSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rfoD0amdWxe0rFKp/NiP3r8SvjjVp02uKQtYEF3u+1wL1GJnSi9CqQmKrp4sopC8aIxsSW6ieekF2CHqICrbWkKpa2bnvhppNk2Low6GEqJzb+eu2sUhLB0xrznOnfz1kBbwgcp3IRpB3Sh/vGW7W+k1BzqGjMDY8KbY0T/LLkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cpBDC8vT; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so2791511f8f.1
        for <linux-ppp@vger.kernel.org>; Tue, 07 Jul 2026 08:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783438332; x=1784043132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iQ+Ftv/1fNBSyhcVrkQAR5aks0BMvykec1ekhSkuJMI=;
        b=cpBDC8vTCND247njZC8QkYu4pCb1hx8UGt8oY5yFMo63vvJ9u3CcyDYhm90vYigOLG
         3O4FHRktqhvI08xYdIGa+ZfJG3eIIEbGm6mWubP0BovjZG+D45/+aScJwMsc2ThKzlH7
         i5/EE1zd8Fo/KqsCKxZUMXTeAgsimtASNQeMLrzRVaDlC1TF2oBH6qrGPA/1vpsjYtMX
         uEiNHrod67CHhtSwTyO6M2zHBCD0v/0SIuRP1wGY048Yt/jjrOVvJRaft2qga9E/I6Sx
         YE6h6GTwXfigs2XpHl2tU163WvCen/efReQMt3qs3K+1HQGaXIdbo8uWmfmVfwM4Tj1G
         Uqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783438332; x=1784043132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQ+Ftv/1fNBSyhcVrkQAR5aks0BMvykec1ekhSkuJMI=;
        b=qtdhdEoTH/xB8Fh7/L6iWL0PY2avYl/WWwTfxw5nEbOl70JX/XHu54jRvmLPrc2owI
         zgGcofuKruIsfyrGTwIip722ko0H5pvwH9RVe+kLRW/cov5fEP7CvSVDWGavCd8rDch1
         PAJldKp9+GaoaD4GlZSyzgOBX1l3WsEittJtnxb7fjLvZMro96hhkHEOXpKj1rPuOuLr
         GI9cZN3MczQzzXEEi8oB40Lb7wZMQusyOb7AlCYFA6sd5siKRMKWJjMBU+wx//9vWSfi
         ss4lr/8UgZXyXsSFEFnyIwmGLb5bjkP2pF6j6r0W0oD7J05MwHU5YVd90nF/LneqSJj0
         10Rw==
X-Forwarded-Encrypted: i=1; AHgh+RosByvM8RxIvSkZdVM6dQ9J0hzZUTNsUPCDs3eZR0EJz5I/fXJlTsnSkSmzjTCJt9TZQqIAE1w3uBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjMW4xvEQiQqxC/4tlCS3bzT6Obu6vrvS6+HLOCdUqWhhxZhE4
	NLbr7R3FasDGz2FUcq+18HnqdDCG9Mor9lyOCuBOJ8ydz6t9UbeycrxNn16+aLZE9ZM=
X-Gm-Gg: AfdE7cmlqHRtCwqH3hB8CnP9M8og3SFGOE4GPdYRgQjiWR4OuGI2Mizpb9+cQ+RBoG4
	WK+16W6BXdoXYyPTVp5rD9Z4MFP8DYPsjri2cXJKScynDXZ1bJh24j/26IX2tWsQGckH5UKQf0/
	e1OOYJ4x4jOn+OI7Zv8xm8/oeIWsq+M4k7aXGfol52hHBzpEsjCbtll/MlRFdSYArE28t0xMfDe
	m2OeiUE6cdq8BHJT8IVnVaXKPSGMsGwZtDlr3KelMC5uFjfDqRY6M/u2LQU04kEZ9DfyDpCqv9r
	HfKyNzDj8D34px82968HERT1xDtRLu32sdngDxOKtxK9U1ErMorDFw3Iq2p7pYjwdXFIkRKXL9U
	Ip1zVgh77qW1YUraSiZCPNAbOzMZT0x/qEzJhYwSgxLsAveIn6keqGThD8QpuczN1DH7+fyN+0g
	yqSXX9qA9ZWTCMOF/yMuVTFGDfwHAuGl33HNSvDuFzcoT6byLvHgJ74cLMEvtmlR0F9k/dZ/e4V
	QvTC4HWOVQa4evVobIqSv3auFl0azAqIU8f7G/7PkF9AwrNtmGScHWa/nU=
X-Received: by 2002:a5d:6543:0:b0:475:3a97:8e2c with SMTP id ffacd0b85a97d-47de66a4be0mr5128126f8f.16.1783438332496;
        Tue, 07 Jul 2026 08:32:12 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm40509231f8f.17.2026.07.07.08.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 08:32:12 -0700 (PDT)
Message-ID: <0dfe59c2-bf60-40fe-90e6-d6e1003709d0@suse.com>
Date: Tue, 7 Jul 2026 17:32:10 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] ppp: defer channel free to an RCU grace period to
 fix pppol2tp RX UAF
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Qingfang Deng <qingfang.deng@linux.dev>, Breno Leitao
 <leitao@debian.org>, Norbert Szetei <norbert@doyensec.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Taegu Ha <hataegu0826@gmail.com>, Kees Cook <kees@kernel.org>,
 linux-ppp@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guillaume Nault <gnault@redhat.com>, netdev@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 linux-modules@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
References: <D9C0245B-608B-4884-8A09-F55BA4A9F948@doyensec.com>
 <de2616b3-6edf-4255-ba77-0674e225ab27@linux.dev> <akfjpBVML_1RFF91@gmail.com>
 <87111f02-5b7a-4185-8364-2faba650578b@linux.dev>
 <20260706092926.PIlrhRKz@linutronix.de>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260706092926.PIlrhRKz@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-623-lists,linux-ppp=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bigeasy@linutronix.de,m:qingfang.deng@linux.dev,m:leitao@debian.org,m:norbert@doyensec.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hataegu0826@gmail.com,m:kees@kernel.org,m:linux-ppp@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gnault@redhat.com,m:netdev@vger.kernel.org,m:mcgrof@kernel.org,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:atomlin@atomlin.com,m:linux-modules@vger.kernel.org,m:paulmck@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[petr.pavlu@suse.com,linux-ppp@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.dev,debian.org,doyensec.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,vger.kernel.org,atomlin.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:from_mime,suse.com:dkim,suse.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9473C71D592

On 7/6/26 11:29 AM, Sebastian Andrzej Siewior wrote:
> + MODULE maintainer

+ Paul E. McKenney

> 
> On 2026-07-05 10:57:44 [+0800], Qingfang Deng wrote:
>> On 7/4/2026 at 12:32 AM, Breno Leitao wrote:
>>> On Fri, Jul 03, 2026 at 03:27:00PM +0800, Qingfang Deng wrote:
>>>> AI-review found an issue: https://sashiko.dev/#/patchset/D9C0245B-608B-4884-8A09-F55BA4A9F948%40doyensec.com
>>>>
>>>> An rcu_barrier() call is needed at the end of ppp_cleanup().
>>>
>>> I was initially unclear why rcu_barrier() would be necessary on a kfree path,
>>> but it appears to be required during module unload to ensure that
>>> ppp_release_channel_free() completes before the module's struct rcu_head is
>>> destroyed. Is that the correct understanding?
>>
>> It's required to ensure that all ppp_release_channel_free() callback
>> complete before the text segment of the module is unloaded.
> 
> So either a rcu_barrier() in ppp's module_exit() callback or a
> synchronize_rcu() instead of the call_rcu(). And all this because the
> module RCU callbacks pending which can be invoked after the module has
> been removed. There is a synchronize_rcu() during module exit but this
> is after the module code is gone.
> 
> I'm curious how many modules have a call_rcu() within their code but
> don't have anything to enforce its completion before module removal is
> complete? Wouldn't something like
> 
> 
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 46dd8d25a6058..8eae1ea2d6eb4 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -858,6 +858,9 @@ SYSCALL_DEFINE2(delete_module, const char __user *, name_user,
>  		goto out;
>  
>  	mutex_unlock(&module_mutex);
> +
> +	/* Ensure all rcu callbacks issued by the module have completed */
> +	rcu_barrier();
>  	/* Final destruction now no one is using it. */
>  	if (mod->exit != NULL)
>  		mod->exit();
> 
> make sense?

This is discussed in Documentation/RCU/rcubarrier.rst and
Documentation/RCU/Design/Requirements/Requirements.rst. The latter
contains:

| Loadable Modules
| ~~~~~~~~~~~~~~~~
| 
| The Linux kernel has loadable modules, and these modules can also be
| unloaded. After a given module has been unloaded, any attempt to call
| one of its functions results in a segmentation fault. The module-unload
| functions must therefore cancel any delayed calls to loadable-module
| functions, for example, any outstanding mod_timer() must be dealt
| with via timer_shutdown_sync() or similar.
| 
| Unfortunately, there is no way to cancel an RCU callback; once you
| invoke call_rcu(), the callback function is eventually going to be
| invoked, unless the system goes down first. Because it is normally
| considered socially irresponsible to crash the system in response to a
| module unload request, we need some other way to deal with in-flight RCU
| callbacks.
| 
| RCU therefore provides rcu_barrier(), which waits until all
| in-flight RCU callbacks have been invoked. If a module uses
| call_rcu(), its exit function should therefore prevent any future
| invocation of call_rcu(), then invoke rcu_barrier(). In theory,
| the underlying module-unload code could invoke rcu_barrier()
| unconditionally, but in practice this would incur unacceptable
| latencies.

I don't know if the last part about unacceptable latencies is still
relevant. I haven't done any measurements myself.

-- 
Thanks,
Petr

