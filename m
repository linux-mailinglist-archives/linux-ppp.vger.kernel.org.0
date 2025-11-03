Return-Path: <linux-ppp+bounces-365-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ED6C29EDE
	for <lists+linux-ppp@lfdr.de>; Mon, 03 Nov 2025 04:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7984A188ED5E
	for <lists+linux-ppp@lfdr.de>; Mon,  3 Nov 2025 03:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B877E285CAE;
	Mon,  3 Nov 2025 03:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TM/2558W"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344B8221DB6
	for <linux-ppp@vger.kernel.org>; Mon,  3 Nov 2025 03:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762139709; cv=none; b=imUMnjInxQVI7cF453nYrPWJgeTz+DGqCo3+/raewP5s9GDmV3EIDObuKXx/9axVB/jqO2zSYx1TjrjnwQE8lqCW4RuKZCnu1g6TTZx5EXBY13/IaBclpbUmOtsJaULqPHMLt3JttRXUJ/lvoazJ2Nzf6IkX0fx+nJlNj7IQFjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762139709; c=relaxed/simple;
	bh=6SQN0vecgbgR6BRspTq3+ZfoO061hFhPK3vugcQ2Ork=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=qHOpDNHYGtHfCowahtDAVpG2RBX/fgcoTPd+KeyZdb3SRnEDJJSlK/D2egg1mz6QUAX63BwgLf+YVakbXhqb1sJ0fnKHqhP7GPyyGUHtTH+vUoCpQlKns28TGMUsrSPTLKVEpFUgR6eqLvH+QCHo0O+dYBXMhZh04+Tv/Ggcuu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TM/2558W; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2952048eb88so37459555ad.0
        for <linux-ppp@vger.kernel.org>; Sun, 02 Nov 2025 19:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762139706; x=1762744506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qXsyXRBsjl/UJdnzdmn5tcpNjcGfeLeLeRD6/RJCrMM=;
        b=TM/2558WbPfibgmubtZZFCsvLhq2VxiYUx72McFQAyJVswXHE1gRs97zGzXX83d9pM
         6nGtGAhiDRAO7pmfZxlCOmhewr4Sw9XVIBc1wY9NYECSDrvF7vPhEjFJ4n3vW15mfiUj
         yNv1iKXHK1vKJFxex7RNoGc0Y2DKy9UBGTc50Fupe8IwZ28Bfmu6Hkrl9uIe0JiMXVUv
         MwztBNsIlCqBTEW/n5qIVr/vuihAq2Sm0r2MSvnmMkLmVzSpF39MxGZ18bK+5hB+szd2
         vlbFanByBetAAANlpAaTQA3hNvJwuCIJf4ZebfroAdZmaLq76MIFy+CHcnb/pK1NWER/
         McTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762139706; x=1762744506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXsyXRBsjl/UJdnzdmn5tcpNjcGfeLeLeRD6/RJCrMM=;
        b=YWJL4HVWJVykvtkhlD7iQN9BqcvAj00gZ7EIDZRZoD0U099KhGv5cdGuuUdgocvSoj
         6M4UVI4tgaTyZMEv0P0TSSL9RZwVruPXp2n9UUN3U7muJIDNw/lLLs8eREJR4hBhBVfz
         Hh9oBI1J+LBAbB/tvugc3CxBl82ASD5uwNepYNUqQDFVyuIrG8k/5c1D90PS9a0nSp8e
         7OIqoPIyGa2Ppf5UUPPGQsyABt+wHZr02J5l9h4SkIQvh+YnTL1rkrUF0j6JyOsMFTDW
         eRyIcPh2yMi7ju8wEeJfnR9ia5eZmGk+Y3BM/VftsJoB7jxB0Z+rinwy129DguhiR8lu
         NX2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZo24yYDw1xP1jeFAAsNhVKf8dDJkL+1qJYKZmH5JBD/6h/11P+WoPYWdDPwOy7czCFlHohfcxh/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPZlMSp5p7hkBy2VkTRIPBVmVOBCpLGd3FNbpfWgya9AKnWK14
	qoOKFlVwOAhk2/ikRSu18rzLvclya0DQTohtZkgfVGEWnzUfnC3OumS9
X-Gm-Gg: ASbGncsgt0+lptpFDO5c+043fdNZAyYaSPZ54+LipVloI8QShb2RJi/N9tAN7Igkv9c
	Xtyo5X9qCAOOwhD7QbbyfI7kVKRRIGpP+hk+Y6q8bgx8Mg9bdq+5ReqJvU/VsnKiv5VaQZ71mbW
	k8nRe/ZoY5aSfbhaQmeO/tz0hRZoSu1Dpf3NHWO2RzHm+LXvkVvxg3a4WABBt7uvgML5QfgHZIn
	lyqJDMfuEfaPtz8jmaplG7KJsIR/E5Lsr6EUhm5KmrgUZkM+rQnDIv5KKLdlS43rPVvKQLkinWG
	ThAEL5hPM1QV0Wd78sfYEDw9t6bdzAjYw1XHTKmpPRdR2ORAM3wC9iuY0D8mxuplMRki17Lpy2E
	nO2qwWJXH1v8ddROmfhawNkacd/DYu5RN2YrGUGoVg48MPU+QyHzi
