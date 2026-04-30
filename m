Return-Path: <linux-ppp+bounces-550-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFXDOo4b82kLxQEAu9opvQ
	(envelope-from <linux-ppp+bounces-550-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 11:06:22 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDB349F9AF
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 11:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A769630078E3
	for <lists+linux-ppp@lfdr.de>; Thu, 30 Apr 2026 09:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E63D15853B;
	Thu, 30 Apr 2026 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G8qTBwo5"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ED040DFA4
	for <linux-ppp@vger.kernel.org>; Thu, 30 Apr 2026 09:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539952; cv=none; b=ks1JJrBW2lJWmWru4dOlx26adOeyROsYWnw6Ar52+Ndi6LnpPssuS3BboU0x0hLm/BI439CP9UZKTf4D0y7Gfh2o8ECYyIe9Z689g5+IWE9ZMXMJwoC4efN5RMQKNewcpqQ83Ax8v9VKJZve1moheZJs+aXtlYGZCN3K1iT9xaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539952; c=relaxed/simple;
	bh=ot8RZ1mBjO7hyMpwt4w1JlEgoj5gEdRJBQoWICe8ZzU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=e8QoYu9Ah3MZmQNewqdNHM8he1/Srep/WKyiDhf3B/kzqnQCwl7iDEPNF4tfDdgxmcxOw6FAdWQLaQwQnwWAALewu8QnbeBP443TsgHpWjP/X/eQuCDe0W6cR1mUIAfhaa6GlLRHXakqXz2Pl2fzZV2mVvv5X5DkZy2XigO8pAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G8qTBwo5; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777539948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hCANES//Zba6NT24A7SxC6UwfIqx4fR+aEhtC8a7AAk=;
	b=G8qTBwo5Jp0so5tpGpRmq62SARaYQvkSOFHNe0CyFfVBjMLJUWw6dHPlXena3mM7nvAq6F
	eKV/ocG0Oir2b9i+B6/yUEX0CHX4WE8yTTTNsKX3BoFWNgAVMykOFuIa80y7CgtW+7NZHH
	UspMfphfRdRG+7q7EzJ1lrICsjycfa8=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Simon Horman <horms@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Taegu Ha <hataegu0826@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/3] ppp: use file.dead to check channel unregistration
Date: Thu, 30 Apr 2026 17:05:21 +0800
Message-ID: <20260430090532.244758-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 0BDB349F9AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-550-lists,linux-ppp=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linux.dev,gmail.com,linutronix.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email,linux.dev:dkim,linux.dev:mid]

Currently, ppp_generic checks if pch->chan is NULL to determine if a
channel is being unregistered. However, struct ppp_file already has a
'dead' flag for this purpose, which is used by ppp units and other
parts of the driver.

Switch all pch->chan NULL checks to pch->file.dead checks. In
ppp_unregister_channel, move the setting of pch->file.dead inside the
locked section to ensure atomicity and remove the now redundant
pch->chan = NULL assignment.

This is a preparation to eventually unify 'struct ppp_channel' and
'struct channel' into a single struct.

Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 drivers/net/ppp/ppp_generic.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 57c68efa5ff8..aef42a69b63c 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -790,7 +790,7 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			down_read(&pch->chan_sem);
 			chan = pch->chan;
 			err = -ENOTTY;
-			if (chan && chan->ops->ioctl)
+			if (!pch->file.dead && chan->ops->ioctl)
 				err = chan->ops->ioctl(chan, cmd, arg);
 			up_read(&pch->chan_sem);
 		}
@@ -2167,7 +2167,7 @@ static void __ppp_channel_push(struct channel *pch, struct ppp *ppp)
 	struct sk_buff *skb;
 
 	spin_lock(&pch->downl);
-	if (pch->chan) {
+	if (!pch->file.dead) {
 		while (!skb_queue_empty(&pch->file.xq)) {
 			skb = skb_dequeue(&pch->file.xq);
 			if (!pch->chan->ops->start_xmit(pch->chan, skb)) {
@@ -2288,7 +2288,7 @@ static bool ppp_channel_bridge_input(struct channel *pch, struct sk_buff *skb)
 		goto out_rcu;
 
 	spin_lock_bh(&pchb->downl);
-	if (!pchb->chan) {
+	if (pchb->file.dead) {
 		/* channel got unregistered */
 		kfree_skb(skb);
 		goto outl;
@@ -3002,7 +3002,7 @@ ppp_unregister_channel(struct ppp_channel *chan)
 	ppp_disconnect_channel(pch);
 	down_write(&pch->chan_sem);
 	spin_lock_bh(&pch->downl);
-	pch->chan = NULL;
+	pch->file.dead = 1;
 	spin_unlock_bh(&pch->downl);
 	up_write(&pch->chan_sem);
 
@@ -3013,7 +3013,6 @@ ppp_unregister_channel(struct ppp_channel *chan)
 
 	ppp_unbridge_channels(pch);
 
-	pch->file.dead = 1;
 	wake_up_interruptible(&pch->file.rwait);
 
 	ppp_release_channel(pch);
@@ -3505,7 +3504,7 @@ ppp_connect_channel(struct channel *pch, int unit)
 
 	ppp_lock(ppp);
 	spin_lock_bh(&pch->downl);
-	if (!pch->chan) {
+	if (pch->file.dead) {
 		/* Don't connect unregistered channels */
 		spin_unlock_bh(&pch->downl);
 		ppp_unlock(ppp);
-- 
2.43.0


