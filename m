Return-Path: <linux-ppp+bounces-92-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 990E397AFCE
	for <lists+linux-ppp@lfdr.de>; Tue, 17 Sep 2024 13:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6257EB2B760
	for <lists+linux-ppp@lfdr.de>; Tue, 17 Sep 2024 11:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6E1170A12;
	Tue, 17 Sep 2024 11:45:31 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4661714D8
	for <linux-ppp@vger.kernel.org>; Tue, 17 Sep 2024 11:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726573530; cv=none; b=MQEMDHQgRoGNuDCsq7u5QZPoKK2GYUyWej8dpIeG+I9m4H/604dRiOGO0CiYfSPWPMNid51pQcfBn4aljKM2HNBcK5NgmKd2UfTgT95cjkB41vvnlK5HzOLQOcpAcaI8Cgup8wDMNqhYXhJU2kzb4Y6APgKwz8VX9OQz/rm+kH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726573530; c=relaxed/simple;
	bh=9RzaOPTjQ+wKsWYRbZCgyV42ffkPMTl6J9tvGBYqCCg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=q7WQ9EdkIqYy//49W8aMvS949WTzNoQiyKY1nU+POSkYrPCICpIiY177CqPmvAkGY8JzWUVaa1vhH7+e1HP4PzAARctdLZomldPHe6KDXmMp5RaWxPWg25/aAdghcsAAqhDzi5moqjtEN5obes0PXFHbE9Z7mlR0214ijWtbQBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a0ac0d22edso16396135ab.1
        for <linux-ppp@vger.kernel.org>; Tue, 17 Sep 2024 04:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726573521; x=1727178321;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L5/CndsbPhhuj99heJXhpSJ/CLurEKeBsAhBHAODaYg=;
        b=JSpFSSHLUMETxjOFr//UhqprtGcsClk+0Agj49ozLsSLfb6n/lBpIbApATQyHVJK15
         V/nqB/ENbIEpE6kFJ9wLNkCjPfsr+ushtvAFjb5+wcq+3+r43JOJG2JI4rf5JTikyf9A
         BadA056HcQeK7nC/1kB+uJocOGv1c4tAl8GR1Fody/YuBBdhBNCaU8V6NOIJ69DVeKwZ
         c5BtLgdDjnGyM1/8rn2rkIricgcXxEW3PIInxwqi4rj7K7Q+ouZ4kiwl5Y9c2MTBnufU
         MbBXABu5wUEkhj1HOKVaij0FbqMnu1hzNQ5I9YLWQ9+w2Vwjid6Jd62FBVIfXDfO9Lgr
         60Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXGiSAdVwjlTHZUKnbTuSdhS8qV/nvJlpWgr6rCXV16Hi1Kf5eWFSkmbtr37IpgTOd0bcxVJc2a0+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyORicdCGFq8fgArE7Cq7pe7tmBX9LV0waBUquFOJ46P4XsFkE6
	4rWdUbAPD4UuRP6blvxymE8wUC9nZokXtRmNno7UJhlEbIkbdHe9dxsGU3jayEtysX/y7nCNqb0
	QWQCdOkWQ2SWQB5FUj+LuU2+lk/KdmTDfxMwca5hpc+Y+wKxUaSagXN8=
X-Google-Smtp-Source: AGHT+IGFTd18OnOeTSAQ9ekPYgpxd9hmlpiD/lBOBlBj2YCfD49rZ4WG0x8286aGhkJgJoQfoiBS7qs1K+QQsvdqhA94iijHs5Ns
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a42:b0:3a0:9a32:dedc with SMTP id
 e9e14a558f8ab-3a09a32e23bmr82899795ab.6.1726573521341; Tue, 17 Sep 2024
 04:45:21 -0700 (PDT)
Date: Tue, 17 Sep 2024 04:45:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006b23e606224f39cd@google.com>
Subject: [syzbot] [ppp?] possible deadlock in ppp_input
From: syzbot <syzbot+38ad8c7c6638c5381a47@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d42f7708e27c Merge tag 'for-linus-6.11' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17d057c7980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=61d235cb8d15001c
dashboard link: https://syzkaller.appspot.com/bug?extid=38ad8c7c6638c5381a47
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a36d838567fc/disk-d42f7708.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/84e3541e98ef/vmlinux-d42f7708.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1186c70ee3e0/bzImage-d42f7708.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+38ad8c7c6638c5381a47@syzkaller.appspotmail.com

