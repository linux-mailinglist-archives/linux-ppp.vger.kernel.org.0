Return-Path: <linux-ppp+bounces-308-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F69AEA369
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Jun 2025 18:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7A9B1728E6
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Jun 2025 16:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5C220487E;
	Thu, 26 Jun 2025 16:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZLtRwH51"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C002413AA2F
	for <linux-ppp@vger.kernel.org>; Thu, 26 Jun 2025 16:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750954992; cv=none; b=noVoZC9mo5XzCKCS521u1q7TeUR91S4a7L25qU1HSZ1A/dQ/JMaprM+7Ne/4moP+PehepNmhRUtekQKwEYbHOqwiaCRYOZbfKi7tRBpOURxWa474zxg6sjNSKnKH4Ptr0Ka2gdDP13XkmPdic9oqNpTIE9cOuHo5iAvSW8eCGik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750954992; c=relaxed/simple;
	bh=SRpwD0UNQUEucWTjIaA63WjQqxxgh2uaZkGD09zbp0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4yPOYTQs0hoeeUmDGiA9KFD3aRKKuv28jVcoqBtX9sUQUV2865rXhrgZUAs9lsh4Rj5egXyCdK/afpkh5aWsjohFQANJQmfSJMqVB3god5tCm/EswZKfIMR6Bz3r+NbTqKn3hIUf0ZfLY6KOEtyv7mjpslm2YyzcOprRLLkETg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZLtRwH51; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750954989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R4W1vd78zRRkMoJPPDehg9AhhuqBbYEDG7pBDCCpzGM=;
	b=ZLtRwH51cxAuXyDPAkDcNgdjZPNwzNum07Lbihd2QC1GwjlcibhrQe3hhAwFjcai08h/y5
	yq6tyVwrGBHL6StPTBWuBp5XJ606a3Qpq3Mh2D+8iuy2a6lIrXmlbGtMNtYUfpQpFdzx1t
	IRf8bGROAAEGfIKiyU+JQ1qTxDCzhiw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-T6vIDWV7PmO5DOg8ifM-5g-1; Thu, 26 Jun 2025 12:23:08 -0400
X-MC-Unique: T6vIDWV7PmO5DOg8ifM-5g-1
X-Mimecast-MFC-AGG-ID: T6vIDWV7PmO5DOg8ifM-5g_1750954987
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4530c186394so5286395e9.0
        for <linux-ppp@vger.kernel.org>; Thu, 26 Jun 2025 09:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750954987; x=1751559787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4W1vd78zRRkMoJPPDehg9AhhuqBbYEDG7pBDCCpzGM=;
        b=H7NyNH0t0TUYs8+DmAX9YeqQAkTzBkzDBwFhNizCCGF42n4yRFy5+3dcCCstQ+wIJP
         xWG+5FIZ+rh881vrvl/894PQbgkwIEz7zR5vgKDGAHh2MTGOgPuZ/P248cDGc4L3z9gL
         MzoaDMS6pU7rKOMlcuaSHbq43HT4m+nhdSj1DREvy3oEjgZJylF13BWOVut8nT8Is8F2
         cYwQRw8sleXld3K7yQZGipFyvwMlmYrJRJN3yub+LSMymDNDxREeUltS4yjSQ32lx0kP
         Q2hS2oARU7MjlmY0ZqicN/OD5m4ajzozdUFGqT1DUApE+wdeqUQAnQZHmZPl5hY5Rw9k
         14GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpTnrzhRhhwYFdCgYYv7HrAIGGojkwOdHa+gFWD08qSVKW9yQhprh98BuRTdJ3yj8/VK6RsScVtzE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws14MluOyQ/UogPiVcCBjaMG4FUoewyVv2uFzv/KmgtzXhdw+f
	6+/ZHWMFP9Ga5mOM9n/mRp1RV8AIRm7MfNrsEJyhnrlIO4j+vzu2YeF78c2q5kQCpVdW2c5tS0z
	fKeEV9olUrjb2tG5PztbyrvyVVvJe8GC55PQEUkEZU98u1nXNWNKy9Pwj3GxiXg==
X-Gm-Gg: ASbGnctvUPmEyLBzI0mmqM8Z+BmjKU5fNt85Jm0zTBUApA9iBvVDFV6q6mOGwu4G47D
	jWhZASQB8SEdRxjbXWOgFfNUx6SN6Z/0NJo8p0quJn7vlKBHuJSkPXvLAtTSwUXfS8f+GmHyKrD
	kZQtLMTkOVYw1z1WtehRrkvOHHrTapOJ4h6HW+vGktEplyKJxGlXq0VZt/q5vLzWD5afFpMeCOR
	nK2UKO/tRBvjc36/6sqH54bVhqDWeLSNmgO/jooVgFCeJrJMPS59EwEkox2LwhBLeIgtcUCFo9Y
	gUdunEhqzVgxBjsA0ucDqD4GnSzYavew0AI9MBEe4t2CzPpHR7mGK5436KiN/7boNIrA8iSnEwT
	c
X-Received: by 2002:a05:6000:2dc4:b0:3a5:2182:bce2 with SMTP id ffacd0b85a97d-3a8f4c00b15mr199075f8f.17.1750954986984;
        Thu, 26 Jun 2025 09:23:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBWlW2HYADT1scpz9U6MLTHSAyCftrzqh2Wx8n30ZfpwA83PkzcYn6mOCHZ8W/5NvekmyAtQ==
