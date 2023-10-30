Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDAF7DBC69
	for <lists+linux-ppp@lfdr.de>; Mon, 30 Oct 2023 16:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233604AbjJ3PKA (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 30 Oct 2023 11:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233594AbjJ3PJ7 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 30 Oct 2023 11:09:59 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9CF0A9
        for <linux-ppp@vger.kernel.org>; Mon, 30 Oct 2023 08:09:57 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1e19cb7829bso2821867fac.1
        for <linux-ppp@vger.kernel.org>; Mon, 30 Oct 2023 08:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698678597; x=1699283397; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGL04S8tGUpdu2lZa0xwmYvsNqPksLNzTkayrI5h1V8=;
        b=Z/k87tzpv1bgbXgQCYhlnhVXZ9ZTbdwrxPfW4umCCteDZu1tmPBjDnyLqqa9BYjNZM
         de0KyUKx+PUZF7R9x8ddA6oJ9LgyVmEKDYOrRFJ0TOpL7NZSd39QVpePbeHFc9LGSpIb
         Vx2Bc2V4xr7VxKarwgKSwMBCaiPA3vSzyAbggBT5tDf7KNRHrO/9MsrK3Oj7C4VNFnSl
         dydw6BrZPrGDuIf+Q/KHy5ZU3GOZ3Cmp+/Sw3TXfy1duY4T+3i0MuTlqm0OJoBFYkDoK
         lkoNKCvoOEV0AEM7tcd4GoQjZCHoFgB//WdNHFiaUyT1Nkmte8fkniLOcup2m85rm4kU
         e40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698678597; x=1699283397;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGL04S8tGUpdu2lZa0xwmYvsNqPksLNzTkayrI5h1V8=;
        b=CsDccVNwq0IIE40Qbz8yUUtBG6+hQlNca6zwMkzWMTEpoYoqu2r1swlY90wvOsnqrf
         bmkOTwZjCym00VngmFSdMgv+5KTM3ru7QVJJczqh1IW/NCZtOOI8PFgOUGcx2l1ybaxy
         I9djhsKPv+XhtjBFlp0+2tpdKg7048pc/+UzC3hOkMJC8w6jma0PPgqNdN6RPkOCc1PD
         MwVypuPMTjtERf/sZRWkcrX44cLWMK3mQTfWTdpc0oSgHLKTTcjYlfRbVHqasjyx6TIf
         1pnpiL2toZhqQiowNtneakbtrvfhPUUp2tov2cibDKoSqnuy8Gqh6cyxsILa4iIWI+PI
         +uiw==
X-Gm-Message-State: AOJu0Ywp9oHeSJar+C6OoK76A7nD9jd9yioZ2NK59fkEyhU6cEelbtDs
        abAVADwEXdVVWBPdC0PtG8MRenEYT1TLlfAYdgsmObT0
X-Google-Smtp-Source: AGHT+IG2MMWoCQ6QExPlroejeIsp3OcfEHHtjhLAOhYL2Q3qqxs5W55NsIw+rmy2DNx8BCB8vjG3oX5tQf9EpaoinNw=
X-Received: by 2002:a05:6870:b155:b0:1ea:1e74:c377 with SMTP id
 a21-20020a056870b15500b001ea1e74c377mr14285484oal.36.1698678596800; Mon, 30
 Oct 2023 08:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAF8i9mP0q9cKG+GigeQUd_YTZaOG6oTNzho+xrv8Bi3oPtJ2yA@mail.gmail.com>
In-Reply-To: <CAF8i9mP0q9cKG+GigeQUd_YTZaOG6oTNzho+xrv8Bi3oPtJ2yA@mail.gmail.com>
From:   William Tambe <tambewilliam@gmail.com>
Date:   Mon, 30 Oct 2023 10:09:57 -0500
Message-ID: <CAF8i9mOk=F3LY-vUWLMdizBwJXbn2rcRb1Agh_On0O0G3CSCiw@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/net/slip: prevent data alignment fault
To:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

What additional steps or changes do I need to make for this patch to
make it to mainline ?

On Mon, Oct 2, 2023 at 10:24=E2=80=AFAM William Tambe <tambewilliam@gmail.c=
om> wrote:
>
> From d30bc4e92236e72bb0a9a743f3ad605ea1c1152e Mon Sep 17 00:00:00 2001
> From: William Tambe <tambewilliam@gmail.com>
> Date: Mon, 2 Oct 2023 10:16:54 -0500
> Subject: [PATCH v2] drivers/net/slip: prevent data alignment fault
>
> Prevent data alignment fault on architectures which cannot
> do unaligned memory access.
> ---
>  drivers/net/slip/slhc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/slip/slhc.c b/drivers/net/slip/slhc.c
> index ba93bab948e0..f198be2c7205 100644
> --- a/drivers/net/slip/slhc.c
> +++ b/drivers/net/slip/slhc.c
> @@ -459,7 +459,7 @@ slhc_compress(struct slcompress *comp, unsigned
> char *icp, int isize,
>          *cpp =3D ocp;
>          *cp++ =3D changes;
>      }
> -    *(__sum16 *)cp =3D csum;
> +    put_unaligned(csum, (__sum16 *)cp);
>      cp +=3D 2;
>  /* deltaS is now the size of the change section of the compressed header=
 */
>      memcpy(cp,new_seq,deltaS);    /* Write list of deltas */
> @@ -534,7 +534,7 @@ slhc_uncompress(struct slcompress *comp, unsigned
> char *icp, int isize)
>      thp =3D &cs->cs_tcp;
>      ip =3D &cs->cs_ip;
>
> -    thp->check =3D *(__sum16 *)cp;
> +    thp->check =3D get_unaligned((__sum16 *)cp);
>      cp +=3D 2;
>
>      thp->psh =3D (changes & TCP_PUSH_BIT) ? 1 : 0;
> --
> 2.34.1
