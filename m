Return-Path: <linux-ppp+bounces-76-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A53FD95A7FF
	for <lists+linux-ppp@lfdr.de>; Thu, 22 Aug 2024 01:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9BCA1C217FA
	for <lists+linux-ppp@lfdr.de>; Wed, 21 Aug 2024 23:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C946117ADE1;
	Wed, 21 Aug 2024 23:00:38 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166821531CB
	for <linux-ppp@vger.kernel.org>; Wed, 21 Aug 2024 23:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724281238; cv=none; b=Mt8RBYFZikzYLt8t3BjC8FfsJRCpb1VRRHqaAb0Y67GdpuGiHCR2qxMzWp4aghvSZqC8OO3EylwaK/5idIE/ucjHqHXe/VEpo22KpwDbujxDvtyv7/m0wfj0S16O1qRZaepboR8/l9/TFENf7al1lx4wuoDsa42Fznf9fTHHFUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724281238; c=relaxed/simple;
	bh=nK7WBNJU17yLVWvP6m9kWvc6ZL5VUUgZBG/DpAUucZQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=L2prV4fyyVjt4blO8XucFn/QB0WOQsm1XMJWfHOkwE1WB97+XCuji68ajM+CEFQKFjRFGN9A1N8RJbBk37Mz8v1grYSwIRjUyA37RkMXF46YyihhMNjceCF+A2SCHSUd7MregtlxLihCT6/E1MIXOMhcOhLgC067f9UMEXdg8Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-39d415635e6so1983275ab.1
        for <linux-ppp@vger.kernel.org>; Wed, 21 Aug 2024 16:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724281236; x=1724886036;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=advimBipANCqCePLOk2BiN6GsDFv17GpuVUDDfjL++k=;
        b=EXf9oBSbJKS9CO+mSpeLpJq0V4TvGgZEqbGSM/yEnsoXEBepetuNhBg8A91UZcH2oJ
         JFtpK/jFwLTaCB635d42+KmH4V69n67E7wNz2VoSc3slk2JT155ETcSX3phqVB2+6tlU
         X456OYlYqgivIcXbr6XFSsu/kpbjEMpeHhzW/1CRjr7pXcKOr5VO34IGbzF5MUhBRTvT
         xwlHmC1RomXvsdgniiM3+N961Wf20xewVPrT5XvqKvzPkfsnsnXlJy0/D+e6h6rEQ2b2
         WDqOIAxDRowGx0JZpJoEps/QswTbcJiVBukQ/HJ3PQkH01sobIL3SH/dTSdAE8WIz9k5
         gbqw==
X-Forwarded-Encrypted: i=1; AJvYcCXvboq+5ycWlPou/C2DO+Via6NekGv44S82tcwCjZaK2WKykREqTZQCDvFXEFdVlPpM2euUdkRwn64=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuq1b74SVm85qmMgr3CHBTuwB56GYloUCo8YuY2cb5ZKGUgxMd
	xv/bHl+PFgfGaKduTGgAn8fBktgbEegJeiqYYoZHTfsn2ARuEq2pzr6CrXvKmA9US/dwhl1KLFe
	lSsenH7c2ztP4Q85ciARG6vDtpaCHuSmFJ+wFnJJaZYCYiduMTliabYk=
X-Google-Smtp-Source: AGHT+IERpDLmPFAJpJ8+6JKcLbHcXtZBNujYlqliN8siKmzcxZgt9d88fNgZeQYdyjNZx0VSeQIdBysFv5KwHz4ZoYwl2qFGUmih
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:22ca:b0:4bd:4861:d7f8 with SMTP id
 8926c6da1cb9f-4ce62fd0173mr105869173.4.1724281235997; Wed, 21 Aug 2024
 16:00:35 -0700 (PDT)
Date: Wed, 21 Aug 2024 16:00:35 -0700
In-Reply-To: <0000000000006bc6d20620023a14@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000090974a0620398254@google.com>
Subject: Re: [syzbot] [ppp?] inconsistent lock state in valid_state (4)
From: syzbot <syzbot+d43eb079c2addf2439c3@syzkaller.appspotmail.com>
To: coreteam@netfilter.org, davem@davemloft.net, dsahern@kernel.org, 
	edumazet@google.com, kadlec@netfilter.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, pabeni@redhat.com, 
	pablo@netfilter.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    b311c1b497e5 Merge tag '6.11-rc4-server-fixes' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12dccc7b980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=df2f0ed7e30a639d
dashboard link: https://syzkaller.appspot.com/bug?extid=d43eb079c2addf2439c3
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17cf93d5980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=101bb693980000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-b311c1b4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1c99fa48192f/vmlinux-b311c1b4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/16d5710a012a/bzImage-b311c1b4.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d43eb079c2addf2439c3@syzkaller.appspotmail.com

