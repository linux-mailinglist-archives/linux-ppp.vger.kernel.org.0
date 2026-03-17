Return-Path: <linux-ppp+bounces-421-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFWOBcTpuGlplgEAu9opvQ
	(envelope-from <linux-ppp+bounces-421-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 17 Mar 2026 06:42:28 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB83E2A40C9
	for <lists+linux-ppp@lfdr.de>; Tue, 17 Mar 2026 06:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E87F3042951
	for <lists+linux-ppp@lfdr.de>; Tue, 17 Mar 2026 05:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9ADC37F740;
	Tue, 17 Mar 2026 05:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdM7Lny4"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC3437F724
	for <linux-ppp@vger.kernel.org>; Tue, 17 Mar 2026 05:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773726112; cv=none; b=RFBn3z9+py84hXMm0opMD9ZeihvDcnnk6YPnukTs0Pu0Te3tCK7kjCrOlpS3h3c49wdt986mGHY1Sw4dkUu2SloRjzCOn02KS/1wJpwWMNwtzPMIlxAAB03AnJuSoh6Yo5DR0wt7Fqv60Ah0GzB8i7U7ja8C+JbOrvWp2sxJNa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773726112; c=relaxed/simple;
	bh=bltp3WJAylvLdfOQ5q+iE7Igpst4STCCh4hr4m1hx5E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=sBD9+nGbc4FGhGnmEJws5YnjgpEmV098UyHNl8GHY4kS6Z1K9x0IgrzyEbP7Z7vt+YBPC4RIK7QTD9oN1m4gOHix51H3+Bae0eZbHVYBx8x5oOXdBOnFrPHGcBiBESbInekFZrOxOxq3O0leDOjsd1zRobiWWeKJs7zpnAdNhsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdM7Lny4; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b97ba4c2be2so228804266b.1
        for <linux-ppp@vger.kernel.org>; Mon, 16 Mar 2026 22:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773726109; x=1774330909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/aseV1JohbHZtQxOSTDVIyaCJRT3wIWyomxb4YwbsJs=;
        b=XdM7Lny4kDM5mG8unAVNW/01cajvbi3iCjTsI9k25xzGVVUoaFwbKfY8MhSEh7yPu6
         OnLqcNNBGnVF1g8soXk1NXdO3W+VVQ+QsY+zeykMfD4dyKZvshTv/kv/dykVoKv1Qv25
         PuOscBnQffthI7f5Fd6816DUmIAhy0W279Q/WkYloqmfhgkJAAU3wNJXbYejZV+xWTqO
         JV1U+cKePKPXs03/xAlkAMwfmSAg/1W5ri+H/2rlZmuSAtnQXXRTocch5H9wKrnGOOTF
         lhihCQ6N30Qt5CmCpdPbvCsZjwayOq7gq7uuvVoLcaZdqaY24DaoOhDjWBjQOqcJh5DK
         nrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773726109; x=1774330909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aseV1JohbHZtQxOSTDVIyaCJRT3wIWyomxb4YwbsJs=;
        b=obXkVrTnijXcFl9cD2kf5kZk1R+3Dq6xzie6lYhFIzK7DmFvNsTT+a9gz3IJbuzrhc
         p9/bprdNquTqYz9gqS20ONLd8RzQAXI+0EP+SBUI9RiMvTHRYB8cQpmuyZF+5w2WM3Ke
         84fee2dtTBXsoYbWtBCNdXu0sHxNZ55h4dWWdCP4Xf5jNWKj/XCONUy6SRRjlvqtKFnB
         5gKo2HQxTJdLftE1s1jIVvKZmYI2WC+FaacJEMNGoW7H11OVRRZtIbFgWnLMM8Hj9RGu
         jWpstG89Ei0YLx7YAvRSLqf27PxLxfhmfiXF+aTwUiSbpokDr1xseBEejB6+TUqEwJsq
         Kb3w==
X-Gm-Message-State: AOJu0YyT/4C85gvd2C9H2BBiDZWssC8IoZgvT3UTeQKYInhXRyB8V/TR
	XZwcunEFJoasVx4Fv+RkhC6OID87AVjyGhEVgqNptDubphIqA24FB9QDRupT+vADuH8=
X-Gm-Gg: ATEYQzzwGyV1TzUYZfuq4qNAjMseoVFN1vh+HdXPn3/s8s2X2/GALBZ0etjbnc/SBzg
	ygozZrqYH/8139+DRT7dDCAhco84f4mlKPwVxARXu7AxoqN6w1KcTpUOUnh4MI1639niE8GMeVU
	vYYy2y380d379FOQWjjpnD5KUCEB934CJn34+QCTVdRFRmJS5BNDnn5P3on5DmQqgvF6ZtTj/9m
	rut/zAhGY+MvFAFabjGfEe0cuhZlgLaQMB0pAuhhXpWTBRwW6IRCjd7CP5VpVEc/Zg4i4SJCoNJ
	NcUsHpWnrkypI0QUeuD9Mz8CnWMWWV4uTgOHWR1D6lHiHLMGih/nPzJR4a8LpZdcn5lrMK30uZ7
	T/byBmhRZ45Of/wpo5VcuFiOGnHM0vFw4dq9DAVouS+N1PcWm14d6vx8PTUtn9N8QPYZ9jQC4E2
	2hSZtRK1Q=
X-Received: by 2002:a17:907:72c2:b0:b97:b20f:c5b2 with SMTP id a640c23a62f3a-b97b2100569mr440106766b.9.1773726108699;
        Mon, 16 Mar 2026 22:41:48 -0700 (PDT)
Received: from gmail.com ([2a09:bac1:5520::49b:49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cefca43sm687527566b.46.2026.03.16.22.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 22:41:47 -0700 (PDT)
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
Subject: [PATCH net-next v2] l2tp: ppp: use max L2TP header size for PPP channel hdrlen
Date: Tue, 17 Mar 2026 13:41:40 +0800
Message-ID: <20260317054141.524879-1-dqfext@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-421-lists,linux-ppp=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-ppp];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CB83E2A40C9
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

To avoid the unnecessary reallocations, set chan.hdrlen to
PPPOL2TP_L2TP_HDR_SIZE_SEQ (10) unconditionally at registration and
remove the ineffective update in the setsockopt callback.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
v2: rebase to net-next and drop fixes tag
 - https://lore.kernel.org/netdev/20260313034732.209792-1-dqfext@gmail.com/

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


