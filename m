Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7567B56B0
	for <lists+linux-ppp@lfdr.de>; Mon,  2 Oct 2023 17:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238082AbjJBPYQ (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 2 Oct 2023 11:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237694AbjJBPYO (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 2 Oct 2023 11:24:14 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C335AC
        for <linux-ppp@vger.kernel.org>; Mon,  2 Oct 2023 08:24:11 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1dd0526b5easo8034182fac.2
        for <linux-ppp@vger.kernel.org>; Mon, 02 Oct 2023 08:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696260251; x=1696865051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUvKOLDEirwa289+yIgjUI0xKvAi36M38qmUS3lHk38=;
        b=QpxIX9/pZVqGlrlwaiylo+AWrFRBGJxAuu78k03C+DOs4HmSEyTPJpDzLWliSDqk8a
         EQZbV6o/XMrUZXPn1oVopECyiJqxwcTZjjhaL5NLNey5NvYiprAaXux0Gxx/6Y2C+YQO
         tdeR0+uC3ZDFqDKYR5p8yRiL3Bc7fT+YPq/txDQOj5AABhXaLhtSLb4+vTfuB2dfePmn
         4C+87G3JgovynjjSIUU/sfX+OjU7wrNw+jtICs3zgrdryxlbqjRh+A5jx1RALNB6dJIy
         yNq6GBRvRstVVhrRZTMxMuhU5QyJj4OaRhrCrEUFef4X3O9B7ApGwXwhgozh49OvVZvN
         xgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696260251; x=1696865051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUvKOLDEirwa289+yIgjUI0xKvAi36M38qmUS3lHk38=;
        b=L2sPMZxKZbBvNVDIBg7zrJ8uU9GG16XzJK1Ana3lFRlHpjvZgi255CzHlYzIW2QZ0l
         mUIU+ys4AodSg6nCg4me0LDIskcb1S5PQK45qeVJ6zFlbNiymeJSiiy0ipsjtc3+U/Pz
         GcP8AQ+SQMAvZLnNa4ypJ9s4jgthTg05ZqZ83/4hCQ8g0weEEgQMeb9kpM7t4pW2oZCD
         Us5q30k5eZW14RZerEGCzrIGJW2UVHsvKoueHT9nUDNKhiEBjxGzoj1YollRlI1SizqZ
         3eqxThDrWf9EQcs8vqosT743TBpL0g5u+j0vvw2i1uQ0tmehFp/mln48KY2xBaSwCt/I
         6Dlw==
X-Gm-Message-State: AOJu0Yz/AAwcazry93PwP3E494AAOq6O0gSP69obfz9T5wV8BIf+Bm2T
        1paKGHQ0Zp+5o58GDG18sub+dx2VbmUjM1YdGXPkuep7qdY=
X-Google-Smtp-Source: AGHT+IFUIEekR+QGNmPeAUDxi+cLaXAAdFHkd9RTDn1ywUoNYafcD5Kf1NTJLCasWc4Rx1o9Tk8dwgqkE06l8ZjEsAo=
X-Received: by 2002:a05:6870:438d:b0:1d0:dc5b:d67 with SMTP id
 r13-20020a056870438d00b001d0dc5b0d67mr14560261oah.42.1696260250682; Mon, 02
 Oct 2023 08:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAF8i9mO42DbVzPhz9cpaL2frpYUyOcSC7qdx6r6bYxkS+QYrKw@mail.gmail.com>
 <ZRpj0LotoVlBRWs7@cleo>
In-Reply-To: <ZRpj0LotoVlBRWs7@cleo>
From:   William Tambe <tambewilliam@gmail.com>
Date:   Mon, 2 Oct 2023 10:24:07 -0500
Message-ID: <CAF8i9mO24ByRSjNR6N0ym-LU30z-NTfiw=Q_+Dvx6L6baEq0HQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/net/slip: prevent data alignment fault
To:     Paul Mackerras <paulus@ozlabs.org>
Cc:     linux-ppp@vger.kernel.org
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

Thanks, sending v2 of the patch that uses put_unaligned() here, and
get_unaligned().

William

On Mon, Oct 2, 2023 at 1:31=E2=80=AFAM Paul Mackerras <paulus@ozlabs.org> w=
rote:
>
> On Sun, Oct 01, 2023 at 09:45:57PM -0500, William Tambe wrote:
> > >From 594e53fa4913b1cb6232dbcc73d905a94c0cae73 Mon Sep 17 00:00:00 2001
> > From: William Tambe <tambewilliam@gmail.com>
> > Date: Sun, 1 Oct 2023 21:38:15 -0500
> > Subject: [PATCH] drivers/net/slip: prevent data alignment fault
> >
> > Prevent data alignment fault on architectures which cannot
> > do unaligned memory access.
> > ---
> >  drivers/net/slip/slhc.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/slip/slhc.c b/drivers/net/slip/slhc.c
> > index ba93bab948e0..08fd570a6d40 100644
> > --- a/drivers/net/slip/slhc.c
> > +++ b/drivers/net/slip/slhc.c
> > @@ -459,8 +459,8 @@ slhc_compress(struct slcompress *comp, unsigned
> > char *icp, int isize,
> >          *cpp =3D ocp;
> >          *cp++ =3D changes;
> >      }
> > -    *(__sum16 *)cp =3D csum;
> > -    cp +=3D 2;
> > +    *cp++ =3D (char)(csum&0xff);
> > +    *cp++ =3D (char)((csum>>8)&0xff);
>
> You just changed the meaning of the code on big-endian machines.
>
> I think it would be better to use put_unaligned() here, and
> get_unaligned() below.
>
> >  /* deltaS is now the size of the change section of the compressed head=
er */
> >      memcpy(cp,new_seq,deltaS);    /* Write list of deltas */
> >      memcpy(cp+deltaS,icp+hlen,isize-hlen);
> > @@ -534,7 +534,7 @@ slhc_uncompress(struct slcompress *comp, unsigned
> > char *icp, int isize)
> >      thp =3D &cs->cs_tcp;
> >      ip =3D &cs->cs_ip;
> >
> > -    thp->check =3D *(__sum16 *)cp;
> > +    thp->check =3D (((__sum16)*cp)|(((__sum16)*(cp+1))<<8));
> >      cp +=3D 2;
> >
> >      thp->psh =3D (changes & TCP_PUSH_BIT) ? 1 : 0;
> > --
> > 2.34.1
>
> Paul.
