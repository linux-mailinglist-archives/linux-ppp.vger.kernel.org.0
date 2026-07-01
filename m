Return-Path: <linux-ppp+bounces-606-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k/H+HOgFRWrW5AoAu9opvQ
	(envelope-from <linux-ppp+bounces-606-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 01 Jul 2026 14:19:52 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B42506ED240
	for <lists+linux-ppp@lfdr.de>; Wed, 01 Jul 2026 14:19:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=doyensec.com header.s=google header.b=NS5x2ez2;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-606-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-ppp+bounces-606-lists+linux-ppp=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=doyensec.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10F9E312690B
	for <lists+linux-ppp@lfdr.de>; Wed,  1 Jul 2026 12:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0290F43C05D;
	Wed,  1 Jul 2026 12:14:57 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1226480DCB
	for <linux-ppp@vger.kernel.org>; Wed,  1 Jul 2026 12:14:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908096; cv=none; b=TvxtPY03BTUjiM5PdndfSDlDotl8NLVVOBLnIDSIJFQsUSotNpM7xidVEMcqA+zdkydg8bMpszJcWOvpTsqAFebE8SJnSKQeHjtBEpiBNw85bXs4eRYQIkzgNxrtVDpV81Nz5tqfvCXjxxnahNShwUtfJnk73TmfFbFpVbH2tXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908096; c=relaxed/simple;
	bh=XQfDBrOpxqJvC4z3cP1uub6nk8+1HPUoMdvMzo6qDoY=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=hk4vNPwa334/KsuIBIgMwTiUCK4i2zmL4qy5AOwrlzMcZHr/jBe+RbJPlOrDziYNydyZXlOWKXKBYOLsd2CdoF9Vb+O5J58VNM0Kx7N++KACTHsDGfG5bCjZ7JkmYhlWekxQEdnVvkUSEHlnrrPvmFqwLteDh2axqAYEfFT9taM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=NS5x2ez2; arc=none smtp.client-ip=209.85.218.48
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c12788a75abso118194666b.2
        for <linux-ppp@vger.kernel.org>; Wed, 01 Jul 2026 05:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1782908093; x=1783512893; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCxR6sHZjR/sDxJZ6wuTaGYWiC2E9v8L6TCtUcqEsF0=;
        b=NS5x2ez2ZUpilU2FG1vXtp+JqbdPREwr9R6o9OHft7blLgee1+My8Ks0x+K/I5K2Kt
         85VM2yQrJ4xIPBZ9sBk58HkJY43QU2dXX26eTU+0sMjMagEgvYsl4QEm4URPY+v1Agxw
         Br0yYgk72zV/cyrC6Gxv1KJcDoN/DK5OmbZ/DzkoBlJjKnFrA1sjNaQnxC+tY4N4Wk7Q
         95HCpkxLYaIQ7no6Qg6YNOfWjEKZL1MMDbm4mlK5j1kCf3LzaizE64ttqGtNhaKfYo3L
         TWnc+aRa8MptdJHqfGaP1CmgG5C3yeeiss8m/Pgn5GBAOsiGU9Da02uuVcUzVyS79G3g
         3ziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782908093; x=1783512893;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eCxR6sHZjR/sDxJZ6wuTaGYWiC2E9v8L6TCtUcqEsF0=;
        b=PYgFaZFR1twjCRSklyzgKDD6dqeWjcITgPdWCjG3tzJWC7GGa3bbB6qi54l5J2k1t9
         OqLmjrRCgPbdpk1Sr2e3RB8LKh+X3Fk6aanb0VRLDmg7XlgJ6IxnxQfBcPOi+CVQmQzN
         KSUyxjw/hpQd38i2XxPraOaSjbljHIwhdFOk6W+S85Tqf66rQu+Cx8Nx9wtQXEIIoL9K
         ztHk+Abtbq/RRW1PgcTK98uGoNRacFA9c8PSvu37P2UWwpb0E2NFLjJFwltIL7dr5gOs
         iMdxpPMJm5DE4qTSjLUM+eedHSIesbFNtCutqGImoXYjzFe3RRJnsXTpRRy0U8I+Hgf3
         Q7XA==
X-Forwarded-Encrypted: i=1; AHgh+RrU541o5m3Jrf5V+d8/SAds4rpQBZQtvf2CtoTTreQWh6o7xsWIkwDoxHRq5a55fvb9/MioSmLl+KQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2gYRVBPO1JL6UYnGl5v1+kNtXBOmB+HTQiszRwvkxp0rs50W0
	PLxTkk6cJDKgdlazu/nnnBw8yEYtm7VnH97WGexfqt1BaCcLIurh/rAs6wBXDhYukDQ=
X-Gm-Gg: AfdE7cloqm8XmVKfZDM5TpRJAj5K0ivmY9rf1E7W5oYUQtFWuKYpgxru1uoM+8/11KJ
	NtewCXMPeQG1wQv5jNJ7TDy6RUrETDFd1167Vlj9dC3l/MgEA/0JNi9KbummOlL5bd28P8IbeAe
	ZACIczZec5j9HInALeXfV+fQ73ks/UoUpppQCtRLMDQ14hxQ2btm3MubmiJtXt2BXrLYKzb/yM4
	6NFytT6s7GXS1sCnCjND/GJvd7XLFw3wziiLqKy9BSyr8Ju8NdmPuT9GmXbcll2ypR7bw+BhNwE
	TO6EgIZodET+q3L2AxCwzDN1UTKSCNHUzPENmJHtts9P0BfKyVnZYfwxuVqLiF1wwnLc3UygDSN
	LnLw56+JrCXgGm61EFV0xazOiWYlNNYdwX1Zx7L6EYrmvVAmQRmOW8rYDHpBOOSzWI+ofVOc4L0
	N0k9Tpc0XghH/xKA8tV87PjkCW2xmjLilw0ZvjruEtmr27nntKTVtVJmf3cjkFcpJvghfXa5zoe
	OU5
X-Received: by 2002:a17:906:26db:b0:c12:2b6c:4fd2 with SMTP id a640c23a62f3a-c12ae52bec6mr24027066b.42.1782908092998;
        Wed, 01 Jul 2026 05:14:52 -0700 (PDT)
Received: from smtpclient.apple (83.10.35.68.ipv4.supernova.orange.pl. [83.10.35.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c9503f5sm2644061a12.20.2026.07.01.05.14.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Jul 2026 05:14:51 -0700 (PDT)
From: Norbert Szetei <norbert@doyensec.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: [PATCH net] ppp: defer channel free to an RCU grace period to fix
 pppol2tp RX UAF
Message-Id: <C954A7EA-AA98-4E3C-80B5-42C34B3183A3@doyensec.com>
Date: Wed, 1 Jul 2026 14:14:39 +0200
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Qingfang Deng <qingfang.deng@linux.dev>,
 Taegu Ha <hataegu0826@gmail.com>,
 Yue Haibing <yuehaibing@huawei.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Kees Cook <kees@kernel.org>,
 linux-ppp@vger.kernel.org,
 linux-kernel@vger.kernel.org
To: netdev@vger.kernel.org
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[doyensec.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[doyensec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-606-lists,linux-ppp=lfdr.de];
	FORGED_SENDER(0.00)[norbert@doyensec.com,linux-ppp@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:qingfang.deng@linux.dev,m:hataegu0826@gmail.com,m:yuehaibing@huawei.com,m:bigeasy@linutronix.de,m:kees@kernel.org,m:linux-ppp@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linux.dev,gmail.com,huawei.com,linutronix.de,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[norbert@doyensec.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[doyensec.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B42506ED240

pppol2tp_recv() runs in the L2TP UDP-encap softirq RX path:

 l2tp_udp_encap_recv() -> l2tp_recv_common() -> pppol2tp_recv()
   -> ppp_input(&po->chan)

It runs under rcu_read_lock() holding only an l2tp_session reference and
takes NO reference on the internal PPP channel (struct channel,
chan->ppp) that ppp_input() dereferences.

The pppox socket is SOCK_RCU_FREE, so 'po' and the embedded ppp_channel
are RCU-safe.  But the internal struct channel is a separate allocation
that ppp_release_channel() frees with a plain kfree():

 close(data socket) -> pppol2tp_release() -> pppox_unbind_sock()
   -> ppp_unregister_channel() -> ppp_release_channel() -> kfree(pch)

For a channel that is bound (PPPIOCGCHAN) but not attached to a ppp unit
(no PPPIOCCONNECT, pch->ppp =3D=3D NULL) and not bridged, teardown skips
both ppp_disconnect_channel()'s synchronize_net() and
ppp_unbridge_channels()'s synchronize_rcu(), so the kfree() has no grace
period.  rcu_read_lock() in pppol2tp_recv() does not protect against a
plain kfree(), so an in-flight ppp_input() on one CPU can dereference
the channel just freed by close() on another CPU.

The bug is reachable by an unprivileged user.

Free the channel with kfree_rcu() instead of kfree() so the grace period
fences any in-flight ppp_input(). Done in ppp_release_channel(), this
covers all callers in one place.

Fixes: ee40fb2e1eb5 ("l2tp: protect sock pointer of struct =
pppol2tp_session with RCU")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
 drivers/net/ppp/ppp_generic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ppp/ppp_generic.c =
b/drivers/net/ppp/ppp_generic.c
index 57c68efa5ff8..cb8fe37170d3 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -184,6 +184,7 @@ struct channel {
 	struct list_head clist;		/* link in list of channels per =
unit */
 	spinlock_t	upl;		/* protects `ppp' and 'bridge' =
*/
 	struct channel __rcu *bridge;	/* "bridged" ppp channel */
+	struct rcu_head	rcu;		/* for RCU-deferred free of the =
channel */
 #ifdef CONFIG_PPP_MULTILINK
 	u8		avail;		/* flag used in multilink stuff =
*/
 	u8		had_frag;	/* >=3D 1 fragments have been =
sent */
@@ -3583,7 +3584,7 @@ static void ppp_release_channel(struct channel =
*pch)
 	}
 	skb_queue_purge(&pch->file.xq);
 	skb_queue_purge(&pch->file.rq);
-	kfree(pch);
+	kfree_rcu(pch, rcu);
 }
=20
 static void __exit ppp_cleanup(void)
--=20
2.54.0=

