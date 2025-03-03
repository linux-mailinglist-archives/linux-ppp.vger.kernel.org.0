Return-Path: <linux-ppp+bounces-273-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FB5A4B67C
	for <lists+linux-ppp@lfdr.de>; Mon,  3 Mar 2025 04:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C87143AEBF2
	for <lists+linux-ppp@lfdr.de>; Mon,  3 Mar 2025 03:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8991C5F37;
	Mon,  3 Mar 2025 03:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLzbaJZn"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142B919D084;
	Mon,  3 Mar 2025 03:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740972431; cv=none; b=AKa/oGSTq4yengYFO562zduwB8w11c0yyYMRLwoOxCV6OxlaNkTLUiYNtracsapszWDMk1R+24W0V6Emmh3pEgafpgvPU9z3V9nQMd1Ab2RcfZYs9cAxjGs4ANCtQ9RL2uxkJMaEfSLauvWqQb+NgK8FQpYVr2xsDHiyEnZVr2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740972431; c=relaxed/simple;
	bh=9ZAXy6AUqP921WUMDzjxlfgaSS6IuoPpOF8lbu80TOE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=hiioxCeR6sYbLTgWEZKnR9c+RhX9Xl8kY5A+tLKdk8K9e5QHyUKL5PCcFIakNmJ66wyNvGD2RPUZzpTUy1V6ZGmdSd26uDrHSmX4AzY8lWUCIpBxfvMrE14woQIjU98D/8unk+Kyw8Fr2uobj58q7lyAcY4fqw3NPMnb6Vazohg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLzbaJZn; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223a7065ff8so16206035ad.0;
        Sun, 02 Mar 2025 19:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740972429; x=1741577229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iLl+VFTECyB9okUESCJcsmH0bg8HduocbulJuY9eevk=;
        b=gLzbaJZnfCrtVklXE5WSB8lggm5ky4QELKSHCDGEXzOnMGTajxYPUo0mOYiJPuDej/
         rrVOqUJowhVkxrfJXcCtiMDo3BxBCX4cII54+2dwWh31y6mz1alaxvdjOkpqPpAfiYlx
         vrNnlaSrRQH9RMzjLC/sRHIp4GnUJeJLxt3RBfFJVQh9XcCaz1mlDHyKWpCGO9mgFYT5
         z16qOWqrQJOD5EErKathuSbnpl0NSCIPPFRYRUo1oO6PphABGwcWFJdaaXBL0lgky6Xg
         25rNNuWlPW4+IaUtWOQYL8mPKb/5OelwHR1x6Ap3/bCzojxlHvPjYb21HqXV9uZIBPMY
         UgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740972429; x=1741577229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iLl+VFTECyB9okUESCJcsmH0bg8HduocbulJuY9eevk=;
        b=ea9/cPzAxUnmzg3gpIiBggxTikke697qkKnwEW/TkTdcXp8X+CLKvktggz9EH9jl25
         doS5N3ynUFbC2b3W/C1qG54Bxz5sqt7QpFByslpT49DNn8/663gKkaV+YUl17FwM28CO
         o4SX8SkmSWxty9Vy+v23B79P7cLcERysQxbFt7WzdotjKMrSrhzM/ZvostacbAwBs/kp
         r2YnbtGqk7c4iJK8iV8r8vx+e3XIRBysEt0RUcz6joW/HUDp5AzEvQXCygtCkxWgEFWu
         GCz5x0TXEiJwTRQA54eQzdYTa+mj8xdfx9uCu08YSV9TyHXieE9wSr2+E3P1zRw/+JOl
         pB5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9fGFIIia+OMcAxhQwMaxgWvmofdWoSWFm83wZqlH03sVaK20U7Cbmvyh7TvWyGcLscV8wta+P@vger.kernel.org, AJvYcCVMGo1Yvqk13ye+d0jakjtK06B94zPPwCgQqiOevAiO5qFB+D1xvVoYTwMZBb1Vw8odsRjRd4tOIUh7@vger.kernel.org, AJvYcCXjVD0sV1bO4Ux0UcqCDJW+nitlVb7cnEdFPARzPlwx0kohWlqyr7i03Zzq/pSaisuNgTmtYzMnD2jiZms=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOqPejJZR5anL9iqXIPwb9ur65QAny4icAeWsRP6x2aznYjv1g
	xoNDiWU+D7UZy54cSRocE7SRoTinJEQJKoKF/ePx17sHUmtJBkcc