X-Google-Smtp-Source: AGHT+IGG+q0ieQsp6YHQm4OSNdUh6TFKKIYVrooi6skX+w389/d71u+8qnyE0A7jThdV080hsrl80Q==
X-Received: by 2002:a17:902:ecc7:b0:295:7806:1d73 with SMTP id d9443c01a7336-2957806269fmr60832765ad.24.1762139706174;
        Sun, 02 Nov 2025 19:15:06 -0800 (PST)
Received: from gmail.com ([2a09:bac1:19c0:20::4:37d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29526871058sm102183285ad.3.2025.11.02.19.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 19:15:05 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2] ppp: enable TX scatter-gather
Date: Mon,  3 Nov 2025 11:15:01 +0800
Message-ID: <20251103031501.404141-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When chan->direct_xmit is true, and no compressors are in use, PPP
prepends its header to a skb, and calls dev_queue_xmit directly. In this
mode the skb does not need to be linearized.
Enable NETIF_F_SG and NETIF_F_FRAGLIST, and add
ppp_update_dev_features() to conditionally disable them if a linear skb
is required. This is required to support PPPoE GSO.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
v1 -> v2:
 Changes dev->features under the TX spinlock to avoid races.
 - https://lore.kernel.org/netdev/20250912095928.1532113-1-dqfext@gmail.com/

 drivers/net/ppp/ppp_generic.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 854e1a95d29a..389542f0af5f 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -498,6 +498,17 @@ static ssize_t ppp_read(struct file *file, char __user *buf,
 	return ret;
 }
 
+static void ppp_update_dev_features(struct ppp *ppp)
+{
+	struct net_device *dev = ppp->dev;
+
+	if (!(dev->priv_flags & IFF_NO_QUEUE) || ppp->xc_state ||
+	    ppp->flags & (SC_COMP_TCP | SC_CCP_UP))
+		dev->features &= ~(NETIF_F_SG | NETIF_F_FRAGLIST);
+	else
+		dev->features |= NETIF_F_SG | NETIF_F_FRAGLIST;
+}
+
 static bool ppp_check_packet(struct sk_buff *skb, size_t count)
 {
 	/* LCP packets must include LCP header which 4 bytes long:
@@ -824,6 +835,7 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case PPPIOCSFLAGS:
 		if (get_user(val, p))
 			break;
+		rtnl_lock();
 		ppp_lock(ppp);
 		cflags = ppp->flags & ~val;
 #ifdef CONFIG_PPP_MULTILINK
@@ -834,6 +846,12 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		ppp_unlock(ppp);
 		if (cflags & SC_CCP_OPEN)
 			ppp_ccp_closed(ppp);
+
+		ppp_xmit_lock(ppp);
+		ppp_update_dev_features(ppp);
+		ppp_xmit_unlock(ppp);
+		netdev_update_features(ppp->dev);
+		rtnl_unlock();
 		err = 0;
 		break;
 
@@ -1650,6 +1668,8 @@ static void ppp_setup(struct net_device *dev)
 	dev->flags = IFF_POINTOPOINT | IFF_NOARP | IFF_MULTICAST;
 	dev->priv_destructor = ppp_dev_priv_destructor;
 	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
+	dev->features = NETIF_F_SG | NETIF_F_FRAGLIST;
+	dev->hw_features = dev->features;
 	netif_keep_dst(dev);
 }
 
@@ -3112,13 +3132,17 @@ ppp_set_compress(struct ppp *ppp, struct ppp_option_data *data)
 	if (data->transmit) {
 		state = cp->comp_alloc(ccp_option, data->length);
 		if (state) {
+			rtnl_lock();
 			ppp_xmit_lock(ppp);
 			ppp->xstate &= ~SC_COMP_RUN;
 			ocomp = ppp->xcomp;
 			ostate = ppp->xc_state;
 			ppp->xcomp = cp;
 			ppp->xc_state = state;
+			ppp_update_dev_features(ppp);
 			ppp_xmit_unlock(ppp);
+			netdev_update_features(ppp->dev);
+			rtnl_unlock();
 			if (ostate) {
 				ocomp->comp_free(ostate);
 				module_put(ocomp->owner);
@@ -3539,6 +3563,7 @@ ppp_connect_channel(struct channel *pch, int unit)
 
 	pn = ppp_pernet(pch->chan_net);
 
+	rtnl_lock();
 	mutex_lock(&pn->all_ppp_mutex);
 	ppp = ppp_find_unit(pn, unit);
 	if (!ppp)
@@ -3562,6 +3587,7 @@ ppp_connect_channel(struct channel *pch, int unit)
 		ppp->dev->priv_flags |= IFF_NO_QUEUE;
 	else
 		ppp->dev->priv_flags &= ~IFF_NO_QUEUE;
+	ppp_update_dev_features(ppp);
 	spin_unlock_bh(&pch->downl);
 	if (pch->file.hdrlen > ppp->file.hdrlen)
 		ppp->file.hdrlen = pch->file.hdrlen;
@@ -3579,6 +3605,10 @@ ppp_connect_channel(struct channel *pch, int unit)
 	spin_unlock(&pch->upl);
  out:
 	mutex_unlock(&pn->all_ppp_mutex);
+	if (ret == 0)
+		netdev_update_features(ppp->dev);
+	rtnl_unlock();
+
 	return ret;
 }
 
-- 
2.43.0


