Return-Path: <linux-ppp+bounces-394-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAPlKw/sjmkCGAEAu9opvQ
	(envelope-from <linux-ppp+bounces-394-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Feb 2026 10:17:03 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1E21345C1
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Feb 2026 10:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FFAF30692E6
	for <lists+linux-ppp@lfdr.de>; Fri, 13 Feb 2026 09:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6340634D3B8;
	Fri, 13 Feb 2026 09:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShnHXq8B"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF76831D757
	for <linux-ppp@vger.kernel.org>; Fri, 13 Feb 2026 09:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770974177; cv=none; b=CSG57nKE7IjCCRv/VDsmU6RyaZoXhPlV2xjkxVB00yFu4bCH6xO6NhkMsROUEsf4/DLrw8jYM23sv9H7vcoMZXAoctq8bM1m6IvolZpH61Q+xKnXh1xwCG5apHSeou++JZJ/kv16fx/eqPjR555nOSTLolq8RVLgI3Czo+XgN6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770974177; c=relaxed/simple;
	bh=uWdHmJii4Eltf3Y7DYQHeGLCQWqE8sMNnU5SgG5a1H8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b39dz3kd6/WL2iq/CPx8kaNO8kpY182+gD1NmJSQOb+j8clhOjxH9eqT3FlIXoajHjRcKUke+DdFqynTZvBLPsebRMkZmLLzkzdBxTg4FrQw44e+vzea/ke1Lqep8mhbLujmOFw97/HTru+bux01OZq00hYFWttcVImvbtFcqLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShnHXq8B; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65a414a6859so1206422a12.1
        for <linux-ppp@vger.kernel.org>; Fri, 13 Feb 2026 01:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770974174; x=1771578974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+YW2XpxsF2GL4nTKdafPvtP9xVrfkFTi55NUblNEfP8=;
        b=ShnHXq8BX0fK1i9naB1KwHnhuepAhIUJ4E3oOJKoCe3SIKkNV/nX0+CCKoKHax71P0
         mW7ioaHBVTzH08tcKN3yUYpr6gkwx4QwYvJUqDJacnu7zVm9j6EE3WKS3b7qPqqUiP9X
         DgUF77SyMVcnE5X1uQHfnpzWi3d5Mnv2VEJPoAEEjG/Qno9h+5I9P2ctEqRUGNmfURxv
         zA+hcNrQ6zxU+qW4m7wbkC2ZJhY7HvNi/N+qin8moN3p3M0XKqDU0HtVZ1wrHFuRcxUf
         V4eOJr55YElF9taWLT4JjOXWRqbeX6MeA65ys5bRs2xJ5HsOArSM949jSZv1eVIr/+sq
         F7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770974174; x=1771578974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YW2XpxsF2GL4nTKdafPvtP9xVrfkFTi55NUblNEfP8=;
        b=BnEt7KjIlodH0TW+dMuSJY0WBU6o52pwghqovOHkO02PdBmpBIRktIP8+MMUh4Pn53
         WMZILZ59GswlI68ZXbcLc1CLQ1LmkGd12es1yi21U6B9cZ5a9jAtZDtOrAoCU6b6bngl
         9QjFJTXoVTYfkrzq/uuo2NxeSFw1Io44r/m+c8mpHE1ovnzgpwHlW6AkKdiw8fNiUY4w
         y3YKilcEoSGy4r8iwV8qVwq4et2ATASzuIZ81St0AZFDK1VgWOFsp9IBGft7pRNm+Vu1
         xmJyPlOwK7r9rgPg0dcM6e5zUsvKq6dMT90MJ26kFtHKeiZZf6xjS/bNj2LVqjIMl/3/
         h+Ug==
X-Gm-Message-State: AOJu0YyyM5XVS+JYKop0g76AgWtcD3CcbDfLNC6cjKPVVFw1tTqmBqxi
	Bbhj9v6BE4HXHzIgSDtcz4JqAcEpKkndaQRz9WPGmrs+XoIAmm6kCfg+kAzzzKLSUNo=
X-Gm-Gg: AZuq6aK/8CIqroWQ2tWEXSym47860l8x13sLk/mM8y3jpcOvIDSyCzD7clQsO//U0OQ
	kFSXQaxw+JCknv53i/dk8nrv+m1PrFJQc1W/AYc7FOzo09rfvE9EzLj9WcqRtaVVXIB8rhry+ZJ
	XoIG140mcBhjiM6cJ82oR7s0HQ5Q0GPo03Gpd37msa+aLhu7r9mpf9GeXSQI1iOtaqarCaUtANg
	X9a3a0Pb8wkydDr/Xagg2yf9CXGh+suFNCkdfhXFmkXFIwJEyXI0plwn+0ZCyE4A36rgH45eR0f
	yW3MZ9Dd3/j/pYl9EpPJphmoCgCHzdKgOgcVOhddw0aZirXlO4tkfhTwh1lWG+pOaXa8rNUsFx/
	cBNGWOp8OsRJm1SilSE72UL5y8+Mx3Q1H8K02NxZgelfQAkP8qbZYkobtmdE7hlwM4J0PEYZGbp
	wHryE=
X-Received: by 2002:a17:907:94c4:b0:b8e:d13f:e20f with SMTP id a640c23a62f3a-b8fb452e806mr66008166b.55.1770974173219;
        Fri, 13 Feb 2026 01:16:13 -0800 (PST)
Received: from gmail.com ([2a09:bac5:4e20:2705::3e3:35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f84bb7b0fsm194556366b.1.2026.02.13.01.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 01:16:12 -0800 (PST)
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
Subject: [PATCH RFC net-next v2] pppoe: remove kernel-mode relay support
Date: Fri, 13 Feb 2026 17:16:04 +0800
Message-ID: <20260213091605.132561-1-dqfext@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-394-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,earthlink.net,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,skoll.ca:url,pppoe.dev:url,pppoe.pa:url]
X-Rspamd-Queue-Id: 0A1E21345C1
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
---
v1: restore .compat_ioctl
  https://lore.kernel.org/linux-ppp/20260211075547.138904-1-dqfext@gmail.com/

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


