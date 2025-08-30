Return-Path: <linux-ppp+bounces-346-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FADB3CB73
	for <lists+linux-ppp@lfdr.de>; Sat, 30 Aug 2025 16:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE0AE1BA4511
	for <lists+linux-ppp@lfdr.de>; Sat, 30 Aug 2025 14:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A349A248F69;
	Sat, 30 Aug 2025 14:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOiLsduo"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA0F1862A;
	Sat, 30 Aug 2025 14:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756564796; cv=none; b=CLypsfv7rk6ryLHlODyTE1evqnNfNYZ7T4//GH5MgX2ovLxrpaLXLjMrE7v9/SwR2EpXTB+mIAbeDnfeR1IbbwmxOYLcCSkwEaOOcAnDgxEQEH2Krpp7sP26eC10uYz7noLsmieRHPiDeFq9HBOvCVeHIC3snQBo7OKnApEOp88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756564796; c=relaxed/simple;
	bh=lp9q5KDY2JvmF9hY4DyP7MtKW+ID/sbacL7Xvf0VqxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tsxfWqzmgoinMHblJ3G+kSg2oqgXdbhQMDJcBKjP0KM6vli4zBPSWjGMsNLM+X5DusIw1OGSo6kYVWft+kaop+kTZx/dsEOOgmDnb6N9+v0Yqg+DQp5sMBV2p9nHaqnu6Pn3Qg5WuCMGepTlIQMdA9hv1EA5bdG0K3vcpsprFss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOiLsduo; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-327ae052173so1778251a91.0;
        Sat, 30 Aug 2025 07:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756564794; x=1757169594; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tybsC19Qc+XT0uvPtsT7CfilHMLmqS1144W9mwvk6zc=;
        b=KOiLsduo1+rD+e6Fb78Q3Lel6bTwHw5MChb8vMZk5aKuJExbq41QQ6RIly2/n1xpVg
         45ch4S2O40eZBeIR8BuBzN79U0H+fYh7K0XaF+owI4phEYIZWp/EprVYwOXyKB/1x59t
         MYDBM0zNrfGtnWEG07lFN+rCQnleRDNOelk3C1WDiK1tozU0v3GDSZPVpWyRehW3vVnL
         ukypfvVXijhpbqEx5U1Q/8MSNzn4zcZICYxRpM6gjoPgHTcTcE8/gFM6pOJiSM2421Ch
         jfotqwP6LqDqqGCLEFGH+VlIYuDIYUs/zGaW47fcjOz3uV3lmPPJ2u7YmS00TSq/HCo+
         S9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756564794; x=1757169594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tybsC19Qc+XT0uvPtsT7CfilHMLmqS1144W9mwvk6zc=;
        b=Jc1QUYxN/vjYOYuX4RQ3d37kP7g4B3yOmMeV6MbKLO05pGdfSx1Jt3eFBBj64Nd/hg
         GyqYQ4myYdmWE8c2XZaYnPX8pO3ZlFF2CEBYyYYF2jLJ3Vs7jZyv2FrzSCW5ogYd3iJR
         qory/IztYZyo7/9E8pmgRyNmuJ2MICT86CK0LgPUfM7YLq7fMcYvx5daJrdhlpEV8atT
         31TCBiQU8HXqzcIRaEWNqR/xLLrYSVXNpYzW2DmCxQbOpLOgPaCDKjYjPMDkc0ZKKCGS
         CT7E2fmYosLE0RCGNPi4W3Bs15+pmJN+2sVsYlzmN/y/wf8omHOiZ0zMPbxHIoXYzE2c
         QcSw==
