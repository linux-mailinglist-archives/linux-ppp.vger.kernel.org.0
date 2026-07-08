Return-Path: <linux-ppp+bounces-628-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XCGKBD1MTmp4KQIAu9opvQ
	(envelope-from <linux-ppp+bounces-628-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Jul 2026 15:10:21 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48725726A23
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Jul 2026 15:10:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=YI5qyFe7;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-628-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-ppp+bounces-628-lists+linux-ppp=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95052305EE14
	for <lists+linux-ppp@lfdr.de>; Wed,  8 Jul 2026 13:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E917424887E;
	Wed,  8 Jul 2026 13:04:36 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE1E2D7BF
	for <linux-ppp@vger.kernel.org>; Wed,  8 Jul 2026 13:04:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515876; cv=none; b=QnpzrZ93pm0p2pkK5RYhlWtN/uh2MF1PwtS5gOL56J2oyEH8I0VNl/j6XwnFXxTLHCDxa2UMiHSJA0kFoixgk9mMRUsC38MyGoQIvRbZgU+EBJZSXAt/JNAyAvG+u1GLU94Yt3oXzVixvYsf3q/DdMRQpOoPlhBKY4iTfurEKvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515876; c=relaxed/simple;
	bh=TPmuL1ero5zv+WHjvwHCf1loe950mWpRMqA8MpPKYCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U/4pFbBKuHtjzhXPpMVECsn/bI5sg0hEPSAEdSAuJVwe9564rpJDfjnctUqA2wh611+Uzz+Bbav08L1OToiVPcFpzx+0X7bwZ4I2vPkbyWz0qr0BIdtgey7n7C4aCJwg2vDfWtEwbsPRdwMZmeuDYWWTP8IAFgwGO62n4/w/FSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YI5qyFe7; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b1710405so4192315e9.2
        for <linux-ppp@vger.kernel.org>; Wed, 08 Jul 2026 06:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783515874; x=1784120674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/x6FSTkcJjBlea16+XEShOIorxoX9U0UFrtSrJcffgE=;
        b=YI5qyFe7tEZCsTz+ih+tFtd+C3xTfwWeqycM/atEgEyS4s3WQrW1tcxy2wWjQiAnyC
         DVAmhSUTaATJhG3Xamh6PbUYXiNIfpiJSLubeZgNA6DL6pRWX50q2PH6N30QWYwK+6ck
         YdKmwW7rlplvz4gDEaNdNQkJMA5RZ96NttJcgrvjGAkS1TUsVsis9HNQBu0hTHYR4Bqw
         pxWoLy1ymZsRqVNq90byKnqIHs7P81KZsdbX23mcR74L7nOhnf1ZPqiPnTK+vYe4yixN
         Fo3QuZyYWpq/Hry7rA/ahUiL7o6p9CY3LR1tfPDdx9ZJO/szkd0SLw7zYmNPBFpzfiZ9
         isNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515874; x=1784120674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/x6FSTkcJjBlea16+XEShOIorxoX9U0UFrtSrJcffgE=;
        b=aWW1jLb3vcNr+e4R22iEnOeCshfWjt0Ka5oWl4XB9qPpOtkoyZetIoxm8VPvO9mbYC
         YCtcU+0TDZJcjm2Hfc0Tq5aolJDX6sbnk6SoqIMyQo6AVVU4E4ydOoBgfg6229n1ApKW
         HWrFJ7Qxh0k/xEWT+zFlYBJooxa8sxoBwAfIBMaqL6MA5xPWUHO/khmMcGX/MXljYYFG
         40iASM3dNvWA4JJkftLhoq1Y+7wf3+6becV0YR+j/2nR8N+8yacShGJ8MlRnteySiSx1
         M24X5KNLebbprZKEpfPaqsUQ7Sg3HNgq1c+4hsEbaqpQwipnA1A58ZYB0OJ2bMQGdkCo
         8OmQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5q/bkU6BHQu2jyHq9Jtu2mD2cn7q0xjgWjwhCdugdObnnbejA9QpRK4sTpUAsdiUfIkFrX3wLNr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxsvTt+zYoZQnqiNvzj/LU5jDi1Mn1AJ1QPl2BzhRSXw/838kb
	KR0P9WcwZx8ZAmQEcKBhLiMqMa45AgcaXiMbJLC3ObGY2uVIZz39bwgQRk9ucPWiOzY=
X-Gm-Gg: AfdE7cnQZFfGbIwRs9r2kSLNvbzIoJHRR3aKZpLrC7X+VAlmGZhZ3RltAAT/zUFphDw
	SKaVk4SYsY45XnSoyULC3LNcVD+NymfamudYxyGVhcb1PFQ2zZvQe16EEjJBUq7/a4WvHWRblEn
	kat0X3Q7WybF9hhP1vH1d6j4QcpmoXb1gDKNmtCmn7CWn/wZUpPtq8KXea16JUEXHF1XpK69ZRG
	2FjjWS5Sx7Pv4Rkf8YaizBGi4x5MigPxLV0cD8fEMIcp7lGBC6vSu+Vp5RUVO0x3rRpnbI4JuNn
	Y/3bvHBGvBjiquxIAuJZF91umQydv3xxBPb+zWOdcUYxYuY6SSqns0vWv29WAUyKsVPeuaW/izH
	JEoLCZpXZ4/DI695FirWBqbHmPNTlaataW5t5Qoo28aVoPawHLDqQNUo1gLfrqlVzf1p7Jr5cEw
	WrBtUFr6SL2SIHNs+Y6K3xCPCBJCjBgTuVhBFSARVzuMpR
X-Received: by 2002:a05:600c:1da8:b0:492:63c3:8eeb with SMTP id 5b1f17b1804b1-493e687cb4amr21521735e9.35.1783515873732;
        Wed, 08 Jul 2026 06:04:33 -0700 (PDT)
Received: from [192.168.42.79] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f4e3afsm158975915e9.7.2026.07.08.06.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:04:33 -0700 (PDT)
Message-ID: <bef05178-4856-4b62-9c3b-62bf636c239d@suse.com>
Date: Wed, 8 Jul 2026 15:04:32 +0200
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
 <0dfe59c2-bf60-40fe-90e6-d6e1003709d0@suse.com>
 <20260708074904.xnpi0mlh@linutronix.de>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260708074904.xnpi0mlh@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.dev,debian.org,doyensec.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,vger.kernel.org,atomlin.com];
	TAGGED_FROM(0.00)[bounces-628-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[petr.pavlu@suse.com,linux-ppp@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bigeasy@linutronix.de,m:qingfang.deng@linux.dev,m:leitao@debian.org,m:norbert@doyensec.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hataegu0826@gmail.com,m:kees@kernel.org,m:linux-ppp@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gnault@redhat.com,m:netdev@vger.kernel.org,m:mcgrof@kernel.org,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:atomlin@atomlin.com,m:linux-modules@vger.kernel.org,m:paulmck@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48725726A23

On 7/8/26 9:49 AM, Sebastian Andrzej Siewior wrote:
> On 2026-07-07 17:32:10 [+0200], Petr Pavlu wrote:
>>> --- a/kernel/module/main.c
>>> +++ b/kernel/module/main.c
>>> @@ -858,6 +858,9 @@ SYSCALL_DEFINE2(delete_module, const char __user *, name_user,
>>>  		goto out;
>>>  
>>>  	mutex_unlock(&module_mutex);
>>> +
>>> +	/* Ensure all rcu callbacks issued by the module have completed */
>>> +	rcu_barrier();
>>>  	/* Final destruction now no one is using it. */
>>>  	if (mod->exit != NULL)
>>>  		mod->exit();
>>>
>>> make sense?
>>
>> This is discussed in Documentation/RCU/rcubarrier.rst and
>> Documentation/RCU/Design/Requirements/Requirements.rst. The latter
>> contains:
> 
> I am aware of this. It is just not the first time I stumble about this.
> But maybe with the AI review these days there won't be a miss.
> 
>> I don't know if the last part about unacceptable latencies is still
>> relevant. I haven't done any measurements myself.
> 
> There is a synchronize_rcu() later on. I think I could replace it with a
> call_rcu() so we might end up even. I was thinking about about it last
> time I was touching modules but somehow I stopped where I stopped.
> The question is just, is it worth doing it or is it reasonable to expect
> that it is done correctly.

As RCU usage in modules is now more common, I see an argument for the
module loader to invoke rcu_barrier() during module unload to make RCU
usage easier. In general, module unloading is a rare operation, so even
if it becomes somewhat slower, I don't expect it to be a significant
issue.

One problem is that I'm not sure where the new rcu_barrier() call should
be placed. The prototype adds it before calling the module's exit
function. Would this actually fit all modules? From a quick look, I can
see that various modules call it at different points during their exit.

-- 
Thanks,
Petr

