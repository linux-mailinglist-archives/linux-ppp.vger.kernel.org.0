Return-Path: <linux-ppp+bounces-413-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kI+LO4OJsml4NQAAu9opvQ
	(envelope-from <linux-ppp+bounces-413-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 12 Mar 2026 10:38:11 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C4B26FB07
	for <lists+linux-ppp@lfdr.de>; Thu, 12 Mar 2026 10:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62F50304F23E
	for <lists+linux-ppp@lfdr.de>; Thu, 12 Mar 2026 09:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A593B9DAA;
	Thu, 12 Mar 2026 09:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DN8T9sO6"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98C73B894F
	for <linux-ppp@vger.kernel.org>; Thu, 12 Mar 2026 09:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773308269; cv=none; b=BvvtNrReKquwEmqgUU0IXjv6ictexoBdV9j7985AzabknFGmhP2FXFwLH01YrmjnhmD9StPJzHfy1yBHohOkVdPu2TEE61vlpzGKD+F532t1oZYQQSmt1KmhV960tQRZD+jIinVbfKfWXNxrHSMMK+Dvu9cC3nErTPNIGh29sJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773308269; c=relaxed/simple;
	bh=mvv6oxB30rMFszrqgjy8372h+esaWwH8rnqok0C6PLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NKs7bXggBT2vl9axvhY2eT00+Sx0o2ddPBq5GlcCzR5DMhgJQv2nq06OrCcRuXIBf5nktVV7DbvZR/xgSD7KYTRAZUtg+J5QHXABnCwyFGcZrdWUrG1M2wvHaw4/GpgzhyKyRXcJfiHZ3XWHDlOZEbYI8jowFa34BlDn+dYKQDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DN8T9sO6; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b966a7b1908so80672766b.1
        for <linux-ppp@vger.kernel.org>; Thu, 12 Mar 2026 02:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773308263; x=1773913063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0oW3W/hp5cy/K113g2ybbnVjhiUgsa8zlwDOLSWtZk=;
        b=DN8T9sO6m26Y5YQH4nnJZ/6ogeOr8gCtQyIZVMQ3UW9f+GIrYh3/Tcedg5D3LCDC8R
         qdYmK4AxHu7slD2CRxhG+gFb2ujAwDP5i3+08vllQwf1GjD19R6IEl9FO1An/z+mDFYV
         K51As0G3UVFprZHN3zhqRKz0ou48hEFcKtJ6+Ax9JeaX1OGj/h9ym1HyQioj+wn3TymI
         rH+qiFgAfzHr/5FX/oF2injPvyXjNFKLjy8/ADpzdCQAFSwaXOClV8uFU/JD9JWZMhwW
         v+4yfb97UFP9yg4Ai2svhXt8aoTMNdRebOojHmpyDVMWIbLW9I75mLvRjI/d730UCa/Z
         fSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773308263; x=1773913063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t0oW3W/hp5cy/K113g2ybbnVjhiUgsa8zlwDOLSWtZk=;
        b=aaRkgEAUfbrbM43OX/VFLUWqZPB3pijehhCrTkxE+TjzZGn/qZY+v+pYabWvVEGFmz
         d2e0Tvs2R/dsktdeSn04sWudLU3cCIq5X8IKI9FjNiu0XdadA4pBv5IjDpdBQvwA/Oip
         xxF9RQ/+10Um4BWdJvQYi9/MTvQRTRSs+6KDIxtLb6AlSt33vrgPxHMINNFVodp0KPXW
         RZuUGU+q7OfqGjLqREgUch4Ucb57QK8BdYsDbz1yxLP0dDiGGsO0jLEGEoBdcyaX4a/J
         D/GS6onWgJ7WZTpSesNqc5+fQplV7haS90AHBVCCgv7xF0i4/pryy2Z0hp8DCrps7sNw
         wIbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ7PaL1LITJDIWjjocVZiQdk13zQ230JEJR5LGgRNkVrXsHNwanG7EDEGF2+7q4R1VkUNyMUl7dcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZWo8bdStumlGbMFsCO1nMF2TZGcL1puQRf+K8SIu8JrQVM2Gs
	Q12YpYI6i2trV6RUjxRRfE4jXesDl0gOOLRV3pe38B6fwMOIBrXHIQnt
X-Gm-Gg: ATEYQzzK22s8v0S7tz0uwyUu9zARNP+UnFnsiRNXsw8/+3DHMPWSjzaPHvXdYHL76UE
	Djqn+Dkhn1EerJP63qY6JjxMk5Uksqi9xcOVPI+EADw1p0ZbA53yjn9ivizal7QXh3I3uFIRnk9
	WUCjz3zBX2aOt4opiZmYQAzeDOUhsiZe1RvxNA4GqKlHYbuIIvC+U3fWX27mmGOB8Bpo/sslIAy
	fVw63gz6gPL3c0tCfuu/n1AvKAuwujzniJRF1C7P1osXIYsGdKvVeIr6KputFZTLLovO2mB3+tO
	pRu6nwzX8681qPHl4MhOV/ILjih+6WOPIL7/rPO+fdbQzL0QJuXwNvodyiBTRwcwhsKn9QfXKBu
	Bl01PLleZnVjb0IHZRe2xz4aSjdHbMSlM3jSrxe/tcCF1RtQ06ET2QlWW04oJG1prq8q3hUdR
X-Received: by 2002:a17:907:1b13:b0:b88:6542:86a0 with SMTP id a640c23a62f3a-b972e59297dmr323289066b.54.1773308262767;
        Thu, 12 Mar 2026 02:37:42 -0700 (PDT)
Received: from gmail.com ([2a09:bac1:5560::49b:47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de82bc0sm114022666b.27.2026.03.12.02.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 02:37:42 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>
Subject: [PATCH net-next 2/2] ppp: remove pch->chan NULL checks from tx path
Date: Thu, 12 Mar 2026 17:37:31 +0800
Message-ID: <20260312093732.277254-2-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312093732.277254-1-dqfext@gmail.com>
References: <20260312093732.277254-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-413-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B2C4B26FB07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Now that ppp_disconnect_channel() is called before pch->chan is set to
NULL, a channel from ppp->channels list on the transmit path is
guaranteed to have non-NULL pch->chan.

Remove the pch->chan NULL checks from ppp_push(), ppp_mp_explode(), and
ppp_fill_forward_path(), where a channel is obtained from the list.
Remove the corresponding WRITE/READ_ONCE annotations as they no longer
race.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/ppp_generic.c | 68 +++++++++++------------------------
 1 file changed, 21 insertions(+), 47 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index ad480b584e25..a036ddfe327b 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1602,10 +1602,7 @@ static int ppp_fill_forward_path(struct net_device_path_ctx *ctx,
 	if (!pch)
 		return -ENODEV;
 
-	chan = READ_ONCE(pch->chan);
-	if (!chan)
-		return -ENODEV;
-
+	chan = pch->chan;
 	if (!chan->ops->fill_forward_path)
 		return -EOPNOTSUPP;
 
@@ -1928,9 +1925,9 @@ ppp_push(struct ppp *ppp, struct sk_buff *skb)
 
 		spin_lock(&pch->downl);
 		chan = pch->chan;
-		if (unlikely(!chan || (!chan->direct_xmit && skb_linearize(skb)))) {
-			/* channel got unregistered, or it requires a linear
-			 * skb but linearization failed
+		if (unlikely(!chan->direct_xmit && skb_linearize(skb))) {
+			/* channel requires a linear skb but linearization
+			 * failed
 			 */
 			kfree_skb(skb);
 			ret = 1;
@@ -1991,28 +1988,23 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 	hdrlen = (ppp->flags & SC_MP_XSHORTSEQ)? MPHDRLEN_SSN: MPHDRLEN;
 	i = 0;
 	list_for_each_entry(pch, &ppp->channels, clist) {
-		if (pch->chan) {
-			pch->avail = 1;
-			navail++;
-			pch->speed = pch->chan->speed;
-		} else {
-			pch->avail = 0;
-		}
-		if (pch->avail) {
-			if (skb_queue_empty(&pch->file.xq) ||
-				!pch->had_frag) {
-					if (pch->speed == 0)
-						nzero++;
-					else
-						totspeed += pch->speed;
-
-					pch->avail = 2;
-					++nfree;
-					++totfree;
-				}
-			if (!pch->had_frag && i < ppp->nxchan)
-				ppp->nxchan = i;
+		pch->avail = 1;
+		navail++;
+		pch->speed = pch->chan->speed;
+
+		if (skb_queue_empty(&pch->file.xq) || !pch->had_frag) {
+			if (pch->speed == 0)
+				nzero++;
+			else
+				totspeed += pch->speed;
+
+			pch->avail = 2;
+			++nfree;
+			++totfree;
 		}
+		if (!pch->had_frag && i < ppp->nxchan)
+			ppp->nxchan = i;
+
 		++i;
 	}
 	/*
@@ -2071,25 +2063,7 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 			pch->avail = 1;
 		}
 
-		/* check the channel's mtu and whether it is still attached. */
 		spin_lock(&pch->downl);
-		if (pch->chan == NULL) {
-			/* can't use this channel, it's being deregistered */
-			if (pch->speed == 0)
-				nzero--;
-			else
-				totspeed -= pch->speed;
-
-			spin_unlock(&pch->downl);
-			pch->avail = 0;
-			totlen = len;
-			totfree--;
-			nfree--;
-			if (--navail == 0)
-				break;
-			continue;
-		}
-
 		/*
 		*if the channel speed is not set divide
 		*the packet evenly among the free channels;
@@ -3035,7 +3009,7 @@ ppp_unregister_channel(struct ppp_channel *chan)
 	ppp_disconnect_channel(pch);
 	down_write(&pch->chan_sem);
 	spin_lock_bh(&pch->downl);
-	WRITE_ONCE(pch->chan, NULL);
+	pch->chan = NULL;
 	spin_unlock_bh(&pch->downl);
 	up_write(&pch->chan_sem);
 
-- 
2.43.0


