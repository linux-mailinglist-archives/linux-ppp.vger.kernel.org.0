Return-Path: <linux-ppp+bounces-611-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m861A5lYRWoe+woAu9opvQ
	(envelope-from <linux-ppp+bounces-611-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 01 Jul 2026 20:12:41 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 974606F0870
	for <lists+linux-ppp@lfdr.de>; Wed, 01 Jul 2026 20:12:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=doyensec.com header.s=google header.b=PvM9YUYK;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-611-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-ppp+bounces-611-lists+linux-ppp=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=doyensec.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E95DC30530F2
	for <lists+linux-ppp@lfdr.de>; Wed,  1 Jul 2026 18:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC764C6EE7;
	Wed,  1 Jul 2026 18:12:36 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ej2-f2.google.com (mail-ej2-f2.google.com [74.125.228.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E3C4C040F
	for <linux-ppp@vger.kernel.org>; Wed,  1 Jul 2026 18:12:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782929556; cv=none; b=INbqJ9MD2jH405MGO4F0RZvCY/aeHpOVRljpUh5kma+VWtLOS9iUinwc+AFIU5k3fWQJv0ZQJrJI2V2GYWes0WKshkVYTDOfISFGtkpvE4AFzZ4RaNaAbh2tbs6leyP9Na7GUvjzypbZvILE73YUbZi2MRSBEZteNixtFI5S9fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782929556; c=relaxed/simple;
	bh=/1yAh8GBDR233LTpfBg0ezKT8gqdt2ZcnWPhVi1DUhg=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=ENu1jYBHDrZF2s5Nk9wZmHvpZXFzJ0pxd8HDH7ii5yCF//S6j7i6LumEF3Xyi14kCtVR9b/ipr4nQRIhm/ly2PsvDG2oHPWusvM9/Yv7NugO+MbErX5+yLLRU3WlTl4Bw0xHX7jGLdyQQ5ijgYCETvqjgZ2Yt36bAj/kZhn210o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=PvM9YUYK; arc=none smtp.client-ip=74.125.228.130
Received: by mail-ej2-f2.google.com with SMTP id a640c23a62f3a-c127ca7b5b6so36170966b.1
        for <linux-ppp@vger.kernel.org>; Wed, 01 Jul 2026 11:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1782929554; x=1783534354; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2CFjtKSFMabkMab/8Wra001PVD5OGn/L4VHRmfqhng=;
        b=PvM9YUYKIVwpIC3TwrXMBs2Nx7CmPCh09VZBZ+FSqpClER7OeOg+r8X5HysGdGXDxk
         40MdI3+ieQJnkb5WFKLJ8kLkL+ShczZxL+HvyY7RfuIiOOMHQo791u2f9Fo7mjkhqoXM
         gCv5uUpDmBB3DtOFaWG/QYsK3AEoIxVFXawLMFjIIspoedJCUOYdgk1bp7M43Rd5/vCV
         BRQcRUEVvWRet5vtkBYzIgUrv3ezVyDCEk02ggt4iYb2pZ0x2+1ORlCy2UvW1xkkld6c
         sK79UgI25vLymU7ns2tcqRlSyJYjiCX2v6N8CoQHJ6s2LJ91ahfNfvQO/JfkCG0hMXeO
         0rhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782929554; x=1783534354;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p2CFjtKSFMabkMab/8Wra001PVD5OGn/L4VHRmfqhng=;
        b=SVhx29N+i87T2USrUidXpUet505MVmVHU7qJCB1vMkGHCtoo4i+dr7vpoO8lvp5TC1
         Ssa6+BaVa0VoPotDXKzd2zrDjZ5HtI4skIpMhNe+skc7TKZXKXmdo/VqcdnwBwxtpanI
         dAXZsuNmT9RsPoDI+XGTo4bR/lRRatpVTUKhCaA93Xj1/EimOfJGiox9K+PxocEJ2EoV
         pYcEPivs70IMcVX0uEIRz+JsYbm+StfzZEgwHMrRadmkV1/65MKW3R1S3x2aksNX+RN2
         kvsd4Na/VH6gTuyGvhz2VGlC9V0n4hT5wWgcwktubXl9sPYRPGHntOs+GMObdW8S9BZW
         IaCQ==
X-Forwarded-Encrypted: i=1; AHgh+RodTKW9pJ6Iu3dPrVRHcgB59PS2kVN9r+g5WAIyVyPxZx/mmmPqdj7pEY1rMnr1+az2Fq+1quGFOok=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfNH5o3re36FHkoe5FK3z6qbtviBzK845cjAXZw4B2Hka91d61
	lpi2vxXwyjrePwdmINkuT538Sd8zT+DrcUPLRp8AEAYDzXDgHPElodkwRxgH0cPPGeY=
X-Gm-Gg: AfdE7ck+WGUNl4mS15VbBw8gJ1ktOKCEGl4YaAQfEx15qWubbBP/khU0H5xOSVNqODs
	HPJKbQfqRaPtPgX1gIuXbRqdUihwru0lWWhbl6ELWjA26uIDVUY3YjWo9P9p3PYgEAsEA8gCK15
	y2DiOiTMj4bKFZEpUd7MUW5IxvT5TI6jcdKxqr6wwK0O95upa/Zni4IlnLaw02k/mXXG73xIyUx
	rfY5C6ZIDiC8bNyBQhrLaMydnUQHFCNjp/QwO93gk3tB8E/ujpRye0uV3/pUIWVU+kaFkRHraWi
	0cMlgG5znCOUaB8rIgsq01Dwlp6ZBaNY8b6UG0U8UnVpnnVgR8ZC9Rbb8IPR8VWHvP+ImfzWIeH
	abjdW9vTSSvUnvffALR+lfivV4nYrxBkzjsrUzq8C7SWMmo5jfM08HYWSNdlcDHPIV3HbUEmSZh
	aLVT1E3/bV0hwnYDHO1Csjo5SuoSgXoLrD6DH0JHOw5z5oIsNdlpfbf2Cw4OvC84wAVGy+jqzfe
	mPMTmP5jHYbxaN/3mJGw0b2nP6m8LW4MCc0cIQMZF/JNbAtVvaN9pU=
X-Received: by 2002:a17:907:e143:b0:c00:de33:a74f with SMTP id a640c23a62f3a-c12a9dbc269mr106926066b.25.1782929553494;
        Wed, 01 Jul 2026 11:12:33 -0700 (PDT)
Received: from smtpclient.apple (83.10.35.68.ipv4.supernova.orange.pl. [83.10.35.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628efefsm1051666b.32.2026.07.01.11.12.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Jul 2026 11:12:33 -0700 (PDT)
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
Subject: [PATCH net v2] ppp: defer channel free to an RCU grace period to fix
 pppol2tp RX UAF
Message-Id: <D9C0245B-608B-4884-8A09-F55BA4A9F948@doyensec.com>
Date: Wed, 1 Jul 2026 20:12:20 +0200
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Qingfang Deng <qingfang.deng@linux.dev>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Breno Leitao <leitao@debian.org>,
 Taegu Ha <hataegu0826@gmail.com>,
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linux.dev,linutronix.de,debian.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-611-lists,linux-ppp=lfdr.de];
	FORGED_SENDER(0.00)[norbert@doyensec.com,linux-ppp@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:qingfang.deng@linux.dev,m:bigeasy@linutronix.de,m:leitao@debian.org,m:hataegu0826@gmail.com,m:kees@kernel.org,m:linux-ppp@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[doyensec.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[norbert@doyensec.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 974606F0870

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

Defer the channel free to an RCU callback via call_rcu() so the grace
period fences any in-flight ppp_input(). The disconnect and unbridge
teardown paths already fence with synchronize_net()/synchronize_rcu();
call_rcu() does the same here without stalling the close() path.

Fixes: ee40fb2e1eb5 ("l2tp: protect sock pointer of struct =
pppol2tp_session with RCU")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
v2:
- Moved skb_queue_purge() to a dedicated RCU callback to prevent leaking
  skbs added by an in-flight ppp_input() during the grace period =
(Sebastian).
- Retained call_rcu() to avoid introducing synchronous multi-millisecond
  latency into the teardown path.
v1: =
https://lore.kernel.org/netdev/C954A7EA-AA98-4E3C-80B5-42C34B3183A3@doyens=
ec.com/

 drivers/net/ppp/ppp_generic.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c =
b/drivers/net/ppp/ppp_generic.c
index 57c68efa5ff8..2d57de77780f 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -184,6 +184,7 @@ struct channel {
 	struct list_head clist;		/* link in list of channels per =
unit */
 	spinlock_t	upl;		/* protects `ppp' and 'bridge' =
*/
 	struct channel __rcu *bridge;	/* "bridged" ppp channel */
+	struct rcu_head rcu;		/* for RCU-deferred free of the =
channel */
 #ifdef CONFIG_PPP_MULTILINK
 	u8		avail;		/* flag used in multilink stuff =
*/
 	u8		had_frag;	/* >=3D 1 fragments have been =
sent */
@@ -3562,6 +3563,18 @@ ppp_disconnect_channel(struct channel *pch)
 	return err;
 }
=20
+/* Purge after the grace period: a late ppp_input() may still queue an
+ * skb on pch->file.rq before the last RCU reader drains.
+ */
+static void ppp_release_channel_free(struct rcu_head *rcu)
+{
+	struct channel *pch =3D container_of(rcu, struct channel, rcu);
+
+	skb_queue_purge(&pch->file.xq);
+	skb_queue_purge(&pch->file.rq);
+	kfree(pch);
+}
+
 /*
  * Drop a reference to a ppp channel and free its memory if the =
refcount reaches
  * zero.
@@ -3581,9 +3594,7 @@ static void ppp_release_channel(struct channel =
*pch)
 		pr_err("ppp: destroying undead channel %p !\n", pch);
 		return;
 	}
-	skb_queue_purge(&pch->file.xq);
-	skb_queue_purge(&pch->file.rq);
-	kfree(pch);
+	call_rcu(&pch->rcu, ppp_release_channel_free);
 }
=20
 static void __exit ppp_cleanup(void)
--=20
2.54.0=

