Return-Path: <linux-ppp+bounces-339-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC15B23DDE
	for <lists+linux-ppp@lfdr.de>; Wed, 13 Aug 2025 03:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0C6C189C2C0
	for <lists+linux-ppp@lfdr.de>; Wed, 13 Aug 2025 01:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEA4199223;
	Wed, 13 Aug 2025 01:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoJZUU8f"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDCBBE65;
	Wed, 13 Aug 2025 01:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755049715; cv=none; b=J6Ul++09K51qL4CtBs2uEizfCAdCby0K3IZRU7maRCILU+ETrW3K3P//9QvmoeEPzyC9EXmsUjZg4+zwaY7HvwWkc7g4i3n7NDkO2vWbhHC69+ImzbO1sUyj1ruUq6d6gY1hdUMfu1A/HEBxVAhGnu3SHZ5QS9YDN5SDxhsjvC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755049715; c=relaxed/simple;
	bh=iKr6tDM0ZSf6g0VFOcAGSo7qGlEffe4gqSBDx37mM9E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=gWkwq5M3VrFRRnbR5YJFjDiwL6F+YzSSwVLPDyVDVCzgN7If/kZsfvx44BtM5uKmNIzK4t/1/5pAT9iQxJcm/36OzNjgL7N0roB7rvF7UV/IVcgilsK4fSGiGycEUBTIPdx4OKiPBWLSqvmwSMq2jFz1d9fWHPfbF5RjWv7y80o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EoJZUU8f; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3215b37c75eso5194705a91.2;
        Tue, 12 Aug 2025 18:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755049713; x=1755654513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=d7hnVWIXbA7viIAHgUyuw+C4wdi2FKht9GeD0Roei0Q=;
        b=EoJZUU8fB3LD4s96nnQUCqJDmUuUEqkl7Nh2vj7kAxx4xohEVSRKqXPTkC3RTc+boq
         bGJC267lo0+1cafY0WFaBsHy9hv5oqSqQgRVOBMPnnphjljuSAimktyi5sp5S2JN7L4M
         tfCSVGMMRaF1DLFwNUS1fxUxxJ3mazizwOowUK6CKyIWqd+kntP8xBkB5iV4eAI9TErU
         /OXl2Mt1UKThurLCyzz8GH9oHj/9XUaTniUy739IyrPbD/W1gBGTBXclPMnQC+Hkh7Ps
         WJBCbdWEzKGhl65/D6iKiEX5W/nWIBT1v5+LM6hNxywd83fRy3DlPY/JzaUeH4jQtGPP
         wcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755049713; x=1755654513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d7hnVWIXbA7viIAHgUyuw+C4wdi2FKht9GeD0Roei0Q=;
        b=RTn4dXexFhGEXL+JDbYfBBY51CAGtp3UaZK2MAuuEtSxKr9bfuhUKcyFetNgIFyROi
         6tiLWkl7PT9MJVECnM/TPcO/ISabXwPyExXQdtGqPkgt5CdYKRbARDmqt31etn2PGzrx
         G3Wg+QoJiiYVMzJ8Pe73NiLHhhRN6gfegUnj2OCFE09TbD/HatI3sMs+vA6xrQxUktjJ
         MBy8etffmaoyKuPas7YT7Eknu+YSJdB27lt7rzYOdLh7dIaaAuKgYRljL/8sc2WvH77M
         xkPp121mVoS1HZnVIoTOfA7aOP+dowDK4kTK7rweFRodmUzHgEIGNZ71oxjsTKNhhMt0
         U4bA==
X-Forwarded-Encrypted: i=1; AJvYcCVJkmcY2kawnSLLzGkn5s94g/MM0gCyzn1VLk4gk+YxkogjkPbwQ8W7RQp0ReuoFm+RyzRIxs5f@vger.kernel.org, AJvYcCVus/paTFdCESRfSYiGzj5lAyl8Wsugu1qK37B0rswdR3rdGp4dv/Z+MgDOpirevKoR6ZzW7fpjC0nT@vger.kernel.org, AJvYcCX+OJSgT5lcI7BmCgl1ykizRDr01qmPHXGAH0lmvB1r7pYTkL9I31BgpolWSoD8Et/bQu9ZzRxxQyK5TBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwekPmsUocOIGQ4VdN1H56kmsSWYeJC706+dGTme51Umlx1Omyc
	uwp6/gNt+aoUOPgbTKHYC7SKowOvywg4DQiW+2XGj3OrHD5dqyl433Zp
X-Gm-Gg: ASbGncsmtBwZ6n7Yjjz96s2oWOvF079kZ9v6VAfa8Gj56VHYI3QSUUbFpkVmL/VmhJs
	JsCK0c5x38ot+MPxYC05GyD0PklHelMpujcDNvtBmBVbevehar2wAO+/DKLgN27DA4NBHp89G82
	hugALLz2VT01xq1t9ODstt0glTPO4C45pKXJPJWbOI1z3hlS7xcd6IBb3gtdcceBsoUJar9qdRQ
	Co3MFyEjbC2HThqKOGQjjEr3upIenU25RpaQ2fnDhLeH8rLRcquffcy0N3biN3CLu6Aqs6lUGjb
	Gta2gK3OPlO7n4FeOQUq5sSPwlYvQk/3WbfFd9XCJj5rPkpOMgirxHI//pt9ortPdh5r6nUnUDA
	QzrP2fPyDTLB/Rg==
X-Google-Smtp-Source: AGHT+IHezN3uxow0Z+ZyvNk5d67vQjntLHS4zOf1BC/V+8WuntU0lTTEKfPA1f6zh9ywSBtah61sZg==
X-Received: by 2002:a17:90b:388c:b0:31e:d9f0:9b96 with SMTP id 98e67ed59e1d1-321d0d7bc35mr1830664a91.14.1755049713352;
        Tue, 12 Aug 2025 18:48:33 -0700 (PDT)
Received: from gmail.com ([223.166.85.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321d1db52e0sm449652a91.17.2025.08.12.18.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 18:48:33 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/2] ppp: fix race conditions in ppp_fill_forward_path
Date: Wed, 13 Aug 2025 09:48:17 +0800
Message-ID: <20250813014819.262405-1-dqfext@gmail.com>
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
  add synchronize_net() after removal.
- Check for a NULL pch->chan before dereferencing it.

Fixes: f6efc675c9dd ("net: ppp: resolve forwarding path for bridge pppoe devices")
Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
v2:
 Use synchronize_net() instead of synchronize_rcu().
 Use READ_ONCE() to access pch->chan, and WRITE_ONCE() to set it to NULL.

 drivers/net/ppp/ppp_generic.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 8c98cbd4b06d..824c8dc4120b 100644
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
+		return -ENODEV;
+
+	chan = READ_ONCE(pch->chan);
+	if (!chan)
 		return -ENODEV;
 
-	pch = list_first_entry(&ppp->channels, struct channel, clist);
-	chan = pch->chan;
 	if (!chan->ops->fill_forward_path)
 		return -EOPNOTSUPP;
 
@@ -2994,7 +2998,7 @@ ppp_unregister_channel(struct ppp_channel *chan)
 	 */
 	down_write(&pch->chan_sem);
 	spin_lock_bh(&pch->downl);
-	pch->chan = NULL;
+	WRITE_ONCE(pch->chan, NULL);
 	spin_unlock_bh(&pch->downl);
 	up_write(&pch->chan_sem);
 	ppp_disconnect_channel(pch);
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
+		synchronize_net();
 		if (refcount_dec_and_test(&ppp->file.refcnt))
 			ppp_destroy_interface(ppp);
 		err = 0;
-- 
2.43.0


