Return-Path: <linux-ppp+bounces-369-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEzIDzHScmnKpgAAu9opvQ
	(envelope-from <linux-ppp+bounces-369-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 23 Jan 2026 02:43:13 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C32656F3B8
	for <lists+linux-ppp@lfdr.de>; Fri, 23 Jan 2026 02:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94FE73014769
	for <lists+linux-ppp@lfdr.de>; Fri, 23 Jan 2026 01:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749192F25F0;
	Fri, 23 Jan 2026 01:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOfE8wIb"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630242D7D3A
	for <linux-ppp@vger.kernel.org>; Fri, 23 Jan 2026 01:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769132564; cv=none; b=K94dL+SKsaF9Xm0ikbPMcvYZcWULDw/73mfxVMyat2b7RMGnrwaJ7K/3w8jTbpi5Ddhb3wovy/2oPuSZNhLiKcuaT6hKTICQwRBGGE5VESptLwm8cXi8mPfeY0gtRN1CKyYVY5YXqrFofnGqDZMDMkYVs5URveznrefFicLOkVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769132564; c=relaxed/simple;
	bh=XgQZQFLyE+cZXfrumIA0EuNEWtSsCOWImP0qsgzSk5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kvhxeNdJFCi3dQmXRR0ZbVXkE10/vzgue3Bpf+d+tdUmkV+ilAitaBIwooEaNqO7AdsHXLGAyRQQBB24GQF0dot/HVw7Euj+kVxuUYo1xxayEM2dBoCRFqaHFRR+PkHHZ709GB1Ta4JwFKRYr3T5NOdJ99dM3icF73OdRtxebWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOfE8wIb; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12336c0a8b6so682039c88.1
        for <linux-ppp@vger.kernel.org>; Thu, 22 Jan 2026 17:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769132546; x=1769737346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uifsBKed8myajuNyljKie4CeDV4OXM0xUtAmhIR3vmg=;
        b=TOfE8wIbEcArpcrOJWAKo2lmXRiva9XZq55572B/R2Asi/go4G18GOZEEpWc22HirB
         lFzS1ATiH1joxa1AC7j/ADrMq1K9FavZQBmJ0ts/FTLt3oQ/23LvaTg0HTGO2Rtz+Qp4
         GXjXjt9QpluapX43lX0gy+6jZa2hGsajGobPnlEsrl6pus44+Ui/zvDUCFbxzFRi2DNp
         IfyRUc2VYnKImrm3ZaIzL1kBDqmPomCgH12LS2OWUbWe/tffTTlsfZp3wmMU/Q+YSGjM
         8zxjK8EkndYpPAq7lUaz3dyEI4LnIPZCoAdeeXL0meaMJqQF1ALtH+6ZKkdMILFA9lUA
         hQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769132546; x=1769737346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uifsBKed8myajuNyljKie4CeDV4OXM0xUtAmhIR3vmg=;
        b=XPpqoueUwYOjqKKp1PL/4EM6pOUl3BGpGLbCUWHaOWYWnSY8RlxIv0U6SfKlBvW8/k
         WARELC8YMqiSUSnEMvg32ll+hMIjZx7wU+Ei+L+SSdd/gIOQbZ2/y08f8YdnQd4I6CgR
         0dSmFQhDApU7lpwlyLk1MKRtNdvlrOOqI1IBbHiCKbvGlEob0a1JeLG/F19OPg5Mq9Xt
         H68IXgUt9GtGSxBONdvaGzdc6oByBfsRLXHmXxdxyRkx6r/9o373rdouV3+EVoSpg2u/
         6Tik5cp8YkseeBJsjJZTw2yyZ+0Ee1/siPKQ/ov7sDVDMNhHBuHMdZ7KY+u9YxxZozVO
         xD8g==
X-Forwarded-Encrypted: i=1; AJvYcCXC4onIytbq21Cf+AQBxLH6IdSJ5DxyvTXoTKI9IuJqL9Tavbr8pc4R4iNDiQwdufOiQmyU3di1KA8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxi+ltVxvEbsjf5DO0L7SoZoTcwYhom+/zdQBnlhsP2ggeU2ly
	UOPpusEXjz5THFBi7HzlxXoN9Sq7Znj5pj+AcvXOj8qLzJ9tEQcSVVvoxZITZNHq
X-Gm-Gg: AZuq6aI1f2TJNilNCDMHKCEYG2VKZt9f+d8f8fl4t5K3jh6k/bEKhQez0KxGgGrjpAQ
	XhHfVcBt/ic0DwE0VLVEWyBUi1mR719JPDwScy3MDKKlB0sRzAozPQ3M19M8W2ahWkU9ZzVf41G
	K3DJwhaoCeQtpOuMwa35nKvtp4FccRxASt9LXPWfgeV0qF2uRVorlAlK+W1TMlQjC96p9KycpDm
	uVDNCHr0JCXL4AX9HeZDqa9k28LQEmwWNEaakz+Rq2/DWZN7RxeNQjX5hgKhxXNtUfXc8JBiP2e
	+UHgXLoePLoMvEOfj9cDeiNqrM8+aEHGC8R6f5lR9RaVE3zDmZKT4xiRXK9EE27cDbCL8rjiDRZ
	ARrX2106cFufUgnZkN7tK74ZjsQomvkLMt/NEsr64SZL9sUENTUpMUssAiXL2jvY=
X-Received: by 2002:a05:7022:e16:b0:123:345f:5d9c with SMTP id a92af1059eb24-1247dba58a2mr589486c88.2.1769132544457;
        Thu, 22 Jan 2026 17:42:24 -0800 (PST)
Received: from gmail.com ([2a09:bac1:19c0:20::4:33f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d9a44d8sm1770093c88.14.2026.01.22.17.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 17:42:24 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: [PATCH net-next v3] ppp: enable TX scatter-gather
Date: Fri, 23 Jan 2026 09:42:13 +0800
Message-ID: <20260123014214.225278-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-369-lists,linux-ppp=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C32656F3B8
X-Rspamd-Action: no action

PPP channels using chan->direct_xmit prepend the PPP header to a skb and
call dev_queue_xmit() directly. In this mode the skb does not need to be
linear, but the PPP netdevice currently does not advertise
scatter-gather features, causing unnecessary linearization and
preventing GSO.

Enable NETIF_F_SG and NETIF_F_FRAGLIST on PPP devices and add an
.ndo_fix_features() callback to disable them when the underlying PPP
channel is not using direct_xmit (i.e. IFF_NO_QUEUE is not set in
priv_flags). This allows the networking core to pass non-linear skbs
directly only when it is safe to do so.

PPP compressors still require linear skbs, and their states can change
at runtime. In order to avoid races, instead of toggling features, call
skb_linearize() before passing buffers to them. Compressors are uncommon
on high-speed links, so this does not affect the fast path.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
v2 -> v3:
 toggle features only if the underlying ppp_channel changes. Call
  skb_linearize() if compressors are in use.
 - https://lore.kernel.org/linux-ppp/20251103031501.404141-1-dqfext@gmail.com/

 drivers/net/ppp/ppp_generic.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index f9f0f16c41d1..d706a175cea9 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1545,6 +1545,16 @@ ppp_get_stats64(struct net_device *dev, struct rtnl_link_stats64 *stats64)
 	dev_fetch_sw_netstats(stats64, dev->tstats);
 }
 
+static netdev_features_t
+ppp_fix_features(struct net_device *dev, netdev_features_t features)
+{
+	/* Don't advertise SG/FRAGLIST when IFF_NO_QUEUE is absent */
+	if (!(dev->priv_flags & IFF_NO_QUEUE))
+		features &= ~(NETIF_F_SG | NETIF_F_FRAGLIST);
+
+	return features;
+}
+
 static int ppp_dev_init(struct net_device *dev)
 {
 	struct ppp *ppp;
@@ -1619,6 +1629,7 @@ static const struct net_device_ops ppp_netdev_ops = {
 	.ndo_start_xmit  = ppp_start_xmit,
 	.ndo_siocdevprivate = ppp_net_siocdevprivate,
 	.ndo_get_stats64 = ppp_get_stats64,
+	.ndo_fix_features = ppp_fix_features,
 	.ndo_fill_forward_path = ppp_fill_forward_path,
 };
 
@@ -1641,6 +1652,8 @@ static void ppp_setup(struct net_device *dev)
 	dev->flags = IFF_POINTOPOINT | IFF_NOARP | IFF_MULTICAST;
 	dev->priv_destructor = ppp_dev_priv_destructor;
 	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
+	dev->features = NETIF_F_SG | NETIF_F_FRAGLIST;
+	dev->hw_features = dev->features;
 	netif_keep_dst(dev);
 }
 
@@ -1710,6 +1723,10 @@ pad_compress_skb(struct ppp *ppp, struct sk_buff *skb)
 		ppp->xcomp->comp_extra + ppp->dev->hard_header_len;
 	int compressor_skb_size = ppp->dev->mtu +
 		ppp->xcomp->comp_extra + PPP_HDRLEN;
+
+	if (skb_linearize(skb))
+		return NULL;
+
 	new_skb = alloc_skb(new_skb_size, GFP_ATOMIC);
 	if (!new_skb) {
 		if (net_ratelimit())
@@ -1797,6 +1814,10 @@ ppp_send_frame(struct ppp *ppp, struct sk_buff *skb)
 	case PPP_IP:
 		if (!ppp->vj || (ppp->flags & SC_COMP_TCP) == 0)
 			break;
+
+		if (skb_linearize(skb))
+			goto drop;
+
 		/* try to do VJ TCP header compression */
 		new_skb = alloc_skb(skb->len + ppp->dev->hard_header_len - 2,
 				    GFP_ATOMIC);
@@ -3537,6 +3558,12 @@ ppp_connect_channel(struct channel *pch, int unit)
 	spin_unlock(&pch->upl);
  out:
 	mutex_unlock(&pn->all_ppp_mutex);
+	if (ret == 0) {
+		rtnl_lock();
+		netdev_update_features(ppp->dev);
+		rtnl_unlock();
+	}
+
 	return ret;
 }
 
-- 
2.43.0


