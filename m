Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7F91B901E
	for <lists+linux-ppp@lfdr.de>; Sun, 26 Apr 2020 14:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgDZMo5 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 26 Apr 2020 08:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725972AbgDZMo4 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 26 Apr 2020 08:44:56 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E4EBC09B04F
        for <linux-ppp@vger.kernel.org>; Sun, 26 Apr 2020 05:44:56 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id p5so1636504vke.1
        for <linux-ppp@vger.kernel.org>; Sun, 26 Apr 2020 05:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=SS1GFoCQVnKJlcS+TGY5XuYjPfzYdjsTm9CvmdCJBPs=;
        b=nTEY+2Wi+IV2X2KMH/Sq95JFoTnha6o5Qi0HINZSuNvLEjvhOz+6eCPPlgIrvBZpOL
         PkVEdL5azWDck4fD5Bxqqp1m3CLNOoumf4jqFucDfg3GvUYubqIx1ZR+r2nDLoM0t7nx
         LHm9opKUEvW5oK3F2xES1e05kz63Zf3Q/8uhMItrKpxZhB38wp0cmTV4rtKbU7SOnRd8
         EovlekgF/uOcHLViXjIk3RCXiSY5xNrnvrnRwNxa8APeuqRa12K1KR45DH2SjEsozX22
         wexEJCm0gfG+yFTdohxB8RXJg3WTg07psCoHDxs7aO6mE596PEbBs8hrDhuwFqjILoC/
         JDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=SS1GFoCQVnKJlcS+TGY5XuYjPfzYdjsTm9CvmdCJBPs=;
        b=ZYP9QNawnpFeDCWRrqiPsPC09bSnlxJdmlIeS98dVbZoDhVcdwoVEa6N/QNeoGVZL8
         Lgtk7GNKUL0NcnjODQmycMYCkbi3nOfpDuZtAg/oDba7qDZlMAxMyM7Awzm2lY8E+J6x
         k/q030diIV/xJLLuaGOZ8t2BWei50mO4GiWAPyEK0PZOQB0dBf8IXJF/qac7cSPbDFWt
         F6m6Ud0xR/+GMXUl4KujXo8BcPyooSBIPIrI+7bkyzHiUyuN4/axqSDLxBXE/UYpEsZj
         o5aSD6XflYzTXGV2NLYVA5nLAuKqqpIJJCIQTxfVAeOXRW0v0fPDuqjTF8ZtML/y5LTD
         OHpA==
X-Gm-Message-State: AGi0PuYxO5+1K/NMmx0hJiz7wZfq6lg78kj/k74raMBKk7loFneg6r7S
        V/5KZd3+/ZXFzgvD4ZZs3sbYsMDURGxA9VkRnqwDT2x/St0=
X-Google-Smtp-Source: APiQypKcJ4yrRMBCvk4C2zDYSadDUNFwjjpMTDg48VCoyUVHCanZk0HXFUVHxit0IVK6RwXolN2xtbsOGP/Nay+eOOA=
X-Received: by 2002:a1f:9182:: with SMTP id t124mr13692855vkd.38.1587905095426;
 Sun, 26 Apr 2020 05:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com> <21061.1587602497@localhost>
 <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com> <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
 <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
 <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
 <7689.1587657698@localhost> <CAPJ9Yc9rdbwd0OTcJhmuqG_r6qPfYKwiScLOxiwe41_ye_PNGw@mail.gmail.com>
 <CAPJ9Yc9uuOKk=fh3Ke7riuZN2JgB2Ma3F2Njy69_6nms1kC=bQ@mail.gmail.com> <28667.1587864864@localhost>
In-Reply-To: <28667.1587864864@localhost>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Sun, 26 Apr 2020 14:44:44 +0200
Message-ID: <CAPJ9Yc_=ZDNAGBRw4wZJ+ibBF6mW3bj4Dv5ehvOGrX=4aamkmA@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Sun, 26 Apr 2020 at 03:34, Michael Richardson <mcr@sandelman.ca> wrote:
>
> David Bala=C5=BEic <xerces9@gmail.com> wrote:
>     > OK, more data:
>     > I started tcpdump with the -e option as suggested on openwrt forum:
>     > tcpdump -e -v -i eth1.3902 pppoed
>
> tcpdump isn't going to be able to see what happens after the interface go=
es
> down.
>         tcpdump -e -v -i eth1 vlan 3902 pppoed
>
> ought to work slightly better, but due to the way vlans are evaluated, mi=
ght
> not work properly.  {as maintainer, it's a major PITA...}

tcpdump -e -v -i eth1 vlan 3902 and pppoed

seems to work, it started it and wait for results. (just "tcpdump -e
-v -i eth1 vlan 3902" shows a lot of packets)
