Return-Path: <linux-ppp+bounces-355-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E3CB49EAB
	for <lists+linux-ppp@lfdr.de>; Tue,  9 Sep 2025 03:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18F527A71F4
	for <lists+linux-ppp@lfdr.de>; Tue,  9 Sep 2025 01:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FEA1FDE22;
	Tue,  9 Sep 2025 01:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/9Y4851"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275811B4236;
	Tue,  9 Sep 2025 01:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757381280; cv=none; b=jEQeopMvIarmfgDqAHmiO9B9PMLH/mGz0rN/kdTzBh+XHvF13sdEi3W/z4gK4RZBbYSUenLS/dFlRXRWUvkgnNxw50tslelzNXFc0J5HYQQEquAXxvKqXcWcJWszL5xZyDZpPDQllSRT3r0omD+eLqWloF8/5d6i4O1tQz3E7pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757381280; c=relaxed/simple;
	bh=B5ZFMkGjmY+vIrXnKhTW9Lh6m3Wku/o+F3qXKFeoB8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=THRbhZnUPMfenFs0K5C76iMHKlCB3AAj8JWmKtXVfBL7sP8DZZ9Yyx+oQJ4YJrR/hTK5jPSV+Q/qFVktZbiD8KTvCsuA28H8pff682ujVDNf57EbjVICnAoiy7xR0YOeiHK4wRqWrf9uhQr05omjjx7kxFSGM7/cfGEJf/1MJUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/9Y4851; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24b21006804so53895875ad.3;
        Mon, 08 Sep 2025 18:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757381278; x=1757986078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zVL5RQzUcb9PU/O16qoWzzj4q/7jnz1L2B/aT6TsKSE=;
        b=G/9Y4851kFEjbRrdrcIPcCXeUhuyTvXY/3qB69njJLtRdZ0rwqSSvv9H0Y0M7ELA2X
         moX66wW65p5t2ferm/GHXcAiVtmUX7TnehazS8j1kHILXaR9COThIcCQHFt1pE/l79IJ
         o8j1vOqbz57utOOCfga5MjCEn7xr6Ela8eEuXPLSRnnLrQNIytuD/0gfH2QzAI/en6Nh
         SnV543dla5L8OSzbusonUNnxqZcmmpHYFCmFiIaQKmqfpqe5gRSVUneL9x8vd+ZuLofc
         08cRNcnvsM0ifJHjEEsMMvEcYqGpjBRFmvyP8RaS6OlKkvpynINmaFp1rK7LE9R45AEh
         9WNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757381278; x=1757986078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVL5RQzUcb9PU/O16qoWzzj4q/7jnz1L2B/aT6TsKSE=;
        b=BlUTUzUb/MZhqrJvisokYta7Ye8+QB5d8d01y2Sw+QBHGzOr3RIm3azGAlR137RT3a
         Q92BbRoA6JxpVjIw+wCxKQZhHCkEHBHBe2GhTx7MrAFEVp7TsxI1PA+LhjpTOZqSUrAC
         84b/amhMvyuoBG7kK+Qi7pOz3zP7a/0eFFw0AfOg/3KrRlRuOV5gif4EBZ6UmQQfp691
         KK3GpVHhGJZtKWnbMhxsk57mJ04kfD2uCxJyhAYxBwsW6oCeekM8OV+DQPlDlUv/V+Y4
         uLnM62gvS0q3etPm7fTlmurxLDfhEi5i5UoHtuAhnV0eJo3HWXiwUJq3tYSSvNElpMEE
         cB8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGsdUe8jTlCIMe4gal1CLJjPaPk49Ymmv037BqMwTg+Aj7tpb87z5vaOQ3CTC4hryeljVQKGxo@vger.kernel.org, AJvYcCVODhKnnI+lzFVGF+qew7PCPIZU17Fd8VYemHfJXQdEPW9DWFR9K5Qwv+fsWoDCDnu26UzDojHsmE9fuN4=@vger.kernel.org, AJvYcCXa2hq+w93xnfMcpvHTNzr+tz/xNev6VGXjlhafi8iGNOskPaY5q/xD5z2Lx+r6sY9AXFObf8e8uP/2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz46YzdUXkfUo5z2+OebWanSJgHKZ7XxYG8zR+YLkfHlnHgo2wT
	gTdL8PAV66H0Mb3XQvbAYwgZEmxl6VkRBs9XEVEJkl7vQHJWIj8Rfdpl
