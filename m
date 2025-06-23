Return-Path: <linux-ppp+bounces-299-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82578AE3D8C
	for <lists+linux-ppp@lfdr.de>; Mon, 23 Jun 2025 12:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E7D97A34DB
	for <lists+linux-ppp@lfdr.de>; Mon, 23 Jun 2025 10:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393B823E350;
	Mon, 23 Jun 2025 10:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AdWwGj7T"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F28523D2B6
	for <linux-ppp@vger.kernel.org>; Mon, 23 Jun 2025 10:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676329; cv=none; b=HCMHXh3OnxSqbXMhJIyBUcjBaP0cdhIQTbsfHNbShhW8HaGb2mEC0PWAtJ+EPeJJ4kZYhKzWTWKfSktVXYq352Dr3ESv4MwLgDERUyf8EAWFaOMfMW2YVaSAejxpm7dHppuaWSLeE5/110BfQKhankVXS098f5zc5SNdD3j7LDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676329; c=relaxed/simple;
	bh=EErLWh9XrgJNcdZGRifMKXJSqa0n2177cUJabg2LT7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUa+xSfeDC3f8gpvf45OYVwA5MfL2rF0IIRouDJ5z/pStoODSRAtDbt/1SXP98XrxtwpoAe1FQ/SCvpTW0NCvso1HeXv3B3vGsHVuEFjZjrHLndE1nh477iTzOEs3t14LU+vBa8znVY9UYkIy60ANwfMJxaRlrRhTf4ZaOOLzKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AdWwGj7T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750676326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fco4vtRzYDDw/pHaJKec/EnFJ9SMT2p2BP0btZaM8tY=;
	b=AdWwGj7Tq81U9bqRrlDDQ/SPXPyVrESgYF29QkAegD062X37g/b0RZ7zRnAxmvxY35YejA
	icog1GmFHClxMvOKOEbhTVwP0bQAQLjDDMGL2LxNdaKGppsC/07mYZMrXVx6xN64piBt5I
	IrXkacpJ/f6eU2is6DoVuh8NdQ0BCh8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-xfLXgTyqO76f4a7UnwKeKg-1; Mon, 23 Jun 2025 06:58:45 -0400
X-MC-Unique: xfLXgTyqO76f4a7UnwKeKg-1
X-Mimecast-MFC-AGG-ID: xfLXgTyqO76f4a7UnwKeKg_1750676324
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45311704cdbso27316865e9.1
        for <linux-ppp@vger.kernel.org>; Mon, 23 Jun 2025 03:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750676323; x=1751281123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fco4vtRzYDDw/pHaJKec/EnFJ9SMT2p2BP0btZaM8tY=;
        b=OloQnUmW2iMRShHQaerUq0CSebwM8xqnzaa0Bq9RgLaraZLc9sx7RnqTIdeogvOnXi
         DQwg+KoV2/VvjF+lmeyLc7GtzcDsV7clanyqi3vL8dP8iqlw5Obpje7KHSkEO341LMP+
         LsLIJw/YnpzBjhrfJk+hNJz+N+Ch7vya8lz8f3eI+3PdzLOjxHwSt2/LlprnrTCb2W/R
         ksMqeDki/AaW0BjnZuK1P/eUYFtLM0iptKxYh2AeJW6nwCqVlFxE9B5dmVRmsDIGm9wA
         Uct9oTXUpw72mFzHmvpfH4iP2COKletUzDa6qr4QcDuGV0c4G3a23q/EvIE8Ln1BQQgZ
         jZaw==
X-Gm-Message-State: AOJu0YyRpFyk3e/+biHnYCicDUyKKHE/f8DeZy7txPYtbRjlUHkRP0gU
	1ZQI+ev5yd3BLJ0D2fkJqq1l9M84dn8DhpVmyoFb+9CIJGB2AuJiNHKitlE09w+qo+qTFEBeC4f
	yE9bsfCP2pOXTKlQ65M1L9Kd7hxVx/68m1OlV66RzyLK3MeUt1l36AgUmMkezbw==
