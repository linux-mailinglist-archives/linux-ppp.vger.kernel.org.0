Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1F01B7765
	for <lists+linux-ppp@lfdr.de>; Fri, 24 Apr 2020 15:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgDXNrs (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 24 Apr 2020 09:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726717AbgDXNrs (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 24 Apr 2020 09:47:48 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB54CC09B045
        for <linux-ppp@vger.kernel.org>; Fri, 24 Apr 2020 06:47:47 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id s5so9470243uad.4
        for <linux-ppp@vger.kernel.org>; Fri, 24 Apr 2020 06:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=YAnTf0sdHNhzAKYyUpQj7BqzqJQLPYsPDClle0haGas=;
        b=TG6qBqiL8/ozSlWTGkWC9uA94HJBgRm3bcVy5EDu1wUQ1dEjc2/zSndAOk9A01qewX
         YBwkUhIurRW4PNduzQAFUbDFpu4dhv/6OC0SoronbTX+J9yGwUIkas/Mm/1leu36lG+o
         J+MYV8K3FNRoT8hnzYyiH/+VWsQ0NtvFsPJpYGo+b6yXOsAoUBVQeG1pJb8PrMXvoKwC
         AHZWhBv6fBeH8iDHPdyxIYov/Wo3P7KmKXloq8UIXS/+GVgZrHmY/JyByJkjCHMqJeP7
         IHbtIZXtvp6iDndG+rVMlFMH1EYB9QeU8MK0ccZv/uDGqWELux0Tq5qkMUSG5brMI2q/
         ptRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=YAnTf0sdHNhzAKYyUpQj7BqzqJQLPYsPDClle0haGas=;
        b=j0SVCmsgdH52YNAOmj8YwlM/BIMSAX2ygSjne4sAWMlTI38mSBXwBK1Z4KdxFaXuo2
         +w6t7BIuItDpaY7Ji9Tdwe4OhBMt9CPxpHn9o+zcr9T1lEOuq+oKg+YepjZLERIT/wg3
         FaWfudOmwO7qUGwhcQbwkOK4r2QJ302jH6qFDOo38PZS4+xzERklHbnddBE0ZsUQ/fWS
         fX5Q+UiWC6GiCab49vsvxfqHTnl4cnZ3PXFeSzFjMuP3VBl3ppY1fkJvXzkQjm8Hpo5m
         T4bVQND6A7z2ToUnXcI07/eaY7VNhz/sNr8brwBIxlJ/zkK3yyi0Vh3cmGu4cQDLZZFI
         2whQ==
X-Gm-Message-State: AGi0Pua6pZshEk6U5WFMriy0LptzDD/KLrGWfkwPX4DyJXXORcxa93H5
        GZJ990QjGAC3b5SwedbS7NrgB3KVqokJh1bQzUnt+zy0
X-Google-Smtp-Source: APiQypIzRlKTw0fSZykoIIR24ZAMIOLRXNQuoPWO3lAbHPZyrktB1OUHn8WM24i5KQaxIJckfHwrGeEtUXzJIyVYP2A=
X-Received: by 2002:ab0:61cf:: with SMTP id m15mr7260508uan.99.1587736066762;
 Fri, 24 Apr 2020 06:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com> <21061.1587602497@localhost>
 <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com> <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
 <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
 <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
 <7689.1587657698@localhost> <CAPJ9Yc9rdbwd0OTcJhmuqG_r6qPfYKwiScLOxiwe41_ye_PNGw@mail.gmail.com>
 <CAPJ9Yc9uuOKk=fh3Ke7riuZN2JgB2Ma3F2Njy69_6nms1kC=bQ@mail.gmail.com>
In-Reply-To: <CAPJ9Yc9uuOKk=fh3Ke7riuZN2JgB2Ma3F2Njy69_6nms1kC=bQ@mail.gmail.com>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Fri, 24 Apr 2020 15:47:34 +0200
Message-ID: <CAPJ9Yc_iOxyDzrL9cs_ERSEjnVttYgk4JFqhO7T=yg03420LMA@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Thu, 23 Apr 2020 at 21:36, David Bala=C5=BEic <xerces9@gmail.com> wrote:
>
> OK, more data:
> I started tcpdump with the -e option as suggested on openwrt forum:
> tcpdump -e -v -i eth1.3902 pppoed
>
> on disconnect, this was logged (times are UTC):
>
>
> tcpdump: listening on eth1.3902, link-type EN10MB (Ethernet), capture
> size 262144 bytes
> 18:23:09.204991 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
> (oui Unknown), ethertype PPPoE D (0x8863), length 97: PPPoE PADO
> [Service-Name] [AC-Name "SIMB_TABOR_BNG1"] [Host-Uniq
> 0x44************long_number******************************AA]
> [AC-Cookie ".5b************v"]

Isnt this strange? The dst addr is not my router or any other known.
Also the Host-Uniq value is different.
As if is traffic meant for someone else.