X-Forwarded-Encrypted: i=1; AJvYcCU6h4nKt1xii4h/C4zSW4UHlmRtPBBD41ZuX+T6lfPj+HVozm3jM4/4QESpTBbrzgDVeA5BLUIt@vger.kernel.org, AJvYcCUvRd4ZsTfKPvSt1gmGinHagx9RZg0d3t0KA3yaXspQKpDQPIIe2RmBSEYRK7NvR9owpz6iIxDiRMMfAMs=@vger.kernel.org, AJvYcCXS0z2H311T93cFUxaAWj5ADZeTrAU6n2mgFTXl77flS7Jl0x18+MKLBr0/CTFj9SYtEy3FyREtS4IG@vger.kernel.org
X-Gm-Message-State: AOJu0YzrwTyZGNKKWp1uUCYphhFhW8GBLqukida54eWxwPiYW3qK+4vD
	CpH85qSFtlt/O6UQ6XSF9fqjFwprdPuReMBt2SC86+T/B2YCqWzptiRBCoGjz6P56nuiuxMP9ER
	WDcZqQj9dgJs8Axyvu71MldQdjjmPbv4=
X-Gm-Gg: ASbGncuDYmtQCPayTwKEd9Eyj+fSrLtVTup9InI8T7WHRnam02COrEcD6qBg0YuCnCu
	4kzMWON/lx8Q1kGvsmT2ZAPAv7Jy26JkLFz/qmqEbASuGKXTEC4Bww2LWXXHpcyQ/GkILNy6o5S
	m5Bf1i1DBFYEyKC+/PlrtZ9x2612ezMqkpAy3JJumYj960nF8YUY674y/MnJie2Qm4TBcCUQJ+H
	KzVzfYFwtE3r40=
X-Google-Smtp-Source: AGHT+IHCGRJSEN/dTZu9if3MP7qwko/Bhydmit1tikE9sYgR0wjXszJyugnbD46of5lHOf0THOd7CEuE/UZxNK9hPHk=
X-Received: by 2002:a17:90b:1e41:b0:327:ad83:6cd6 with SMTP id
 98e67ed59e1d1-328156c8c5emr2836778a91.25.1756564793542; Sat, 30 Aug 2025
 07:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPB3MF5apjd502qpepf8YnFhJuQoFy414u8p=K1yKxr3_FJsOg@mail.gmail.com>
 <CALW65jY4MBCwt=XdzObMQBzN5FgtWjd=XrMBGDHQi9uuknK-og@mail.gmail.com> <CAPB3MF7L-O_LW+Gxw8fgNif9zUq0r1WZFK_v2CzB0302RHXNLw@mail.gmail.com>
In-Reply-To: <CAPB3MF7L-O_LW+Gxw8fgNif9zUq0r1WZFK_v2CzB0302RHXNLw@mail.gmail.com>
From: cam enih <nanericwang@gmail.com>
Date: Sat, 30 Aug 2025 22:39:42 +0800
X-Gm-Features: Ac12FXxUJqAiGsl2YlBt8jBseAHN6FGPi92322AMKA5fxRvMQsY0MXPFHUP9_Wo
Message-ID: <CAPB3MF5x5rSsYCKutpo1f=1DaQbz30QM6ny7fnB9hMGmwfkdbA@mail.gmail.com>
Subject: Re: [Regression Bug] Re: [PATCH net v3 2/2] ppp: fix race conditions
 in ppp_fill_forward_path
To: Qingfang Deng <dqfext@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, kuniyu@google.com, linux-kernel@vger.kernel.org, 
	linux-ppp@vger.kernel.org, nbd@nbd.name, netdev@vger.kernel.org, 
	pabeni@redhat.com, pablo@netfilter.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here comes more details, and it might not be your commit that causes
the panic. sorry but I don't know where to go from here.

