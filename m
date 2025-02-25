Return-Path: <linux-ppp+bounces-257-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 833E0A4339A
	for <lists+linux-ppp@lfdr.de>; Tue, 25 Feb 2025 04:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF4A63B4F27
	for <lists+linux-ppp@lfdr.de>; Tue, 25 Feb 2025 03:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D1A24BBF0;
	Tue, 25 Feb 2025 03:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLCawBuI"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573F9B64A;
	Tue, 25 Feb 2025 03:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740454145; cv=none; b=hIY6ZNH2wVsyl34CfM2I3Q2VZMwsFRzyXylvqpHRmpXgrAR1Uj1WVCHjdGmgG+EKzCyxx29UPwdCJtPkCc00OVx7P8+NWFmuY6sX0Qh0j0IU2BeLRPiGs4grdGg8P0tD+31M6rouZ/pMBqq9XhWiaaG4mB19x5iCtW9/5jGE+gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740454145; c=relaxed/simple;
	bh=HNF5qY7BcDGhNusjatnaf1e0WWQ+PW81UQ8dQHSQ784=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=I+LiLKXPVzNRn3rFH52w6T5ULa8tqFFqeOj4uVIfbGkF72DUP30LFUdulOtCjzO6Ljzo8xD+duLB7km+FA/QKqzDPCvjFZ0QRDQVFRZXXlh5Uyf5jT118WKsQ1D/UJYpv9DW0+QiHCmZsBj3rpWIN3bCyLa062o24UfYcmuLuqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLCawBuI; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fc0026eb79so10462809a91.0;
        Mon, 24 Feb 2025 19:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740454144; x=1741058944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fql5ZM7tGQctn/RMDADJ21jSeiX4fcV+EhY7+A0lcRM=;
        b=FLCawBuIVx4pkjPpgL31QYhuE3EWgaZSMCC53GqSI0mAKPTkSne5Cy4PEA9rIrPNbO
         ZbyneiA2LiAtVmLLuqpw30FbEW/M2QzR9KU0hfCsVSY/f2Lj1f3m4sSIKOXim5B9zIpJ
         43zkBzamMI9Ju4GRkAf+xL2AGMdedWf8RiNOIkHg2bTyjAI0zk96XAQpkwclgpvD+aP7
         fxmvEV7hKMFSE76awGaufeIpkzK6nmHJ0H4ktt0fg57XBA6OZUajIP8+HOJIJkHxQNL8
         M7bstP1UQG3O+RO7xKD45UGbnCPtEZnjrG2lsfZz7Z4sXufGy1P0AezWiAyfl3U6vFic
         bfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740454144; x=1741058944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fql5ZM7tGQctn/RMDADJ21jSeiX4fcV+EhY7+A0lcRM=;
        b=LW5OgNxZ3IHtY3DjzjYQEithZT20pSSNR9G9ucfj6T2HqI/+kYRXBSKzaj8sj9DmF8
         kvuEaIQSl0QD6bg1ffkeMxUe1n2FHqa65iCsGnITA/tuJ3FB698THRMhGDQ/na8DHeKl
         bmOaru9NU71rdTTBCRBSQR2Hpqlf7fGgFFzekPRo+ObUAhMEQrVZxQWpG5fd95h6bZXZ
         AyLgbrymF0hkPTrnSlQCsRg6TUbKhHtXulm6ngWe0thdteaj33IH/ZrjU0Pf9ZwdPGL5
         VVVd0k+dWpI9mr6aTM9Ay2T4x8MkRcZ8E7inrikavDwGjcg8M0RML0Yasyt2ft4ielz3
         0+jA==
X-Forwarded-Encrypted: i=1; AJvYcCULxWZbfTQBePWaJ89jWJKCbO5fdPUuJO+rFFwiSGqHLKtJd4GxAhrZsnBjZEeJs0FtDYWFf2dT@vger.kernel.org, AJvYcCUMkRWYVNv3yhim4wCQ21novoqhkxUcj7PVrGwRZoEQxOQEPxPetfPpGbY/Dvh+lgcaYLMomqlmJUsKyNU=@vger.kernel.org, AJvYcCXZoXM8NDBGH3I3USGgRsEHviczA0pVfTogBIEAyZl5vCnACnLrU3HvfkRRUL2+LTpUSDk7xLuSl9en@vger.kernel.org
X-Gm-Message-State: AOJu0YyVcMDZumISl6SV+bRDRYYBuRertTyI40N54wkIzfWXdS7IqsLe
	te4NRPfcHUpG6idN50IBhpu6JbXUqpCDmsOYXhB5kTwJJ6r0Ozg7
X-Gm-Gg: ASbGnct/Ytcw8wGObeQm74kQ4lSAXXN8UVZz1LiJ6MiWTpzcxEkMFh+AngtiR0/zRjh
	I3QFrYKpAuRsLZ8ys+jO1QpvCn0XFKyrPbGrVosDbTNEmxKxOy6aPVOpDsqC2I0uD5XTCIkwDVO
	13+RHb6ndcbZq8okG/D9lmduX2YPl443nlRljCCDVhAp5R/rm8NRK20MU9K/CVxx4TW5/e16gbv
	AAjmk3oGpwCm8qQX+wSu/4Xz87okMnG9dnX4n1im5YN852Pcyc2Qc/EI+x3pMyWKq3zmXTcAwwa
	/t12Rn1UtWKmsQz19pY=
