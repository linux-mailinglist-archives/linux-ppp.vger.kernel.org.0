Return-Path: <linux-ppp+bounces-288-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F43A81132
	for <lists+linux-ppp@lfdr.de>; Tue,  8 Apr 2025 18:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D115188E5D2
	for <lists+linux-ppp@lfdr.de>; Tue,  8 Apr 2025 15:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4ACB23C8A7;
	Tue,  8 Apr 2025 15:55:31 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9402A23BD0E;
	Tue,  8 Apr 2025 15:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127731; cv=none; b=Dvg/wegI4NZ60OnFsasi9nowm9AygfQfSOkOHVin+ekp1Sd42SErR+C8P9ZNpDFlL49PVxh7gdJTZ7fFrMo9zwBpjxpJXMAIXygkHLDx4Kq07iFCUSSPkTuCkVCmXufj5XNDW1+wlOpu+/Dhe1rDbQ9THxoAGTMxaS2J09mdqkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127731; c=relaxed/simple;
	bh=J7epX/UdilumfA3U27hHk3T8ih71De8kfSzGxe+PO3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=my9rGBJh+hddFL95KgkTWLYFniJ7uU4YrJyxyFObptzPsqKycaEf9GmWHsegs+TUk+HhoHZFDlaJn5dcdNg0i4jYfMDhv2I1WzsL1jvbpLovVBF2J6T7DQWvj/gq5vlhrkLez2Zaltrlc/tAbQGR5Jhz/V/xCj261T/qtPVyYrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from [127.0.1.1] (unknown [IPv6:2a01:e0a:3e8:c0d0:9059:1ccf:a15c:f330])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id A2C0C371F23;
	Tue,  8 Apr 2025 15:55:21 +0000 (UTC)
Authentication-Results: Plesk;
        spf=pass (sender IP is 2a01:e0a:3e8:c0d0:9059:1ccf:a15c:f330) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=[127.0.1.1]
Received-SPF: pass (Plesk: connection is authenticated)
From: Arnaud Lecomte <contact@arnaud-lcm.com>
Date: Tue, 08 Apr 2025 17:55:08 +0200
Subject: [PATCH v2] net: ppp: Add bound checking for skb d on
 ppp_sync_txmung
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: 
 <20250408-bound-checking-ppp_txmung-v2-1-94bb6e1b92d0@arnaud-lcm.com>
X-B4-Tracking: v=1; b=H4sIANtG9WcC/32NwQ6CMBBEf8Xs2TWl0ICe/A9DDG4XaJS2aYFgC
 P9uJfHqbd4k82aFyMFwhMthhcCzicbZBPJ4AOob2zEanRikkEoUQuHDTVYj9UxPYzv03t/HZZh
 SLCpRUqUK1pWCtPeBW7Ps7luduDdxdOG9X83Zt/1Zyz/WOcMMqSUtueX8zPm1CbaZNL5oOJEbo
 N627QP7NiDHxwAAAA==
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, contact@arnaud-lcm.com,
 skhan@linuxfoundation.org,
 syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744127721; l=2087;
 i=contact@arnaud-lcm.com; s=20250405; h=from:subject:message-id;
 bh=J7epX/UdilumfA3U27hHk3T8ih71De8kfSzGxe+PO3k=;
 b=AJA3Cy6DjlQbZQe1vxWvNIhkINO0dAJqsOoeJ/QTKbJJq9in5/ju+7sF5kB1RMMPoZHHAblWp
 xoHCr2csKzvC/tIHr/n9k1Yf+fkuk+p/Q5eSw3Shi8LbEKPZidsXtsd
X-Developer-Key: i=contact@arnaud-lcm.com; a=ed25519;
 pk=Ct5pwYkf/5qSRyUpocKOdGc2XBlQoMYODwgtlFsDk7o=
X-PPP-Message-ID: <174412772207.7158.8026498672365097069@Plesk>
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
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
---
Changes in v2:
- Fixed the Fixes: tag to refer to initial commit instead of merge commit (1da177e4c3f4)
- Remove the skb check as it can not be null
- Link to v1: https://lore.kernel.org/r/20250407-bound-checking-ppp_txmung-v1-1-cfcd2efe39e3@arnaud-lcm.com
---
 drivers/net/ppp/ppp_synctty.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
index 644e99fc3623..9c4932198931 100644
--- a/drivers/net/ppp/ppp_synctty.c
+++ b/drivers/net/ppp/ppp_synctty.c
@@ -506,6 +506,11 @@ ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *skb)
 	unsigned char *data;
 	int islcp;
 
+	/* Ensure we can safely access protocol field and LCP code */
+	if (!pskb_may_pull(skb, 3)) {
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