```
Aug 30 22:00:20 localhost systemd-networkd[281]: Failed to parse
hostname, ignoring: Invalid argument
Aug 30 22:00:20 localhost systemd-networkd[281]: br0: DHCPv4 server:
DISCOVER (0xf1ac0b63)
Aug 30 22:00:20 localhost kernel: BUG: kernel NULL pointer
dereference, address: 0000000000000058
Aug 30 22:00:20 localhost kernel: #PF: supervisor read access in kernel mod=
e
Aug 30 22:00:20 localhost kernel: #PF: error_code(0x0000) - not-present pag=
e
Aug 30 22:00:20 localhost kernel: PGD 0 P4D 0
Aug 30 22:00:20 localhost kernel: Oops: Oops: 0000 [#1] PREEMPT_RT SMP
Aug 30 22:00:20 localhost kernel: CPU: 1 UID: 981 PID: 281 Comm:
systemd-network Not tainted 6.12.44-xanmod1-1-lts #1
Aug 30 22:00:20 localhost kernel: Hardware name: Default string
Default string/Default string, BIOS 5.19 03/30/2021
Aug 30 22:00:20 localhost kernel: RIP:
0010:ip_route_output_key_hash_rcu+0x778/0x930
Aug 30 22:00:20 localhost kernel: Code: 8b 45 c0 48 8b 40 30 65 48 03
05 33 69 be 76 e9 eb fd ff ff 4c 89 45 c8 e8 e5 22 aa ff 4c 8b 45 c8
e9 ba fc ff ff 49 8b 45 18 <48> 8b 40 58 48 3d a0 b7 87 89 0f 84 f7 00
00 00 48 89 c2 48 8d 78
Aug 30 22:00:20 localhost kernel: RSP: 0018:ffffb0eec0a979c8 EFLAGS: 000102=
46
Aug 30 22:00:20 localhost kernel: RAX: 0000000000000000 RBX:
ffffb0eec0a97b00 RCX: 0000000000000005
Aug 30 22:00:20 localhost kernel: RDX: 0000000000000000 RSI:
000000000002a424 RDI: ffffffff89ab8c40
Aug 30 22:00:20 localhost kernel: RBP: ffffb0eec0a97a28 R08:
0000000000000020 R09: 0000000000000000
Aug 30 22:00:20 localhost kernel: R10: ffff89d68577bc00 R11:
0000000000000003 R12: ffff89d683779000
Aug 30 22:00:20 localhost kernel: R13: ffffb0eec0a97a40 R14:
0000000000000008 R15: 0000000090000000
Aug 30 22:00:20 localhost kernel: FS:  00007fed08af58c0(0000)
GS:ffff89d7f7d00000(0000) knlGS:0000000000000000
Aug 30 22:00:20 localhost kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Aug 30 22:00:20 localhost kernel: CR2: 0000000000000058 CR3:
0000000116589001 CR4: 0000000000b70ef0
Aug 30 22:00:20 localhost kernel: Call Trace:
Aug 30 22:00:20 localhost kernel:  <TASK>
Aug 30 22:00:20 localhost kernel:  ? autoremove_wake_function+0x70/0x70
Aug 30 22:00:20 localhost kernel:  ip_route_output_flow+0x73/0xc0
Aug 30 22:00:20 localhost kernel:  udp_sendmsg+0x47c/0xd50
Aug 30 22:00:20 localhost kernel:  ? ip_frag_init+0x60/0x60
Aug 30 22:00:20 localhost kernel:  inet_sendmsg+0x37/0x50
Aug 30 22:00:20 localhost kernel:  ? inet_sendmsg+0x37/0x50
Aug 30 22:00:20 localhost kernel:  ____sys_sendmsg+0x235/0x250
Aug 30 22:00:20 localhost kernel:  ___sys_sendmsg+0x1ca/0x210
Aug 30 22:00:20 localhost kernel:  __sys_sendmsg+0xcf/0x120
Aug 30 22:00:20 localhost kernel:  __x64_sys_sendmsg+0x1c/0x20
Aug 30 22:00:20 localhost kernel:  x64_sys_call+0x719/0x1780
Aug 30 22:00:20 localhost kernel:  do_syscall_64+0x79/0x150
Aug 30 22:00:20 localhost kernel:  ? syscall_exit_to_user_mode+0x15/0xf0
Aug 30 22:00:20 localhost kernel:  ? do_syscall_64+0x85/0x150
Aug 30 22:00:20 localhost kernel:  ? do_syscall_64+0x85/0x150
Aug 30 22:00:20 localhost kernel:  entry_SYSCALL_64_after_hwframe+0x4b/0x53
Aug 30 22:00:20 localhost kernel: RIP: 0033:0x7fed0933f1ce
Aug 30 22:00:20 localhost kernel: Code: 4d 89 d8 e8 64 be 00 00 4c 8b
5d f8 41 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 11 c9 c3 0f 1f 80 00
00 00 00 48 8b 45 10 0f 05 <c9> c3 83 e2 39 83 fa 08 75 e7 e8 13 ff ff
ff 0f 1f 00 f3 0f 1e fa
Aug 30 22:00:20 localhost kernel: RSP: 002b:00007ffc62fe8b20 EFLAGS:
00000202 ORIG_RAX: 000000000000002e
Aug 30 22:00:20 localhost kernel: RAX: ffffffffffffffda RBX:
0000053b981d1d80 RCX: 00007fed0933f1ce
Aug 30 22:00:20 localhost kernel: RDX: 0000000000000000 RSI:
00007ffc62fe8b90 RDI: 0000000000000017
Aug 30 22:00:20 localhost kernel: RBP: 00007ffc62fe8b30 R08:
0000000000000000 R09: 0000000000000000
Aug 30 22:00:20 localhost kernel: R10: 0000000000000000 R11:
0000000000000202 R12: 0000053b981d1d80
Aug 30 22:00:20 localhost kernel: R13: 0000053b981d0b80 R14:
0000053b98034800 R15: 0000053b9803481c
Aug 30 22:00:20 localhost kernel:  </TASK>
Aug 30 22:00:20 localhost kernel: Modules linked in: xt_mark xt_owner
xt_TPROXY nf_tproxy_ipv4 pppoe pppox af_packet sch_cake bridge stp llc
xt_DSCP xt_set xt_TCPMSS xt_tcpudp iptable_mangle xt_connlimit
nf_conncount xt_conntrack iptable_filter xt_MASQUERADE iptable_nat
nf_nat msr ip_set_hash_net ip_set hid_generic intel_rapl_msr evdev
nls_ascii coretemp intel_tcc_cooling x86_pkg_temp_thermal
intel_powerclamp nls_cp437 sha256_ssse3 vfat rapl fat intel_cstate
intel_uncore i2c_i801 usbhid spi_intel_pci spi_intel i2c_smbus hid igb
ptp pps_core i2c_algo_bit processor_thermal_device_pci_legacy
intel_soc_dts_iosf fan processor_thermal_device hwmon
processor_thermal_wt_hint thermal processor_thermal_rfim i2c_core
processor_thermal_rapl intel_rapl_common iosf_mbi
processor_thermal_wt_req processor_thermal_power_floor
processor_thermal_mbox int340x_thermal_zone acpi_pad button
ppp_generic slhc nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nfnetlink
ip_tables x_tables ipv6 xhci_pci xhci_hcd usbcore usb_common
Aug 30 22:00:20 localhost kernel: CR2: 0000000000000058
Aug 30 22:00:20 localhost kernel: ---[ end trace 0000000000000000 ]---
Aug 30 22:00:20 localhost kernel: RIP:
0010:ip_route_output_key_hash_rcu+0x778/0x930
Aug 30 22:00:20 localhost kernel: Code: 8b 45 c0 48 8b 40 30 65 48 03
05 33 69 be 76 e9 eb fd ff ff 4c 89 45 c8 e8 e5 22 aa ff 4c 8b 45 c8
e9 ba fc ff ff 49 8b 45 18 <48> 8b 40 58 48 3d a0 b7 87 89 0f 84 f7 00
00 00 48 89 c2 48 8d 78
Aug 30 22:00:20 localhost kernel: RSP: 0018:ffffb0eec0a979c8 EFLAGS: 000102=
46
Aug 30 22:00:20 localhost kernel: RAX: 0000000000000000 RBX:
ffffb0eec0a97b00 RCX: 0000000000000005
Aug 30 22:00:20 localhost kernel: RDX: 0000000000000000 RSI:
000000000002a424 RDI: ffffffff89ab8c40
Aug 30 22:00:20 localhost kernel: RBP: ffffb0eec0a97a28 R08:
0000000000000020 R09: 0000000000000000
Aug 30 22:00:20 localhost kernel: R10: ffff89d68577bc00 R11:
0000000000000003 R12: ffff89d683779000
Aug 30 22:00:20 localhost kernel: R13: ffffb0eec0a97a40 R14:
0000000000000008 R15: 0000000090000000
Aug 30 22:00:20 localhost kernel: FS:  00007fed08af58c0(0000)
GS:ffff89d7f7d00000(0000) knlGS:0000000000000000
Aug 30 22:00:20 localhost kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Aug 30 22:00:20 localhost kernel: CR2: 0000000000000058 CR3:
0000000116589001 CR4: 0000000000b70ef0
Aug 30 22:00:20 localhost kernel: note: systemd-network[281] exited
with irqs disabled
Aug 30 22:00:20 localhost kernel: ------------[ cut here ]------------
Aug 30 22:00:20 localhost kernel: Voluntary context switch within RCU
read-side critical section!
Aug 30 22:00:20 localhost kernel: WARNING: CPU: 1 PID: 281 at
rcu_note_context_switch+0x3f7/0x550
Aug 30 22:00:20 localhost kernel: Modules linked in: xt_mark xt_owner
xt_TPROXY nf_tproxy_ipv4 pppoe pppox af_packet sch_cake bridge stp llc
xt_DSCP xt_set xt_TCPMSS xt_tcpudp iptable_mangle xt_connlimit
nf_conncount xt_conntrack iptable_filter xt_MASQUERADE iptable_nat
nf_nat msr ip_set_hash_net ip_set hid_generic intel_rapl_msr evdev
nls_ascii coretemp intel_tcc_cooling x86_pkg_temp_thermal
intel_powerclamp nls_cp437 sha256_ssse3 vfat rapl fat intel_cstate
intel_uncore i2c_i801 usbhid spi_intel_pci spi_intel i2c_smbus hid igb
ptp pps_core i2c_algo_bit processor_thermal_device_pci_legacy
intel_soc_dts_iosf fan processor_thermal_device hwmon
processor_thermal_wt_hint thermal processor_thermal_rfim i2c_core
processor_thermal_rapl intel_rapl_common iosf_mbi
processor_thermal_wt_req processor_thermal_power_floor
processor_thermal_mbox int340x_thermal_zone acpi_pad button
ppp_generic slhc nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nfnetlink
ip_tables x_tables ipv6 xhci_pci xhci_hcd usbcore usb_common
Aug 30 22:00:20 localhost kernel: CPU: 1 UID: 981 PID: 281 Comm:
systemd-network Tainted: G      D            6.12.44-xanmod1-1-lts #1
Aug 30 22:00:20 localhost kernel: Tainted: [D]=3DDIE
Aug 30 22:00:20 localhost kernel: Hardware name: Default string
Default string/Default string, BIOS 5.19 03/30/2021
Aug 30 22:00:20 localhost kernel: RIP: 0010:rcu_note_context_switch+0x3f7/0=
x550
Aug 30 22:00:20 localhost kernel: Code: ff ff 45 85 c9 0f 84 06 fd ff
ff 48 89 b9 a8 00 00 00 e9 fa fc ff ff 48 c7 c7 20 76 98 89 c6 05 df
8d be 00 01 e8 09 2a f8 ff <0f> 0b e9 48 fc ff ff 44 89 4d d0 44 89 45
d4 48 89 4d d8 48 89 7d
Aug 30 22:00:20 localhost kernel: RSP: 0018:ffffb0eec0a97b70 EFLAGS: 000100=
46
Aug 30 22:00:20 localhost kernel: RAX: 0000000000000000 RBX:
ffff89d7f7d258c0 RCX: 0000000000000027
Aug 30 22:00:20 localhost kernel: RDX: ffff89d7f7d1c748 RSI:
0000000000000001 RDI: ffff89d7f7d1c740
Aug 30 22:00:20 localhost kernel: RBP: ffffb0eec0a97ba0 R08:
0000000000000e43 R09: ffffffff8998765e
Aug 30 22:00:20 localhost kernel: R10: ffffffff8998765f R11:
0000000000000000 R12: ffff89d68d46a900
Aug 30 22:00:20 localhost kernel: R13: 0000000000000000 R14:
ffff89d68d46a900 R15: ffff89d68d46a900
Aug 30 22:00:20 localhost kernel: FS:  0000000000000000(0000)
GS:ffff89d7f7d00000(0000) knlGS:0000000000000000
Aug 30 22:00:20 localhost kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Aug 30 22:00:20 localhost kernel: CR2: 0000000000000058 CR3:
0000000190e18003 CR4: 0000000000b70ef0
Aug 30 22:00:20 localhost kernel: Call Trace:
Aug 30 22:00:20 localhost kernel:  <TASK>
Aug 30 22:00:20 localhost kernel:  __schedule+0x73/0x720
Aug 30 22:00:20 localhost kernel:  ? swake_up_one+0x69/0x80
Aug 30 22:00:20 localhost kernel:  schedule+0x26/0xe0
Aug 30 22:00:20 localhost kernel:  schedule_timeout+0x106/0x120
Aug 30 22:00:20 localhost kernel:  wait_for_completion_state+0x12a/0x200
Aug 30 22:00:20 localhost kernel:  __wait_rcu_gp+0x11f/0x1b0
Aug 30 22:00:20 localhost kernel:  synchronize_rcu_normal.part.0+0x68/0x80
Aug 30 22:00:20 localhost kernel:  ? __call_rcu_common+0x6e0/0x6e0
Aug 30 22:00:20 localhost kernel:  ? get_completed_synchronize_rcu+0x10/0x1=
0
Aug 30 22:00:20 localhost kernel:  synchronize_rcu_normal+0xc6/0xd0
Aug 30 22:00:20 localhost kernel:  synchronize_rcu_expedited+0x1bb/0x210
Aug 30 22:00:20 localhost kernel:  ? change_mnt_propagation+0x32b/0x350
Aug 30 22:00:20 localhost kernel:  ? __put_mountpoint.part.0+0x83/0x90
Aug 30 22:00:20 localhost kernel:  namespace_unlock+0xc2/0x180
Aug 30 22:00:20 localhost kernel:  put_mnt_ns+0x70/0xa0
Aug 30 22:00:20 localhost kernel:  free_nsproxy+0x1a/0x190
Aug 30 22:00:20 localhost kernel:  exit_task_namespaces+0x62/0x80
Aug 30 22:00:20 localhost kernel:  do_exit+0x2ad/0xa10
Aug 30 22:00:20 localhost kernel:  make_task_dead+0x88/0x190
Aug 30 22:00:20 localhost kernel:  rewind_stack_and_make_dead+0x16/0x20
Aug 30 22:00:20 localhost kernel: RIP: 0033:0x7fed0933f1ce
Aug 30 22:00:20 localhost kernel: Code: Unable to access opcode bytes
at 0x7fed0933f1a4.
Aug 30 22:00:20 localhost kernel: RSP: 002b:00007ffc62fe8b20 EFLAGS:
00000202 ORIG_RAX: 000000000000002e
Aug 30 22:00:20 localhost kernel: RAX: ffffffffffffffda RBX:
0000053b981d1d80 RCX: 00007fed0933f1ce
Aug 30 22:00:20 localhost kernel: RDX: 0000000000000000 RSI:
00007ffc62fe8b90 RDI: 0000000000000017
Aug 30 22:00:20 localhost kernel: RBP: 00007ffc62fe8b30 R08:
0000000000000000 R09: 0000000000000000
Aug 30 22:00:20 localhost kernel: R10: 0000000000000000 R11:
0000000000000202 R12: 0000053b981d1d80
Aug 30 22:00:20 localhost kernel: R13: 0000053b981d0b80 R14:
0000053b98034800 R15: 0000053b9803481c
Aug 30 22:00:20 localhost kernel:  </TASK>
Aug 30 22:00:20 localhost kernel: ---[ end trace 0000000000000000 ]---
```

