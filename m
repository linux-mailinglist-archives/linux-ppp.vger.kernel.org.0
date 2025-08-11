Return-Path: <linux-ppp+bounces-333-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD72B2021D
	for <lists+linux-ppp@lfdr.de>; Mon, 11 Aug 2025 10:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91BA242047D
	for <lists+linux-ppp@lfdr.de>; Mon, 11 Aug 2025 08:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391C62DAFB0;
	Mon, 11 Aug 2025 08:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSm9GQ7f"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFF326B761;
	Mon, 11 Aug 2025 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754901881; cv=none; b=VehdezR87kP+2RfOJ6YGHGv+pi2lApUnTSm1DunjkH3dKqVYVCpnc4j4SaQ3ca9wHWj0zxuixxjFBtw+r+BaHvQXuffstuxQspPjtgt3Uo680+Wjmg56wwkgYPw0jbkefnC+UPZlgJi3hJXWxCdDBzS/7FXrTXLYLaoBgTNRVXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754901881; c=relaxed/simple;
	bh=T5avuU9DL3vYnH4Ztt+0TxYl6qTo7v/Dlieof70baBY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=I7pIIzig322tL5wI7xTgv8zTEMyN77y2nykV8Faf97FBgZaAizqtEQP1CnZe70KHtXBQxdDdFCptZeiit66JWGGDICo3dIQDcbzMeiz2ydep1H6T47Mk39+AsYKN6CXuiIPd5s7JkXGmQCBF3FDAa7hNe4qfwDOLHUHrAKdb6+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSm9GQ7f; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-321a5d6d301so689145a91.3;
        Mon, 11 Aug 2025 01:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754901879; x=1755506679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4xS1+WWkgaSv0c4yG6G8DZIxcOQsp2YpyFMtc/MpXw=;
        b=jSm9GQ7f6Yd50tygeF/osDDvtY/3EG+5WFotJ08QKVPOhzYapWSWqPO/aTHP8q94jo
         xbChlfIfAs0/ddcBpydHQG/y68pKeF+tns6WyXUdYENp63fulgF5bwtpZa7b7FRAC9U/
         dQNEhQFBGMjPFOzl1AU9IMuEuIfsaFWXiM51BvVlp7YSGJN3tCDe7YIVCqnqYfnAVyV9
         G8ewD0e9ECd9nYm2qdxRWFkkoZU8rPQmt5bjwF1oQ+mWJVJcNbemNWX01t39Pgagogh7
         4YCIX7Ntkc5z4cFWqcHDGPDH3iLxbFrMnMmdCiO9OxDFwIv2techuX4jcnPZvkMAKxlw
         s1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754901879; x=1755506679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l4xS1+WWkgaSv0c4yG6G8DZIxcOQsp2YpyFMtc/MpXw=;
        b=C03ZCzoVibvRlwzTPucWYTTsRhfHMI5YpHkLovnYTvY3oDXp0mR0aCBHi2Vivx7gVJ
         snNdbBzkgwDR1wNaRRGRpRXloSKxZvgnEWTmRQeBfXOLK2OQQIIQ9gx82cjxq8Q47RLw
         lx9p0n3gAEDwNQZ1AIVU7ocSe76u6EcJODyjWz+v6Wqlrgs+7Tv8GN2PWi08S2nh50zl
         Yf5eJQlyutEFOv3JQEXpZCssXt5FXKNh6eMobNAwqVOHYpPhdxrDTV6WWVYmyeRd7R4T
         8UR2UFQXHBU22auGpBuIaRWYzW/OBJfFzmdp3ub5A8t6dSIXq3DW8unMczyyLHspASin
         9q1g==
X-Forwarded-Encrypted: i=1; AJvYcCUIyIu+6tp/pEkjaqSZOWmj351EVL1G9gdTPXodWLsuVpanG1q6sHxaaJkvuggtSzhhG9d4OfJnB/ZO@vger.kernel.org, AJvYcCVb7hBtjdWCotTC1AImw7wFrCUcRhQbZU/c/JGDzMQ0jy00F/HvAj8A9Xx61bMV3Hotv3ByK9UE@vger.kernel.org, AJvYcCXe8OBXg0C2ToP2m2Ut4UKnQzghw8q5swvhS3p5vR1re11ZuU/tTFeUOltWqnthwJBkAEryiFyp8yHLNTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxOkRvAproYY8X2HqVvm/SLoqyjqPImnvNcrRZF/RCODD4z9ZN
	NDnGaZIsJOiKlfKY9CLcS88PflftKWPY1Xt8arqL6Y2dQJBGHpwJTmuc
