Return-Path: <linux-ppp+bounces-64-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C030190683C
	for <lists+linux-ppp@lfdr.de>; Thu, 13 Jun 2024 11:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEED61C21C12
	for <lists+linux-ppp@lfdr.de>; Thu, 13 Jun 2024 09:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B98B13DB83;
	Thu, 13 Jun 2024 09:12:31 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF613209
	for <linux-ppp@vger.kernel.org>; Thu, 13 Jun 2024 09:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718269951; cv=none; b=a24IHbPndi7N/ZuNGe4h/812af2J72eHIRhoqaBKxj0Lndax2mNEXxYFdcbe6zc9kTqxw5HtXWDJntxNQ6vsB7PHw7PjFh/4z4bEylbbHh0dOBBOW2703c3J3nFyR+/Zm+n+vrsdGEjXjLKFVcJ6BuMBaPh2dI4pXYac0/VH7LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718269951; c=relaxed/simple;
	bh=v3xP34y2Kqz9tAvkUGjtqaPysCSq513+rEw0ux33bZU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=DgWIi3JLsJ6F2LIVVV4YUCiCJx4wr+iDpHbHArzbxq2pmYvFjJSyB6urxwTT3c4EHoNnomVP6yB8YqOF/c3Zfl/OQ5IfWZhcva7U2MNqP9oF+bHgtkUAtE7Gs5NwKodvG3JWlzdfzcW2PCN4W1PcpdxgpQRoTv2QanQ6BSWUB+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3759d2440c4so6768945ab.1
        for <linux-ppp@vger.kernel.org>; Thu, 13 Jun 2024 02:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718269949; x=1718874749;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nLMUrKsMG2Xf4e/PTbl5dpOWAgPgPt620Z5seuQUYCY=;
        b=Fvm6BZ1D8EUs8aJqllK0/dMP374mQkNnH4FBx0FnLsn5/rPwUOwaFSIo9E+sKiQzwo
         qGIXMRAj9C1CKYjO7PenQQNMMVjc2Z6c3ah7qlech+MJ/DVvB+e6UTNKBjkmJX8pYIRl
         0Cms50yDc3xmq9kh02KMVfzTRupf2YXup9tyG2DSzWY0c59PcvEi5UAOl+nu/JP7PCMi
         7gmV4NCpqm9HsQzToYQNI9nquUKqo2TRPEoY71/BZVtWe1DuJnKygvWmlebRvTub/DEG
         8UMsiyP2RSdkRtcEG14sMrlLu+FCgZMnR8+Q3Y6oe4Zm1wPwVShatdoQFr7WWzHfmb+f
         VwaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjkKhJz1YCOhgzjmNRS8Ir0IGE2NyLMHAckPJ9sLBhkM4CkBme3x2ZhYdzHvi1bhkxpLNIvNJmXE57fhscgF8z4SH30xwENGB/
X-Gm-Message-State: AOJu0Yzsxadg83mit/4YkGXqqH8lNUkauk9PhRcIi1xeT3prGXTLNAJh
	MGp9uU/NkLkiqrZ4EZSE4qfcNe1fPebvhkG1FvhMP3pT8+moYw9hhxIyrVVoru3a+4kRxkjhMn4
	j1VIv5njaZIK0QS6zVmQd4G2JaT63pc2JrYHKXKm9ss3YxX3VeVfIg/U=
X-Google-Smtp-Source: AGHT+IEaTJHT00Vr7hkv4iPBqju355oH0gjr0pKcus/2z4NhB+o4fK56Kcuy5h+dtz1VI5HvFWdVZZpl5EJ8LUsfF/UEXX8H3RKK
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1feb:b0:374:70ae:e86e with SMTP id
 e9e14a558f8ab-375cd24a4f3mr2695675ab.6.1718269949074; Thu, 13 Jun 2024
 02:12:29 -0700 (PDT)
Date: Thu, 13 Jun 2024 02:12:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f17182061ac1e554@google.com>
Subject: [syzbot] [ppp?] INFO: task hung in ppp_exit_net (4)
From: syzbot <syzbot+32bd764abd98eb40dea8@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2ef5971ff345 Merge tag 'vfs-6.10-rc4.fixes' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13e22cee980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b8786f381e62940f
dashboard link: https://syzkaller.appspot.com/bug?extid=32bd764abd98eb40dea8
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/db17be0247f3/disk-2ef5971f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/af92d227f130/vmlinux-2ef5971f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f98ae987ba14/bzImage-2ef5971f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+32bd764abd98eb40dea8@syzkaller.appspotmail.com

INFO: task kworker/u8:4:61 blocked for more than 143 seconds.
      Not tainted 6.10.0-rc3-syzkaller-00021-g2ef5971ff345 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u8:4    state:D stack:22928 pid:61    tgid:61    ppid:2      flags:0x00004000
