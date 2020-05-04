Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C351C400B
	for <lists+linux-ppp@lfdr.de>; Mon,  4 May 2020 18:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729586AbgEDQhD (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 4 May 2020 12:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729551AbgEDQhC (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 4 May 2020 12:37:02 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA7DC061A0E
        for <linux-ppp@vger.kernel.org>; Mon,  4 May 2020 09:37:01 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id i5so59898uaq.1
        for <linux-ppp@vger.kernel.org>; Mon, 04 May 2020 09:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OKE5LJxEZbKsp8WQcPvszCDSQpCo9MUZnbbvPkebtO8=;
        b=jH+xC04Q+jR6J8OULNsw9HlCG+46ycjAp8rRtN2QSgVbJ+as7QKPxNZv/PyMSOwTD+
         Yh499XkKL46qslPqLUHceoFJeY+PU5/wtnCXgrgUGHUzf47fH7X4dvJ4lsu/8zFk5zle
         U6a2r5FEw9ceM4ZMdnHHcrxh5KFc1la1yVTRAUpT3ugRf/dlApQWazn1OZsSXK6JHs6S
         IZclyonMDhd3QxXYerWA85a/7oIMbOe1BQXbYgKrQvIaz7YtXJ+PmUazT4WbLVKlsvAb
         xtWixLebdWotdA3ZC4HmEuXPL/XdbxIN24nUyI9nUw+fUpkfJuQzQb9DFhZmc4rqiFKN
         Sq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OKE5LJxEZbKsp8WQcPvszCDSQpCo9MUZnbbvPkebtO8=;
        b=MuQq3IkjApUH0qcn6MMGYA4Q54JLsC76y7IhdpyrzaVhxiKJMf4bjSSJkAVY6w2XN7
         KVP56K6NiYDgWg3FCozdzLzjHkwUJHeOF0oyWicbTqExgUm4UmtbzU2xZ7UhkEuHlLZg
         wf7lP0XcyW3SL8Gg56fUn8KJuLjs0ygEhfztJMsBzF1q44ObjztmEtPhHpOR8kHXQsdB
         FJyCsuiy3BPfT8E8SP2X7JoIMn4EFl2Rv7P5Jt93vHKQF2Gy+w2LsqqB+wnonbj9dC1x
         z1PYX2rjATYsx0ioZZv0hObyGVkOal+/6pPwo8MGnyrUPqbzM62WVtyUgToTVYM21LJf
         PPkg==
X-Gm-Message-State: AGi0PubYui99mJOEe8BEJS2blA0e90qG0yrLy0wB70ICYNeORpDK4QqS
        mnswuYocivRZt8wJRowJWpswdeCE1Lp7Yv86FYE=
X-Google-Smtp-Source: APiQypIGde1pP6Js5WXlMjLDEudYBdt8uglX4OMBzisx8mBHLVR60/K+N0VEFxs25yZxKgt1aVWFnWGX4LxIVQ66B7c=
X-Received: by 2002:ab0:710c:: with SMTP id x12mr12816980uan.45.1588610220514;
 Mon, 04 May 2020 09:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <CAPJ9Yc8eDBsGtFy_juZ3Z6biKKD4-JoNg0icv4otHK=o66aBZw@mail.gmail.com> <20200504130149.GB27585@pc-3.home>
In-Reply-To: <20200504130149.GB27585@pc-3.home>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Mon, 4 May 2020 18:36:48 +0200
Message-ID: <CAPJ9Yc_kvqAD5d1XJGQmzVC5d8_HXtp5aH-4OSyqBXDLu1Na8g@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     Guillaume Nault <gnault@redhat.com>
Cc:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Mon, 4 May 2020 at 15:01, Guillaume Nault <gnault@redhat.com> wrote:
> You can use "%pM" for printing MAC addresses. Also, it'd be interesting
> to have information about promisc mode:
>   "dev %s, flags: %#x, promiscuity %u",
>   dev->name, dev->flags, dev->promiscuity,

"ifdown wan" triggers a PADT response from the server, and then this
code prints:

 dev eth1.3902, flags: 0x1003, promiscuity 0

I'll report later values printed when a stray PADT appears.

Regards,
David
