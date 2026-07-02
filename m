Return-Path: <linux-ppp+bounces-612-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9tSLHp8ARmrgHgsAu9opvQ
	(envelope-from <linux-ppp+bounces-612-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Jul 2026 08:09:35 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF036F3B16
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Jul 2026 08:09:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=N5mH24OP;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-612-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-ppp+bounces-612-lists+linux-ppp=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A995F304D763
	for <lists+linux-ppp@lfdr.de>; Thu,  2 Jul 2026 06:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14D636F90C;
	Thu,  2 Jul 2026 06:04:29 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2E036F8E1;
	Thu,  2 Jul 2026 06:04:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972269; cv=none; b=Kk8ghTegQh/eYsimdZ3FUvPQDUxLZrSP5FUbN+vDsZaN+AGYeCaVhaHHXrOaKIkbFtu3KTdQeE9f0FZlrz7yvhj4z6aYQze/QBbEh0MaAKxE5k/TcRginyx+8sWi0fUGHKXl6ZPWLSPBFEGads0UZgPGYHynTon47eEPVU0a5CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972269; c=relaxed/simple;
	bh=MqwwRcnDNEpGOkNLc4FKOScxcGu1la5VJmsL8YrGeWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KkLSo0kfOpeV1zoF+UYdiw/3YYD/9HS6+MK1BAcd5jEBjsJtG0rZriQ8uYWj32l5VwhCKfuq1uUEYzT+gWBiml+OHdEfj+6f3js603C2yJqNjErq2uRL2oMP3+A/OtYX/y2RYMk1k+Qjp/NU1G4ZLRE5dbqyrmYhOtvevaRC1Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5mH24OP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD651F000E9;
	Thu,  2 Jul 2026 06:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782972264;
	bh=X/yx1aNzDDVIfUuAIyrB/O24EmFTN84NPUcrSMpCOXs=;
	h=From:To:Cc:Subject:Date;
	b=N5mH24OP9n73BW6cv05AYzqOse/F5qGJVU9szJTUweqhIAFXvIoXa2Ko/itkiemAq
	 LQMaiwsxYeccuMAedWP6QENrezjTpGbcOZ/fHFGUgc6KstTieINHQzypcWh9PT/vt6
	 EYVChAfLqu63bK4rZWF1PYAJHxaY6EDZ8ec/dM+1iGDAnFTjJyz9Cixs75Snhz49Rv
	 T+gw9Ir/pRTD/d4pQ1BtqVVFIgEuaJrf/365Pv1v37ALY4tAFs0cxnJLhGXNemUH79
	 UMjkFv3ImwGreqSH/yXXJYrIpqIxqZ5hapO29myNfQ4Zcmq/eQqJNf+YiD0CTLfIo8
	 O9KTFF4ItRdew==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: kuba@kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH] ppp/ppp_{async,synctty}: drop unused {a,}syncppp::bytes_{sent,rcvd}
Date: Thu,  2 Jul 2026 08:04:20 +0200
Message-ID: <20260702060420.95023-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-612-lists,linux-ppp=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jirislaby@kernel.org,linux-ppp@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:linux-kernel@vger.kernel.org,m:jirislaby@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:linux-ppp@vger.kernel.org,m:netdev@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jirislaby@kernel.org,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BEF036F3B16

The bytes_sent and bytes_rcvd members of structs asyncppp and syncppp
are not used. Drop them.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
Cc: linux-ppp@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/ppp/ppp_async.c   | 2 --
 drivers/net/ppp/ppp_synctty.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/net/ppp/ppp_async.c b/drivers/net/ppp/ppp_async.c
index 93a7b0f6c4e7..583426d06381 100644
--- a/drivers/net/ppp/ppp_async.c
+++ b/drivers/net/ppp/ppp_async.c
@@ -49,8 +49,6 @@ struct asyncppp {
 	unsigned long	xmit_flags;
 	u32		xaccm[8];
 	u32		raccm;
-	unsigned int	bytes_sent;
-	unsigned int	bytes_rcvd;
 
 	struct sk_buff	*tpkt;
 	int		tpkt_pos;
diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
index b7f243b416f8..0b1bd1635c39 100644
--- a/drivers/net/ppp/ppp_synctty.c
+++ b/drivers/net/ppp/ppp_synctty.c
@@ -59,8 +59,6 @@ struct syncppp {
 	unsigned long	xmit_flags;
 	u32		xaccm[8];
 	u32		raccm;
-	unsigned int	bytes_sent;
-	unsigned int	bytes_rcvd;
 
 	struct sk_buff	*tpkt;
 	unsigned long	last_xmit;
-- 
2.54.0