Due to my lack of knowledge in kernel source code, I relied on the
explanation from LLM. FYI:
```
Your system experienced a Kernel NULL Pointer Dereference, which is a
type of crash where the kernel tries to read memory from address
0x0000000000000058 (which is invalid/NULL) because it expected a valid
data structure to be there.

Here's a step-by-step breakdown:

The Trigger: The systemd-networkd service (PID 281) was handling a
DHCP discovery event on the br0 bridge interface.

The Code Path: To send a network packet (likely a DHCP response), it
went through the kernel's networking stack:

udp_sendmsg -> ip_route_output_flow -> ip_route_output_key_hash_rcu

The Crash: Inside the function ip_route_output_key_hash_rcu, the
kernel tried to access a member of a data structure (a pointer to a
struct fib_info or similar) at offset 0x58 (88 bytes into the
structure).

The assembly instruction was: 49 8b 45 18 <48> 8b 40 58

This means: "Take the value at register %r13 + 0x18, then from that
address, read the value at offset 0x58."

The value at %r13 + 0x18 was NULL (0x0000000000000000). Adding 0x58 to
it resulted in the invalid address 0x58, causing the crash.

The Cause: This strongly indicates a race condition or a
use-after-free bug. A likely scenario is:

The kernel correctly found a route to use and obtained a pointer to
the associated data structure (e.g., a struct rtable).

After the pointer was obtained but before it was used, the structure
was freed (likely by another CPU core or process), setting the pointer
to NULL.

When the kernel finally went to use it, it dereferenced a NULL
pointer, causing the panic.

In simple terms: A part of the kernel's networking code was too slow
to grab a piece of critical routing information before another part of
the kernel cleaned it up and threw it away.
```

