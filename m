Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30E2AC3BCA
	for <lists+linux-ppp@lfdr.de>; Tue,  1 Oct 2019 18:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388212AbfJAQov (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 1 Oct 2019 12:44:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:57144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390086AbfJAQou (ORCPT <rfc822;linux-ppp@vger.kernel.org>);
        Tue, 1 Oct 2019 12:44:50 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0B9D5205C9;
        Tue,  1 Oct 2019 16:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569948290;
        bh=vQmU4uYLyl0AcxBunUP+8zR/zf9+YA3LP7QWONoMOO0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bfvovPC8F9j9IxSlWP/UL/6XdUeY/pM0eOMvAPq+JwZNfVa+C4iX0do5Nh+/R9hNQ
         SwJJnO3E4QyXeHQD3l7dIexib2HgP9jq9pQDPsYto0Y+U2Aed9jJp9ZpIIGlh48RiR
         CIO9IpHKCyjGmUwsBs2diMhWj+SHHu0A29j1NF3w=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Takeshi Misawa <jeliantsurux@gmail.com>,
        syzbot+d9c8bf24e56416d7ce2c@syzkaller.appspotmail.com,
        Guillaume Nault <gnault@redhat.com>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, linux-ppp@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 21/29] ppp: Fix memory leak in ppp_write
Date:   Tue,  1 Oct 2019 12:44:15 -0400
Message-Id: <20191001164423.16406-21-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191001164423.16406-1-sashal@kernel.org>
References: <20191001164423.16406-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

From: Takeshi Misawa <jeliantsurux@gmail.com>

[ Upstream commit 4c247de564f1ff614d11b3bb5313fb70d7b9598b ]

When ppp is closing, __ppp_xmit_process() failed to enqueue skb
and skb allocated in ppp_write() is leaked.

syzbot reported :
BUG: memory leak
unreferenced object 0xffff88812a17bc00 (size 224):
  comm "syz-executor673", pid 6952, jiffies 4294942888 (age 13.040s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000d110fff9>] kmemleak_alloc_recursive include/linux/kmemleak.h:43 [inline]
    [<00000000d110fff9>] slab_post_alloc_hook mm/slab.h:522 [inline]
    [<00000000d110fff9>] slab_alloc_node mm/slab.c:3262 [inline]
    [<00000000d110fff9>] kmem_cache_alloc_node+0x163/0x2f0 mm/slab.c:3574
    [<000000002d616113>] __alloc_skb+0x6e/0x210 net/core/skbuff.c:197
    [<000000000167fc45>] alloc_skb include/linux/skbuff.h:1055 [inline]
    [<000000000167fc45>] ppp_write+0x48/0x120 drivers/net/ppp/ppp_generic.c:502
    [<000000009ab42c0b>] __vfs_write+0x43/0xa0 fs/read_write.c:494
    [<00000000086b2e22>] vfs_write fs/read_write.c:558 [inline]
    [<00000000086b2e22>] vfs_write+0xee/0x210 fs/read_write.c:542
    [<00000000a2b70ef9>] ksys_write+0x7c/0x130 fs/read_write.c:611
    [<00000000ce5e0fdd>] __do_sys_write fs/read_write.c:623 [inline]
    [<00000000ce5e0fdd>] __se_sys_write fs/read_write.c:620 [inline]
    [<00000000ce5e0fdd>] __x64_sys_write+0x1e/0x30 fs/read_write.c:620
    [<00000000d9d7b370>] do_syscall_64+0x76/0x1a0 arch/x86/entry/common.c:296
    [<0000000006e6d506>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

Fix this by freeing skb, if ppp is closing.

Fixes: 6d066734e9f0 ("ppp: avoid loop in xmit recursion detection code")
Reported-and-tested-by: syzbot+d9c8bf24e56416d7ce2c@syzkaller.appspotmail.com
Signed-off-by: Takeshi Misawa <jeliantsurux@gmail.com>
Reviewed-by: Guillaume Nault <gnault@redhat.com>
Tested-by: Guillaume Nault <gnault@redhat.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ppp/ppp_generic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 34b24d7e1e2f3..8faf4488340dd 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1433,6 +1433,8 @@ static void __ppp_xmit_process(struct ppp *ppp, struct sk_buff *skb)
 			netif_wake_queue(ppp->dev);
 		else
 			netif_stop_queue(ppp->dev);
+	} else {
+		kfree_skb(skb);
 	}
 	ppp_xmit_unlock(ppp);
 }
-- 
2.20.1

