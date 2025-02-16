Return-Path: <linux-ppp+bounces-217-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A890EA37237
	for <lists+linux-ppp@lfdr.de>; Sun, 16 Feb 2025 07:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D15016EC47
	for <lists+linux-ppp@lfdr.de>; Sun, 16 Feb 2025 06:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A342013C9B8;
	Sun, 16 Feb 2025 06:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShB7WDIb"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C715367;
	Sun, 16 Feb 2025 06:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739685959; cv=none; b=jB3KwLrWNY6VENu47EvrVAqDSp0XB7MmBRMZzVDXpf5Vonc879jj3E5p1gJKNdlrV1YYfWgO2+hbzKv+hyNtC7dBw5XhoifsdHdrYWyeL1ruRyL+0dcUAF6LFZYtfBKzZSlpbbn6ZOnLdDZ8PzGzgomD3lFO+cT/HxmEjhc6PEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739685959; c=relaxed/simple;
	bh=Ne7UlvkHLrSu5pPHFMnqQpZbQ/XsBwEe47R2mLq5gqk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HGr0ax+N++7TkMOyjwr2dVCvd25TsVJ69dQDaDVGWVqiirGx7FiMD1kcsrtiPsZOpg1oL9z78Eb13ciXMqAfehaBBmabhqlwuco9AtLEGquGa02I0SyDZ/nDbgj+vHvxWoXG2b3/vzmL/ywx+tRrG/KfoYhdu3F6O2SC8XKreSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShB7WDIb; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2212a930001so796385ad.0;
        Sat, 15 Feb 2025 22:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739685957; x=1740290757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5jTapXlC1YJYE8Fuo/zvj49N9KVPFzd+PYqhYKTYCbI=;
        b=ShB7WDIbYa+slgtKzmBcbYhccJGtsVafqU/ADPtKbZGJxLQzy3hamqZP5nhS2msjD1
         l9MSkwBb6bEN+FBg2wmbQJYZHZhkOPy7lFEXUY2bl4nlv1Z04/RBNl6BcYjC3ABsrUd+
         26D6/7OFLASISO/ufhnGopytKBEoKSUdg+9SnnTsAvIOvXRDlFARcqsBQt1ZwcKOLv8s
         seOXl32vUtMCUaFB//B0j9H8ShqPfEJrX7VJYctP4DZoFwNeUT2P07jh9qnzE2rzdarg
         x9gShsfUrB5gcaMQgHAszVedQnlYEOQD7pisbmzA9IU3wN4b8Et/Xo4KsVqYElrbZ8c2
         IQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739685957; x=1740290757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5jTapXlC1YJYE8Fuo/zvj49N9KVPFzd+PYqhYKTYCbI=;
        b=lFWg6UwNUBcwfvmRoKVnWIcGaFiOM1fpWK687OqUmcadq+6rT2RlW2Ub6RqdLhuT4r
         c0zkPXGLyjd9vBw7rao325+SyIRE3olHHh6JOiCki7h3lm/aeldYt/LSOzFcYIFiq66O
         QuNCOFMB1gRpSt6HN1oJgSk0SaOit7eX2wVDWf1sGwkVv+xDR8cX80JII2l9u3/FlFc/
         /LjtSqo3hxw5yDiKpnes3JS0jAvlqEA4tpv1uBrolYzI6rkkpEj0vicaYdyAfvY9Y0oM
         ji6TdXCDUNxuuxLAzYKSnED0pqgdnN1Eijj1A4zcX/xvp60C1Aoc+sk0dZ6cUm/AlZoP
         zu0A==
