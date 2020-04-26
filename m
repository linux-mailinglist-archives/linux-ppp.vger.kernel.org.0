Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3AC1B9025
	for <lists+linux-ppp@lfdr.de>; Sun, 26 Apr 2020 14:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgDZMtF (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 26 Apr 2020 08:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725972AbgDZMtE (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 26 Apr 2020 08:49:04 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0274C061A0F
        for <linux-ppp@vger.kernel.org>; Sun, 26 Apr 2020 05:49:03 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id z16so14398293uae.11
        for <linux-ppp@vger.kernel.org>; Sun, 26 Apr 2020 05:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kQXx2DPvMJshs6vXy0mAzeGn22jF6m0kuhRsC/8Knf4=;
        b=FQG0ykyB1QDbe51iux1mUVkbLZmZRvh1jsSrLoyq5J47p//8SUje5OFA7zQ3XYe3bL
         6Gri+jOw+bM9AArZo2VyqtOn2SzZgLelgmDAIBBc4Wtqxg8QU8sIfVbmvMaBhYX4XSFr
         sq84my2y7+OqajFHMZwxiwK7VgL7AHOINDENLlZ24BrBgqt3MXDlCDqWm86ZL1JKT9pM
         9zsu0IbYUOk016cVTw961gSPrMdziykFDwh23coXclhdxKAKUyymj87zNp/oTMZOazvY
         1kU/cVHT7DckG3PeDkY0/MDREJX3iBSJ1hlEiSj5jAhpMONKFfx+TpxW81eAS49cP/bK
         QJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kQXx2DPvMJshs6vXy0mAzeGn22jF6m0kuhRsC/8Knf4=;
        b=q5lpJ50JIvSYrHtmTgmuKL9DOOCLVHvIHusMLBVSiKPwH1M16jccq2h+6DYlbzE8aS
         0bVhc+AdXvgitQzMsWqG6YFwb9Mvzt24UP9+4AH4BqrF6jzFRCdsjK5dY/g6DXG1legf
         V9dDodwGNlkmJFi9v9L1+RZJHEm3LZGnl7+9U8Pg/IjFC/f3WD/AP1vDYt4ZnPlpoeYS
         8WrL9+Qgvzp8Pdj0Vp4aI82PmuIlSeNt6Ae0KVJK7DR+M9eTmg0I9aTQRFOkjVURSiNp
         KZJhJ3xrs6e5tqQfJbzU3CQpSG6wuLuwTIO5/ctHlA9gzhxjtvmIDKttkyPDp7OLRvSj
         28LA==
X-Gm-Message-State: AGi0PuaLpsrXSRYgPsgGPhksi065QLBa13V+35ZWnmFa6nYVVNAo/8GQ
        E8ZkE1sc/1C8r74/SOou82fDLzaYe9czgnrtT5cfAxxYnQs=
X-Google-Smtp-Source: APiQypIrBoMFBOrsLrVY00pX0goAVrdUiTWQADJs+lTLc1cNBGrZ9/LLiZBP0/1JNuVaGGV+jucHdxPvbUbBbUP/s/I=
X-Received: by 2002:a67:6285:: with SMTP id w127mr13755340vsb.139.1587905342413;
 Sun, 26 Apr 2020 05:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com> <21061.1587602497@localhost>
 <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com> <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
 <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
 <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
 <7689.1587657698@localhost> <CAPJ9Yc9rdbwd0OTcJhmuqG_r6qPfYKwiScLOxiwe41_ye_PNGw@mail.gmail.com>
 <CAPJ9Yc9uuOKk=fh3Ke7riuZN2JgB2Ma3F2Njy69_6nms1kC=bQ@mail.gmail.com>
 <CAPJ9Yc_iOxyDzrL9cs_ERSEjnVttYgk4JFqhO7T=yg03420LMA@mail.gmail.com> <29906.1587865115@localhost>
In-Reply-To: <29906.1587865115@localhost>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Sun, 26 Apr 2020 14:48:51 +0200
Message-ID: <CAPJ9Yc-Tj+pLJ_vfLuERUi-2oGadeaWTJSkDFNw0rLoqMCmL3Q@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     Michael Richardson <mcr@sandelman.ca>
Cc:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Sun, 26 Apr 2020 at 03:38, Michael Richardson <mcr@sandelman.ca> wrote:
>
>
> David Bala=C5=BEic <xerces9@gmail.com> wrote:
>     >> OK, more data:
>     >> I started tcpdump with the -e option as suggested on openwrt forum=
:
>     >> tcpdump -e -v -i eth1.3902 pppoed
>     >>
>     >> on disconnect, this was logged (times are UTC):
>     >>
>     >>
>     >> tcpdump: listening on eth1.3902, link-type EN10MB (Ethernet), capt=
ure
>     >> size 262144 bytes
>     >> 18:23:09.204991 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:3=
9
>     >> (oui Unknown), ethertype PPPoE D (0x8863), length 97: PPPoE PADO
>     >> [Service-Name] [AC-Name "SIMB_TABOR_BNG1"] [Host-Uniq
>     >> 0x44************long_number******************************AA]
>     >> [AC-Cookie ".5b************v"]
>
>     > Isnt this strange? The dst addr is not my router or any other known=
.
>     > Also the Host-Uniq value is different.
>     > As if is traffic meant for someone else.
>
> oh, I understand.
> thank you for noting this.
> So, it's as if you are getting a PPPoE message for someone else, and when
> that happens, the interface is dying.
> Is it always the same ethernet address?

Yes,the same.

> Do you have ebtables?  Could you arrange to filter out packets like that?
> That would point to there being some kernel bug.
>
> Clearly, your ISP has some other bug that they are sending stuff down the
> wrong pipe, but that could just be hash collisions that they assume are
> "harmless".

Those packets don't seem to be a problem. In the last connection, I
received 15 of them and no reconnect.

As suggested on OpenWRT, I removed a IPv6 wan device config that was
running DHCPv6 on eth1.

Then he connection was up for 45 hours before dropping. Could be a
coincidence...

I posted the logs at
https://forum.openwrt.org/t/pppoe-disconnects-every-few-hours/61239/22
(gmail wraps lines...)

Regards,
David
