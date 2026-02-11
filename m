Return-Path: <linux-ppp+bounces-389-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AtLFhQ2jGnijAAAu9opvQ
	(envelope-from <linux-ppp+bounces-389-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Feb 2026 08:56:04 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B6B121FA0
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Feb 2026 08:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBE2B302A680
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Feb 2026 07:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874E734F244;
	Wed, 11 Feb 2026 07:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlBFqnmZ"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C7332BF55
	for <linux-ppp@vger.kernel.org>; Wed, 11 Feb 2026 07:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770796558; cv=none; b=vEltcN963zkTDtBKPPE6mUweRps6okOcff1uCpU5brJar5YCl/JC2MMhusm+LQtX2+cR/Ed9m7iKUI+btNP7Jd9RTDQLavmSymRssS1M/bYP7X0gDp+gcQkY1dl3GmU1sxaaIfoLLlWvu91Ms/DQ4rM3WnfI1eUFJXdVB7/z7gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770796558; c=relaxed/simple;
	bh=NBNOVlCllpdYEyndId9bnUd3CjYv1ne/cPHtFJR/oO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U/wXJ0B+Dh7EbO/oKBROVGPDa2N4tyx9KemYZehdU410hZZyr8YlPCKs/TAlbD4HkV9sQb/JJ5Zd1c1oE/SC+RIU/iE6eFmtrH3p4YAN0sSXi0IvavCevayMROUTRJOL3CzOWw/LclRgWrGyc5xb/VOOUnjWDUB2KUylsU5KWOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlBFqnmZ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65a3fdeb7d9so474441a12.0
        for <linux-ppp@vger.kernel.org>; Tue, 10 Feb 2026 23:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770796555; x=1771401355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HFY74oEhMKgEBwIz79njhA1rP5gdyP3GZa9qdE7Wwkc=;
        b=HlBFqnmZa3d9FCzUZkU826MB5xAp94A0/4xUnE8xRFNnpsIG1VUfGF6Yq/0/9fDXuk
         HSsEMD8yG4ZDW3uKKEouyzZWiIsVdXf7742vRGTYYwgSO4403QGewAsOYAd3EargICpY
         vxParpDjiXmT7Ur4/9WF7ekfMv9/6MM+xL4nUD9lyDyp7JEPi/0SUOefC2ZvoCpMomn9
         kccFTCvbNwEkYoJwbZGA5QejXOCotyNyCcho6QkB1d82d3LPB5vDkh2id13a3R9fFxcu
         BiTqf5Kj4SoucTCNhUXE5jLGcB7zJi03P6BVsSDqMfrNz8GptCzswVv1OWkUeeDKxhDy
         w4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770796555; x=1771401355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFY74oEhMKgEBwIz79njhA1rP5gdyP3GZa9qdE7Wwkc=;
        b=hYJBCzZEzValM8/8/nU6M7hRusSll6oA9ZaRBK8DTGTvl5YWXDhbCnIgGlNY06v6QP
         MLYyQYDmcmDIVkKx+avSiUV4lr2JN2Hyu2C62V7ch4m0odnp550h+mDTcwIxefRPXKx2
         IIaDpwW1HRJzCziPw5XKl2QJMihTFJuvNZZy9UG+d9ZJr/j+lytp3qIeJHdNfb4gojS0
         DqPzKUNe+4863HQNsJBngI52vTtnTAuWXh4TwrW7aGiWxpGceBRDiX71UGnyDL6DBR58
         jC4guWXeO6cfz1voIouHPlGDIo1z3++m2L2LYOwTDySaNf1aSspXIa/tX3UGd+tyGm8A
         EiGw==
X-Gm-Message-State: AOJu0Yxbfe0OZVMdQCR7bQtXi+6tK202cNxvWxf4Ns/qHnW0kaN2jQ1g
	0W2+j45qwrKSpy5qfv6mlD2BbZhVr1bdRo3lgZomvUXaDmLG6s0KN2FUpcniB5EkvlOVbg==
X-Gm-Gg: AZuq6aLAwSo+eghAC61XOtO5Nb1wgmhKvUZwFLTdJP5/vCSYX1qjpwaVnwj3uQUHZQc
	+1rM8PK5u603kyXxbIrZ75bFAgC+sFCV9VELwNINpQSjbe+v++aF7r5usR7GDS2Grz/BTQCPic2
	plg144CypJKoXbWKEzg3GhaF7HhXW5wcVyIoxqgv8deTo9wfvQU3tRX9I3zZyL2Hkxw3atttJf0
	ohZY0YGnPESmMfuf04vzwhNj3ntoJXxbkPawZ+/j6byZt2GuZ3qLhp+7d+D9qYVm0aCqcDchtUl
	8mEJ4swJuca4bHUnqWdHWySuHQSsUVZL6LCez3VyMc92qolFEp2aaXfndxpTlKrUEpN0Zy14YCn
	u/lOWokc79BXpkV92x3vuKiK7f5agPcLhLyrOrjslbvBibtSfbrKGrQXMZ/WppQ8KYo6wFXvhQB
	2v
X-Received: by 2002:a05:6402:388c:b0:659:78ae:7892 with SMTP id 4fb4d7f45d1cf-65a0d1f4b4bmr2704634a12.22.1770796554530;
        Tue, 10 Feb 2026 23:55:54 -0800 (PST)
Received: from gmail.com ([2a09:bac5:4e21:c8::14:2e0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cec914dsm483047a12.11.2026.02.10.23.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 23:55:53 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: linux-ppp@vger.kernel.org,
	rp-pppoe@lists.skoll.ca,
	Michal Ostrowski <mostrows@earthlink.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	James Chapman <jchapman@katalix.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michal Ostrowski <mostrows@gmail.com>,
	Dianne Skoll <dianne@skoll.ca>,
	Paul Mackerras <paulus@ozlabs.org>,
	Jaco Kroon <jaco@uls.co.za>,
	James Carlson <carlsonj@workingcode.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Guillaume Nault <gnault@redhat.com>
Subject: [PATCH RFC net-next] pppoe: remove unused kernel-mode relay support
Date: Wed, 11 Feb 2026 15:55:46 +0800
Message-ID: <20260211075547.138904-1-dqfext@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-389-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,lists.skoll.ca,earthlink.net,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,katalix.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[gmail.com,skoll.ca,ozlabs.org,uls.co.za,workingcode.com,arndb.de,redhat.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 02B6B121FA0
X-Rspamd-Action: no action

The kernel-mode PPPoE relay feature and its two associated ioctls
(PPPOEIOCSFWD and PPPOEIOCDFWD) are not used by any existing userspace
PPPoE implementations. The standard userspace package, rp-pppoe [1],
handles relaying entirely in userspace.

This legacy code has remained in the driver since its introduction in
kernel 2.3.99-pre7 for over two decades, but serves no practical
purpose.

Remove the unused relay code.

[1] https://dianne.skoll.ca/projects/rp-pppoe/

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ppp/pppoe.c       | 82 -----------------------------------
 drivers/net/ppp/pppox.c       | 13 ------
 drivers/net/ppp/pptp.c        |  3 --
 include/linux/if_pppox.h      |  7 ---
 include/uapi/linux/if_pppox.h | 10 -----
 net/l2tp/l2tp_ppp.c           |  3 --
 6 files changed, 118 deletions(-)

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index 4275b393a454..a126f804e4dd 100644
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
@@ -1136,9 +1057,6 @@ static const struct proto_ops pppoe_ops = {
 	.recvmsg	= pppoe_recvmsg,
 	.mmap		= sock_no_mmap,
 	.ioctl		= pppox_ioctl,
-#ifdef CONFIG_COMPAT
-	.compat_ioctl	= pppox_compat_ioctl,
-#endif
 };
 
 static const struct pppox_proto pppoe_proto = {
diff --git a/drivers/net/ppp/pppox.c b/drivers/net/ppp/pppox.c
index 08364f10a43f..5ef422a43d70 100644
--- a/drivers/net/ppp/pppox.c
+++ b/drivers/net/ppp/pppox.c
@@ -17,7 +17,6 @@
 #include <linux/string.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
-#include <linux/compat.h>
 #include <linux/errno.h>
 #include <linux/netdevice.h>
 #include <linux/net.h>
@@ -99,18 +98,6 @@ int pppox_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 
 EXPORT_SYMBOL(pppox_ioctl);
 
-#ifdef CONFIG_COMPAT
-int pppox_compat_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
-{
-	if (cmd == PPPOEIOCSFWD32)
-		cmd = PPPOEIOCSFWD;
-
-	return pppox_ioctl(sock, cmd, (unsigned long)compat_ptr(arg));
-}
-
-EXPORT_SYMBOL(pppox_compat_ioctl);
-#endif
-
 static int pppox_create(struct net *net, struct socket *sock, int protocol,
 			int kern)
 {
diff --git a/drivers/net/ppp/pptp.c b/drivers/net/ppp/pptp.c
index b18acd810561..8838ed93eb70 100644
--- a/drivers/net/ppp/pptp.c
+++ b/drivers/net/ppp/pptp.c
@@ -634,9 +634,6 @@ static const struct proto_ops pptp_ops = {
 	.recvmsg    = sock_no_recvmsg,
 	.mmap       = sock_no_mmap,
 	.ioctl      = pppox_ioctl,
-#ifdef CONFIG_COMPAT
-	.compat_ioctl = pppox_compat_ioctl,
-#endif
 };
 
 static const struct pppox_proto pppox_pptp_proto = {
diff --git a/include/linux/if_pppox.h b/include/linux/if_pppox.h
index db45d6f1c4f4..a015afa672b7 100644
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
@@ -78,16 +75,12 @@ extern int register_pppox_proto(int proto_num, const struct pppox_proto *pp);
 extern void unregister_pppox_proto(int proto_num);
 extern void pppox_unbind_sock(struct sock *sk);/* delete ppp-channel binding */
 extern int pppox_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg);
-extern int pppox_compat_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg);
-
-#define PPPOEIOCSFWD32    _IOW(0xB1 ,0, compat_size_t)
 
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
diff --git a/net/l2tp/l2tp_ppp.c b/net/l2tp/l2tp_ppp.c
index ae4543d5597b..77aa9f5f866d 100644
--- a/net/l2tp/l2tp_ppp.c
+++ b/net/l2tp/l2tp_ppp.c
@@ -1644,9 +1644,6 @@ static const struct proto_ops pppol2tp_ops = {
 	.recvmsg	= pppol2tp_recvmsg,
 	.mmap		= sock_no_mmap,
 	.ioctl		= pppox_ioctl,
-#ifdef CONFIG_COMPAT
-	.compat_ioctl = pppox_compat_ioctl,
-#endif
 };
 
 static const struct pppox_proto pppol2tp_proto = {
-- 
2.43.0


