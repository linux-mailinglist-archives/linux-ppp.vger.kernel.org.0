Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B9D1F2183
	for <lists+linux-ppp@lfdr.de>; Mon,  8 Jun 2020 23:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgFHVc3 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 8 Jun 2020 17:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbgFHVc3 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 8 Jun 2020 17:32:29 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00D1BC08C5C2
        for <linux-ppp@vger.kernel.org>; Mon,  8 Jun 2020 14:32:28 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id y123so10735926vsb.6
        for <linux-ppp@vger.kernel.org>; Mon, 08 Jun 2020 14:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dkA4JgqM4CzWikNj5GXPOki8KLmkRCmWk1Zyisdt8hs=;
        b=rV4kCahaGJ2rTQCvonlawARXp6GuwsX81/IoaekvK6GQ/9jWzn41HTe/rPdNdGqS80
         vWvl8CAgir62uzzmHAbHzVRAMVUcJxBR07tR2clVLTmtBzZjhnuJKLjiX4ImNDbhtxIO
         yVKTjRFl7NSoilkn4u5TH0kMp7wvL9fsMKTAurMmnVZHINJso2SsWHH5a+LGgqyPA9K+
         byvmWk6m/rbgQXTtvEZIiHUk1uJAhJ5nZT7V1INmE/NkXdwQRHD9ApBmlYtA0jZ4vLY+
         iakJzyGeSV4m9zRCFKIU/GH/hNnlSlMKu0flMW5E+JrpbaU5BHa5q6hRnkgqIbI8I4wN
         ha3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dkA4JgqM4CzWikNj5GXPOki8KLmkRCmWk1Zyisdt8hs=;
        b=dUcLcOhRgOpnQU9ARj+w1TP+7iQjeNw8/TNYOhxtOZX0ZVOxtIQfOeciaM/VulCjZA
         6unQgi7nLLbvWLf8DBLfL5PhaSoctYIDnSGxi4Iatxa2U2+EJ4Xk7H7uuVU0rPG5PQVJ
         8JkcEEIL4HR4uzeLIG7x50mRIGYh7AONLlKbgfLZaCu9iTjtWvb8WYTU5rAdCp7ZtyoZ
         girfCa/tz9wPx3rxkP4hpJsSriMmYi3PoNQF/82UEYtKEsY7B7BY71md3tO3hy0kAj44
         FbdAVgTQaMMcs+K4xD/Ly5mAQ3hqDLM62dPHIzWaSABe6vnOUg2p7RisL2ILWWSqovGy
         Dk7Q==
X-Gm-Message-State: AOAM531QFkp+mYIbZsMuAyByOOztin1F/Q8KE8AD7cSlU7wbRoX7yKTL
        A9uZLShLFhdi70o0+LVIeUoe7YCUMTN+nwmr/K7SwlXy
X-Google-Smtp-Source: ABdhPJxZig6HKs8a160wxWnk2H97OGKb+3TyB+e0iJ4x0zJb+qCKrfyd2GheLq4Z0ZO6RsraGi9V3CMqhcCg5uFAyKc=
X-Received: by 2002:a67:f60c:: with SMTP id k12mr608743vso.139.1591651947969;
 Mon, 08 Jun 2020 14:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <f44e7e14-1621-7141-66a3-3a2218e8db86@mahan.org>
 <84d4375a-a446-6a15-9388-db312b77e50a@workingcode.com> <8d6fcc7e-c727-7979-13ca-a3e80d9eb514@mahan.org>
 <c3e9fab3-116c-ee26-cfa7-7fb7c76c7c4c@workingcode.com>
In-Reply-To: <c3e9fab3-116c-ee26-cfa7-7fb7c76c7c4c@workingcode.com>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Mon, 8 Jun 2020 23:32:16 +0200
Message-ID: <CAPJ9Yc8JBJ+x4L2B=Mo6HFSm3q5YHBrG256Czpqx0WAKB0hQbw@mail.gmail.com>
Subject: Re: PPP cycling between UP and DOWN
To:     James Carlson <carlsonj@workingcode.com>
Cc:     Patrick Mahan <mahan@mahan.org>, linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Mon, 8 Jun 2020 at 19:16, James Carlson <carlsonj@workingcode.com> wrote:
> "Modem hangup" means that PPPoE, not PPP, shut down this link.  It would
> be a completely wild guess -- I know the pppd code fairly well, but I
> don't know the separate rp-pppoe code too well at all -- but it's
> possible that this user was bit by the same stray PADT problem that
> someone reported earlier on this list.  Or maybe not.

RP-PPPOE has that bug fixed for quite a while.

(I reported that PADT problem)

Regards,
David
