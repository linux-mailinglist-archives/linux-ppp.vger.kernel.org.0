Return-Path: <linux-ppp+bounces-416-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UElrN+GIs2kTXwAAu9opvQ
	(envelope-from <linux-ppp+bounces-416-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Mar 2026 04:47:45 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8591827D344
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Mar 2026 04:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8293B302E10C
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Mar 2026 03:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E440364946;
	Fri, 13 Mar 2026 03:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIxO6L4v"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A202F31B131
	for <linux-ppp@vger.kernel.org>; Fri, 13 Mar 2026 03:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773373662; cv=none; b=Sp4am19XL+RZuigstjNAMlNDb7AOws2vhlZAEhfc/+RYTWfuXD5O69N5dztWFrg8hmy8bYykbF014FsjUGICICuTlW6jpGb+KJjQgM5G3n6gtysWV+ggo09nuyl4IlQ7sav8g/qWYZZCobs14ee2Pwhx/9hogBwlKC1tU35qCb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773373662; c=relaxed/simple;
	bh=/4gcq8LShB8D0c5s2jFOvaAMKwtDoLawyFz3nOQjuLU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=WKVvwKbnQ4u7Yw+pH2zwuFadmfPN1GF79J2/RKTatSvbkwrSQaXyCda68klGexj6OHMfSodmZpRq91vYqD6n9mBOhq6mBXID83QtwvC/v6x2C1rxZybBcEYVYQhSnPsXxLxMdgUIqBT8nXeSPjFz+5e3njo6DP2OYxHRS/vingE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIxO6L4v; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6631e0edcf1so2511123a12.1
        for <linux-ppp@vger.kernel.org>; Thu, 12 Mar 2026 20:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773373660; x=1773978460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=INglkRyjzET0z5aJCRl/lBzILAwHGEvu+nMDhJsrwlg=;
        b=VIxO6L4vyy3roWMrX2etPjhzkvIe9/K98Yo3iA/gQSQwVzuoOA6JD+dOOVaViStjge
         kedSqrEK3qiY+blXlZHfzrapJZGoNvb/QCXeQ30fDXZYh0e66+mIBxMqKMwOuPemGK3W
         mWcsCEyIpauB+8GX+mCeiCfzOLy+6dsNWhTIuKBFEMDt9zFIGkJDSn2eHXNpd9fY3UXN
         clFMruJEsFSu1a0zMDqxSZ/bxKmrO3R/TmPYW7UBKTquuwzTegbuU7iXuixYGS3W/dxH
         xh6JiYQ2p2hul0CAyOJLlhYpXANYsxWO+MmF66Cip/PuXzLDrSHVEyUUl3yQjMAK29GG
         dDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773373660; x=1773978460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INglkRyjzET0z5aJCRl/lBzILAwHGEvu+nMDhJsrwlg=;
        b=GRyOLtX1M7qtuOjtbZoGVXV/AE65wGGuDcDVVQ5M+8SQ8V15CXxkH9FiZed5GsN5ZQ
         H19AaKjkn93oLxUfXExxh5IkxA1yUswYLgqG1EcjpoY2ddwwd7WxqRe5qGmc8hPkBIGz
         Wfg2HWtxPu3rphDXYiLCID5D1IqQrbHgl4z5kGLyTOLdrEmynqdvL745IGG/99XSRKKk
         qnsOo93DpcnwARA/2eIVb7slz8kN88MAaNNpgVhsZ5IY/gHtvjmRBsqYeX31ssY38YDl
         8rf6haPJLS/+9AJ0Sc3CIk7d2Cd8wdK3ZB9LbrtsQ60/HJZF/LUzG5j25yVwRpE2swxw
         CPuQ==
X-Gm-Message-State: AOJu0YwElycuMMoemhMsxO1PuDAVBHBacv2rotjHwHUeBImoZeCoE22J
	q1eubtM/eT2q37v6NQcWWXIFYc9JJNL4N0MMOFnHndGRDDpb/C/Pbqr3OStkVTWABbZ3dw==
X-Gm-Gg: ATEYQzwJHsiu5ncLA2ntA0fmPjrWD2Ah9Jk7fmIqda1ABjQ0j4Rn729FV8sT1z9jHGj
	ohDsp5PUJtTLQS8+pSXDoaiwj/X0gjjmhyhZLdg54O+iV27PW/9Uo0RRLt3s+sMVtXdGHgBznm5
	f301Eoeb7K6UZg764eHlRRRKO20Y326Zd6t7EVT7sMKnjaagOlFvAbPppBGxY6dDY73zsW556Kc
	yHqbKmHxVwSBP/4MXU2puAzR0P03fFP9czluNVKIAhmbmBG6JOkWyvkhLRbW43A0PzBeeu5t6Hl
	cW+m6Mzk/EONyYF+TuxUCLE7BIr0SBo72HjuqooHncf62cv8WpfEQHR6Xd9s7emW5//GYb1g5vg
	AX/lu3YSpSGJOfKJQirUmIXaFaZSQ9+3DIlzWr7+LNm9MRE6TXnaxwIlGx93QsYhuM7/TQcuBZ8
	9YtPE=
X-Received: by 2002:a05:6402:1ec8:b0:660:eabc:9c70 with SMTP id 4fb4d7f45d1cf-663bac0452amr977150a12.29.1773373659478;
        Thu, 12 Mar 2026 20:47:39 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:4e25:2e3c::49b:47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6635088ffb8sm924271a12.22.2026.03.12.20.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 20:47:39 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: linux-ppp@vger.kernel.org,
	James Chapman <jchapman@katalix.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] l2tp: ppp: use max L2TP header size for PPP channel hdrlen
