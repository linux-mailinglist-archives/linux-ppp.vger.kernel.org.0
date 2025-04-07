Return-Path: <linux-ppp+bounces-286-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB922A7E4A1
	for <lists+linux-ppp@lfdr.de>; Mon,  7 Apr 2025 17:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3A18167A25
	for <lists+linux-ppp@lfdr.de>; Mon,  7 Apr 2025 15:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451771FCFD3;
	Mon,  7 Apr 2025 15:26:32 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352461FCFE5;
	Mon,  7 Apr 2025 15:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039592; cv=none; b=Mbl3p4NUyyLuWMVUBMxgjSsM+9zVHEoPEOK3TFb1FwRjRKt6iDvXD0onVeFuwsY5UDOZ3civE4jULd5ToeJLDXm8b8r+y9xupycMWen3XdJFeUApLa/pMqYsXzh4Dm2ToFzrvATp72ri1nYhfXuI77Nw4SWEGdmJ3iAC/iV3yNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039592; c=relaxed/simple;
	bh=8rmoI+MLumkyOH9sGcP/FhAE5tgXLwAl3apFYQe0AAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Nl8WaM/WL6zz/z7Zqtjn3vI7zj6sfiJD3w73emnGsYfBQDpLC/yHh8MGdH3+kVZk209v5+iAcef9NFnlaxOFEKsYpzMPat5yu9gxKPCwo71x7cCZcGzCFMopRGQnNeDwK5PgcjNebS8iFnHcrx5qgLymsFEGj0TjqMX1BhMNTZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from [127.0.1.1] (unknown [IPv6:2a01:e0a:3e8:c0d0:3b93:9152:d50e:6d45])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 77E85479E0;
	Mon,  7 Apr 2025 15:26:26 +0000 (UTC)
Authentication-Results: Plesk;
        spf=pass (sender IP is 2a01:e0a:3e8:c0d0:3b93:9152:d50e:6d45) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=[127.0.1.1]
Received-SPF: pass (Plesk: connection is authenticated)
From: Arnaud Lecomte <contact@arnaud-lcm.com>
Date: Mon, 07 Apr 2025 17:26:21 +0200
Subject: [PATCH] net: ppp: Add bound checking for skb d on ppp_sync_txmung
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: 
 <20250407-bound-checking-ppp_txmung-v1-1-cfcd2efe39e3@arnaud-lcm.com>
X-B4-Tracking: v=1; b=H4sIAJzu82cC/x2MQQqAIBAAvxJ7TrBQkr4SEaWbLZGJZgTh35NuM
 4eZFyIGwgh99ULAmyKdrkhTV6C32VlkZIpDy1vJBZdsOZMzTG+od3KWee+n6zlSQaF4p5UUaJS
 E0vuAKz3/exhz/gAF42cZawAAAA==
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, contact@arnaud-lcm.com,
 skhan@linuxfoundation.org,
 syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744039586; l=1904;
 i=contact@arnaud-lcm.com; s=20250405; h=from:subject:message-id;
 bh=8rmoI+MLumkyOH9sGcP/FhAE5tgXLwAl3apFYQe0AAY=;
 b=M6469qTLfHJ5l/l/pfI2SwTDPs62ZlfhL9gHLufnvBlbu+ZSXJi5pvv87oofaVyVgE7IflGke
 WLJrJ1oDwCkB4ruypAKnkFkUh1eA9WvqskTQEjyP69bw9cnYSq9jhJ2
X-Developer-Key: i=contact@arnaud-lcm.com; a=ed25519;
 pk=Ct5pwYkf/5qSRyUpocKOdGc2XBlQoMYODwgtlFsDk7o=
X-PPP-Message-ID: <174403958690.22797.5110854261377796838@Plesk>
X-PPP-Vhost: arnaud-lcm.com

Ensure we have enough data in linear buffer from skb before accessing
initial bytes. This prevents potential out-of-bounds accesses
when processing short packets.

When ppp_sync_txmung receives an incoming package with an empty
payload:
(remote) gef➤  p *(struct pppoe_hdr *) (skb->head + skb->network_header)
$18 = {
	type = 0x1,
	ver = 0x1,
	code = 0x0,
	sid = 0x2,
        length = 0x0,
	tag = 0xffff8880371cdb96
}

from the skb struct (trimmed)
      tail = 0x16,
      end = 0x140,
      head = 0xffff88803346f400 "4",
      data = 0xffff88803346f416 ":\377",
      truesize = 0x380,
      len = 0x0,
      data_len = 0x0,
      mac_len = 0xe,
      hdr_len = 0x0,

it is not safe to access data[2].

Reported-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=29fc8991b0ecb186cf40
Tested-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
Fixes: 9946eaf552b1 ("Merge tag 'hardening-v6.14-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux")
Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
---
 drivers/net/ppp/ppp_synctty.c | 5 +++++
 1 file changed, 5 insertions(+)

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
 

---
base-commit: 9946eaf552b194bb352c2945b54ff98c8193b3f1
change-id: 20250405-bound-checking-ppp_txmung-4807c854ed85

Best regards,
-- 
Arnaud Lecomte <contact@arnaud-lcm.com>


