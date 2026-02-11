Return-Path: <linux-ppp+bounces-392-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM/ODCZIjGkHkgAAu9opvQ
	(envelope-from <linux-ppp+bounces-392-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Feb 2026 10:13:10 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC9D1229BE
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Feb 2026 10:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0ABAB3082E07
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Feb 2026 09:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190643563E3;
	Wed, 11 Feb 2026 09:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="fPBlTprV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cJQJ3Njb"
X-Original-To: linux-ppp@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE413559FB;
	Wed, 11 Feb 2026 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770801114; cv=none; b=bnonhHeu3n2+4rJfY9U3qPvhFbYb8hxPyLUZbMVp4uSRHFNvnYM47FICgOxoa2mY1AyjJgRcVSHoNqdvYwtpjGhwjzl4p91UAUZcYWEmISSfDjtN2Ec611Bh/tG5SIU7EBu875hqy19ZT5bOs6zbSC0awFav1NuG7rTc7K9rN58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770801114; c=relaxed/simple;
	bh=usiuiY/UZumlaGlEHPYt3VMCduDlCRB5MqXL/uUT18o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jEuIbdnY0NgleBCaoGMICVIOzA7Qx+AQ8m6vR1VdhH5XLxkETrSc/PrT0GiUqmjDLsGyUCM3GijrPDWvit1Li4nNMrvHA1h78IHoVdqW2QLPBku5bvSngoXkXOXUBf0lAx8iN2WrQxRsNeQYrTq1BP6gajCG+AlMOUIjX5cCtN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=fPBlTprV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cJQJ3Njb; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 6666C1D00125;
	Wed, 11 Feb 2026 04:11:51 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 11 Feb 2026 04:11:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770801111;
	 x=1770887511; bh=wrpx7nWVF4UPAzz8Jf7jimHknmN3I9L6EF8AGKckewA=; b=
	fPBlTprVMJAbkdx41pYHA/05c6YoEfS5f+iA4C1NY7PDZb6g+0+GekJ54SETGiEh
	d0MqT3S/Fzw5YzX9AvQq4DT3jlvM2uxMpUVNmSbdZ2uFgu3v72qs1aHqMY1UH3YU
	vphX3S5UZ0FDBmlfpd12vBftEAKlsnnuOf7JaMduhbvCUHflMXWvZhm8qeXMwz56
	L9MWLTh8rZC9Bo9nTJgZ7I43QgiALVe6OlUqvezbK5p3WFMC/GuABMc/uu0wntK0
	QF1yHHN16dKaVgvkjy+AYC0lXhWWksv8SHlS+/KCgZBK4/vRR76wOEKrJPReOdCn
	yemPsJo4euLtM0Vo01SbBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770801111; x=
	1770887511; bh=wrpx7nWVF4UPAzz8Jf7jimHknmN3I9L6EF8AGKckewA=; b=c
	JQJ3Njbx0mIPhuP4k5bjthJNl0eu1pzbMrxZCmQHb0d4baHxcm6F+sRwaSR3Inew
	3HvKxcU+E131FMK2AKWwGbMMUOzEmYoKxMY8DSXv0DnVnZ+TPfLGuCnBHEu5x3n9
	ZkNLkYGRxSfBWW111Xtc3b8ben/zP2WFF5aBELQxq9zxrApJmc0gcy+KNtIYThfH
	g0LtORZqj5NLiXnhcPUqfvtEAcYyJqlY82rnR/2tpBFntNNJTzzaZ0TduxKpehwf
	Jm2/vxGloEzWmY4uS9p99jCYAS5+hzudvJsZw4/tZ2br4mhR5qSNUI+YXfQTkMf6
	5mQLSl1TZQdGajSjzLQhQ==
X-ME-Sender: <xms:1UeMaS1g-721xcxmyNCANKcC9gnT_Tlgblu2xpBCBi7XZTNBB3Lxbw>
    <xme:1UeMaf40e0e8GcJ1T14NeaVhwPB2N0j1Mm3Ox5Y0BYy4ZtKBJ5E6lHnvoZde2Y5lq
    71smEO-7m_70Q6eoOiU4FBWcJ_P5eotQ8FjAkDdb04f7-jTgqbV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtddvudeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudekpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoh
    epughqfhgvgihtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhoshhtrhhofihssehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomh
    dprhgtphhtthhopehjtghhrghpmhgrnheskhgrthgrlhhigidrtghomhdprhgtphhtthho
    pehhohhrmhhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkuhgsrgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprhhpqdhpphhpohgvsehlihhsthhsrdhskhholhhlrdgt
    rgdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghh
X-ME-Proxy: <xmx:1keMaVdC8z5dQWT6YQ6Z9pY4ESm4A_TIy5zzp10wb8fDe1VCFv3E2Q>
    <xmx:1keMabIfWPnfjIjs5zdyYpmExTHc4gktzsqX55RF0sHohZggnk71rg>
    <xmx:1keMaVt0vQBV1dt1Mulz2o92OkrI_6MmrHtJDrZrF_wmTITglqDfmw>
    <xmx:1keMaVaq-8mC20L25QDxAxOLmGf7FkABAi5tHT_eJ7UYDko0tgJqww>
    <xmx:10eMaSCyCbTVULNK51L-AwWh6mCYLbiwqUWBhjjq9crUxdYcZsfwCraG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DAC6E700065; Wed, 11 Feb 2026 04:11:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AikMT1CdWetc
Date: Wed, 11 Feb 2026 10:11:29 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Qingfang Deng" <dqfext@gmail.com>
Cc: linux-ppp@vger.kernel.org, rp-pppoe@lists.skoll.ca,
 "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "James Chapman" <jchapman@katalix.com>,
 "Simon Horman" <horms@kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "Michal Ostrowski" <mostrows@gmail.com>,
 "Dianne Skoll" <dianne@skoll.ca>, "Paul Mackerras" <paulus@ozlabs.org>,
 "Jaco Kroon" <jaco@uls.co.za>, "James Carlson" <carlsonj@workingcode.com>,
 "Guillaume Nault" <gnault@redhat.com>
Message-Id: <5bcf374e-1259-4f0f-b9a1-d405d522effc@app.fastmail.com>
In-Reply-To: 
 <CALW65ja3sumAh3uzD3W=n=3Rk0J7EDtcpbvdaG6+F2y2dFUp2Q@mail.gmail.com>
References: <20260211075547.138904-1-dqfext@gmail.com>
 <67c6125f-99e9-4a58-ba18-8a2a93e29b54@app.fastmail.com>
 <CALW65ja3sumAh3uzD3W=n=3Rk0J7EDtcpbvdaG6+F2y2dFUp2Q@mail.gmail.com>
Subject: Re: [PATCH RFC net-next] pppoe: remove unused kernel-mode relay support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-392-lists,linux-ppp=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-ppp@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.skoll.ca,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,katalix.com,gmail.com,skoll.ca,ozlabs.org,uls.co.za,workingcode.com];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,arndb.de:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,messagingengine.com:dkim,app.fastmail.com:mid]
X-Rspamd-Queue-Id: DFC9D1229BE
X-Rspamd-Action: no action

On Wed, Feb 11, 2026, at 10:00, Qingfang Deng wrote:
> On Wed, Feb 11, 2026 at 4:41=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote:
>>
>> This will lose all compat ioctl support, not just the emulation for
>> PPPOEIOCSFWD.
>
> So I should only remove the if condition while keeping the
> .compat_ioctl, is that correct?

Yes, exactly. Specifically this will keep the translation for
PPPIOCGMRU, PPPIOCSMRU, PPPIOCSFLAGS, and PPPIOCGL2TPSTATS
socket ioctls, which don't need any translation.

     Arnd