=====================================================
WARNING: SOFTIRQ-READ-safe -> SOFTIRQ-READ-unsafe lock order detected
6.11.0-rc7-syzkaller-00151-gd42f7708e27c #0 Not tainted
-----------------------------------------------------
syz.2.1597/12167 [HC0[0]:SC0[8]:HE1:SE0] is trying to acquire:
ffff8880635c39e0 (&pch->downl){+.+.}-{2:2}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffff8880635c39e0 (&pch->downl){+.+.}-{2:2}, at: ppp_connect_channel+0x194/0x650 drivers/net/ppp/ppp_generic.c:3485

and this task is already holding:
ffff888078e3ee10 (&ppp->rlock){+...}-{2:2}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffff888078e3ee10 (&ppp->rlock){+...}-{2:2}, at: ppp_connect_channel+0x185/0x650 drivers/net/ppp/ppp_generic.c:3484
which would create a new lock dependency:
 (&ppp->rlock){+...}-{2:2} -> (&pch->downl){+.+.}-{2:2}

but this new dependency connects a SOFTIRQ-READ-irq-safe lock:
 (&pch->upl){++.-}-{2:2}

... which became SOFTIRQ-READ-irq-safe at:
  lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
  __raw_read_lock_bh include/linux/rwlock_api_smp.h:176 [inline]
  _raw_read_lock_bh+0x3d/0x50 kernel/locking/spinlock.c:252
  ppp_input+0x3dc/0xa10 drivers/net/ppp/ppp_generic.c:2307
  ppp_sync_process+0x71/0x160 drivers/net/ppp/ppp_synctty.c:490
  tasklet_action_common+0x323/0x4d0 kernel/softirq.c:785
  handle_softirqs+0x2c6/0x970 kernel/softirq.c:554
  run_ksoftirqd+0xca/0x130 kernel/softirq.c:928
  smpboot_thread_fn+0x546/0xa30 kernel/smpboot.c:164
  kthread+0x2f2/0x390 kernel/kthread.c:389
  ret_from_fork+0x4d/0x80 arch/x86/kernel/process.c:147
  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

to a SOFTIRQ-READ-irq-unsafe lock:
 (&pch->downl){+.+.}-{2:2}

... which became SOFTIRQ-READ-irq-unsafe at:
...
  lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
  __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
  _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:154
  spin_lock include/linux/spinlock.h:351 [inline]
  ppp_channel_bridge_input drivers/net/ppp/ppp_generic.c:2272 [inline]
  ppp_input+0x18b/0xa10 drivers/net/ppp/ppp_generic.c:2304
  pppoe_rcv_core+0x117/0x310 drivers/net/ppp/pppoe.c:379
  sk_backlog_rcv include/net/sock.h:1111 [inline]
  __release_sock+0x245/0x350 net/core/sock.c:3004
  release_sock+0x61/0x1f0 net/core/sock.c:3558
  pppoe_sendmsg+0xd5/0x750 drivers/net/ppp/pppoe.c:903
  sock_sendmsg_nosec net/socket.c:730 [inline]
  __sock_sendmsg+0x223/0x270 net/socket.c:745
  ____sys_sendmsg+0x525/0x7d0 net/socket.c:2597
  ___sys_sendmsg net/socket.c:2651 [inline]
  __sys_sendmmsg+0x3b2/0x740 net/socket.c:2737
  __do_sys_sendmmsg net/socket.c:2766 [inline]
  __se_sys_sendmmsg net/socket.c:2763 [inline]
  __x64_sys_sendmmsg+0xa0/0xb0 net/socket.c:2763
  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
  do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
  entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &pch->upl --> &ppp->rlock --> &pch->downl

 Possible interrupt unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&pch->downl);
                               local_irq_disable();
                               lock(&pch->upl);
                               lock(&ppp->rlock);
  <Interrupt>
    lock(&pch->upl);

 *** DEADLOCK ***

