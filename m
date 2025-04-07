Return-Path: <linux-ppp+bounces-283-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 627BAA7E0E7
	for <lists+linux-ppp@lfdr.de>; Mon,  7 Apr 2025 16:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D7167A48B8
	for <lists+linux-ppp@lfdr.de>; Mon,  7 Apr 2025 14:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC451D7E21;
	Mon,  7 Apr 2025 14:17:56 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CCD1D79B3;
	Mon,  7 Apr 2025 14:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035475; cv=none; b=DMbF5KpIdsQi0Re1/iIGX12SMexcyNy2hm9WviBBkb219ENN2EwnmI+IZ45n3ImBem5qBx9lOWEF82wfyEIdTA49WHScCCc/i0SXpKoFnI20RU3WBd2ybb8dlosX6V8O/K5BZEm5fvTj/Q2jFCLOo+0L5BYRKYYZNjVbjS+reEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035475; c=relaxed/simple;
	bh=ERmC0VihSwVE+kfQl3h22QpzW0EQ3aDUpCiKyvDOEq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eo+ekFPfD7+CvtQ4g6pdvhrspyhFzNklIKJmFw5X4onnfeusOy+DbU2i+pwYOimlYuihGmQQ80babPLnkS2maq4rLZ9t4E5m+JVTm3ADAwxQmSy1ZCc0mROwfVEe3GCLPHQqP/gxLULCYsW8OpnFXzF7u596LatdGWSDolFajgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from arnaudlcm-X570-UD.. (unknown [IPv6:2a01:e0a:3e8:c0d0:3b93:9152:d50e:6d45])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id D37DB28D8AF;
	Mon,  7 Apr 2025 14:17:51 +0000 (UTC)
Authentication-Results: Plesk;
	spf=pass (sender IP is 2a01:e0a:3e8:c0d0:3b93:9152:d50e:6d45) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=arnaudlcm-X570-UD..
Received-SPF: pass (Plesk: connection is authenticated)
From: Arnaud Lecomte <contact@arnaud-lcm.com>
To: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot]
Date: Mon,  7 Apr 2025 16:17:47 +0200
Message-ID: <20250407141747.92874-1-contact@arnaud-lcm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <67ae3912.050a0220.21dd3.0021.GAE@google.com>
References: <67ae3912.050a0220.21dd3.0021.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174403547232.32667.4417870378199395325@Plesk>
X-PPP-Vhost: arnaud-lcm.com

Author: contact@arnaud-lcm.com

#syz test

diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
index 644e99fc3623..520d895acc60 100644
--- a/drivers/net/ppp/ppp_synctty.c
+++ b/drivers/net/ppp/ppp_synctty.c
@@ -506,6 +506,11 @@ ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *skb)
 	unsigned char *data;
 	int islcp;
 
+	/* Ensure we can safely access protocol field and LCP code */
+	if (!skb || !pskb_may_pull(skb, 3)) {
+		kfree_skb(skb);
+		return NULL;
+	}
 	data  = skb->data;
 	proto = get_unaligned_be16(data);

