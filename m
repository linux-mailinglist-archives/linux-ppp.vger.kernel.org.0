Return-Path: <linux-ppp+bounces-214-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CEEA34D94
	for <lists+linux-ppp@lfdr.de>; Thu, 13 Feb 2025 19:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0F003A127B
	for <lists+linux-ppp@lfdr.de>; Thu, 13 Feb 2025 18:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5577024290C;
	Thu, 13 Feb 2025 18:25:25 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADED22063E1
	for <linux-ppp@vger.kernel.org>; Thu, 13 Feb 2025 18:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739471125; cv=none; b=eLwwKj1+FHo/Bu/wasU2el8zHIrlFexMdGiN5JAkEPVSbOEd1oA7+oabPSUVl7nOsFM/VMZwFUU7ju7v+G/8SIjsTxzoSm6PhuwuNIOyY6X+1+w+tebvxbMOpOcH63/9JOruITfkPvGHhpj/mlqCMNdaQRip627E6YZ7gBEJVL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739471125; c=relaxed/simple;
	bh=fYT+0hn4LN4TCcfjDS0s+i8ggVVeBeWT+1SZ1n15P9U=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=K7AHiJvCGc8yHJ3aHJqxx1+TF/IbXtFEG0rIO8k+/0FTYT7h25PIFGMLsiLisO7h1yH47TYRdgCGw1CCCooDWo+FjBJhR3AwFD0XhbIKU+gM48O0SoKE0N9xAEvwJhzVpeXzdWRTEoSI+JkRYMXbw//FAJtHSLxUdzzwvTQ7NVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d18e28a0c1so16856205ab.3
        for <linux-ppp@vger.kernel.org>; Thu, 13 Feb 2025 10:25:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739471123; x=1740075923;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YmmpOVCfEgi0ptkqJPtsGe9FgkXLTDtXBsR9MtbAgF8=;
        b=cHFC7jGACqIQhECwVdColWwBtnUVJSgyNw0KpXmOBJ4MjhM03T5vBewC97NYtqwLyJ
         Dl27oGlBKacujgQO7G8pOjlAxjAAmoFIl7IlmZ5X4cBZUFAtWkLlCZRXvUrI+nqqn3I/
         8qxHkl/clvbXOYvGKWxIw1lezkBCOK5dSU/nPKHNgFYg2Y/mqN44oo0ETDAl8lbd/sPF
         M/I5B0DJf6CtqERHllr8jROzLvYOxxPVEbBomYztkbGudXDQLGNYcHI+OuBTH76rCmSn
         uFebfd9Uf5X7rG7Q2OIqBiFHfvmNUtO31W7kEMiLLkz5qPlIx8DoEOjAwnJYAbz0KaEa
         j8JA==
X-Forwarded-Encrypted: i=1; AJvYcCWtVvXY8Fam0y4bC/0d0SccJsP3H5PYI2D2LuX5fSCBE2XAFAuP0tXsyuB7pHvEaIXKhRprYNuK2vA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvHdEegIamyP6pOG+HiGt/+jX+1SfLQj/ADij3uXE6MTwdaDAN
	yopTO3dMylrO/6BZ2yIdBwHxegeZ1xFKyC5mhw/Ps5/xTPNiRwIedUwa0N9Kss7rZzpf/f+APpm
	muOI2TBJ7BZgWwKsyLTCkUtRtMiKANurdZekVMViyyQNOizxwiFfBV2g=
X-Google-Smtp-Source: AGHT+IHYJphH/00k6pql6g5oy6NLNRlrxwXkGv+8BX1jOE6w8Kfwtp0KM+x1CAZlZg3d4vGtfnUbvUcAcqS4wc1YZFa9JN7nMOmN
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:154e:b0:3d0:f2ca:659a with SMTP id
 e9e14a558f8ab-3d17d136916mr76258345ab.15.1739471122856; Thu, 13 Feb 2025
 10:25:22 -0800 (PST)
