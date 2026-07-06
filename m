Return-Path: <linux-ppp+bounces-621-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LHa8L2mWS2osWAEAu9opvQ
	(envelope-from <linux-ppp+bounces-621-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Mon, 06 Jul 2026 13:50:01 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8FC710147
	for <lists+linux-ppp@lfdr.de>; Mon, 06 Jul 2026 13:50:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=kSWa0fNv;
	dmarc=pass (policy=none) header.from=linux.dev;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-621-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-ppp+bounces-621-lists+linux-ppp=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E32C233C6B8C
	for <lists+linux-ppp@lfdr.de>; Mon,  6 Jul 2026 09:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016F44DD6E0;
	Mon,  6 Jul 2026 09:34:33 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2164DC556
	for <linux-ppp@vger.kernel.org>; Mon,  6 Jul 2026 09:34:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330472; cv=none; b=i8UmVF14xFmhVHQC4jGrmRvJT6k837TAIfEO+wuHrosaN0fU3ASkbziEZBPc6xWj9RDrXoihwu4hsGX8CssB+GnJJoJcamcVbA8vYO0waW1+eGL/Yftkb8lrDB4pCJud5OlQx6dkqBVSZgQjQ/Fhh+qwyg7IGKtUHsorhzA02dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330472; c=relaxed/simple;
	bh=zN5L/AvLHOKTBwFT3Fz0jxTEkQaIAaC1B4ZN3xSGxX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XylTA4ELMve6lV+scd20eTkzDki0Mx8T6Qwr4DwFglHDmvZNaeb5gZU/CMqPetoVS+uzlSHQhL2Y2va/bvSkuUc7Y0eInAu5QIDi+xg1M/u8ZGBR9aaf6hZY5flExzD3DvVVpK7REEVQXjjFtL8sqI8Lm91Zkt7UyN2cSUy6uHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kSWa0fNv; arc=none smtp.client-ip=91.218.175.184
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783330455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sZQ9WVA3JaDoSNxxquL3VaiwxpdZMD31OCMRpHRYFNE=;
	b=kSWa0fNvyjaywtoMVp+u+KAjN8DAHiHu93/cUYcmO8Up8UwIU6DzyOrSmhkwXStNm2uBJl
	E9Xc0gSSpIsRoN6Lx1bo+7ccdCiFNikFuhI+3waKm/38WIrnBRbUPMUNyR6NAZvTVG74AL
	iyM4ItoKsIInulhQ4BZK8odRufM8MKg=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Eric Woudstra <ericwouds@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-ppp@vger.kernel.org
Subject: [RFC net-next] pppoe: fix stale device name shown in procfs
Date: Mon,  6 Jul 2026 17:34:02 +0800
Message-ID: <20260706093404.407667-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-621-lists,linux-ppp=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:qingfang.deng@linux.dev,m:kees@kernel.org,m:nbd@nbd.name,m:ericwouds@gmail.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-ppp@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linux.dev,nbd.name,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:from_mime,linux.dev:email,linux.dev:mid,linux.dev:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D8FC710147

In pppoe_seq_show(), the device name is currently read from
po->pppoe_pa.dev, which contains the name at the time the socket was
connected. If the lower network device is renamed afterwards, reading
/proc/net/pppoe will still print the old name.

Fix this by reading the name directly from the bound net_device via the
po->pppoe_dev pointer. Note that the pointer can be cleared when the
socket is being released, so a NULL check is required.

Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 drivers/net/ppp/pppoe.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index 4a018acb5262..5bf526c596b6 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -960,6 +960,7 @@ static int pppoe_recvmsg(struct socket *sock, struct msghdr *m,
 #ifdef CONFIG_PROC_FS
 static int pppoe_seq_show(struct seq_file *seq, void *v)
 {
+	struct net_device *dev;
 	struct pppox_sock *po;
 	char *dev_name;
 
@@ -969,7 +970,10 @@ static int pppoe_seq_show(struct seq_file *seq, void *v)
 	}
 
 	po = v;
-	dev_name = po->pppoe_pa.dev;
+	dev = READ_ONCE(po->pppoe_dev);
+	if (!dev)
+		goto out;
+	dev_name = dev->name;
 
 	seq_printf(seq, "%08X %pM %8s\n",
 		po->pppoe_pa.sid, po->pppoe_pa.remote, dev_name);
-- 
2.43.0


