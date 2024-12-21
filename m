Return-Path: <linux-ppp+bounces-153-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E8F9F9DFC
	for <lists+linux-ppp@lfdr.de>; Sat, 21 Dec 2024 03:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D29A51635C7
	for <lists+linux-ppp@lfdr.de>; Sat, 21 Dec 2024 02:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F9012CD88;
	Sat, 21 Dec 2024 02:44:20 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E17255C29
	for <linux-ppp@vger.kernel.org>; Sat, 21 Dec 2024 02:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734749060; cv=none; b=kC1g1dWmSs7DqaT8I/ANfVCkvWWUPBLLO49mhL5CwZbxUjdEFvq3Q8iSOMlwsAcrn6CGqmyE2yIpZZkMFTWeKYuT/UBg18NfFuT88Z1UT6DWV+8dNE+KIkjgfU4i/NWDpVsFz5YXV60aYxATYu9/YFiFBg8HS1GM8sP4lE/Z7eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734749060; c=relaxed/simple;
	bh=zHVYdKh544gORKIbj2YyXVdEeaigeQXJ/OMBBSWhesk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Rbt7v053n/x1Y1neWmp3zLVqjxAqT00NyjWTYl1FBsFzbmT0RfWGilwn51ZQoh81CePkruz3tS6RoibTMvyxaZ6pR0QKkd6CVbEVwiAKlyi2lzHhnZ2MSKp4Z486K95sHmJS40lgc+SZzAUGO9bg8fL4gB1DUbTHMupthBZeiaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3a81570ea43so22744645ab.0
        for <linux-ppp@vger.kernel.org>; Fri, 20 Dec 2024 18:44:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734749058; x=1735353858;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B8vWfmcQ6XYLF6Z9kHvKVT8WrL3KJq5dQdNtB/2DtRc=;
        b=kut2snvCw6n8dxtwLogR+bHmVE+bhgAifNKnn5W5+5kST4IGSdzMkret/H70wUt8hE
         wCRqdnye6uQJt2JbNn5ImXzhmfv5VM5G+Q2qptgzgSAQZgG+sGOqYvP2q8tPVJpe4X61
         zLGrzb6sEyoJt7zZ5bCCuk7sEz2KGn625R/BS1wg6HbbNNr0mx49TVeQzFsU1CkqZTd5
         zdkSyIY6tg76cQi5TEDDzcgQyN6AMP4gZgESdS5+pFFELjDkGbniV45aM3hrLVLHPDCZ
         hrYHjvxh2Ca/9lVTsI81truV1V/obXqdSpJ02eWyQzyZue6Sqt3YXbNW1NYqZrmtR4wV
         xNGg==
X-Forwarded-Encrypted: i=1; AJvYcCUXVWlY46cMO1Rf/AGBNAfaF5+BFFLvoHqK3IMwHGlhoune3LGo+DfJWpP4fX+b3Kj09o8bfabXqMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLd0Nc1IUwNk5w4IMKQC6nJ+hAXdCl5eoS1ny5E9vxzKs8dhvk
	OBb5oCEZjPICJwda2QQNXFwxlON0eJw2ylTtBys1Nx/vtfJExKnivhkUkyMoST3DCP9K9LLFb7h
	kOjlpsTK4I+Aa6qsl4n2TpAT2/cbUi6p7/yW3KJ2LFYsFkK65mUTHZ24=
X-Google-Smtp-Source: AGHT+IHVgOFNhiayPKWM1tIWdvdJWHbOBn6/HqjrNGEuKr7dsIE8M2s9q1D1Ox8wUs7nKqzVbuTT/5u6jNnopGXyN13fbJUpntE7
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3201:b0:3a7:be5e:e22d with SMTP id
 e9e14a558f8ab-3c2d1aa3e86mr48078615ab.2.1734749058287; Fri, 20 Dec 2024
 18:44:18 -0800 (PST)
