Return-Path: <linux-ppp+bounces-395-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AjlANr4jmnbGAEAu9opvQ
	(envelope-from <linux-ppp+bounces-395-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Feb 2026 11:11:38 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BA16B134E9F
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Feb 2026 11:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4BB2030074C9
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Feb 2026 10:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056CB34FF59;
	Fri, 13 Feb 2026 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="o5aAxFk4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UyvSu5GQ"
X-Original-To: linux-ppp@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1877350A39;
	Fri, 13 Feb 2026 10:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770977492; cv=none; b=odwhOpgYeRs0ZFxtXC9eMR2HXeAaS9VWVytjQoRnlmP/NFwOByH8rhN2i38gLifHacS8Vu2CnKCw+XL30j+uEcitB6IawVFG3Nbstlc/NARjmxgJ3/PJsa3vPxyb0Uu1peBiLiLmc4yVUinTfej4cfCSwC1u6/mTZCeTruAPfPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770977492; c=relaxed/simple;
	bh=/Q/tqXWZmEU1BhL34mvZnn7xlBHbSfe1IKSDqZVFLng=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kCMcVTLfTx1y7lIVxBUQYWgOYxtwOYKmW8O6RcpuWIwNep1Nn4Ok28VNiHblYd29PnU3tcKSCW8CNQqFf46u5SNHzpdgiNqJPptfXR92Mwliw3nfGwMxHX47+qIBQgxOFEpuldKe121Jyf3wJhJaoPay92l/srWgZQgWlLLBD94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=o5aAxFk4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UyvSu5GQ; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E18BC7A0148;
	Fri, 13 Feb 2026 05:11:26 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 13 Feb 2026 05:11:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770977486;
	 x=1771063886; bh=bZ9yT98AbQkBZAuOVwd4e9T6dcsT4X3D8QYuP/NeWgA=; b=
	o5aAxFk4MfIMBQkxp/W6beTWZSDUD74y9m9JkL/QaBIgIkctpQjcuK0nBK7SSsNd
	LG9WqmENwyjXVrLBu03FE/tQN7U0WZETCKM0JaGl0EW5kPvSEpjLpZdercX+9zXH
	9d51CjOJY+VPorhoqTkITT4sXHoUulbPAkEpVtxMrjcw1Nmuinkj3pwTE18LWBp7
	AM9QPNTqPrssVe1Cbp5W8LBeAuKmvjmZVdt1nYubjfBkirjua46R7cckh0gMnTjF
	uQh1nKku/Hncsk6oiEJd91oZDdRNV8kiU/XDyNky5IgcHPmHEIWs64u7vo+oz3Bm
	wEc/Qsg3pfhUiYUhbyO2Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770977486; x=
	1771063886; bh=bZ9yT98AbQkBZAuOVwd4e9T6dcsT4X3D8QYuP/NeWgA=; b=U
	yvSu5GQ1VpJJfYyCwMzrnN0DvtLrclGkFyDU026gTDzfd5xNEPcohoy6UpGSMOFG
	BaF34q3JV8/0xTKrb7KlyKp0SZP2ph1sR/C9xyjfrfxTXBhiILs6rEpvG9wr9n0v
	tJ7A8TsgmhgH23oBmQvvvfPw2J4n8ZPNGynOVk8LgnqYqrnPu/MbC2LfLwQvCRcc
	JoOd8DppHAqeNKbCYGcYZMPaBB/XvQsrFmxi1Tx4lrsq+p+wXuk48m7yNZe2It8a
	gR1nb5f3FVSgQXE7U6O4TftVA/UtiYyTPQdsP8e1i/07t1uY4o2RtThriROC4ILY
	dmynLtjUHQfs2O5QBsTIg==
X-ME-Sender: <xms:zfiOab1fkhl784lcw80x_1gEqBV3RBlBzPpZCuI0DO6t6mY_hArfrQ>
    <xme:zfiOaU5lIWlT4A2kTyOY-Oz3A6UumNlJvc0CT_asNGUyowCGDXqY5JeVBt5k4sy5j
    CPvtjrbkQo_Qzu4Ef0Jqhv0Zy9BVBOFBMMgHVvyDGErrtpVCgs0JKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdejleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfeduieffvdefkefhfeeihfelgfetvddufefhvdehffegieelfeefgedtiedvjeek
    necuffhomhgrihhnpehskhholhhlrdgtrgdpkhgvrhhnvghlrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggs
    rdguvgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhhoshhtrhho
    fihssegvrghrthhhlhhinhhkrdhnvghtpdhrtghpthhtohepughqfhgvgihtsehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepmhhoshhtrhhofihssehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhu
    nhhnrdgthhdprhgtphhtthhopehprghulhhushesohiilhgrsghsrdhorhhgpdhrtghpth
    htohepghhnrghulhhtsehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:zfiOaR71kUp42Pn_Cluzn4rAsOjknooBzRErzOn-xhLM3fns0nSXBg>
    <xmx:zfiOaYSdbK-VQNkR3dtUgroy2f32FiCVSF2nAeGwfeQaTou2nVMROg>
    <xmx:zfiOaQ_ncsRd255So05k_8gzMij89r5iehd0kH0rRY3uHuoa3z-Vsg>
    <xmx:zfiOaZpZkCAy2YLPfRmXj_PCTIQVPOjBzkHdMcXRy2hViGHXLyuNPQ>
    <xmx:zviOaUhIutlK3XpZ9x1iNE0XLSQLVjiRJCTKuLF5qXMXe_aBwqCOf2Tb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 41444700065; Fri, 13 Feb 2026 05:11:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AB7v4jUx0tiN
Date: Fri, 13 Feb 2026 11:11:05 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Qingfang Deng" <dqfext@gmail.com>, linux-ppp@vger.kernel.org,
 "Michal Ostrowski" <mostrows@earthlink.net>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, Netdev <netdev@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Cc: "Michal Ostrowski" <mostrows@gmail.com>, "Dianne Skoll" <dianne@skoll.ca>,
 "Paul Mackerras" <paulus@ozlabs.org>, "Jaco Kroon" <jaco@uls.co.za>,
 "James Carlson" <carlsonj@workingcode.com>,
 "Guillaume Nault" <gnault@redhat.com>
Message-Id: <2c34fb08-15ad-4aec-b429-d1e364a27c8c@app.fastmail.com>
In-Reply-To: <20260213091605.132561-1-dqfext@gmail.com>
References: <20260213091605.132561-1-dqfext@gmail.com>
Subject: Re: [PATCH RFC net-next v2] pppoe: remove kernel-mode relay support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-395-lists,linux-ppp=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,earthlink.net,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-ppp@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,skoll.ca,ozlabs.org,uls.co.za,workingcode.com,redhat.com];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BA16B134E9F
X-Rspamd-Action: no action

On Fri, Feb 13, 2026, at 10:16, Qingfang Deng wrote:
> The kernel-mode PPPoE relay feature and its two associated ioctls
> (PPPOEIOCSFWD and PPPOEIOCDFWD) are not used by any existing userspace
> PPPoE implementations. The most commonly-used package, RP-PPPoE [1],
> handles the relaying entirely in userspace.
>
> This legacy code has remained in the driver since its introduction in
> kernel 2.3.99-pre7 for over two decades, but has served no practical
> purpose.
>
> Remove the unused relay code.
>
> [1] https://dianne.skoll.ca/projects/rp-pppoe/
>
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
> v1: restore .compat_ioctl
>   https://lore.kernel.org/linux-ppp/20260211075547.138904-1-dqfext@gmail.com/

Acked-by: Arnd Bergmann <arnd@arndb.de>

