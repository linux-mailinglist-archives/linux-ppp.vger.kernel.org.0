Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 998E4498B23
	for <lists+linux-ppp@lfdr.de>; Mon, 24 Jan 2022 20:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344224AbiAXTME (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 24 Jan 2022 14:12:04 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:35354 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346307AbiAXTFU (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 24 Jan 2022 14:05:20 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A1BFC6090C;
        Mon, 24 Jan 2022 19:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87ABFC340E5;
        Mon, 24 Jan 2022 19:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1643051119;
        bh=L+D8ygZg8nA3DH0SFS5Lyv8rS0iugtNq3Ryw1EXoYQw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bmqszoxtkFaxTpuoRKKo8suU2gLo47ESdbHp7J+W6TCC9p5eMI9mCHKPp3XgKK3Yi
         wpwhnxiEgBsitkUOXA8JlQPo9zlnCK1lrmZOokd1WhYsKV5wSDcUIUUbJi2Sx8lOaT
         W+drb5PUcRv5eaMROhcpHWZHuAN9YkUP2lETSggo=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
        Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org,
        syzbot <syzkaller@googlegroups.com>,
        Guillaume Nault <gnault@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.14 060/186] ppp: ensure minimum packet size in ppp_write()
Date:   Mon, 24 Jan 2022 19:42:15 +0100
Message-Id: <20220124183939.055809667@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124183937.101330125@linuxfoundation.org>
References: <20220124183937.101330125@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

From: Eric Dumazet <edumazet@google.com>

[ Upstream commit 44073187990d5629804ce0627525f6ea5cfef171 ]

It seems pretty clear ppp layer assumed user space
would always be kind to provide enough data
in their write() to a ppp device.

This patch makes sure user provides at least
2 bytes.

It adds PPP_PROTO_LEN macro that could replace
in net-next many occurrences of hard-coded 2 value.

I replaced only one occurrence to ease backports
to stable kernels.

The bug manifests in the following report:

BUG: KMSAN: uninit-value in ppp_send_frame+0x28d/0x27c0 drivers/net/ppp/ppp_generic.c:1740
 ppp_send_frame+0x28d/0x27c0 drivers/net/ppp/ppp_generic.c:1740
 __ppp_xmit_process+0x23e/0x4b0 drivers/net/ppp/ppp_generic.c:1640
 ppp_xmit_process+0x1fe/0x480 drivers/net/ppp/ppp_generic.c:1661
 ppp_write+0x5cb/0x5e0 drivers/net/ppp/ppp_generic.c:513
 do_iter_write+0xb0c/0x1500 fs/read_write.c:853
 vfs_writev fs/read_write.c:924 [inline]
 do_writev+0x645/0xe00 fs/read_write.c:967
 __do_sys_writev fs/read_write.c:1040 [inline]
 __se_sys_writev fs/read_write.c:1037 [inline]
 __x64_sys_writev+0xe5/0x120 fs/read_write.c:1037
 do_syscall_x64 arch/x86/entry/common.c:51 [inline]
 do_syscall_64+0x54/0xd0 arch/x86/entry/common.c:82
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Uninit was created at:
 slab_post_alloc_hook mm/slab.h:524 [inline]
 slab_alloc_node mm/slub.c:3251 [inline]
 __kmalloc_node_track_caller+0xe0c/0x1510 mm/slub.c:4974
 kmalloc_reserve net/core/skbuff.c:354 [inline]
 __alloc_skb+0x545/0xf90 net/core/skbuff.c:426
 alloc_skb include/linux/skbuff.h:1126 [inline]
 ppp_write+0x11d/0x5e0 drivers/net/ppp/ppp_generic.c:501
 do_iter_write+0xb0c/0x1500 fs/read_write.c:853
 vfs_writev fs/read_write.c:924 [inline]
 do_writev+0x645/0xe00 fs/read_write.c:967
 __do_sys_writev fs/read_write.c:1040 [inline]
 __se_sys_writev fs/read_write.c:1037 [inline]
 __x64_sys_writev+0xe5/0x120 fs/read_write.c:1037
 do_syscall_x64 arch/x86/entry/common.c:51 [inline]
 do_syscall_64+0x54/0xd0 arch/x86/entry/common.c:82
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Eric Dumazet <edumazet@google.com>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linux-ppp@vger.kernel.org
Reported-by: syzbot <syzkaller@googlegroups.com>
Acked-by: Guillaume Nault <gnault@redhat.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ppp/ppp_generic.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index c6e067aae9551..81a4fe9706be6 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -72,6 +72,8 @@
 #define MPHDRLEN	6	/* multilink protocol header length */
 #define MPHDRLEN_SSN	4	/* ditto with short sequence numbers */
 
+#define PPP_PROTO_LEN	2
+
 /*
  * An instance of /dev/ppp can be associated with either a ppp
  * interface unit or a ppp channel.  In both cases, file->private_data
@@ -501,6 +503,9 @@ static ssize_t ppp_write(struct file *file, const char __user *buf,
 
 	if (!pf)
 		return -ENXIO;
+	/* All PPP packets should start with the 2-byte protocol */
+	if (count < PPP_PROTO_LEN)
+		return -EINVAL;
 	ret = -ENOMEM;
 	skb = alloc_skb(count + pf->hdrlen, GFP_KERNEL);
 	if (!skb)
@@ -1564,7 +1569,7 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 	}
 
 	++ppp->stats64.tx_packets;
-	ppp->stats64.tx_bytes += skb->len - 2;
+	ppp->stats64.tx_bytes += skb->len - PPP_PROTO_LEN;
 
 	switch (proto) {
 	case PPP_IP:
-- 
2.34.1