5 locks held by syz.2.1597/12167:
 #0: ffffffff8f4700a8 (ppp_mutex){+.+.}-{3:3}, at: ppp_ioctl+0x112/0x1cd0 drivers/net/ppp/ppp_generic.c:729
 #1: ffff888057470cc0 (&pn->all_ppp_mutex){+.+.}-{3:3}, at: ppp_connect_channel+0x5e/0x650 drivers/net/ppp/ppp_generic.c:3474
 #2: ffff8880635c3a48 (&pch->upl){++.-}-{2:2}, at: ppp_connect_channel+0x87/0x650 drivers/net/ppp/ppp_generic.c:3478
 #3: ffff888078e3ee50 (&ppp->wlock){+...}-{2:2}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
 #3: ffff888078e3ee50 (&ppp->wlock){+...}-{2:2}, at: ppp_connect_channel+0x174/0x650 drivers/net/ppp/ppp_generic.c:3484
 #4: ffff888078e3ee10 (&ppp->rlock){+...}-{2:2}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
 #4: ffff888078e3ee10 (&ppp->rlock){+...}-{2:2}, at: ppp_connect_channel+0x185/0x650 drivers/net/ppp/ppp_generic.c:3484

the dependencies between SOFTIRQ-READ-irq-safe lock and the holding lock:
  -> (&pch->upl){++.-}-{2:2} {
     HARDIRQ-ON-W at:
                        lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
                        __raw_write_lock_bh include/linux/rwlock_api_smp.h:202 [inline]
                        _raw_write_lock_bh+0x35/0x50 kernel/locking/spinlock.c:334
                        ppp_disconnect_channel+0x2f/0x2d0 drivers/net/ppp/ppp_generic.c:3522
                        ppp_unregister_channel+0xb9/0x300 drivers/net/ppp/ppp_generic.c:2996
                        pppox_unbind_sock+0x5c/0xb0 drivers/net/ppp/pppox.c:58
                        pppol2tp_release+0x99/0x340 net/l2tp/l2tp_ppp.c:438
                        __sock_release net/socket.c:659 [inline]
                        sock_close+0xbe/0x240 net/socket.c:1421
                        __fput+0x24c/0x8a0 fs/file_table.c:422
                        task_work_run+0x251/0x310 kernel/task_work.c:228
                        resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
                        exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
                        exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
                        __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
                        syscall_exit_to_user_mode+0x168/0x370 kernel/entry/common.c:218
                        do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
                        entry_SYSCALL_64_after_hwframe+0x77/0x7f
     HARDIRQ-ON-R at:
                        lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
                        __raw_read_lock_bh include/linux/rwlock_api_smp.h:176 [inline]
                        _raw_read_lock_bh+0x3d/0x50 kernel/locking/spinlock.c:252
                        ppp_channel_push+0x2c/0x220 drivers/net/ppp/ppp_generic.c:2186
                        ppp_write+0x2b3/0x3f0 drivers/net/ppp/ppp_generic.c:540
                        vfs_write+0x2a4/0xc90 fs/read_write.c:588
                        ksys_write+0x1a0/0x2c0 fs/read_write.c:643
                        do_syscall_x64 arch/x86/entry/common.c:52 [inline]
                        do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
                        entry_SYSCALL_64_after_hwframe+0x77/0x7f
     IN-SOFTIRQ-R at:
                        lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
                        __raw_read_lock_bh include/linux/rwlock_api_smp.h:176 [inline]
                        _raw_read_lock_bh+0x3d/0x50 kernel/locking/spinlock.c:252
                        ppp_input+0x3dc/0xa10 drivers/net/ppp/ppp_generic.c:2307
                        ppp_sync_process+0x71/0x160 drivers/net/ppp/ppp_synctty.c:490
                        tasklet_action_common+0x323/0x4d0 kernel/softirq.c:785
                        handle_softirqs+0x2c6/0x970 kernel/softirq.c:554
                        run_ksoftirqd+0xca/0x130 kernel/softirq.c:928
                        smpboot_thread_fn+0x546/0xa30 kernel/smpboot.c:164
                        kthread+0x2f2/0x390 kernel/kthread.c:389
                        ret_from_fork+0x4d/0x80 arch/x86/kernel/process.c:147
                        ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
     INITIAL USE at:
                       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
                       __raw_write_lock_bh include/linux/rwlock_api_smp.h:202 [inline]
                       _raw_write_lock_bh+0x35/0x50 kernel/locking/spinlock.c:334
                       ppp_disconnect_channel+0x2f/0x2d0 drivers/net/ppp/ppp_generic.c:3522
                       ppp_unregister_channel+0xb9/0x300 drivers/net/ppp/ppp_generic.c:2996
                       pppox_unbind_sock+0x5c/0xb0 drivers/net/ppp/pppox.c:58
                       pppol2tp_release+0x99/0x340 net/l2tp/l2tp_ppp.c:438
                       __sock_release net/socket.c:659 [inline]
                       sock_close+0xbe/0x240 net/socket.c:1421
                       __fput+0x24c/0x8a0 fs/file_table.c:422
                       task_work_run+0x251/0x310 kernel/task_work.c:228
                       resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
                       exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
                       exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
                       __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
                       syscall_exit_to_user_mode+0x168/0x370 kernel/entry/common.c:218
                       do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
                       entry_SYSCALL_64_after_hwframe+0x77/0x7f
     INITIAL READ USE at:
                            lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
                            __raw_read_lock_bh include/linux/rwlock_api_smp.h:176 [inline]
                            _raw_read_lock_bh+0x3d/0x50 kernel/locking/spinlock.c:252
                            ppp_channel_push+0x2c/0x220 drivers/net/ppp/ppp_generic.c:2186
                            ppp_write+0x2b3/0x3f0 drivers/net/ppp/ppp_generic.c:540
                            vfs_write+0x2a4/0xc90 fs/read_write.c:588
                            ksys_write+0x1a0/0x2c0 fs/read_write.c:643
                            do_syscall_x64 arch/x86/entry/common.c:52 [inline]
                            do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
                            entry_SYSCALL_64_after_hwframe+0x77/0x7f
   }
   ... key      at: [<ffffffff9a68b1a0>] ppp_register_net_channel.__key.3+0x0/0x20
 -> (&ppp->wlock){+...}-{2:2} {
    HARDIRQ-ON-W at:
                      lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
                      __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
                      _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
                      spin_lock_bh include/linux/spinlock.h:356 [inline]
                      ppp_get_stats64+0xc3/0x290 drivers/net/ppp/ppp_generic.c:1539
                      dev_get_stats+0xaf/0xa00 net/core/dev.c:10894
                      rtnl_fill_stats+0x47/0x880 net/core/rtnetlink.c:1268
                      rtnl_fill_ifinfo+0x18da/0x2270 net/core/rtnetlink.c:1909
                      rtmsg_ifinfo_build_skb+0x18a/0x260 net/core/rtnetlink.c:4079
                      rtmsg_ifinfo_event net/core/rtnetlink.c:4113 [inline]
                      rtmsg_ifinfo+0x91/0x1b0 net/core/rtnetlink.c:4122
                      register_netdevice+0x1774/0x1b00 net/core/dev.c:10491
                      ppp_unit_register drivers/net/ppp/ppp_generic.c:1219 [inline]
                      ppp_dev_configure+0x883/0xb10 drivers/net/ppp/ppp_generic.c:1275
                      ppp_create_interface drivers/net/ppp/ppp_generic.c:3348 [inline]
                      ppp_unattached_ioctl drivers/net/ppp/ppp_generic.c:1060 [inline]
                      ppp_ioctl+0x799/0x1cd0 drivers/net/ppp/ppp_generic.c:733
                      vfs_ioctl fs/ioctl.c:51 [inline]
                      __do_sys_ioctl fs/ioctl.c:907 [inline]
                      __se_sys_ioctl+0xfe/0x170 fs/ioctl.c:893
                      do_syscall_x64 arch/x86/entry/common.c:52 [inline]
                      do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
                      entry_SYSCALL_64_after_hwframe+0x77/0x7f
    INITIAL USE at:
                     lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
                     __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
                     _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
                     spin_lock_bh include/linux/spinlock.h:356 [inline]
                     ppp_get_stats64+0xc3/0x290 drivers/net/ppp/ppp_generic.c:1539
                     dev_get_stats+0xaf/0xa00 net/core/dev.c:10894
                     rtnl_fill_stats+0x47/0x880 net/core/rtnetlink.c:1268
                     rtnl_fill_ifinfo+0x18da/0x2270 net/core/rtnetlink.c:1909
                     rtmsg_ifinfo_build_skb+0x18a/0x260 net/core/rtnetlink.c:4079
                     rtmsg_ifinfo_event net/core/rtnetlink.c:4113 [inline]
                     rtmsg_ifinfo+0x91/0x1b0 net/core/rtnetlink.c:4122
                     register_netdevice+0x1774/0x1b00 net/core/dev.c:10491
                     ppp_unit_register drivers/net/ppp/ppp_generic.c:1219 [inline]
                     ppp_dev_configure+0x883/0xb10 drivers/net/ppp/ppp_generic.c:1275
                     ppp_create_interface drivers/net/ppp/ppp_generic.c:3348 [inline]
                     ppp_unattached_ioctl drivers/net/ppp/ppp_generic.c:1060 [inline]
                     ppp_ioctl+0x799/0x1cd0 drivers/net/ppp/ppp_generic.c:733
                     vfs_ioctl fs/ioctl.c:51 [inline]
                     __do_sys_ioctl fs/ioctl.c:907 [inline]
                     __se_sys_ioctl+0xfe/0x170 fs/ioctl.c:893
                     do_syscall_x64 arch/x86/entry/common.c:52 [inline]
                     do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
                     entry_SYSCALL_64_after_hwframe+0x77/0x7f
  }
  ... key      at: [<ffffffff9a68b2c0>] ppp_dev_configure.__key.67+0x0/0x20
  ... acquired at:
   lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
   __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
   _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
   spin_lock_bh include/linux/spinlock.h:356 [inline]
   ppp_connect_channel+0x174/0x650 drivers/net/ppp/ppp_generic.c:3484
   ppp_ioctl+0xdd6/0x1cd0 drivers/net/ppp/ppp_generic.c:761
   vfs_ioctl fs/ioctl.c:51 [inline]
   __do_sys_ioctl fs/ioctl.c:907 [inline]
   __se_sys_ioctl+0xfe/0x170 fs/ioctl.c:893
   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
   do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> (&ppp->rlock){+...}-{2:2} {
   HARDIRQ-ON-W at:
                    lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
                    __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
                    _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
                    spin_lock_bh include/linux/spinlock.h:356 [inline]
                    ppp_get_stats64+0x33/0x290 drivers/net/ppp/ppp_generic.c:1534
                    dev_get_stats+0xaf/0xa00 net/core/dev.c:10894
                    rtnl_fill_stats+0x47/0x880 net/core/rtnetlink.c:1268
                    rtnl_fill_ifinfo+0x18da/0x2270 net/core/rtnetlink.c:1909
                    rtmsg_ifinfo_build_skb+0x18a/0x260 net/core/rtnetlink.c:4079
                    rtmsg_ifinfo_event net/core/rtnetlink.c:4113 [inline]
                    rtmsg_ifinfo+0x91/0x1b0 net/core/rtnetlink.c:4122
                    register_netdevice+0x1774/0x1b00 net/core/dev.c:10491
                    ppp_unit_register drivers/net/ppp/ppp_generic.c:1219 [inline]
                    ppp_dev_configure+0x883/0xb10 drivers/net/ppp/ppp_generic.c:1275
                    ppp_create_interface drivers/net/ppp/ppp_generic.c:3348 [inline]
                    ppp_unattached_ioctl drivers/net/ppp/ppp_generic.c:1060 [inline]
                    ppp_ioctl+0x799/0x1cd0 drivers/net/ppp/ppp_generic.c:733
                    vfs_ioctl fs/ioctl.c:51 [inline]
                    __do_sys_ioctl fs/ioctl.c:907 [inline]
                    __se_sys_ioctl+0xfe/0x170 fs/ioctl.c:893
                    do_syscall_x64 arch/x86/entry/common.c:52 [inline]
                    do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
                    entry_SYSCALL_64_after_hwframe+0x77/0x7f
   INITIAL USE at:
                   lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
                   __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
                   _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
                   spin_lock_bh include/linux/spinlock.h:356 [inline]
                   ppp_get_stats64+0x33/0x290 drivers/net/ppp/ppp_generic.c:1534
                   dev_get_stats+0xaf/0xa00 net/core/dev.c:10894
                   rtnl_fill_stats+0x47/0x880 net/core/rtnetlink.c:1268
                   rtnl_fill_ifinfo+0x18da/0x2270 net/core/rtnetlink.c:1909
                   rtmsg_ifinfo_build_skb+0x18a/0x260 net/core/rtnetlink.c:4079
                   rtmsg_ifinfo_event net/core/rtnetlink.c:4113 [inline]
                   rtmsg_ifinfo+0x91/0x1b0 net/core/rtnetlink.c:4122
                   register_netdevice+0x1774/0x1b00 net/core/dev.c:10491
                   ppp_unit_register drivers/net/ppp/ppp_generic.c:1219 [inline]
                   ppp_dev_configure+0x883/0xb10 drivers/net/ppp/ppp_generic.c:1275
                   ppp_create_interface drivers/net/ppp/ppp_generic.c:3348 [inline]
                   ppp_unattached_ioctl drivers/net/ppp/ppp_generic.c:1060 [inline]
                   ppp_ioctl+0x799/0x1cd0 drivers/net/ppp/ppp_generic.c:733
                   vfs_ioctl fs/ioctl.c:51 [inline]
                   __do_sys_ioctl fs/ioctl.c:907 [inline]
                   __se_sys_ioctl+0xfe/0x170 fs/ioctl.c:893
                   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
                   do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
                   entry_SYSCALL_64_after_hwframe+0x77/0x7f
 }
 ... key      at: [<ffffffff9a68b2a0>] ppp_dev_configure.__key+0x0/0x20
 ... acquired at:
   lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
   __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
   _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
   spin_lock_bh include/linux/spinlock.h:356 [inline]
   ppp_ioctl+0x121b/0x1cd0 drivers/net/ppp/ppp_generic.c:944
   vfs_ioctl fs/ioctl.c:51 [inline]
   __do_sys_ioctl fs/ioctl.c:907 [inline]
   __se_sys_ioctl+0xfe/0x170 fs/ioctl.c:893
   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
   do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
   entry_SYSCALL_64_after_hwframe+0x77/0x7f


