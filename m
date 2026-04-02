Return-Path: <linux-ppp+bounces-481-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II2SGoVSzmmEmwYAu9opvQ
	(envelope-from <linux-ppp+bounces-481-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 13:27:01 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A363884EB
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 13:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6BA830EAD44
	for <lists+linux-ppp@lfdr.de>; Thu,  2 Apr 2026 11:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7993CCFC6;
	Thu,  2 Apr 2026 11:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HBBnWrG6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KyQoorG1"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDAB3C944D
	for <linux-ppp@vger.kernel.org>; Thu,  2 Apr 2026 11:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775128660; cv=none; b=XMIwHO33fIkqWlYcTGxx65sa//KNev6t7iPxQqzE7XkfqErXrLuY74vszqHTr7wYg4UV13hVi+UCCzp35xs4TRzxFAVC+IsyS9RmdnLPBuHJVnRG//gcqu1/U1FzndmakvES6qphB7zRIld3lVaU/MQf+D2JcyLFbMLdRT64e9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775128660; c=relaxed/simple;
	bh=GWWUAnMaoAnXvUfbVWwutVCS6bQJQeajr3pFkbiEsfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGtJSER1Kc3Nf2OIvoCArlOC/emvL595Dah9SKNhHatcdwFnTrvw+Wuf/Nykudkht5cPHkf4bGYjsdT0Gn2Tn7M6vNjbYkCFizZB3fbl6n8YX6hTNC7hhtfA4hrelKDKm4UOZ6P30dXvgXzwS4UeotpgMezaMaelwUkH7k8/fbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HBBnWrG6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KyQoorG1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775128654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8eKcE5S57vmQb8/l9YcFNLF3LkeSC2enqXF3R6bEYVk=;
	b=HBBnWrG6g5cze9nuBRTIxklGsHAA+aevWeuCrX2JcndhRr0+FDHRLpAppEw27cIjyAhnaM
	Jh9+jh0sElQDeJ/pITSsnTDOosZSvE8nUaKziWPmolwpscgfr5Xfa0wdJH0Y0mjTWEhOvp
	E+2T3RCItZX4rzJUIdYUP3a89mZGRkk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-cl6E1fk2M5SSe1busJyijQ-1; Thu, 02 Apr 2026 07:17:33 -0400
X-MC-Unique: cl6E1fk2M5SSe1busJyijQ-1
X-Mimecast-MFC-AGG-ID: cl6E1fk2M5SSe1busJyijQ_1775128652
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4871fc50fe7so11375405e9.0
        for <linux-ppp@vger.kernel.org>; Thu, 02 Apr 2026 04:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775128652; x=1775733452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8eKcE5S57vmQb8/l9YcFNLF3LkeSC2enqXF3R6bEYVk=;
        b=KyQoorG1szluKpdf511A5DSC6k/YSoUZqE8RL4iYjmG4bwEXm1vEFSkUI26q7PipNs
         walVn28m5mX9uJw4Wq3Cvm9WHCTgSnBsNbdaptBogTEweNPpXAH32v90318Up3ab0pPH
         aFKqHlXYvtvrbZJVf4JJ7QlHZIX0CImLqgxKD2qq7kvYl62gQLEmBF0YtXkdQOPCJLdf
         Lw0X8ipzsOPJAQF+oBhOxz1tluuHEpFcoMpB/8qIpjgX49RBW61FR8YjMqxafXVlTqbg
         xq1FpOKIEHbqMMqtIkZ/QIiiIUylylFwFcJJo2CcykRuv5TN7vk8O+UD5YRWoXNSgJY3
         FkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775128652; x=1775733452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8eKcE5S57vmQb8/l9YcFNLF3LkeSC2enqXF3R6bEYVk=;
        b=irAM5Sobnn0RpkPcxYikdKjeVvzJisPjcS+0vyHeTJtGCWmqyyb+ZIadS32DMekUub
         AKyKLNacX0btKpa9mtMr/K9lsNddjeBgUf+ISj0V7ozVRLHLn6LnF9Xn2bUNtDAx4qtO
         2xfSdFeCdPHRgdJs2ypOmD2L0iLVYekBDcBvim9gxmRgxFKaMWGsKlY31Wl5n20gMtWL
         oJ//QPGAdnZdrlX1WOKvtynypIFgyVvJIaA9lK+v61BOWX9K48JPSC1vdgy+vEf8dHlU
         TaMySqy7Z6niQ6KjfTqJCWNxIK0UeYH2faveD6Z8GpN2kcJanojioiApCkjjGXg3eNT+
         Blcw==
X-Forwarded-Encrypted: i=1; AJvYcCUIIgdCGCEZg25FH68I3k+mLvSYekP2TUKWE++3qZRO8xk9VYKuYBSIoO1Zi0J50N0AxeUEDe9ERTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEzb6wem0nYJAFEyHW227E0SDiolrAqxQ3FOSkyB3n4liD0sGI
	baKEePlUfMwPwD41dozDvCj0Z2N5pGK5DxIRGm1TcWTlywpiqSwIyg1/yVyDME3bl3512UKZ1Bg
	tLgqyWpjOiYwmqmSud3O/ueJQPPko/aUIEwRI9xXtxIg1/mPe4o5vIpaJMWmXuA==
X-Gm-Gg: ATEYQzyj3vq1xqJg5BMUoi9KIi+TERdPn2XlXxm+Z+5JEa9wXWmdWH7ujUBBp/gTQtC
	zIEKrUei9P2r/WdizTaTQg58GCjrcLpDk9KK/+tMt3Xr2H4Yni/wJjwuE3DU6vjbBT56Cns+JB+
	bG/htMGtj/pVVut15CWzM0lusNl9ynlN7yfziwOoeDEZXvN4VchzMQNKVuMwFc0z0+xwpT/eoTm
	bV8IKQXVG10JjINuK/kTyk6CPGSiUopzU6p2MIIS2RYiQvgsEUp4F0O33pmwzg+rx6qKNUBVg5r
	D6ezNMvxdXHcXfI/+xBAFr0TJFXy1fH3k6LOB36yvKssKD8kb9uH1hzOp4wo6kxeVtAiT9s6qv8
	zxqw73WUCHBZzHEBcj6mKNQD8aHxz18vaKpRAqTNBY1kePC5SIWKQ95rBzw==
X-Received: by 2002:a05:600c:4f95:b0:485:7f02:afd5 with SMTP id 5b1f17b1804b1-48883568005mr124877655e9.13.1775128652105;
        Thu, 02 Apr 2026 04:17:32 -0700 (PDT)
X-Received: by 2002:a05:600c:4f95:b0:485:7f02:afd5 with SMTP id 5b1f17b1804b1-48883568005mr124876705e9.13.1775128651550;
        Thu, 02 Apr 2026 04:17:31 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887ad477f6sm64087705e9.7.2026.04.02.04.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 04:17:31 -0700 (PDT)
Message-ID: <cb43761b-d414-4878-bf41-4ef6c988f881@redhat.com>
Date: Thu, 2 Apr 2026 13:17:29 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7] selftests: net: add tests for PPP
To: Qingfang Deng <dqfext@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Dianne Skoll <dianne@skoll.ca>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Felix Maurer <fmaurer@redhat.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
 Jaco Kroon <jaco@uls.co.za>
