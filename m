Return-Path: <linux-ppp+bounces-77-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9E695AD7C
	for <lists+linux-ppp@lfdr.de>; Thu, 22 Aug 2024 08:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64C5B28389F
	for <lists+linux-ppp@lfdr.de>; Thu, 22 Aug 2024 06:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941E013A3E6;
	Thu, 22 Aug 2024 06:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="owTA9Ou0"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDC9139D05
	for <linux-ppp@vger.kernel.org>; Thu, 22 Aug 2024 06:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724308193; cv=none; b=WbUS2tHXQaCJ/zjA/+VP67r2xX9H8IfaqiFAHUjqzEvCyHN9Z9bZZOu5/5K+jWsWIRT+XPi/2ORDBNgKhz8sxTfAi44dCw4Eu3JPuLDcKNh2OsGjvmxzy+5o5ASa9Hd8NruXE1gvUc95OoNaxO5PTyFCJ5dWak9fVsnZnw9uyEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724308193; c=relaxed/simple;
	bh=TOV0Mxr9masS1LIDOojNXiiKpad6DIuNqBDKADF4XX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ORXT6OJB49rKvoBpZh36dEDz4Q4aVlRsevfqhZXisqW06sel3qQDMVvg94vUkW4yvzLjBIIXrZwb1/tRPlATot36iLelcsw/rxAn9ufFIBNs6nyHnB/gKpo5jbmLGiMNjpy+sV2enuXv5YX0MJOTz696f532uXmQaB84BHgZm7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=owTA9Ou0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3718eaf4046so196076f8f.3
        for <linux-ppp@vger.kernel.org>; Wed, 21 Aug 2024 23:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724308190; x=1724912990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPLL/w+pHwmxCdDJmUifzSC2FTvRndnGaui7LUOpJ5U=;
        b=owTA9Ou07/H/KpB3HmQ8jP/JOekK7nA7E8YCGMKwf4kH1yTmUkA+sDhfo8wwwcVvRN
         y1kPIsimoKKxKJfPlPnvSFnu3n8Ld92fouPLEdwqRlGng9YrvvX+mLeiARVRE9bWii7E
         iBI2R8adiOLGRuh6C8A8tBzDYaUSDckb7iTMmdf9ztcXrgACIXGyDJYOsOsnxWQGkZ4E
         KsIWR+ELDazphKK4jHaj8aG051Khq8Rj1FhrgnfXTWoL0BnX3q5FJJxta8LE00f8TN1v
         +BWMJFM/tkiBkqQvXg0ayd4PCCyeT5fO54LnEvlmzY6Mve+7OZ0X95t0zdF76dfcGO45
         8prA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724308190; x=1724912990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPLL/w+pHwmxCdDJmUifzSC2FTvRndnGaui7LUOpJ5U=;
        b=LN9XaWds9t1NBpxKKpeaNW0ezuag22m3/XdABPQHvBJIc3bdPFf3HWSeMlytt3kUe5
         r02NPM2Dj1tmdfa8RLDMmTRWw72JyUtfc8C5Q9zDt9mjWC3OHBZSQ1WQHD6vcD6IBdTJ
         bV64xZ5SGOPwUbA0CbHzbnb24laxYINR81Wtgbplq1Tq+QaxuCeDcZS1GtEKo+NCvjgN
         EILctxFgmsWcUD+73dPeChcnrJhkdipCT4mBYkVNnGqx11mvnI9US4Wqhng7O7ucjxGW
         qGUmjFs2Ry2HA23CD33HXloxvE8BpxyC16+4T1beS0f6L06UD8BT6lhV2lyt2r/nsFsa
         LThg==
X-Forwarded-Encrypted: i=1; AJvYcCWrT/SOQd4fXQssrdw84mNzP6vPnPLagNZNIODFLG3Hs/lBrc67ugcV0sE4rYs6mxYBLnLDtbysaNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzazMF+Ykaa8ebhj2jgqdpJgOCnUB8tucexBzGUjCpyKyOTG7sO
	A0rfDWJUf5Qw38fAqjalL0r9Y7PTznAZEw+I8UdA5zurni92D9ZiTqViqj0cvhchc3X1ZuP0sym
	KTfxNYPpslHxQWWBA+0ztlE+ghKDQceExmNxZ
