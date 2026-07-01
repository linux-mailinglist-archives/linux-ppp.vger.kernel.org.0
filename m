Return-Path: <linux-ppp+bounces-610-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YvlxMIdWRWq3+goAu9opvQ
	(envelope-from <linux-ppp+bounces-610-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 01 Jul 2026 20:03:51 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A186F07DC
	for <lists+linux-ppp@lfdr.de>; Wed, 01 Jul 2026 20:03:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=doyensec.com header.s=google header.b=br9x+myF;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-610-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-ppp+bounces-610-lists+linux-ppp=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=doyensec.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D5603012CA0
	for <lists+linux-ppp@lfdr.de>; Wed,  1 Jul 2026 18:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6E04BCAD5;
	Wed,  1 Jul 2026 18:03:49 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5694380FC8
	for <linux-ppp@vger.kernel.org>; Wed,  1 Jul 2026 18:03:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782929029; cv=none; b=TK0DfexEc61/OnO8tJkjt5g6AQ+N5Rt+yYYYQlq/0hq4bQC/rbGC0cGoMF8CmkWsfr0T4JBqFekYltN1U7te4ky3GvblOwMmD+rNqbLtPTLD6JMX6H74m+ALTTJjgsWl0L5cpYwCwR+ka0/llubSL/badCTkrRqzQwQLJ6L18Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782929029; c=relaxed/simple;
	bh=tz42eNd6WagsuusT0g550uH1iQuPtwD0rcAzzXXjzGQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qq9XC6wIFTA4psZ3eRdaCs32uvP1pD6WUi3LN5Kw4xuf9GD2MHPA5nPm49tzo+UuNZ4VT5sDvauWRkbcPsnh4d/7iKkk0cu2NG8iViufQ1i0z+2ORXrqyaGpmZ0rEEJ8rOuPzNw8ZZZvnuZGawyjYURCfxIvAKZGaJJonDUNm/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=br9x+myF; arc=none smtp.client-ip=209.85.208.46
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-695f6438518so1485547a12.0
        for <linux-ppp@vger.kernel.org>; Wed, 01 Jul 2026 11:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1782929026; x=1783533826; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tz42eNd6WagsuusT0g550uH1iQuPtwD0rcAzzXXjzGQ=;
        b=br9x+myF9c7NZ0AEYfUsQcpEIWNbfamyuw6HHM+SIZDx8qgebdAhWM02lk107nIsoJ
         XOYVP27uIgC6Ji3T94WJ7G5uWgNYMbQH+CrD/nMRVTXqs9WsZUyQ7WsA7BTls5PLvoNS
         p3ve1xuSk24QqV0+KXEt3aq+WJ2+JNTvumVQDT54jjfHhsoi+T/BLeTD+qB5Na386YuW
         1CG+rQ+ES6ELNEqaC2UvGLKprJVpO0TzxNrLryG4BJOakC6iPTbDbWz3WS8zuqdHAvgt
         Of/4A8Ri+g1w0LCyv5CWyvm1BQsD7jpzubzXgFgMijwUN2jSGyD03fElGAgrtW9ARkyR
         L+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782929026; x=1783533826;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tz42eNd6WagsuusT0g550uH1iQuPtwD0rcAzzXXjzGQ=;
        b=J5/hRw+tJjDzFr8id5YA6zK2UBvHqrusdDZ0jaWvKihjz3XhAUDEUbc671Ulqhf0ce
         94R0o8FPImAAu7kW1NDIqfqe7sgYFogCNDGhVFib0aaVx2gBwznuTJisKmUe2v1cBLX0
         X/yi+LsdWwAEPEWg77BcXgNQMTWaTdTjO45Z9rWIRVnYoAohuK8hXSbaFTSUWh0JK0oz
         4ef8bWGR074M7I8vKH1DZSMR2urO7PxqKt0o6NGB4LRIagvgMCvAF84qbDfzPrYHktNr
         iXRUxahAhcdE3Vo+o86WJIaFpVuCjbaqVzd8beqUumQKhqhD+CO2KHfP/jhcxI6zeXfA
         FDcg==
X-Forwarded-Encrypted: i=1; AHgh+RqDguld2/g5zEqYaQ7kmRqVeNjjkUawWNzFM+XXhQfF3T5Td7hmwLa0omx38z3dGfhHbdyOpDfd8LE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm56VRV9tLI00gp8jLBSi7JQ3uC8B/5vOpi/E0yx8UJ/9mRDh3
	iwSLJmKF3sb+cXtBLFBUutQtQa0YiY+9VIhBtMB7sKHVhWTM8/vzxR0Ha8PienoVc0Q=
X-Gm-Gg: AfdE7ckoa27XouGyas7NwkJJVOMpd+zHhoiWxf0yQEhBLa6CRqJoTKtLQhTAeCopeah
	k+r2l51T+Od71EvVG3icRdX5IZLBbUm+k04KrrxJtMPma8jo1HR11fhFIxkN1oK5WTcDS8e/gSr
	g/qaKbVcMt6wb1PxizKvaiYGStga2D0opGbdHlF48Wug4L8UPmy2WVHEq3An1FJUX6eb0Bd/aP+
	ItYvg7Z17mEBvGbDoNR3PS14/gPAfNa+hGdFRMYkZZTi21A9Plme8gC8Mhi6h7gH4oPptgn39v0
	KESo8Xpn+gAqfFTCLmyi7f5YpEzmmcymvyZH7dhp5w97suXLd6yxlx21XcA1X4Rocj21NN+InA6
	gxLW0y5nuJz6HSBgun2qm2hpkZolHTe3yEswEPKZHE6FE4TZIOGmiFCcJJGV1Q5R4gjz5swl88z
	Psx4e/mhTwclTawkXWMqJx8CaUL4TtbG+J8GaUiSYk1/3tJvoensnauvZg7KYsRuCpRT0pyYqAq
	QkO+3mRbn1tIJUGQWGI77LrBzTIoEQu4mXfrasN/ZS833miXqOb4dWl+/USJRh9/A==
X-Received: by 2002:a05:6402:1ec5:b0:697:e8e1:d3c0 with SMTP id 4fb4d7f45d1cf-698a2c5fe57mr972033a12.2.1782929026374;
        Wed, 01 Jul 2026 11:03:46 -0700 (PDT)
Received: from smtpclient.apple (83.10.35.68.ipv4.supernova.orange.pl. [83.10.35.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c93cb51sm3094335a12.14.2026.07.01.11.03.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Jul 2026 11:03:45 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH net] ppp: defer channel free to an RCU grace period to fix
 pppol2tp RX UAF
From: Norbert Szetei <norbert@doyensec.com>
In-Reply-To: <20260701132552.nFP2AZrJ@linutronix.de>
Date: Wed, 1 Jul 2026 20:03:33 +0200
Cc: netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Qingfang Deng <qingfang.deng@linux.dev>,
 Taegu Ha <hataegu0826@gmail.com>,
 Yue Haibing <yuehaibing@huawei.com>,
 Kees Cook <kees@kernel.org>,
 linux-ppp@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <BC7EE0DB-AA40-4E26-A7BB-002961F75B3B@doyensec.com>
References: <C954A7EA-AA98-4E3C-80B5-42C34B3183A3@doyensec.com>
 <20260701132552.nFP2AZrJ@linutronix.de>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[doyensec.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[doyensec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-610-lists,linux-ppp=lfdr.de];
	FORGED_SENDER(0.00)[norbert@doyensec.com,linux-ppp@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:qingfang.deng@linux.dev,m:hataegu0826@gmail.com,m:yuehaibing@huawei.com,m:kees@kernel.org,m:linux-ppp@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bigeasy@linutronix.de,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linux.dev,gmail.com,huawei.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[norbert@doyensec.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[doyensec.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,doyensec.com:dkim,doyensec.com:mid,doyensec.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linutronix.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36A186F07DC

On Jul 1, 2026, at 15:25, Sebastian Andrzej Siewior =
<bigeasy@linutronix.de> wrote:
>=20
> On 2026-07-01 14:14:39 [+0200], Norbert Szetei wrote:
>> --- a/drivers/net/ppp/ppp_generic.c
>> +++ b/drivers/net/ppp/ppp_generic.c
>> @@ -184,6 +184,7 @@ struct channel {
>> struct list_head clist; /* link in list of channels per unit */
>> spinlock_t upl; /* protects `ppp' and 'bridge' */
>> struct channel __rcu *bridge; /* "bridged" ppp channel */
>> + struct rcu_head rcu; /* for RCU-deferred free of the channel */
>> #ifdef CONFIG_PPP_MULTILINK
>> u8 avail; /* flag used in multilink stuff */
>> u8 had_frag; /* >=3D 1 fragments have been sent */
>> @@ -3583,7 +3584,7 @@ static void ppp_release_channel(struct channel =
*pch)
>> }
>> skb_queue_purge(&pch->file.xq);
>> skb_queue_purge(&pch->file.rq);
>> - kfree(pch);
>> + kfree_rcu(pch, rcu);
>=20
> =46rom looking at ppp_input(), what ensures that the skb in-flight is =
not
> added skb_queue which is purged above?

Good catch, purging before the free races an in-flight ppp_input() and
leaks the skb, confirmed with kmemleak. In v2 I moved the purge into the
call_rcu() callback so it runs after the grace period.

N.

>=20
>> }
>=20
> Sebastian


