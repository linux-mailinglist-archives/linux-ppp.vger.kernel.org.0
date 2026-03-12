Return-Path: <linux-ppp+bounces-412-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPdjA3KJsml4NQAAu9opvQ
	(envelope-from <linux-ppp+bounces-412-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 12 Mar 2026 10:37:54 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F3926FAEA
	for <lists+linux-ppp@lfdr.de>; Thu, 12 Mar 2026 10:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D59523009E13
	for <lists+linux-ppp@lfdr.de>; Thu, 12 Mar 2026 09:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1260B3B8D70;
	Thu, 12 Mar 2026 09:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fkc7Kz06"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896693B8933
	for <linux-ppp@vger.kernel.org>; Thu, 12 Mar 2026 09:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773308265; cv=none; b=X3nAmddhT9cAKPObc+ay8451fYHvY8fDwIc7yeBrh9TW1w570rFc4bWwK8jTTtRjlaMMW/M2pyk3U15UdHnwDpSXpLoqEg3KKOh/J520ZCMZre29iThVXGngG3zAS7C0fUN9HVBcV1soo/nrZrK9nqZWlnyWIOKKNKlru6/5aXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773308265; c=relaxed/simple;
	bh=nmS+lsmzgEPjEn3riI1mvL7c2Eoou0UuR1cS2D2z6U4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C0qAv9VwFquJTnVSVB4sdd5T3J6cDGylp4iCm6giKrzWGrz6Rc38QbMaDsQhnxNlPien/sDsrHJqd+U04xU/xPKH4CgimbSWtN3Qomles+6ihDGFR1qgViZZrTsooXvL1zn3MNuZHs68MOGCPtlkUmSl041n/NhikDnzZG0soTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fkc7Kz06; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6616cb8c80cso1103825a12.0
        for <linux-ppp@vger.kernel.org>; Thu, 12 Mar 2026 02:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773308260; x=1773913060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OMylDifb+sgwUdyQ3doSis8cOmZPRv2aLJLRsCDWhws=;
        b=Fkc7Kz06QLN/zyyVNUx84VpZu3Wefio2PbXKknTvreAJwVTi0A0GG78OEMONAeUHhr
         Ygn+LRAEeRvixuubkQ7L/avK4ptZG1455jBA9ZnpkdIub1cV0wSl/QjyK8io0zrP/ykz
         QYazmzU8AVxkEGNNNcWmdHN1CGK2euardpaC/o+PZopf42M7dFKzdvjPHhOrnaa3S+CT
         PbyNYo+bYqLiffRSDo9EZhE9AZx/wKx6Ywt86/QncB8pAzfU4RJ1mLL+q1kGtjJ0yk5Y
         ISxBn+duKirsLg22BKIeyW3YpQwGyDEtM9Ui8U6Oici9ZuebcHizFRl4FxkpFBxmvCLm
         AQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773308260; x=1773913060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMylDifb+sgwUdyQ3doSis8cOmZPRv2aLJLRsCDWhws=;
        b=Y4l7in2PF4rfWMn/WJDuH1vLAMhgK7r6Vg9sDIe6OkDd27n9DF96EPfR3zoRzJbhpi
         6VQU3r4rmXO9iuuipQrGXL7xLs7DhXbxYcHrR9ar4fKItOgerCX9dJJm+u2D590SLojK
         28fqKveEdjx8YQTXr3H/9pguovjkc7y/sVxwkVlcYZJqwTxUPdPi0rFTiU64qVszmUyT
         qLGkAq3/MTiPZJZqfEOE3wXD6/a05Ib1/na5S4WeDkdoTVOY5L8q+pvI3khjhOmMgRtO
         CHIGbLAKfpKnXKdWHIrNKnMJEROfhtqd7pXoZTtceM8g3wjcFm4swPb+7/VfK+mVJ/8k
         FSvw==
X-Forwarded-Encrypted: i=1; AJvYcCX6Obko6dRVRU4vUNYOiDL2wTnEtnTpwYGC9ZSmi8Uonwb2XPuMhW0SSRIW24IUn5OkaeFBYkFEBB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF0QkIePfTYz5bsONy0NaLSu8VZU4p3FeTkd3SABx9i264ualg
	eRRDseG3hYmOC94TKoEh6KqEvDqYhvTl+pEDZNCD11lXQzWZWk5eOY9q
X-Gm-Gg: ATEYQzy/qpaXz4KY++FiZ/WOEbP542kQBCqMWlCFmnuZckdq23o5Sfi/ZDwo9j417QF
	/rOvseCmgOEuEMPqMN7AjmV+zWTO65a7n7NLXbNkwCTSSeeWOQuH73BGF9KvBmYGE1cBGPg8Tze
	zaZAgAo5x7MH+evVcEkjEzsuvtTJouV5w7E2mLCGqEeimX3FToy0juaF6QkAqWihG/bA7lm5HKx
	bWGYVPce73CKwFvaSNNAAgffMwW7Sr4cajzSV1Wk7rs1jjw+5cUZdgKhRwra7WVmy58hQ7WgKQz
	M4c4L9+xZmIzLfAlWUpXqTkGjp0MJ1eKYQ47JG/XoAng65qEWloJGZfDkmtVfnV8ZHFRD2gW89C
	Gz8bZOW15uPTSUr8ZYrAnG2a9Z0Z/ocBPfR0dWFueetnA+LqVPwAko5ntEb3n07n7WnsCud7A
X-Received: by 2002:a17:907:9452:b0:b93:8995:8f3a with SMTP id a640c23a62f3a-b972e1ac726mr317393666b.3.1773308259284;
        Thu, 12 Mar 2026 02:37:39 -0700 (PDT)
Received: from gmail.com ([2a09:bac1:5560::49b:47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de82bc0sm114022666b.27.2026.03.12.02.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 02:37:38 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>
Subject: [PATCH net-next 1/2] ppp: disconnect channel before nullifying pch->chan
Date: Thu, 12 Mar 2026 17:37:30 +0800
Message-ID: <20260312093732.277254-1-dqfext@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-412-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 06F3926FAEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In ppp_unregister_channel(), pch->chan is set to NULL before calling
ppp_disconnect_channel(), which removes the channel from ppp->channels
list using list_del_rcu() + synchronize_net(). This creates an
intermediate state where the channel is still connected (on the list)
but already unregistered (pch->chan == NULL).

Call ppp_disconnect_channel() before setting pch->chan to NULL. After
the synchronize_net(), no new reader on the transmit path will hold a
reference to the channel from the list.

This eliminates the problematic state, and prepares for removing the
pch->chan NULL checks from the transmit path in a subsequent patch.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/ppp_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 6344c5eb0f98..ad480b584e25 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -3032,12 +3032,12 @@ ppp_unregister_channel(struct ppp_channel *chan)
 	 * This ensures that we have returned from any calls into
 	 * the channel's start_xmit or ioctl routine before we proceed.
 	 */
+	ppp_disconnect_channel(pch);
 	down_write(&pch->chan_sem);
 	spin_lock_bh(&pch->downl);
 	WRITE_ONCE(pch->chan, NULL);
 	spin_unlock_bh(&pch->downl);
 	up_write(&pch->chan_sem);
-	ppp_disconnect_channel(pch);
 
 	pn = ppp_pernet(pch->chan_net);
 	spin_lock_bh(&pn->all_channels_lock);
-- 
2.43.0


