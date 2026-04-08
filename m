Return-Path: <linux-ppp+bounces-499-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFgPApPY1Wlo+gcAu9opvQ
	(envelope-from <linux-ppp+bounces-499-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Apr 2026 06:24:51 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1443B6BBE
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Apr 2026 06:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F5FC300B9C8
	for <lists+linux-ppp@lfdr.de>; Wed,  8 Apr 2026 04:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9678B342CB1;
	Wed,  8 Apr 2026 04:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGcnwAf3"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FBC40DFA0
	for <linux-ppp@vger.kernel.org>; Wed,  8 Apr 2026 04:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775622283; cv=none; b=utW4fIpF6Y0ofpqfHOHkV1vJX3o0eveB/cyyak0XC+pvpzHSaiUVzszAmiA7hiv1016lPKi2mhz5jaeEScNIFvKB3X5+L5F3dFn64yx2zdEg3nhKr/rlasgf55iX3Z1M6FRewb2bl4kEfI6f8Ty1GmqahgerEDs3E2v3FgCmTx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775622283; c=relaxed/simple;
	bh=GJKMVETSDrkUzIUb3FcAj0CzYf7hahpuCpzS1v8Qvl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cnzWaEWmCI+BUT/sCINh3M+qYvQ2MMGnx5VGtI+JlyF5kX1DbowjgwqH+hSHmVNkaQ5EPHayzn4xocAR0BdhzzerAW3aCjALY7S1Zpqm+yJb2NyRB8+04VxUS7+lWSI4+3Q8kFKDdazl3Xu9dg77JbaPVkpvarHsF5DyUHLgJUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGcnwAf3; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c74244dc0b3so3494404a12.2
        for <linux-ppp@vger.kernel.org>; Tue, 07 Apr 2026 21:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775622282; x=1776227082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eqmEdkwfgVOE9RljrpN82ejevmAUygMZ1xKqFBwMsdw=;
        b=HGcnwAf3//74eHRuCUrwE+p4ot9su5hRE/ViVwiaFp3Xa6qFcVLu+34n9RvsSMSqle
         8sA32ahnj/tQj2oO4Mq7iiATthkdF8eQB65eo9uRtTsxWjtdcbo5Co3+oqFKSwVwHvQa
         c9vYK+Mek51atFw8OrZsXCf743kXjHxqp/kpQva6lDSlMSVcWKLteWtRwOW0DFbnGOSj
         Xn96/QUvth6yRIbXAgZUO6T0XcvhMkuCACaZW6ZNx3HFr905e8GtCSxAGyvE1aNXQGJQ
         fkxQsW3HYd+VwDfPGEylIdYR1KK6J1EKXnLlNJNy7UCjpgDqWt4xyylVHBi6JlEZ9ei3
         mY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775622282; x=1776227082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqmEdkwfgVOE9RljrpN82ejevmAUygMZ1xKqFBwMsdw=;
        b=FDe2Gk7Ag5rQZFs0j0eVnYOW1RX/8KhcAfisOAEeyZVXC3HZXIp8ix1x4DFSVyQDjp
         Spt3Zgi5J6orjApCzz5Dyvl4IwUtL1vEG2qHkJW4rkF22/qhn5+N5cvBxH2yfZ1s/mwV
         miLK/EfpNjndHztWqyrHNyirnnpKilWyOk4NuJbFbazVGlE/TftQmK8m3Oi8ii9WiOgU
         ZosKjTbpbE3mXm8CfBY4KZe9wYvNbLPG18U2S3Iep1qWkGSbhND4HX+4Wr7bJTRdv9Yv
         cw9eti1X2DhUhRiJQ9+zVf25Panbk8NRJ/I7QBZovTdxkoZ+3IgC+Q3E8pU1D4dVJ6C5
         SU4A==
X-Gm-Message-State: AOJu0Yw+Mwaepsj7QBa3sweQdlzcqwcbvfJ1o41xpHbjeFQOveC0jiz9
	1/7rMgVoF1BMZottGd2wC5yz6T1InigxsMxWzxRgIWAcyMDqaw7CPCP8y5pD52jC
X-Gm-Gg: AeBDieusVLZKYIpTyrAMP1V/hQMigWY7RduXC8gp1NXSWhHfrZ/DJ8Tdt/QVOMywzRd
	PRPxt+nysq9S1Y1+xOos4Uwjfj4pD3BvEeDjbqu2OUQOhJG/QM7ErY2A/xlmLm6djPd2977EyTN
	HDTZvayp83mv5DJV5P+9UgaxG6QoA3K80wNuMUx1KjjgJyqR1b3oOue9Sc3o5g992dhLhTB9ZqT
	w8OnG5j2ANqSLEexO0ZtYD03EzDRU9NewXzvFJMwcmx2937mCVVdvCyeFCtQcnwVV73AuAwwHzn
	iFqrka68DSnwZhNefyxOdHJYIEIlsWXgLrVy35vwifRDgy0TDq79TrB3o4ytZ1Ri1v2A9+XB1Kr
	4grw/vPzUrg99gt/4DoACzPry+UYEgiGNKK92/ivDSdNIp+0ITkECxhV8unz/lA53g3BggWF5ir
	l7sRXEbfQJZzM6GbfBoYjuakdM733YWuakl72EdLwoTSnda8k7
X-Received: by 2002:a05:6a20:12cd:b0:398:a1ca:7a2a with SMTP id adf61e73a8af0-39f2f0ff7d9mr20959180637.48.1775622281575;
        Tue, 07 Apr 2026 21:24:41 -0700 (PDT)
Received: from dbdd95a60758.tailf10b76.ts.net ([220.83.29.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65812f4sm17363258a12.25.2026.04.07.21.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 21:24:40 -0700 (PDT)
From: Taegu Ha <hataegu0826@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-ppp@vger.kernel.org,
	qingfang.deng@linux.dev,
	gnault@redhat.com,
	jaco@uls.co.za,
	richardbgobert@gmail.com,
	ericwouds@gmail.com,
	Taegu Ha <hataegu0826@gmail.com>
Subject: [PATCH] ppp: require CAP_NET_ADMIN in target netns for unattached ioctls
Date: Wed,  8 Apr 2026 13:23:45 +0900
Message-ID: <20260408042345.1011-1-hataegu0826@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.dev,redhat.com,uls.co.za,gmail.com];
	TAGGED_FROM(0.00)[bounces-499-lists,linux-ppp=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1B1443B6BBE
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
Reported-by: Taegu Ha <hataegu0826@gmail.com>
Signed-off-by: Taegu Ha <hataegu0826@gmail.com>
---
 drivers/net/ppp/ppp_generic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index e9b41777be80..99a8557188c0 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1059,6 +1059,9 @@ static int ppp_unattached_ioctl(struct net *net, struct ppp_file *pf,
 
 	switch (cmd) {
 	case PPPIOCNEWUNIT:
+		if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
+			return -EPERM;
+
 		/* Create a new ppp unit */
 		if (get_user(unit, p))
 			break;
@@ -1073,6 +1076,9 @@ static int ppp_unattached_ioctl(struct net *net, struct ppp_file *pf,
 		break;
 
 	case PPPIOCATTACH:
+		if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
+			return -EPERM;
+
 		/* Attach to an existing ppp unit */
 		if (get_user(unit, p))
 			break;
@@ -1089,6 +1095,9 @@ static int ppp_unattached_ioctl(struct net *net, struct ppp_file *pf,
 		break;
 
 	case PPPIOCATTCHAN:
+		if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
+			return -EPERM;
+
 		if (get_user(unit, p))
 			break;
 		err = -ENXIO;
-- 
2.43.0