-Eric


On Sat, Aug 30, 2025 at 1:04=E2=80=AFAM cam enih <nanericwang@gmail.com> wr=
ote:
>
> > Does this happen only if you set up a PPPoE connection?
> Yes, I have another server running without PPPoE and it works fine with 6=
.12.44-xanmod1.
>
> > Do they have a debug kernel image with KALLSYMS, so I won't be looking
> at some random hex?
> Ok, I'll try to find one.
>
> -Eric
>
> On Fri, Aug 29, 2025 at 11:31=E2=80=AFPM Qingfang Deng <dqfext@gmail.com>=
 wrote:
>>
>> Hi Eric,
>>
>> On Fri, Aug 29, 2025 at 9:05=E2=80=AFPM cam enih <nanericwang@gmail.com>=
 wrote:
>> >
>> > Hi all,
>> > Having upgraded from 6.12.43 to 6.12.44, my kernel crashed at early bo=
ot. The root cause is most likely related to the commit 94731cc551e29511d85=
aa8dec61a6c071b1f2430 (Fixes: f6efc675c9dd ("net: ppp: resolve forwarding p=
ath for bridge pppoe devices")). Please confirm, thanks.
>>
>> Does this happen only if you set up a PPPoE connection?
>>
>> >
>> > -Eric
>> >
>> > ```
>> > Aug 29 20:36:16 localhost kernel: NET: Registered PF_PPPOX protocol fa=
mily
>> > Aug 29 20:36:17 localhost systemd-networkd[266]: Failed to parse hostn=
ame, ignoring: Invalid argument
>> > Aug 29 20:36:17 localhost systemd-networkd[266]: br0: DHCPv4 server: D=
ISCOVER (0xebeec00c)
>> > Aug 29 20:36:17 localhost kernel: BUG: kernel NULL pointer dereference=
, address: 0000000000000058
>> > Aug 29 20:36:17 localhost kernel: #PF: supervisor read access in kerne=
l mode
>> > Aug 29 20:36:17 localhost kernel: #PF: error_code(0x0000) - not-presen=
t page
>> > Aug 29 20:36:17 localhost kernel: PGD 0 P4D 0
>> > Aug 29 20:36:17 localhost kernel: Oops: Oops: 0000 [#1] PREEMPT_RT SMP
>> > Aug 29 20:36:17 localhost kernel: CPU: 1 UID: 981 PID: 266 Comm: syste=
md-network Not tainted 6.12.44-xanmod1-1-lts #1
>>
>> Looks like it's a downstream fork:
>> https://gitlab.com/xanmod/linux/-/releases/6.12.44-xanmod1
>> Have you reported to them too?
>>
>> > Aug 29 20:36:17 localhost kernel: Hardware name: Default string Defaul=
t string/Default string, BIOS 5.19 03/30/2021
>> > Aug 29 20:36:17 localhost kernel: RIP: 0010:0xffffffffb32b2f6c
>> > Aug 29 20:36:17 localhost kernel: Code: 85 8e 01 00 00 48 8b 44 24 08 =
48 8b 40 30 65 48 03 05 48 26 d6 4c e9 f0 fd ff ff e8 5e 9c c1 ff e9 ca fc =
ff ff 49 8b 44 24 18 <48> 8b 40 58 48 3d 00 e3 65 b3 0f 84 0f 01 00 00 48 8=
9 c2 48 8d 78
>> > Aug 29 20:36:17 localhost kernel: RSP: 0018:ffff9bd080c778d8 EFLAGS: 0=
0010246
>> > Aug 29 20:36:17 localhost kernel: RAX: 0000000000000000 RBX: ffff9bd08=
0c77a00 RCX: 0000000000000001
>> > Aug 29 20:36:17 localhost kernel: RDX: 0000000000000000 RSI: 000000000=
002a424 RDI: ffffffffb38b6040
>> > Aug 29 20:36:17 localhost kernel: RBP: ffff999345ad1000 R08: 000000000=
0000003 R09: 0000000000000000
>> > Aug 29 20:36:17 localhost kernel: R10: ffff999342eb7900 R11: 000000000=
0000000 R12: ffff9bd080c77948
>> > Aug 29 20:36:17 localhost kernel: R13: 0000000000000008 R14: 000000000=
0000000 R15: 0000000090000000
>> > Aug 29 20:36:17 localhost kernel: FS: 00007fc0bab148c0(0000) GS:ffff99=
94b7d00000(0000) knlGS:0000000000000000
>> > Aug 29 20:36:17 localhost kernel: CS: 0010 DS: 0000 ES: 0000 CR0: 0000=
000080050033
>> > Aug 29 20:36:17 localhost kernel: CR2: 0000000000000058 CR3: 000000010=
b438006 CR4: 0000000000b70ef0
>> > Aug 29 20:36:17 localhost kernel: Call Trace:
>> > Aug 29 20:36:17 localhost kernel: <TASK>
>> > Aug 29 20:36:17 localhost kernel: ? 0xffffffffb321d725
>> > Aug 29 20:36:17 localhost kernel: 0xffffffffb32b4197
>> > Aug 29 20:36:17 localhost kernel: 0xffffffffb32f5d6c
>> > Aug 29 20:36:17 localhost kernel: ? 0xffffffffb32b8c40
>> > Aug 29 20:36:17 localhost kernel: ? 0xffffffffb3212da5
>> > Aug 29 20:36:17 localhost kernel: 0xffffffffb3212da5
>> > Aug 29 20:36:17 localhost kernel: 0xffffffffb32131ea
>> > Aug 29 20:36:17 localhost kernel: 0xffffffffb32152ea
>> > Aug 29 20:36:17 localhost kernel: 0xffffffffb3364479
>> > Aug 29 20:36:17 localhost kernel: ? 0xffffffffb3364485
>> > Aug 29 20:36:17 localhost kernel: ? 0xffffffffb3215617
>> > Aug 29 20:36:17 localhost kernel: ? 0xffffffffb2f2cd31
>> > Aug 29 20:36:17 localhost kernel: ? 0xffffffffb33684f7
>> > Aug 29 20:36:17 localhost kernel: 0xffffffffb34000b0
>>
>> Do they have a debug kernel image with KALLSYMS, so I won't be looking
>> at some random hex?
>>
>> Thanks
>> - Qingfang

