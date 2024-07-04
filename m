Return-Path: <linux-ppp+bounces-66-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 74884927B29
	for <lists+linux-ppp@lfdr.de>; Thu,  4 Jul 2024 18:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10756B21B3B
	for <lists+linux-ppp@lfdr.de>; Thu,  4 Jul 2024 16:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62EC1B3738;
	Thu,  4 Jul 2024 16:33:23 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2973C1B14FD
	for <linux-ppp@vger.kernel.org>; Thu,  4 Jul 2024 16:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720110803; cv=none; b=AlrSJdSgM8krweQ5vO5LiO+zIdRd4BWvFWK3Yoq5q9i2PPV7wzXZYzP17Ag37+QlQk0st+2aYCymo783bCEeCTmqmv4qCRZny2CcCiTVd0iNjUkRgFYBU3VgiidbrubUti05t76eLbyof8YrK0GIgaMdbJg01g8vLPS2vr2CrbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720110803; c=relaxed/simple;
	bh=5ITx1Qun66+GeWVbD/FYi+IU72IBJ5jSnCo7fyr73LI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=WOo9d5wMTcbc+iPbOQ+KxZF20rMF32+RiNOLB9PGheJvE+NXz3ThObliK6jjoZ/mtXJ5X9dERNQwGwANzQAOwduEQ9dHmbsvPJo5fW3DqD4L33O25y6PO5t23y3QrbOPJjL7ZN20C9HNBOa8+nmvHTOdKS5YK5tsCBVORw4WUOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7f3d2d068abso102566739f.2
        for <linux-ppp@vger.kernel.org>; Thu, 04 Jul 2024 09:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720110801; x=1720715601;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tG35q1StV/2z7cK6mhk2/Wuuk7vbrJGi0KGHNAimHPA=;
        b=qYi2REO8BAUkra0JNSMVRD7DsNWECZ1hx/RnBn7Qg1fjE31V0I3J4XmT1WOWI13S0c
         yBofc0g7D8Ryqnc/HVKtp+PtPNyoTXhpaxJ+w01PQKn9rrtH5r0g9VIM4M9O3TSWPKj/
         3cm6+sd9QnMlu1HbsagEGzuR+1o0nydIqhuOnimvqtMuCKVTTybyX2Vd7IQ1rAJI5GJU
         o1szvZhZ4wmOCMso3YKMPs+tHN/JnD7xszschJZJU8rEdh0xBpaSpbU/+v1aJaVi2Jt0
         vA2fNaPhYtpxcK+h9fa+gRWFXRnFog75mC5Sr8+LZqL+MvbEZSuej9/EUy00oNOd7E+3
         0xVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUh5JBhVZuP5l8eiRaQYB1o609wrb26NLyrC/eUcQct22pIo+L/UfyTo++uh6KxBKSthk6ECekSF5Unam+QvFdH7EOzzN2TXp4
X-Gm-Message-State: AOJu0Yx/sXO2o8CgxzKVcjGVMQwbkh5p0WxmvnQ37TCMmDZxX57e3Wno
	Jrx0QCZV48j9EgXdvfwP2zmuQpR4oEm/OLnt+HwKNgMG6NsQYHmjAL2pUEg+UV9oZVwp/xlmkvW
	6eolds5txDFIFF6rw/yJb9VGjAdvQEMtvJ6GgkD+T36pOo5QH3Q9Yz3s=
X-Google-Smtp-Source: AGHT+IGSvKTeR4Ftvy1VSZCCfNPptop45KTh2jm8edQ3/bXDMb60Xma0Hv5Zvta3bZoSo08lS7A2VoxJseIgu1kmLWrHdEMYJWDv
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:13cf:b0:4b9:e5b4:67fd with SMTP id
 8926c6da1cb9f-4bf60321c8amr163624173.1.1720110801300; Thu, 04 Jul 2024
 09:33:21 -0700 (PDT)
Date: Thu, 04 Jul 2024 09:33:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000494468061c6e81ea@google.com>
Subject: [syzbot] [ppp?] KMSAN: uninit-value in ppp_async_push (3)
From: syzbot <syzbot+ec0723ba9605678b14bf@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    614da38e2f7a Merge tag 'hid-for-linus-2024051401' of git:/..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1315203c980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f5d2cbf33633f507
dashboard link: https://syzkaller.appspot.com/bug?extid=ec0723ba9605678b14bf
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14b284e8980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1653d768980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/89eafb874b71/disk-614da38e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/356000512ad9/vmlinux-614da38e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/839c73939115/bzImage-614da38e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ec0723ba9605678b14bf@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in ppp_async_encode drivers/net/ppp/ppp_async.c:548 [inline]
BUG: KMSAN: uninit-value in ppp_async_push+0xc05/0x2660 drivers/net/ppp/ppp_async.c:675
 ppp_async_encode drivers/net/ppp/ppp_async.c:548 [inline]
 ppp_async_push+0xc05/0x2660 drivers/net/ppp/ppp_async.c:675
 ppp_async_send+0x130/0x1b0 drivers/net/ppp/ppp_async.c:634
 ppp_push+0x220/0x22b0 drivers/net/ppp/ppp_generic.c:1883
 ppp_send_frame drivers/net/ppp/ppp_generic.c:1846 [inline]
 __ppp_xmit_process+0x123a/0x2780 drivers/net/ppp/ppp_generic.c:1646
 ppp_xmit_process+0x100/0x2b0 drivers/net/ppp/ppp_generic.c:1667
 ppp_write+0x63a/0x7d0 drivers/net/ppp/ppp_generic.c:521
 do_loop_readv_writev fs/read_write.c:764 [inline]
 vfs_writev+0xb0e/0x1450 fs/read_write.c:973
 do_pwritev fs/read_write.c:1072 [inline]
 __do_sys_pwritev fs/read_write.c:1119 [inline]
 __se_sys_pwritev fs/read_write.c:1114 [inline]
 __x64_sys_pwritev+0x2e5/0x500 fs/read_write.c:1114
 x64_sys_call+0x3539/0x3b50 arch/x86/include/generated/asm/syscalls_64.h:297
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcf/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:3877 [inline]
 slab_alloc_node mm/slub.c:3918 [inline]
 kmem_cache_alloc_node+0x622/0xc90 mm/slub.c:3961
 kmalloc_reserve+0x13d/0x4a0 net/core/skbuff.c:577
 __alloc_skb+0x35b/0x7a0 net/core/skbuff.c:668
 alloc_skb include/linux/skbuff.h:1319 [inline]
 ppp_write+0xe5/0x7d0 drivers/net/ppp/ppp_generic.c:509
 do_loop_readv_writev fs/read_write.c:764 [inline]
 vfs_writev+0xb0e/0x1450 fs/read_write.c:973
 do_pwritev fs/read_write.c:1072 [inline]
 __do_sys_pwritev fs/read_write.c:1119 [inline]
 __se_sys_pwritev fs/read_write.c:1114 [inline]
 __x64_sys_pwritev+0x2e5/0x500 fs/read_write.c:1114
 x64_sys_call+0x3539/0x3b50 arch/x86/include/generated/asm/syscalls_64.h:297
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcf/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 1 PID: 5049 Comm: syz-executor420 Not tainted 6.9.0-syzkaller-02707-g614da38e2f7a #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
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

