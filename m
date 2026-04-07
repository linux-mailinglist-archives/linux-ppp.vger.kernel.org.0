Return-Path: <linux-ppp+bounces-492-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLEXDzXS1GlJxwcAu9opvQ
	(envelope-from <linux-ppp+bounces-492-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 07 Apr 2026 11:45:25 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 961143AC403
	for <lists+linux-ppp@lfdr.de>; Tue, 07 Apr 2026 11:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A95033079BAE
	for <lists+linux-ppp@lfdr.de>; Tue,  7 Apr 2026 09:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BB53A6EE0;
	Tue,  7 Apr 2026 09:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tlxrsy9P"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849F23A5E9F
	for <linux-ppp@vger.kernel.org>; Tue,  7 Apr 2026 09:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554890; cv=none; b=KIsbGdtg3JCBqzZnf1hqn2Q9c+qYYgSfExh3x0Rnvxn4mWWxozgcGivy7b8LgQrFXhd+kgwaVHsQeoVRu7vJOnfqzZl96ytjhfqoB9WxEv+3hVoDcNRdBQ5smfkEBZ1S9NcuLemfYFOzXf1McGuVC1cA8hVASZtQK+8Rkp0y2qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554890; c=relaxed/simple;
	bh=KgpkJhlN1z1QlMZqVAxt43YkPZ+vTw1jPiMOtNbAUsA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=a4SVILxr7EUiYDxdp/cM9FNZfumYG1F3r0OvBYYFLXUUKHjs37na5DUjBcxtdj7pXSFMCwB/WKOygFMoyKvNGBwH2HDtutOOqwVlK9RlDQkh7Fim78u2pgzxB/AfskctqXtEi6Uc0qO2qTkeS4wCSS3SI9u3o2Maoz5P7ma8yII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tlxrsy9P; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775554876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5joibMANCykBiLgKj2c6T79xsF0pUdONomREytFFN/E=;
	b=tlxrsy9PvC8ry2AFC2uiBSAP+k5vcwW+UxYKkBy6y2cobEAVGlO3Tgnojx0JglNk8ioIKP
	H3tj64pbA+nwEkosOdHh0+c1QPtiXtnPmHNpIHUyrJFf5+0T85KugehlJ8TSzbsDPofQQL
	rrSqNWfrzCDa+2FGnn6OXlF7DJMY7x8=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Kees Cook <kees@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] ppp: consolidate refcount decrements
Date: Tue,  7 Apr 2026 17:40:56 +0800
Message-ID: <20260407094058.257246-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	TAGGED_FROM(0.00)[bounces-492-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,91.218.175.170:received];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 961143AC403
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ppp_destroy_{channel,interface} are always called after
refcount_dec_and_test().

To reduce boilerplate code, consolidate the decrements by moving them
into the two functions. To reflect this change in semantics, rename the
functions to ppp_release_*.

Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 drivers/net/ppp/ppp_generic.c | 61 ++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index cb29a6968c63..b097d1b38ac9 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -286,12 +286,12 @@ static struct compressor *find_compressor(int type);
 static void ppp_get_stats(struct ppp *ppp, struct ppp_stats *st);
 static int ppp_create_interface(struct net *net, struct file *file, int *unit);
 static void init_ppp_file(struct ppp_file *pf, int kind);
-static void ppp_destroy_interface(struct ppp *ppp);
+static void ppp_release_interface(struct ppp *ppp);
 static struct ppp *ppp_find_unit(struct ppp_net *pn, int unit);
 static struct channel *ppp_find_channel(struct ppp_net *pn, int unit);
 static int ppp_connect_channel(struct channel *pch, int unit);
 static int ppp_disconnect_channel(struct channel *pch);
-static void ppp_destroy_channel(struct channel *pch);
+static void ppp_release_channel(struct channel *pch);
 static int unit_get(struct idr *p, void *ptr, int min);
 static int unit_set(struct idr *p, void *ptr, int n);
 static void unit_put(struct idr *p, int n);
