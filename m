Return-Path: <linux-ppp+bounces-264-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34C7A45243
	for <lists+linux-ppp@lfdr.de>; Wed, 26 Feb 2025 02:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C50ED3A4EAD
	for <lists+linux-ppp@lfdr.de>; Wed, 26 Feb 2025 01:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A9A19CC02;
	Wed, 26 Feb 2025 01:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NO4exobS"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FF7198E91
	for <linux-ppp@vger.kernel.org>; Wed, 26 Feb 2025 01:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533846; cv=none; b=RLKNVpw/PlQq0Sk+GV2MOJXSj1ucCwKFI5S6nYDZcEfa9bpSUd77ye+dghgXpZa2x5HukjJYYsgBIyt+ldn19ScLI47o0o/uH2xGN3Wu2vH+2sOZxinfsRmuJf2un6wKTEDTAPhXkqwqLjiufz8xpeQgkJvH+WLcbCou3UOc/Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533846; c=relaxed/simple;
	bh=pWLi/cRUToxxNb51JEO6p2om4iOrqMuG74fCRXLuWCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bQcSd471TndnMg/F+YU9WpweJZW3Wgdt7gNP6PzbUfLhNx5kYqSbkAY9GL64O2F7uwarkiXz1YlyaWYZeUFJnHNbMjJjSTomF4pcscyNdTGnEPuqr8k1UB7EXYfOiVgNVMxBDSNG4gn28g32bq/N4Bcc2QoRRw5EWIPXQYXSTGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NO4exobS; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740533831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s295qGQLRanetfRp1+riy2tr6YHsuQfJtgNgq/spYuM=;
	b=NO4exobSUUDSYN2ZQoqYSMcfgza31co3/eSnhxv0dCsgDWOzdDo9EeIEyqQNQLout4IKM1
	dCSb6LBkF5md2tgIu+slVuBmrhIy0ujSpJFeDun/jzQBimgjY3k+7xYgWZSIDwmCLTz9R3
	a8xOV6MmVjWVDY8ydJuXqR6qJCJs+1Q=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: horms@kernel.org,
	kuba@kernel.org
Cc: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	ricardo@marliere.net,
	viro@zeniv.linux.org.uk,
	dmantipov@yandex.ru,
	aleksander.lobakin@intel.com,
	linux-ppp@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mrpre@163.com,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Paul Mackerras <paulus@samba.org>
Subject: [PATCH net-next v4 0/1] ppp: Fix KMSAN uninit-value warning with bpf
Date: Wed, 26 Feb 2025 09:36:57 +0800
Message-ID: <20250226013658.891214-1-jiayuan.chen@linux.dev>
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

The following code can generate a PPP filter BPF program:
'''
struct bpf_program fp;
pcap_t *handle;
handle = pcap_open_dead(DLT_PPP_PPPD, 65535);
pcap_compile(handle, &fp, "ip and outbound", 0, 0);
bpf_dump(&fp, 1);
'''
Its output is:
'''
(000) ldh [2]
(001) jeq #0x21 jt 2 jf 5
(002) ldb [0]
(003) jeq #0x1 jt 4 jf 5
(004) ret #65535
(005) ret #0
'''

wen can find similar code at the following link:
https://github.com/ppp-project/ppp/blob/master/pppd/options.c#L1680
The maintainer of this code repository is also the original maintainer
of the ppp driver.


3. Current problem
The problem is that the skb->data generated by ppp_write() starts from the
'Protocol' field.

But the BPF program skips 2 bytes of data and then reads the 'Protocol'
field to determine if it's an IP packet just like the comment in
'drivers/net/ppp/ppp_generic.c':
/* the filter instructions are constructed assuming
   a four-byte PPP header on each packet */

In the current PPP driver implementation, to correctly use the BPF filter
program, a 2-byte header is added, after running the socket filter, it's
restored:
'''
1768 *(u8 *)skb_push(skb, 2) = 1;
1770 bpf_prog_run()
1782 skb_pull(skb, 2);
'''

The issue is that only the first byte indicating direction is initialized,
while the second byte is not initialized. For normal BPF programs
generated by libpcap, uninitialized data won't be used, so it's not a
problem.

However, for carefully crafted BPF programs, such as those generated by
syzkaller [2], which start reading from offset 0, the uninitialized data
will be used and caught by KMSAN.

4. Fix
The fix is simple: initialize the entire 2-byte header.

Cc: Paul Mackerras <paulus@samba.org>

[1] https://syzkaller.appspot.com/bug?extid=853242d9c9917165d791
[2] https://syzkaller.appspot.com/text?tag=ReproC&x=11994913980000

---
v3 -> v4:
Use macro instead.
Use __be16 to suppress compilation warnings.

Jiayuan Chen (1):
  ppp: Fix KMSAN warning by initializing 2-byte header

 drivers/net/ppp/ppp_generic.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

-- 
2.47.1


