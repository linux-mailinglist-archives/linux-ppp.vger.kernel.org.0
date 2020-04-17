Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF7231AE6FA
	for <lists+linux-ppp@lfdr.de>; Fri, 17 Apr 2020 22:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgDQUuw (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 17 Apr 2020 16:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgDQUuw (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 17 Apr 2020 16:50:52 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE16C061A0C
        for <linux-ppp@vger.kernel.org>; Fri, 17 Apr 2020 13:50:50 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id u203so655917vkb.11
        for <linux-ppp@vger.kernel.org>; Fri, 17 Apr 2020 13:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i3Lzwfx2CdwT8DVqQ7NzUto6i6X+uPy2O2SR+oERV9o=;
        b=sTzAKazjHxJX7LDljUBTUmpQytOLZDUni2LzkCXXRMfkYsTALpCK2tQn0m4XJSI6Ap
         td0oFY7UZFIv3RrRcQK9hwDj2cRDDDNW8axeg+4bs6+hiGaICNff3QvJNO9wqJCK/v8v
         qURgmgJKaAs41qyE323iGT4VrhXPjnWTo5beK4gkTwYtHc2TG6yrjYkAkDjUXSScmBht
         D3uywa2drDVf2rbC0ju7BgcsfBZ5msyMIQ+TPOdt64KGQao8ju0M2mf01witkEbRUEz9
         vG0jLmfGHdEfEr9wcfcq3YWvaXXBdtfWbRf0K48AJLXjqfr924kSvICMy+AyQkcf1L+Y
         UTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i3Lzwfx2CdwT8DVqQ7NzUto6i6X+uPy2O2SR+oERV9o=;
        b=W4vdeu1mNf2e6TIETycwvN+y9u46x6Kmr9rU+DmF5QMhlXGF+Ms32NCfUOpAOafI+r
         7f8AwFEZdkSji6zw6Dp7cB6OhQ2G31QOeSKoQy3Un7jzBYPQoDJD7GSaRc/RnEpx5EX7
         CVhj+WZRI8MKy2tOca22Z3tu145rvJu5zoNmGNFQf/3qgs7tW0To+rOxricTGcllbUU9
         RnSVMmybGRu+eoB4Tx0KP14IY8f+u3eiiKPxFR/0eVqS2+Fs/EoPnSQD+maD7y1tBmDk
         2BxP8d1MI7TVv4MtEKasOCBIJNWpB9CUedDrnDcn+VR9e16zvzJCKnltvvvV5Ak6U/1p
         hbDw==
X-Gm-Message-State: AGi0PuZBzIrtnSUjYbm593xbIaZv8gEEtgE8dkG2VH8wheDluKwnzZcQ
        9o7e8yqNTdDoV2xRU62yslDFBBUyrnAN0GEslykuew==
X-Google-Smtp-Source: APiQypKC4XyINXwYBDr3IVwvQxyIVXSuJnSMykgOl5p6NAC5Sp3gilcHh3tmbdOULdBE9Yx7HQIneOnjlX4VboPNm8A=
X-Received: by 2002:a1f:3190:: with SMTP id x138mr4395652vkx.41.1587156648370;
 Fri, 17 Apr 2020 13:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAKuzOkiM0Z9DV9LofTtgAi3bEfxzqk0BLm-QpQq0CLHVdT5aAw@mail.gmail.com>
 <f8639224-8bc6-dc08-f6f9-fff5caa3e148@workingcode.com>
In-Reply-To: <f8639224-8bc6-dc08-f6f9-fff5caa3e148@workingcode.com>
From:   Eivind Naess <enaess@gmail.com>
Date:   Fri, 17 Apr 2020 13:50:36 -0700
Message-ID: <CAKuzOkgM7Zrx35bOrKzDCefxXY3M4EdOuCYhx1Ot-wciJAjYWA@mail.gmail.com>
Subject: Re: [PATCH] Adding EAP-MSCHAPv2 support
To:     James Carlson <carlsonj@workingcode.com>
Cc:     linux-ppp@vger.kernel.org, thomas@omerzu.de
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

The RFC draft maybe long expired, but Microsoft still has EAP-MSCHAPv2
enabled by default settings. The problem is that if EAP gets
negotiated (because the client supports it), EAP-MSCHAPv2 will
typically be selected. A workaround would be to disable EAP
negotiation on the client side to allow MSCHAPv2 to be selected and
that be only if the Microsoft server is configured to allow that. It's
mostly a compatibility problem for end-users, especially when using
SSTP.

Regards,
- Eivind


On Fri, Apr 3, 2020 at 8:27 AM James Carlson <carlsonj@workingcode.com> wrote:
>
> On 2020-04-03 11:09, Eivind Naess wrote:
> > Implementation based on the RFC: draft-kamath-pppext-eap-mschapv2-02.
> > Adding support for MSCHAPv2 inside the extensible authentication protocol (EAP).
> >
> > Author: Thomas Omerzu <thomas@omerzu.de>
> > Origin: https://w3logistics.com/blog/archives/438-EAP-MSCHAPv2-for-pppd-2-4-7.html
> > Bug: https://github.com/paulusmack/ppp/issues/138
> > Bug-Ubuntu: https://bugs.launchpad.net/ubuntu/+source/ppp/+bug/1858349
> > Pull Request: https://github.com/paulusmack/ppp/pull/139
> > Last-Update: 2020-02-24
> > Signed-off-by: Thomas Omerzu <thomas@omerzu.de>.
>
> This all seems ok to me, but I do have one nit: that document referenced
> is a long-expired Internet Draft, not an RFC.  As far as I know, there
> are no RFCs that cover Microsoft's foray into this area.
>
> --
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>



-- 
Cheers,
- Eivind
