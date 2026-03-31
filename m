Return-Path: <linux-ppp+bounces-464-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOpfDopAy2k9FAYAu9opvQ
	(envelope-from <linux-ppp+bounces-464-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 31 Mar 2026 05:33:30 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FDB363B3E
	for <lists+linux-ppp@lfdr.de>; Tue, 31 Mar 2026 05:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D73F83019612
	for <lists+linux-ppp@lfdr.de>; Tue, 31 Mar 2026 03:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E01829B793;
	Tue, 31 Mar 2026 03:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrGgmC4Y"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E27F274B23
	for <linux-ppp@vger.kernel.org>; Tue, 31 Mar 2026 03:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774927999; cv=none; b=NpKCWiLHyLH+DdbZJYA1ZTcxIQmD+OfMo4MVCOCYc4RgjMiELJUTXteH2OfdXQeQXV4lZLchuYtcKKWvJf4IWwAYD6bEVhA08oSjplR1kzgP3NG3oTTF/ZWEshxLGaXI+WtCzbHEMDh710L8XeIfVqQ35+EtSgBT9NtNiv4txkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774927999; c=relaxed/simple;
	bh=qrlHq0Q4YKqaSCv4/aizWt9Wc4sXLIfE2+wLTKkzzAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eZ82C1RlAbJZ6etBtW0EcLYwDiYq6e8g+l0ReVjWePVELwXTm1dZQXDrI6lf7iQOSjbe8OkNDftRQF0LYmxRrYv7ZMfxwkHsQ59sY8tNPnXVk9Ryhsd1Xv2tuF8FdYDXTh/Kuf0StE4dfAEI2QCpXA1Ri8Yz/IZkhWqrngHsjRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrGgmC4Y; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b980b35534eso967189766b.1
        for <linux-ppp@vger.kernel.org>; Mon, 30 Mar 2026 20:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774927992; x=1775532792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z0TJ0hZz0zYd1/1Ldf9+fC+SUn7WTBRfcA3V3D85QUs=;
        b=FrGgmC4YR8Hu716OvCgQbQSmyeeWktmJL73CkF07XPST8iIkjpCzqZHuxd91If7tdY
         65p9+d0TuERhar/p9Cj1zoNEkiL1Cpui1hLhnFJGR/+p8B69rWWfQbI97FRzIzx0/hhy
         0KY64ljC0lgR1g7NJr54iNFNqn4sowXLV83Rr5z6+TvQZsPCZ3+xCydBZEnCVEO+Uckf
         bH4xVHfA/JEi/cKylxwqc7uIfApVOeovY2YY65WetVf3jNRFqL7xyBTGWrIwLh+XqwEV
         QM/jc8fUqNqYoIDbuPdqzMbEX5ftzFp9+NgRegOmeg+kK50ajJOfu1MO5Ocf3P3rvRIF
         eMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774927992; x=1775532792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0TJ0hZz0zYd1/1Ldf9+fC+SUn7WTBRfcA3V3D85QUs=;
        b=sxj3dt/kA5Bu8UFZaNWBFuz8IrOffPPllCtJ8q3FwuK7jEJS61T1OFFwJ1OimXmuSn
         sECR1Y89ApPdDrjCxBQdkxbIPP1A+RUYs8sa6FpXG0b9KYuciKrk1DOhlqz1UaIXLjlL
         JT/zrZqwiy/QYc6vP357BOBjPTmPHNEp2AOF7ILeqwTkvlocrfcdDE8ixnTtnZ9fPxaA
         xNmG6Oqxx9AEodv9Vc+NkQR1AI+RpFHhvTTbJspBcyC2hCq2GyOAK+dNbJYQOkt+1UlE
         q+haKEHEN1Jym2cy/agLsSO6dcOIrzx+DWT3HqAHTjZkQNeB1gFhmU4vdoAjTG8tDwI0
         tguQ==
X-Gm-Message-State: AOJu0Yz8vT21QaKzPG68Y0RMuzUI9q5jF9+/QFsI6/FMcoFWqczn7p55
	Tj7BiBcRfLF4yUwjepbfqMGkkABXdtic+v3Hfwnby5rsKvi1C+ZuefXnahRd99YXK2w=
X-Gm-Gg: ATEYQzzvDuicKj6CqpFeb1uFvHb6fOHBHrJRygkstOedtC26b+OHG1NxUmID32cR0zc
	p5LG66NMgpQ0cJlW5NNl5jL1S7vs35MAw2qBG29cZEb4NtQ/z4t9ASErTqZuoq5tAHG1MT4UQbL
	pliybTZENQFisuNF1U3WMHNYycwdwlxocqtWp48EM2mTNWMVF83RFwXuC2JIz8FVSdBoQX0XUgh
	WkOtC+waGaY09tjbvsT1G5+8C3TblfPaHgzn990pbicpeNTZ6BCOIq+MFgkEqcCgTyi0eK0V9LJ
	ZyxAn3x0LbXIOKl/w5gzGRuCX+x3EOw0z5lDnneGQT1cce7l0TqXU/2MmlyFlZ60iZEY/ls7uiZ
	FtW421uRLbOhlTM17HnFDPsfFjGvb8RvSvYDxEhtfQn0v6Sq8jQvmMS9RmZXhgbl6U52ChMGrU1
	2SNhQ=
X-Received: by 2002:a17:906:c107:b0:b9b:faa4:8ae0 with SMTP id a640c23a62f3a-b9bfaa48c9emr15287666b.7.1774927992252;
        Mon, 30 Mar 2026 20:33:12 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:4e24:2719::3e5:12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae25b08sm357173766b.7.2026.03.30.20.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 20:33:10 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: linux-ppp@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>,
	Dianne Skoll <dianne@skoll.ca>,
	Jaco Kroon <jaco@uls.co.za>,
	James Carlson <carlsonj@workingcode.com>
Subject: [PATCH net-next] pppoe: update Kconfig URLs
Date: Tue, 31 Mar 2026 11:33:01 +0800
Message-ID: <20260331033303.5664-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-464-lists,linux-ppp=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[skoll.ca:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 39FDB363B3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Both links are no longer valid. Update them to the correct URLs.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/Kconfig | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ppp/Kconfig b/drivers/net/ppp/Kconfig
index a1806b4b84be..c751959c53a1 100644
--- a/drivers/net/ppp/Kconfig
+++ b/drivers/net/ppp/Kconfig
@@ -122,11 +122,10 @@ config PPPOE
 	help
 	  Support for PPP over Ethernet.
 
-	  This driver requires the latest version of pppd from the CVS
-	  repository at cvs.samba.org.  Alternatively, see the
-	  RoaringPenguin package (<http://www.roaringpenguin.com/pppoe>)
-	  which contains instruction on how to use this driver (under
-	  the heading "Kernel mode PPPoE").
+	  This driver requires the latest version of pppd at
+	  <https://ppp.samba.org>.
+	  Alternatively, see the out-of-tree RP-PPPoE plugin at
+	  <https://dianne.skoll.ca/projects/rp-pppoe/>.
 
 choice
 	prompt "Number of PPPoE hash bits"
-- 
2.43.0