X-Gm-Gg: ASbGncvA9ouBfVE/cIlpAljZpwoUGSVgHq2ggqbhT5uU+nD4RjeOI7eQRnYdFFiB945
	NWM03dhTQUly96918+rKYdzGTAtD2gERkJQJphS5P0nWZVBuuRn4QZ1/r1PjiNtyonqJThhcnnr
	HN6mjHKJxFjvAcZVY3mupBbgB2PgzAAt5BniERsgNb3nNA3NRTefY/BGAJYv8l9Y6uGXgk9Hus/
	UDoaY2P1q95uDcAb96nqxHJ7M/SwJFLSRCrAU+/cYG9TcOOox91UL6tzbq98qAoYOfIeV29DB8Z
	yRCL9o72AvNOBhY47EAEElZS2FVD6+1fX6esKyhGgxvJPeXhpmm7L8Z7KQEFs8KCC9sBQCNkHUQ
	ZJ1PJ4G05U+jitN2Lgi7tBZvm
X-Google-Smtp-Source: AGHT+IEPtuO7DboDqC0Z65bSwRCzFJptOMP2db+sMR313mW4hzlCUzZaKdQapUJHP8Ppi+kuvjZ4AQ==
X-Received: by 2002:a17:902:8342:b0:24c:a22d:4c34 with SMTP id d9443c01a7336-25174373ed5mr90647735ad.41.1757381278329;
        Mon, 08 Sep 2025 18:27:58 -0700 (PDT)
Received: from gmail.com ([223.166.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1f7492d8sm182020375ad.129.2025.09.08.18.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 18:27:57 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>
Subject: [RFC PATCH net-next v2] ppp: enable TX scatter-gather
Date: Tue,  9 Sep 2025 09:27:42 +0800
Message-ID: <20250909012742.424771-1-dqfext@gmail.com>
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
Enable NETIF_F_SG and NETIF_F_FRAGLIST, and add .ndo_fix_features()
callback to conditionally disable them if a linear skb is required.
This is required to support PPPoE GSO.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
RFC v2:
 Dynamically update netdev features with ndo_fix_features() callback.
 Link to RFC v1: https://lore.kernel.org/netdev/20250904021328.24329-1-dqfext@gmail.com/

 drivers/net/ppp/ppp_generic.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index f9f0f16c41d1..22e17f8fb61f 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -835,6 +835,10 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		ppp_unlock(ppp);
 		if (cflags & SC_CCP_OPEN)
 			ppp_ccp_closed(ppp);
+
+		rtnl_lock();
+		netdev_update_features(ppp->dev);
+		rtnl_unlock();
 		err = 0;
 		break;
 
@@ -1545,6 +1549,22 @@ ppp_get_stats64(struct net_device *dev, struct rtnl_link_stats64 *stats64)
 	dev_fetch_sw_netstats(stats64, dev->tstats);
 }
 
+static netdev_features_t
+ppp_fix_features(struct net_device *dev, netdev_features_t features)
+{
+	struct ppp *ppp = netdev_priv(dev);
+
+	ppp_lock(ppp);
+	/* Allow SG/FRAGLIST only when we have direct-xmit, and no compression
+	 * path that wants a linear skb.
+	 */
+	if (!(dev->priv_flags & IFF_NO_QUEUE) ||
+	    (ppp->flags & (SC_COMP_TCP | SC_CCP_OPEN | SC_CCP_UP)))
+		features &= ~(NETIF_F_SG | NETIF_F_FRAGLIST);
+	ppp_unlock(ppp);
+	return features;
+}
+
 static int ppp_dev_init(struct net_device *dev)
 {
 	struct ppp *ppp;
@@ -1619,6 +1639,7 @@ static const struct net_device_ops ppp_netdev_ops = {
 	.ndo_start_xmit  = ppp_start_xmit,
 	.ndo_siocdevprivate = ppp_net_siocdevprivate,
 	.ndo_get_stats64 = ppp_get_stats64,
+	.ndo_fix_features = ppp_fix_features,
 	.ndo_fill_forward_path = ppp_fill_forward_path,
 };
 
@@ -1641,6 +1662,8 @@ static void ppp_setup(struct net_device *dev)
 	dev->flags = IFF_POINTOPOINT | IFF_NOARP | IFF_MULTICAST;
 	dev->priv_destructor = ppp_dev_priv_destructor;
 	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
+	dev->hw_features = NETIF_F_SG | NETIF_F_FRAGLIST;
+	dev->features = dev->hw_features;
 	netif_keep_dst(dev);
 }
 
@@ -3537,6 +3560,12 @@ ppp_connect_channel(struct channel *pch, int unit)
 	spin_unlock(&pch->upl);
  out:
 	mutex_unlock(&pn->all_ppp_mutex);
+	if (ret == 0) {
+		rtnl_lock();
+		netdev_update_features(ppp->dev);
+		rtnl_unlock();
+	}
+
 	return ret;
 }
 
-- 
2.43.0


