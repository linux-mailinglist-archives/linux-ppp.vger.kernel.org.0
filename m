Return-Path: <linux-ppp+bounces-534-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN7CHAmf4GlukQAAu9opvQ
	(envelope-from <linux-ppp+bounces-534-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 16 Apr 2026 10:34:17 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E73F340B9B8
	for <lists+linux-ppp@lfdr.de>; Thu, 16 Apr 2026 10:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43C3C3116E6E
	for <lists+linux-ppp@lfdr.de>; Thu, 16 Apr 2026 08:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D29D38E5CA;
	Thu, 16 Apr 2026 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="L9bEFESc"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108AB3859E9;
	Thu, 16 Apr 2026 08:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776328050; cv=none; b=NPBwgZSbYCOdC67++/aNcam5QyD9ccH5BnPANa6b2cievnPc2prtCQnnfJ617bX2SJtkUdMsAPj7rLU7EBePGbrOCMYsFdyuBez+PyrX5FwAbn+U51H7RFNPFSGE7otEHg+qJe8KATyMT6uSq5KXijOIMhgKziRT+VDGR51kpEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776328050; c=relaxed/simple;
	bh=OS9g/zLAnsKNj/r0w8QMh9ZGISyS53GluiSzGN5dKzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7RnTEyXLjAAqTjp7Ni3gfqv5XUmIxfZhv56YycISopIVlYwkK8mIWY/c9rs1l/7FZLaRzUZ7RzuUj+F98GiCSul/fg75bfA/li++7kC8/pQ10Dk2Kb2iX7hX3otrCYy6CkTaFOxZGUFS6zf0xygzh+1drJsfxqQy5ApiHiaA8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=L9bEFESc; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776328045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VnUdmD3krhllgdk34oRJRJAvIN6VuNVO5tGnpOcniBE=;
	b=L9bEFEScezb68FIKFsL9EZojyL9Z+YPgL+AkIfhtGzDnguCWNRnGsgXUlKb3K9qg+kM3tM
	z9Fh5f9AXlowDVb84d4sNG1hGLQNA+Nnfz6+XfOQtJA+6bzvi47s3V8+MUscR4IEmYl2hp
	pwayMaenBMGVPi59pDrB9UYpK4gQ2y4=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jiri Kosina <jikos@kernel.org>,
	David Sterba <dsterba@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Mitchell Blank Jr <mitch@sfgoth.com>,
	Simon Horman <horms@kernel.org>,
	James Chapman <jchapman@katalix.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Yue Haibing <yuehaibing@huawei.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Taegu Ha <hataegu0826@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Guillaume Nault <gnault@redhat.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dawid Osuchowski <dawid.osuchowski@linux.intel.com>,
	Breno Leitao <leitao@debian.org>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>,
	Jaco Kroon <jaco@uls.co.za>,
	James Carlson <carlsonj@workingcode.com>
Subject: [RFC net-next 2/3] ppp: unify two channel structs
Date: Thu, 16 Apr 2026 16:26:45 +0800
Message-ID: <20260416082656.86963-2-qingfang.deng@linux.dev>
In-Reply-To: <20260416082656.86963-1-qingfang.deng@linux.dev>
References: <20260416082656.86963-1-qingfang.deng@linux.dev>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,suse.com,linuxfoundation.org,sfgoth.com,katalix.com,linux.dev,huawei.com,linutronix.de,gmail.com,arndb.de,linux.intel.com,debian.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	TAGGED_FROM(0.00)[bounces-534-lists,linux-ppp=lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	NEURAL_HAM(-0.00)[-0.996];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:dkim,linux.dev:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E73F340B9B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Historically, PPP maintained two separate structures for a channel:
'struct channel' was internal to ppp_generic.c, while 'struct ppp_channel'
was the public interface that drivers were required to embed. This
duplication was redundant and forced drivers to manage the lifecycle of
the public structure.

Unify these two structures into a single 'struct ppp_channel', which is
now internal to ppp_generic.c. Drivers now use a 'ppp_channel_conf'
structure to specify registration parameters and receive an opaque
pointer to the allocated channel.

Key changes:
- ppp_register_channel() and ppp_register_net_channel() now return
  a 'struct ppp_channel *' instead of taking a pointer to a driver-
  embedded structure.
- 'struct ppp_channel_ops' methods now take the driver's 'private'
  pointer directly as their first argument, simplifying driver logic.
- ppp_unregister_channel() now takes the opaque pointer.
- Multilink-specific fields are unified and handled via the new
  configuration structure.

This cleanup simplifies the driver interface and makes the channel
lifecycle management more robust by centralizing allocation in the PPP
generic layer.

Assisted-by: Gemini:gemini-3-flash
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 drivers/net/ppp/ppp_async.c      |  51 +++++-----
 drivers/net/ppp/ppp_generic.c    | 161 +++++++++++++++----------------
 drivers/net/ppp/ppp_synctty.c    |  51 +++++-----
 drivers/net/ppp/pppoe.c          |  34 ++++---
 drivers/net/ppp/pppox.c          |   4 +-
 drivers/net/ppp/pptp.c           |  40 ++++----
 drivers/tty/ipwireless/network.c |  30 +++---
 include/linux/if_pppox.h         |   2 +-
 include/linux/ppp_channel.h      |  49 ++++++----
 net/atm/pppoatm.c                |  61 ++++++------
 net/l2tp/l2tp_ppp.c              |  34 ++++---
 11 files changed, 271 insertions(+), 246 deletions(-)

diff --git a/drivers/net/ppp/ppp_async.c b/drivers/net/ppp/ppp_async.c
index 93a7b0f6c4e7..faa299cc3db9 100644
--- a/drivers/net/ppp/ppp_async.c
+++ b/drivers/net/ppp/ppp_async.c
@@ -67,7 +67,7 @@ struct asyncppp {
 
 	refcount_t	refcnt;
 	struct completion dead;
-	struct ppp_channel chan;	/* interface to generic ppp layer */
+	struct ppp_channel *chan;	/* interface to generic ppp layer */
 	unsigned char	obuf[OBUFSIZE];
 };
 
@@ -95,12 +95,12 @@ MODULE_ALIAS_LDISC(N_PPP);
  * Prototypes.
  */
 static int ppp_async_encode(struct asyncppp *ap);
-static int ppp_async_send(struct ppp_channel *chan, struct sk_buff *skb);
+static int ppp_async_send(void *private, struct sk_buff *skb);
 static int ppp_async_push(struct asyncppp *ap);
 static void ppp_async_flush_output(struct asyncppp *ap);
 static void ppp_async_input(struct asyncppp *ap, const unsigned char *buf,
 			    const u8 *flags, int count);
-static int ppp_async_ioctl(struct ppp_channel *chan, unsigned int cmd,
+static int ppp_async_ioctl(void *private, unsigned int cmd,
 			   unsigned long arg);
 static void ppp_async_process(struct tasklet_struct *t);
 
@@ -155,9 +155,10 @@ static void ap_put(struct asyncppp *ap)
 static int
 ppp_asynctty_open(struct tty_struct *tty)
 {
+	struct ppp_channel_conf conf = {};
+	struct ppp_channel *chan;
 	struct asyncppp *ap;
 	int err;
-	int speed;
 
 	if (tty->ops->write == NULL)
 		return -EOPNOTSUPP;
@@ -185,14 +186,18 @@ ppp_asynctty_open(struct tty_struct *tty)
 	refcount_set(&ap->refcnt, 1);
 	init_completion(&ap->dead);
 
-	ap->chan.private = ap;
-	ap->chan.ops = &async_ops;
-	ap->chan.mtu = PPP_MRU;
-	speed = tty_get_baud_rate(tty);
-	ap->chan.speed = speed;
-	err = ppp_register_channel(&ap->chan);
-	if (err)
+	conf.private = ap;
+	conf.ops = &async_ops;
+#ifdef CONFIG_PPP_MULTILINK
+	conf.mtu = PPP_MRU;
+	conf.speed = tty_get_baud_rate(tty);
+#endif
+	chan = ppp_register_channel(&conf);
+	if (!chan) {
+		err = -ENOMEM;
 		goto out_free;
+	}
+	ap->chan = chan;
 
 	tty->disc_data = ap;
 	tty->receive_room = 65536;
@@ -235,7 +240,7 @@ ppp_asynctty_close(struct tty_struct *tty)
 		wait_for_completion(&ap->dead);
 	tasklet_kill(&ap->tsk);
 
-	ppp_unregister_channel(&ap->chan);
+	ppp_unregister_channel(ap->chan);
 	kfree_skb(ap->rpkt);
 	skb_queue_purge(&ap->rqueue);
 	kfree_skb(ap->tpkt);
@@ -293,14 +298,14 @@ ppp_asynctty_ioctl(struct tty_struct *tty, unsigned int cmd, unsigned long arg)
 	switch (cmd) {
 	case PPPIOCGCHAN:
 		err = -EFAULT;
-		if (put_user(ppp_channel_index(&ap->chan), p))
+		if (put_user(ppp_channel_index(ap->chan), p))
 			break;
 		err = 0;
 		break;
 
 	case PPPIOCGUNIT:
 		err = -EFAULT;
-		if (put_user(ppp_unit_number(&ap->chan), p))
+		if (put_user(ppp_unit_number(ap->chan), p))
 			break;
 		err = 0;
 		break;
@@ -391,9 +396,9 @@ ppp_async_init(void)
  * The following routines provide the PPP channel interface.
  */
 static int
-ppp_async_ioctl(struct ppp_channel *chan, unsigned int cmd, unsigned long arg)
+ppp_async_ioctl(void *private, unsigned int cmd, unsigned long arg)
 {
-	struct asyncppp *ap = chan->private;
+	struct asyncppp *ap = private;
 	void __user *argp = (void __user *)arg;
 	int __user *p = argp;
 	int err, val;
@@ -491,13 +496,13 @@ static void ppp_async_process(struct tasklet_struct *t)
 	/* process received packets */
 	while ((skb = skb_dequeue(&ap->rqueue)) != NULL) {
 		if (skb->cb[0])
-			ppp_input_error(&ap->chan);
-		ppp_input(&ap->chan, skb);
+			ppp_input_error(ap->chan);
+		ppp_input(ap->chan, skb);
 	}
 
 	/* try to push more stuff out */
 	if (test_bit(XMIT_WAKEUP, &ap->xmit_flags) && ppp_async_push(ap))
-		ppp_output_wakeup(&ap->chan);
+		ppp_output_wakeup(ap->chan);
 }
 
 /*
@@ -620,9 +625,9 @@ ppp_async_encode(struct asyncppp *ap)
  * at some later time.
  */
 static int
-ppp_async_send(struct ppp_channel *chan, struct sk_buff *skb)
+ppp_async_send(void *private, struct sk_buff *skb)
 {
-	struct asyncppp *ap = chan->private;
+	struct asyncppp *ap = private;
 
 	ppp_async_push(ap);
 
@@ -733,7 +738,7 @@ ppp_async_flush_output(struct asyncppp *ap)
 	}
 	spin_unlock_bh(&ap->xmit_lock);
 	if (done)
-		ppp_output_wakeup(&ap->chan);
+		ppp_output_wakeup(ap->chan);
 }
 
 /*
@@ -992,7 +997,7 @@ static void async_lcp_peek(struct asyncppp *ap, unsigned char *data,
 			if (inbound)
 				ap->mru = val;
 			else
-				ap->chan.mtu = val;
+				ppp_channel_update_mtu(ap->chan, val);
 			break;
 		case LCP_ASYNCMAP:
 			val = get_unaligned_be32(data + 2);
diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index fd2889e374c9..882709551bbd 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -106,7 +106,7 @@ struct ppp_file {
 #define PF_TO_X(pf, X)		container_of(pf, X, file)
 
 #define PF_TO_PPP(pf)		PF_TO_X(pf, struct ppp)
-#define PF_TO_CHANNEL(pf)	PF_TO_X(pf, struct channel)
+#define PF_TO_CHANNEL(pf)	PF_TO_X(pf, struct ppp_channel)
 
 struct ppp_xmit_recursion {
 	struct task_struct *owner;
@@ -172,10 +172,11 @@ struct ppp {
  * Private data structure for each channel.
  * This includes the data structure used for multilink.
  */
-struct channel {
+struct ppp_channel {
 	struct ppp_file	file;		/* stuff for read/write/poll */
 	struct list_head list;		/* link in all/new_channels list */
-	struct ppp_channel *chan;	/* public channel data structure */
+	const struct ppp_channel_ops *ops; /* operations for this channel */
+	void *private;			/* channel private data */
 	struct rw_semaphore chan_sem;	/* protects `chan' during chan ioctl */
 	spinlock_t	downl;		/* protects `chan', file.xq dequeue */
 	struct ppp __rcu *ppp;		/* ppp unit we're connected to */
@@ -183,11 +184,13 @@ struct channel {
 	netns_tracker	ns_tracker;
 	struct list_head clist;		/* link in list of channels per unit */
 	spinlock_t	upl;		/* protects `ppp' and 'bridge' */
-	struct channel __rcu *bridge;	/* "bridged" ppp channel */
+	struct ppp_channel __rcu *bridge;	/* "bridged" ppp channel */
+	bool direct_xmit;		/* no qdisc, xmit directly */
 #ifdef CONFIG_PPP_MULTILINK
 	u8		avail;		/* flag used in multilink stuff */
 	u8		had_frag;	/* >= 1 fragments have been sent */
 	u32		lastseq;	/* MP: last sequence # received */
+	int		mtu;		/* max transmit packet size */
 	int		speed;		/* speed of the corresponding ppp channel*/
 #endif /* CONFIG_PPP_MULTILINK */
 };
@@ -265,16 +268,16 @@ static int ppp_unattached_ioctl(struct net *net, struct ppp_file *pf,
 static void ppp_xmit_process(struct ppp *ppp, struct sk_buff *skb);
 static int ppp_prepare_tx_skb(struct ppp *ppp, struct sk_buff **pskb);
 static int ppp_push(struct ppp *ppp, struct sk_buff *skb);
-static void ppp_channel_push(struct channel *pch);
+static void ppp_channel_push(struct ppp_channel *pch);
 static void ppp_receive_frame(struct ppp *ppp, struct sk_buff *skb,
-			      struct channel *pch);
+			      struct ppp_channel *pch);
 static void ppp_receive_error(struct ppp *ppp);
 static void ppp_receive_nonmp_frame(struct ppp *ppp, struct sk_buff *skb);
 static struct sk_buff *ppp_decompress_frame(struct ppp *ppp,
 					    struct sk_buff *skb);
 #ifdef CONFIG_PPP_MULTILINK
 static void ppp_receive_mp_frame(struct ppp *ppp, struct sk_buff *skb,
-				struct channel *pch);
+				struct ppp_channel *pch);
 static void ppp_mp_insert(struct ppp *ppp, struct sk_buff *skb);
 static struct sk_buff *ppp_mp_reconstruct(struct ppp *ppp);
 static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb);
@@ -288,10 +291,10 @@ static int ppp_create_interface(struct net *net, struct file *file, int *unit);
 static void init_ppp_file(struct ppp_file *pf, int kind);
 static void ppp_release_interface(struct ppp *ppp);
 static struct ppp *ppp_find_unit(struct ppp_net *pn, int unit);
-static struct channel *ppp_find_channel(struct ppp_net *pn, int unit);
-static int ppp_connect_channel(struct channel *pch, int unit);
-static int ppp_disconnect_channel(struct channel *pch);
-static void ppp_release_channel(struct channel *pch);
+static struct ppp_channel *ppp_find_channel(struct ppp_net *pn, int unit);
+static int ppp_connect_channel(struct ppp_channel *pch, int unit);
+static int ppp_disconnect_channel(struct ppp_channel *pch);
+static void ppp_release_channel(struct ppp_channel *pch);
 static int unit_get(struct idr *p, void *ptr, int min);
 static int unit_set(struct idr *p, void *ptr, int n);
 static void unit_put(struct idr *p, int n);
@@ -638,7 +641,7 @@ static struct bpf_prog *compat_ppp_get_filter(struct sock_fprog32 __user *p)
  * Once successfully bridged, each channel holds a reference on the other
  * to prevent it being freed while the bridge is extant.
  */
-static int ppp_bridge_channels(struct channel *pch, struct channel *pchb)
+static int ppp_bridge_channels(struct ppp_channel *pch, struct ppp_channel *pchb)
 {
 	spin_lock(&pch->upl);
 	if (rcu_dereference_protected(pch->ppp, lockdep_is_held(&pch->upl)) ||
@@ -676,9 +679,9 @@ static int ppp_bridge_channels(struct channel *pch, struct channel *pchb)
 	return -EALREADY;
 }
 
-static int ppp_unbridge_channels(struct channel *pch)
+static int ppp_unbridge_channels(struct ppp_channel *pch)
 {
-	struct channel *pchb, *pchbb;
+	struct ppp_channel *pchb, *pchbb;
 
 	spin_lock(&pch->upl);
 	pchb = rcu_dereference_protected(pch->bridge, lockdep_is_held(&pch->upl));
@@ -745,8 +748,7 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	}
 
 	if (pf->kind == CHANNEL) {
-		struct channel *pch, *pchb;
-		struct ppp_channel *chan;
+		struct ppp_channel *pch, *pchb;
 		struct ppp_net *pn;
 
 		pch = PF_TO_CHANNEL(pf);
@@ -788,10 +790,9 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 		default:
 			down_read(&pch->chan_sem);
-			chan = pch->chan;
 			err = -ENOTTY;
-			if (!pch->file.dead && chan->ops->ioctl)
-				err = chan->ops->ioctl(chan, cmd, arg);
+			if (!pch->file.dead && pch->ops->ioctl)
+				err = pch->ops->ioctl(pch->private, cmd, arg);
 			up_read(&pch->chan_sem);
 		}
 		goto out;
@@ -1044,7 +1045,7 @@ static int ppp_unattached_ioctl(struct net *net, struct ppp_file *pf,
 {
 	int unit, err = -EFAULT;
 	struct ppp *ppp;
-	struct channel *chan;
+	struct ppp_channel *chan;
 	struct ppp_net *pn;
 	int __user *p = (int __user *)arg;
 
@@ -1586,21 +1587,19 @@ static int ppp_fill_forward_path(struct net_device_path_ctx *ctx,
 				 struct net_device_path *path)
 {
 	struct ppp *ppp = netdev_priv(ctx->dev);
-	struct ppp_channel *chan;
-	struct channel *pch;
+	struct ppp_channel *pch;
 
 	if (ppp->flags & SC_MULTILINK)
 		return -EOPNOTSUPP;
 
-	pch = list_first_or_null_rcu(&ppp->channels, struct channel, clist);
+	pch = list_first_or_null_rcu(&ppp->channels, struct ppp_channel, clist);
 	if (!pch)
 		return -ENODEV;
 
-	chan = pch->chan;
-	if (!chan->ops->fill_forward_path)
+	if (!pch->ops->fill_forward_path)
 		return -EOPNOTSUPP;
 
-	return chan->ops->fill_forward_path(ctx, path, chan);
+	return pch->ops->fill_forward_path(ctx, path, pch->private);
 }
 
 static const struct net_device_ops ppp_netdev_ops = {
@@ -1901,7 +1900,6 @@ static int
 ppp_push(struct ppp *ppp, struct sk_buff *skb)
 {
 	struct list_head *list;
-	struct channel *pch;
 
 	list = &ppp->channels;
 	if (list_empty(list)) {
@@ -1911,15 +1909,14 @@ ppp_push(struct ppp *ppp, struct sk_buff *skb)
 	}
 
 	if ((ppp->flags & SC_MULTILINK) == 0) {
-		struct ppp_channel *chan;
+		struct ppp_channel *pch;
 		int ret;
 		/* not doing multilink: send it down the first channel */
 		list = list->next;
-		pch = list_entry(list, struct channel, clist);
+		pch = list_entry(list, struct ppp_channel, clist);
 
 		spin_lock(&pch->downl);
-		chan = pch->chan;
-		if (unlikely(!chan->direct_xmit && skb_linearize(skb))) {
+		if (unlikely(!pch->direct_xmit && skb_linearize(skb))) {
 			/* channel requires a linear skb but linearization
 			 * failed
 			 */
@@ -1928,7 +1925,7 @@ ppp_push(struct ppp *ppp, struct sk_buff *skb)
 			goto out;
 		}
 
-		ret = chan->ops->start_xmit(chan, skb);
+		ret = pch->ops->start_xmit(pch->private, skb);
 
 out:
 		spin_unlock(&pch->downl);
@@ -1967,9 +1964,8 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 	int totfree;
 	unsigned char *p, *q;
 	struct list_head *list;
-	struct channel *pch;
+	struct ppp_channel *pch;
 	struct sk_buff *frag;
-	struct ppp_channel *chan;
 
 	totspeed = 0; /*total bitrate of the bundle*/
 	nfree = 0; /* # channels which have no packet already queued */
@@ -1984,8 +1980,6 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 	list_for_each_entry(pch, &ppp->channels, clist) {
 		pch->avail = 1;
 		navail++;
-		pch->speed = pch->chan->speed;
-
 		if (skb_queue_empty(&pch->file.xq) || !pch->had_frag) {
 			if (pch->speed == 0)
 				nzero++;
@@ -2041,7 +2035,7 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 			i = 0;
 			continue;
 		}
-		pch = list_entry(list, struct channel, clist);
+		pch = list_entry(list, struct ppp_channel, clist);
 		++i;
 		if (!pch->avail)
 			continue;
@@ -2108,7 +2102,7 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 		 * MTU counts only the payload excluding the protocol field.
 		 * (RFC1661 Section 2)
 		 */
-		mtu = pch->chan->mtu - (hdrlen - 2);
+		mtu = pch->mtu - (hdrlen - 2);
 		if (mtu < 4)
 			mtu = 4;
 		if (flen > mtu)
@@ -2135,9 +2129,8 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 		memcpy(q + hdrlen, p, flen);
 
 		/* try to send it down the channel */
-		chan = pch->chan;
 		if (!skb_queue_empty(&pch->file.xq) ||
-			!chan->ops->start_xmit(chan, frag))
+			!pch->ops->start_xmit(pch->private, frag))
 			skb_queue_tail(&pch->file.xq, frag);
 		pch->had_frag = 1;
 		p += flen;
@@ -2162,7 +2155,7 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 #endif /* CONFIG_PPP_MULTILINK */
 
 /* Try to send data out on a channel */
-static void __ppp_channel_push(struct channel *pch, struct ppp *ppp)
+static void __ppp_channel_push(struct ppp_channel *pch, struct ppp *ppp)
 {
 	struct sk_buff *skb;
 
@@ -2170,7 +2163,7 @@ static void __ppp_channel_push(struct channel *pch, struct ppp *ppp)
 	if (!pch->file.dead) {
 		while (!skb_queue_empty(&pch->file.xq)) {
 			skb = skb_dequeue(&pch->file.xq);
-			if (!pch->chan->ops->start_xmit(pch->chan, skb)) {
+			if (!pch->ops->start_xmit(pch->private, skb)) {
 				/* put the packet back and try again later */
 				skb_queue_head(&pch->file.xq, skb);
 				break;
@@ -2192,7 +2185,7 @@ static void __ppp_channel_push(struct channel *pch, struct ppp *ppp)
 	}
 }
 
-static void ppp_channel_push(struct channel *pch)
+static void ppp_channel_push(struct ppp_channel *pch)
 {
 	struct ppp_xmit_recursion *xmit_recursion;
 	struct ppp *ppp;
@@ -2223,7 +2216,7 @@ struct ppp_mp_skb_parm {
 #define PPP_MP_CB(skb)	((struct ppp_mp_skb_parm *)((skb)->cb))
 
 static inline void
-ppp_do_recv(struct ppp *ppp, struct sk_buff *skb, struct channel *pch)
+ppp_do_recv(struct ppp *ppp, struct sk_buff *skb, struct ppp_channel *pch)
 {
 	ppp_recv_lock(ppp);
 	if (!ppp->closing)
@@ -2278,9 +2271,9 @@ static bool ppp_decompress_proto(struct sk_buff *skb)
  * If not, the caller must handle the frame by normal recv mechanisms.
  * Returns true if the frame is consumed, false otherwise.
  */
-static bool ppp_channel_bridge_input(struct channel *pch, struct sk_buff *skb)
+static bool ppp_channel_bridge_input(struct ppp_channel *pch, struct sk_buff *skb)
 {
-	struct channel *pchb;
+	struct ppp_channel *pchb;
 
 	rcu_read_lock();
 	pchb = rcu_dereference(pch->bridge);
@@ -2295,7 +2288,7 @@ static bool ppp_channel_bridge_input(struct channel *pch, struct sk_buff *skb)
 	}
 
 	skb_scrub_packet(skb, !net_eq(pch->chan_net, pchb->chan_net));
-	if (!pchb->chan->ops->start_xmit(pchb->chan, skb))
+	if (!pchb->ops->start_xmit(pchb->private, skb))
 		kfree_skb(skb);
 
 outl:
@@ -2308,9 +2301,8 @@ static bool ppp_channel_bridge_input(struct channel *pch, struct sk_buff *skb)
 }
 
 void
-ppp_input(struct ppp_channel *chan, struct sk_buff *skb)
+ppp_input(struct ppp_channel *pch, struct sk_buff *skb)
 {
-	struct channel *pch = chan->ppp;
 	struct ppp *ppp;
 	int proto;
 
@@ -2352,9 +2344,8 @@ ppp_input(struct ppp_channel *chan, struct sk_buff *skb)
 }
 
 void
-ppp_input_error(struct ppp_channel *chan)
+ppp_input_error(struct ppp_channel *pch)
 {
-	struct channel *pch = chan->ppp;
 	struct ppp *ppp;
 
 	if (!pch)
@@ -2375,7 +2366,7 @@ ppp_input_error(struct ppp_channel *chan)
  * The receive side of the ppp unit is locked.
  */
 static void
-ppp_receive_frame(struct ppp *ppp, struct sk_buff *skb, struct channel *pch)
+ppp_receive_frame(struct ppp *ppp, struct sk_buff *skb, struct ppp_channel *pch)
 {
 	skb_checksum_complete_unset(skb);
 #ifdef CONFIG_PPP_MULTILINK
@@ -2611,10 +2602,10 @@ ppp_decompress_frame(struct ppp *ppp, struct sk_buff *skb)
  * as many completed frames as we can.
  */
 static void
-ppp_receive_mp_frame(struct ppp *ppp, struct sk_buff *skb, struct channel *pch)
+ppp_receive_mp_frame(struct ppp *ppp, struct sk_buff *skb, struct ppp_channel *pch)
 {
 	u32 mask, seq;
-	struct channel *ch;
+	struct ppp_channel *ch;
 	int mphdrlen = (ppp->flags & SC_MP_SHORTSEQ)? MPHDRLEN_SSN: MPHDRLEN;
 
 	if (!pskb_may_pull(skb, mphdrlen + 1) || ppp->mrru == 0)
@@ -2885,6 +2876,13 @@ ppp_mp_reconstruct(struct ppp *ppp)
 
 	return skb;
 }
+
+/* Update the MTU of a multilink channel */
+void ppp_channel_update_mtu(struct ppp_channel *pch, int mtu)
+{
+	pch->mtu = mtu;
+}
+EXPORT_SYMBOL(ppp_channel_update_mtu);
 #endif /* CONFIG_PPP_MULTILINK */
 
 /*
@@ -2892,29 +2890,33 @@ ppp_mp_reconstruct(struct ppp *ppp)
  */
 
 /* Create a new, unattached ppp channel. */
-int ppp_register_channel(struct ppp_channel *chan)
+struct ppp_channel *ppp_register_channel(const struct ppp_channel_conf *conf)
 {
-	return ppp_register_net_channel(current->nsproxy->net_ns, chan);
+	return ppp_register_net_channel(current->nsproxy->net_ns, conf);
 }
 
 /* Create a new, unattached ppp channel for specified net. */
-int ppp_register_net_channel(struct net *net, struct ppp_channel *chan)
+struct ppp_channel *ppp_register_net_channel(struct net *net,
+					     const struct ppp_channel_conf *conf)
 {
-	struct channel *pch;
+	struct ppp_channel *pch;
 	struct ppp_net *pn;
 
-	pch = kzalloc_obj(struct channel);
+	pch = kzalloc_obj(struct ppp_channel);
 	if (!pch)
-		return -ENOMEM;
+		return NULL;
 
 	pn = ppp_pernet(net);
 
-	pch->chan = chan;
 	pch->chan_net = get_net_track(net, &pch->ns_tracker, GFP_KERNEL);
-	chan->ppp = pch;
 	init_ppp_file(&pch->file, CHANNEL);
-	pch->file.hdrlen = chan->hdrlen;
+	pch->file.hdrlen = conf->hdrlen;
+	pch->ops = conf->ops;
+	pch->private = conf->private;
+	pch->direct_xmit = conf->direct_xmit;
 #ifdef CONFIG_PPP_MULTILINK
+	pch->speed = conf->speed;
+	pch->mtu = conf->mtu;
 	pch->lastseq = -1;
 #endif /* CONFIG_PPP_MULTILINK */
 	init_rwsem(&pch->chan_sem);
@@ -2927,16 +2929,14 @@ int ppp_register_net_channel(struct net *net, struct ppp_channel *chan)
 	atomic_inc(&channel_count);
 	spin_unlock_bh(&pn->all_channels_lock);
 
-	return 0;
+	return pch;
 }
 
 /*
  * Return the index of a channel.
  */
-int ppp_channel_index(struct ppp_channel *chan)
+int ppp_channel_index(struct ppp_channel *pch)
 {
-	struct channel *pch = chan->ppp;
-
 	if (pch)
 		return pch->file.index;
 	return -1;
@@ -2945,9 +2945,8 @@ int ppp_channel_index(struct ppp_channel *chan)
 /*
  * Return the PPP unit number to which a channel is connected.
  */
-int ppp_unit_number(struct ppp_channel *chan)
+int ppp_unit_number(struct ppp_channel *pch)
 {
-	struct channel *pch = chan->ppp;
 	struct ppp *ppp;
 	int unit = -1;
 
@@ -2965,9 +2964,8 @@ int ppp_unit_number(struct ppp_channel *chan)
  * Return the PPP device interface name of a channel.
  * Caller must hold RCU read lock.
  */
-char *ppp_dev_name(struct ppp_channel *chan)
+char *ppp_dev_name(struct ppp_channel *pch)
 {
-	struct channel *pch = chan->ppp;
 	char *name = NULL;
 	struct ppp *ppp;
 
@@ -2985,16 +2983,13 @@ char *ppp_dev_name(struct ppp_channel *chan)
  * This must be called in process context.
  */
 void
-ppp_unregister_channel(struct ppp_channel *chan)
+ppp_unregister_channel(struct ppp_channel *pch)
 {
-	struct channel *pch = chan->ppp;
 	struct ppp_net *pn;
 
 	if (!pch)
 		return;		/* should never happen */
 
-	chan->ppp = NULL;
-
 	/*
 	 * This ensures that we have returned from any calls into
 	 * the channel's start_xmit or ioctl routine before we proceed.
@@ -3023,10 +3018,8 @@ ppp_unregister_channel(struct ppp_channel *chan)
  * This should be called at BH/softirq level, not interrupt level.
  */
 void
-ppp_output_wakeup(struct ppp_channel *chan)
+ppp_output_wakeup(struct ppp_channel *pch)
 {
-	struct channel *pch = chan->ppp;
-
 	if (!pch)
 		return;
 	ppp_channel_push(pch);
@@ -3459,10 +3452,10 @@ ppp_find_unit(struct ppp_net *pn, int unit)
  * we move it to the all_channels list.  This is for speed
  * when we have a lot of channels in use.
  */
-static struct channel *
+static struct ppp_channel *
 ppp_find_channel(struct ppp_net *pn, int unit)
 {
-	struct channel *pch;
+	struct ppp_channel *pch;
 
 	list_for_each_entry(pch, &pn->new_channels, list) {
 		if (pch->file.index == unit) {
@@ -3483,7 +3476,7 @@ ppp_find_channel(struct ppp_net *pn, int unit)
  * Connect a PPP channel to a PPP interface unit.
  */
 static int
-ppp_connect_channel(struct channel *pch, int unit)
+ppp_connect_channel(struct ppp_channel *pch, int unit)
 {
 	struct ppp *ppp;
 	struct ppp_net *pn;
@@ -3511,7 +3504,7 @@ ppp_connect_channel(struct channel *pch, int unit)
 		ret = -ENOTCONN;
 		goto outl;
 	}
-	if (pch->chan->direct_xmit)
+	if (pch->direct_xmit)
 		ppp->dev->priv_flags |= IFF_NO_QUEUE;
 	else
 		ppp->dev->priv_flags &= ~IFF_NO_QUEUE;
@@ -3539,7 +3532,7 @@ ppp_connect_channel(struct channel *pch, int unit)
  * Disconnect a channel from its ppp unit.
  */
 static int
-ppp_disconnect_channel(struct channel *pch)
+ppp_disconnect_channel(struct ppp_channel *pch)
 {
 	struct ppp *ppp;
 	int err = -EINVAL;
@@ -3565,7 +3558,7 @@ ppp_disconnect_channel(struct channel *pch)
  * Drop a reference to a ppp channel and free its memory if the refcount reaches
  * zero.
  */
-static void ppp_release_channel(struct channel *pch)
+static void ppp_release_channel(struct ppp_channel *pch)
 {
 	if (!refcount_dec_and_test(&pch->file.refcnt))
 		return;
diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
index b7f243b416f8..d84c267f4da1 100644
--- a/drivers/net/ppp/ppp_synctty.c
+++ b/drivers/net/ppp/ppp_synctty.c
@@ -71,7 +71,7 @@ struct syncppp {
 
 	refcount_t	refcnt;
 	struct completion dead_cmp;
-	struct ppp_channel chan;	/* interface to generic ppp layer */
+	struct ppp_channel *chan;	/* interface to generic ppp layer */
 };
 
 /* Bit numbers in xmit_flags */
@@ -87,8 +87,8 @@ struct syncppp {
  * Prototypes.
  */
 static struct sk_buff* ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *);
-static int ppp_sync_send(struct ppp_channel *chan, struct sk_buff *skb);
-static int ppp_sync_ioctl(struct ppp_channel *chan, unsigned int cmd,
+static int ppp_sync_send(void *private, struct sk_buff *skb);
+static int ppp_sync_ioctl(void *private, unsigned int cmd,
 			  unsigned long arg);
 static void ppp_sync_process(struct tasklet_struct *t);
 static int ppp_sync_push(struct syncppp *ap);
@@ -155,9 +155,10 @@ static void sp_put(struct syncppp *ap)
 static int
 ppp_sync_open(struct tty_struct *tty)
 {
+	struct ppp_channel_conf conf = {};
+	struct ppp_channel *chan;
 	struct syncppp *ap;
 	int err;
-	int speed;
 
 	if (tty->ops->write == NULL)
 		return -EOPNOTSUPP;
@@ -182,15 +183,19 @@ ppp_sync_open(struct tty_struct *tty)
 	refcount_set(&ap->refcnt, 1);
 	init_completion(&ap->dead_cmp);
 
-	ap->chan.private = ap;
-	ap->chan.ops = &sync_ops;
-	ap->chan.mtu = PPP_MRU;
-	ap->chan.hdrlen = 2;	/* for A/C bytes */
-	speed = tty_get_baud_rate(tty);
-	ap->chan.speed = speed;
-	err = ppp_register_channel(&ap->chan);
-	if (err)
+	conf.private = ap;
+	conf.ops = &sync_ops;
+	conf.hdrlen = 2;	/* for A/C bytes */
+#ifdef CONFIG_PPP_MULTILINK
+	conf.mtu = PPP_MRU;
+	conf.speed = tty_get_baud_rate(tty);
+#endif
+	chan = ppp_register_channel(&conf);
+	if (!chan) {
+		err = -ENOMEM;
 		goto out_free;
+	}
+	ap->chan = chan;
 
 	tty->disc_data = ap;
 	tty->receive_room = 65536;
@@ -233,7 +238,7 @@ ppp_sync_close(struct tty_struct *tty)
 		wait_for_completion(&ap->dead_cmp);
 	tasklet_kill(&ap->tsk);
 
-	ppp_unregister_channel(&ap->chan);
+	ppp_unregister_channel(ap->chan);
 	skb_queue_purge(&ap->rqueue);
 	kfree_skb(ap->tpkt);
 	kfree(ap);
@@ -285,14 +290,14 @@ ppp_synctty_ioctl(struct tty_struct *tty, unsigned int cmd, unsigned long arg)
 	switch (cmd) {
 	case PPPIOCGCHAN:
 		err = -EFAULT;
-		if (put_user(ppp_channel_index(&ap->chan), p))
+		if (put_user(ppp_channel_index(ap->chan), p))
 			break;
 		err = 0;
 		break;
 
 	case PPPIOCGUNIT:
 		err = -EFAULT;
-		if (put_user(ppp_unit_number(&ap->chan), p))
+		if (put_user(ppp_unit_number(ap->chan), p))
 			break;
 		err = 0;
 		break;
@@ -383,9 +388,9 @@ ppp_sync_init(void)
  * The following routines provide the PPP channel interface.
  */
 static int
-ppp_sync_ioctl(struct ppp_channel *chan, unsigned int cmd, unsigned long arg)
+ppp_sync_ioctl(void *private, unsigned int cmd, unsigned long arg)
 {
-	struct syncppp *ap = chan->private;
+	struct syncppp *ap = private;
 	int err, val;
 	u32 accm[8];
 	void __user *argp = (void __user *)arg;
@@ -483,16 +488,16 @@ static void ppp_sync_process(struct tasklet_struct *t)
 	while ((skb = skb_dequeue(&ap->rqueue)) != NULL) {
 		if (skb->len == 0) {
 			/* zero length buffers indicate error */
-			ppp_input_error(&ap->chan);
+			ppp_input_error(ap->chan);
 			kfree_skb(skb);
 		}
 		else
-			ppp_input(&ap->chan, skb);
+			ppp_input(ap->chan, skb);
 	}
 
 	/* try to push more stuff out */
 	if (test_bit(XMIT_WAKEUP, &ap->xmit_flags) && ppp_sync_push(ap))
-		ppp_output_wakeup(&ap->chan);
+		ppp_output_wakeup(ap->chan);
 }
 
 /*
@@ -562,9 +567,9 @@ ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *skb)
  * at some later time.
  */
 static int
-ppp_sync_send(struct ppp_channel *chan, struct sk_buff *skb)
+ppp_sync_send(void *private, struct sk_buff *skb)
 {
-	struct syncppp *ap = chan->private;
+	struct syncppp *ap = private;
 
 	ppp_sync_push(ap);
 
@@ -649,7 +654,7 @@ ppp_sync_flush_output(struct syncppp *ap)
 	}
 	spin_unlock_bh(&ap->xmit_lock);
 	if (done)
-		ppp_output_wakeup(&ap->chan);
+		ppp_output_wakeup(ap->chan);
 }
 
 /*
diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index d546a7af0d54..47d36d071775 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -357,7 +357,7 @@ static int pppoe_rcv_core(struct sock *sk, struct sk_buff *skb)
 	 */
 
 	if (sk->sk_state & PPPOX_BOUND) {
-		ppp_input(&po->chan, skb);
+		ppp_input(po->chan, skb);
 	} else {
 		if (sock_queue_rcv_skb(sk, skb))
 			goto abort_kfree;
@@ -625,7 +625,7 @@ static int pppoe_connect(struct socket *sock, struct sockaddr_unsized *uservaddr
 
 		po->pppoe_ifindex = 0;
 		memset(&po->pppoe_pa, 0, sizeof(po->pppoe_pa));
-		memset(&po->chan, 0, sizeof(po->chan));
+		po->chan = NULL;
 		po->next = NULL;
 		po->num = 0;
 
@@ -634,6 +634,9 @@ static int pppoe_connect(struct socket *sock, struct sockaddr_unsized *uservaddr
 
 	/* Re-bind in session stage only */
 	if (stage_session(sp->sa_addr.pppoe.sid)) {
+		struct ppp_channel_conf conf = {};
+		struct ppp_channel *chan;
+
 		error = -ENODEV;
 		net = sock_net(sk);
 		dev = dev_get_by_name(net, sp->sa_addr.pppoe.dev);
@@ -657,20 +660,23 @@ static int pppoe_connect(struct socket *sock, struct sockaddr_unsized *uservaddr
 		if (error < 0)
 			goto err_put;
 
-		po->chan.hdrlen = (sizeof(struct pppoe_hdr) +
+		conf.hdrlen = (sizeof(struct pppoe_hdr) +
 				   dev->hard_header_len);
+#ifdef CONFIG_PPP_MULTILINK
+		conf.mtu = dev->mtu - sizeof(struct pppoe_hdr) - 2;
+#endif
+		conf.private = sk;
+		conf.ops = &pppoe_chan_ops;
+		conf.direct_xmit = true;
 
-		po->chan.mtu = dev->mtu - sizeof(struct pppoe_hdr) - 2;
-		po->chan.private = sk;
-		po->chan.ops = &pppoe_chan_ops;
-		po->chan.direct_xmit = true;
-
-		error = ppp_register_net_channel(dev_net(dev), &po->chan);
-		if (error) {
+		chan = ppp_register_net_channel(dev_net(dev), &conf);
+		if (!chan) {
+			error = -ENOMEM;
 			delete_item(pn, po->pppoe_pa.sid,
 				    po->pppoe_pa.remote, po->pppoe_ifindex);
 			goto err_put;
 		}
+		po->chan = chan;
 
 		sk->sk_state = PPPOX_CONNECTED;
 	}
@@ -891,17 +897,17 @@ static int __pppoe_xmit(struct sock *sk, struct sk_buff *skb)
  * sends PPP frame over PPPoE socket
  *
  ***********************************************************************/
-static int pppoe_xmit(struct ppp_channel *chan, struct sk_buff *skb)
+static int pppoe_xmit(void *private, struct sk_buff *skb)
 {
-	struct sock *sk = chan->private;
+	struct sock *sk = private;
 	return __pppoe_xmit(sk, skb);
 }
 
 static int pppoe_fill_forward_path(struct net_device_path_ctx *ctx,
 				   struct net_device_path *path,
-				   const struct ppp_channel *chan)
+				   void *private)
 {
-	struct sock *sk = chan->private;
+	struct sock *sk = private;
 	struct pppox_sock *po = pppox_sk(sk);
 	struct net_device *dev = po->pppoe_dev;
 
diff --git a/drivers/net/ppp/pppox.c b/drivers/net/ppp/pppox.c
index 5861a2f6ce3e..df4fb23a926d 100644
--- a/drivers/net/ppp/pppox.c
+++ b/drivers/net/ppp/pppox.c
@@ -55,7 +55,7 @@ void pppox_unbind_sock(struct sock *sk)
 	/* Clear connection to ppp device, if attached. */
 
 	if (sk->sk_state & (PPPOX_BOUND | PPPOX_CONNECTED)) {
-		ppp_unregister_channel(&pppox_sk(sk)->chan);
+		ppp_unregister_channel(pppox_sk(sk)->chan);
 		sk->sk_state = PPPOX_DEAD;
 	}
 }
@@ -80,7 +80,7 @@ int pppox_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 			break;
 
 		rc = -EINVAL;
-		index = ppp_channel_index(&po->chan);
+		index = ppp_channel_index(po->chan);
 		if (put_user(index , (int __user *) arg))
 			break;
 
diff --git a/drivers/net/ppp/pptp.c b/drivers/net/ppp/pptp.c
index cc8c102122d8..e49abbe63bf1 100644
--- a/drivers/net/ppp/pptp.c
+++ b/drivers/net/ppp/pptp.c
@@ -146,9 +146,9 @@ static struct rtable *pptp_route_output(const struct pppox_sock *po,
 	return ip_route_output_flow(net, fl4, sk);
 }
 
-static int pptp_xmit(struct ppp_channel *chan, struct sk_buff *skb)
+static int pptp_xmit(void *private, struct sk_buff *skb)
 {
-	struct sock *sk = chan->private;
+	struct sock *sk = private;
 	struct pppox_sock *po = pppox_sk(sk);
 	struct net *net = sock_net(sk);
 	struct pptp_opt *opt = &po->proto.pptp;
@@ -338,7 +338,7 @@ static int pptp_rcv_core(struct sock *sk, struct sk_buff *skb)
 
 		skb->ip_summed = CHECKSUM_NONE;
 		skb_set_network_header(skb, skb->head-skb->data);
-		ppp_input(&po->chan, skb);
+		ppp_input(po->chan, skb);
 
 		return NET_RX_SUCCESS;
 	}
@@ -422,6 +422,8 @@ static int pptp_connect(struct socket *sock, struct sockaddr_unsized *uservaddr,
 	struct sockaddr_pppox *sp = (struct sockaddr_pppox *) uservaddr;
 	struct pppox_sock *po = pppox_sk(sk);
 	struct pptp_opt *opt = &po->proto.pptp;
+	struct ppp_channel_conf conf = {};
+	struct ppp_channel *chan;
 	struct rtable *rt;
 	struct flowi4 fl4;
 	int error = 0;
@@ -453,9 +455,6 @@ static int pptp_connect(struct socket *sock, struct sockaddr_unsized *uservaddr,
 		goto end;
 	}
 
-	po->chan.private = sk;
-	po->chan.ops = &pptp_chan_ops;
-
 	rt = pptp_route_output(po, &fl4);
 	if (IS_ERR(rt)) {
 		error = -EHOSTUNREACH;
@@ -463,18 +462,23 @@ static int pptp_connect(struct socket *sock, struct sockaddr_unsized *uservaddr,
 	}
 	sk_setup_caps(sk, &rt->dst);
 
-	po->chan.mtu = dst_mtu(&rt->dst);
-	if (!po->chan.mtu)
-		po->chan.mtu = PPP_MRU;
-	po->chan.mtu -= PPTP_HEADER_OVERHEAD;
-
-	po->chan.hdrlen = 2 + sizeof(struct pptp_gre_header);
-	po->chan.direct_xmit = true;
-	error = ppp_register_channel(&po->chan);
-	if (error) {
+	conf.private = sk;
+	conf.ops = &pptp_chan_ops;
+	conf.hdrlen = 2 + sizeof(struct pptp_gre_header);
+	conf.direct_xmit = true;
+#ifdef CONFIG_PPP_MULTILINK
+	conf.mtu = dst_mtu(&rt->dst);
+	if (!conf.mtu)
+		conf.mtu = PPP_MRU;
+	conf.mtu -= PPTP_HEADER_OVERHEAD;
+#endif
+	chan = ppp_register_channel(&conf);
+	if (!chan) {
+		error = -ENOMEM;
 		pr_err("PPTP: failed to register PPP channel (%d)\n", error);
 		goto end;
 	}
+	po->chan = chan;
 
 	opt->dst_addr = sp->sa_addr.pptp;
 	sk->sk_state |= PPPOX_CONNECTED;
@@ -577,10 +581,10 @@ static int pptp_create(struct net *net, struct socket *sock, int kern)
 	return error;
 }
 
-static int pptp_ppp_ioctl(struct ppp_channel *chan, unsigned int cmd,
-	unsigned long arg)
+static int pptp_ppp_ioctl(void *private, unsigned int cmd,
+			  unsigned long arg)
 {
-	struct sock *sk = chan->private;
+	struct sock *sk = private;
 	struct pppox_sock *po = pppox_sk(sk);
 	struct pptp_opt *opt = &po->proto.pptp;
 	void __user *argp = (void __user *)arg;
diff --git a/drivers/tty/ipwireless/network.c b/drivers/tty/ipwireless/network.c
index ad2c5157a018..7ac5a2d02d44 100644
--- a/drivers/tty/ipwireless/network.c
+++ b/drivers/tty/ipwireless/network.c
@@ -88,10 +88,10 @@ static void notify_packet_sent(void *callback_data, unsigned int packet_length)
 /*
  * Called by the ppp system when it has a packet to send to the hardware.
  */
-static int ipwireless_ppp_start_xmit(struct ppp_channel *ppp_channel,
+static int ipwireless_ppp_start_xmit(void *private,
 				     struct sk_buff *skb)
 {
-	struct ipw_network *network = ppp_channel->private;
+	struct ipw_network *network = private;
 	unsigned long flags;
 
 	spin_lock_irqsave(&network->lock, flags);
@@ -153,10 +153,10 @@ static int ipwireless_ppp_start_xmit(struct ppp_channel *ppp_channel,
 }
 
 /* Handle an ioctl call that has come in via ppp. (copy of ppp_async_ioctl() */
-static int ipwireless_ppp_ioctl(struct ppp_channel *ppp_channel,
+static int ipwireless_ppp_ioctl(void *private,
 				unsigned int cmd, unsigned long arg)
 {
-	struct ipw_network *network = ppp_channel->private;
+	struct ipw_network *network = private;
 	int err, val;
 	u32 accm[8];
 	int __user *user_arg = (int __user *) arg;
@@ -254,19 +254,17 @@ static void do_go_online(struct work_struct *work_go_online)
 
 	spin_lock_irqsave(&network->lock, flags);
 	if (!network->ppp_channel) {
+		struct ppp_channel_conf conf = {};
 		struct ppp_channel *channel;
 
 		spin_unlock_irqrestore(&network->lock, flags);
-		channel = kzalloc_obj(struct ppp_channel);
-		if (!channel) {
-			printk(KERN_ERR IPWIRELESS_PCCARD_NAME
-					": unable to allocate PPP channel\n");
-			return;
-		}
-		channel->private = network;
-		channel->mtu = 16384;	/* Wild guess */
-		channel->hdrlen = 2;
-		channel->ops = &ipwireless_ppp_channel_ops;
+
+		conf.private = network;
+		conf.hdrlen = 2;
+		conf.ops = &ipwireless_ppp_channel_ops;
+#ifdef CONFIG_PPP_MULTILINK
+		conf.mtu = 16384;	/* Wild guess */
+#endif
 
 		network->flags = 0;
 		network->rbits = 0;
@@ -275,10 +273,10 @@ static void do_go_online(struct work_struct *work_go_online)
 		network->xaccm[0] = ~0U;
 		network->xaccm[3] = 0x60000000U;
 		network->raccm = ~0U;
-		if (ppp_register_channel(channel) < 0) {
+		channel = ppp_register_channel(&conf);
+		if (!channel) {
 			printk(KERN_ERR IPWIRELESS_PCCARD_NAME
 					": unable to register PPP channel\n");
-			kfree(channel);
 			return;
 		}
 		spin_lock_irqsave(&network->lock, flags);
diff --git a/include/linux/if_pppox.h b/include/linux/if_pppox.h
index 594d6dc3f4c9..a1d7c11182ec 100644
--- a/include/linux/if_pppox.h
+++ b/include/linux/if_pppox.h
@@ -40,7 +40,7 @@ struct pptp_opt {
 struct pppox_sock {
 	/* struct sock must be the first member of pppox_sock */
 	struct sock sk;
-	struct ppp_channel chan;
+	struct ppp_channel *chan;
 	struct pppox_sock __rcu	*next;	  /* for hash table */
 	union {
 		struct pppoe_opt pppoe;
diff --git a/include/linux/ppp_channel.h b/include/linux/ppp_channel.h
index 2f63e9a6cc88..e3a3d59d40dc 100644
--- a/include/linux/ppp_channel.h
+++ b/include/linux/ppp_channel.h
@@ -27,55 +27,64 @@ struct ppp_channel;
 struct ppp_channel_ops {
 	/* Send a packet (or multilink fragment) on this channel.
 	   Returns 1 if it was accepted, 0 if not. */
-	int	(*start_xmit)(struct ppp_channel *, struct sk_buff *);
+	int	(*start_xmit)(void *private, struct sk_buff *skb);
 	/* Handle an ioctl call that has come in via /dev/ppp. */
-	int	(*ioctl)(struct ppp_channel *, unsigned int, unsigned long);
-	int	(*fill_forward_path)(struct net_device_path_ctx *,
-				     struct net_device_path *,
-				     const struct ppp_channel *);
+	int	(*ioctl)(void *private, unsigned int cmd, unsigned long arg);
+	int	(*fill_forward_path)(struct net_device_path_ctx *ctx,
+				     struct net_device_path *path,
+				     void *private);
 };
 
-struct ppp_channel {
+struct ppp_channel_conf {
 	void		*private;	/* channel private data */
 	const struct ppp_channel_ops *ops; /* operations for this channel */
-	int		mtu;		/* max transmit packet size */
 	int		hdrlen;		/* amount of headroom channel needs */
-	void		*ppp;		/* opaque to channel */
-	int		speed;		/* transfer rate (bytes/second) */
 	bool		direct_xmit;	/* no qdisc, xmit directly */
+#ifdef CONFIG_PPP_MULTILINK
+	int		speed;		/* transfer rate (bytes/second) */
+	int		mtu;		/* max transmit packet size */
+#endif
 };
 
 #ifdef __KERNEL__
 /* Called by the channel when it can send some more data. */
-extern void ppp_output_wakeup(struct ppp_channel *);
+void ppp_output_wakeup(struct ppp_channel *pch);
 
 /* Called by the channel to process a received PPP packet.
    The packet should have just the 2-byte PPP protocol header. */
-extern void ppp_input(struct ppp_channel *, struct sk_buff *);
+void ppp_input(struct ppp_channel *pch, struct sk_buff *skb);
 
 /* Called by the channel when an input error occurs, indicating
    that we may have missed a packet. */
-extern void ppp_input_error(struct ppp_channel *);
+void ppp_input_error(struct ppp_channel *pch);
 
-/* Attach a channel to a given PPP unit in specified net. */
-extern int ppp_register_net_channel(struct net *, struct ppp_channel *);
+/* Create a new, unattached ppp channel for specified net. */
+struct ppp_channel *ppp_register_net_channel(struct net *net,
+					 const struct ppp_channel_conf *chan);
 
-/* Attach a channel to a given PPP unit. */
-extern int ppp_register_channel(struct ppp_channel *);
+/* Create a new, unattached ppp channel. */
+struct ppp_channel *ppp_register_channel(const struct ppp_channel_conf *chan);
 
 /* Detach a channel from its PPP unit (e.g. on hangup). */
-extern void ppp_unregister_channel(struct ppp_channel *);
+void ppp_unregister_channel(struct ppp_channel *pch);
 
 /* Get the channel number for a channel */
-extern int ppp_channel_index(struct ppp_channel *);
+int ppp_channel_index(struct ppp_channel *pch);
 
 /* Get the unit number associated with a channel, or -1 if none */
-extern int ppp_unit_number(struct ppp_channel *);
+int ppp_unit_number(struct ppp_channel *pch);
 
 /* Get the device name associated with a channel, or NULL if none.
  * Caller must hold RCU read lock.
  */
-extern char *ppp_dev_name(struct ppp_channel *);
+char *ppp_dev_name(struct ppp_channel *pch);
+
+/* Update the MTU of a multilink channel */
+#ifdef CONFIG_PPP_MULTILINK
+void ppp_channel_update_mtu(struct ppp_channel *pch, int mtu);
+#else
+static inline void ppp_channel_update_mtu(struct ppp_channel *pch, int mtu) {}
+#endif
 
 /*
  * SMP locking notes:
diff --git a/net/atm/pppoatm.c b/net/atm/pppoatm.c
index e3c422dc533a..d801233700e7 100644
--- a/net/atm/pppoatm.c
+++ b/net/atm/pppoatm.c
@@ -64,7 +64,7 @@ struct pppoatm_vcc {
 	atomic_t inflight;
 	unsigned long blocked;
 	int flags;			/* SC_COMP_PROT - compress protocol */
-	struct ppp_channel chan;	/* interface to generic ppp layer */
+	struct ppp_channel *chan;	/* interface to generic ppp layer */
 	struct tasklet_struct wakeup_tasklet;
 };
 
@@ -91,11 +91,6 @@ static inline struct pppoatm_vcc *atmvcc_to_pvcc(const struct atm_vcc *atmvcc)
 	return (struct pppoatm_vcc *) (atmvcc->user_back);
 }
 
-static inline struct pppoatm_vcc *chan_to_pvcc(const struct ppp_channel *chan)
-{
-	return (struct pppoatm_vcc *) (chan->private);
-}
-
 /*
  * We can't do this directly from our _pop handler, since the ppp code
  * doesn't want to be called in interrupt context, so we do it from
@@ -105,7 +100,7 @@ static void pppoatm_wakeup_sender(struct tasklet_struct *t)
 {
 	struct pppoatm_vcc *pvcc = from_tasklet(pvcc, t, wakeup_tasklet);
 
-	ppp_output_wakeup(&pvcc->chan);
+	ppp_output_wakeup(pvcc->chan);
 }
 
 static void pppoatm_release_cb(struct atm_vcc *atmvcc)
@@ -172,7 +167,7 @@ static void pppoatm_unassign_vcc(struct atm_vcc *atmvcc)
 	atmvcc->pop = pvcc->old_pop;
 	atmvcc->release_cb = pvcc->old_release_cb;
 	tasklet_kill(&pvcc->wakeup_tasklet);
-	ppp_unregister_channel(&pvcc->chan);
+	ppp_unregister_channel(pvcc->chan);
 	atmvcc->user_back = NULL;
 	kfree(pvcc);
 }
@@ -201,7 +196,7 @@ static void pppoatm_push(struct atm_vcc *atmvcc, struct sk_buff *skb)
 		skb_pull(skb, LLC_LEN);
 		break;
 	case e_autodetect:
-		if (pvcc->chan.ppp == NULL) {	/* Not bound yet! */
+		if (!pvcc->chan) {	/* Not bound yet! */
 			kfree_skb(skb);
 			return;
 		}
@@ -215,7 +210,8 @@ static void pppoatm_push(struct atm_vcc *atmvcc, struct sk_buff *skb)
 		    !memcmp(skb->data, &pppllc[LLC_LEN],
 		    sizeof(pppllc) - LLC_LEN)) {
 			pvcc->encaps = e_vc;
-			pvcc->chan.mtu += LLC_LEN;
+			ppp_channel_update_mtu(pvcc->chan,
+					       atmvcc->qos.txtp.max_sdu - PPP_HDRLEN);
 			break;
 		}
 		pr_debug("Couldn't autodetect yet (skb: %6ph)\n", skb->data);
@@ -223,12 +219,12 @@ static void pppoatm_push(struct atm_vcc *atmvcc, struct sk_buff *skb)
 	case e_vc:
 		break;
 	}
-	ppp_input(&pvcc->chan, skb);
+	ppp_input(pvcc->chan, skb);
 	return;
 
 error:
 	kfree_skb(skb);
-	ppp_input_error(&pvcc->chan);
+	ppp_input_error(pvcc->chan);
 }
 
 static int pppoatm_may_send(struct pppoatm_vcc *pvcc, int size)
@@ -286,9 +282,9 @@ static int pppoatm_may_send(struct pppoatm_vcc *pvcc, int size)
  * as success, just to be clear what we're really doing.
  */
 #define DROP_PACKET 1
-static int pppoatm_send(struct ppp_channel *chan, struct sk_buff *skb)
+static int pppoatm_send(void *private, struct sk_buff *skb)
 {
-	struct pppoatm_vcc *pvcc = chan_to_pvcc(chan);
+	struct pppoatm_vcc *pvcc = private;
 	struct atm_vcc *vcc;
 	int ret;
 
@@ -367,16 +363,15 @@ static int pppoatm_send(struct ppp_channel *chan, struct sk_buff *skb)
 }
 
 /* This handles ioctls sent to the /dev/ppp interface */
-static int pppoatm_devppp_ioctl(struct ppp_channel *chan, unsigned int cmd,
-	unsigned long arg)
+static int pppoatm_devppp_ioctl(void *private, unsigned int cmd,
+				unsigned long arg)
 {
+	struct pppoatm_vcc *pvcc = private;
 	switch (cmd) {
 	case PPPIOCGFLAGS:
-		return put_user(chan_to_pvcc(chan)->flags, (int __user *) arg)
-		    ? -EFAULT : 0;
+		return put_user(pvcc->flags, (int __user *)arg) ? -EFAULT : 0;
 	case PPPIOCSFLAGS:
-		return get_user(chan_to_pvcc(chan)->flags, (int __user *) arg)
-		    ? -EFAULT : 0;
+		return get_user(pvcc->flags, (int __user *)arg) ? -EFAULT : 0;
 	}
 	return -ENOTTY;
 }
@@ -388,9 +383,10 @@ static const struct ppp_channel_ops pppoatm_ops = {
 
 static int pppoatm_assign_vcc(struct atm_vcc *atmvcc, void __user *arg)
 {
+	struct ppp_channel_conf conf = {};
 	struct atm_backend_ppp be;
 	struct pppoatm_vcc *pvcc;
-	int err;
+	struct ppp_channel *chan;
 
 	if (copy_from_user(&be, arg, sizeof be))
 		return -EFAULT;
@@ -409,16 +405,19 @@ static int pppoatm_assign_vcc(struct atm_vcc *atmvcc, void __user *arg)
 	pvcc->old_owner = atmvcc->owner;
 	pvcc->old_release_cb = atmvcc->release_cb;
 	pvcc->encaps = (enum pppoatm_encaps) be.encaps;
-	pvcc->chan.private = pvcc;
-	pvcc->chan.ops = &pppoatm_ops;
-	pvcc->chan.mtu = atmvcc->qos.txtp.max_sdu - PPP_HDRLEN -
+	conf.private = pvcc;
+	conf.ops = &pppoatm_ops;
+#ifdef CONFIG_PPP_MULTILINK
+	conf.mtu = atmvcc->qos.txtp.max_sdu - PPP_HDRLEN -
 	    (be.encaps == e_vc ? 0 : LLC_LEN);
+#endif
 	tasklet_setup(&pvcc->wakeup_tasklet, pppoatm_wakeup_sender);
-	err = ppp_register_channel(&pvcc->chan);
-	if (err != 0) {
+	chan = ppp_register_channel(&conf);
+	if (!chan) {
 		kfree(pvcc);
-		return err;
+		return -ENOMEM;
 	}
+	pvcc->chan = chan;
 	atmvcc->user_back = pvcc;
 	atmvcc->push = pppoatm_push;
 	atmvcc->pop = pppoatm_pop;
@@ -458,11 +457,11 @@ static int pppoatm_ioctl(struct socket *sock, unsigned int cmd,
 		return pppoatm_assign_vcc(atmvcc, argp);
 		}
 	case PPPIOCGCHAN:
-		return put_user(ppp_channel_index(&atmvcc_to_pvcc(atmvcc)->
-		    chan), (int __user *) argp) ? -EFAULT : 0;
+		return put_user(ppp_channel_index(atmvcc_to_pvcc(atmvcc)->chan),
+		    (int __user *)argp) ? -EFAULT : 0;
 	case PPPIOCGUNIT:
-		return put_user(ppp_unit_number(&atmvcc_to_pvcc(atmvcc)->
-		    chan), (int __user *) argp) ? -EFAULT : 0;
+		return put_user(ppp_unit_number(atmvcc_to_pvcc(atmvcc)->chan),
+		    (int __user *)argp) ? -EFAULT : 0;
 	}
 	return -ENOIOCTLCMD;
 }
diff --git a/net/l2tp/l2tp_ppp.c b/net/l2tp/l2tp_ppp.c
index 99d6582f41de..6c7b08f4e49a 100644
--- a/net/l2tp/l2tp_ppp.c
+++ b/net/l2tp/l2tp_ppp.c
@@ -121,7 +121,7 @@ struct pppol2tp_session {
 	struct sock		*__sk;		/* Copy of .sk, for cleanup */
 };
 
-static int pppol2tp_xmit(struct ppp_channel *chan, struct sk_buff *skb);
+static int pppol2tp_xmit(void *private, struct sk_buff *skb);
 
 static const struct ppp_channel_ops pppol2tp_chan_ops = {
 	.start_xmit =  pppol2tp_xmit,
@@ -221,7 +221,7 @@ static void pppol2tp_recv(struct l2tp_session *session, struct sk_buff *skb, int
 		struct pppox_sock *po;
 
 		po = pppox_sk(sk);
-		ppp_input(&po->chan, skb);
+		ppp_input(po->chan, skb);
 	} else {
 		if (sock_queue_rcv_skb(sk, skb) < 0) {
 			atomic_long_inc(&session->stats.rx_errors);
@@ -326,9 +326,9 @@ static int pppol2tp_sendmsg(struct socket *sock, struct msghdr *m,
  * the skb it supplied, not our cloned skb. So we take care to always
  * leave the original skb unfreed if we return an error.
  */
-static int pppol2tp_xmit(struct ppp_channel *chan, struct sk_buff *skb)
+static int pppol2tp_xmit(void *private, struct sk_buff *skb)
 {
-	struct sock *sk = (struct sock *)chan->private;
+	struct sock *sk = private;
 	struct l2tp_session *session;
 	struct l2tp_tunnel *tunnel;
 	int uhlen, headroom;
@@ -504,7 +504,7 @@ static void pppol2tp_show(struct seq_file *m, void *arg)
 	if (sk) {
 		struct pppox_sock *po = pppox_sk(sk);
 
-		seq_printf(m, "   interface %s\n", ppp_dev_name(&po->chan));
+		seq_printf(m, "   interface %s\n", ppp_dev_name(po->chan));
 	}
 	rcu_read_unlock();
 }
@@ -612,7 +612,7 @@ static int pppol2tp_sockaddr_get_info(const void *sa, int sa_len,
  * numbers and no IP option. Not quite accurate, but the result is mostly
  * unused anyway.
  */
-static int pppol2tp_tunnel_mtu(const struct l2tp_tunnel *tunnel)
+static int __maybe_unused pppol2tp_tunnel_mtu(const struct l2tp_tunnel *tunnel)
 {
 	int mtu;
 
@@ -694,6 +694,8 @@ static int pppol2tp_connect(struct socket *sock, struct sockaddr_unsized *userva
 	struct l2tp_tunnel *tunnel;
 	struct pppol2tp_session *ps;
 	struct l2tp_session_cfg cfg = { 0, };
+	struct ppp_channel_conf conf = {};
+	struct ppp_channel *chan;
 	bool drop_refcnt = false;
 	bool new_session = false;
 	bool new_tunnel = false;
@@ -792,18 +794,22 @@ static int pppol2tp_connect(struct socket *sock, struct sockaddr_unsized *userva
 	 * the net device's hard_header_len at registration, which must be
 	 * sufficient regardless of whether sequence numbers are enabled later.
 	 */
-	po->chan.hdrlen = PPPOL2TP_L2TP_HDR_SIZE_SEQ;
+	conf.hdrlen = PPPOL2TP_L2TP_HDR_SIZE_SEQ;
 
-	po->chan.private = sk;
-	po->chan.ops	 = &pppol2tp_chan_ops;
-	po->chan.mtu	 = pppol2tp_tunnel_mtu(tunnel);
-	po->chan.direct_xmit	= true;
+	conf.private = sk;
+	conf.ops	 = &pppol2tp_chan_ops;
+#ifdef CONFIG_PPP_MULTILINK
+	conf.mtu	 = pppol2tp_tunnel_mtu(tunnel);
+#endif
+	conf.direct_xmit	= true;
 
-	error = ppp_register_net_channel(sock_net(sk), &po->chan);
-	if (error) {
+	chan = ppp_register_net_channel(sock_net(sk), &conf);
+	if (!chan) {
+		error = -ENOMEM;
 		mutex_unlock(&ps->sk_lock);
 		goto end;
 	}
+	po->chan = chan;
 
 out_no_ppp:
 	/* This is how we get the session context from the socket. */
@@ -1550,7 +1556,7 @@ static void pppol2tp_seq_session_show(struct seq_file *m, void *v)
 	if (sk) {
 		struct pppox_sock *po = pppox_sk(sk);
 
-		seq_printf(m, "   interface %s\n", ppp_dev_name(&po->chan));
+		seq_printf(m, "   interface %s\n", ppp_dev_name(po->chan));
 	}
 	rcu_read_unlock();
 }
-- 
2.43.0


