Return-Path: <linux-ppp+bounces-615-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LQ0OIu/dR2pQggAAu9opvQ
	(envelope-from <linux-ppp+bounces-615-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 03 Jul 2026 18:06:07 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0476704220
	for <lists+linux-ppp@lfdr.de>; Fri, 03 Jul 2026 18:06:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=cwqCy9mi;
	dkim=pass header.d=redhat.com header.s=google header.b=HKH8YP+D;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-ppp+bounces-615-lists+linux-ppp=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-ppp+bounces-615-lists+linux-ppp=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CA7430356C2
	for <lists+linux-ppp@lfdr.de>; Fri,  3 Jul 2026 16:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3B928469B;
	Fri,  3 Jul 2026 16:05:39 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80FC2ED870
	for <linux-ppp@vger.kernel.org>; Fri,  3 Jul 2026 16:05:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783094738; cv=none; b=tnlW7qhEiRUNx35W1/66zGQw4x1FDC/Rzr9DS58w71Fiz9sELlHaOP0/vCtFLXfBVIgKd/Dt9D/Ll8dKOIP4NCDRNeimSZ0VsFXpr5XvYgp81yDxXK79oCJVQEZaD+q4G7fdIqliY9Af1kINBpwfa9aQ1DRf5g/a3QFBMArnzJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783094738; c=relaxed/simple;
	bh=R8raQapqEko/nHjRDyj7SDbekaWrkygAAaKPhvpequc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVWXCexCe6e3ZJ6yAtx1dPvIMmvjGVeVSHHMuT/o2gBmDy9XZ03dhOz29I0ptCaVF0dVZLNv2VxIgRRu89BUkC5di6RKHAlwb/iCqVRu7WZFAv+bujsJDsDiEep65AWgHewNeRWCbiLqH28V0ISdH/3u6lOF8kKvKzpfGAOo8TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cwqCy9mi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HKH8YP+D; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783094731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ExsD+fY9tpTLOuyb4+ACzKrp5pskUXTbgMDg8wamdvY=;
	b=cwqCy9miOPRPJYLx9SGnxUqfkr0aYJ79AeLc9Fgd/lwXHbAg7KXElI5FZmoy3zTeT6N3qD
	BJCyD8ZEr9ACXaV4YMp11ETovW7U6IuFPWRjYVltGMsox39xH0+39UPEIYiHk6jnjuvsTo
	Q5poBjmVDzn/NkCTkIheatz/gb4gCF8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-Ar8nLTZhOGOT7DoZ9dTtlw-1; Fri, 03 Jul 2026 12:05:29 -0400
X-MC-Unique: Ar8nLTZhOGOT7DoZ9dTtlw-1
X-Mimecast-MFC-AGG-ID: Ar8nLTZhOGOT7DoZ9dTtlw_1783094729
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-473e18559b2so435692f8f.0
        for <linux-ppp@vger.kernel.org>; Fri, 03 Jul 2026 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783094728; x=1783699528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ExsD+fY9tpTLOuyb4+ACzKrp5pskUXTbgMDg8wamdvY=;
        b=HKH8YP+Dy+k/zFcdQCTJ6QXMLj/fWPHi7ALmcETPzSIZ0D9ROHH1moZ40Svc+MlyLK
         2DOyjgka54FePBHTLGk47KGXdwsSSsftNSQA/i1pzVe5D6kEYB8pMxjJdi41SHL9Kdgo
         JKv0Ds02bxm8ZavUcmeS2GdpUhgfXGk8xmks+q3H80rOQs28EPGrl3r90234nbD/GrQH
         3UiZ2tgePBiwgPlbi3gEjNiz3L9GE+WH9QmUc3BTKkDO/C2QZk6ZJe3R65RHXQyweFyu
         FxgmzVVnvY87a9bMLWC11oAEevdypOicFt5xg/7mMlBgVryHWZd6WO3MkagNKE0ohD95
         kbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783094728; x=1783699528;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExsD+fY9tpTLOuyb4+ACzKrp5pskUXTbgMDg8wamdvY=;
        b=Vk1DzUUIoOuGfYDa2MtBBq5svCswSBhSAnOta+ELfuYzLCsv76OEttH+tsfBkawJtb
         JeifGSVPUJp1/x0NtWLWPi/W/1hhcoI8JgD8O5cXiahahfrZt4Bx6/4LUg7uYgnb1ns3
         +NOcxvHwFrg/bPXK1rE391I7LuGqbUI7Qy91gvzrb96i/6DR0z9D2F+ooXOaidOBoZ9S
         4AFoVxYKzfUfnIDNFdjZfBC1mbZKiPPIQjbuqfWp14/2owb2ox7LHO7s+PP1U8NCPaHw
         TkUd2kHloU2JY+/HrT19LVUh3KaJIBGHbaUROMJ4D0ghFfg5Ksob8xskLygo2BkUpPVV
         5T4w==
X-Forwarded-Encrypted: i=1; AHgh+RrlfqnknUC+cwfUH6H4VLPK0V3ctP9kfQo55AwlVGvP2dGdPF5zeDIkGH7KPeOF0x+yFsS2+sjeHDE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+GYQ9h/zhYueSvfT5BDsCp6SnNFGEaVlDbbUIFrCwXZwCh4C3
	EKI6xfhGzIUWn9LmV5S77uDe+ETFNS2/jTUFaYkyMjmyHoMroUsXv0G4wmTHMpOqVq3bXijwt8w
	V9V0xeqO7bKoPCV9ekEnrpVc8dHB3C59DEZX1tAfMBUeNBnQ1J3uRmQrCuGi5ew==
X-Gm-Gg: AfdE7ckeHcLh5ypjzbPpIuoWTt+6H02lYsS86Me4a5y3hf4jKtrXIBhtwBF9rAHmRj7
	y3NNwHMKJwu4825ketZi14sTXnLdL1YbPVODqn4qmmZba9dz9NYbiFJxxEuTgxVRy2lSdQZmn5j
	6DXeIgpJIaxN6i8J0MkodZKVgUhXzKw9LxnJxzjzWsqw/vZeh5vUAskRQbD5CFcpV9llaAW9MM1
	+BicgDpxZyYUczYE5acvIkHrZwu2eIJ+MnpnjE0nKz/Ev1yTMnErYTNj+wuCps7bkE+rXDHYbMr
	8p23aXZNNlRsCAUMFxwJPseXUrseIGZ71S9f5AdIcLK+587dwzNQ+sF2Urgj3FTjYbMbxFc/K1y
	0pzl5ab4Os7JsL33u/ov0sBa9pj1IMUHHqi4/VRGdrx2AKoPMkW+PweTp4MJIChTSww==
X-Received: by 2002:a5d:50ca:0:b0:475:f0f0:9ed2 with SMTP id ffacd0b85a97d-477b601c4d1mr12059268f8f.61.1783094728620;
        Fri, 03 Jul 2026 09:05:28 -0700 (PDT)
X-Received: by 2002:a5d:50ca:0:b0:475:f0f0:9ed2 with SMTP id ffacd0b85a97d-477b601c4d1mr12059222f8f.61.1783094728239;
        Fri, 03 Jul 2026 09:05:28 -0700 (PDT)
Received: from debian (2a01cb05923c9a00ac64493857fc411e.ipv6.abo.wanadoo.fr. [2a01:cb05:923c:9a00:ac64:4938:57fc:411e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm381813f8f.5.2026.07.03.09.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 09:05:27 -0700 (PDT)
Date: Fri, 3 Jul 2026 18:05:24 +0200
From: Guillaume Nault <gnault@redhat.com>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Norbert Szetei <norbert@doyensec.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Breno Leitao <leitao@debian.org>, Taegu Ha <hataegu0826@gmail.com>,
	Kees Cook <kees@kernel.org>, linux-ppp@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v2] ppp: defer channel free to an RCU grace period to
 fix pppol2tp RX UAF
Message-ID: <akfdxKa9aaKGBFeJ@debian>
References: <D9C0245B-608B-4884-8A09-F55BA4A9F948@doyensec.com>
 <166370f4-0b8c-4af4-9fb7-6967828a99bc@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166370f4-0b8c-4af4-9fb7-6967828a99bc@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-615-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qingfang.deng@linux.dev,m:norbert@doyensec.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:bigeasy@linutronix.de,m:leitao@debian.org,m:hataegu0826@gmail.com,m:kees@kernel.org,m:linux-ppp@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gnault@redhat.com,linux-ppp@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[doyensec.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linutronix.de,debian.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gnault@redhat.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,doyensec.com:email,debian:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0476704220

On Thu, Jul 02, 2026 at 04:19:02PM +0800, Qingfang Deng wrote:
> Add: Guillaume
> 
> On 2026/7/2 at 2:12, Norbert Szetei wrote:
> > pppol2tp_recv() runs in the L2TP UDP-encap softirq RX path:
> > 
> >   l2tp_udp_encap_recv() -> l2tp_recv_common() -> pppol2tp_recv()
> >     -> ppp_input(&po->chan)

Hi Qingfang,

Thanks for Cc-ing me. I haven't had time to look at this problem yet,
and I'll be offline next week. So not sure if I'll get the possibility
to provide any feedback to this patch in time.

> > It runs under rcu_read_lock() holding only an l2tp_session reference and
> > takes NO reference on the internal PPP channel (struct channel,
> > chan->ppp) that ppp_input() dereferences.
> > 
> > The pppox socket is SOCK_RCU_FREE, so 'po' and the embedded ppp_channel
> > are RCU-safe.  But the internal struct channel is a separate allocation
> > that ppp_release_channel() frees with a plain kfree():
> > 
> >   close(data socket) -> pppol2tp_release() -> pppox_unbind_sock()
> >     -> ppp_unregister_channel() -> ppp_release_channel() -> kfree(pch)
> > 
> > For a channel that is bound (PPPIOCGCHAN) but not attached to a ppp unit
> > (no PPPIOCCONNECT, pch->ppp == NULL) and not bridged, teardown skips
> > both ppp_disconnect_channel()'s synchronize_net() and
> > ppp_unbridge_channels()'s synchronize_rcu(), so the kfree() has no grace
> > period.  rcu_read_lock() in pppol2tp_recv() does not protect against a
> > plain kfree(), so an in-flight ppp_input() on one CPU can dereference
> > the channel just freed by close() on another CPU.
> > 
> > The bug is reachable by an unprivileged user.
> > 
> > Defer the channel free to an RCU callback via call_rcu() so the grace
> > period fences any in-flight ppp_input(). The disconnect and unbridge
> > teardown paths already fence with synchronize_net()/synchronize_rcu();
> > call_rcu() does the same here without stalling the close() path.
> > 
> > Fixes: ee40fb2e1eb5 ("l2tp: protect sock pointer of struct pppol2tp_session with RCU")
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Norbert Szetei <norbert@doyensec.com>
> > ---
> > v2:
> > - Moved skb_queue_purge() to a dedicated RCU callback to prevent leaking
> >    skbs added by an in-flight ppp_input() during the grace period (Sebastian).
> > - Retained call_rcu() to avoid introducing synchronous multi-millisecond
> >    latency into the teardown path.
> > v1: https://lore.kernel.org/netdev/C954A7EA-AA98-4E3C-80B5-42C34B3183A3@doyensec.com/
> > 
> >   drivers/net/ppp/ppp_generic.c | 17 ++++++++++++++---
> >   1 file changed, 14 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> > index 57c68efa5ff8..2d57de77780f 100644
> > --- a/drivers/net/ppp/ppp_generic.c
> > +++ b/drivers/net/ppp/ppp_generic.c
> > @@ -184,6 +184,7 @@ struct channel {
> >   	struct list_head clist;		/* link in list of channels per unit */
> >   	spinlock_t	upl;		/* protects `ppp' and 'bridge' */
> >   	struct channel __rcu *bridge;	/* "bridged" ppp channel */
> > +	struct rcu_head rcu;		/* for RCU-deferred free of the channel */
> >   #ifdef CONFIG_PPP_MULTILINK
> >   	u8		avail;		/* flag used in multilink stuff */
> >   	u8		had_frag;	/* >= 1 fragments have been sent */
> > @@ -3562,6 +3563,18 @@ ppp_disconnect_channel(struct channel *pch)
> >   	return err;
> >   }
> > +/* Purge after the grace period: a late ppp_input() may still queue an
> > + * skb on pch->file.rq before the last RCU reader drains.
> > + */
> > +static void ppp_release_channel_free(struct rcu_head *rcu)
> > +{
> > +	struct channel *pch = container_of(rcu, struct channel, rcu);
> > +
> > +	skb_queue_purge(&pch->file.xq);
> > +	skb_queue_purge(&pch->file.rq);
> > +	kfree(pch);
> > +}
> > +
> >   /*
> >    * Drop a reference to a ppp channel and free its memory if the refcount reaches
> >    * zero.
> > @@ -3581,9 +3594,7 @@ static void ppp_release_channel(struct channel *pch)
> >   		pr_err("ppp: destroying undead channel %p !\n", pch);
> >   		return;
> >   	}
> > -	skb_queue_purge(&pch->file.xq);
> > -	skb_queue_purge(&pch->file.rq);
> > -	kfree(pch);
> > +	call_rcu(&pch->rcu, ppp_release_channel_free);
> >   }
> >   static void __exit ppp_cleanup(void)
> 
> Reviewed-by: Qingfang Deng <qingfang.deng@linux.dev>
> 
> FYI, I attempted to merge the two channel structs and AI-review found a UAF
> [1], so this patch addresses the issue.
> 
> [1] https://lore.kernel.org/netdev/590d7931-02b0-45d6-8f43-ef909c9bde89@redhat.com/
> 
> Best regards,
> 
> Qingfang
> 
> 


