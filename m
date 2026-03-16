Return-Path: <linux-ppp+bounces-418-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNZsNE7Nt2kRVQEAu9opvQ
	(envelope-from <linux-ppp+bounces-418-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Mon, 16 Mar 2026 10:28:46 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B24296FB9
	for <lists+linux-ppp@lfdr.de>; Mon, 16 Mar 2026 10:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40928300D9F7
	for <lists+linux-ppp@lfdr.de>; Mon, 16 Mar 2026 09:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EE838758E;
	Mon, 16 Mar 2026 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3uZs2K6"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C75382370
	for <linux-ppp@vger.kernel.org>; Mon, 16 Mar 2026 09:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653319; cv=none; b=fuf+0D7M6slzGgYQOrMnrv5GUXRYGfewK77SZMrKbeYkOdq1g0nUmdjw/rThoLdCo9Njv9rdYOmnGDKHPPcdiivmbK4uCf7eEAoAkuJUzI1ommIt1tNbygsj7T4bS/rSY6ZRE/EZw/JteWXH1uS8vfXzdjVCgyW3JrBP0eRcxeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653319; c=relaxed/simple;
	bh=oQzzFAMCttNUJVUfDwf/erlmu1VPa/A4aDaVaPX++84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pwN9weeMDUnqn8wO4fzQCyNTi7V3FjGgu+1Jh0H1jxHoPT4VwKJyGZUfx32cfduRDo1q/s4LLy3vk7BlKl6fdM+7hatjI2fxtACckb9+1tZ/7Dk6lhuFEx+M7za7PE+swlCBXTAHSH8CYaJCxskx7FaBTdwwmUBN0lUYieIhdlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3uZs2K6; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6616cb8c80cso6504704a12.0
        for <linux-ppp@vger.kernel.org>; Mon, 16 Mar 2026 02:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773653316; x=1774258116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C2/IwV2vEnvqLSZJL+1QuzLYnReiJ7GcK2/btvbYBlw=;
        b=j3uZs2K6iYR9CL11l+Dd8i/kCLUVm42UXiMxQz3moarrYB/WIXdzF8iROQf3IIlO1k
         b2fTC6DEQr2adHYwCc+KdsRikhrVMvIpn66YuvDXF8PelYuH59JVrvuRK09YbJyGKln4
         hSCvoGZe1oyCzf8FyQCx4wxchoCIObbR2/Gzvgzo6qq/73jvPtrwufPlV7K/C/Nkhh38
         wB1c5la/igKfKNSidpJIaaNErkOHgDeZeTeIXU8ETIrdeAo82mjzVZ/bhlGpQIP/adeT
         XD4z27G1G3UoSqfVxRYspaNrivxIJUArakpe+o8cFXlKVwcEmQqbsmapeuwx3gJiyz0i
         b3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653316; x=1774258116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2/IwV2vEnvqLSZJL+1QuzLYnReiJ7GcK2/btvbYBlw=;
        b=rTmkv3ds8xqF9ZkHEfLG4BiIn0hQvICnEtQ9bkfuiiyb5f8QztShE2bWtD1VV+7T+n
         Zt7jIm8vQ3ZcCc4YNX3vWKMj0WcuNU+qB0L952IXggDA4el9uV+fHFBtjvW8FosyZcRd
         TekYfDbqzl9NPVZUakU8p9Ps9NSpz/a0CO28aEIsIoDA4BpQ8HiP1nTBnXzLqkzTRgom
         E5RQ54VMXggqCU/yG7ueOjVV4LzPxRZNH8PpLCKtcEvE+jHHyitGjYVhpWSE1KdXxcLY
         PTxrVpZhnItXc+hASBPivsT+cZ600YOHNwcfJyto88KtJ89ImOLlmFaqYhGEYlpG9f5s
         YJMw==
X-Gm-Message-State: AOJu0YytIVk8fnIgyHK225qZ1hGTkAoH5HnUJ8fAzs1gDJ23m3waxaz6
	rOG1D0Ayr5mWBEbGF9eRtRhB6qv5WWXAXJwoirxc8QZIhZoI8kttjZ18J1KNAGldGREcew==
X-Gm-Gg: ATEYQzwcgLJYsDs5qcLOpYovzZjuoQpYuEopD92zjXsCBhGSYTfT96jYSYhW9rd+8PJ
	Ed8G9h3+sBsX1IvtlX5GD0oUBbo0AxYcqpQda344ENEeCJBE0FwpWFzYk5nKWFQgZrqZCC6ksiE
	YbQZAhQ50YDevE8CB14y7J07sBvjQ1Pmq15x7B5LO1FhSz5TtDidJCbwo0iw+v7OoVSNLtUihLx
	Rk4sZqFG3q91aY8sxW79SkesusGvtsylKAuO31p1Pg4Udo+Ne5lMbjyxERREgTdvqRZY4KP43u4
	zRsbX5HY73OkcW6tu6liVLJlmsLs4DbFycpxPO/H+vQZbInvv9NWyRiB2mBO6mACPOduIsUJsCE
	ISqYl7q1ZxODXeBXsziwGnmP+AQT/p1NRwh3zE0dcDvSRKKH3UcwHlryWyyzDcmBpVo7X8xEXp/
	TGuDYDKzIQxz0qvQ==
X-Received: by 2002:a05:6402:1476:b0:660:a2df:ad1 with SMTP id 4fb4d7f45d1cf-663ba0e9e6dmr7669579a12.7.1773653315826;
        Mon, 16 Mar 2026 02:28:35 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:4e24:2e3c::49b:47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-663509919c9sm4892225a12.23.2026.03.16.02.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:28:35 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: linux-ppp@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: James Chapman <jchapman@katalix.com>
Subject: [PATCH net-next] ppp: require callers of ppp_dev_name() to hold RCU
Date: Mon, 16 Mar 2026 17:28:23 +0800
Message-ID: <20260316092824.479149-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-418-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 72B24296FB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ppp_dev_name() holds the RCU read lock internally to protect pch->ppp.
However, as it returns netdev->name to the caller, the caller should
also hold either RCU or RTNL lock to prevent the netdev from being
freed.

The only two references of the function is in the L2TP driver, both of
which already hold RCU. So remove the internal RCU lock and document
that callers must hold RCU.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/ppp_generic.c | 3 +--
 include/linux/ppp_channel.h   | 4 +++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 6344c5eb0f98..0918ece061eb 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -2995,6 +2995,7 @@ int ppp_unit_number(struct ppp_channel *chan)
 
 /*
  * Return the PPP device interface name of a channel.
+ * Caller must hold RCU read lock.
  */
 char *ppp_dev_name(struct ppp_channel *chan)
 {
@@ -3003,11 +3004,9 @@ char *ppp_dev_name(struct ppp_channel *chan)
 	struct ppp *ppp;
 
 	if (pch) {
-		rcu_read_lock();
 		ppp = rcu_dereference(pch->ppp);
 		if (ppp && ppp->dev)
 			name = ppp->dev->name;
-		rcu_read_unlock();
 	}
 	return name;
 }
diff --git a/include/linux/ppp_channel.h b/include/linux/ppp_channel.h
index ca8ad03eeef0..2f63e9a6cc88 100644
--- a/include/linux/ppp_channel.h
+++ b/include/linux/ppp_channel.h
@@ -72,7 +72,9 @@ extern int ppp_channel_index(struct ppp_channel *);
 /* Get the unit number associated with a channel, or -1 if none */
 extern int ppp_unit_number(struct ppp_channel *);
 
-/* Get the device name associated with a channel, or NULL if none */
+/* Get the device name associated with a channel, or NULL if none.
+ * Caller must hold RCU read lock.
+ */
 extern char *ppp_dev_name(struct ppp_channel *);
 
 /*
-- 
2.43.0