X-Received: by 2002:a05:6000:2dc4:b0:3a5:2182:bce2 with SMTP id ffacd0b85a97d-3a8f4c00b15mr199041f8f.17.1750954986565;
        Thu, 26 Jun 2025 09:23:06 -0700 (PDT)
Received: from debian (2a01cb058918ce004c78053ae257a3fa.ipv6.abo.wanadoo.fr. [2a01:cb05:8918:ce00:4c78:53a:e257:a3fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f842sm285138f8f.86.2025.06.26.09.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 09:23:05 -0700 (PDT)
Date: Thu, 26 Jun 2025 18:23:03 +0200
From: Guillaume Nault <gnault@redhat.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] ppp: convert rlock to rwlock to improve RX
 concurrency
Message-ID: <aF1z52+rpNyIKk0O@debian>
References: <20250625034021.3650359-1-dqfext@gmail.com>
 <20250625034021.3650359-2-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625034021.3650359-2-dqfext@gmail.com>

On Wed, Jun 25, 2025 at 11:40:18AM +0800, Qingfang Deng wrote:
> The rlock spinlock in struct ppp protects the receive path, but it is
> frequently used in a read-mostly manner. Converting it to rwlock_t
> allows multiple CPUs to concurrently enter the receive path (e.g.,
> ppp_do_recv()), improving RX performance.
> 
> Write locking is preserved for code paths that mutate state.
> 
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
>  drivers/net/ppp/ppp_generic.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index 4cf9d1822a83..f0f8a75e3aef 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -118,7 +118,7 @@ struct ppp {
>  	struct file	*owner;		/* file that owns this unit 48 */
>  	struct list_head channels;	/* list of attached channels 4c */
>  	int		n_channels;	/* how many channels are attached 54 */
> -	spinlock_t	rlock;		/* lock for receive side 58 */
> +	rwlock_t	rlock;		/* lock for receive side 58 */
>  	spinlock_t	wlock;		/* lock for transmit side 5c */
>  	int __percpu	*xmit_recursion; /* xmit recursion detect */
>  	int		mru;		/* max receive unit 60 */
> @@ -371,12 +371,14 @@ static const int npindex_to_ethertype[NUM_NP] = {
>   */
>  #define ppp_xmit_lock(ppp)	spin_lock_bh(&(ppp)->wlock)
>  #define ppp_xmit_unlock(ppp)	spin_unlock_bh(&(ppp)->wlock)
> -#define ppp_recv_lock(ppp)	spin_lock_bh(&(ppp)->rlock)
> -#define ppp_recv_unlock(ppp)	spin_unlock_bh(&(ppp)->rlock)
> +#define ppp_recv_lock(ppp)	write_lock_bh(&(ppp)->rlock)
> +#define ppp_recv_unlock(ppp)	write_unlock_bh(&(ppp)->rlock)
>  #define ppp_lock(ppp)		do { ppp_xmit_lock(ppp); \
>  				     ppp_recv_lock(ppp); } while (0)
>  #define ppp_unlock(ppp)		do { ppp_recv_unlock(ppp); \
>  				     ppp_xmit_unlock(ppp); } while (0)
> +#define ppp_recv_read_lock(ppp)		read_lock_bh(&(ppp)->rlock)
> +#define ppp_recv_read_unlock(ppp)	read_unlock_bh(&(ppp)->rlock)
>  
>  /*
>   * /dev/ppp device routines.
> @@ -1246,7 +1248,7 @@ static int ppp_dev_configure(struct net *src_net, struct net_device *dev,
>  	for (indx = 0; indx < NUM_NP; ++indx)
>  		ppp->npmode[indx] = NPMODE_PASS;
>  	INIT_LIST_HEAD(&ppp->channels);
> -	spin_lock_init(&ppp->rlock);
> +	rwlock_init(&ppp->rlock);
>  	spin_lock_init(&ppp->wlock);
>  
>  	ppp->xmit_recursion = alloc_percpu(int);
> @@ -2193,12 +2195,12 @@ struct ppp_mp_skb_parm {
>  static inline void
>  ppp_do_recv(struct ppp *ppp, struct sk_buff *skb, struct channel *pch)
>  {
> -	ppp_recv_lock(ppp);
> +	ppp_recv_read_lock(ppp);
>  	if (!ppp->closing)
>  		ppp_receive_frame(ppp, skb, pch);

That doesn't look right. Several PPP Rx features are stateful
(multilink, compression, etc.) and the current implementations
currently don't take any precaution when updating the shared states.

For example, see how bsd_decompress() (in bsd_comp.c) updates db->*
fields all over the place. This db variable comes from ppp->rc_state,
which is passed as parameter of the ppp->rcomp->decompress() call in
ppp_decompress_frame().

I think a lot of work would be needed before we could allow
ppp_do_recv() to run concurrently on the same struct ppp.

>  	else
>  		kfree_skb(skb);
> -	ppp_recv_unlock(ppp);
> +	ppp_recv_read_unlock(ppp);
>  }
>  
>  /**
> -- 
> 2.43.0
> 


