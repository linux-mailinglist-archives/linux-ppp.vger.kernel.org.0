Return-Path: <linux-ppp+bounces-352-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA4CB42F83
	for <lists+linux-ppp@lfdr.de>; Thu,  4 Sep 2025 04:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68FAD7A7187
	for <lists+linux-ppp@lfdr.de>; Thu,  4 Sep 2025 02:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02711DC9B3;
	Thu,  4 Sep 2025 02:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZIy48jA"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5E01DF75A;
	Thu,  4 Sep 2025 02:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952025; cv=none; b=H0WHza/3OWGZ6RZOqx7xdRxypgK/D6iQh5tTTaN7MrceTbSNY8S+8xxELvD0kwdZFLnp6dEEG/4fFWfl4GjcJ93trROYDYlFAr0GW94zvIZdhNa9HYW9QybyR9u+ydkqHgwpFPpkIehamB0TmY72+KDjVHW783LOPXvKb2flP+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952025; c=relaxed/simple;
	bh=3g7cY+03XIWLWUoKFNp3F/aqlhRv74KCmVg2qDPm5W0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TnQeabAG9ZGHoevG1q9ysyI1VkE7pZ3wftLqiKl0Is5Ryx7usYJk06XTObVcZGT+uigpVX6dGWOEEfDPlYQ1vFJ7ItaHEJYAB3o29QVJlKM8Ln+fGJ0Fu40FJiU5gYBnhoC7aLgIq+itvnpAt6SORmqtB6F7W8CZErUtZLPndbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZIy48jA; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7722c88fc5fso536904b3a.2;
        Wed, 03 Sep 2025 19:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756952024; x=1757556824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3hUrML5WljsUlFCqa+ikOvh0WLrz2uOx6fHEzlvAb34=;
        b=eZIy48jAwE8HH1RiA7UVfduIZLUZNNw6CKg/7vTQHCp4fuxrSNLiEJPMCYzIB/Oy4s
         1uCog4SktbYruZzVwhtfoTGmpa4xRkE9sGgmea6HrmrynfmH2/ea5uNuCxLxnVeRQWxo
         Q3P6d7Hxs2p2gy0P0BEsEgCx8OYKy1DdmfKvLS7CfZ/avLAbhgPWJevYhjle9nZlnpnt
         NaZbsyGPvU5gE4oH2Sl7G/mrYYsSLE93BwMwUAvRb79oNkUUWfL+OmzguXhWAqO5MKDF
         +2ZSzk7QlNS9UbNPANsnBkwmIG8rOpr6HarFxnpWkV3344J+6kadDZfSj2xpIIIR73lq
         ZWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952024; x=1757556824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hUrML5WljsUlFCqa+ikOvh0WLrz2uOx6fHEzlvAb34=;
        b=naprSQbuKfijn/AlONLSt4UYbovM5J0jf7T99Nh74VnmxhW8XNhIF0BrZwIXOaqQ/6
         B+J3FlPABO0Lakz+1my6JyJBGOxVgrv4HEnMdYKBbMVDsvPg33DbQ7HT8/pmjzxT+p2H
         RTvcyHkWsK2TXQ+OzKqnU3qCdbsi9Niwm+ZuLn/4gvS/zKT5FRR0j6YQT0L7Ar/xWq2e
         4KmjXLqXuMIvsWucsXY9J4enctYX0wd3k5t5555HF8tS+WZE7Mp5V14Ax3col4/RF3Hd
         SfNiB2YPqX+2NIhJ73wwKQ71VrvyODZ/lr6DB7cSiO/8mDjiBHBOlOuAnltLci+nFH4s
         SITw==
X-Forwarded-Encrypted: i=1; AJvYcCVLt73kchFckVwE3v1vJgHJ79GhZLKyxi3ltgEz0GMGTztOM6X5g+gutfVvUoljFm3feA5uDKGZ@vger.kernel.org, AJvYcCVamgXcNCvxmGgSP7ryGPF7K+Oh/DlrGskqUKyIUqBuHfoLiyforWMG6CxalyaRKWv8eHed1xke9fm9@vger.kernel.org, AJvYcCWAHUTE1xWW7RlS+6r91s5PNsDdMt1m9CUjVvHD9gq2QTtys+XzWudIy76+cI1wwelxyL4tnkEYfbCLSJE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya4D+GHy7IYf+TSL5xOC9deuH4YbDi8aVurqMUwha5rNndByuc
	oETtI3Mlovmtjp/afN2n+mq2Bldy6Me0Ce2IB+6XLccOdJQTyp7i1Ize
