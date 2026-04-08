Return-Path: <linux-ppp+bounces-501-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEeyDxf71Wn4/gcAu9opvQ
	(envelope-from <linux-ppp+bounces-501-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Apr 2026 08:52:07 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCCD3B7BF4
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Apr 2026 08:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF7253010DAE
	for <lists+linux-ppp@lfdr.de>; Wed,  8 Apr 2026 06:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E48935DD1C;
	Wed,  8 Apr 2026 06:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLB1ZoSv"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6822A70830
	for <linux-ppp@vger.kernel.org>; Wed,  8 Apr 2026 06:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775631124; cv=none; b=BaMgXeOWRoItI9snGOhbeIt206sH3tHsJZPY0kGFoHK2cAKSlgFF54/BYZnOHYLTxxAnx+0wmQitUorQ6bex0NpYzWiM7zC3Jc/aejwqp2TXyrlEey37LxMpl6fAKDMt8D+qbg0LaLQGoevHjdcHVxlj6K3TyQZXtOK8QVLERmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775631124; c=relaxed/simple;
	bh=ZhJ2C4i05VJJKYKlWpoOsC5SBwrL02o4l4S63ok/n4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gnuk4UzCzEruFx5aRCHBK1AqZlGFrE5i6Oj4lQczCE84nwrgTOKzIe6cr6dupi6gCK7kJRIMnfktz029Z9MZmDPGp4vwpLrvbERqj5Fhzkhpg17rG3rko1PjNVvruDw/osYX0wFMNn4v0lUTm2sVToqS6jhAmZP6CKaKTvrY9cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLB1ZoSv; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82ce0a9b3f7so2497190b3a.0
        for <linux-ppp@vger.kernel.org>; Tue, 07 Apr 2026 23:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775631123; x=1776235923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oEuFyu9HReY6kQnHy14CWxk4PsZgUkyDSOCBp7sb1MQ=;
        b=iLB1ZoSvGUy07wclc6dYXGHXd+v5m+VLF0lkiZuq3V55FZzn8sLidpYwfHqaVpZuQa
         LyrDdEhw6paYotoJFCxgpUWi87YLE6TxDg1lkw7BE/QhwDpzE4sm5/2q33rs93xG9otd
         MWjL4HGaVvJmlhUzRtmNhRpMxTHmesML3JVR70vOYz0xY3ofouwDqX8u/6HFwvlX6zSq
         pOpUSI6nubTBlY9DciSo3BJ9M8RaC4fWtRcRWZqVOFArenIfv9YXtx09pvv50IYMz+cK
         88DXyQ+FgvGP9OJZSBKEdsRwm1M1ZuBgOsM2e6sh+ndTVHTeA9mKAyunXyyJk8zKa6B7
         txwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775631123; x=1776235923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEuFyu9HReY6kQnHy14CWxk4PsZgUkyDSOCBp7sb1MQ=;
        b=JkUgdMccTHPilq+Eu0DIRrVBFHsaZWrILonhSGUDgleNDMY5LDt8Bp7SMCdBMhojeX
         3PSeVXwYt63+lRIRhDPlOzQt2/ec7ifjFV9Vix9rPXJSNvCsQ+Cua57EghDyaaYE8bLv
         lwYn6pfHrP+8KM7S+DaiJbs0/oPXa+QhzrEMcuUGhDfUmKpYgF1lGjofI1dWnA86RGzZ
         6pDuuWwlTnszBn15LVvDGHrRq0tmBxkvglhGXpAWlCO9rVrRYNCJjtnIN4cqTMM7ozX9
         gN5J3S8/IAI3XZnx4QyksktYJi+MEf5URWcBWadTKHIimOYgc5xerM1l1KdHWrTZngrk
         dvjg==
X-Gm-Message-State: AOJu0Yz4LLfXe/EN1jxahqIsdI3wHAx3rEh3oDRnThOvFtsRFN6H8t6k
	8muy6BbKyW1Ueu3O0lm2vKJhGHCVhPlNguDXsghbsk/Ge8m/OvUBEB7+
X-Gm-Gg: AeBDieuo/FviFYubwfau+lsh1fAly/kWlKTN4GfM4SelaQZtwVWhupGnkrtQobJxb7L
	a8vlGRn94R68HAsWtiSZl5EaZo6bCGm/xzIJ++9y7ReJ/BzRqH4FsHr1JMgsJkCmFtVeIT1fpj3
	ENGBNu1Pfu4a2FJj/fvcYD+AwPsKgEdh8wADNtkiXl2EIJZbJ3c96L18/iMxF1RBjN9NrAk3na+
	Y4JXU1VODxhuCCwV7tVZbl2F+qFnhiwjin8/vxNbQCT+hJ2/X8v9KqXRQQfw2jUSW71PuKLDU2q
	dhikYehTn6DVjjSNbXR89hgb4xgHQfx50ZWbzaQFgpbCyVsJ+9fnuqLk/6TreKgt/rKSYgSg8g/
	vS1jGUjoRoAXkrGJnx7ZLqmnpQAgKvr2zEoFdLGZhQe3646aoJjQ7mA3behsGvKnYxPyTIuiCNK
	FdtKCjv6QHpLY74Iba41jpnqkOeGHvFxrlxyIGLWi3M7isBLhN
X-Received: by 2002:a05:6a20:7346:b0:35d:5d40:6d79 with SMTP id adf61e73a8af0-39f2edaaa55mr22041288637.12.1775631122694;
        Tue, 07 Apr 2026 23:52:02 -0700 (PDT)
Received: from dbdd95a60758.tailf10b76.ts.net ([220.83.29.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6563aacsm18076671a12.19.2026.04.07.23.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 23:52:01 -0700 (PDT)
From: Taegu Ha <hataegu0826@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-ppp@vger.kernel.org,
	qingfang.deng@linux.dev,
	gnault@redhat.com,
	jaco@uls.co.za,
	richardbgobert@gmail.com,
	ericwouds@gmail.com,
	Taegu Ha <hataegu0826@gmail.com>
Subject: [PATCH net v2] ppp: require CAP_NET_ADMIN in target netns for unattached ioctls
Date: Wed,  8 Apr 2026 15:51:09 +0900
Message-ID: <20260408065109.2171-1-hataegu0826@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.dev,redhat.com,uls.co.za,gmail.com];
	TAGGED_FROM(0.00)[bounces-501-lists,linux-ppp=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hataegu0826@gmail.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-ppp];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7BCCD3B7BF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

/dev/ppp open is currently authorized against file->f_cred->user_ns,
while unattached administrative ioctls operate on current->nsproxy->net_ns.

As a result, a local unprivileged user can create a new user namespace
with CLONE_NEWUSER, gain CAP_NET_ADMIN only in that new user namespace,
and still issue PPPIOCNEWUNIT, PPPIOCATTACH, or PPPIOCATTCHAN against
an inherited network namespace.

Require CAP_NET_ADMIN in the user namespace that owns the target network
namespace before handling these unattached PPP administrative ioctls.

This preserves normal pppd operation in the network namespace it is
actually privileged in, while rejecting the userns-only inherited-netns
case.

Fixes: 273ec51dd7ce ("net: ppp_generic - introduce net-namespace functionality v2")
Signed-off-by: Taegu Ha <hataegu0826@gmail.com>
---
 drivers/net/ppp/ppp_generic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index e9b41777be80..4435c594f587 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1057,6 +1057,12 @@ static int ppp_unattached_ioctl(struct net *net, struct ppp_file *pf,
 	struct ppp_net *pn;
 	int __user *p = (int __user *)arg;
 
+	if ((cmd == PPPIOCNEWUNIT ||
+	     cmd == PPPIOCATTACH ||
+	     cmd == PPPIOCATTCHAN) &&
+	    !ns_capable(net->user_ns, CAP_NET_ADMIN))
+		return -EPERM;
+
 	switch (cmd) {
 	case PPPIOCNEWUNIT:
 		/* Create a new ppp unit */
-- 
2.43.0


