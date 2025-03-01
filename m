Return-Path: <linux-ppp+bounces-272-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 279AAA4AB6A
	for <lists+linux-ppp@lfdr.de>; Sat,  1 Mar 2025 14:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 517083B3E7C
	for <lists+linux-ppp@lfdr.de>; Sat,  1 Mar 2025 13:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471601DF24D;
	Sat,  1 Mar 2025 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeZpDrTC"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD081E522;
	Sat,  1 Mar 2025 13:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740837326; cv=none; b=nBPCtKecysU4Kr2N4UpaEjqjlvyT2HvAhSA20nAIgmDYZy/jxjf+ycu7TiPFNtejDr0DckedkdK9gjg55R/lTjNPKEFyx96+GVAJEUqg7K5bj1C+pqZUhpfLD7cbkuWXmJDiTKmC0DMpYkun7taStqMPovTfgSi1t8un0Ntfxbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740837326; c=relaxed/simple;
	bh=+mrPZHHSsQP7nU/rMAbtkBPhwztod/wRhwfeKlP8lC4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=bz4XCCod6Q+BUcEb7ZQXEg3N4NRX81G4OSnZRuNjPec0UfRfZ3YnIeGSf53PDQ7AvLBQsq8mFT5ouzgaqBKplnx0dJunWV35RYufMjDLEuMd2JXyMfu9c7iliZPLocvDqKBjKU49k7q8is2Kek7G8NeYmbldSr397jFMoaDluo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CeZpDrTC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223959039f4so3334695ad.3;
        Sat, 01 Mar 2025 05:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740837324; x=1741442124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l1I8PVfs4+GvFFMfDb24JsmlYi7QK/OiALkoJ1xatCg=;
        b=CeZpDrTCwIkkb6FvmCexsM1kkvzjI2QxeJw9Dw3T2lNibDQDrYcZR88xuJ12/2AXV4
         QTdAtUT+Hl9SVfu6SkfG11dXnRWfUU+Y9vZ5BDpWLFx0HZFC1YJK0830iCF5ls/mgAWc
         RZz1Z6vaIhDle4CUIgTKfk9937Wn0yDdFFEyl7JPKroDNsLLf5tIT7ydUdxexTTBuW8E
         oZnkKI+c9UC3bQzywXX3wVMHHAx9DZIHAqeFqqx6U3kwJoondAzIMS5EEjG95jvtSKyW
         ww913PA9no26RJAXM9BnYSlgvN9mlMf3WAXAuSwVH3mqqPskkmZa1yqbVxW3w2p3U0Fq
         xweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740837324; x=1741442124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1I8PVfs4+GvFFMfDb24JsmlYi7QK/OiALkoJ1xatCg=;
        b=doUdfCaFWt8GaE5ejhfC/wse974QKg4RO579zpA/iwNQiLv34my3HUjspq7ymwg5CC
         yZ15YBys/SkY4h6cS8VjcE2KISaXEwvjc0XkPrcBvg0QNx5UKtU07be7MZrpC0zoYJuS
         gnZUHyqIqnOI93jzAR3DxDUYyjMmu84KdJCXELGLPZamfBFnrV3ZYmWYTx5IT60e1NWL
         qbKY8zaZYDs38gRs8cRs2hR2VeiGS7FFH3n9/mxCnn4rGKJUud97LNOH1Op4EgwPhOub
         0PEjmA6a0QUYm0bUYvdyiESvzQcFSW7zk/6y2cL1FylUz6gf2QKJl4j5vLTp/GHMfgOx
         RkpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8yGATKSzJAvz0ljovnuS0NuXa/ydJjsoCoQubizypV86p9lV0DEYiAb4CVekdeY4WfBAHq9C/@vger.kernel.org, AJvYcCUUcVzcxnfV1VsoKsRCkaAMQRIWW1rXeDH2y4Ss0rV2W8ti7M5IC2TGiQxFCosnTCFcl03Ynx6LQQYF/Gg=@vger.kernel.org, AJvYcCXeMq4XcAc/REzqKHEQlGcmqE6QBUPUJpaDwRwSRfzzffmkzrvSzEVUsQ/RUYV8nhRJ4CDvRAUdguS0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2cAMz2Hye3P+pBzXWCf6ITPYmOz0UwRKW1bH1ttAyYUiNhio2
	4PTOW9kROZAsuDaJunNTlMNjsKhsOilJb26ZNQWxzBzaSesARxDt
X-Gm-Gg: ASbGnctiwJuBD7zZS0ZhRKOpadfLwPE0XsCMHwn6zBhR6wZoJVHJ9O1/tYcLhrgdfBW
	b7wD2KFCRAfY+ZQS3Pg/47087fPSsLAtPwcLeveZBj56XzkQTyrIk07+E311lNI9JSkhSLJ/Nuj
	03URHunlY9rKpzdFM/Tqcat9liTf0lCppjOD5lJIfSk9dLS1oP/oJxGA5DU3tegJQyXaYY4reVl
	OvprOIfBkTrTbWCj/b5AcjuqYlaOV/OjhIeiSA/ZwS0CIqWgBHMBDXtg4gu94is06JhoQIfvVHS
	grHkaBhCoODRvsVAKYr5+1RQTx2wTycAHqFYQg==
X-Google-Smtp-Source: AGHT+IHGKZRZmAndOYzn/cvVVCvYI8zxa3WIt8+bh7D6LpjEMNa15wqGPXXiDXP4Q07JmV+GvXCqRQ==
X-Received: by 2002:a17:902:fccf:b0:220:e63c:5b08 with SMTP id d9443c01a7336-22368f6a1b5mr82188755ad.11.1740837323880;
        Sat, 01 Mar 2025 05:55:23 -0800 (PST)
Received: from gmail.com ([116.237.135.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d529fsm49058765ad.48.2025.03.01.05.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 05:55:23 -0800 (PST)
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
Subject: [PATCH net-next] ppp: use IFF_NO_QUEUE in virtual interfaces
Date: Sat,  1 Mar 2025 21:55:16 +0800
Message-ID: <20250301135517.695809-1-dqfext@gmail.com>
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

While at it, remove the usused latency member from struct ppp_channel.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
RFC v3 -> v1: drop RFC, and remove the unused member

 drivers/net/ppp/ppp_generic.c | 4 ++++
 drivers/net/ppp/pppoe.c       | 1 +
 drivers/net/ppp/pptp.c        | 1 +
 include/linux/ppp_channel.h   | 3 +--
 net/l2tp/l2tp_ppp.c           | 1 +
 5 files changed, 8 insertions(+), 2 deletions(-)

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
index 45e6e427ceb8..f73fbea0dbc2 100644
--- a/include/linux/ppp_channel.h
+++ b/include/linux/ppp_channel.h
@@ -42,8 +42,7 @@ struct ppp_channel {
 	int		hdrlen;		/* amount of headroom channel needs */
 	void		*ppp;		/* opaque to channel */
 	int		speed;		/* transfer rate (bytes/second) */
-	/* the following is not used at present */
-	int		latency;	/* overhead time in milliseconds */
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