@@ -407,22 +407,18 @@ static int ppp_release(struct inode *unused, struct file *file)
 
 	if (pf) {
 		file->private_data = NULL;
-		if (pf->kind == INTERFACE) {
+		switch (pf->kind) {
+		case INTERFACE:
 			ppp = PF_TO_PPP(pf);
 			rtnl_lock();
 			if (file == ppp->owner)
 				unregister_netdevice(ppp->dev);
 			rtnl_unlock();
-		}
-		if (refcount_dec_and_test(&pf->refcnt)) {
-			switch (pf->kind) {
-			case INTERFACE:
-				ppp_destroy_interface(PF_TO_PPP(pf));
-				break;
-			case CHANNEL:
-				ppp_destroy_channel(PF_TO_CHANNEL(pf));
-				break;
-			}
+			ppp_release_interface(ppp);
+			break;
+		case CHANNEL:
+			ppp_release_channel(PF_TO_CHANNEL(pf));
+			break;
 		}
 	}
 	return 0;
@@ -675,8 +671,7 @@ static int ppp_bridge_channels(struct channel *pch, struct channel *pchb)
 	synchronize_rcu();
 
 	if (pchb)
-		if (refcount_dec_and_test(&pchb->file.refcnt))
-			ppp_destroy_channel(pchb);
+		ppp_release_channel(pchb);
 
 	return -EALREADY;
 }
@@ -708,11 +703,9 @@ static int ppp_unbridge_channels(struct channel *pch)
 	synchronize_rcu();
 
 	if (pchbb == pch)
-		if (refcount_dec_and_test(&pch->file.refcnt))
-			ppp_destroy_channel(pch);
+		ppp_release_channel(pch);
 
-	if (refcount_dec_and_test(&pchb->file.refcnt))
-		ppp_destroy_channel(pchb);
+	ppp_release_channel(pchb);
 
 	return 0;
 }
@@ -786,8 +779,7 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 				break;
 			err = ppp_bridge_channels(pch, pchb);
 			/* Drop earlier refcount now bridge establishment is complete */
-			if (refcount_dec_and_test(&pchb->file.refcnt))
-				ppp_destroy_channel(pchb);
+			ppp_release_channel(pchb);
 			break;
 
 		case PPPIOCUNBRIDGECHAN:
@@ -1584,8 +1576,7 @@ static void ppp_dev_priv_destructor(struct net_device *dev)
 	struct ppp *ppp;
 
 	ppp = netdev_priv(dev);
-	if (refcount_dec_and_test(&ppp->file.refcnt))
-		ppp_destroy_interface(ppp);
+	ppp_release_interface(ppp);
 }
 
 static int ppp_fill_forward_path(struct net_device_path_ctx *ctx,
@@ -3022,8 +3013,7 @@ ppp_unregister_channel(struct ppp_channel *chan)
 	pch->file.dead = 1;
 	wake_up_interruptible(&pch->file.rwait);
 
-	if (refcount_dec_and_test(&pch->file.refcnt))
-		ppp_destroy_channel(pch);
+	ppp_release_channel(pch);
 }
 
 /*
@@ -3404,12 +3394,14 @@ init_ppp_file(struct ppp_file *pf, int kind)
 }
 
 /*
- * Free the memory used by a ppp unit.  This is only called once
- * there are no channels connected to the unit and no file structs
- * that reference the unit.
+ * Drop a reference to a ppp unit and free its memory if the refcount reaches
+ * zero.
  */
-static void ppp_destroy_interface(struct ppp *ppp)
+static void ppp_release_interface(struct ppp *ppp)
 {
+	if (!refcount_dec_and_test(&ppp->file.refcnt))
+		return;
+
 	atomic_dec(&ppp_unit_count);
 
 	if (!ppp->file.dead || ppp->n_channels) {
@@ -3561,18 +3553,21 @@ ppp_disconnect_channel(struct channel *pch)
 			wake_up_interruptible(&ppp->file.rwait);
 		ppp_unlock(ppp);
 		synchronize_net();
-		if (refcount_dec_and_test(&ppp->file.refcnt))
-			ppp_destroy_interface(ppp);
+		ppp_release_interface(ppp);
 		err = 0;
 	}
 	return err;
 }
 
 /*
- * Free up the resources used by a ppp channel.
+ * Drop a reference to a ppp channel and free its memory if the refcount reaches
+ * zero.
  */
-static void ppp_destroy_channel(struct channel *pch)
+static void ppp_release_channel(struct channel *pch)
 {
+	if (!refcount_dec_and_test(&pch->file.refcnt))
+		return;
+
 	put_net_track(pch->chan_net, &pch->ns_tracker);
 	pch->chan_net = NULL;
 
-- 
2.43.0


