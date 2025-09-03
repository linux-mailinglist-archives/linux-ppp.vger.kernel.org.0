Return-Path: <linux-ppp+bounces-349-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD72B41B28
	for <lists+linux-ppp@lfdr.de>; Wed,  3 Sep 2025 12:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A0B816DE62
	for <lists+linux-ppp@lfdr.de>; Wed,  3 Sep 2025 10:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC64F2D7D2F;
	Wed,  3 Sep 2025 10:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jadq0HF3"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3693129CE1;
	Wed,  3 Sep 2025 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756894064; cv=none; b=YAX54DLTZx+3KPd26vvrZXcT7GjypIPnYnX1JDcxxOxobZGlhg1JSaAKjJP1Pp2Eko4BI+04xC148mDCUWRXHZhz0oCbfQkXJHaaCpPFvFpC9vK5qhNUUI1diUanJ/vJJ+7pRVWsNglyYGgfgYCsjOKG4GqU/2LUGtUTBcaTltU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756894064; c=relaxed/simple;
	bh=KULc0f1h5IpWpu9btYuP8kZbCawgVeRxelmFTcI224E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=AEIhGZyoMIrMw24ekFkSB362jxopgjrB6MEPUL+5xzAROhisaN658a159z/oaAtfVFey20v05e6HMiVWfKrgHYqktR1zgWixxmKHngWV5tdp/Qcu9C9j/daf9t2a3BdyMYIv/ZKWCkxvQQqCtZWK2uHXxRQScixYixAP6UyeIhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jadq0HF3; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24879ed7c17so48327225ad.1;
        Wed, 03 Sep 2025 03:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756894062; x=1757498862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rVGauGfhr6mvYXp8kJfDTCcj8ZL0niSipeV+OayO1is=;
        b=jadq0HF3C9qt4/uC8E28yEYHuZ9GrYzcpYGEb54iihPVz+V1YAR6bkxy8Gt+p30PAA
         O8V6PUaYbfLTCMoGCneqVFcDUGJ7/DQH/TDUs9CSe6OjQ/NTURFkEUJYolht243rZwuM
         Xc8pYxQHEYzYxETk5BufEOjjTXsCRDAaNm6VULxko1H77RfjTAl0kOJ+SM+SdfXPRC1w
         uGF2uNS8B8EsjuIe3I0cKeEzPqbvyFDkcA/oSIybJVeits7c+x8JVoHlBJyRZfBBYWkn
         ZTY7ZDgAaXXcLGROUbEyshTGws5FfVRTjZwYunIuDifGwsynLCcCBTLn1kr3mz5oAQHr
         TFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756894062; x=1757498862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rVGauGfhr6mvYXp8kJfDTCcj8ZL0niSipeV+OayO1is=;
        b=GX1D4l7Xp7rMe1wD8z24s9rPoBQ0lES2vt+j62TQjnuiCID3ADVe8H3ir9H7poppLj
         MLEyrA6R0VAA2xK4up3KjkTePnGJghBOXvSQy4hFrR6gg0/Gdez0lqygZa0g1/BOC6bo
         nWiYoGCBSR8bGBOBkGH7boSiBPTO0pP5m1HABnn3jBR3k40WyXsRN4yW3vqV8weI7RXO
         71Fegw+T8lSmmCp8/VVgYgFykiPvzd5uY+5DaG3lc8K06FMdLOPtuC1nqftod0ERXM9L
         zzLhhHGhdP5HovHTbaaXQuhd7szO7zb7DL+a2TGhv7PN6zuR/HqmFSdBp8qRZpqL0NKn
         FrZg==