Date: Thu, 13 Feb 2025 10:25:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ae3912.050a0220.21dd3.0021.GAE@google.com>
Subject: [syzbot] [ppp?] KMSAN: uninit-value in ppp_sync_send (2)
From: syzbot <syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9946eaf552b1 Merge tag 'hardening-v6.14-rc2' of git://git...
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=131dabdf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f20bce78db15972a
dashboard link: https://syzkaller.appspot.com/bug?extid=29fc8991b0ecb186cf40
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17b142a4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14167df8580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/955ec208b383/disk-9946eaf5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ccb7613686d1/vmlinux-9946eaf5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/10b92522362a/bzImage-9946eaf5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in ppp_sync_txmunge drivers/net/ppp/ppp_synctty.c:516 [inline]
BUG: KMSAN: uninit-value in ppp_sync_send+0x21c/0xb00 drivers/net/ppp/ppp_synctty.c:568
 ppp_sync_txmunge drivers/net/ppp/ppp_synctty.c:516 [inline]
 ppp_sync_send+0x21c/0xb00 drivers/net/ppp/ppp_synctty.c:568
 ppp_channel_bridge_input drivers/net/ppp/ppp_generic.c:2280 [inline]
 ppp_input+0x1f1/0xe60 drivers/net/ppp/ppp_generic.c:2304
 pppoe_rcv_core+0x1d3/0x720 drivers/net/ppp/pppoe.c:379
 sk_backlog_rcv+0x13b/0x420 include/net/sock.h:1122
 __release_sock+0x1da/0x330 net/core/sock.c:3106
 release_sock+0x6b/0x250 net/core/sock.c:3660
 pppoe_sendmsg+0xb35/0xc50 drivers/net/ppp/pppoe.c:903
 sock_sendmsg_nosec net/socket.c:718 [inline]
 __sock_sendmsg+0x30f/0x380 net/socket.c:733
 ____sys_sendmsg+0x903/0xb60 net/socket.c:2573
 ___sys_sendmsg+0x28d/0x3c0 net/socket.c:2627
 __sys_sendmmsg+0x2ff/0x880 net/socket.c:2716
 __do_sys_sendmmsg net/socket.c:2743 [inline]
 __se_sys_sendmmsg net/socket.c:2740 [inline]
 __x64_sys_sendmmsg+0xbc/0x120 net/socket.c:2740
 x64_sys_call+0x33c2/0x3c30 arch/x86/include/generated/asm/syscalls_64.h:308
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4121 [inline]
 slab_alloc_node mm/slub.c:4164 [inline]
 kmem_cache_alloc_node_noprof+0x907/0xe00 mm/slub.c:4216
 kmalloc_reserve+0x13d/0x4a0 net/core/skbuff.c:587
 __alloc_skb+0x363/0x7b0 net/core/skbuff.c:678
 alloc_skb include/linux/skbuff.h:1331 [inline]
 sock_wmalloc+0xfe/0x1a0 net/core/sock.c:2746
 pppoe_sendmsg+0x385/0xc50 drivers/net/ppp/pppoe.c:867
 sock_sendmsg_nosec net/socket.c:718 [inline]
 __sock_sendmsg+0x30f/0x380 net/socket.c:733
 ____sys_sendmsg+0x903/0xb60 net/socket.c:2573
 ___sys_sendmsg+0x28d/0x3c0 net/socket.c:2627
 __sys_sendmmsg+0x2ff/0x880 net/socket.c:2716
 __do_sys_sendmmsg net/socket.c:2743 [inline]
 __se_sys_sendmmsg net/socket.c:2740 [inline]
 __x64_sys_sendmmsg+0xbc/0x120 net/socket.c:2740
 x64_sys_call+0x33c2/0x3c30 arch/x86/include/generated/asm/syscalls_64.h:308
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 1 UID: 0 PID: 5806 Comm: syz-executor201 Not tainted 6.14.0-rc1-syzkaller-00235-g9946eaf552b1 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

