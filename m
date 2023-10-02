Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C048E7B4B7C
	for <lists+linux-ppp@lfdr.de>; Mon,  2 Oct 2023 08:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235495AbjJBGb5 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 2 Oct 2023 02:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235457AbjJBGb4 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 2 Oct 2023 02:31:56 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D13059B
        for <linux-ppp@vger.kernel.org>; Sun,  1 Oct 2023 23:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
        s=201707; t=1696228308;
        bh=hycDrrk87q8iEKAwE3fajgqNMQmDkKMYjPnLVWfW/AI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wAx8otn54JSI5uq5cyK61/NWoDZMsjRmR+SXwpkCMhinV1/Vgu2C9j6sBFJaWkVIh
         dQgvSb6LGOYjT8fcMpdOqQCggK+uMRiJ5IwgytH/G3fLaXgeanSp0tMsWVY0+TG4aa
         mT9cE9OfRz5Q/TjpyemvninzPr0hnKU9M7XS4uVqND1mwWgNJNGi/AAKVH0reppsmF
         HglCienoYHjuZyDrB/yom7p5ucCKinMgFOKcSv4+VDkR5chYGv+FJI8rxZtniVaEG0
         gUhsawqqTT1dTNwagAm8FVNDJCPbDQhgCCLcj0cJgeoFRgAAvQ7pLV2hUvVZ/WZPIF
         6As3I1eI20WxA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
        id 4RzWM858N1z4xKl; Mon,  2 Oct 2023 17:31:48 +1100 (AEDT)
Date:   Mon, 2 Oct 2023 17:31:44 +1100
From:   Paul Mackerras <paulus@ozlabs.org>
To:     William Tambe <tambewilliam@gmail.com>
Cc:     linux-ppp@vger.kernel.org
Subject: Re: [PATCH] drivers/net/slip: prevent data alignment fault
Message-ID: <ZRpj0LotoVlBRWs7@cleo>
References: <CAF8i9mO42DbVzPhz9cpaL2frpYUyOcSC7qdx6r6bYxkS+QYrKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF8i9mO42DbVzPhz9cpaL2frpYUyOcSC7qdx6r6bYxkS+QYrKw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Sun, Oct 01, 2023 at 09:45:57PM -0500, William Tambe wrote:
> >From 594e53fa4913b1cb6232dbcc73d905a94c0cae73 Mon Sep 17 00:00:00 2001
> From: William Tambe <tambewilliam@gmail.com>
> Date: Sun, 1 Oct 2023 21:38:15 -0500
> Subject: [PATCH] drivers/net/slip: prevent data alignment fault
> 
> Prevent data alignment fault on architectures which cannot
> do unaligned memory access.
> ---
>  drivers/net/slip/slhc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/slip/slhc.c b/drivers/net/slip/slhc.c
> index ba93bab948e0..08fd570a6d40 100644
> --- a/drivers/net/slip/slhc.c
> +++ b/drivers/net/slip/slhc.c
> @@ -459,8 +459,8 @@ slhc_compress(struct slcompress *comp, unsigned
> char *icp, int isize,
>          *cpp = ocp;
>          *cp++ = changes;
>      }
> -    *(__sum16 *)cp = csum;
> -    cp += 2;
> +    *cp++ = (char)(csum&0xff);
> +    *cp++ = (char)((csum>>8)&0xff);

You just changed the meaning of the code on big-endian machines.

I think it would be better to use put_unaligned() here, and
get_unaligned() below.

>  /* deltaS is now the size of the change section of the compressed header */
>      memcpy(cp,new_seq,deltaS);    /* Write list of deltas */
>      memcpy(cp+deltaS,icp+hlen,isize-hlen);
> @@ -534,7 +534,7 @@ slhc_uncompress(struct slcompress *comp, unsigned
> char *icp, int isize)
>      thp = &cs->cs_tcp;
>      ip = &cs->cs_ip;
> 
> -    thp->check = *(__sum16 *)cp;
> +    thp->check = (((__sum16)*cp)|(((__sum16)*(cp+1))<<8));
>      cp += 2;
> 
>      thp->psh = (changes & TCP_PUSH_BIT) ? 1 : 0;
> -- 
> 2.34.1

Paul.