Date: Fri, 13 Mar 2026 11:47:31 +0800
Message-ID: <20260313034732.209792-1-dqfext@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-416-lists,linux-ppp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-ppp];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 8591827D344
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

chan.hdrlen is read once at channel registration by
ppp_register_net_channel(), and used to set the PPP net device's
hard_header_len. It was set to PPPOL2TP_L2TP_HDR_SIZE_NOSEQ (6), which
is 4 bytes too small if sequence numbers are later enabled via
setsockopt(PPPOL2TP_SO_SENDSEQ), causing unnecessary skb reallocations
on the TX path.

The setsockopt handler attempted to change netdev's hard_header_len by
updating chan.hdrlen, but the PPP layer never re-reads it after the
registration, so the update had no effect.

Set chan.hdrlen to PPPOL2TP_L2TP_HDR_SIZE_SEQ (10) unconditionally at
registration and remove the ineffective update in setsockopt.

Fixes: 3557baabf280 ("[L2TP]: PPP over L2TP driver core")
Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 net/l2tp/l2tp_ppp.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/net/l2tp/l2tp_ppp.c b/net/l2tp/l2tp_ppp.c
index ae4543d5597b..99d6582f41de 100644
--- a/net/l2tp/l2tp_ppp.c
+++ b/net/l2tp/l2tp_ppp.c
@@ -787,11 +787,12 @@ static int pppol2tp_connect(struct socket *sock, struct sockaddr_unsized *userva
 		goto out_no_ppp;
 	}
 
-	/* The only header we need to worry about is the L2TP
-	 * header. This size is different depending on whether
-	 * sequence numbers are enabled for the data channel.
+	/* Reserve enough headroom for the L2TP header with sequence numbers,
+	 * which is the largest possible. This is used by the PPP layer to set
+	 * the net device's hard_header_len at registration, which must be
+	 * sufficient regardless of whether sequence numbers are enabled later.
 	 */
-	po->chan.hdrlen = PPPOL2TP_L2TP_HDR_SIZE_NOSEQ;
+	po->chan.hdrlen = PPPOL2TP_L2TP_HDR_SIZE_SEQ;
 
 	po->chan.private = sk;
 	po->chan.ops	 = &pppol2tp_chan_ops;
@@ -1176,12 +1177,6 @@ static int pppol2tp_session_setsockopt(struct sock *sk,
 			break;
 		}
 		session->send_seq = !!val;
-		{
-			struct pppox_sock *po = pppox_sk(sk);
-
-			po->chan.hdrlen = val ? PPPOL2TP_L2TP_HDR_SIZE_SEQ :
-				PPPOL2TP_L2TP_HDR_SIZE_NOSEQ;
-		}
 		l2tp_session_set_header_len(session, session->tunnel->version,
 					    session->tunnel->encap);
 		break;
-- 
2.43.0