X-Gm-Gg: ASbGnctOdaE8TFPfNqwbyoZam94v6+3IqWJPu/cEaikIJpFG7IEN322ni1h0/JPYLDR
	8fj3ny/wa0toO8DOQ6ABMcwNKCrxLZCOaHDJj5asgGrGCBcPfXN6Jx6AagLAd9vNHr1TnHyWgBd
	pk/3CvFBrCYe12J/H5A9exuvzrG2r0hscPX+tsZ2v+hrYHgcqH7cJWRvkMU4k+o4D/D7nPKNwap
	YuEbHCCZNWN7sdjOeh+IwMbtjYhPDPjH+19SY2eseZGdntd4LWMJOPQiimCpHlRtNDKx5dgaVOC
	WRvEs0AZr/9VVnTVbgVib/v1HLqncyhjxXmped1zC+Ug0Iq3ejl1N6C2qM7A1PvK5DzLF03DUNa
	qeiDZQCFWXy0PceNWVfTlKQFZ
X-Google-Smtp-Source: AGHT+IF9X57LhT2xyoyX21PxzcP6C6ovW9Qg3hf6aWtPbtciUJUmtB+wCBsuYJCDRZwrBWc/16R0/g==
X-Received: by 2002:a05:6a00:114b:b0:76e:8e95:1382 with SMTP id d2e1a72fcca58-7723e1f466cmr17967981b3a.5.1756952023447;
        Wed, 03 Sep 2025 19:13:43 -0700 (PDT)
Received: from gmail.com ([223.166.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77241f08b45sm13976803b3a.22.2025.09.03.19.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:13:43 -0700 (PDT)
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
Subject: [RFC PATCH net-next] ppp: enable TX scatter-gather
Date: Thu,  4 Sep 2025 10:13:28 +0800
Message-ID: <20250904021328.24329-1-dqfext@gmail.com>
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
Enable NETIF_F_SG and NETIF_F_FRAGLIST if chan->direct_xmit is true, so
the networking core can transmit non-linear skbs directly. The
compressors still require a linear buffer so call skb_linearize() before
passing skb->data to them.
This is required to support PPPoE GSO.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
RFC:
 This depends on a pending fix:
  https://lore.kernel.org/netdev/20250903100726.269839-1-dqfext@gmail.com/
 There are also alternative approaches:
 - set SG and FRAGLIST unconditionally, and use skb_linearize()
   on !chan->direct_xmit paths.
 - don't use skb_linearize(), instead fix the compressors to handle
   non-linear sk_buffs.
 - conditionally set SG and FRAGLIST based on whether compressors are
   in use.

 drivers/net/ppp/ppp_generic.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index f9f0f16c41d1..3bf37871a1aa 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1710,6 +1710,12 @@ pad_compress_skb(struct ppp *ppp, struct sk_buff *skb)
 		ppp->xcomp->comp_extra + ppp->dev->hard_header_len;
 	int compressor_skb_size = ppp->dev->mtu +
 		ppp->xcomp->comp_extra + PPP_HDRLEN;
+	/* Until we fix the compressor need to make sure data portion is
+	 * linear.
+	 */
+	if (skb_linearize(skb))
+		return NULL;
+
 	new_skb = alloc_skb(new_skb_size, GFP_ATOMIC);
 	if (!new_skb) {
 		if (net_ratelimit())
@@ -1797,6 +1803,12 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 	case PPP_IP:
 		if (!ppp->vj || (ppp->flags & SC_COMP_TCP) == 0)
 			break;
+		/* Until we fix the compressor need to make sure data portion
+		 * is linear.
+		 */
+		if (skb_linearize(skb))
+			goto drop;
+
 		/* try to do VJ TCP header compression */
 		new_skb = alloc_skb(skb->len + ppp->dev->hard_header_len - 2,
 				    GFP_ATOMIC);
@@ -3516,10 +3528,13 @@ ppp_connect_channel(struct channel *pch, int unit)
 		ret = -ENOTCONN;
 		goto outl;
 	}
-	if (pch->chan->direct_xmit)
+	if (pch->chan->direct_xmit) {
 		ppp->dev->priv_flags |= IFF_NO_QUEUE;
-	else
+		ppp->dev->features |= NETIF_F_SG | NETIF_F_FRAGLIST;
+	} else {
 		ppp->dev->priv_flags &= ~IFF_NO_QUEUE;
+		ppp->dev->features &= ~(NETIF_F_SG | NETIF_F_FRAGLIST);
+	}
 	spin_unlock_bh(&pch->downl);
 	if (pch->file.hdrlen > ppp->file.hdrlen)
 		ppp->file.hdrlen = pch->file.hdrlen;
-- 
2.43.0


