Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0090AAB23F
	for <lists+linux-ppp@lfdr.de>; Fri,  6 Sep 2019 08:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389620AbfIFGNP (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 6 Sep 2019 02:13:15 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36777 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389591AbfIFGNP (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 6 Sep 2019 02:13:15 -0400
Received: by mail-oi1-f194.google.com with SMTP id k20so4041561oih.3
        for <linux-ppp@vger.kernel.org>; Thu, 05 Sep 2019 23:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=lm35lqYANr7RWzXjWDYZwksjF6Mq+BmtoOr5FpRGY5E=;
        b=P1xzjDrAtEH0KIz7i+HCUC0aEUzA2M7SfWbAY6FsWDL8OowusO5ssEfZz/sK/Uqk+h
         dJ/BS0UAHHJ05fFUVw/NgbsLuQ7e3coOMrKY61LZ6iB6y79ti/DgUu92lmPYz54/DBT6
         x1Sq/PSpJednu5kJ5/IrA2RJKa6wPWMzVI1Te2pACQUg2el+5fFExFCM0etK5c64I+Ft
         m+g9yVRH8A6Z0ZUOy5VlZ7S5ktwSGuxDxoA4ODLwaPc5mFrPA8IjnPRj2ecexyGQK4gl
         eymHGHphsyZDy3BwwFVBtIJ5vUueJyO+xpyLVIWdnBrRJb1cTM/nSWSANBl0dPANwDEl
         lNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=lm35lqYANr7RWzXjWDYZwksjF6Mq+BmtoOr5FpRGY5E=;
        b=WKysGXFuUgUMDJOxPbsLJCg5gpKOfXe6E1oCshremjwYJf0G7FtWVLEsiaevdn5ECU
         NJd8HIKBmnLEmNKCZvZ22ransFKtvleszd7wdL0f+5k8fYjPN/+jpYvRJJbXjHNPCY6R
         4WLGop5qjvSGvuPfKGokNWUWwC252lo6rQMEKgOkxX15/wH5WTEuq0lOalHElxewbw/Z
         mPjZDt7ucrPXT4HpXMZj2HYkvfyDGUPlTCj3Ij9LIh8SUAP7wZga7BDye7E5S7pH569s
         4ypOlSCfEgMVYmW3uYG9T1A0wRLy2u8NEg0MVikQ3s/VK71DBv3qf6vph8CEYu+4gjtE
         4cfg==
X-Gm-Message-State: APjAAAUjNzj7nMLXXep6gi5wFEDpQn4sQ/ZXBLT1UnoyvPQEVvrpADjm
        KA9wtxvaQ8CjrJwIKrdDaJhIM30H9UJZ0lt8Vf5OWg==
X-Google-Smtp-Source: APXvYqxgRgIp9PLl7te0QKBxk5XD4f5D41Jbzs5TkdJh3wkUZL28Q0diIuyhS40O/3LVoVDWP1DXCnE2wi9B7aJhpXc=
X-Received: by 2002:aca:e183:: with SMTP id y125mr5704531oig.27.1567750394121;
 Thu, 05 Sep 2019 23:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567649728.git.baolin.wang@linaro.org> <c24710bae9098ba971a2778a1a44627d5fa3ddc0.1567649729.git.baolin.wang@linaro.org>
 <20190905161642.GA5659@google.com>
In-Reply-To: <20190905161642.GA5659@google.com>
From:   Baolin Wang <baolin.wang@linaro.org>
Date:   Fri, 6 Sep 2019 14:13:02 +0800
Message-ID: <CAMz4kuJem-H4pPKSTDAy3vmWmYhAf-tdjH-HmZ_aN7VYXJN6mw@mail.gmail.com>
Subject: Re: [BACKPORT 4.14.y v2 5/6] ppp: mppe: Revert "ppp: mppe: Add
 softdep to arc4"
To:     Baolin Wang <baolin.wang@linaro.org>,
        "# 3.4.x" <stable@vger.kernel.org>, paulus@samba.org,
        linux-ppp@vger.kernel.org, Networking <netdev@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Orson Zhai <orsonzhai@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Fri, 6 Sep 2019 at 00:16, Eric Biggers <ebiggers@google.com> wrote:
>
> On Thu, Sep 05, 2019 at 11:10:45AM +0800, Baolin Wang wrote:
> > From: Eric Biggers <ebiggers@google.com>
> >
> > [Upstream commit 25a09ce79639a8775244808c17282c491cff89cf]
> >
> > Commit 0e5a610b5ca5 ("ppp: mppe: switch to RC4 library interface"),
> > which was merged through the crypto tree for v5.3, changed ppp_mppe.c to
> > use the new arc4_crypt() library function rather than access RC4 through
> > the dynamic crypto_skcipher API.
> >
> > Meanwhile commit aad1dcc4f011 ("ppp: mppe: Add softdep to arc4") was
> > merged through the net tree and added a module soft-dependency on "arc4".
> >
> > The latter commit no longer makes sense because the code now uses the
> > "libarc4" module rather than "arc4", and also due to the direct use of
> > arc4_crypt(), no module soft-dependency is required.
> >
> > So revert the latter commit.
> >
> > Cc: Takashi Iwai <tiwai@suse.de>
> > Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > Signed-off-by: David S. Miller <davem@davemloft.net>
> > Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> > ---
> >  drivers/net/ppp/ppp_mppe.c |    1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/net/ppp/ppp_mppe.c b/drivers/net/ppp/ppp_mppe.c
> > index d9eda7c..6c7fd98 100644
> > --- a/drivers/net/ppp/ppp_mppe.c
> > +++ b/drivers/net/ppp/ppp_mppe.c
> > @@ -63,7 +63,6 @@
> >  MODULE_DESCRIPTION("Point-to-Point Protocol Microsoft Point-to-Point Encryption support");
> >  MODULE_LICENSE("Dual BSD/GPL");
> >  MODULE_ALIAS("ppp-compress-" __stringify(CI_MPPE));
> > -MODULE_SOFTDEP("pre: arc4");
>
> Why is this being backported?  This revert was only needed because of a
> different patch that was merged in v5.3, as I explained in the commit message.

Sorry I missed this. I should remove this patch from our product kernel too.

-- 
Baolin Wang
Best Regards
