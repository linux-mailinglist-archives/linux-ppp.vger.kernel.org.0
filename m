Return-Path: <linux-ppp+bounces-468-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFH/Op6Ly2kuIwYAu9opvQ
	(envelope-from <linux-ppp+bounces-468-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 31 Mar 2026 10:53:50 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B933667D6
	for <lists+linux-ppp@lfdr.de>; Tue, 31 Mar 2026 10:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2A94E3061754
	for <lists+linux-ppp@lfdr.de>; Tue, 31 Mar 2026 08:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADED73E9F96;
	Tue, 31 Mar 2026 08:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNLvLIXw"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF5D3EC2CB
	for <linux-ppp@vger.kernel.org>; Tue, 31 Mar 2026 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946981; cv=none; b=NAeQTaDhi3UpBEsnRL9dnCeUHKjtmnbvwQL3ukww2fnPPhx6ShyzWLV6JhhIFxQTVjhj9dflYQIw+P+2RlEdiSahm9ruSWgsRmo2v4AtBOcNr4TLRPbFgpJnrRq38tNo7N3RIicgCuc3GFme8LPF+NPfw5/RRfkvxdDPZxM2ZAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946981; c=relaxed/simple;
	bh=RS1Ck0BGfQhaAUv2uBlmWhFdskT6vREcAGwkW0luATc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/P0BQZpO3fw1RNJVtWI+Zw5Sp2MPEYS1evTdrFXDT4MlN1MlvkZ7sEV96zEidJuiqQA9GLcMhid224+6LTzbQbHJ0xp1zaxoh0HH+gfeMq7CAyJi4LdMLPEEv4EP3jOl6mKHP1opQSJ+/n8RlQJG2EGvsZTiAUBuZoe17a6qow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNLvLIXw; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9841aecf72so661419166b.2
        for <linux-ppp@vger.kernel.org>; Tue, 31 Mar 2026 01:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774946978; x=1775551778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYw2GjIKOsjp/mmCKVfO+JWSxrQEDXep6q58GlKZmXM=;
        b=PNLvLIXwNMP4tBjkIMGQhnu/OKDoz9ajO4vRZuI2LgJiDI7qrCPS0H+SeAueQ8gMv5
         XXFeYcgqvovqqG/8tIRbVkwrb/bzGyf8m9lZLUVLonjI1aM+tiZFXFEgtE7wTiAAvXaV
         M3sbixzeXOHPuSqI/9Up9QQd3TonM1sIMkcch6K+obj1bUJn2PRKtq0ZbLF4Y6piEtmx
         WP6xuroc4RpyOLM1yKwDGJ3KslnTuf+nXQhU9wzzLpmOaKlVV0VdiG5foe7w1Gs5XFmu
         b/B+6BOiG5JA+NyaThLjEM1Psq5nIbpyouw5yMXA6vGGak1a9C28Pw4GRsjKLoOn8Z0e
         wKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774946978; x=1775551778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CYw2GjIKOsjp/mmCKVfO+JWSxrQEDXep6q58GlKZmXM=;
        b=Fu7h5sefzxy0Ni+zIcb1XQNP2X+rjKQ1xLny4n7jIWwuiY2+Fb8tgkGX+f0HGScD0H
         wJQsBuO/rFw49lGpd6zj9aYR7sYiifuN8o73+DR2B7rtHuLboyOYjSC0s5rwsDZLXYC5
         RA9Ah9hDdlz8oSYNPgbyNpir0x3a3jzJreNH6T9gd+ma+5bD2bU6S9puEePrHlN0cPGr
         mm55m8N4xae6XAjcmh59QSVB7vEbHBPNhxtGgfWsyI262QQhBgxI+Lpt0py0dNb8HQLM
         h+bhNLR0tVTWwYpLiXW2I66r8qARikzoe5/d/ciI2QjdydPyh0qdlWH7+w+eZPSschvI
         rZWg==
X-Gm-Message-State: AOJu0YyMlOAaE4i/Mq7DUUO4zTgMPUjrdxaI70nux42HlsG0naiUlwUV
	K/gqcKgf8+IeZPHZy0Wk1DLYk7c8y1Ah2vP9S4E4LTPPw1I+PaL82sRW
X-Gm-Gg: ATEYQzyMxuaW+yyEAK4AEid2i+RmcYJ4q0vDdAJqMQMyBaJVo5LsY/0o1E5JQYwX5B0
	mtU2SdvCD/uxvg95nrsx+lcNyaJL2YOA4WCvjCnLHw7DHWBFh2hVIDbVq8oKgjJcWZ4l2BdV8fV
	Jux5T6UveVTZwOgXvgCWCSpGQSwb8RECtnrBiL70UJ1ABNopz8RzTZejIgC6hDzJRvQ/EDOSAdG
	gJrXx3qiortlaGP5/XKr3ciOfdDRN/h/Mg8cWemQ85vM5JmiAah58PWHJ1iq7fnbnidKxLQDO9I
	WF7X/nE6pCjhBgLNcvgj47vxbinWJP77MWhjrac1s/JObqH4kJsB/pYT8DNxTr60CGrgwLD3+mf
	n0IBZlywl5tMFwyTo8glqGJpNN3xhGhavzWlYvmPwTFwo55SjVwYosU992YBUJy7UnBdnT04tF2
	WwEIz9jzdpAoY8wYd9bg==
X-Received: by 2002:a17:907:ca84:b0:b97:cc05:61a7 with SMTP id a640c23a62f3a-b9b5098de17mr954021166b.51.1774946978317;
        Tue, 31 Mar 2026 01:49:38 -0700 (PDT)
Received: from gmail.com ([2408:820c:2708:af80:8182:8384:8586:8788])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae7416dsm384119966b.28.2026.03.31.01.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 01:49:37 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Jaco Kroon <jaco@uls.co.za>
Cc: linux-ppp@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Mackerras <paulus@ozlabs.org>,
	Dianne Skoll <dianne@skoll.ca>,
	James Carlson <carlsonj@workingcode.com>
Subject: Re: [PATCH net-next] pppoe: update Kconfig URLs
Date: Tue, 31 Mar 2026 16:49:20 +0800
Message-ID: <20260331084920.300558-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f37fca7f-710c-4f7a-a7c5-9d8cc129bf21@uls.co.za>
References: <20260331033303.5664-1-dqfext@gmail.com> <0aa6aa20-0e2a-48e9-8273-53b2fecd287b@uls.co.za> <20260331075438.290119-1-dqfext@gmail.com> <f37fca7f-710c-4f7a-a7c5-9d8cc129bf21@uls.co.za>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-468-lists,linux-ppp=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 91B933667D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Tue, 31 Mar 2026 10:08:46 +0200, Jaco Kroon wrote:
> 
> I like this.  You have however dropped the ppp.samba.org link, just 
> re-add that I reckon.

I think this link belongs in the PPP section:

diff --git a/drivers/net/ppp/Kconfig b/drivers/net/ppp/Kconfig
index f57fba84fe55..cf927bdc288f 100644
--- a/drivers/net/ppp/Kconfig
+++ b/drivers/net/ppp/Kconfig
@@ -13,10 +13,9 @@ config PPP
 	  otherwise you can't use it; most Internet access providers these
 	  days support PPP rather than SLIP.
 
-	  To use PPP, you need an additional program called pppd as described
-	  in the PPP-HOWTO, available at
-	  <http://www.tldp.org/docs.html#howto>.  Make sure that you have
-	  the version of pppd recommended in <file:Documentation/Changes>.
+	  To use PPP, you need an additional program called pppd, available at
+	  <https://ppp.samba.org>.  Make sure that you have the version of pppd
+	  recommended in <file:Documentation/Changes>.
 	  The PPP option enlarges your kernel by about 16 KB.
 
 	  There are actually two versions of PPP: the traditional PPP for


Your thoughts?

