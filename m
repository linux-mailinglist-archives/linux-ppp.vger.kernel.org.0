Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4527E955F
	for <lists+linux-ppp@lfdr.de>; Mon, 13 Nov 2023 04:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbjKMDRN (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 12 Nov 2023 22:17:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjKMDRM (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 12 Nov 2023 22:17:12 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC70170E;
        Sun, 12 Nov 2023 19:17:09 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-66d0169cf43so25282416d6.3;
        Sun, 12 Nov 2023 19:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699845429; x=1700450229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MoTUt+5xCFIEtAHrqW+YCq47pwtJA2Iy+VDWAz+zkeE=;
        b=K1ZXDR/mBGjHl83hYVpYPlM41EOJ4JtNFnHO40lXt4mUUZC8gMaUeFXcUwfBA2jB4B
         Wg0Etcu+wJRGRYmWEZSQb0/mjFn/CYOBLp03xGX+Hyrwq6IRxt0ucsWdCZqw1oORXlNn
         +Gttjtof6FAZj3X9evJkcDYEFQcblhYwYk5Rkxn3AYF7Odwq0a7JCUxiVkigdKqXhvIX
         DqQJLF4MniRSI3rXj/bEAp41/PEaLR4O+ZGmzOWNAg7i6Y01yUx3+SAsWsAD6LqCBXOg
         7VqbUoCE5dr/PtSwhpd57OJkzTrFdZy7Bj90BpZG6Xim/Aq3GPuDUeWBQ3gYtr6C79p8
         lVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699845429; x=1700450229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MoTUt+5xCFIEtAHrqW+YCq47pwtJA2Iy+VDWAz+zkeE=;
        b=CrjkseWTto1vW/6Ph54JKUsHBTiy6GfACx5oHG8TAemQDs7M6AXKqoRb9XrBdseeUP
         ZSuXclbRy68dT1PzulWAifwry5mBZa5717/v7O3os0D9sWjT8smashDtU79icldCJNRQ
         q9Asa8uyypefH4M+VQcJNpRzoGwbN4/WTE3ObnMf1Uycw8fSk8FqvmoRLZTJfTJVFJxO
         OdSqZ5XG5dILu/BSGFfoTIr/nJWQepwCI0rXeauIHLU1HIiC/ieS9/xF2ls0l/Xsm3mx
         iZOWZsClQ/1XhsLwMV05AstChIRYs3n5nZnZWDDH7XcM58wBkSUox/WmG0ELtnkLLtfi
         uIHw==
X-Gm-Message-State: AOJu0Yx6C5oQ0Si7yDykfaCAvKA46ciETQoo9ScN9kbaGExesCi05Wzx
        sC0cBYH2gAHfhFEbLssmAvzWVhEsf94=
X-Google-Smtp-Source: AGHT+IE7nJbarY274kaRwFgLsGrevOrjeCHr0tqfcX7QZb+L+jLlKOQEzKXY8IoIw7w/i/elQtMVYQ==
X-Received: by 2002:a05:6214:5153:b0:66d:28a4:5697 with SMTP id kh19-20020a056214515300b0066d28a45697mr5968243qvb.61.1699845428844;
        Sun, 12 Nov 2023 19:17:08 -0800 (PST)
Received: from willemb.c.googlers.com.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id pb7-20020a05620a838700b007742c2ad7dfsm1564328qkn.73.2023.11.12.19.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 19:17:08 -0800 (PST)
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To:     netdev@vger.kernel.org
Cc:     davem@davemloft.net, kuba@kernel.org, edumazet@google.com,
        pabeni@redhat.com, linux-ppp@vger.kernel.org,
        stable@vger.kernel.org, mitch@sfgoth.com, mostrows@earthlink.net,
        jchapman@katalix.com, Willem de Bruijn <willemb@google.com>,
        syzbot+6177e1f90d92583bcc58@syzkaller.appspotmail.com
Subject: [PATCH net] ppp: limit MRU to 64K
Date:   Sun, 12 Nov 2023 22:16:32 -0500
Message-ID: <20231113031705.803615-1-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

From: Willem de Bruijn <willemb@google.com>

ppp_sync_ioctl allows setting device MRU, but does not sanity check
this input.

Limit to a sane upper bound of 64KB.

No implementation I could find generates larger than 64KB frames.
RFC 2823 mentions an upper bound of PPP over SDL of 64KB based on the
16-bit length field. Other protocols will be smaller, such as PPPoE
(9KB jumbo frame) and PPPoA (18190 maximum CPCS-SDU size, RFC 2364).
PPTP and L2TP encapsulate in IP.

Syzbot managed to trigger alloc warning in __alloc_pages:

	if (WARN_ON_ONCE_GFP(order > MAX_ORDER, gfp))

    WARNING: CPU: 1 PID: 37 at mm/page_alloc.c:4544 __alloc_pages+0x3ab/0x4a0 mm/page_alloc.c:4544

    __alloc_skb+0x12b/0x330 net/core/skbuff.c:651
    __netdev_alloc_skb+0x72/0x3f0 net/core/skbuff.c:715
    netdev_alloc_skb include/linux/skbuff.h:3225 [inline]
    dev_alloc_skb include/linux/skbuff.h:3238 [inline]
    ppp_sync_input drivers/net/ppp/ppp_synctty.c:669 [inline]
    ppp_sync_receive+0xff/0x680 drivers/net/ppp/ppp_synctty.c:334
    tty_ldisc_receive_buf+0x14c/0x180 drivers/tty/tty_buffer.c:390
    tty_port_default_receive_buf+0x70/0xb0 drivers/tty/tty_port.c:37
    receive_buf drivers/tty/tty_buffer.c:444 [inline]
    flush_to_ldisc+0x261/0x780 drivers/tty/tty_buffer.c:494
    process_one_work+0x884/0x15c0 kernel/workqueue.c:2630

With call

    ioctl$PPPIOCSMRU1(r1, 0x40047452, &(0x7f0000000100)=0x5e6417a8)

Similar code exists in other drivers that implement ppp_channel_ops
ioctl PPPIOCSMRU. Those might also be in scope. Notably excluded from
this are pppol2tp_ioctl and pppoe_ioctl.

This code goes back to the start of git history.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+6177e1f90d92583bcc58@syzkaller.appspotmail.com
Signed-off-by: Willem de Bruijn <willemb@google.com>
---
 drivers/net/ppp/ppp_synctty.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
index ea261a628786..52d05ce4a281 100644
--- a/drivers/net/ppp/ppp_synctty.c
+++ b/drivers/net/ppp/ppp_synctty.c
@@ -453,6 +453,10 @@ ppp_sync_ioctl(struct ppp_channel *chan, unsigned int cmd, unsigned long arg)
 	case PPPIOCSMRU:
 		if (get_user(val, (int __user *) argp))
 			break;
+		if (val > U16_MAX) {
+			err = -EINVAL;
+			break;
+		}
 		if (val < PPP_MRU)
 			val = PPP_MRU;
 		ap->mru = val;
-- 
2.43.0.rc0.421.g78406f8d94-goog

