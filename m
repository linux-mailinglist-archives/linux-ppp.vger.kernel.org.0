Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3750B1BBB0D
	for <lists+linux-ppp@lfdr.de>; Tue, 28 Apr 2020 12:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgD1KTJ (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 28 Apr 2020 06:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727772AbgD1KSy (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Tue, 28 Apr 2020 06:18:54 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B2F6C03C1A9
        for <linux-ppp@vger.kernel.org>; Tue, 28 Apr 2020 03:18:50 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id a10so20760615uad.7
        for <linux-ppp@vger.kernel.org>; Tue, 28 Apr 2020 03:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5NiRfemeg/+MfhbyOTDp5ibIdttkZ3QtmWXRVPyNyh0=;
        b=jxSRxMal0+SqgrmO9x21EYU+zf07zfwp5zJdtW1UAPaMRKmdDd9JsqLQH2QdsYJCzF
         0zDHX7cwYVSBjdxx35PyRCTJUiOs72T+ULMJ0W45cs8DPLMb+DUNj5Z1FJHhiOPmSLnb
         qTc/rC0u4BfpG+MW3PNqRZXMNbMpwvUP5PkjPLEdN/qWHrZEhXaD+OMi9XO9kqst5lcq
         9/7lspQ1zW32BidjxMt2w9qN9AspKWSiOsk1tYCAqPes+ICsVJirxQF4Dxn4jEGK311A
         7Q7SoIcaAGQwykjU2ThdfoaVBaY1z3le7YZK9P3suxdgoD2tmROmv1lSYmq2wDJMahn0
         QHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5NiRfemeg/+MfhbyOTDp5ibIdttkZ3QtmWXRVPyNyh0=;
        b=kV6SAZlu5OAOGJRAAzmdZX9aoyGM2U5+VD/XpfX1yQKREXaPd0Q+FXwlVPqJdeM3H5
         rQZ2LQCX9UjtcajxIT6G9/X6T9KhPebL5EOOokXU5/mZ1nFz4ybyTTpTPRnyNmYB9Zhh
         oruPJSnoOI+B8HjFX2Fv7WUhSpVWXXOAHoaYetA/FsREcCsi/MGNE+eXBfzJanKYuKxE
         WrZCiCHKuZaaoyv+sKs2m/TDnAaYdS/Rk68bWgsFAUkNO8+7cEtTy8C7NNUE4txBbw9u
         /HuesoiL4Dy7oRPiLhEX0MPGrdq52cT9WPLF7/pxvgZN2tQFgT8qL5V4ohfnmpKj1HEr
         liPQ==
X-Gm-Message-State: AGi0PuayNgw3j3eGoERcqbJE1PcnUzZ3EJpf58oe+ef4dX50XvnhXYI1
        qdkKE5mn88joaDz6AZfS5sS2NJd+Rhhv+qdlqQ/HkzACQtk=
X-Google-Smtp-Source: APiQypLz/d5XbnPKDhz6XalHVODNyIVQtlogrLmeMw/8/0skkYjECz4fQuaQtadR9WybYXoMlU61+z/mYQjVjBqxdI0=
X-Received: by 2002:ab0:710c:: with SMTP id x12mr20521747uan.45.1588069129681;
 Tue, 28 Apr 2020 03:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com> <21061.1587602497@localhost>
 <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com> <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
 <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
 <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
 <20200424155459.GB21114@pc-3.home> <CAPJ9Yc_kHZKCSG7o7YtU7YCvAF4+OPm9MJzYK12mmQOg5FQD2w@mail.gmail.com>
In-Reply-To: <CAPJ9Yc_kHZKCSG7o7YtU7YCvAF4+OPm9MJzYK12mmQOg5FQD2w@mail.gmail.com>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Tue, 28 Apr 2020 12:18:38 +0200
Message-ID: <CAPJ9Yc82m71opZ5nkxqtGuJ8rsuY83opnZPOiS7_DWjiC4JFrg@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     Guillaume Nault <gnault@redhat.com>
Cc:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Tue, 28 Apr 2020 at 01:34, David Bala=C5=BEic <xerces9@gmail.com> wrote:
>
> On Fri, 24 Apr 2020 at 17:55, Guillaume Nault <gnault@redhat.com> wrote:
> > You can monitor the evolution of you network devices with rtmon:
> > $ rtmon file ./some/file.log link
> >
> > Then read it with ip monitor:
> > $ ip monitor file ./some/file.log
> >
> > That should tell if eth1.3902 is ever passed down or even deleted.
>
> rtmon does not seem to be available on openwrt. It is part of iproute2, r=
ight?
>
> Are there any alternatives?
> (until I find or compile it myself...)

OK, I found 'ip', but not 'rtmon'.

Is running 'ip monitor link' equivalent?
I'll start that...

Regards,
David
