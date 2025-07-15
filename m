Return-Path: <linux-ppp+bounces-324-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E840AB0652E
	for <lists+linux-ppp@lfdr.de>; Tue, 15 Jul 2025 19:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A93E189AAF7
	for <lists+linux-ppp@lfdr.de>; Tue, 15 Jul 2025 17:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749281FC0ED;
	Tue, 15 Jul 2025 17:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XAP8EW/z"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F5425F994
	for <linux-ppp@vger.kernel.org>; Tue, 15 Jul 2025 17:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752600838; cv=none; b=fw+30zwf6/TalpzgOiL7EVTu6klBXOOurHrCXjlcaz0iBaweB4YRieAAzz97YhUdwLuINXXpSTWDdgaQLmV/NyYYxkbZNqmCnjCQb7bHgKn1tCG6jN/8tUxJTT0uf2PRtEU9G6MlzfnRe+ts0aCqSt286cUs/zQlTc4/NGoEsD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752600838; c=relaxed/simple;
	bh=FPrp+fH8wQ80pVHpy1RyvyWQHJ1VB8e4XUj3uXXKyQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ati2ZM+gRJFUfM4d2yZRJ5jUGZDAeaLP/sNu/YdtYL5cyKMNfJVFLT2l7ev7cZtIvxYRDsVTaS6b7X8ldBdIntxXqwI+jUzQ1kyvIMaI/glDN9wezhT5C3siBoucDppHvt+6nr67bRC1toveMJPO9HwsAnZbO2/EFFC/5LaGFs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XAP8EW/z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752600835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XaSiBOF1wPWOTv8AtgeF8xVaaHSWbgZKOuWdwXI5wu0=;
	b=XAP8EW/zkcixY9r/db2EnkIYDZHFq/R9G3yNHV4DvcK2ZWM7xAY+V3zCCQ9ExT6qZgNMWB
	0VgaMJuE0Yd14MH5UMqYit8J4VqkqQz10SPdIxPz5s30s5hQy0xxz7OYlgsSGOEG4Wv/gd
	HAp6sOCHc2I5yemf1hQ4CC/Wn3QOBeY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-WYiugHt1MDKpvg4gCtdHzw-1; Tue, 15 Jul 2025 13:33:54 -0400
X-MC-Unique: WYiugHt1MDKpvg4gCtdHzw-1
X-Mimecast-MFC-AGG-ID: WYiugHt1MDKpvg4gCtdHzw_1752600833
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a50816cc58so2006453f8f.3
        for <linux-ppp@vger.kernel.org>; Tue, 15 Jul 2025 10:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752600833; x=1753205633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaSiBOF1wPWOTv8AtgeF8xVaaHSWbgZKOuWdwXI5wu0=;
        b=dYLmHKX71Ed25P6gPHB7Rj2nOnOGcrDKBLYu3X5FH6XucL4nICooo2Tm7Igh1Ic9Ir
         raIhPUtOfkzC7vlv6CTGAET0eFComreXx1dAioamtVGPikvnLtdBik8Ys4O+yqH81bPN
         diRaJIH9+fZlUEpabCIoM+UXZFr18EEV7ltP4BBsy35T88AqstG0cbeYkFfpl57ZjPS4
         zoedkX9qaB9YlDof0q6dkwBggvoqTLHwfkbd0k54/PS/H5mEJZEE0LQwJXE+u9eHTdJc
         rjKV/ltbyn2pZ+T20MfyE719SVF187tll9NobDxpnTAcNOuf9L3tobfXDQJxhQxb7Jvi
         lxIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMrt+EwKhS9Sj/I490pRtJWYGt+aafEytW4tQC/EJeB9Ys/Zd75P3y/TQp/fmG7YyUPDuthCAAsb8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8a+zlxd9wKfPiwzVxABtYJzo+qsbtxeyMzaSZumsujDXM446i
	GU5WAPk2jX0Lmej5NvVSoHelvAL1BGdQfxoHM2AE10wCYgi60C/ze0dAVSzIDMFYWP4ojbn2xe/
	7npGTLWMTFIMDWmavB2vK2h9uDEiWmTip6vOJoyG/6HlbNZbiOeNdTNpVe/N5XQ==
