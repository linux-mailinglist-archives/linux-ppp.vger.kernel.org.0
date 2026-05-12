Return-Path: <linux-ppp+bounces-580-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL6UG29lA2oq5gEAu9opvQ
	(envelope-from <linux-ppp+bounces-580-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 12 May 2026 19:37:51 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8128A525E91
	for <lists+linux-ppp@lfdr.de>; Tue, 12 May 2026 19:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 357BA3018D4D
	for <lists+linux-ppp@lfdr.de>; Tue, 12 May 2026 17:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941463C98AF;
	Tue, 12 May 2026 17:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="XROmCUnH"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A87E306B11;
	Tue, 12 May 2026 17:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778607175; cv=none; b=AAcmDcEcQgeMcXNfeMydHXNV+kAPyGXE240rH3YrhAz/kISJLubGjTdRUgjpDhWLJHNT1+Qb1gOzjpDRTIdMeJHiqK+iOP3mxZjp7PtTW58qdRUG7uneW0E7vb6ynD4whnMavFOlVxdasxLpdpE+jydhcSvteSu381vzDwpuOcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778607175; c=relaxed/simple;
	bh=RTA9YCtc4dysBvHTPXt2v/FKLYODQ0324M8KqjT+690=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyAeNuXtudY7e6QIeVeWx5RgZ5wLB0j9rSFQBkC7vSGnw9sYdXYl0SohiuMPH0UDMEqWX519Vd4i0M5i+mxw386FJVvQRWr9VgJ8RrfOZvSZnGRflNz9kaKS6yHtr7GT1PastucWtIBNt36TdKWG767bILky2Vs4CCTvvDoJ+g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=XROmCUnH; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 784D96017D;
	Tue, 12 May 2026 19:32:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1778607168;
	bh=JcWjfgyyVZ2OQDGJJkSAKqN3PkQMjpUqOAythIEuDAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XROmCUnHCTUHoMlujfCyLBzpgtGTI+py+IGOJw6oREkN9/U7kHvcJWM9fxGYbnqyd
	 1g78VpumltJIFBlaJlWnTAYqWVZoky0ueK/cfxAqs8ebO/OBrxgNBfsbKnHZwWpeww
	 pB9A/GT/IQnwbOxoITLFpxlK2vMu0erKuW5As8MHKnFQXa6HwAxAHg7qx55oBGHpQL
	 s3Z0LPn5k2e8ErT4rEZExucCezXf+rJx+80h3tRLrPV0o3uPif8EQ17SoAXSH5WNb3
	 RmqDssRvl3GFizuvJe4kuShC9x0/2wUjv8ChcX1rMtVGd4f1rqhUsJGG/mJ2m6rshM
	 z+GYZ6+43MWXA==
Date: Tue, 12 May 2026 19:32:45 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Qingfang Deng <qingfang.deng@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	Kees Cook <kees@kernel.org>, Guillaume Nault <gnault@redhat.com>,
	Eric Woudstra <ericwouds@gmail.com>, Felix Fietkau <nbd@nbd.name>,
	Willem de Bruijn <willemb@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Richard Gobert <richardbgobert@gmail.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: Re: [PATCH net-next v9 1/2] net: pppoe: implement GRO/GSO support
Message-ID: <agNkIrRFPP0pYcfz@chamomile>
References: <20260509030507.387050-1-qingfang.deng@linux.dev>
 <a5b3ac22-1515-4642-ad55-1f8b564cc140@redhat.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="G8HPA1xNflQlMZuv"
Content-Disposition: inline
In-Reply-To: <a5b3ac22-1515-4642-ad55-1f8b564cc140@redhat.com>
X-Rspamd-Queue-Id: 8128A525E91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[netfilter.org:s=2025];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-diff];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[netfilter.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-580-lists,linux-ppp=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[netfilter.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pablo@netfilter.org,linux-ppp@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.dev,lunn.ch,davemloft.net,google.com,kernel.org,nvidia.com,redhat.com,gmail.com,nbd.name,vger.kernel.org,intel.com];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[netfilter.org:email,netfilter.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--G8HPA1xNflQlMZuv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

On Tue, May 12, 2026 at 03:58:28PM +0200, Paolo Abeni wrote:
> On 5/9/26 5:04 AM, Qingfang Deng wrote:
> > +static struct sk_buff *pppoe_gso_segment(struct sk_buff *skb,
> > +					 netdev_features_t features)
> > +{
> > +	struct sk_buff *segs = ERR_PTR(-EINVAL);
> > +	struct packet_offload *ptype;
> > +	struct pppoe_hdr *phdr;
> > +	__be16 orig_type, type;
> > +	int len, nhoff;
> > +
> > +	skb_reset_network_header(skb);
> > +	nhoff = skb_network_header(skb) - skb_mac_header(skb);
> > +
> > +	if (unlikely(!pskb_may_pull(skb, PPPOE_SES_HLEN)))
> > +		goto out;
> > +
> > +	phdr = (struct pppoe_hdr *)skb_network_header(skb);
> > +	type = pppoe_hdr_proto(phdr);
> > +	ptype = gro_find_complete_by_type(type);
> > +	if (!ptype)
> > +		goto out;
> > +
> > +	orig_type = skb->protocol;
> > +	__skb_pull(skb, PPPOE_SES_HLEN);
> > +	features &= ~(NETIF_F_TSO | NETIF_F_TSO6);
> 
> As sashiko points out here you need to use NETIF_F_GSO_SOFTWARE.

I tested this patch using NETIF_F_GSO_SOFTWARE here as Paolo suggests.

Then, I made the following changes to the flowtable (see attached
patch) to use this new pppoe_gso_segment function, and it works for
me:

Tested-by: Pablo Neira Ayuso <pablo@netfilter.org>

I will submit my flowtable patch to nf-next once this patch is applied
to net-next.

Thanks.

--G8HPA1xNflQlMZuv
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment;
	filename="flowtable-use-gso-segment-in-pppoe-driver.patch"

diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_table_ip.c
index 9c05a50d6013..270c3d0233ad 100644
--- a/net/netfilter/nf_flow_table_ip.c
+++ b/net/netfilter/nf_flow_table_ip.c
@@ -577,6 +577,10 @@ static int nf_flow_pppoe_push(struct sk_buff *skb, u16 id,
 		return -1;
 	}
 
+	skb_set_inner_transport_header(skb, skb_transport_offset(skb));
+	skb_set_inner_protocol(skb, skb->protocol);
+	skb->encapsulation = 1;
+
 	__skb_push(skb, PPPOE_SES_HLEN);
 	skb_reset_network_header(skb);
 
@@ -771,7 +775,6 @@ struct nf_flow_xmit {
 	const void		*source;
 	struct net_device	*outdev;
 	struct flow_offload_tuple *tuple;
-	bool			needs_gso_segment;
 };
 
 static void __nf_flow_queue_xmit(struct net *net, struct sk_buff *skb,
@@ -792,41 +795,10 @@ static void __nf_flow_queue_xmit(struct net *net, struct sk_buff *skb,
 	dev_queue_xmit(skb);
 }
 
-static unsigned int nf_flow_encap_gso_xmit(struct net *net, struct sk_buff *skb,
-					   struct nf_flow_xmit *xmit)
-{
-	struct sk_buff *segs, *nskb;
-
-	segs = skb_gso_segment(skb, 0);
-	if (IS_ERR(segs))
-		return NF_DROP;
-
-	if (segs)
-		consume_skb(skb);
-	else
-		segs = skb;
-
-	skb_list_walk_safe(segs, segs, nskb) {
-		skb_mark_not_on_list(segs);
-
-		if (nf_flow_encap_push(segs, xmit->tuple, xmit->outdev) < 0) {
-			kfree_skb(segs);
-			kfree_skb_list(nskb);
-			return NF_STOLEN;
-		}
-		__nf_flow_queue_xmit(net, segs, xmit);
-	}
-
-	return NF_STOLEN;
-}
-
 static unsigned int nf_flow_queue_xmit(struct net *net, struct sk_buff *skb,
 				       struct nf_flow_xmit *xmit)
 {
 	if (xmit->tuple->encap_num) {
-		if (skb_is_gso(skb) && xmit->needs_gso_segment)
-			return nf_flow_encap_gso_xmit(net, skb, xmit);
-
 		if (nf_flow_encap_push(skb, xmit->tuple, xmit->outdev) < 0)
 			return NF_DROP;
 	}
@@ -910,7 +882,6 @@ nf_flow_offload_ip_hook(void *priv, struct sk_buff *skb,
 		return NF_DROP;
 	}
 	xmit.tuple = other_tuple;
-	xmit.needs_gso_segment = tuplehash->tuple.needs_gso_segment;
 
 	return nf_flow_queue_xmit(state->net, skb, &xmit);
 }
@@ -1231,7 +1202,6 @@ nf_flow_offload_ipv6_hook(void *priv, struct sk_buff *skb,
 		return NF_DROP;
 	}
 	xmit.tuple = other_tuple;
-	xmit.needs_gso_segment = tuplehash->tuple.needs_gso_segment;
 
 	return nf_flow_queue_xmit(state->net, skb, &xmit);
 }

--G8HPA1xNflQlMZuv--