X-Forwarded-Encrypted: i=1; AJvYcCVy3LECwmfoSEk4ONwSbmxTRdNCpmWXIWuphiVaaDbhJn3r4SU+y0s5t4QAt07z83hthrqna47o@vger.kernel.org, AJvYcCX3NkOBW45iTK+VRWMIN0+2hT5iJWgE4Xy1mthvqKBRpJ7iSybaTwv27X6P6FemXC6TSKUCQrBr25Pj@vger.kernel.org, AJvYcCXZdNQVnMcBYgh6bLerrEuJWg4+oA0If3hJEgMEc1FxQa1VqVgx2F3fFAKsvYTQAtc5u2X2KGCJzmB8Khk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVK5To/JLV7GkuDzXGdl5IvUkJ7vZl/EnajWflqsMBSlYO/JMX
	QroJoFldSeK8WPhFCwwTC1uocOoLHdXJEoBii1+REudILU9A9iSgr5i2
X-Gm-Gg: ASbGncsetg9mOiiv6gPiBg5la8elAb0mDgMJm4TJzlm5jCyURj3ZXcz8nS+rSXGrQzU
	SR0CGe8QgMlj8orUv+i8Ok1bafQZcibKroAWeF0YVo/q+F7bYTcprln34JTfMnnE/nG4q00IA0i
	cuN8HP8M+869XeT6mkLHx2MsZlUxjoAcrk9jTvEdqQB5kwQftRWpnlZ6gATmqVFScNCxNBuwipr
	yHItGk7A4q3db2Ugk/Yp/N13qelbqD75B01ERwhHbzkbM+1Wf/l3zEmK243eirtsjP+J8dLNk00
	XHwoPVRJDebjLeM8E1Bpe/VS/Hz3oseFUk+WTGZpPvmTuJOl1HnIhrlyIE5lcncH/mP+y6pUCeT
	YWOpRpxzH/Md0tBo=
X-Google-Smtp-Source: AGHT+IECmCXdKsrRf8TTrVO+be6VDrPYPEsyD7JjfR5byeiaPewWqXxQFtt2BMdS2cQf1GYZWxYKpA==
X-Received: by 2002:a17:902:d485:b0:248:cd0b:343f with SMTP id d9443c01a7336-24944871f85mr192467405ad.11.1756894062225;
        Wed, 03 Sep 2025 03:07:42 -0700 (PDT)
Received: from gmail.com ([223.166.84.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903702354sm158993365ad.19.2025.09.03.03.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 03:07:41 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Mackerras <paulus@ozlabs.org>,
	Matt Domsch <Matt_Domsch@dell.com>,
	Andrew Morton <akpm@osdl.org>,
	Brice Goglin <Brice.Goglin@ens-lyon.org>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] ppp: fix memory leak in pad_compress_skb
Date: Wed,  3 Sep 2025 18:07:26 +0800
Message-ID: <20250903100726.269839-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If alloc_skb() fails in pad_compress_skb(), it returns NULL without
releasing the old skb. The caller does:

    skb = pad_compress_skb(ppp, skb);
    if (!skb)
        goto drop;

drop:
    kfree_skb(skb);

When pad_compress_skb() returns NULL, the reference to the old skb is
lost and kfree_skb(skb) ends up doing nothing, leading to a memory leak.

Align pad_compress_skb() semantics with realloc(): only free the old
skb if allocation and compression succeed.  At the call site, use the
new_skb variable so the original skb is not lost when pad_compress_skb()
fails.

Fixes: b3f9b92a6ec1 ("[PPP]: add PPP MPPE encryption module")
Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/ppp_generic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 65795d099166..f9f0f16c41d1 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1744,7 +1744,6 @@ pad_compress_skb(struct ppp *ppp, struct sk_buff *skb)
 		 */
 		if (net_ratelimit())
 			netdev_err(ppp->dev, "ppp: compressor dropped pkt\n");
-		kfree_skb(skb);
 		consume_skb(new_skb);
 		new_skb = NULL;
 	}
@@ -1845,9 +1844,10 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 					   "down - pkt dropped.\n");
 			goto drop;
 		}
-		skb = pad_compress_skb(ppp, skb);
-		if (!skb)
+		new_skb = pad_compress_skb(ppp, skb);
+		if (!new_skb)
 			goto drop;
+		skb = new_skb;
 	}
 
 	/*
-- 
2.43.0