X-Gm-Gg: ASbGncvpdPdesil18Z/OSxy5mfdjU9KfmviXlU42f9iki7A17LSLzBeimK/UZISH3sX
	FOYEMoiAvsiv41ivSQ/8wVpHXlLEoyeeFXgqufwQB6gMepXUqFz8jePFE4aUP/nyg3zroc7R84q
	SfoBNuWicTYC3MJ37Q/0sw0kMmWM5wiaw1qF5e8mSz4Rl/R0scNUshu4u5NHhkyv/9HJe9tL0HV
	wOAy7iDFbpQesX720vG7B9d7kS2QnhrWf8n0x6MZy4gYf5/2O4I69wNZbUTy2OCcvLKx5Aq+NJj
	yDJ5aO5ZVO4aJ9zagnn5ihcXyn0=
X-Received: by 2002:a5d:5f87:0:b0:3b6:463:d85d with SMTP id ffacd0b85a97d-3b60dd4b599mr60672f8f.11.1752600832703;
        Tue, 15 Jul 2025 10:33:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+0cB2h3qUzp+CrQ+V3JIFurhf++QRbNMS5r7Z3JeZZgdTqJ5fZlkHZ6XnPGFSQzS2Qf+b1A==
X-Received: by 2002:a5d:5f87:0:b0:3b6:463:d85d with SMTP id ffacd0b85a97d-3b60dd4b599mr60646f8f.11.1752600832314;
        Tue, 15 Jul 2025 10:33:52 -0700 (PDT)
Received: from debian ([2001:4649:f075:0:a45e:6b9:73fc:f9aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1776sm15883259f8f.12.2025.07.15.10.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 10:33:51 -0700 (PDT)
Date: Tue, 15 Jul 2025 19:33:48 +0200
From: Guillaume Nault <gnault@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: netdev@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	linux-ppp@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Williams <clrkwllms@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH net-next v2 1/1] ppp: Replace per-CPU recursion counter
 with lock-owner field
Message-ID: <aHaQ/DZ3U/Sxd7Rs@debian>
References: <20250710162403.402739-1-bigeasy@linutronix.de>
 <20250710162403.402739-2-bigeasy@linutronix.de>
 <aHUsB04j+uFrUkpd@debian>
 <20250714200139.tgfgVP1L@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714200139.tgfgVP1L@linutronix.de>

On Mon, Jul 14, 2025 at 10:01:39PM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-07-14 18:10:47 [+0200], Guillaume Nault wrote:
> > On Thu, Jul 10, 2025 at 06:24:03PM +0200, Sebastian Andrzej Siewior wrote:
> > > The per-CPU variable ppp::xmit_recursion is protecting against recursion
> > > due to wrong configuration of the ppp channels. The per-CPU variable
> > 
> > I'd rather say that it's the ppp unit that is badly configured: it's
> > the ppp unit that can creates the loop (as it creates a networking
> > interface).
> 
> I can reword this.
> 
> > > index def84e87e05b2..0edc916e0a411 100644
> > > --- a/drivers/net/ppp/ppp_generic.c
> > > +++ b/drivers/net/ppp/ppp_generic.c
> > > @@ -119,6 +119,11 @@ struct ppp_link_stats {
> > >  	u64 tx_bytes;
> > >  };
> > >  
> > > +struct ppp_xmit_recursion {
> > > +	struct task_struct *owner;
> > > +	local_lock_t bh_lock;
> > > +};
> > > +
> > 
> > This hunk conflicts with latest changes in net-next.
> 
> Thank you.
> 
> > Apart from the two minor comments above, the patch looks good to me.
> > Thanks!
> 
> Okay. As of the people involved while this detection was added and
> polished, do you have an opinion on v1?
> 	https://lore.kernel.org/all/20250627105013.Qtv54bEk@linutronix.de/

I like the idea of having an owner for each of the locks involved in
the recursion. That looks cleaner than the current approach of selecting
strategic places where to handle the possible recursion.

However, as a reviewer, I agree with Paolo that the diff is difficult
to reason about. Reviewing the v1 patch actually requires reviewing the
complete PPP channel and PPP unit transmit paths, with all their funny
features and lock interactions.

So I'd prefer that we merge your v2 (or v3). Then, if you really want
to push for the v1 approach, maybe consider proposing it as a follow up
during the next development cycle. Note that if you do so, I'd like
that you also write a selftest that could reliably trigger the
recursion when sending a packet through the channel and when sending
one through the unit.

In the end, I'm honestly not sure if the small cleanup benefice of the
lock owners approach is worth it, considering the general difficulty of
maintaining the kernel PPP implementation (brittle code, questionable
architecture, almost no reviewer).

> Sebastian
> 


