Return-Path: <linux-ppp+bounces-390-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONudCLw+jGlyjwAAu9opvQ
	(envelope-from <linux-ppp+bounces-390-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Feb 2026 09:33:00 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDD5122444
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Feb 2026 09:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A63943014C30
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Feb 2026 08:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587F12E975E;
	Wed, 11 Feb 2026 08:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="EYTxgERk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="o1gALQqu"
X-Original-To: linux-ppp@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9526F2737FC;
	Wed, 11 Feb 2026 08:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770798774; cv=none; b=S0YEdtTJsBAv5EgvENVNHtUFRA4WkOdCMYTlsotZUrtEUxrkm+RdeRMfjcMr6H5NWbm+ovGLDoVSm2Y9Dh46Ta3K/tKvLg2ED/l1eKtpaSwRXRReijSQ4UDgAIFCQpraHV11HV9d9PUNA6IDyIOLNwWR1l+PEE5EsiRrL1hVFKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770798774; c=relaxed/simple;
	bh=AILsWZx4HmHcXg1ezQ5TGFjduY4SHUoTGWvqhTl/ENM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=cnR+Zf4vxPSPF0KVTykNpjGgCvZIixydUU7tOXB2OAUpWDGpEXj0ypyNcBOsIZcPrvAyTBWxj44p54nxxb0KwNH7SPvXqYACNCr9nrqxJ3NKlNSbRPySPxf4+47vqtyldFbV69Kv5QTOiqq19tOhvfOwNyuc3CDf9foAMKdXs6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=EYTxgERk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=o1gALQqu; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 136E67A00F1;
	Wed, 11 Feb 2026 03:32:51 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 11 Feb 2026 03:32:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770798770;
	 x=1770885170; bh=KfKZXztZzEKWBYQ9IdAKi7p9+N5NJo40HjWouwxX6W4=; b=
	EYTxgERkhAKHSiEBQ0TfmcxFSyHksth87X/xIje+8OzVf22392gFAv7HaRczKL23
	jBnxV6PrIN4tu6QmxXADOE2MAMsipYMEMmZSC80ArCWiI27toBTp3mZ8miuJl7aE
	SU3HLkhaj3n4gGNKD390rtzTNqOm+W+LlNQxUps+ksR+3rICZrwaQr8wPH0lrx4E
	ZOq6QUZfCkjsUCedDSPKoo5e0mvlpL0TFzLHuow28YG4m4GZsr/3zP/sLsHVtl9z
	7wLCvoWDHVXAiADTI6KU2q+XDibxo7RHdK9JqcZZUbgihG9ldLVCnZy8l8MqQXWB
	RKywim/g/29Mvr5IOmJRXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770798770; x=
	1770885170; bh=KfKZXztZzEKWBYQ9IdAKi7p9+N5NJo40HjWouwxX6W4=; b=o
	1gALQquuQ8EMKdBXNxfZegBl7MNUmz9bIpF1e7yYJzMfUeEFALtw1J7bDUMg08Cn
	6Mk2uVbcfG9bvbhgNfv6Q0k1Jfdvrx/gqLM9cb0h2cWlY1k3ZAq3OPWH6LKV0qK8
	p8jGhfIsrmhkumNasIE99rm7r4X84SVp2xQJP9XoAWWa/Iv+BxH1dNeIDax5z8JG
	/ADRqPLleEMF+ZLU4O4G6ZrkggDpnly8F8WL12+yOYblDkiOm79LKmQ90jQXZrg9
	oYEbXCbw7fEwOKPfDgpqbbWsvYLTbAtFCvooraKHq3wi1piyFxeCiy6MEm3mIk2Y
	gmYMnkvhMDhcR568bwE8Q==
X-ME-Sender: <xms:sT6MaRAWxPFgvvSpDqIM0CGNq7DuKYfSSAbwcEcDG4kloESVLQgi1Q>
    <xme:sT6MaaWYni6_6bGu3XOzbkzqdhB0XaMYTwBqlvv559xqi_SlKLudUD0ps3kTF9wtM
    kZS1Zhndv5jn5V8W_qA6XEpsolm1WoStKZXFd-Xv-clGG0eZb0udrPY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtddvtdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudelpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoh
    epmhhoshhtrhhofihssegvrghrthhhlhhinhhkrdhnvghtpdhrtghpthhtohepughqfhgv
    gihtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhoshhtrhhofihssehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphht
    thhopehjtghhrghpmhgrnheskhgrthgrlhhigidrtghomhdprhgtphhtthhopehhohhrmh
    hssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprhhpqdhpphhpohgvsehlihhsthhsrdhskhholhhlrdgtrg
X-ME-Proxy: <xmx:sT6MaXY7_0Q3_qB62AofB30zhMvmrNiCiRzd2gtr3c2YYE5KNWl7IQ>
    <xmx:sT6MabQsslGT0W7f0DFQy7ndHCwQSwH1OJnQZTOU9qUkERM3oQZzfQ>
    <xmx:sT6MaSgJQ147H_Lv7e65OOHiEkHrVOJjO-ka00hfGmv5LYTjcnQrAw>
    <xmx:sT6Mae4kqFkXIjzDscpSL1RtUiOOIxO0znp_R6IPjuo_bCYOQsPzyg>
    <xmx:sj6Mae47OvTCC4h9so1bMhCKD3zLDAEQww1A4-koummy0ngLrosRyxt1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 69455700069; Wed, 11 Feb 2026 03:32:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AikMT1CdWetc
Date: Wed, 11 Feb 2026 09:32:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Qingfang Deng" <dqfext@gmail.com>, linux-ppp@vger.kernel.org,
 rp-pppoe@lists.skoll.ca, "Michal Ostrowski" <mostrows@earthlink.net>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "James Chapman" <jchapman@katalix.com>,
 "Simon Horman" <horms@kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Cc: "Michal Ostrowski" <mostrows@gmail.com>, "Dianne Skoll" <dianne@skoll.ca>,
 "Paul Mackerras" <paulus@ozlabs.org>, "Jaco Kroon" <jaco@uls.co.za>,
 "James Carlson" <carlsonj@workingcode.com>,
 "Guillaume Nault" <gnault@redhat.com>
Message-Id: <67c6125f-99e9-4a58-ba18-8a2a93e29b54@app.fastmail.com>
In-Reply-To: <20260211075547.138904-1-dqfext@gmail.com>
References: <20260211075547.138904-1-dqfext@gmail.com>
Subject: Re: [PATCH RFC net-next] pppoe: remove unused kernel-mode relay support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,lists.skoll.ca,earthlink.net,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,katalix.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-390-lists,linux-ppp=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-ppp@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,skoll.ca,ozlabs.org,uls.co.za,workingcode.com,redhat.com];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,arndb.de:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7CDD5122444
X-Rspamd-Action: no action

On Wed, Feb 11, 2026, at 08:55, Qingfang Deng wrote:

> -#ifdef CONFIG_COMPAT
> -int pppox_compat_ioctl(struct socket *sock, unsigned int cmd, unsigned 
> long arg)
> -{
> -	if (cmd == PPPOEIOCSFWD32)
> -		cmd = PPPOEIOCSFWD;
> -
> -	return pppox_ioctl(sock, cmd, (unsigned long)compat_ptr(arg));
> -}
> -
> -EXPORT_SYMBOL(pppox_compat_ioctl);
> -#endif

This will lose all compat ioctl support, not just the emulation for
PPPOEIOCSFWD.

      Arnd

