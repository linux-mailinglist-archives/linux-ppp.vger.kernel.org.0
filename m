Return-Path: <linux-ppp+bounces-604-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JfODDTMXQWqckwkAu9opvQ
	(envelope-from <linux-ppp+bounces-604-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Sun, 28 Jun 2026 14:44:35 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 804DA6D3D46
	for <lists+linux-ppp@lfdr.de>; Sun, 28 Jun 2026 14:44:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=doyensec.com header.s=google header.b=DAmu0AcP;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-604-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-ppp+bounces-604-lists+linux-ppp=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=doyensec.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 431A8300950E
	for <lists+linux-ppp@lfdr.de>; Sun, 28 Jun 2026 12:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5AE03A6B61;
	Sun, 28 Jun 2026 12:44:32 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7983A4F4B
	for <linux-ppp@vger.kernel.org>; Sun, 28 Jun 2026 12:44:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782650672; cv=none; b=Enav5pFGHf6AhqxHcKtk0HWCsck4rpzacxkWrTB629dna0VOna9RObwhWoFVhZQo5ZPk4cYyyE/1Iskphtbi4DrnxBhruxoRIOnXZ4BOtlDQ9dbmFEsDTInd901KAhCVMtcobgEq/fonDtIsE79iQ1oSdggzGNzjQjEox7NW9Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782650672; c=relaxed/simple;
	bh=IPjEHzSTdwyloWctFDPS+6k8OmXJDIPZjH823U/Xxe4=;
	h=From:Content-Type:Mime-Version:Date:Subject:Cc:To:Message-Id; b=aiV1myQWy3/N2Rp4FALGEe6S78m0Fnm5XTWX2V+JfoErca3WApoG2gEsma8usCkC6dcB3XYzPlGwuTKK9TKst0jgHMyEVKE6t6zpbUGCXg4Scy5Q4z/EiTyHyY22Lg6onwM6/c+bLC/cFCfdEQp8WIIvBTEIQZWw9D4UPfNV63w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=DAmu0AcP; arc=none smtp.client-ip=209.85.218.44
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c122e4590c6so217088066b.1
        for <linux-ppp@vger.kernel.org>; Sun, 28 Jun 2026 05:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1782650669; x=1783255469; darn=vger.kernel.org;
        h=message-id:to:cc:subject:date:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/PKxXDyIAMOlaR096tTQhy4xjIPnfe/Wjks8AZRapc=;
        b=DAmu0AcPWloxuKqJtRQnPW/tMGJS9i2Ncu31u2qdHf3JVsP5zNHXsjC3Et43dHgKNQ
         0F36FVeSY7ZpWVLZSYDAgYKuKm/Fkm1Ut6pDEfuCr2okx+zsH8elBelPAT0xls5pecXF
         6d29Q6o7n7azAiwQDsc6pS4EMHEOme37233fnGzz95GWt4p3oELxVutxYLR/EWQpNYlw
         a1+Y1WTQhSfOaLFeJKk8BzI7wo5TDtvZz91Kh8hWm1gysJKZp4uGb7hBhnNH0Rm4bAdF
         tqa0qsPfZytGp48nNpgayH7OzZ17XRVVIGO9gsdChID6Khnzuva4cGD2kuef6z0MytSu
         UFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782650669; x=1783255469;
        h=message-id:to:cc:subject:date:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z/PKxXDyIAMOlaR096tTQhy4xjIPnfe/Wjks8AZRapc=;
        b=Q9AYJcZnSV9DcJiKU4rsddyVQBnVbt5VBNrto+huF5+a8xxSm2MRWkxIzBVEJrIRpu
         RQV9FA3+wZuGCv6Cn+GIUhsywsBq7lB4bZi4Gqr42RceAmfvoGi2xhEbRMJ84LGxMSN1
         IZG1/Y8ZJ5C3ge+XSMz+XxPCXei5B6nZLXoXGzbKokvbZnvdXXEpH6f0kK/YgC85iuco
         d6vQMf0SAg5yQxCDumMhLBcsWoHL6yE/rFLIZo7kobiwLRbGls/hhJs0f2KWLNnECD6l
         +EwBjf2pTlwu5Ku2JxlYJ6THk4Nfy834aezp+bJx6tDn6TvvGuV+/OOnJkeVj5I7PFjv
         gmLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrASErdAdlUAGInBH349SVXlMRhds/RTyGT2Yqbg8Ovkmjtp2N80P2waFY2f4C/5fvB+tnpVFt6nqE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy97bkJrlziE03Oe+/m4eIHpshBw2vRbrhAPG0qGNEx1LMzrtzr
	JYDjX//3lp6RnEwlpdRbTUwJ8O75WDjMNpgkBvYN2nDbzpEhtphWtUH70eFGctGLiqY=
X-Gm-Gg: AfdE7cn8KgUrmKEnSWMbOANwUtYdjodumPZ+6JfyW3Sk5RTPd7VgKB1Hq21gjOvvWH9
	6fQbOH1v/B0rOwdP2iqMscGxD3FAhcOiBqELdOaGA8cD5IJtEwQ+8cGDep+Bayt0WYlANP53RDo
	ctvbUuL/g6smaNYetcU4eQKzDyaUMiNe8EIiDFed+1uE6CFdhNVyrmUxgLThitHXiE/qyg7COIX
	uxgnuKWX/rm1iUTtJapFkr8th9VkNfb86eWcwW3Be+V9+Xie2K+kqjNmPXTNMbeAU2L7rFYCSWd
	Q7l5cEHnHlM5/bO4VtcLVYgYy32VdX1fsy9+IgsdnrzQbmpYq2gfpf1u8n1EZqiWL/ZqJcLd5dV
	rw9aYhZ2SicdtBjPVTAcCgTR4gqT/fWeyn6Z+A2VarNGf2jeeR+64GJ0XX+m+X7xT6KbN6u8ZI3
	oNZwxoP0xOcjd/HviuOch5mxAXDUgV0ISDBHt6f9IQjXXxY+Y0A8rFbK8onaKxHR9EWATnwjs=
X-Received: by 2002:a17:907:720a:b0:c12:5a0e:3e0 with SMTP id a640c23a62f3a-c125a0e0aacmr87293766b.19.1782650669201;
        Sun, 28 Jun 2026 05:44:29 -0700 (PDT)
Received: from smtpclient.apple (83.10.35.68.ipv4.supernova.orange.pl. [83.10.35.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbc2c6a9sm625534066b.28.2026.06.28.05.44.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Jun 2026 05:44:28 -0700 (PDT)
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
Date: Sun, 28 Jun 2026 14:44:16 +0200
Subject: [PATCH net] ppp: fix use-after-free reads in the stats ioctls.
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 linux-ppp@vger.kernel.org,
 linux-kernel@vger.kernel.org
To: netdev@vger.kernel.org
Message-Id: <CF6F0CC7-C448-406B-8E24-2025AD585D18@doyensec.com>
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[doyensec.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[doyensec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-604-lists,linux-ppp=lfdr.de];
	FORGED_SENDER(0.00)[norbert@doyensec.com,linux-ppp@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-ppp@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[doyensec.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[norbert@doyensec.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 804DA6D3D46

ppp_get_stats() (SIOCGPPPSTATS) and the SIOCGPPPCSTATS handler, both
reached from ppp_net_siocdevprivate(), dereference state that other
ioctls free under the ppp lock, without taking it:

  - ppp_get_stats() reads ppp->vj; PPPIOCSMAXCID frees it with
    slhc_free() under ppp_lock().
  - SIOCGPPPCSTATS calls ->comp_stat()/->decomp_stat() on
    ppp->xc_state / ppp->rc_state; PPPIOCSCOMPRESS and ppp_ccp_closed()
    free those.

A concurrent stats ioctl can then read freed memory (slab-use-after-
free), and the freed contents are copied back to userspace. This is=20
reachable by a local user who has CAP_NET_ADMIN privileges and=20
read/write access to /dev/ppp.

Take the lock the freeing path holds around each access: the receive
lock in ppp_get_stats() (PPPIOCSMAXCID frees ppp->vj under ppp_lock(),
which includes it) and ppp_lock() around the SIOCGPPPCSTATS callbacks.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
 drivers/net/ppp/ppp_generic.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c =
b/drivers/net/ppp/ppp_generic.c
index 57c68efa5ff8..847c5e1793c8 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1505,10 +1505,13 @@ ppp_net_siocdevprivate(struct net_device *dev, =
struct ifreq *ifr,

 	case SIOCGPPPCSTATS:
 		memset(&cstats, 0, sizeof(cstats));
+		/* protect against PPPIOCSCOMPRESS/ppp_ccp_closed() =
freeing the state */
+		ppp_lock(ppp);
 		if (ppp->xc_state)
 			ppp->xcomp->comp_stat(ppp->xc_state, &cstats.c);
 		if (ppp->rc_state)
 			ppp->rcomp->decomp_stat(ppp->rc_state, =
&cstats.d);
+		ppp_unlock(ppp);
 		if (copy_to_user(addr, &cstats, sizeof(cstats)))
 			break;
 		err =3D 0;
@@ -3303,7 +3306,7 @@ find_compressor(int type)
 static void
 ppp_get_stats(struct ppp *ppp, struct ppp_stats *st)
 {
-	struct slcompress *vj =3D ppp->vj;
+	struct slcompress *vj;
 	int cpu;

 	memset(st, 0, sizeof(*st));
@@ -3323,8 +3326,14 @@ ppp_get_stats(struct ppp *ppp, struct ppp_stats =
*st)
 	}
 	st->p.ppp_ierrors =3D ppp->dev->stats.rx_errors;
 	st->p.ppp_oerrors =3D ppp->dev->stats.tx_errors;
-	if (!vj)
+
+	/* protect against PPPIOCSMAXCID freeing ppp->vj */
+	ppp_recv_lock(ppp);
+	vj =3D ppp->vj;
+	if (!vj) {
+		ppp_recv_unlock(ppp);
 		return;
+	}
 	st->vj.vjs_packets =3D vj->sls_o_compressed + =
vj->sls_o_uncompressed;
 	st->vj.vjs_compressed =3D vj->sls_o_compressed;
 	st->vj.vjs_searches =3D vj->sls_o_searches;
@@ -3333,6 +3342,7 @@ ppp_get_stats(struct ppp *ppp, struct ppp_stats =
*st)
 	st->vj.vjs_tossed =3D vj->sls_i_tossed;
 	st->vj.vjs_uncompressedin =3D vj->sls_i_uncompressed;
 	st->vj.vjs_compressedin =3D vj->sls_i_compressed;
+	ppp_recv_unlock(ppp);
 }

 /*
--
2.54.0=

