Return-Path: <linux-ppp+bounces-619-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ce+9FBiQS2pMVgEAu9opvQ
	(envelope-from <linux-ppp+bounces-619-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Mon, 06 Jul 2026 13:23:04 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A01EF70FC95
	for <lists+linux-ppp@lfdr.de>; Mon, 06 Jul 2026 13:23:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=doyensec.com header.s=google header.b=U7p+OBTS;
	dmarc=pass (policy=none) header.from=doyensec.com;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-619-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-ppp+bounces-619-lists+linux-ppp=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F27132F744B
	for <lists+linux-ppp@lfdr.de>; Mon,  6 Jul 2026 09:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E414DBD90;
	Mon,  6 Jul 2026 09:02:24 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A89A3BE141
	for <linux-ppp@vger.kernel.org>; Mon,  6 Jul 2026 09:02:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328541; cv=none; b=YFHTY/CqZHPOTdrJZy0B8MG9cm/oPUktrx4XWPtVVFSGnTFO4mPSNML6RMqrjLIp3zLdL6ydCcM2MylrtqjBoD238BRbtvlF86IgOAg7ehBomSMbNhWxUi+c2fd2zDrx8YWEjdiUhhbsd4MBHPolgceXUqsK4nwDr/bjaUFMEho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328541; c=relaxed/simple;
	bh=FPDS8SzxMDN7BC+VZirCfNYEJEl/Cp+LwW+o/iirn5Y=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=p3BaBlvz8FONtIamJyNKYwimqZzy8QhNtBnnbCcN4k6DKelFNvJEtDVyWs/2eqTh0JcMBZ86vyaKRPXyPn1mNLC/oW/ixm868VzGlYswxKgkm/BJCWZLbfkCGO1pwSURPomoabCL7iF/yhpUS3g+ZSbLTBuqhq8G1zO+nx5MTm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=U7p+OBTS; arc=none smtp.client-ip=209.85.208.66
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so5182746a12.2
        for <linux-ppp@vger.kernel.org>; Mon, 06 Jul 2026 02:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1783328532; x=1783933332; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vlg5/CIMTARyHAvCyfNYVePTfJJIQJU+BNy2ERr/7DU=;
        b=U7p+OBTSbTMT6y2J0pHAT4/Q4ZuWK9vpYlWAU2u1KHzntmArItrsmLEkqFu0/LdcR2
         hin3ESthrADJXSgykdwS2R5C/0OUz+PMPow1t/TnlWrKB73sSUCiynKYCUnRDYPHn/W3
         u+NrClEe1+XFqgKs3qYKhUUHB62dQ6W4+v35rc2+fiEMSEzQQ5JkLZSrRLfK9tz5OiTa
         0el3MjfHNsOaI2v18B+deEsvnWuSIwJY5bh380vzZfioTkwnSywPxke7UfvqooXOX/MM
         3BOxTY8GJOJ7uYPb2ztwDF0q/xEE2cYtdYLAPhki68oM2pr7ABav4rV99nYW+42OBy8u
         U07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328532; x=1783933332;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vlg5/CIMTARyHAvCyfNYVePTfJJIQJU+BNy2ERr/7DU=;
        b=aicVnSERXz+Hlk6fCy9uZ2ti1a8d4zvzSlC/zl5gIqsvyk4OYCxUSDp3/Ao50i8Ud+
         VoBEXc0PBWf6F2D+E50YkQxtYPYYaHVV+9jElXMFvuGHl/dnXrb5Vz8gzPY+xkDAGKaj
         BeuU3Fy75JuQDgjKi8RNJSL8t1ElCJJ9c0zKk2N3DZ/OrqAha5oBeWik5hgmj6iQJTBZ
         UnJ4l/w7zrjHmsXZSInyANO9GkjfSt0w+zOLOA7G4sy8sYy3plrSstnrmZ7i5TQk4TBb
         543RZsIzq17wkBtpyLmz9xgEBvcPno3zJHRBrugoPSidc7SY7zRAkOFhKWUNGrVjwQZo
         ClHg==
X-Forwarded-Encrypted: i=1; AHgh+RqVsj08NWz87FOiib0jxBt+PjF96jJr4p2XqqB6PJNngGRnR5nMqTesXoBL0JI6u95jNQLkfElMUNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfJPYNUxTICpHz4HQM/Bqu/nDvwSYdMiBIqYS+lnBxoHUx79tL
	X/k3lJ5rdBLrXmPOJUhHsPbpOgufIxNK2MZ4LcpSYTiZ+UX+swpszoxMcv93iQXiL9k=
X-Gm-Gg: AfdE7ckTzaCZFTXMVV+nLDiMuRDGXBd3XjAnJACFoA5y2F5Wkei3i4o5Kl6m+QaC6iR
	wYYhjrlsiUuH9gOicNsq+N4zhLybz+zqCMypemWcmRb2hupkPNHk37/WmEYnk6i067Pe/wmqvaI
	tmhRYK0RfaRfSdSenOudmgsqd87swfu+orUmV7Vl6dnwlvnDFQLgSdvG0wXYLIFJMUORNrgDJ21
	0W94gD5OfxyIjBNsOglNz0cSkvT/azSsqVFAKqCSTbR1M4xx1hCrNl5rnpRRt7GtNA+CWnKjaHt
	VdWgeKu+oGCrzlS+uxvOrff+swGkUCy0m4CmfkN7WGl4wqA5cTNW2e8fx3IVreRYjLHojvxJ8Ek
	Wtvx4KNM4qtTFHPcvCpjebmK/lsFcxOZ51eSY4a6x50fXJ54sE44ivDptZ0FU3rOu84w2sSIlAZ
	daImT684JY5Ic2DbOta6YjiV42WaSmwoMHY0etIVFA4bF61kclMLukqutO5ncI7G1RVBRTujE6g
	tMyzYhFCY6J6xlUByXhhLK0QwdoCWmwpMBLZ1OBEIny2jj9MnDpTVE=
X-Received: by 2002:a17:907:3f9f:b0:bf1:a59e:653f with SMTP id a640c23a62f3a-c12e6a88ac3mr383827666b.28.1783328531357;
        Mon, 06 Jul 2026 02:02:11 -0700 (PDT)
Received: from smtpclient.apple (83.10.35.57.ipv4.supernova.orange.pl. [83.10.35.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c779dsm684272366b.53.2026.07.06.02.02.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:02:10 -0700 (PDT)
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
Subject: [PATCH net v3] ppp: defer channel free to an RCU grace period to fix
 pppol2tp RX UAF
Message-Id: <E793FCF2-58DE-4387-A983-C7B4BC3158BD@doyensec.com>
Date: Mon, 6 Jul 2026 11:01:59 +0200
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Qingfang Deng <qingfang.deng@linux.dev>,
 Yue Haibing <yuehaibing@huawei.com>,
 Guillaume Nault <gnault@redhat.com>,
 Kees Cook <kees@kernel.org>,
 Taegu Ha <hataegu0826@gmail.com>,
 linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 gnault@redhat.com
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
	TAGGED_FROM(0.00)[bounces-619-lists,linux-ppp=lfdr.de];
	FORGED_SENDER(0.00)[norbert@doyensec.com,linux-ppp@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:qingfang.deng@linux.dev,m:yuehaibing@huawei.com,m:gnault@redhat.com,m:kees@kernel.org,m:hataegu0826@gmail.com,m:linux-ppp@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linux.dev,huawei.com,gmail.com,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,doyensec.com:from_mime,doyensec.com:email,doyensec.com:mid,doyensec.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A01EF70FC95

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
v3:=20
- Added rcu_barrier() at the end of ppp_cleanup() to ensure all
  ppp_release_channel_free() callbacks complete before the module's
  text segment is unloaded (Documentation/RCU/rcubarrier.rst).
v2: =
https://lore.kernel.org/linux-ppp/D9C0245B-608B-4884-8A09-F55BA4A9F948@doy=
ensec.com/
- Moved skb_queue_purge() to a dedicated RCU callback to prevent leaking
  skbs added by an in-flight ppp_input() during the grace period =
(Sebastian).
- Retained call_rcu() to avoid introducing synchronous multi-millisecond
  latency into the teardown path.
v1: =
https://lore.kernel.org/netdev/C954A7EA-AA98-4E3C-80B5-42C34B3183A3@doyens=
ec.com/

 drivers/net/ppp/ppp_generic.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c =
b/drivers/net/ppp/ppp_generic.c
index 57c68efa5ff8..717c1d3aa953 100644
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
@@ -3596,6 +3607,7 @@ static void __exit ppp_cleanup(void)
 	device_destroy(&ppp_class, MKDEV(PPP_MAJOR, 0));
 	class_unregister(&ppp_class);
 	unregister_pernet_device(&ppp_net_ops);
+	rcu_barrier(); /* wait for RCU callbacks before module unload */
 }
=20
 /*
--=20
2.55.0=

