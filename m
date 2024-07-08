Return-Path: <linux-ppp+bounces-69-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2928A92A243
	for <lists+linux-ppp@lfdr.de>; Mon,  8 Jul 2024 14:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7D942817D0
	for <lists+linux-ppp@lfdr.de>; Mon,  8 Jul 2024 12:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E759823A3;
	Mon,  8 Jul 2024 12:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="OXeaaUg5"
X-Original-To: linux-ppp@vger.kernel.org
Received: from forward201b.mail.yandex.net (forward201b.mail.yandex.net [178.154.239.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B013A8175E;
	Mon,  8 Jul 2024 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720440487; cv=none; b=L19wjW22IfZe/iDyyk2JM8lXaqj9IZgTr5JkzjHt2X3s5ccxXKtMCsfQwoH3gIAKAbB5i1/5wSNtEfXIEjVogkuPXs58TE7pWbfBksOdL8rawzs+EoZhKno/SvpUPVtxinrjevhc/3EhmJ6KfBfjY1eVcVp5p0RfzKWrBeVaUpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720440487; c=relaxed/simple;
	bh=DWv+L/hy7AIXiIMtvSGrfFLt9NSnMBpgWGzYTITS1s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EAXWoarctaalGSY1pPHbQeSPtXiQYCEw3pSLvCUg+s/vbWGMFd8khKJfUr1R8tg75zoRF9pPwq54J2T0j3d8WHNpuobiH/vxni2jbxZRbjkZNjGOQeBKr5kX8nZ0g2zLQ2RAGrfFGXmvCQaI7a6afcP1+EPemEHjRz7l14V5c+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=OXeaaUg5; arc=none smtp.client-ip=178.154.239.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from forward100b.mail.yandex.net (forward100b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d100])
	by forward201b.mail.yandex.net (Yandex) with ESMTPS id DA6606527E;
	Mon,  8 Jul 2024 15:02:28 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:a33:0:640:d837:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTPS id 56422608E7;
	Mon,  8 Jul 2024 15:02:20 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id G2btsLAPdqM0-Dyv0FtzH;
	Mon, 08 Jul 2024 15:02:18 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1720440138; bh=KIWCV3Xu9RYQCiBxPBd569sVqeeI6vapeG/gSIKSVsw=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=OXeaaUg5gCcZD33DtAw+edxcEjf+TOKqJXzTA6haD97stFw5QPJLTPJkpmsJ7eN/o
	 GIFPva7aqw8/QpSvqxXIqCeoDZ9CC/GsRMXIHm0wI5V+tjWQFNY2hqHCRiBlwZT/34
	 +aSOYbem4ZUMlfh88BtsIJp3fnv0+4sOLudSKZCQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Simon Horman <horms@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+ec0723ba9605678b14bf@syzkaller.appspotmail.com
Subject: [PATCH net v2] ppp: reject claimed-as-LCP but actually malformed packets
Date: Mon,  8 Jul 2024 14:56:15 +0300
Message-ID: <20240708115615.134770-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240706093545.GA1481495@kernel.org>
References: <20240706093545.GA1481495@kernel.org>
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
Fixes: 44073187990d ("ppp: ensure minimum packet size in ppp_write()")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: style, comments, and metadata adjustments suggested by Simon Horman
---
 drivers/net/ppp/ppp_generic.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 0a65b6d690fe..eb9acfcaeb09 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -70,6 +70,7 @@
 #define MPHDRLEN_SSN	4	/* ditto with short sequence numbers */
 
 #define PPP_PROTO_LEN	2
+#define PPP_LCP_HDRLEN	4
 
 /*
  * An instance of /dev/ppp can be associated with either a ppp
@@ -493,6 +494,15 @@ static ssize_t ppp_read(struct file *file, char __user *buf,
 	return ret;
 }
 
+static bool ppp_check_packet(struct sk_buff *skb, size_t count)
+{
+	/* LCP packets must include LCP header which 4 bytes long:
+	 * 1-byte code, 1-byte identifier, and 2-byte length.
+	 */
+	return get_unaligned_be16(skb->data) != PPP_LCP ||
+		count >= PPP_PROTO_LEN + PPP_LCP_HDRLEN;
+}
+
 static ssize_t ppp_write(struct file *file, const char __user *buf,
 			 size_t count, loff_t *ppos)
 {
@@ -515,6 +525,11 @@ static ssize_t ppp_write(struct file *file, const char __user *buf,
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