X-Gm-Gg: ASbGncuYFF0aPhAYiiG6VeFlRcCNXyAGNimrTyC7N19SiDG4EnysHoAzMckb2gVE8zR
	/0id2uBbNO8iiRGa1GAIqEiOhTESF3tam23W5912kI6X1TVBl+w7T05PK5bRlu25nOtxpdcJEad
	X7mi+eqVF8yxy/W9cEA7va20ypDpyGuFR8wCfPpty7Mw9Irs1CSNBJpuaZswsyd8+TZ++1XmIdi
	9qGJYUeyTmGWdCwntpiMRY3pPLgheGV5MANnx1lu1aCrTlIDX1sB1y7ziQQltBzH/Vl1i1QYGCX
	MD/NAvtFJbZRZcNEZafvcliaMXGfXFdECtRmaYfrtYacPjQ2g+mSGY5K9kgaYM5wr2w9VXE+bB9
	m1g==
X-Received: by 2002:a05:600c:5494:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-453657be65fmr102123605e9.8.1750676323473;
        Mon, 23 Jun 2025 03:58:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeMGWI9zXCkvZ6XaBwo/RYYoquB2fA9+J9yIDbiHxixIIBumezj2Y4ZCKG/s8zRIZRGmk29Q==
X-Received: by 2002:a05:600c:5494:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-453657be65fmr102123215e9.8.1750676323074;
        Mon, 23 Jun 2025 03:58:43 -0700 (PDT)
Received: from debian (2a01cb058d23d600538a1f8d783da59a.ipv6.abo.wanadoo.fr. [2a01:cb05:8d23:d600:538a:1f8d:783d:a59a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45364705748sm104423235e9.28.2025.06.23.03.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:58:42 -0700 (PDT)
Date: Mon, 23 Jun 2025 12:58:40 +0200
From: Guillaume Nault <gnault@redhat.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-ppp@vger.kernel.org, Michal Ostrowski <mostrows@earthlink.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] pppoe: drop PACKET_OTHERHOST before
 skb_share_check()
Message-ID: <aFkzYKBU/c8aub5Q@debian>
References: <20250623033431.408810-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623033431.408810-1-dqfext@gmail.com>

On Mon, Jun 23, 2025 at 11:34:31AM +0800, Qingfang Deng wrote:
> Align with ip_rcv() by dropping PACKET_OTHERHOST packets before
> calling skb_share_check(). This avoids unnecessary skb processing
> for packets that will be discarded anyway.
> 
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
>  drivers/net/ppp/pppoe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
> index 68e631718ab0..410effa42ade 100644
> --- a/drivers/net/ppp/pppoe.c
> +++ b/drivers/net/ppp/pppoe.c
> @@ -372,9 +372,6 @@ static int pppoe_rcv_core(struct sock *sk, struct sk_buff *skb)
>  	 * can't change.
>  	 */
>  
> -	if (skb->pkt_type == PACKET_OTHERHOST)
> -		goto abort_kfree;
> -
>  	if (sk->sk_state & PPPOX_BOUND) {
>  		ppp_input(&po->chan, skb);
>  	} else if (sk->sk_state & PPPOX_RELAY) {
> @@ -418,6 +415,9 @@ static int pppoe_rcv(struct sk_buff *skb, struct net_device *dev,
>  	struct pppoe_net *pn;
>  	int len;
>  
> +	if (skb->pkt_type == PACKET_OTHERHOST)
> +		goto drop;
> +
>  	skb = skb_share_check(skb, GFP_ATOMIC);
>  	if (!skb)
>  		goto out;

Agree. You can also refine the condition and reject broadcast packets
by using "if (skb->pkt_type != PACKET_HOST)". PPPoE session packets
should always be unicast.

Acked-by: Guillaume Nault <gnault@redhat.com>