X-Google-Smtp-Source: AGHT+IEneBO5UyTCCKqQjQV9UoxxtinrLOihEqV9TPNtjGxACOfnSrXX3s8xnsohbadoFovQgSKRFxPDh45lFfYhUbE=
X-Received: by 2002:a5d:46cc:0:b0:366:efbd:8aa3 with SMTP id
 ffacd0b85a97d-37308c00a52mr571564f8f.2.1724308189157; Wed, 21 Aug 2024
 23:29:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0000000000006bc6d20620023a14@google.com> <00000000000090974a0620398254@google.com>
In-Reply-To: <00000000000090974a0620398254@google.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 22 Aug 2024 08:29:35 +0200
Message-ID: <CANn89iKkFB3iLbqq=a0RXEygKq8wYY1uiSWpWQu7zaYUEQeJYQ@mail.gmail.com>
Subject: Re: [syzbot] [ppp?] inconsistent lock state in valid_state (4)
To: syzbot <syzbot+d43eb079c2addf2439c3@syzkaller.appspotmail.com>, 
	Tom Parkin <tparkin@katalix.com>
Cc: coreteam@netfilter.org, davem@davemloft.net, dsahern@kernel.org, 
	kadlec@netfilter.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, pabeni@redhat.com, pablo@netfilter.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 1:00=E2=80=AFAM syzbot