================================
WARNING: inconsistent lock state
6.11.0-rc4-syzkaller-00019-gb311c1b497e5 #0 Not tainted
--------------------------------
inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
ksoftirqd/0/16 [HC0[0]:SC1[1]:HE1:SE0] takes:
ffff888039c531e0 (&pch->downl){+.?.}-{2:2}, at: spin_lock include/linux/spinlock.h:351 [inline]
ffff888039c531e0 (&pch->downl){+.?.}-{2:2}, at: ppp_channel_bridge_input drivers/net/ppp/ppp_generic.c:2272 [inline]
ffff888039c531e0 (&pch->downl){+.?.}-{2:2}, at: ppp_input+0x18b/0xa10 drivers/net/ppp/ppp_generic.c:2304
{SOFTIRQ-ON-W} state was registered at:
  lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
  __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
  _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:154
  spin_lock include/linux/spinlock.h:351 [inline]
  ppp_channel_bridge_input drivers/net/ppp/ppp_generic.c:2272 [inline]
  ppp_input+0x18b/0xa10 drivers/net/ppp/ppp_generic.c:2304
  pppoe_rcv_core+0x117/0x310 drivers/net/ppp/pppoe.c:379
  sk_backlog_rcv include/net/sock.h:1111 [inline]
  __release_sock+0x243/0x350 net/core/sock.c:3004
  release_sock+0x61/0x1f0 net/core/sock.c:3558
  pppoe_sendmsg+0xd5/0x750 drivers/net/ppp/pppoe.c:903
  sock_sendmsg_nosec net/socket.c:730 [inline]
  __sock_sendmsg+0x221/0x270 net/socket.c:745
  ____sys_sendmsg+0x525/0x7d0 net/socket.c:2597
  ___sys_sendmsg net/socket.c:2651 [inline]
  __sys_sendmmsg+0x3b2/0x740 net/socket.c:2737
  __do_sys_sendmmsg net/socket.c:2766 [inline]
  __se_sys_sendmmsg net/socket.c:2763 [inline]
  __x64_sys_sendmmsg+0xa0/0xb0 net/socket.c:2763
  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
  do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
  entry_SYSCALL_64_after_hwframe+0x77/0x7f
irq event stamp: 1309336
hardirqs last  enabled at (1309336): [<ffffffff8bc0d5ff>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
hardirqs last  enabled at (1309336): [<ffffffff8bc0d5ff>] _raw_spin_unlock_irqrestore+0x8f/0x140 kernel/locking/spinlock.c:194
hardirqs last disabled at (1309335): [<ffffffff8bc0d300>] __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:108 [inline]
hardirqs last disabled at (1309335): [<ffffffff8bc0d300>] _raw_spin_lock_irqsave+0xb0/0x120 kernel/locking/spinlock.c:162
softirqs last  enabled at (1309326): [<ffffffff81578ffa>] run_ksoftirqd+0xca/0x130 kernel/softirq.c:928
softirqs last disabled at (1309331): [<ffffffff81578ffa>] run_ksoftirqd+0xca/0x130 kernel/softirq.c:928

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&pch->downl);
  <Interrupt>
    lock(&pch->downl);

 *** DEADLOCK ***

1 lock held by ksoftirqd/0/16:
 #0: ffffffff8e938320 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:326 [inline]
 #0: ffffffff8e938320 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock include/linux/rcupdate.h:838 [inline]
 #0: ffffffff8e938320 (rcu_read_lock){....}-{1:2}, at: ppp_channel_bridge_input drivers/net/ppp/ppp_generic.c:2267 [inline]
 #0: ffffffff8e938320 (rcu_read_lock){....}-{1:2}, at: ppp_input+0x55/0xa10 drivers/net/ppp/ppp_generic.c:2304

stack backtrace:
CPU: 0 UID: 0 PID: 16 Comm: ksoftirqd/0 Not tainted 6.11.0-rc4-syzkaller-00019-gb311c1b497e5 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:93 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:119
 valid_state+0x13a/0x1c0 kernel/locking/lockdep.c:4012
 mark_lock_irq+0xbb/0xc20 kernel/locking/lockdep.c:4215
 mark_lock+0x223/0x350 kernel/locking/lockdep.c:4677
 __lock_acquire+0xbf9/0x2040 kernel/locking/lockdep.c:5096
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
 __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
 _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:154
 spin_lock include/linux/spinlock.h:351 [inline]
 ppp_channel_bridge_input drivers/net/ppp/ppp_generic.c:2272 [inline]
 ppp_input+0x18b/0xa10 drivers/net/ppp/ppp_generic.c:2304
 ppp_sync_process+0x71/0x160 drivers/net/ppp/ppp_synctty.c:490
 tasklet_action_common+0x321/0x4d0 kernel/softirq.c:785
 handle_softirqs+0x2c4/0x970 kernel/softirq.c:554
 run_ksoftirqd+0xca/0x130 kernel/softirq.c:928
 smpboot_thread_fn+0x544/0xa30 kernel/smpboot.c:164
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

