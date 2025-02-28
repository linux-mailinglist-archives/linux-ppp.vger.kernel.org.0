Return-Path: <linux-ppp+bounces-268-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F04A496B3
	for <lists+linux-ppp@lfdr.de>; Fri, 28 Feb 2025 11:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6185175D34
	for <lists+linux-ppp@lfdr.de>; Fri, 28 Feb 2025 10:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37319265CC6;
	Fri, 28 Feb 2025 10:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvLDyR4u"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C972265637;
	Fri, 28 Feb 2025 10:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740737258; cv=none; b=d/QMIPnCVXIPa6XppQ+ZcPJDk4c2IMBXrHFDb0UQckbk4o58tM+iXLJg7/9bF9Rc+/07sBq7swvHAJvV3TtxFsrkrsU711XfPiyLD7+Dkmp/BngE+6nDtCClm58JY4bWjiPChNpe4IKACUp1g/I1kMPqBzbOBoOSKf8AaOzz038=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740737258; c=relaxed/simple;
	bh=SobFsDnTI4m6qTe1t20nYb3oIxkffHzDivI5WekYvSI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=THxB/keW0tz1fbeUYNkhIwfzLUp/XwZApDoDMMPtUzWdgFQgmmSRwt08dRlYT8kskUE0gQhYa/jRMPiEDsqewzdO8q51NP/dP3SH35rwyNNWBAI+NQQ9ngKzx3TgtVTltreaSgnPtNYoYoM1kXzOG67CiBs51lWxKgqQ/pubj60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvLDyR4u; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2febaaf175fso1203480a91.3;
        Fri, 28 Feb 2025 02:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740737256; x=1741342056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1KhittMhY0h/tO53ehIj8FCozghMnSK8sedrBTTc9Zw=;
        b=DvLDyR4uvp9OyaYOQIikfZvwoUHRiMuBMnN5N0KlngKpsLuEliW85UkBYgtShRcoq2
         9JEeS4u2sVUGDtDuHCanL79PygJJLlp95/38Lkey1dPBYrZSw4ggSactifmsELDGE3ZT
         PsxvSJw4xQ4VmuSukX+KbScnR3MGBCv190QHkPo9yaI0Jor0My/zeMTvaQr3cCyu+qaX
         eIBQYmBIUh4+fCGhVEDjnibN7AEyyRVREiO5BVc74EgPl2B3MbjoiQFFEcWQifBjJvdp
         5PRZDZ6wxOu3aZKNIsaAWBG59LbY+euZurVOY/R/EyzRKbi/cI7TwBzutlYJ2pObgdC9
         lPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740737256; x=1741342056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1KhittMhY0h/tO53ehIj8FCozghMnSK8sedrBTTc9Zw=;
        b=Xni8tb+dfKTS+x9iQwJBTYURIZeH+ODQbkcyHdcJWbjEIVIylSTny+wYGlfWD6HXdM
         o4hqXyO+MJplZMEw0j/e93dL1Sdppm51rYjP77yUnW0pBGnRW2z5YndM9TwYMwVD7JGa
         Gn3pDa4Gb28OHzduaBGrFv7+Xe1tgv1IxbHb1tNLP3Ja6sIzRmzmp5Mp6p+5boou5I/f
         74Hznz2HeX/f7JYdhhIvp8Zt1+wbdtNX8P+fmOquDbDJwqQh4ytdvGUUOyL/JSFuhsDc
         8u0pcX+RX/FefncvkKMHpWastFaGugXSAmDQDwZu674vzBvK8k9ljQNlWHbTU6wpnKGr
         2cEg==
X-Forwarded-Encrypted: i=1; AJvYcCW01VnQlhz6aIfMLvgGmNMGOECnJ9tZQ4fjfuTvOXheYce6mOXo8k9EE9jChlg9/sFJ8hH5QIrL@vger.kernel.org, AJvYcCWqNNSg6k7skKEdieUVsgk7XWZAo7s0aOHZWxvhNfzWvSEk7IB6ZoVk5ZCCNwbTLcQe9nCShyM13l4AgSU=@vger.kernel.org, AJvYcCWu7YRuQxOdtc+smjMIc9XY/IAOfTNuTs0V+TMQWzNSxy8uUMlSRoPaE/JY1iqs8lD09/4y8GbS+7GY@vger.kernel.org
X-Gm-Message-State: AOJu0YxKXk1Y5aq5H1+D8PS8o6HtWsJGx1RqeZ9/yqSoJKjOkkyE1SCQ
	TETPDBmxnBmJFLyGx5/hPB+eqwiterm437CsiPvHbI+5wH3mPD/c
X-Gm-Gg: ASbGncsmVlCqWhlx+j1/NLhZADnqQ00YX7ZNEGBdYR3yZOde59/qqFLXxDTosZBMnNi
	voPvVdSaGfiiqWm/jFClpo2lnSyAnMllymvHd5ydh9GDZdXRrGlRrtVPcylQddUyJC/MdqzRUky
	2e/vI0qqyVuVnE6xJve1KOzgn/KwO+49bN3FuYjeY6xlM5zU7Nonw2Qena15y9J28Sxb6ZPcdsK
	0/UhgfxacvqCh8LTXqeBWd4jzI9iLjCdIUTZ2JICG/37wQjmJkR9u24VmnRn718TZORZJdqJzS/
	++3yX/Gv8jIRdyII7Lo=
X-Google-Smtp-Source: AGHT+IEFyR2TWrO1nRdqRdyz5cjQm4zsLOTSk6QlzmmxKbItYR9Ye1wOLsDfbx+ltJKM+QuAchFerg==
X-Received: by 2002:a17:90b:3bd0:b0:2fa:2217:531b with SMTP id 98e67ed59e1d1-2febab71b22mr4034275a91.21.1740737255558;
        Fri, 28 Feb 2025 02:07:35 -0800 (PST)
Received: from gmail.com ([116.237.135.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe8284f116sm5957009a91.49.2025.02.28.02.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 02:07:35 -0800 (PST)
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
Subject: [RFC PATCH net-next v3] ppp: use IFF_NO_QUEUE in virtual interfaces
Date: Fri, 28 Feb 2025 18:07:28 +0800
Message-ID: <20250228100730.670587-1-dqfext@gmail.com>
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
v3:
  Move direct_xmit above the unused "latency" member to avoid
  confusion. Should I remove it instead?

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
index 45e6e427ceb8..53b62e145078 100644
--- a/include/linux/ppp_channel.h
+++ b/include/linux/ppp_channel.h
@@ -42,6 +42,7 @@ struct ppp_channel {
 	int		hdrlen;		/* amount of headroom channel needs */
 	void		*ppp;		/* opaque to channel */
 	int		speed;		/* transfer rate (bytes/second) */
+	bool		direct_xmit;	/* no qdisc, xmit directly */
 	/* the following is not used at present */
 	int		latency;	/* overhead time in milliseconds */
 };
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


