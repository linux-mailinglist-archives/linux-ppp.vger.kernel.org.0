Return-Path: <linux-ppp+bounces-248-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B07BA3ECB5
	for <lists+linux-ppp@lfdr.de>; Fri, 21 Feb 2025 07:13:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CEDC19C5868
	for <lists+linux-ppp@lfdr.de>; Fri, 21 Feb 2025 06:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35E81FDE04;
	Fri, 21 Feb 2025 06:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZVxd5yL1"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17D71FCFD8
	for <linux-ppp@vger.kernel.org>; Fri, 21 Feb 2025 06:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740118371; cv=none; b=ceL0qOA9+nk8xulT16IZ18o74fSwEWzF7TA+u/S5xpH5M9rVXwb2nlEgavwltJgN3T2K8TFuZH7N7pudUBfC2c04+I37H04jtH0KVEoMeg5XMJZ92wz0lzePGQUzIYLGa43fHmYPI112yhgzjN44+EEptpEVz0ujiRSHpTemSL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740118371; c=relaxed/simple;
	bh=bzrzImRT1cLXd6rUjwdir4NV1+ubNBxYh/Xfpr4IbTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QXgH4KCRcsi20x1VHSMAQesKC//fG63AKCo0I710bGUlokYmQFruL3EaxWmDnWMPWbvdDfGWG/PGuTmxjf8uyTebtoL47SGhiB/cZFE1FzDdhVBJTUsNC2N72M2w5spIWhUW1kITY2ilEU0Ejyv3EWth69R/oJuVXJioUHJ3u+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZVxd5yL1; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740118357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2vESoKIWHNLR1B3AsYlrqRlcm+s858eCEYgNmXDd9xQ=;
	b=ZVxd5yL151wkGVXkYIyoEL7sLJgrvw6NEOjdsvB15B3mm7B1nOhlC2mTzWnn0xpNyEhIMD
	M46p+jQ0AfW89IiyeT8ttf19UUqro0/4EeKmIq1TBI/WmaPNh+SKLcLWS+PSPjvKJYlaKD
	RHvePJOSFHEHMSSTLVeXvnWeHnDddkU=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org,
	netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ricardo@marliere.net,
	jiayuan.chen@linux.dev,
	viro@zeniv.linux.org.uk,
	dmantipov@yandex.ru,
	aleksander.lobakin@intel.com,
	linux-ppp@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mrpre@163.com
Subject: [PATCH net-next v2 0/1] ppp: Fix KMSAN uninit-value warning with bpf
Date: Fri, 21 Feb 2025 14:12:18 +0800
Message-ID: <20250221061219.295590-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Syzbot caught an "KMSAN: uninit-value" warning [1], which is caused by the
ppp driver not initializing a 2-byte header when using socket filters.

Here's a detailed explanation:

1. PPP protocol format
The PPP protocol format looks like this:

|<--------------------------      7 - 1508 bytes      --------------------------->|
+---0x7E---+---0xFF---+---0x03---+----------+---------------+----------+---0x7E----
|   Flag   | Address  | Control  | Protocol | Information   |   FCS    |   Flag   |
| 01111110 | 11111111 | 00000011 | 8/16bits |      *        | 16 bits  | 01111110 |
+----------+----------+----------+----------+---------------+----------+-----------


2. Normal BPF program
For example, when filtering IP over PPP, libpcap generates BPF
instructions like this:
'''
tcpdump -d ip -y PPP
(000) ldh      [2]
(001) jeq      #0x21            jt 2	jf 3
(002) ret      #262144
(003) ret
'''

2 bytes data are skipped by bpf program and then bpf program reads the
'Protocol' field to determine if it's an IP packet. Clearly, libpcap
assumes the packet starts from the Address field, just like the comment in
'drivers/net/ppp/ppp_generic.c':

/* the filter instructions are constructed assuming
   a four-byte PPP header on each packet */

Corresponding libpcap code is here:
https://github.com/the-tcpdump-group/libpcap/blob/master/gencode.c#L1421


3. Current problem
The problem is that the skb->data generated by ppp_write() starts from the
'Protocol' field.

In the current implementation, to correctly use the BPF filter program,
a 2-byte header is added to simulate the presence of Address and Control
fields. And then, after running the socket filter, it's restored:

1768 *(u8 *)skb_push(skb, 2) = 1;
1770 bpf_prog_run()
1782 skb_pull(skb, 2);

The thing is, only one byte of the new 2-byte header is initialized. For
normal BPF programs generated by libpcap, uninitialized data won't be
used, so it's not a problem.

However, for carefully crafted BPF programs, such as those generated by
syzkaller [2], which start reading from offset 0, the uninitialized data
will be used and caught by KMSAN.

4. Fix
The fix is simple: initialize the entire 2-byte header.

[1] https://syzkaller.appspot.com/bug?extid=853242d9c9917165d791
[2] https://syzkaller.appspot.com/text?tag=ReproC&x=11994913980000

---
v1 -> v2:
https://lore.kernel.org/linux-ppp/20250218133145.265313-1-jiayuan.chen@linux.dev/T/#t
Add more comments.
Correctly initialize on big-endian and little-endian systems.
---

Jiayuan Chen (1):
  ppp: Fix KMSAN warning by initializing 2-byte header

 drivers/net/ppp/ppp_generic.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

-- 
2.47.1