References: <20260330035604.133073-1-dqfext@gmail.com>
 <20260401081030.29b050d5@kernel.org>
 <CALW65jahWApDnVmFReW+Y3HDxBEmCwzsT1oyh03SW7X5ry6PzA@mail.gmail.com>
 <20260401175621.549c492e@kernel.org>
 <CALW65jaTbaosbO8ypKZ6G37HxuxXabeTaP_Fhq72xTovmDj+8g@mail.gmail.com>
 <50ae3c69-2c4e-499f-a46a-cbd207ff5f09@redhat.com>
 <CALW65ja1FV-OcqSazgKZhQhKf3oqr=kcGxyGkOGbhurGLOJ0-w@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CALW65ja1FV-OcqSazgKZhQhKf3oqr=kcGxyGkOGbhurGLOJ0-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-481-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-ppp@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-ppp];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D1A363884EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 12:13 PM, Qingfang Deng wrote:
> On Thu, Apr 2, 2026 at 5:48 PM Paolo Abeni <pabeni@redhat.com> wrote:
>> Note that similar failures in the past in other test-cases were usually
>> due to timing issues. i.e. the pppoe-server starts in background too
>> late for the client.
> 
> I don't think it is a timing issue, otherwise the PADI negotiation
> won't succeed. The "updetach" option on the client side also make it
> wait for the negotiation.
> It's likely that the pppd instance spawned by pppoe-server fails to
> find the "rp-pppoe.so" plugin, so the connection fails when handing
> off the session from pppoe-server to pppd. Note the naming difference:
> the client loads "pppoe.so", while the server loads "rp-pppoe.so" by
> default.
> 
> What distro do you run CI tests on? On Ubuntu 24.04, "rp-pppoe.so" is
> a symlink to "pppoe.so" in apt package "ppp". Maybe an additional
> package is required for the distro you use, or I may work around that
> by manually creating the symlink.

It's fedora 43 with ppp and pppoe installed.

ppp provides pppoe.so, and AFAICS nothink provides rp-pppoe.so, and the
pppoe-server is looking for a non existing /etc/ppp/plugins/rp-pppoe.so
plugin.

Before I mess with the nipa testbed, could you please double check that

ln -n /usr/lib64/pppd/2.5.1/pppoe.so /etc/ppp/plugins/rp-pppoe.so

should solve?

Thanks,

Paolo


