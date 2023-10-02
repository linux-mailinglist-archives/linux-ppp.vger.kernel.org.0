Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6BF7B4A7D
	for <lists+linux-ppp@lfdr.de>; Mon,  2 Oct 2023 03:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234872AbjJBBKQ (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 1 Oct 2023 21:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234905AbjJBBKP (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 1 Oct 2023 21:10:15 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39C48AB
        for <linux-ppp@vger.kernel.org>; Sun,  1 Oct 2023 18:10:12 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1e12f41e496so1783736fac.3
        for <linux-ppp@vger.kernel.org>; Sun, 01 Oct 2023 18:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696209011; x=1696813811; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlQ+hvWmQHcGG9GSzPyb0ObyJ006PvUfI9GxtqFtuQ0=;
        b=YH3deejlneut2l2bdKT+kS5ZcRX868RloQrpTgwr3LKXlkl+BFG8KKAe9Cp/9PsUNP
         wMxi3GqTcNlGzVtINVSL3S8Xl4io8101hEZNcDP2vUa4l1m9HFbF92/mENELjyLhxNlZ
         D2jJcI8zs8lHS1HLXaAXGeaF3Hzi6jTMMnwAYk9c54tPhErHS5RJ/XSyK+XA6dxhE3SS
         FjK0AeSq19/lhASDepPRdz1a5eQsDtOcjD9MFoTvTQBAs2sujkbhtFxA5Pi6Z9B7HtC3
         yPjQ7bMZjp/txg58a2vZpCF79yPDlLaqYyQNjUBUvmeFtFdWWizTJignoOG+PzQ8LFz9
         2iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696209011; x=1696813811;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlQ+hvWmQHcGG9GSzPyb0ObyJ006PvUfI9GxtqFtuQ0=;
        b=ABIy6IST7SOiMNI8ppYj7JjojPgcFcHR4emKqhPoQAio74XAhk6lYM2hBdE3YCBd8C
         uBJjzS/PTLPDQ6QakEgdvHDmzTYg++/T0pSpmvAnue3gtzxIg8f22qzbSPI6FfeQF3Wn
         13OI89hsJqE2KUCaj0AaRChHZTYI+nbMBHxxBETGfKGonQbOXA3lcrtpAdD8L1Qmp45Y
         H8yk5+WUwHDM+l0kyMfi7pnTXbDKLWrwmkC8nzbZErjqys3HulfMRQfa7s1XaOAHHwO4
         xxGmmmigz0Z653XuWt/hGcJe/GpEOqgNWmnmA1M/tBM9loKp0xBoqmcY5XumzxCu5rK5
         0HeQ==
X-Gm-Message-State: AOJu0YxItZ4elgk5FE2W6OqAdlYriNdVyQpquOy0+75RkpgQoe+W0cPP
        X8Cb0N3xOzyEFzJVJSEz0Q1ieWZindFGPX3hXK81e5YL
X-Google-Smtp-Source: AGHT+IFI+HyoLHwCzdmZS3f+G5W+ZJCrdgXUEzde+dZB4NDvt15ZMBgaScKO2/eh3c//Vmn7ZQV0UU/9GJFoux2M9K8=
X-Received: by 2002:a05:6870:1596:b0:1bb:a227:7008 with SMTP id
 j22-20020a056870159600b001bba2277008mr12738314oab.3.1696209011215; Sun, 01
 Oct 2023 18:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAF8i9mP8BeFEubvv8MpuqP-K1okvoJHRb8m1V=JAE33UZrp2_g@mail.gmail.com>
In-Reply-To: <CAF8i9mP8BeFEubvv8MpuqP-K1okvoJHRb8m1V=JAE33UZrp2_g@mail.gmail.com>
From:   William Tambe <tambewilliam@gmail.com>
Date:   Sun, 1 Oct 2023 20:10:06 -0500
Message-ID: <CAF8i9mOo2CRy-jt=q_xDtYqQ6UDsBB=K6ZeGRLxdina-aC=a=Q@mail.gmail.com>
Subject: Re: [PATCH] drivers/net/slip: prevent data alignment fault
To:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Please, disregard patch, as it is incorrect; resending correct patch
shortly with better explanation of the fix.

On Sun, Oct 1, 2023 at 5:19=E2=80=AFPM William Tambe <tambewilliam@gmail.co=
m> wrote:
>
> From c630b0aea59c1dced626c9da95fd71033763d606 Mon Sep 17 00:00:00 2001
> From: William Tambe <tambewilliam@gmail.com>
> Date: Sun, 1 Oct 2023 17:17:03 -0500
> Subject: [PATCH] drivers/net/slip: prevent data alignment fault
>
> ---
>  drivers/net/slip/slhc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/slip/slhc.c b/drivers/net/slip/slhc.c
> index ba93bab948e0..78b07c46fe08 100644
> --- a/drivers/net/slip/slhc.c
> +++ b/drivers/net/slip/slhc.c
> @@ -459,7 +459,8 @@ slhc_compress(struct slcompress *comp, unsigned
> char *icp, int isize,
>          *cpp =3D ocp;
>          *cp++ =3D changes;
>      }
> -    *(__sum16 *)cp =3D csum;
> +    *cp++ =3D (char)(csum&0xff);
> +    *cp++ =3D (char)((csum>>8)&0xff);
>      cp +=3D 2;
>  /* deltaS is now the size of the change section of the compressed header=
 */
>      memcpy(cp,new_seq,deltaS);    /* Write list of deltas */
> @@ -534,7 +535,7 @@ slhc_uncompress(struct slcompress *comp, unsigned
> char *icp, int isize)
>      thp =3D &cs->cs_tcp;
>      ip =3D &cs->cs_ip;
>
> -    thp->check =3D *(__sum16 *)cp;
> +    thp->check =3D (((__sum16)*cp)|(((__sum16)*(cp+1))<<8));
>      cp +=3D 2;
>
>      thp->psh =3D (changes & TCP_PUSH_BIT) ? 1 : 0;
> --
> 2.34.1
