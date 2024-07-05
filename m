Return-Path: <linux-ppp+bounces-67-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90943928C20
	for <lists+linux-ppp@lfdr.de>; Fri,  5 Jul 2024 18:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D100285E10
	for <lists+linux-ppp@lfdr.de>; Fri,  5 Jul 2024 16:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEE61E497;
	Fri,  5 Jul 2024 16:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="KG+DQcZT"
X-Original-To: linux-ppp@vger.kernel.org
Received: from forward202d.mail.yandex.net (forward202d.mail.yandex.net [178.154.239.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A3F2F5E;
	Fri,  5 Jul 2024 16:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720196151; cv=none; b=OSeTtKspS3UM34YQvaCU2F5DXf4Mxh6RleYXbtiskZj4o4/uZNxqSEvB6QVITj8abKtE8jThYEZ0AooJ26KcOpoo9McU/HsTyFFiqFxUfQ4/iljsBnpCUCCq1JeZcs9XQJg06JBL98RxkVkKUtRZ9KRIiufYgyJLg4bYEzkXz1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720196151; c=relaxed/simple;
	bh=rDBsvFxL7EN0Svje+n9/0Daf9dhHSkXbfQwCTjfFqBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rAu16yruFI+ysievtJFDPJLQCw0uYEoLNPJ4pi7aWuQCIxq6myM4v42Hjm1Hy600lCd0UOh25kQo/g/f1U7AnBsM0xuIYcDoQjTTwH7Bg9QOhkYnBqyr0ua+R6PzRVaNp0eQdLB8+peons7zXK3nFD9tncoMiPAeo5EkaPx/YCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=KG+DQcZT; arc=none smtp.client-ip=178.154.239.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d101])
	by forward202d.mail.yandex.net (Yandex) with ESMTPS id DBA95622DF;
	Fri,  5 Jul 2024 19:09:36 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-73.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-73.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:b99a:0:640:41a5:0])
	by forward101d.mail.yandex.net (Yandex) with ESMTPS id 0547A6093E;
	Fri,  5 Jul 2024 19:09:29 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-73.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id R9c6LO0XxmI0-KF1UYlCe;
	Fri, 05 Jul 2024 19:09:28 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1720195768; bh=3VZXoHJTEWzYDZRd696ccGXX3WXfU5gpiJnvDT3IqDA=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=KG+DQcZTWcww5aWgh3vfFm5HrT5FDQWBPDFnM2do3kykk1gRvA5R4XLhS0OlD9mhA
	 74vRoQU8O2vh0nn2KpaPGiW2nK33s+Leu73sB7g0MLA1GKA7f7wHp/+mpo+ZiOLugF
	 201/dqXkUhvtQImb3wsvAGzxC4lvaCRQA+Xp/Tp0=
Authentication-Results: mail-nwsmtp-smtp-production-main-73.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: "David S . Miller" <davem@davemloft.net>
Cc: linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+ec0723ba9605678b14bf@syzkaller.appspotmail.com
Subject: [PATCH] net: ppp: reject claimed-as-LCP but actually malformed packets
Date: Fri,  5 Jul 2024 19:08:08 +0300
Message-ID: <20240705160808.113296-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since 'ppp_async_encode()' assumes valid LCP packets (with code
from 1 to 7 inclusive), add 'ppp_check_packet()' to ensure that
LCP packet has an actual body beyond PPP_LCP header bytes, and
reject claimed-as-LCP but actually malformed data otherwise.

Reported-by: syzbot+ec0723ba9605678b14bf@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ec0723ba9605678b14bf
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/net/ppp/ppp_generic.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 0a65b6d690fe..2c8dfeb8ca58 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -493,6 +493,18 @@ static ssize_t ppp_read(struct file *file, char __user *buf,
 	return ret;
 }
 
+static bool ppp_check_packet(struct sk_buff *skb, size_t count)
+{
+	if (get_unaligned_be16(skb->data) == PPP_LCP &&
+	    count < PPP_PROTO_LEN + 4)
+		/* Claimed as LCP but has no actual LCP body,
+		 * which is 4 bytes at least (code, identifier,
+		 * and 2-byte length).
+		 */
+		return false;
+	return true;
+}
+
 static ssize_t ppp_write(struct file *file, const char __user *buf,
 			 size_t count, loff_t *ppos)
 {
@@ -515,6 +527,11 @@ static ssize_t ppp_write(struct file *file, const char __user *buf,
 		kfree_skb(skb);
 		goto out;
 	}
+	ret = -EINVAL;
+	if (unlikely(!ppp_check_packet(skb, count))) {
+		kfree_skb(skb);
+		goto out;
+	}
 
 	switch (pf->kind) {
 	case INTERFACE:
-- 
2.45.2


