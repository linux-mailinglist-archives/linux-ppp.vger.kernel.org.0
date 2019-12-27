Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2A8B12B46A
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Dec 2019 13:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbfL0MFn (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 27 Dec 2019 07:05:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44334 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726365AbfL0MFn (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 27 Dec 2019 07:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1577448342;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Q5XXULvPBCdPqhDyApB0SLhznAFY7NUhBbt1TjCPMF0=;
        b=OcykDk3QmPDxoXCnixeHEpreRwv60SuqDxKPA3PPhCW0InbQcs6e7D9mmKFI4Xr5+GaigY
        f1gb7jJCj4PkKg4Z/amxPuTavlTeYsdqQdK2p+HcH5ZBKcK3CUFhcVFSuBIFZp0P6V6KCD
        /yHqe+ZcytmcTMl6cGD58Yh/6BoF3RU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-5jBkuf4SNQON94Vgb-6Vmg-1; Fri, 27 Dec 2019 07:05:40 -0500
X-MC-Unique: 5jBkuf4SNQON94Vgb-6Vmg-1
Received: by mail-wm1-f70.google.com with SMTP id t16so1109916wmt.4
        for <linux-ppp@vger.kernel.org>; Fri, 27 Dec 2019 04:05:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q5XXULvPBCdPqhDyApB0SLhznAFY7NUhBbt1TjCPMF0=;
        b=BA4YnPfYXoldUEpR2CGF9qYZTt8BlcBWhAisIBW4uHgSkXT1kUaUt+v97YbzM+EsEe
         9QmzU2VVmekZJQtNjWrB6s6N6ABwJwXEZiJTFuomZPvMsm1Mftt9eMxmGtcPqfsvMqWC
         5avtv/ViinYn1GHBP+8IhG69UkP9E8S32JQIWd3pDh+nsYstA1+TYfTRrXoGT5q1rtyV
         rP8QvlC3SocmAFdazjDbeuUw6e6DvG45tFj6b7NbZ7N21TFiDxAS5Y5n8b1PTJIjNHEP
         8qEgGQtjtY2dY1h48ic8qpXcS5CdTLZTEZJ+Qx20fpZL3qBZh/sRBMM1C4M1DfoTjP7Q
         ZSdA==
X-Gm-Message-State: APjAAAWKuwNtSkecfxr7kHpEINV2JY8ov0O7JxNxX+pbPLBXoP3FAcyt
        1vunoS+TSYnfX7edY9JgIOlDX0HGS+jgEJ0X7EXrWwe9O4g+y3LGvJA4Y50sCR1BApaHtaRVa0w
        Y5VjiHx4gWcp+N7bh1pkB
X-Received: by 2002:adf:f850:: with SMTP id d16mr51411888wrq.161.1577448339408;
        Fri, 27 Dec 2019 04:05:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqxIUH/iXdbActUcnfV2oV6Gg5J5xnzokN2jSRLSiWh+2/KOUFQxi7yrQhQWMqgwNXmx/uukAw==
X-Received: by 2002:adf:f850:: with SMTP id d16mr51411867wrq.161.1577448339208;
        Fri, 27 Dec 2019 04:05:39 -0800 (PST)
Received: from linux-2.home (2a01cb058918ce00dd1a5a4f9908f2d5.ipv6.abo.wanadoo.fr. [2a01:cb05:8918:ce00:dd1a:5a4f:9908:f2d5])
        by smtp.gmail.com with ESMTPSA id k13sm33967659wrx.59.2019.12.27.04.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2019 04:05:38 -0800 (PST)
Date:   Fri, 27 Dec 2019 13:05:36 +0100
From:   Guillaume Nault <gnault@redhat.com>
To:     Xu Wang <vulab@iscas.ac.cn>
Cc:     paulus@samba.org, davem@davemloft.net, linux-ppp@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ppp: Remove redundant BUG_ON() check in ppp_pernet
Message-ID: <20191227120536.GA32264@linux-2.home>
References: <1577243224-1923-1-git-send-email-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577243224-1923-1-git-send-email-vulab@iscas.ac.cn>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Wed, Dec 25, 2019 at 03:07:04AM +0000, Xu Wang wrote:
> Passing NULL to ppp_pernet causes a crash via BUG_ON.
> Dereferencing net in net_generic() also has the same effect.
> This patch removes the redundant BUG_ON check on the same parameter.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---
>  drivers/net/ppp/ppp_generic.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index 3bf8a8b..22cc2cb 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -296,8 +296,6 @@ static struct class *ppp_class;
>  /* per net-namespace data */
>  static inline struct ppp_net *ppp_pernet(struct net *net)
>  {
> -	BUG_ON(!net);
> -
>  	return net_generic(net, ppp_net_id);
>  }
Acked-by: Guillaume Nault <gnault@redhat.com>

