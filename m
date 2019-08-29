Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA9E7A1F3E
	for <lists+linux-ppp@lfdr.de>; Thu, 29 Aug 2019 17:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbfH2PcI (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 29 Aug 2019 11:32:08 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:35013 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727834AbfH2PcI (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 29 Aug 2019 11:32:08 -0400
Received: by mail-io1-f69.google.com with SMTP id 18so4462725iof.2
        for <linux-ppp@vger.kernel.org>; Thu, 29 Aug 2019 08:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=9jMd6mNwFLX+PQpzzKyalqJyB2DZCmy9IGLW1UJr3iU=;
        b=Pt9n7zoEjm45P47bUS5pbZTSLu2xx6coX6I6iyy8/02GMTw7qAjpCh1ClfiHZIhGyU
         +uiVFWJ4IlOK8rVXJgkJg5revU2sis4P9/aBGiIaXME+YowMSrXE0agAnLfHqL940jzG
         a0rtcDCh5LKP+vy1+hCsLMAqV6DKDXITL1Wa3p++qbeh5if3/bCyXOC8Ln9rK7H2Ipc5
         EOjpSL82iCPlIobAspPYIIoU4RdydKHnTJfBQLP+UuMy3ruNqWDIMZtPR2a98FgpFGLP
         uNhS142ifNbYcOpiyWlK0jxawOYL3uKUlTldo9wxEkbS0rUGUMW/J13EcKPrhK6HQtUr
         rL3Q==
X-Gm-Message-State: APjAAAWjmo5LErsTF0/lA7BFqA0wsPCJPMh49DIshSRoSmFvgAw3snzc
        M7Y6JjKPAmPgjTb77v786UulOcJycZ9wA9T2KPbBI1TJvbjf
X-Google-Smtp-Source: APXvYqwRkvhHX4DsRrb2aW6LnXU//89K++W00MWSrkTYJbPK6vsIHenfAXL3fk+j1Bgmi2Tdw9zqdjK1NZeoTAKKbiFLfzuodlEM
MIME-Version: 1.0
X-Received: by 2002:a5d:97cf:: with SMTP id k15mr856067ios.151.1567092727431;
 Thu, 29 Aug 2019 08:32:07 -0700 (PDT)
Date:   Thu, 29 Aug 2019 08:32:07 -0700
In-Reply-To: <000000000000edc1d5058f5dfa5f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000594c700591433550@google.com>
Subject: Re: memory leak in ppp_write
From:   syzbot <syzbot+d9c8bf24e56416d7ce2c@syzkaller.appspotmail.com>
To:     ast@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        davem@davemloft.net, kafai@fb.com, linux-kernel@vger.kernel.org,
        linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
        paulus@samba.org, songliubraving@fb.com,
        syzkaller-bugs@googlegroups.com, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    6525771f Merge tag 'arc-5.3-rc7' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16dc12a2600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e6131eafb9408877
dashboard link: https://syzkaller.appspot.com/bug?extid=d9c8bf24e56416d7ce2c
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=116942de600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1179c582600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+d9c8bf24e56416d7ce2c@syzkaller.appspotmail.com

executing program
executing program
executing program
executing program
BUG: memory leak
unreferenced object 0xffff88812a17bc00 (size 224):
   comm "syz-executor673", pid 6952, jiffies 4294942888 (age 13.040s)
   hex dump (first 32 bytes):
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
   backtrace:
     [<00000000d110fff9>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:43 [inline]
     [<00000000d110fff9>] slab_post_alloc_hook mm/slab.h:522 [inline]
     [<00000000d110fff9>] slab_alloc_node mm/slab.c:3262 [inline]
     [<00000000d110fff9>] kmem_cache_alloc_node+0x163/0x2f0 mm/slab.c:3574
     [<000000002d616113>] __alloc_skb+0x6e/0x210 net/core/skbuff.c:197
     [<000000000167fc45>] alloc_skb include/linux/skbuff.h:1055 [inline]
     [<000000000167fc45>] ppp_write+0x48/0x120  
drivers/net/ppp/ppp_generic.c:502
     [<000000009ab42c0b>] __vfs_write+0x43/0xa0 fs/read_write.c:494
     [<00000000086b2e22>] vfs_write fs/read_write.c:558 [inline]
     [<00000000086b2e22>] vfs_write+0xee/0x210 fs/read_write.c:542
     [<00000000a2b70ef9>] ksys_write+0x7c/0x130 fs/read_write.c:611
     [<00000000ce5e0fdd>] __do_sys_write fs/read_write.c:623 [inline]
     [<00000000ce5e0fdd>] __se_sys_write fs/read_write.c:620 [inline]
     [<00000000ce5e0fdd>] __x64_sys_write+0x1e/0x30 fs/read_write.c:620
     [<00000000d9d7b370>] do_syscall_64+0x76/0x1a0  
arch/x86/entry/common.c:296
     [<0000000006e6d506>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff888121203900 (size 224):
   comm "syz-executor673", pid 6965, jiffies 4294943430 (age 7.620s)
   hex dump (first 32 bytes):
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
   backtrace:
     [<00000000d110fff9>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:43 [inline]
     [<00000000d110fff9>] slab_post_alloc_hook mm/slab.h:522 [inline]
     [<00000000d110fff9>] slab_alloc_node mm/slab.c:3262 [inline]
     [<00000000d110fff9>] kmem_cache_alloc_node+0x163/0x2f0 mm/slab.c:3574
     [<000000002d616113>] __alloc_skb+0x6e/0x210 net/core/skbuff.c:197
     [<000000000167fc45>] alloc_skb include/linux/skbuff.h:1055 [inline]
     [<000000000167fc45>] ppp_write+0x48/0x120  
drivers/net/ppp/ppp_generic.c:502
     [<000000009ab42c0b>] __vfs_write+0x43/0xa0 fs/read_write.c:494
     [<00000000086b2e22>] vfs_write fs/read_write.c:558 [inline]
     [<00000000086b2e22>] vfs_write+0xee/0x210 fs/read_write.c:542
     [<00000000a2b70ef9>] ksys_write+0x7c/0x130 fs/read_write.c:611
     [<00000000ce5e0fdd>] __do_sys_write fs/read_write.c:623 [inline]
     [<00000000ce5e0fdd>] __se_sys_write fs/read_write.c:620 [inline]
     [<00000000ce5e0fdd>] __x64_sys_write+0x1e/0x30 fs/read_write.c:620
     [<00000000d9d7b370>] do_syscall_64+0x76/0x1a0  
arch/x86/entry/common.c:296
     [<0000000006e6d506>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff88811d0cf800 (size 512):
   comm "syz-executor673", pid 6965, jiffies 4294943430 (age 7.620s)
   hex dump (first 32 bytes):
     06 00 00 00 05 00 00 00 40 00 00 00 00 00 00 00  ........@.......
     40 00 40 00 00 00 00 00 40 00 40 00 00 00 00 00  @.@.....@.@.....
   backtrace:
     [<00000000b9629d4c>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:43 [inline]
     [<00000000b9629d4c>] slab_post_alloc_hook mm/slab.h:522 [inline]
     [<00000000b9629d4c>] slab_alloc_node mm/slab.c:3262 [inline]
     [<00000000b9629d4c>] kmem_cache_alloc_node_trace+0x161/0x2f0  
mm/slab.c:3592
     [<00000000a9b92035>] __do_kmalloc_node mm/slab.c:3614 [inline]
     [<00000000a9b92035>] __kmalloc_node_track_caller+0x38/0x50  
mm/slab.c:3629
     [<00000000fad050db>] __kmalloc_reserve.isra.0+0x40/0xb0  
net/core/skbuff.c:141
     [<00000000a1025904>] __alloc_skb+0xa0/0x210 net/core/skbuff.c:209
     [<000000000167fc45>] alloc_skb include/linux/skbuff.h:1055 [inline]
     [<000000000167fc45>] ppp_write+0x48/0x120  
drivers/net/ppp/ppp_generic.c:502
     [<000000009ab42c0b>] __vfs_write+0x43/0xa0 fs/read_write.c:494
     [<00000000086b2e22>] vfs_write fs/read_write.c:558 [inline]
     [<00000000086b2e22>] vfs_write+0xee/0x210 fs/read_write.c:542
     [<00000000a2b70ef9>] ksys_write+0x7c/0x130 fs/read_write.c:611
     [<00000000ce5e0fdd>] __do_sys_write fs/read_write.c:623 [inline]
     [<00000000ce5e0fdd>] __se_sys_write fs/read_write.c:620 [inline]
     [<00000000ce5e0fdd>] __x64_sys_write+0x1e/0x30 fs/read_write.c:620
     [<00000000d9d7b370>] do_syscall_64+0x76/0x1a0  
arch/x86/entry/common.c:296
     [<0000000006e6d506>] entry_SYSCALL_64_after_hwframe+0x44/0xa9