X-Gm-Gg: ASbGncvoM+r4pD81gPGxdlfBLAfqsXdjn71GOOObVSjgARnCnIME4iWIeEOhRSKkhbO
	ZkVhXNrTCSLNVC0JtxIUvRQRDfob0Zva3q5y6aCA2F5rOWDMYV6B9qbaFRJfJgTufWlygxgszER
	hNAGUOnEU2fI/c0af3+NdViRPGs33m2e/ZgTAMbfGjAe3YwrlPg5eDfB8HSQVXCHUiUTBsQDsjR
	E00e4huyTATiQRzl1OPr6JoYBw8K1VWuBUN/OGEOoAog00qxS/Q/HmXeaEcHXjLL5lERziz5NUf
	pVSmIN+x91yKd+f18T0+CHLs1pr1hY5nOaLN6ZPtcHOi8WlPZF9KwsIivrKTEIeeVqqKAaEK+Ic
	f7BgaGLzhiG89og==
X-Google-Smtp-Source: AGHT+IEnv3ilTHdBlqrw4UTyUaEPlZWCMTpuvsvsgFCL/mRg4TuuMDaAImoGmS4qOoZnHPmlfQsmkA==
X-Received: by 2002:a17:90b:4a82:b0:31e:4492:af48 with SMTP id 98e67ed59e1d1-32183c46051mr15891178a91.28.1754901878785;
        Mon, 11 Aug 2025 01:44:38 -0700 (PDT)
Received: from gmail.com ([223.166.85.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da5719sm31087468a91.6.2025.08.11.01.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 01:44:38 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] ppp: fix race conditions in ppp_fill_forward_path
Date: Mon, 11 Aug 2025 16:44:26 +0800
Message-ID: <20250811084427.178739-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ppp_fill_forward_path() has two race conditions:

1. The ppp->channels list can change between list_empty() and
   list_first_entry(), as ppp_lock() is not held. If the only channel
   is deleted in ppp_disconnect_channel(), list_first_entry() may
   access an empty head or a freed entry, and trigger a panic.

2. pch->chan can be NULL. When ppp_unregister_channel() is called,
   pch->chan is set to NULL before pch is removed from ppp->channels.

Fix these by using a lockless RCU approach:
- Use list_first_or_null_rcu() to safely test and access the first list
  entry.
- Convert list modifications on ppp->channels to their RCU variants and
  add synchronize_rcu() after removal.
- Check for a NULL pch->chan before dereferencing it.

Fixes: f6efc675c9dd ("net: ppp: resolve forwarding path for bridge pppoe devices")
Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/ppp_generic.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 8c98cbd4b06d..fd3ac75a56e3 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -33,6 +33,7 @@
 #include <linux/ppp_channel.h>
 #include <linux/ppp-comp.h>
 #include <linux/skbuff.h>
+#include <linux/rculist.h>
 #include <linux/rtnetlink.h>
 #include <linux/if_arp.h>
 #include <linux/ip.h>
@@ -1598,11 +1599,14 @@ static int ppp_fill_forward_path(struct net_device_path_ctx *ctx,
 	if (ppp->flags & SC_MULTILINK)
 		return -EOPNOTSUPP;
 
-	if (list_empty(&ppp->channels))
+	pch = list_first_or_null_rcu(&ppp->channels, struct channel, clist);
+	if (!pch)
 		return -ENODEV;
 
-	pch = list_first_entry(&ppp->channels, struct channel, clist);
 	chan = pch->chan;
+	if (!chan)
+		return -ENODEV;
+
 	if (!chan->ops->fill_forward_path)
 		return -EOPNOTSUPP;
 
@@ -3515,7 +3519,7 @@ ppp_connect_channel(struct channel *pch, int unit)
 	hdrlen = pch->file.hdrlen + 2;	/* for protocol bytes */
 	if (hdrlen > ppp->dev->hard_header_len)
 		ppp->dev->hard_header_len = hdrlen;
-	list_add_tail(&pch->clist, &ppp->channels);
+	list_add_tail_rcu(&pch->clist, &ppp->channels);
 	++ppp->n_channels;
 	pch->ppp = ppp;
 	refcount_inc(&ppp->file.refcnt);
@@ -3545,10 +3549,11 @@ ppp_disconnect_channel(struct channel *pch)
 	if (ppp) {
 		/* remove it from the ppp unit's list */
 		ppp_lock(ppp);
-		list_del(&pch->clist);
+		list_del_rcu(&pch->clist);
 		if (--ppp->n_channels == 0)
 			wake_up_interruptible(&ppp->file.rwait);
 		ppp_unlock(ppp);
+		synchronize_rcu();
 		if (refcount_dec_and_test(&ppp->file.refcnt))
 			ppp_destroy_interface(ppp);
 		err = 0;
-- 
2.43.0