Date: Fri, 20 Dec 2024 18:44:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67662b82.050a0220.226966.0006.GAE@google.com>
Subject: [syzbot] [ppp?] KMSAN: uninit-value in ppp_asynctty_receive (2)
From: syzbot <syzbot+6aa334c974508e74bc25@syzkaller.appspotmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f44d154d6e3d Merge tag 'soc-fixes-6.13' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14770b44580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=caeefc00e8b4dc9f
dashboard link: https://syzkaller.appspot.com/bug?extid=6aa334c974508e74bc25
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/009edf262d35/disk-f44d154d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9929be9055fe/vmlinux-f44d154d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/24e56358f05d/bzImage-f44d154d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6aa334c974508e74bc25@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in scan_ordinary drivers/net/ppp/ppp_async.c:751 [inline]
BUG: KMSAN: uninit-value in ppp_async_input drivers/net/ppp/ppp_async.c:851 [inline]
BUG: KMSAN: uninit-value in ppp_asynctty_receive+0x859/0x3720 drivers/net/ppp/ppp_async.c:342
 scan_ordinary drivers/net/ppp/ppp_async.c:751 [inline]
 ppp_async_input drivers/net/ppp/ppp_async.c:851 [inline]
 ppp_asynctty_receive+0x859/0x3720 drivers/net/ppp/ppp_async.c:342
 tty_ldisc_receive_buf+0x202/0x290 drivers/tty/tty_buffer.c:391
 tty_port_default_receive_buf+0xdf/0x190 drivers/tty/tty_port.c:37
 receive_buf drivers/tty/tty_buffer.c:445 [inline]
 flush_to_ldisc+0x473/0xdb0 drivers/tty/tty_buffer.c:495
 process_one_work kernel/workqueue.c:3229 [inline]
 process_scheduled_works+0xae0/0x1c40 kernel/workqueue.c:3310
 worker_thread+0xea7/0x14f0 kernel/workqueue.c:3391
 kthread+0x3e2/0x540 kernel/kthread.c:389
 ret_from_fork+0x6d/0x90 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4125 [inline]
 slab_alloc_node mm/slub.c:4168 [inline]
 __do_kmalloc_node mm/slub.c:4297 [inline]
 __kmalloc_noprof+0x923/0x1230 mm/slub.c:4310
 kmalloc_noprof include/linux/slab.h:905 [inline]
 tty_buffer_alloc drivers/tty/tty_buffer.c:180 [inline]
 __tty_buffer_request_room+0x36e/0x6d0 drivers/tty/tty_buffer.c:273
 __tty_insert_flip_string_flags+0x140/0x570 drivers/tty/tty_buffer.c:309
 tty_insert_flip_char include/linux/tty_flip.h:77 [inline]
 uart_insert_char+0x39e/0xa10 drivers/tty/serial/serial_core.c:3550
 serial8250_read_char+0x1a7/0x5d0 drivers/tty/serial/8250/8250_port.c:1763
 serial8250_rx_chars drivers/tty/serial/8250/8250_port.c:1780 [inline]
 serial8250_handle_irq+0x970/0x1130 drivers/tty/serial/8250/8250_port.c:1944
 serial8250_default_handle_irq+0x120/0x2b0 drivers/tty/serial/8250/8250_port.c:1969
 serial8250_interrupt+0xc5/0x360 drivers/tty/serial/8250/8250_core.c:86
 __handle_irq_event_percpu+0x118/0xca0 kernel/irq/handle.c:158
 handle_irq_event_percpu kernel/irq/handle.c:193 [inline]
 handle_irq_event+0xef/0x2c0 kernel/irq/handle.c:210
 handle_edge_irq+0x340/0xfb0 kernel/irq/chip.c:831
 generic_handle_irq_desc include/linux/irqdesc.h:173 [inline]
 handle_irq arch/x86/kernel/irq.c:247 [inline]
 call_irq_handler arch/x86/kernel/irq.c:259 [inline]
 __common_interrupt+0x97/0x1f0 arch/x86/kernel/irq.c:285
 common_interrupt+0x92/0xb0 arch/x86/kernel/irq.c:278
 asm_common_interrupt+0x2b/0x40 arch/x86/include/asm/idtentry.h:693

CPU: 1 UID: 0 PID: 10868 Comm: kworker/u8:13 Not tainted 6.13.0-rc3-syzkaller-00017-gf44d154d6e3d #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/25/2024
Workqueue: events_unbound flush_to_ldisc
=====================================================


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

