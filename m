Return-Path: <linux-ppp+bounces-506-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E5xNF9R12kFMggAu9opvQ
	(envelope-from <linux-ppp+bounces-506-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 09 Apr 2026 09:12:31 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC113C6DC2
	for <lists+linux-ppp@lfdr.de>; Thu, 09 Apr 2026 09:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1713B30157D7
	for <lists+linux-ppp@lfdr.de>; Thu,  9 Apr 2026 07:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62424375F67;
	Thu,  9 Apr 2026 07:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJlPQmr3"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085783081BE
	for <linux-ppp@vger.kernel.org>; Thu,  9 Apr 2026 07:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775718736; cv=none; b=HH/V3hEPkg1jYUdOge/D/jl91eYItoGb6jhhLX2MvKjs1e7mRXpFt/NsKjf1l/9zqiJf+h2wGIvTn4QhUNuIb0GkZnTB/W3Wz+OV3GIhmLUvX9iUaKJQZruH6c9DYlHEoTNJU3A6SGFFMvErVEab2bQ+I65By5R3jsB4yarK/bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775718736; c=relaxed/simple;
	bh=4cK7xAQaQluVvtSS1YJSFBx2Rb8MGWj4l9J4zSe8hh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bKsFzVuMSuDb2ZaFED8P1hfycWutJ11h8/BQ5JMFLiiGrpHKOwPe0aRaxlyuf1gy0R77RAo7dAC3uMjyGXOooYcSs93F9M0/7USPUGVWAHWoVFKlP7tYtCHSS4W7y87AesGltKgZwfwcObrhswFOyFx4KzpJA2pIEiwtA4Zfa8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJlPQmr3; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c6e2355739dso262728a12.2
        for <linux-ppp@vger.kernel.org>; Thu, 09 Apr 2026 00:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718733; x=1776323533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X6n/6XAG5DCp2ub78tzGGPgz0JbF6NQXkefJxmE1mY8=;
        b=YJlPQmr3k1K6cEl7BH0GO0b7rkXi9Nf0PwA5kysCJ/jhNm5BLdLYsg5hRB4tdjS7dA
         9MHJmB8o44tSFUzV4epNesu8ckHd6fudQ19gOSEAkEQFggwcKMctRI7pEoXc9itQk0C+
         Wssk7w2izrD4hW56vW0T6Ldsb86EgFrRpQ8+tSAtVnc9HrlojO2bkWQsdxejafU39FkU
         4a1QII/rpLwXNVprXKBpMDiRXe2iNTBAylHWPTGoYdnuBeRynHZSXX75k3r1hGTj25h+
         4D3RWrFXWy290ISdUDNvQIK+C8dYuNtenHBJLAi53MHLdYuoO1t3rHftbmGuUNfF4Hb1
         JsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718733; x=1776323533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6n/6XAG5DCp2ub78tzGGPgz0JbF6NQXkefJxmE1mY8=;
        b=U2wKlldN8E1l4+m7OmAUPLKCVqJ32pCKXLYfOl291LnZWS6GLlZra8wTs/an9MOtuX
         un4pYibfqj8CxL5V08CeZvUfF+Y2VNmRimrIajNp2a6Hy0IJ60FicSpYlVJwtwt6PQTG
         st4bZ/FGW9aiL9LSn3rlrZnWyyapLD1gGeVTB5KkLEvlDk/JI63qQU/HWqAepMkhkgwC
         JGWydEKZNjP4VGUDUXo3jAtkOp6cCjf5Iu31o2SUaQO12b/tVELQy3bQxdPT2gPAlKkp
         hGl+0JhIzan1KeKKTuO/SyM9JXrqOV1xjPddyrgRFAwL5yVLhnqt0qyzp5urWkUqpijg
         kobg==
X-Forwarded-Encrypted: i=1; AJvYcCUn9U0NKjUnsigiL3F3nOlDaTSZERXWdYbCwKNk28g9WcPFhuKYL4XGKQItKjbY8Qns/lhgYhf01j4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaPt947RT5/Mo84+Qld/LhkYRlAzXXB7/NJFHdQLCB0RfNG3Ey
	KDVvhe1OzxOROWGuyO4vYsXDb8cDGdZrplHoeOgjBHBOH8e8Hg3dyzwD
X-Gm-Gg: AeBDieunUFbvAARF3pD4mXgxmt4w3TbI65e1wV5bMAfkS+7dahY+Tg/JNOFmmcHOP1A
	X1s5yNQy7rWRMKv9csBhh8J2KTQyD8FWqUCpwXREiQFnFy1+DQQ7BS+6VA7XCzc0DCyfBogfutD
	MlDU2ZKXnesXIjLUdLrlBJpivqHVRio2sWcJzReR0GMKFnS6uRKuHXjjrmyCXjWn8hIBGlwg0is
	OsBC0yIyxlMtEmoznrO+pNkZCGQ+r7Ba+R/lc5DbQY6qJ5yIGuGThqM7KA8faWi/w0C0ou7tHrG
	437ctnzZ1yUM0abgRTNuLek/4V9XzcFYdTx8F8xgAbnQFSaGmgFj3ioP+0pkZeOzh1bIfAoeL8m
	wRSkPAOYBL539C2IEQEfQyW7jY/VclGIJKBbAchRPyYyJPGRXJCdOsaGWzSU0qCCPZD1uYDc4Ep
	GXUfpGKDpCb1K+GbDKtr+fNaKif8Kf6XDQt3e0w5ozGrY6DaM=
X-Received: by 2002:a05:6300:2418:b0:39f:6315:f5f with SMTP id adf61e73a8af0-39f631573fbmr14238935637.28.1775718733304;
        Thu, 09 Apr 2026 00:12:13 -0700 (PDT)
Received: from localhost.localdomain ([220.83.29.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6491fe0sm18642825a12.11.2026.04.09.00.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:12:12 -0700 (PDT)
From: Taegu Ha <hataegu0826@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Taegu Ha <hataegu0826@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Cyrill Gorcunov <gorcunov@gmail.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: qingfang.deng@linux.dev,
	gnault@redhat.com,
	jaco@uls.co.za,
	richardbgobert@gmail.com,
	ericwouds@gmail.com,
	teknoraver@meta.com
Subject: [PATCH net v3] ppp: require CAP_NET_ADMIN in target netns for unattached ioctls
Date: Thu,  9 Apr 2026 16:11:15 +0900
Message-ID: <20260409071117.4354-1-hataegu0826@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.dev,redhat.com,uls.co.za,gmail.com,meta.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-506-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,linutronix.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hataegu0826@gmail.com,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8BC113C6DC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

/dev/ppp open is currently authorized against file->f_cred->user_ns,
while unattached administrative ioctls operate on current->nsproxy->net_ns.

As a result, a local unprivileged user can create a new user namespace
with CLONE_NEWUSER, gain CAP_NET_ADMIN only in that new user namespace,
and still issue PPPIOCNEWUNIT, PPPIOCATTACH, or PPPIOCATTCHAN against
an inherited network namespace.

Require CAP_NET_ADMIN in the user namespace that owns the target network
namespace before handling unattached PPP administrative ioctls.

This preserves normal pppd operation in the network namespace it is
actually privileged in, while rejecting the userns-only inherited-netns
case.

Fixes: 273ec51dd7ce ("net: ppp_generic - introduce net-namespace functionality v2")
Signed-off-by: Taegu Ha <hataegu0826@gmail.com>
---
 drivers/net/ppp/ppp_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index e9b41777be80..c2024684b10d 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1057,6 +1057,9 @@ static int ppp_unattached_ioctl(struct net *net, struct ppp_file *pf,
 	struct ppp_net *pn;
 	int __user *p = (int __user *)arg;
 
+	if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
+		return -EPERM;
+
 	switch (cmd) {
 	case PPPIOCNEWUNIT:
 		/* Create a new ppp unit */
-- 
2.43.0