the dependencies between the lock to be acquired
 and SOFTIRQ-READ-irq-unsafe lock:
-> (&pch->downl){+.+.}-{2:2} {
   HARDIRQ-ON-W at:
                    lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
                    __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
                    _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
                    spin_lock_bh include/linux/spinlock.h:356 [inline]
                    ppp_unregister_channel+0x7c/0x300 drivers/net/ppp/ppp_generic.c:2992
                    pppox_unbind_sock+0x5c/0xb0 drivers/net/ppp/pppox.c:58
                    pppol2tp_release+0x99/0x340 net/l2tp/l2tp_ppp.c:438
                    __sock_release net/socket.c:659 [inline]
                    sock_close+0xbe/0x240 net/socket.c:1421
                    __fput+0x24c/0x8a0 fs/file_table.c:422
                    task_work_run+0x251/0x310 kernel/task_work.c:228
                    resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
                    exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
                    exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
                    __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
                    syscall_exit_to_user_mode+0x168/0x370 kernel/entry/common.c:218
                    do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
                    entry_SYSCALL_64_after_hwframe+0x77/0x7f
   SOFTIRQ-ON-W at:
                    lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
                    __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
                    _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:154
                    spin_lock include/linux/spinlock.h:351 [inline]
                    ppp_channel_bridge_input drivers/net/ppp/ppp_generic.c:2272 [inline]
                    ppp_input+0x18b/0xa10 drivers/net/ppp/ppp_generic.c:2304
                    pppoe_rcv_core+0x117/0x310 drivers/net/ppp/pppoe.c:379
                    sk_backlog_rcv include/net/sock.h:1111 [inline]
                    __release_sock+0x245/0x350 net/core/sock.c:3004
                    release_sock+0x61/0x1f0 net/core/sock.c:3558
                    pppoe_sendmsg+0xd5/0x750 drivers/net/ppp/pppoe.c:903
                    sock_sendmsg_nosec net/socket.c:730 [inline]
                    __sock_sendmsg+0x223/0x270 net/socket.c:745
                    ____sys_sendmsg+0x525/0x7d0 net/socket.c:2597
                    ___sys_sendmsg net/socket.c:2651 [inline]
                    __sys_sendmmsg+0x3b2/0x740 net/socket.c:2737
                    __do_sys_sendmmsg net/socket.c:2766 [inline]
                    __se_sys_sendmmsg net/socket.c:2763 [inline]
                    __x64_sys_sendmmsg+0xa0/0xb0 net/socket.c:2763
                    do_syscall_x64 arch/x86/entry/common.c:52 [inline]
                    do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
                    entry_SYSCALL_64_after_hwframe+0x77/0x7f
   INITIAL USE at:
                   lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
                   __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
                   _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
                   spin_lock_bh include/linux/spinlock.h:356 [inline]
                   ppp_unregister_channel+0x7c/0x300 drivers/net/ppp/ppp_generic.c:2992
                   pppox_unbind_sock+0x5c/0xb0 drivers/net/ppp/pppox.c:58
                   pppol2tp_release+0x99/0x340 net/l2tp/l2tp_ppp.c:438
                   __sock_release net/socket.c:659 [inline]
                   sock_close+0xbe/0x240 net/socket.c:1421
                   __fput+0x24c/0x8a0 fs/file_table.c:422
                   task_work_run+0x251/0x310 kernel/task_work.c:228
                   resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
                   exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
                   exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
                   __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
                   syscall_exit_to_user_mode+0x168/0x370 kernel/entry/common.c:218
                   do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
                   entry_SYSCALL_64_after_hwframe+0x77/0x7f
 }
 ... key      at: [<ffffffff9a68b180>] ppp_register_net_channel.__key.1+0x0/0x20
 ... acquired at:
   lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
   __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
   _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
   spin_lock_bh include/linux/spinlock.h:356 [inline]
   ppp_connect_channel+0x194/0x650 drivers/net/ppp/ppp_generic.c:3485
   ppp_ioctl+0xdd6/0x1cd0 drivers/net/ppp/ppp_generic.c:761
   vfs_ioctl fs/ioctl.c:51 [inline]
   __do_sys_ioctl fs/ioctl.c:907 [inline]
   __se_sys_ioctl+0xfe/0x170 fs/ioctl.c:893
   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
   do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
   entry_SYSCALL_64_after_hwframe+0x77/0x7f