Workqueue: netns cleanup_net
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5408 [inline]
 __schedule+0xf15/0x5d00 kernel/sched/core.c:6745
 __schedule_loop kernel/sched/core.c:6822 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6837
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6894
 __mutex_lock_common kernel/locking/mutex.c:684 [inline]
 __mutex_lock+0x5b8/0x9c0 kernel/locking/mutex.c:752
 ppp_exit_net+0xae/0x3b0 drivers/net/ppp/ppp_generic.c:1131
 ops_exit_list+0xb0/0x180 net/core/net_namespace.c:173
 cleanup_net+0x5b7/0xbf0 net/core/net_namespace.c:640
 process_one_work+0x9fb/0x1b60 kernel/workqueue.c:3231
 process_scheduled_works kernel/workqueue.c:3312 [inline]
 worker_thread+0x6c8/0xf70 kernel/workqueue.c:3393
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
INFO: task syz-executor.2:8975 blocked for more than 143 seconds.
      Not tainted 6.10.0-rc3-syzkaller-00021-g2ef5971ff345 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor.2  state:D stack:26656 pid:8975  tgid:8973  ppid:5107   flags:0x00000006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5408 [inline]
 __schedule+0xf15/0x5d00 kernel/sched/core.c:6745
 __schedule_loop kernel/sched/core.c:6822 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6837
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6894
 __mutex_lock_common kernel/locking/mutex.c:684 [inline]
 __mutex_lock+0x5b8/0x9c0 kernel/locking/mutex.c:752
 rtnl_lock net/core/rtnetlink.c:79 [inline]
 rtnetlink_rcv_msg+0x372/0xea0 net/core/rtnetlink.c:6632
 netlink_rcv_skb+0x16b/0x440 net/netlink/af_netlink.c:2564
 netlink_unicast_kernel net/netlink/af_netlink.c:1335 [inline]
 netlink_unicast+0x542/0x820 net/netlink/af_netlink.c:1361
 netlink_sendmsg+0x8b8/0xd70 net/netlink/af_netlink.c:1905
 sock_sendmsg_nosec net/socket.c:730 [inline]
 __sock_sendmsg net/socket.c:745 [inline]
 ____sys_sendmsg+0xab5/0xc90 net/socket.c:2585
 ___sys_sendmsg+0x135/0x1e0 net/socket.c:2639
 __sys_sendmsg+0x117/0x1f0 net/socket.c:2668
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcb2b07cea9
RSP: 002b:00007fcb2bead0c8 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 00007fcb2b1b3f80 RCX: 00007fcb2b07cea9
RDX: 0000000000000000 RSI: 0000000020000040 RDI: 0000000000000003
RBP: 00007fcb2b0ebff4 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000000b R14: 00007fcb2b1b3f80 R15: 00007ffcd9ec90f8
 </TASK>
INFO: task syz-executor.4:9029 blocked for more than 144 seconds.
      Not tainted 6.10.0-rc3-syzkaller-00021-g2ef5971ff345 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor.4  state:D stack:25968 pid:9029  tgid:9022  ppid:5111   flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5408 [inline]
 __schedule+0xf15/0x5d00 kernel/sched/core.c:6745
 __schedule_loop kernel/sched/core.c:6822 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6837
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6894
 __mutex_lock_common kernel/locking/mutex.c:684 [inline]
 __mutex_lock+0x5b8/0x9c0 kernel/locking/mutex.c:752
 register_nexthop_notifier+0x1b/0x70 net/ipv4/nexthop.c:3871
 ops_init+0xb9/0x650 net/core/net_namespace.c:139
 setup_net+0x435/0xb40 net/core/net_namespace.c:343
 copy_net_ns+0x2f0/0x670 net/core/net_namespace.c:508
 create_new_namespaces+0x3ea/0xb10 kernel/nsproxy.c:110
 unshare_nsproxy_namespaces+0xc0/0x1f0 kernel/nsproxy.c:228
 ksys_unshare+0x419/0x970 kernel/fork.c:3323
 __do_sys_unshare kernel/fork.c:3394 [inline]
 __se_sys_unshare kernel/fork.c:3392 [inline]
 __x64_sys_unshare+0x31/0x40 kernel/fork.c:3392
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9f8ae7cea9
RSP: 002b:00007f9f8bb220c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000110
RAX: ffffffffffffffda RBX: 00007f9f8afb4120 RCX: 00007f9f8ae7cea9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000064000600
RBP: 00007f9f8aeebff4 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000006e R14: 00007f9f8afb4120 R15: 00007ffd19e177f8
 </TASK>
INFO: task syz-executor.0:9026 blocked for more than 144 seconds.
      Not tainted 6.10.0-rc3-syzkaller-00021-g2ef5971ff345 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor.0  state:D stack:27968 pid:9026  tgid:9023  ppid:6840   flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5408 [inline]
 __schedule+0xf15/0x5d00 kernel/sched/core.c:6745
 __schedule_loop kernel/sched/core.c:6822 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6837
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6894
 __mutex_lock_common kernel/locking/mutex.c:684 [inline]
 __mutex_lock+0x5b8/0x9c0 kernel/locking/mutex.c:752


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