X-Forwarded-Encrypted: i=1; AJvYcCVIbOHBpVVJX3p5Vy2aaihqlxiQE7MoCrZB6nB/LcpcP9TY/exslB0AKsNEGGYCFESLsnBfythmZkQ6@vger.kernel.org, AJvYcCVc92+pLMm31fRh+AdGZ+yhLx8VrdguBaKlC4AZopduQswz8Wcsle5z0lvuMzRsX2aeu/wI4YaU@vger.kernel.org, AJvYcCXcv/hroXJ5BIrDr5dfdaIzzQG16LgMBMXS288CSKq1gfT09hbamtI19/e/+IBXQDCm8nvJVeyv7jTaQBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsQsHa5kTnjNesbsovP0KbkplAGyQdM49qNfUdOKCi6Qk0cGc/
	v8tvX0LWKqKzHsi0Ez3iRZqEYHw6xefvGW2U+NCGeLi8fLS5tkYB
X-Gm-Gg: ASbGncv1XKtgZBEFhXhjBVzVBhkNF12b5/PV0gi/WYktpywl6XO5ejo+uUnsU1KFEfX
	5d/QOP+Bl7+FzZ3ZrJT0AKr3tJrbq0seamSjuLQQfbLnGyKJ34R9nbXzaBMQVx47D91V1Z83cyM
	9jDMZpnskKkdJ1L4ui6DS4rofx9p50YnepWvcA+EFYlaemEtt9/5qvBI4cgyZ/3o6SniPuyTE8P
	Od1bF9O0brRos2hjlS/8P0XRtMVACI29Hd7zJihj6TMgJhcJbf0wW9ys6T3R3EK324APP5ZeupL
	8dj9KjmZIjxkLeGukXDtTN3y2GG+E1uGL0JsJwknToB2Xw==
X-Google-Smtp-Source: AGHT+IHs8XMBTRzu3KT73jxsEp0W44CgM/+zKPSZcHvbAB3MU3yM2R/HWZe7wKmWc2rKQVVWyUrrcQ==
X-Received: by 2002:a17:903:2b0f:b0:21f:f02:413c with SMTP id d9443c01a7336-221040b18a4mr71761035ad.42.1739685957269;
        Sat, 15 Feb 2025 22:05:57 -0800 (PST)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([2409:40c0:2e:ea4:de25:f19b:8521:c31d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5367510sm52188685ad.83.2025.02.15.22.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 22:05:56 -0800 (PST)
From: Purva Yeshi <purvayeshi550@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: skhan@linuxfoundation.org,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Purva Yeshi <purvayeshi550@gmail.com>,
	syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
Subject: [PATCH] ppp: Prevent out-of-bounds access in ppp_sync_txmunge
Date: Sun, 16 Feb 2025 11:34:46 +0530
Message-Id: <20250216060446.9320-1-purvayeshi550@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix an issue detected by syzbot with KMSAN:

BUG: KMSAN: uninit-value in ppp_sync_txmunge
drivers/net/ppp/ppp_synctty.c:516 [inline]
BUG: KMSAN: uninit-value in ppp_sync_send+0x21c/0xb00
drivers/net/ppp/ppp_synctty.c:568

Ensure sk_buff is valid and has at least 3 bytes before accessing its
data field in ppp_sync_txmunge(). Without this check, the function may
attempt to read uninitialized or invalid memory, leading to undefined
behavior.

To address this, add a validation check at the beginning of the function
to safely handle cases where skb is NULL or too small. If either condition
is met, free the skb and return NULL to prevent processing an invalid
packet.

Reported-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=29fc8991b0ecb186cf40
Tested-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
---
 drivers/net/ppp/ppp_synctty.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
index 644e99fc3..e537ea3d9 100644
--- a/drivers/net/ppp/ppp_synctty.c
+++ b/drivers/net/ppp/ppp_synctty.c
@@ -506,6 +506,12 @@ ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *skb)
 	unsigned char *data;
 	int islcp;
 
+	/* Ensure skb is not NULL and has at least 3 bytes */
+	if (!skb || skb->len < 3) {
+		kfree_skb(skb);
+		return NULL;
+	}
+
 	data  = skb->data;
 	proto = get_unaligned_be16(data);
 
-- 
2.34.1


