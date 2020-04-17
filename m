Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F37061AE75E
	for <lists+linux-ppp@lfdr.de>; Fri, 17 Apr 2020 23:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgDQVNU (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 17 Apr 2020 17:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgDQVNT (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 17 Apr 2020 17:13:19 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630C8C061A0C
        for <linux-ppp@vger.kernel.org>; Fri, 17 Apr 2020 14:13:18 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id g184so2101598vsc.0
        for <linux-ppp@vger.kernel.org>; Fri, 17 Apr 2020 14:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nJEzfCqbT2cfPppuj9vIrTXhqmLY5j1m6ZY+XIfXTg8=;
        b=oQ+cXt24S/6H+QKFzoYW3PDtN/KvVCZYqEGDPXg09srZN2Y/J9lLBu6r2PwsAV1Tck
         D38uEj55YceI7OFzcv6VzKkXPsyvpdOdCKpWiki8Dn8uNvioF9QznJQmD/tvsjWlYRt4
         Zhparzehcgy5/no3gLMn2C+0cs10bq3j3gBpx21LU0pavpg9K/KnOt09z8pTpgcaUg2U
         Eq06YsxiaqUmuInVFqOoZvCuKvshTbz8UK5jfSP9ZAL+L66y22vbU8IC9YUEHiuTqJaH
         WidjxO701++EYbSkbrVXmwAJwxPGqWLoX4QUtghPQW4YBXmCgHOGcFLI1fWLRPHw/772
         4U3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nJEzfCqbT2cfPppuj9vIrTXhqmLY5j1m6ZY+XIfXTg8=;
        b=l3yE0JztXjmOybWYRxilk7kYfkIMBni9tHNhYaeOqqWHxb2lenkbizU1KT/EDNiAtX
         xEsP5IJF61UC9RUlLAtcxbiyyRilAuBoh+JTwA8p8O1hYp984FbP1ZsBliz90CMzRBda
         TQm/9Z5cU6IbnggTrUoY+iVuJvNhI4AZX7g1PEjAi0B6AFz1JJkE5672gizJN3zmSYQJ
         lv5NLXkdGfNYm693IloGt0z5oKrXsMz1sfhgyBzBekSELc19Ns5giw+ZzUg3EtUMid/7
         sdZHBIhX37ls4irf9krGZPA77Yi/9KIn46LGFg6I9KehI04iQJkdcXq18EBezC9QZhsq
         Pd0w==
X-Gm-Message-State: AGi0PuYBovNA14i9jOxaht9zODQdis6FGwH7kBta8tqBUboFB0Oa8MEE
        dX6HSoQLtvqF392L4jzhivjxkn49o36smf9ufgLchJpA
X-Google-Smtp-Source: APiQypIsrwIUqUUEOriH8EMHA/rlDiagbojGUuAIhjttxjJhbANVcW1XzE9G5SiMmVers5XvQsCL93NId3QJJuR/poI=
X-Received: by 2002:a67:2904:: with SMTP id p4mr4508252vsp.101.1587157997485;
 Fri, 17 Apr 2020 14:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAKuzOkiM0Z9DV9LofTtgAi3bEfxzqk0BLm-QpQq0CLHVdT5aAw@mail.gmail.com>
 <f8639224-8bc6-dc08-f6f9-fff5caa3e148@workingcode.com> <CAKuzOkgM7Zrx35bOrKzDCefxXY3M4EdOuCYhx1Ot-wciJAjYWA@mail.gmail.com>
 <19d4db3e-d996-280d-96cf-851615ac8398@workingcode.com>
In-Reply-To: <19d4db3e-d996-280d-96cf-851615ac8398@workingcode.com>
From:   Eivind Naess <enaess@gmail.com>
Date:   Fri, 17 Apr 2020 14:13:05 -0700
Message-ID: <CAKuzOki9kgpmdohOhDSUSV+R_Hr96ETSo1AE5DY-dugsviT9MQ@mail.gmail.com>
Subject: Re: [PATCH] Adding EAP-MSCHAPv2 support
To:     James Carlson <carlsonj@workingcode.com>
Cc:     linux-ppp@vger.kernel.org, thomas@omerzu.de
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Ok, thanks for the clarification. Is there anything that needs to be
done then? Can this be applied?

On Fri, Apr 17, 2020 at 2:03 PM James Carlson <carlsonj@workingcode.com> wrote:
>
> On 2020-04-17 16:50, Eivind Naess wrote:
> > The RFC draft maybe long expired, but Microsoft still has EAP-MSCHAPv2
> > enabled by default settings. The problem is that if EAP gets
> > negotiated (because the client supports it), EAP-MSCHAPv2 will
> > typically be selected. A workaround would be to disable EAP
> > negotiation on the client side to allow MSCHAPv2 to be selected and
> > that be only if the Microsoft server is configured to allow that. It's
> > mostly a compatibility problem for end-users, especially when using
> > SSTP.
>
> Oh, I have no doubt that they're using it, and that users will want a
> feature like this.  I was only pointing out that the submission comment
> was slightly inaccurate.  There is, as far as I know, no published RFC
> describing this protocol.
>
> The document you're citing is an Internet-Draft, not an RFC.  There's no
> such thing as an "RFC draft."
>
> The difference is important to folks in the IETF (at least).  An RFC
> goes through a documented review and acceptance process and never
> expires.  An I-D is a temporary document that has no necessary review
> whatsoever and expires after a few months.  It's not correct to refer to
> an I-D as any sort of RFC.
>
> --
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>



-- 
Cheers,
- Eivind