<syzbot+d43eb079c2addf2439c3@syzkaller.appspotmail.com> wrote:
>
> syzbot has found a reproducer for the following issue on:
>
> HEAD commit:    b311c1b497e5 Merge tag '6.11-rc4-server-fixes' of git://g=
i..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D12dccc7b98000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Ddf2f0ed7e30a6=
39d
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Dd43eb079c2addf2=
439c3
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Deb=
ian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D17cf93d5980=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D101bb69398000=
0
>
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7=
bc7510fe41f/non_bootable_disk-b311c1b4.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/1c99fa48192f/vmlinu=
x-b311c1b4.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/16d5710a012a/b=
zImage-b311c1b4.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+d43eb079c2addf2439c3@syzkaller.appspotmail.com
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> WARNING: inconsistent lock state
> 6.11.0-rc4-syzkaller-00019-gb311c1b497e5 #0 Not tainted
> --------------------------------
> inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
> ksoftirqd/0/16 [HC0[0]:SC1[1]:HE1:SE0] takes:
> ffff888039c531e0 (&pch->downl){+.?.}-{2:2}, at: spin_lock include/linux/s=
pinlock.h:351 [inline]
> ffff888039c531e0 (&pch->downl){+.?.}-{2:2}, at: ppp_channel_bridge_input =
drivers/net/ppp/ppp_generic.c:2272 [inline]
> ffff888039c531e0 (&pch->downl){+.?.}-{2:2}, at: ppp_input+0x18b/0xa10 dri=
vers/net/ppp/ppp_generic.c:2304
> {SOFTIRQ-ON-W} state was registered at:
>   lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
>   __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
>   _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:154
>   spin_lock include/linux/spinlock.h:351 [inline]
>   ppp_channel_bridge_input drivers/net/ppp/ppp_generic.c:2272 [inline]
>   ppp_input+0x18b/0xa10 drivers/net/ppp/ppp_generic.c:2304
>   pppoe_rcv_core+0x117/0x310 drivers/net/ppp/pppoe.c:379
>   sk_backlog_rcv include/net/sock.h:1111 [inline]
>   __release_sock+0x243/0x350 net/core/sock.c:3004
>   release_sock+0x61/0x1f0 net/core/sock.c:3558
>   pppoe_sendmsg+0xd5/0x750 drivers/net/ppp/pppoe.c:903
>   sock_sendmsg_nosec net/socket.c:730 [inline]
>   __sock_sendmsg+0x221/0x270 net/socket.c:745
>   ____sys_sendmsg+0x525/0x7d0 net/socket.c:2597
>   ___sys_sendmsg net/socket.c:2651 [inline]
>   __sys_sendmmsg+0x3b2/0x740 net/socket.c:2737
>   __do_sys_sendmmsg net/socket.c:2766 [inline]
>   __se_sys_sendmmsg net/socket.c:2763 [inline]
>   __x64_sys_sendmmsg+0xa0/0xb0 net/socket.c:2763
>   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>   do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> irq event stamp: 1309336
> hardirqs last  enabled at (1309336): [<ffffffff8bc0d5ff>] __raw_spin_unlo=
ck_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
> hardirqs last  enabled at (1309336): [<ffffffff8bc0d5ff>] _raw_spin_unloc=
k_irqrestore+0x8f/0x140 kernel/locking/spinlock.c:194
> hardirqs last disabled at (1309335): [<ffffffff8bc0d300>] __raw_spin_lock=
_irqsave include/linux/spinlock_api_smp.h:108 [inline]
> hardirqs last disabled at (1309335): [<ffffffff8bc0d300>] _raw_spin_lock_=
irqsave+0xb0/0x120 kernel/locking/spinlock.c:162
> softirqs last  enabled at (1309326): [<ffffffff81578ffa>] run_ksoftirqd+0=
xca/0x130 kernel/softirq.c:928
> softirqs last disabled at (1309331): [<ffffffff81578ffa>] run_ksoftirqd+0=
xca/0x130 kernel/softirq.c:928
>
> other info that might help us debug this:
>  Possible unsafe locking scenario:
>
>        CPU0
>        ----
>   lock(&pch->downl);
>   <Interrupt>
>     lock(&pch->downl);
>
>  *** DEADLOCK ***
>
> 1 lock held by ksoftirqd/0/16:
>  #0: ffffffff8e938320 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire i=
nclude/linux/rcupdate.h:326 [inline]
>  #0: ffffffff8e938320 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock incl=
ude/linux/rcupdate.h:838 [inline]
>  #0: ffffffff8e938320 (rcu_read_lock){....}-{1:2}, at: ppp_channel_bridge=
_input drivers/net/ppp/ppp_generic.c:2267 [inline]
>  #0: ffffffff8e938320 (rcu_read_lock){....}-{1:2}, at: ppp_input+0x55/0xa=
10 drivers/net/ppp/ppp_generic.c:2304
>
> stack backtrace:
> CPU: 0 UID: 0 PID: 16 Comm: ksoftirqd/0 Not tainted 6.11.0-rc4-syzkaller-=
00019-gb311c1b497e5 #0
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.=
16.3-2~bpo12+1 04/01/2014
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:93 [inline]
>  dump_stack_lvl+0x241/0x360 lib/dump_stack.c:119
>  valid_state+0x13a/0x1c0 kernel/locking/lockdep.c:4012
>  mark_lock_irq+0xbb/0xc20 kernel/locking/lockdep.c:4215
>  mark_lock+0x223/0x350 kernel/locking/lockdep.c:4677
>  __lock_acquire+0xbf9/0x2040 kernel/locking/lockdep.c:5096
>  lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
>  __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
>  _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:154
>  spin_lock include/linux/spinlock.h:351 [inline]
>  ppp_channel_bridge_input drivers/net/ppp/ppp_generic.c:2272 [inline]
>  ppp_input+0x18b/0xa10 drivers/net/ppp/ppp_generic.c:2304
>  ppp_sync_process+0x71/0x160 drivers/net/ppp/ppp_synctty.c:490
>  tasklet_action_common+0x321/0x4d0 kernel/softirq.c:785
>  handle_softirqs+0x2c4/0x970 kernel/softirq.c:554
>  run_ksoftirqd+0xca/0x130 kernel/softirq.c:928
>  smpboot_thread_fn+0x544/0xa30 kernel/smpboot.c:164
>  kthread+0x2f0/0x390 kernel/kthread.c:389
>  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>  </TASK>
>
>
> ---
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.

Bug probably added in

commit 4cf476ced45d7f12df30a68e833b263e7a2202d1
Author: Tom Parkin <tparkin@katalix.com>
Date:   Thu Dec 10 15:50:57 2020 +0000

    ppp: add PPPIOCBRIDGECHAN and PPPIOCUNBRIDGECHAN ioctls



sk_backlog_rcv() is called without BH being blocked.

Fx would be :

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index eb9acfcaeb097496b5e28c87af13f5b4091a9bed..9d2656afba660a1a0eda5a53903=
b0f668a11abc9
100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -2269,7 +2269,7 @@ static bool ppp_channel_bridge_input(struct
channel *pch, struct sk_buff *skb)
        if (!pchb)
                goto out_rcu;

-       spin_lock(&pchb->downl);
+       spin_lock_bh(&pchb->downl);
        if (!pchb->chan) {
                /* channel got unregistered */
                kfree_skb(skb);
@@ -2281,7 +2281,7 @@ static bool ppp_channel_bridge_input(struct
channel *pch, struct sk_buff *skb)
                kfree_skb(skb);

 outl:
-       spin_unlock(&pchb->downl);
+       spin_unlock_bh(&pchb->downl);
 out_rcu:
        rcu_read_unlock();

