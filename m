Return-Path: <linux-ppp+bounces-303-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3579DAE7554
	for <lists+linux-ppp@lfdr.de>; Wed, 25 Jun 2025 05:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BDB45A447A
	for <lists+linux-ppp@lfdr.de>; Wed, 25 Jun 2025 03:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83D61DF756;
	Wed, 25 Jun 2025 03:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqlXiyL3"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CEC1DF252;
	Wed, 25 Jun 2025 03:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750822831; cv=none; b=kMeZ9FdPy42mjB+pzZcenE7eX7eszAZC2ijJxQA95gc6swjvSCJONscQgPgoJ1fhRtK9COX07zRI/UZN/ugS4fry14SKOKRT4f6HSFk20GmauW7gtWwHk5nLpTQkkeht+RIaR7PC0MNcnUHff29PLjsEJWGr1fyuWTRog8IIcyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750822831; c=relaxed/simple;
	bh=u55QHI4onsRavou8gTqCnBb2RBGfBvtamf7w6wkyNXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YoHuNzKyjdIwxJ4jgYKOeJ70kROFht0oxO+K3t3Yaq0/Ka4VBZ7Mlrm18C2y0+Z9570dnf/BHMHM9o2uw0Z10ZBaW4Rf/N5cFwkpyS4I5b5QzwfynEjtgv4oX31rEBZNirQS10A8cnGNeHU54XnkilP1iSK55exNEzj4E6LF79o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqlXiyL3; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7426c44e014so749696b3a.3;
        Tue, 24 Jun 2025 20:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750822829; x=1751427629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAGrgWMnCCo0WPOEy8wMJ9PQbjafbCkKJMKCoMu9VEk=;
        b=cqlXiyL3zJklYNiRb5rdMzlbv3vFl+lLEDSBsY4FymO9L19zJBBwBNhkZLLFiLVt2t
         UBjdDiwkilluxMb5phQdunI+/I3Wr1qHW0u0vtvfY0TzuOLjmV5bxn0NPj1dtd9GE3LC
         xU9zYfwzJNRuwqQGwikawz2ibpxiontoferV1xxeUIJCdIripxb0OxWfJ9PjEWPH8SfW
         N0Ziuhw0Ay1F0HjGaunCtMzN4LV7CSx37sQy6kzt/w3f4IN2N91odWNTsX3llaMqxwYL
         CbaBrTNtkJaTccQTmWK4z7PFdeC4Ormzm9VeuXHn4CSZBCZGXJsWOegHi+ZVzU9dqGal
         fbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750822829; x=1751427629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAGrgWMnCCo0WPOEy8wMJ9PQbjafbCkKJMKCoMu9VEk=;
        b=vecEMWh8muOwnaKV4hMwVBPPHyAXwHESeQ6Zd7qYhHCW6J7idE9lDjxjsb+RUHv0Yq
         gzv5jac9HatnmxyHBInqqd7qce2dW50/lx1HYcfmLXrlcZt07w5I6Zfj1GH89qAT5H+r
         MttimZAgOWBo0xwT4SsqU99KwMiL8JwLBpInUDowZOCzj/sBW5mxdltwqrP8G7fxm038
         5hklOKUkn/d2wW8I31x2J/HfNVIfGNiv1bXI3W+QT4XqBoHT/rKn3k5kEafD6E9pI42w
         CD5JTopAwNzknNWoMJlhbyxKGF/YPxHpv2n19R/WTLx+Zm1Q4LDENtCbZAyJSNvYmf7x
         A4kA==
X-Forwarded-Encrypted: i=1; AJvYcCV6cQUOrt3+x7adq7t3qBBnscX+jBgnfBuV/jTMOGa+P+dPRQ8SGgiZyzYNpaY9YyUeZHSnpCzjQpsK@vger.kernel.org, AJvYcCVvRyAto0cl16o/99O1v5+JI3Fy9O0wBGFlhT48MiCS6Mubrc7MWlqwn5vp/iMti2Hnxc9jhTtGu7EoHP4=@vger.kernel.org, AJvYcCW84ujoO/DtbRRJlFen8AHALqVjXSYfXyn2NFP+z0BgzHTYofmc1KMJjkNsznKhT46PY4Y5cPEy@vger.kernel.org
X-Gm-Message-State: AOJu0YwwF264iJgP94cy3v+4ag9jjcZ+N7eOGGI2KPO0z0Q1NoROZIR6
	RDuETmCHasywqoCRZe1HHqr9nCPlqhSSy9RgKnj50zXQOwHmbitwEb6+
X-Gm-Gg: ASbGncvqmEt2LOEd5GFyzNzTub9of//SkL1uBk+YdSt4a2QInbJImTvuFaphgIb1SsZ
	vETqzsBML/6wfiFY++N4kdZO3DUjeOt7YOcajW+Lc8e2PUEBXKJHnkoQ/RXCzRK0G+VvISk3tuA
	elLHXYUb9wNuppJwZ57uViP6FkB1NppxmbiiUq2PGgYPxWEsbl1j0M+W9SHHJrRJeVqc4KbBxwo
	NOZg2MH5CqfPVxeGT57+EYhzK5h/M89pFvuFLVcz1omJoA2hgPRoG00g+Yw3CI5NtiVGd/fkgks
	rvH0gqt6IcA5JKgbMY/RO/kaw+UVV0TzTmX539puz63MJ5jTxR5xAeKM
X-Google-Smtp-Source: AGHT+IF8nT3qZP7P5ZiNyvCsTfo09jaePq3mSYC+KbTVjWdY7pEoSFc7ax0gfTXC8tltFvP4rkaA8w==
X-Received: by 2002:a05:6a20:258a:b0:220:33ae:dabb with SMTP id adf61e73a8af0-2207f2a2252mr2755174637.29.1750822829486;
        Tue, 24 Jun 2025 20:40:29 -0700 (PDT)
Received: from gmail.com ([116.237.168.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1241f4asm9640143a12.44.2025.06.24.20.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 20:40:29 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guillaume Nault <gnault@redhat.com>
Subject: [PATCH net-next 1/3] ppp: convert rlock to rwlock to improve RX concurrency
Date: Wed, 25 Jun 2025 11:40:18 +0800
Message-ID: <20250625034021.3650359-2-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250625034021.3650359-1-dqfext@gmail.com>
References: <20250625034021.3650359-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rlock spinlock in struct ppp protects the receive path, but it is
frequently used in a read-mostly manner. Converting it to rwlock_t
allows multiple CPUs to concurrently enter the receive path (e.g.,
ppp_do_recv()), improving RX performance.

Write locking is preserved for code paths that mutate state.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/ppp_generic.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 4cf9d1822a83..f0f8a75e3aef 100644
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
@@ -371,12 +371,14 @@ static const int npindex_to_ethertype[NUM_NP] = {
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
@@ -1246,7 +1248,7 @@ static int ppp_dev_configure(struct net *src_net, struct net_device *dev,
 	for (indx = 0; indx < NUM_NP; ++indx)
 		ppp->npmode[indx] = NPMODE_PASS;
 	INIT_LIST_HEAD(&ppp->channels);
-	spin_lock_init(&ppp->rlock);
+	rwlock_init(&ppp->rlock);
 	spin_lock_init(&ppp->wlock);
 
 	ppp->xmit_recursion = alloc_percpu(int);
@@ -2193,12 +2195,12 @@ struct ppp_mp_skb_parm {
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


