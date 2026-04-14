Return-Path: <linux-ppp+bounces-526-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFlUOJIF3mlRmQkAu9opvQ
	(envelope-from <linux-ppp+bounces-526-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 14 Apr 2026 11:14:58 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E16473F7B9D
	for <lists+linux-ppp@lfdr.de>; Tue, 14 Apr 2026 11:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D8359300D74E
	for <lists+linux-ppp@lfdr.de>; Tue, 14 Apr 2026 09:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1463B774B;
	Tue, 14 Apr 2026 09:14:33 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F8D3BBA15
	for <linux-ppp@vger.kernel.org>; Tue, 14 Apr 2026 09:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158073; cv=none; b=cBv38vIWyv/HqaUg+RapEOSqnhUsVOoZfK1uEEiWO0TuANcoma4eZ4oPrq9Ouiuiw2q9mqRV6z62kzD7gdkyupVqjqXJ6UhdHJivEM5br9zV/ICT4dgoYDLIKIwaWoTJwlF7lb0kL8rsIYfIK9cK1XIXvHd5z2mU8tk86TZSV6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158073; c=relaxed/simple;
	bh=GPNEvwTV3YCZM/IQhX2qX/16wfmzdwPlkAEZNY2yz18=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MqBpVVTtOIwuKzdMk4MKoCbPoSEdcIqNHmQO98gMuLI1wl9vb42xniUnHEZFH2ZCkb514FJ0GJaSNTXannMU4QU8AoxuJfDAOf17GEdZUidQwizv1+Ws5ndwKqW8WMMrYit78cctOQdQJ+RrOZu/bX6Bhc3wHvSL/8iiSYbt07g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-689b18091ebso11777542eaf.1
        for <linux-ppp@vger.kernel.org>; Tue, 14 Apr 2026 02:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158070; x=1776762870;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c4/P5vYiyQeQxekanU/M1VkImZhr/JuEMOleJPaKHW0=;
        b=VxFcAUmPUaZxvMVsst0gNlepXagphZiHbIyA5LlgNMn3z87mRfvS89Edlzp0hgFkuw
         KpWBo+ZkHEdBfMTedD6+fz6FH7BaJECDZCQZoWh6eMWLTXBmSPXpsXH6aeh8IITnIccv
         3O7VEG5VPP8ujNTeb/tl9KYlcYsW+6ekRBSN6npQ3h88bbgUWzkJ40SHDzUKJx6mdruQ
         m90ZKoW7utVBv5WNn3dPCRvo1q2UhdG6nbQr5NxghcbzA3ObMpiHNrP3TAmsPbXheY7/
         XHPW2j2FSIFG55ovJPVH0Mu3ySxayB2jbYJS83vmoP0528w6igRKuYIFr/mnX9cd3pj4
         erjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hVrC65zPrDYgRacOl6GcaihupyXCd4KAsyZg1V67gk8uicL/QwyusbzY/EIu+GDp0nmXPBKroX8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YznoQvUZp5GsxqGax1BJ7/DJWPjL/txLdfjSsoHmdcJrymemOM6
	aRnvq9pdP32bB22HE7K7SuJMXvv/eEKjzttey8AhyROTUOspZuPFaaIOUQ78Vgw7UzPMxTXLfRB
	vJqRR+tKMVnn6RJ+81UrvtqZz9c+boC434/my7tdW4LXdqOOU3obkP4Em4mQ=
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:628d:b0:683:a6e:970a with SMTP id
 006d021491bc7-68a6b54c90cmr7115601eaf.40.1776158069823; Tue, 14 Apr 2026
 02:14:29 -0700 (PDT)
Date: Tue, 14 Apr 2026 02:14:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69de0575.a00a0220.468cb.005c.GAE@google.com>
Subject: [syzbot] [ppp?] KMSAN: uninit-value in ppp_sync_receive (4)
From: syzbot <syzbot+88679c919eb801bd16f8@syzkaller.appspotmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=963de479f54c6dbb];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_FROM(0.00)[bounces-526-lists,linux-ppp=lfdr.de,88679c919eb801bd16f8];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,goo.gl:url,appspotmail.com:email,googlegroups.com:email,storage.googleapis.com:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	RCPT_COUNT_SEVEN(0.00)[9];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: E16473F7B9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    9a9c8ce300cd Merge tag 'kbuild-fixes-7.0-4' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=112a874e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=963de479f54c6dbb
dashboard link: https://syzkaller.appspot.com/bug?extid=88679c919eb801bd16f8
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/3e2ad23d804a/disk-9a9c8ce3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a3dde4990296/vmlinux-9a9c8ce3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/256e0a89d22c/bzImage-9a9c8ce3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+88679c919eb801bd16f8@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in ppp_sync_input drivers/net/ppp/ppp_synctty.c:684 [inline]
BUG: KMSAN: uninit-value in ppp_sync_receive+0x626/0xfa0 drivers/net/ppp/ppp_synctty.c:334
 ppp_sync_input drivers/net/ppp/ppp_synctty.c:684 [inline]
 ppp_sync_receive+0x626/0xfa0 drivers/net/ppp/ppp_synctty.c:334
 tty_ldisc_receive_buf+0x1f7/0x2c0 drivers/tty/tty_buffer.c:391
 tty_port_default_receive_buf+0xd7/0x1a0 drivers/tty/tty_port.c:37
 receive_buf drivers/tty/tty_buffer.c:445 [inline]
 flush_to_ldisc+0x43e/0xe40 drivers/tty/tty_buffer.c:495
 process_one_work kernel/workqueue.c:3276 [inline]
 process_scheduled_works+0xb82/0x1e80 kernel/workqueue.c:3359
 worker_thread+0xee4/0x1590 kernel/workqueue.c:3440
 kthread+0x53f/0x600 kernel/kthread.c:436
 ret_from_fork+0x20f/0x910 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4545 [inline]
 slab_alloc_node mm/slub.c:4866 [inline]
 __do_kmalloc_node mm/slub.c:5259 [inline]
 __kmalloc_noprof+0x486/0x1680 mm/slub.c:5272
 kmalloc_noprof include/linux/slab.h:954 [inline]
 tty_buffer_alloc drivers/tty/tty_buffer.c:180 [inline]
 __tty_buffer_request_room+0x3d4/0x7a0 drivers/tty/tty_buffer.c:273
 __tty_insert_flip_string_flags+0x157/0x6e0 drivers/tty/tty_buffer.c:309
 tty_insert_flip_char include/linux/tty_flip.h:77 [inline]
 uart_insert_char+0x368/0x930 drivers/tty/serial/serial_core.c:3431
 serial8250_read_char+0x1ba/0x670 drivers/tty/serial/8250/8250_port.c:1643
 serial8250_rx_chars drivers/tty/serial/8250/8250_port.c:1660 [inline]
 serial8250_handle_irq_locked+0x6d4/0xa40 drivers/tty/serial/8250/8250_port.c:1820
 serial8250_handle_irq+0x187/0x730 drivers/tty/serial/8250/8250_port.c:1841
 serial8250_default_handle_irq+0x116/0x370 drivers/tty/serial/8250/8250_port.c:1855
 serial8250_interrupt+0xcb/0x420 drivers/tty/serial/8250/8250_core.c:86
 __handle_irq_event_percpu+0x13c/0xf90 kernel/irq/handle.c:209
 handle_irq_event_percpu kernel/irq/handle.c:246 [inline]
 handle_irq_event+0xe0/0x2a0 kernel/irq/handle.c:263
 handle_edge_irq+0x2a9/0xb30 kernel/irq/chip.c:855
 generic_handle_irq_desc include/linux/irqdesc.h:186 [inline]
 handle_irq arch/x86/kernel/irq.c:262 [inline]
 call_irq_handler arch/x86/kernel/irq.c:-1 [inline]
 __common_interrupt+0x9d/0x180 arch/x86/kernel/irq.c:333
 common_interrupt+0x4c/0xb0 arch/x86/kernel/irq.c:326
 asm_common_interrupt+0x2b/0x40 arch/x86/include/asm/idtentry.h:688

CPU: 0 UID: 0 PID: 35 Comm: kworker/u8:2 Tainted: G        W    L      syzkaller #0 PREEMPT(full) 
Tainted: [W]=WARN, [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/18/2026
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