X-Google-Smtp-Source: AGHT+IGadayqsnieMR0Q2/Su+sqJ3Jn4Yqpo4+g/vzmlYcvooG/4D/PkCb2/acemOSpHE1JfpHkiCg==
X-Received: by 2002:a05:6a20:1586:b0:1ee:8520:f979 with SMTP id adf61e73a8af0-1eef3dd06b6mr32454428637.36.1740454143461;
        Mon, 24 Feb 2025 19:29:03 -0800 (PST)
Received: from gmail.com ([116.237.135.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a837592sm396474b3a.168.2025.02.24.19.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:29:03 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Ostrowski <mostrows@earthlink.net>,
	James Chapman <jchapman@katalix.com>,
	Simon Horman <horms@kernel.org>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next v2] ppp: use IFF_NO_QUEUE in virtual interfaces
Date: Tue, 25 Feb 2025 11:28:55 +0800
Message-ID: <20250225032857.2932213-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For PPPoE, PPTP, and PPPoL2TP, the start_xmit() function directly
forwards packets to the underlying network stack and never returns
anything other than 1. So these interfaces do not require a qdisc,
and the IFF_NO_QUEUE flag should be set.

Introduces a direct_xmit flag in struct ppp_channel to indicate when
IFF_NO_QUEUE should be applied. The flag is set in ppp_connect_channel()
for relevant protocols.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
RFC v1 -> v2: Conditionally set the flag for relevant protocols.

I'm not sure if ppp_connect_channel can be invoked while the device
is still up. As a qdisc is attached in dev_activate() called by
dev_open(), setting the IFF_NO_QUEUE flag on a running device will have
no effect.

 drivers/net/ppp/ppp_generic.c | 4 ++++
 drivers/net/ppp/pppoe.c       | 1 +
 drivers/net/ppp/pptp.c        | 1 +
 include/linux/ppp_channel.h   | 1 +
 net/l2tp/l2tp_ppp.c           | 1 +
 5 files changed, 8 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 6220866258fc..815108c98b78 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -3493,6 +3493,10 @@ ppp_connect_channel(struct channel *pch, int unit)
 		ret = -ENOTCONN;
 		goto outl;
 	}
+	if (pch->chan->direct_xmit)
+		ppp->dev->priv_flags |= IFF_NO_QUEUE;
+	else
+		ppp->dev->priv_flags &= ~IFF_NO_QUEUE;
 	spin_unlock_bh(&pch->downl);
 	if (pch->file.hdrlen > ppp->file.hdrlen)
 		ppp->file.hdrlen = pch->file.hdrlen;
diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index 2ea4f4890d23..68e631718ab0 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -693,6 +693,7 @@ static int pppoe_connect(struct socket *sock, struct sockaddr *uservaddr,
 		po->chan.mtu = dev->mtu - sizeof(struct pppoe_hdr) - 2;
 		po->chan.private = sk;
 		po->chan.ops = &pppoe_chan_ops;
+		po->chan.direct_xmit = true;
 
 		error = ppp_register_net_channel(dev_net(dev), &po->chan);
 		if (error) {
diff --git a/drivers/net/ppp/pptp.c b/drivers/net/ppp/pptp.c
index 689687bd2574..5feaa70b5f47 100644
--- a/drivers/net/ppp/pptp.c
+++ b/drivers/net/ppp/pptp.c
@@ -465,6 +465,7 @@ static int pptp_connect(struct socket *sock, struct sockaddr *uservaddr,
 	po->chan.mtu -= PPTP_HEADER_OVERHEAD;
 
 	po->chan.hdrlen = 2 + sizeof(struct pptp_gre_header);
+	po->chan.direct_xmit = true;
 	error = ppp_register_channel(&po->chan);
 	if (error) {
 		pr_err("PPTP: failed to register PPP channel (%d)\n", error);
diff --git a/include/linux/ppp_channel.h b/include/linux/ppp_channel.h
index 45e6e427ceb8..3b50802d66fc 100644
--- a/include/linux/ppp_channel.h
+++ b/include/linux/ppp_channel.h
@@ -44,6 +44,7 @@ struct ppp_channel {
 	int		speed;		/* transfer rate (bytes/second) */
 	/* the following is not used at present */
 	int		latency;	/* overhead time in milliseconds */
+	bool		direct_xmit;	/* no qdisc, xmit directly */
 };
 
 #ifdef __KERNEL__
diff --git a/net/l2tp/l2tp_ppp.c b/net/l2tp/l2tp_ppp.c
index 53baf2dd5d5d..fc5c2fd8f34c 100644
--- a/net/l2tp/l2tp_ppp.c
+++ b/net/l2tp/l2tp_ppp.c
@@ -806,6 +806,7 @@ static int pppol2tp_connect(struct socket *sock, struct sockaddr *uservaddr,
 	po->chan.private = sk;
 	po->chan.ops	 = &pppol2tp_chan_ops;
 	po->chan.mtu	 = pppol2tp_tunnel_mtu(tunnel);
+	po->chan.direct_xmit	= true;
 
 	error = ppp_register_net_channel(sock_net(sk), &po->chan);
 	if (error) {
-- 
2.43.0


