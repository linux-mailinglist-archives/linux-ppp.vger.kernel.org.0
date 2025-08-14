Return-Path: <linux-ppp+bounces-340-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85610B258F3
	for <lists+linux-ppp@lfdr.de>; Thu, 14 Aug 2025 03:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8734E5A176C
	for <lists+linux-ppp@lfdr.de>; Thu, 14 Aug 2025 01:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EE519D081;
	Thu, 14 Aug 2025 01:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWSYS9Sa"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1628015B0EC;
	Thu, 14 Aug 2025 01:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755134782; cv=none; b=DaYDGA5HLg+IqpnrzXvQsL8S+LA3myNioerPSzm5Cxl2yD8LHQXeiwLB+8YOdeEiziajcC3/68FVDnLn19IzeItaGA9ybdutIz6Edy5pSYYs1uXNyInXRbCRSsUb01981lV6f2F/hbuZ/0n6To/o9ya2y4p2HA19WxltCoRet00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755134782; c=relaxed/simple;
	bh=AaTOIjKM/HhANfXPn7WY/y8dURyKGAwym4+LGmYUpW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AovxRg0n5J2ZsV1IgyPW83snwUTa4mUedJPoVN3+JeYil6yRis9bK+nX+Wb1zUjVhtUlLS5OkxwZ99OglacZxQA8luFVOe7/HWnoJSXbpIsmGOAVnhe+0S5MHpE58jp7VD/k39mtWHBNT24pUmf3VaLQWzneWNdRJ57ZMgbriRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWSYS9Sa; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76e2e8bb2e5so746854b3a.1;
        Wed, 13 Aug 2025 18:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755134780; x=1755739580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxHg1aswGQ9X8RPJVWs7DtEqnRdVWNWal6g+jkC+HfE=;
        b=dWSYS9Sa9dHqL2e0VIB390wFLvHCbw3NUJBw6qzUSaDCEu5eFNDqIVwxJFr/uy9YvD
         Pmsj+AWxqHkJt+FJsezywtOA8a4eOX6zJfW+N2Mms1Fkpn2DBlJ8hdmVoESBd5JxQTo6
         SjKVvuK84uK6ymFTjeG7+BWKTQ/8sYP+vXEJd64lzMXjr2b+r4zcZv1ppxT4DRg0xpWH
         gizWRnKN5nIWQmK377YSZs2EJEb3TbtRpdE7zYbbJQ83inZCDftCkTBGwskNVzbj5mmm
         NKkjFZtsBkrdti85/6QfEM6clYtSXMFgJ7QZO73Gro7vFqh2h2/i7m5zTCa4plnQH93R
         Q1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755134780; x=1755739580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxHg1aswGQ9X8RPJVWs7DtEqnRdVWNWal6g+jkC+HfE=;
        b=S2L/WS1+dwFV4/zWViUAMKvyjHglTCcTNvkCkRoyTUmvbkLolAagOLsdJ0cQkXsZf6
         kuwMp3OFIw15hSvwI1EXcXHwXjh1rMb22vuc9ICYZU86Nbn6JbezZeh1UPvoVIErPsOU
         kQukv+vtLF/aMjr3PQvU/0JIrvJKREn8xnFlkvFlDEI4s06B2qzLCJ7Y28IGkO67WT5z
         7ahofVeN/QFYdsUt8WEDlE62R5Oc3rdV7iEYtXxGVAU1/vrvlrpA/u1DQkksaEHOYCoD
         mQ6NpZ05k52fXMS0Ezd5eDKjJkKTACc5co15MkiaD5wJhTniBPqanOrJmVsTZpMmzlB9
         NcWA==
X-Forwarded-Encrypted: i=1; AJvYcCUOASg+gaVN74xqdhQS/6cL9xlUBfDND2Dm3FCRE2OXOb0rjoLVPQ7LKLO4qYR9lmAEIPvWvux5@vger.kernel.org, AJvYcCWgUS/G95Q4o4I3Bm7gCYibuRsCMc5cIbBZukzzhqtp+NPLyH+t+ipJwN6wIXcMazf4vxSBNwURJpAo@vger.kernel.org, AJvYcCXjw9VijoqWoD8BBgZrJI0vT6rDBfAXKeFG/SsrE9XW05fRKPtS92QLgWdk4PJXPPt/Wvx7F0T2FE4Yi1E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4xWwe2+jZp/+cfLWI3g6Ks3C7RFDGRxWvBpoMjvqD0Q7bpqNX
	S4uXvUJWfU1DIFkb99+WHBK3Am8GdZFUWRrgI5K0XYqivlIH922nrfED
X-Gm-Gg: ASbGnctDaSwTi7jZAMu8ym9ixtzu65hh/jHI5l6YNM83Niw82L0kM6ci4EvEVaxchnC
	3g4ZKMW1DsTJ3XCu9rYnbP0m8OHmZ0Rp79Mf+yzQxZdnoOJrJzNHT/ZFf4SMUTTrY10EkPNX/Rm
	oDOg2Ptey1Tcvgb5QFzSG2dZUO2ziaaGsLQE3XIEEQFNNvPKm3vN+BThpmFVTBTFBsRaZkjbi20
	9OB0YBqmjxMzfHv5UnJD3LSqWaX2tm/6XirgvfuSymgvCiA4pLu3nD5iTrqntBZDCEkWm/K37/j
	ARsJ1RKY+TaEhir8H1q3t0513yN0fUFj2iUB2Ar16SJ4ptGRaWAZSfzDp81q6WLr6QDCmYgcf4R
	wNlQYDnDx+UEk
X-Google-Smtp-Source: AGHT+IHNcdpCGXHvkqSCZsXpc7Usbxwm5MeQy6A4wV71bhBTfpofgrjkMiXew9+JZ8GNjW8Pbs2/aA==
X-Received: by 2002:a05:6a20:734f:b0:239:1c1e:3edf with SMTP id adf61e73a8af0-240bd2b4021mr1643767637.40.1755134780338;
        Wed, 13 Aug 2025 18:26:20 -0700 (PDT)
Received: from gmail.com ([223.166.85.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b424ca987desm23395786a12.40.2025.08.13.18.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 18:26:20 -0700 (PDT)
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
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH net v3 2/2] ppp: fix race conditions in ppp_fill_forward_path
Date: Thu, 14 Aug 2025 09:25:58 +0800
Message-ID: <20250814012559.3705-2-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814012559.3705-1-dqfext@gmail.com>
References: <20250814012559.3705-1-dqfext@gmail.com>
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
v3:
 Reorder the patch to be after the mtk_ppe patch.
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


