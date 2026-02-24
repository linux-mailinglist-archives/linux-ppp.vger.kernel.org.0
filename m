Return-Path: <linux-ppp+bounces-397-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLTuNAoEnWk7MgQAu9opvQ
	(envelope-from <linux-ppp+bounces-397-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 24 Feb 2026 02:51:06 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E79180BE0
	for <lists+linux-ppp@lfdr.de>; Tue, 24 Feb 2026 02:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DFDFF3034253
	for <lists+linux-ppp@lfdr.de>; Tue, 24 Feb 2026 01:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB552244687;
	Tue, 24 Feb 2026 01:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JF/vHxM0"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CD623C8AE
	for <linux-ppp@vger.kernel.org>; Tue, 24 Feb 2026 01:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771897862; cv=none; b=GgZpMAD67PxLlJw8dbRlCPNAvPOMpXk62Dt+O5AlkNhIGKl+LagGlbvEGply00tK+LvhDiH1FRCm377v3Mf5wai9ylXZSJtkl09E4FC2Xwjvw7gleNZvdqhRfr/CVMjm6U06i2MlN0CFTkcGPlC7791xSnViA1dUHzEEulXVgTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771897862; c=relaxed/simple;
	bh=q04FzcRBjS6yuADUwXzK64Nd9dTcPL5AiSbU8fS5n9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V5ydT+xWLdNXans+6g2rdpFQmjZUxCC64pQPT0m9b22shV0JeEJ1hdj58Q78O+fN+CeB7776R81DO5Fy9UcXHugFf2apGhw1eoctsieoSDlq5w5/sFVSvDg2dBUlNIj9ySJnsOkhFGiJe6heXkAxrZFpDMjcArjC1JFFO0QvqjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JF/vHxM0; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8f7a30515aso578047266b.0
        for <linux-ppp@vger.kernel.org>; Mon, 23 Feb 2026 17:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771897859; x=1772502659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X/UdYQBE0ID3Mvn30rVSJTpyiHsXE3QizzYSsa0sEKI=;
        b=JF/vHxM0y4dPev0cwtOlllHvX6+DTBlRYKvmoqRDsqUcLmY5OsTl956CFWRrVpsRxP
         hglBxNEuaE2eTj0C2PKlxhq1Zf5cbAv+RgGPriANbb0UgpBxjU2XL2K+W2IvIu3wDC5x
         gK8Mn9nY0yD9yKDdkXNa20knDzVYBeaueVLmEQzGDF6sN69D4dnS8OpR/BBIzdcvi/5q
         aQEimpWXAWh027M+/mQHpnVAbuCEaDV77x3T4tjYHvr5JOHwnueMflZGK4AUTquOnBSu
         Qwz0aqjDd++Vsw+oCTebrT2KkmPxFw4rkup6UeoTQijbu2wqJ4mLX/wSBThh4BfJhZed
         T9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771897859; x=1772502659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/UdYQBE0ID3Mvn30rVSJTpyiHsXE3QizzYSsa0sEKI=;
        b=d3miZJS+NZrRoeh7oCR1zwBGp5/ebwnGXVTJCHfWM9g5QSw1wsxmUdmpyvsITrowRk
         GRtXBnjyN1BEVop4I3QDZFqo0wVVw4468WIcGuGcO8DEBg++uyjtXp1CHTx1sqsDOT/B
         R6rpe+GqntXIQInWtd2klE7XN8QWYmihRZelIO1jdRPrcZ7VIHUT6KBWt+wQZXhigYc3
         tIYuD9TllJNbZwtxY5mgUUc12Mmd+gJBC+aaElisYZMOaRzk9ah3NLlCdfsKLD6ad/hr
         Ti47rR36FpdoF0WttWmKDkNo5/SuBGC2tHHcz78SmFEl36BsRNaT/7XzI/nlxUyfy/cT
         B+nw==
X-Gm-Message-State: AOJu0YzoAUdcqBEJLQKRQzXcVgNWkrd0lCgvBA/we1mVA2ZN8b4AOxzs
	3ulKtrC1cg9vMky5w6uO8IhCl9RkTGGpusb9ysQ9qg2fva8cETP51vvCknsijaJkVSk=
X-Gm-Gg: AZuq6aLEKu5PxsefeOkG0ZPTYAEYVYgxDLV+GjUZAe/Cwi2PHZhX4hVbTl2m6FXa+Cf
	UBrFZ24E5qEb2mnzv7g6rLbF2slu1Ht5A/ZWb4zDS64133s+KM5oT5c1Jw1WeVK0eeWv/9LZUVy
	Sj1Usgd0n20Xxyd7H9Okt/eIWTm04/R1Y3m77ytI0y0sMveaMwxJ1Tng40RKn3o+vSnVm0hQgUY
	heUkTUPMxLwUdymVNlg732P40/ad5uia+aHMM+ljEfP5UvnIlD/EVezoIyzPg0VCQWoVobv8RVs
	5c/B68EJ11yzLK1w9T5bONTaztCIByv5t9LPW4pmqx/nryk36Mm0+ixEESQn3EkXCGQWTB6tUQS
	fDNRKrGdkXB+qNkPYTgvWQfae7Op1Mwg1py4SU3rNatAbKerYwubXVmNzYP6k7o/Pvbcp0PHhdg
	wtxv97w9pQZb70GQ==
X-Received: by 2002:a17:906:4783:b0:b8a:f29e:307a with SMTP id a640c23a62f3a-b9081bf70e7mr731128666b.57.1771897859195;
        Mon, 23 Feb 2026 17:50:59 -0800 (PST)
Received: from gmail.com ([2a09:bac5:4e25:2719::3e5:33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084e8b790sm387772166b.49.2026.02.23.17.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 17:50:58 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: linux-ppp@vger.kernel.org,
	Michal Ostrowski <mostrows@earthlink.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michal Ostrowski <mostrows@gmail.com>,
	Dianne Skoll <dianne@skoll.ca>,
	Paul Mackerras <paulus@ozlabs.org>,
	Jaco Kroon <jaco@uls.co.za>,
	James Carlson <carlsonj@workingcode.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Guillaume Nault <gnault@redhat.com>
Subject: [PATCH net-next] pppoe: remove kernel-mode relay support
Date: Tue, 24 Feb 2026 09:50:52 +0800
Message-ID: <20260224015053.42472-1-dqfext@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,skoll.ca,ozlabs.org,uls.co.za,workingcode.com,arndb.de,redhat.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-397-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[vger.kernel.org,earthlink.net,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 75E79180BE0
X-Rspamd-Action: no action

The kernel-mode PPPoE relay feature and its two associated ioctls
(PPPOEIOCSFWD and PPPOEIOCDFWD) are not used by any existing userspace
PPPoE implementations. The most commonly-used package, RP-PPPoE [1],
handles the relaying entirely in userspace.

This legacy code has remained in the driver since its introduction in
kernel 2.3.99-pre7 for over two decades, but has served no practical
purpose.

Remove the unused relay code.

[1] https://dianne.skoll.ca/projects/rp-pppoe/

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Guillaume Nault <gnault@redhat.com>
---
 Repost as non-RFC:
 - https://lore.kernel.org/netdev/20260213091605.132561-1-dqfext@gmail.com/

 drivers/net/ppp/pppoe.c       | 79 -----------------------------------
 drivers/net/ppp/pppox.c       |  3 --
 include/linux/if_pppox.h      |  6 ---
 include/uapi/linux/if_pppox.h | 10 -----
 4 files changed, 98 deletions(-)

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index 4275b393a454..7a6dcfa421e9 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -237,25 +237,6 @@ static inline struct pppox_sock *get_item(struct pppoe_net *pn, __be16 sid,
 	return po;
 }
 
-static inline struct pppox_sock *__get_item_by_addr(struct net *net,
-						    struct sockaddr_pppox *sp)
-{
-	struct net_device *dev;
-	struct pppoe_net *pn;
-	struct pppox_sock *pppox_sock = NULL;
-
-	int ifindex;
-
-	dev = dev_get_by_name_rcu(net, sp->sa_addr.pppoe.dev);
-	if (dev) {
-		ifindex = dev->ifindex;
-		pn = pppoe_pernet(net);
-		pppox_sock = __get_item(pn, sp->sa_addr.pppoe.sid,
-					sp->sa_addr.pppoe.remote, ifindex);
-	}
-	return pppox_sock;
-}
-
 static inline void delete_item(struct pppoe_net *pn, __be16 sid,
 					char *addr, int ifindex)
 {
@@ -369,7 +350,6 @@ static struct notifier_block pppoe_notifier = {
 static int pppoe_rcv_core(struct sock *sk, struct sk_buff *skb)
 {
 	struct pppox_sock *po = pppox_sk(sk);
-	struct pppox_sock *relay_po;
 
 	/* Backlog receive. Semantics of backlog rcv preclude any code from
 	 * executing in lock_sock()/release_sock() bounds; meaning sk->sk_state
@@ -378,17 +358,6 @@ static int pppoe_rcv_core(struct sock *sk, struct sk_buff *skb)
 
 	if (sk->sk_state & PPPOX_BOUND) {
 		ppp_input(&po->chan, skb);
-	} else if (sk->sk_state & PPPOX_RELAY) {
-		relay_po = __get_item_by_addr(sock_net(sk),
-					      &po->pppoe_relay);
-		if (relay_po == NULL)
-			goto abort_kfree;
-
-		if ((sk_pppox(relay_po)->sk_state & PPPOX_CONNECTED) == 0)
-			goto abort_kfree;
-
-		if (!__pppoe_xmit(sk_pppox(relay_po), skb))
-			goto abort_kfree;
 	} else {
 		if (sock_queue_rcv_skb(sk, skb))
 			goto abort_kfree;
@@ -656,7 +625,6 @@ static int pppoe_connect(struct socket *sock, struct sockaddr_unsized *uservaddr
 
 		po->pppoe_ifindex = 0;
 		memset(&po->pppoe_pa, 0, sizeof(po->pppoe_pa));
-		memset(&po->pppoe_relay, 0, sizeof(po->pppoe_relay));
 		memset(&po->chan, 0, sizeof(po->chan));
 		po->next = NULL;
 		po->num = 0;
@@ -783,53 +751,6 @@ static int pppoe_ioctl(struct socket *sock, unsigned int cmd,
 		err = 0;
 		break;
 
-	case PPPOEIOCSFWD:
-	{
-		struct pppox_sock *relay_po;
-
-		err = -EBUSY;
-		if (sk->sk_state & (PPPOX_BOUND | PPPOX_DEAD))
-			break;
-
-		err = -ENOTCONN;
-		if (!(sk->sk_state & PPPOX_CONNECTED))
-			break;
-
-		/* PPPoE address from the user specifies an outbound
-		   PPPoE address which frames are forwarded to */
-		err = -EFAULT;
-		if (copy_from_user(&po->pppoe_relay,
-				   (void __user *)arg,
-				   sizeof(struct sockaddr_pppox)))
-			break;
-
-		err = -EINVAL;
-		if (po->pppoe_relay.sa_family != AF_PPPOX ||
-		    po->pppoe_relay.sa_protocol != PX_PROTO_OE)
-			break;
-
-		/* Check that the socket referenced by the address
-		   actually exists. */
-		rcu_read_lock();
-		relay_po = __get_item_by_addr(sock_net(sk), &po->pppoe_relay);
-		rcu_read_unlock();
-		if (!relay_po)
-			break;
-
-		sk->sk_state |= PPPOX_RELAY;
-		err = 0;
-		break;
-	}
-
-	case PPPOEIOCDFWD:
-		err = -EALREADY;
-		if (!(sk->sk_state & PPPOX_RELAY))
-			break;
-
-		sk->sk_state &= ~PPPOX_RELAY;
-		err = 0;
-		break;
-
 	default:
 		err = -ENOTTY;
 	}
diff --git a/drivers/net/ppp/pppox.c b/drivers/net/ppp/pppox.c
index 08364f10a43f..5861a2f6ce3e 100644
--- a/drivers/net/ppp/pppox.c
+++ b/drivers/net/ppp/pppox.c
@@ -102,9 +102,6 @@ EXPORT_SYMBOL(pppox_ioctl);
 #ifdef CONFIG_COMPAT
 int pppox_compat_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 {
-	if (cmd == PPPOEIOCSFWD32)
-		cmd = PPPOEIOCSFWD;
-
 	return pppox_ioctl(sock, cmd, (unsigned long)compat_ptr(arg));
 }
 
diff --git a/include/linux/if_pppox.h b/include/linux/if_pppox.h
index db45d6f1c4f4..8bbf676c2a85 100644
--- a/include/linux/if_pppox.h
+++ b/include/linux/if_pppox.h
@@ -25,8 +25,6 @@ struct pppoe_opt {
 	struct net_device      *dev;	  /* device associated with socket*/
 	int			ifindex;  /* ifindex of device associated with socket */
 	struct pppoe_addr	pa;	  /* what this socket is bound to*/
-	struct sockaddr_pppox	relay;	  /* what socket data will be
-					     relayed to (PPPoE relaying) */
 	struct work_struct      padt_work;/* Work item for handling PADT */
 };
 
@@ -53,7 +51,6 @@ struct pppox_sock {
 #define pppoe_dev	proto.pppoe.dev
 #define pppoe_ifindex	proto.pppoe.ifindex
 #define pppoe_pa	proto.pppoe.pa
-#define pppoe_relay	proto.pppoe.relay
 
 static inline struct pppox_sock *pppox_sk(struct sock *sk)
 {
@@ -80,14 +77,11 @@ extern void pppox_unbind_sock(struct sock *sk);/* delete ppp-channel binding */
 extern int pppox_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg);
 extern int pppox_compat_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg);
 
-#define PPPOEIOCSFWD32    _IOW(0xB1 ,0, compat_size_t)
-
 /* PPPoX socket states */
 enum {
     PPPOX_NONE		= 0,  /* initial state */
     PPPOX_CONNECTED	= 1,  /* connection established ==TCP_ESTABLISHED */
     PPPOX_BOUND		= 2,  /* bound to ppp device */
-    PPPOX_RELAY		= 4,  /* forwarding is enabled */
     PPPOX_DEAD		= 16  /* dead, useless, please clean me up!*/
 };
 
diff --git a/include/uapi/linux/if_pppox.h b/include/uapi/linux/if_pppox.h
index 9abd80dcc46f..8fdf0a681a4e 100644
--- a/include/uapi/linux/if_pppox.h
+++ b/include/uapi/linux/if_pppox.h
@@ -103,16 +103,6 @@ struct sockaddr_pppol2tpv3in6 {
 	struct pppol2tpv3in6_addr pppol2tp;
 } __packed;
 
-/*********************************************************************
- *
- * ioctl interface for defining forwarding of connections
- *
- ********************************************************************/
-
-#define PPPOEIOCSFWD	_IOW(0xB1 ,0, size_t)
-#define PPPOEIOCDFWD	_IO(0xB1 ,1)
-/*#define PPPOEIOCGFWD	_IOWR(0xB1,2, size_t)*/
-
 /* Codes to identify message types */
 #define PADI_CODE	0x09
 #define PADO_CODE	0x07
-- 
2.43.0