stack backtrace:
CPU: 0 UID: 0 PID: 12167 Comm: syz.2.1597 Not tainted 6.11.0-rc7-syzkaller-00151-gd42f7708e27c #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/06/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:93 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:119
 print_bad_irq_dependency kernel/locking/lockdep.c:2625 [inline]
 check_irq_usage kernel/locking/lockdep.c:2864 [inline]
 check_prev_add kernel/locking/lockdep.c:3137 [inline]
 check_prevs_add kernel/locking/lockdep.c:3252 [inline]
 validate_chain+0x4de0/0x5900 kernel/locking/lockdep.c:3868
 __lock_acquire+0x137a/0x2040 kernel/locking/lockdep.c:5142
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
 __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
 _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
 spin_lock_bh include/linux/spinlock.h:356 [inline]
 ppp_connect_channel+0x194/0x650 drivers/net/ppp/ppp_generic.c:3485
 ppp_ioctl+0xdd6/0x1cd0 drivers/net/ppp/ppp_generic.c:761
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xfe/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8e1bb7def9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f8e1c9fd038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f8e1bd36208 RCX: 00007f8e1bb7def9
RDX: 0000000020000300 RSI: 000000004004743a RDI: 0000000000000005
RBP: 00007f8e1bbf0b76 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f8e1bd36208 R15: 00007ffee62b5158
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

