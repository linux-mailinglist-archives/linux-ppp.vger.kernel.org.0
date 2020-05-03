Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD011C2B5D
	for <lists+linux-ppp@lfdr.de>; Sun,  3 May 2020 12:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgECKcE (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 3 May 2020 06:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbgECKcD (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 3 May 2020 06:32:03 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78158C061A0C
        for <linux-ppp@vger.kernel.org>; Sun,  3 May 2020 03:32:03 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id z16so5435085uae.11
        for <linux-ppp@vger.kernel.org>; Sun, 03 May 2020 03:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=jteGRs3xIeVT2gszfDYNoHEqg061MOUXQTzzLCc/fb4=;
        b=aj7ajyqS+fWhC+ggeBXAyCs2cnrrAgxzzm0EjIes6R9UeqI+qrXpjkPc88c66tRxc7
         yYSGcKeF15jbxT63StxB+kLtWDniXhRS/bbG6pf0ZtHNUjhJ2se1PkUs7VGGuXPJsFiZ
         3xFQzl2Dm8Gnp6SSOlzTJuyZHDG/MZ62r/by+YcYwAGBQ2BQ3dwivSx7tbjQKPpEZidl
         xIaBF5MMaC0iCPXZZctmaV0+88VxGnUQ0K5jEnCLP+qQck9ZA1nkN84/7wBKOCLk/IYG
         PxNOlxCglkOl1WGQEgSKN8aGEl7wjpP6pfQUOUQBdkup7AA6WVjlhQqhuHpLnlHiWcP1
         LP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=jteGRs3xIeVT2gszfDYNoHEqg061MOUXQTzzLCc/fb4=;
        b=BHVBF5dn1FkHkj5nVRrdm6aN2t25Jx6uEOAjw+AqxBbYH/JLpn/Yw8wh85QS6AW2w+
         An3rtJvJyHpzF1dLgl0yyiYD/zkPm2jy0NUxU8g5n4aoxZlqY468Eu6AV1W2ovetvumN
         C7CpRT5g76auk26FrpwBRVYuK/otD4J9ZR6chuRIsFe3dz2B1DJUPoeaFoiOBVEH3wlW
         5trM6TI+avVyWtLWYuQNCwjH1Um/LM5EVSZ4cfggGlmOyhL18igKc0e1QEXtOn3lrEOF
         Bx+jmL6lX47tmH20gQUeXLUz7Zqy11uefPZPofq7/DjM0GviBsosyevyicnnW2y0GQsM
         lFzQ==
X-Gm-Message-State: AGi0PuZznFQm6Z3RNg9yb0r8osmFscpHhqnAnflzZu9zjjWEQC6Aina+
        mFxBq8Mu/FxVVOeuIwNKbXc4/mhqNLRMPj20qiOD48lx
X-Google-Smtp-Source: APiQypJKXKFlQ5/XT5aLgEt6zj1e5nh+Q65hGZMEf3g8m5uFLykiPQGvckODA7fTGT0EF36Rf5uZslrmKhZ4bufhEPc=
X-Received: by 2002:ab0:710c:: with SMTP id x12mr8377445uan.45.1588501922391;
 Sun, 03 May 2020 03:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Sun, 3 May 2020 12:31:51 +0200
Message-ID: <CAPJ9Yc8eDBsGtFy_juZ3Z6biKKD4-JoNg0icv4otHK=o66aBZw@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Wed, 22 Apr 2020 at 19:45, David Bala=C5=BEic <xerces9@gmail.com> wrote:
>
> Hi!
>
> I have a router running openwrt connected to a GPON ONT, running a
> PPPoE connection (hw details below).
>
> The problem is, that after some random time one to 20 hours, the
> connection breaks. Then in about a minute it reconnects (successfully,
> each time).

Mystery solved.

I added a debug output to kernel pppoe.c:

pr_info("pppoe: pppoe_disc_rcv /my patch/  PADT received, sid=3D%d, SRC:
%02x:%02x:%02x:%02x:%02x:%02x, DST: %02x:%02x:%02x:%02x:%02x:%02x\n",
ph->sid,
eth_hdr(skb)->h_source[0],
eth_hdr(skb)->h_source[1],
eth_hdr(skb)->h_source[2],
eth_hdr(skb)->h_source[3],
eth_hdr(skb)->h_source[4],
eth_hdr(skb)->h_source[5],
eth_hdr(skb)->h_dest[0],
eth_hdr(skb)->h_dest[1],
eth_hdr(skb)->h_dest[2],
eth_hdr(skb)->h_dest[3],
eth_hdr(skb)->h_dest[4],
eth_hdr(skb)->h_dest[5]
);

When the problem happens, it prints:

pppoe: pppoe_disc_rcv /my patch/  PADT received, sid=3D1, SRC:
a4:7b:2c:9e:c7:44, DST: 44:4e:6d:fd:c7:39

My HWaddr is c4:xxxxxx:ed

After that, the pppoe module closes the connection.

So the problem was as already suspected, that pppoe does not properly
check if the received PADT packet belongs to its ppp session.

I'll patch it up soon (if someone does not beat me to it).

Regards,
David
