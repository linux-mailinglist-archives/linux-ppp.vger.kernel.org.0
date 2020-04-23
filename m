Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 545A81B5A25
	for <lists+linux-ppp@lfdr.de>; Thu, 23 Apr 2020 13:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbgDWLNC (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 23 Apr 2020 07:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727858AbgDWLNC (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 23 Apr 2020 07:13:02 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5782C035494
        for <linux-ppp@vger.kernel.org>; Thu, 23 Apr 2020 04:13:00 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id s5so5261068uad.4
        for <linux-ppp@vger.kernel.org>; Thu, 23 Apr 2020 04:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=gZr0XxXF/Zaj4y+ZggOL8zJqeoinV6RlaS/lqobt25I=;
        b=qdF4R9MNsiSVY8Nl8CkFk16vQXs4pqFPDI5easdvQXWOW7E84zKpCE5ZoSzPqQTQHp
         6+pHXAsqinJHL/BSJROq0aGYYA/+XIsAaIFWCwrefAttJU8Ur8WinzJtzRmGPSaOvWil
         SbOorCQDxYybw0frVaohtbPlgAJw8C26BsH45mt1qPJaQES/wqrCJCQUuGzZofu1Je+i
         DWfN+vPevvUhNcmUHcMxOhvnN+7YySus7qeM3a4acO7f3kCqVSYF4G6H6x0zvxzxhtOJ
         145X1yKrnKUxQzpvahOA5tBWlPi9R8xYcAJBKZ7EZZoy8avNU16W4t698PozY/XkWXic
         Y4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=gZr0XxXF/Zaj4y+ZggOL8zJqeoinV6RlaS/lqobt25I=;
        b=Mo96bUsk35wJoXn3519nAy82vZ7J1kx2kPy37yVrDK2IVbKaB7EkvQYP6fuEwceZdh
         IZSb2hSKunYXKxfizgKCXOsi6g0PkRIrsrwnOKWbEgoOkYqcUk1/4RUpp8lEaFmOPO3z
         ghyNHMKFPuqATkwKr/Mz68L5H+3RlfAgZD0/1F6Z/R1OX6wlJat5KPasUSujha4I0iTn
         Ogoz2Yq5/DjsnqcF7l/5pjjY3AuTPMSkPs/C+azxng/ueS0ofOcqjh3+2DVRzmBHoV53
         4iz0zCCgipAx2VAZp24Yk3cusFFl4NtfkcSa7pNitzGpgNvElYwKq8RpB4OahXdCYCwe
         BZYg==
X-Gm-Message-State: AGi0PuavHa6wsQ9SesjcEi28ffpgIF6JhWPLGsJExh7jmVNMkrwSA3BA
        G3a0PVcR9Ao5kMw268CTqyqwHMNnduEILNxgY1YRyC5L
X-Google-Smtp-Source: APiQypK3ZUH+hgimJpcMK62J7FlqLBmpeCcN35ZD/dEuZOMFhTFnhrAlYl6KbG9B84MA1qEgm5nZ1kbuxKIUIjQYpEY=
X-Received: by 2002:ab0:1381:: with SMTP id m1mr2556389uae.34.1587640379733;
 Thu, 23 Apr 2020 04:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com> <21061.1587602497@localhost>
 <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com> <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
In-Reply-To: <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Thu, 23 Apr 2020 13:12:48 +0200
Message-ID: <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

One more thing I noticed:

the packet count for eth1 is much higher than for eth1.3902:


eth1      Link encap:Ethernet  HWaddr C4:XX:XX:XX:XX:ED
          inet6 addr: fe80::c6xx:xxff:fexx:xxed/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:23147175 errors:0 dropped:0 overruns:3 frame:0
          TX packets:12334230 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:3553425618 (3.3 GiB)  TX bytes:4237688514 (3.9 GiB)
          Interrupt:5

eth1.3902 Link encap:Ethernet  HWaddr C4:XX:XX:XX:XX:ED
          inet6 addr: fe80::c6xx:xxff:fexx:xxed/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:682037 errors:0 dropped:0 overruns:0 frame:0
          TX packets:91218 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:373700490 (356.3 MiB)  TX bytes:26176360 (24.9 MiB)

As if the eth1.3902 is somehow reset every now and then. I'll keep my eye o=
n it.


Also: the IPv6 address (the part derived from hwaddr) starts with c6
instead of c4 like the actual hw address. Is that normal?



On Thu, 23 Apr 2020 at 12:37, David Bala=C5=BEic <xerces9@gmail.com> wrote:
>
> Some more info:
>
>  - the connect time is random:
> # logread  | grep "Connect time"
> Wed Apr 22 16:42:18 2020 daemon.info pppd[7960]: Connect time 1742.8 minu=
tes.
> Wed Apr 22 19:13:03 2020 daemon.info pppd[9563]: Connect time 150.7 minut=
es.
> Thu Apr 23 09:38:31 2020 daemon.info pppd[9884]: Connect time 865.5 minut=
es.
>
>
>
>  - the assigned IP address is different on each connection
>
>
>  - logs
> On Thu, 23 Apr 2020 at 00:00, James Carlson <carlsonj@workingcode.com> wr=
ote:
> >
> > On 2020-04-22 13:45, David Bala=C5=BEic wrote:
> > > Hi!
> > >
> > > I have a router running openwrt connected to a GPON ONT, running a
> > > PPPoE connection (hw details below).
> >
> > This looks to be (possibly) a PPPoE failure, though there's nothing
> > interesting in the log messages provided.  If there were an interesting
> > log message, it would almost certainly come somewhere (perhaps even
> > *minutes*) before that initial "Modem hangup" message.
>
> Nothing there:
>
> Thu Apr 23 08:59:02 2020 daemon.info hostapd: wlan0: STA
> 58:XX:XX:XX:XX:b9 IEEE 802.11: deauthenticated due to inactivity
> (timer DEAUTH/REMOVE)
> Thu Apr 23 09:38:31 2020 daemon.notice pppd[9884]: Modem hangup
>
> I'll try packet capture next.
>
> Regards,
> David
