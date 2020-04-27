Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6F31BB20D
	for <lists+linux-ppp@lfdr.de>; Tue, 28 Apr 2020 01:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbgD0XeO (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 27 Apr 2020 19:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726204AbgD0XeN (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 27 Apr 2020 19:34:13 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E70C0610D5
        for <linux-ppp@vger.kernel.org>; Mon, 27 Apr 2020 16:34:13 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id t8so19449810uap.3
        for <linux-ppp@vger.kernel.org>; Mon, 27 Apr 2020 16:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=27fRRbXKK4/0Q0W9ovE5rX0BIctBNUQzHT/z8RI23vQ=;
        b=UsLDcKwRmTLEewFb8rJFGqXxqL2KsKi4trOOS0Tm2horLDF8Ojd4zEe8x8grzVPxmk
         eDBhBvHQ5JDSITzwlhsomcXTplpaDKu7baM9qQAawO9IWLJwCHBBo9KgfCh/5G7kbsYS
         ZAFI/KRvcVXiANuVggULs4fzuAlf/OWkzbusAXTEc34hYOtf4XuhCuKo9xR+AvBcVznW
         phiTbm2vbshER+GARY6RqhLu+znVfayqlI0kq7Th0POnW+uvjKEMFlszNPMrt6nfoBnK
         LwfH1/DmN1icJMkPW2SRaCl5DhZcjgPc0XDhpb7G5srkQMWUtltljSggYZUjDBQiQvpA
         7BPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=27fRRbXKK4/0Q0W9ovE5rX0BIctBNUQzHT/z8RI23vQ=;
        b=MK7ublAael9fDHdMkKxsTcZJIiBp+o76FlShuImLPmikXEDAbA7UXSRqvAD0M8mXkC
         CsOF7sxJ0eltWMrpJ1pcyQxKw+F3WbVDTWJjHUcwnpgooDt1/Rrm8exrrkhBaW50ShGp
         HHf8KVwuuFeF30m9DeAZpCUZWxIXS6gaQ5uJQgvDMLPa85GpwrEMtz5Ojqktpe3Xkb3j
         vOQIN4QHxvlz/tqXgWZHXN0472k2Behuws/ibmeCsFUIgiZOResQADoq8EZOlCohyt5n
         WnokKMRLnYdHKiC30BdFx+u6hNFOCI17WrQUTXBDc1f81Knh4UXe33E+/3SF0ByG5lL/
         T8dg==
X-Gm-Message-State: AGi0PuYgS/l5LKHot7Ax3kVyivS7EZ9veHrNw9EjzWxhUmVl6cU2ftd4
        pt9YjmXMPnnmxc+zPsEnPg43DgomxFFqmbz6tOZmL1eJ
X-Google-Smtp-Source: APiQypLZ5leDvcFOAXcBM+XXy+qLWg+ULCdJQ2fRwgF+TW/PkrhAiabX91nSh7K6EFX0iKKQAffD/UHcT+BeIC36StA=
X-Received: by 2002:ab0:61cf:: with SMTP id m15mr18192302uan.99.1588030452866;
 Mon, 27 Apr 2020 16:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com> <21061.1587602497@localhost>
 <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com> <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
 <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
 <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com> <20200424155459.GB21114@pc-3.home>
In-Reply-To: <20200424155459.GB21114@pc-3.home>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Tue, 28 Apr 2020 01:34:01 +0200
Message-ID: <CAPJ9Yc_kHZKCSG7o7YtU7YCvAF4+OPm9MJzYK12mmQOg5FQD2w@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     Guillaume Nault <gnault@redhat.com>
Cc:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Fri, 24 Apr 2020 at 17:55, Guillaume Nault <gnault@redhat.com> wrote:
> You can monitor the evolution of you network devices with rtmon:
> $ rtmon file ./some/file.log link
>
> Then read it with ip monitor:
> $ ip monitor file ./some/file.log
>
> That should tell if eth1.3902 is ever passed down or even deleted.

rtmon does not seem to be available on openwrt. It is part of iproute2, right?

Are there any alternatives?
(until I find or compile it myself...)

Regards,
David