X-Gm-Gg: ASbGncuODZ2tStthC7K2sDoFxqnaOI82frwvN6ufk3zVkBSah6/L5reAIali59AdnIL
	YMlIfCQMAwbzlNY/tEmjiOxssgu1uaFGLMrPFqN28m9WCi3mYRayLqxb9IFIdx5RyGIF2EUfiLp
	YcfOD/DmczKjQW60g8BN2B5JNXPTGh5Bq0GXoTmxXfg2HbccRCEkws92KL8BM6yZ/lUmV+qTOR1
	9DgDNWDlzscTM7Ck0xg/1IcgwPudr2JJx/3Hvr0Jn6a6cTdNUFQAzQkKiI+u5HvPG6G0qncjrky
	tQBud7elQYZxL6uqUm92r3qLUSjK6XfoPCWrSg==
X-Google-Smtp-Source: AGHT+IFG8Kg6cBX3r+CuPKUwiMLw5nuGIBQIuJOUDHB/YSC+ivGfUfyyIum8E0KDjDN86+UtXPI1oQ==
X-Received: by 2002:aa7:88c1:0:b0:736:46b4:bef2 with SMTP id d2e1a72fcca58-73646b56f99mr4672802b3a.6.1740972429220;
        Sun, 02 Mar 2025 19:27:09 -0800 (PST)
Received: from gmail.com ([116.237.135.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73632e76e1dsm3768873b3a.89.2025.03.02.19.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 19:27:08 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Ostrowski <mostrows@earthlink.net>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 1/3] ppp: convert ppp->rlock to rwlock to improve RX
Date: Mon,  3 Mar 2025 11:27:00 +0800
Message-ID: <20250303032704.2299737-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rlock spinlock in struct ppp protects the receive path, but it is
frequently used in a read-mostly manner. Converting it to an rwlock_t
allows multiple CPU to enter the receive path and improve its
performance.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/ppp_generic.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 6220866258fc..15e270e9bf36 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -118,7 +118,7 @@ struct ppp {
 	struct file	*owner;		/* file that owns this unit 48 */
 	struct list_head channels;	/* list of attached channels 4c */
 	int		n_channels;	/* how many channels are attached 54 */
-	spinlock_t	rlock;		/* lock for receive side 58 */
+	rwlock_t	rlock;		/* lock for receive side 58 */
 	spinlock_t	wlock;		/* lock for transmit side 5c */
 	int __percpu	*xmit_recursion; /* xmit recursion detect */
 	int		mru;		/* max receive unit 60 */
@@ -372,12 +372,14 @@ static const int npindex_to_ethertype[NUM_NP] = {
  */
 #define ppp_xmit_lock(ppp)	spin_lock_bh(&(ppp)->wlock)
 #define ppp_xmit_unlock(ppp)	spin_unlock_bh(&(ppp)->wlock)
-#define ppp_recv_lock(ppp)	spin_lock_bh(&(ppp)->rlock)
-#define ppp_recv_unlock(ppp)	spin_unlock_bh(&(ppp)->rlock)
+#define ppp_recv_lock(ppp)	write_lock_bh(&(ppp)->rlock)
+#define ppp_recv_unlock(ppp)	write_unlock_bh(&(ppp)->rlock)
 #define ppp_lock(ppp)		do { ppp_xmit_lock(ppp); \
 				     ppp_recv_lock(ppp); } while (0)
 #define ppp_unlock(ppp)		do { ppp_recv_unlock(ppp); \
 				     ppp_xmit_unlock(ppp); } while (0)
+#define ppp_recv_read_lock(ppp)		read_lock_bh(&(ppp)->rlock)
+#define ppp_recv_read_unlock(ppp)	read_unlock_bh(&(ppp)->rlock)
 
 /*
  * /dev/ppp device routines.
@@ -1252,7 +1254,7 @@ static int ppp_dev_configure(struct net *src_net, struct net_device *dev,
 	for (indx = 0; indx < NUM_NP; ++indx)
 		ppp->npmode[indx] = NPMODE_PASS;
 	INIT_LIST_HEAD(&ppp->channels);
-	spin_lock_init(&ppp->rlock);
+	rwlock_init(&ppp->rlock);
 	spin_lock_init(&ppp->wlock);
 
 	ppp->xmit_recursion = alloc_percpu(int);
@@ -2210,12 +2212,12 @@ struct ppp_mp_skb_parm {
 static inline void
 ppp_do_recv(struct ppp *ppp, struct sk_buff *skb, struct channel *pch)
 {
-	ppp_recv_lock(ppp);
+	ppp_recv_read_lock(ppp);
 	if (!ppp->closing)
 		ppp_receive_frame(ppp, skb, pch);
 	else
 		kfree_skb(skb);
-	ppp_recv_unlock(ppp);
+	ppp_recv_read_unlock(ppp);
 }
 
 /**
-- 
2.43.0


