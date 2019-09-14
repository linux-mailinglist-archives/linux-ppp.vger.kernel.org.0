Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3331B2996
	for <lists+linux-ppp@lfdr.de>; Sat, 14 Sep 2019 06:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbfINEKD (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sat, 14 Sep 2019 00:10:03 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45040 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbfINEKC (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sat, 14 Sep 2019 00:10:02 -0400
Received: by mail-pg1-f195.google.com with SMTP id i18so16280001pgl.11
        for <linux-ppp@vger.kernel.org>; Fri, 13 Sep 2019 21:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=X1GiOJ2a4/eher6HQJ7YBIyoaC12+VrAYDtzeQYh7p8=;
        b=kDLm+A3VcdRH9ErDLwVLKFoFAK3b6zitaxzRILlAU+6glpRYm3/zmZmzpRfkkADBGB
         nKILHwigPPP2fHaiAtyka+x5hKVn/0fnP8tV+njkHCJpY9u+UsgopcPkWWwtnfZFLIMm
         Z62CJIasaUZ/5afywiPUb2iW6XmvbXzuw44SgwIv99DKyRAR2CnkpphNWYUJ3OQF8xiw
         BEUXsc8JhxyDPs2AlqXwM+aU1RtOPrlke6tg7B6HAFwuZjZHLvUfvppKruk6N+gNwile
         eu/r9eIoNiK6CKWCCzMLD8cc4m/eidTwxjjZBt9+kmlh7f9drTLo0EkNBW6oAaJW1WCa
         GQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=X1GiOJ2a4/eher6HQJ7YBIyoaC12+VrAYDtzeQYh7p8=;
        b=ufrha7KOY88BwMVz21t+MFMQpFDL+W2nC/M4b9xIDSt5XzfY+gnG0jR9c01Tf7Wfak
         DiXxhMcf4pmT2JxDBubf4Uf3ByYxCSPZtS0O8LXpG86xQPNW0ZS8dbcSwvdIMSrdm6tZ
         G2UylkWVYUEPP8NRckNHuEl+jjnPZxrT6q2zgk761W94MOA8oK9oYIQxLxeX/KPpa1Ty
         kphHNzorj+tDaqjaY7FgK3mZsUu5pEMxrVUzzOx3XQ+fmqIHYVjsNH0Y1m7601wLabCC
         QcTc15BUxe9ullO+L2b1NoorcP0l81OrSmjb0zKlzL5Zssy8S/Wwh49y4DoNMwv/0+HY
         1zKQ==
X-Gm-Message-State: APjAAAVAfYQfBhOXYqMhLR+iIEDxdwpeGhMzHdZGblvaMZa4m3a2UBui
        emj415PS60l1Ahc5j+S3CA==
X-Google-Smtp-Source: APXvYqzMsHlFExbtXK90Tje7mgV/+YKnmeDA1a9P3ITBB0k7ghazPFWepFyoz3MwsWqN8JX6v6T2Kw==
X-Received: by 2002:a17:90b:28b:: with SMTP id az11mr8800118pjb.22.1568434202179;
        Fri, 13 Sep 2019 21:10:02 -0700 (PDT)
Received: from DESKTOP (softbank126011111238.bbtec.net. [126.11.111.238])
        by smtp.gmail.com with ESMTPSA id g24sm29498782pfo.178.2019.09.13.21.10.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2019 21:10:01 -0700 (PDT)
Date:   Sat, 14 Sep 2019 13:09:58 +0900
From:   Takeshi Misawa <jeliantsurux@gmail.com>
To:     Paul Mackerras <paulus@samba.org>
Cc:     "David S. Miller" <davem@davemloft.net>, linux-ppp@vger.kernel.org
Subject: [PATCH] ppp: Fix memory leak in ppp_write
Message-ID: <20190914040958.GA2363@DESKTOP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

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

Reported-and-tested-by: syzbot+d9c8bf24e56416d7ce2c@syzkaller.appspotmail.com
Signed-off-by: Takeshi Misawa <jeliantsurux@gmail.com>
---
Dear Paul Mackerras

syzbot reported memory leak in net/ppp.
[TITLE] memory leak in ppp_write

I send a patch that passed syzbot reproducer test. 
Please consider this memory leak and patch.

Regards.
---
 drivers/net/ppp/ppp_generic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index a30e41a56085..9a1b006904a7 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1415,6 +1415,8 @@ static void __ppp_xmit_process(struct ppp *ppp, struct sk_buff *skb)
 			netif_wake_queue(ppp->dev);
 		else
 			netif_stop_queue(ppp->dev);
+	} else {
+		kfree_skb(skb);
 	}
 	ppp_xmit_unlock(ppp);
 }
-- 
2.17.1

