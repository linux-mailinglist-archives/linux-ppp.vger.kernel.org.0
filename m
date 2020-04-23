Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 464051B5B22
	for <lists+linux-ppp@lfdr.de>; Thu, 23 Apr 2020 14:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgDWMN1 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 23 Apr 2020 08:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726056AbgDWMN1 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 23 Apr 2020 08:13:27 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA6DFC08E859
        for <linux-ppp@vger.kernel.org>; Thu, 23 Apr 2020 05:13:26 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id t8so5407853uap.3
        for <linux-ppp@vger.kernel.org>; Thu, 23 Apr 2020 05:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=+NzBgCDamo1Cb0afCzIfPg4izYcYUMma08t6rIVUxHo=;
        b=Kf/dPDYzw2nh4CvPiH5OiszS8RwVItB5dIp8+p/Y2TnW3ITktAzNn7iqmaIl8JWSCA
         Fyz8cXPsSTV4TX6lgc/nojQ6Nm0bKJ46bHSmzR/SISjtpgQGmHMsV+RTrAKcHu0vmvyZ
         R+VOG75eT/A0KRC19y6LiHhFswU2rJxnhM8V3v42hvFPHy8aK1NpwVFi+4fdETUOSjds
         CuigfxXUfV/9SMimpALaWVGdLbBnkiuzcmjz3bY9yjjGRwqCi+Elg+u505EnS7bYXzmh
         ZzfjmZNiPv0pMu+kuXL+Ky9QrG2qIMt5lRWQ+7qTZgDZMyy0DmHl8Brdhf4t4/qQFiCu
         v8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=+NzBgCDamo1Cb0afCzIfPg4izYcYUMma08t6rIVUxHo=;
        b=jIA4DpoWdJyu6aUEgxF63XCOMgyRzqPygMCM3SUEjKRcAhFKr9yV7ro3MJvQtfBAnE
         w7efuU9d7+hS2uJZ1A1Zsd0ZUaruIyBDk2Tvftu59+FXmm6Pj5txax8qKB/HY1hC3BqB
         okQrrR8Yjlo9JdkuLYNMC9jkgnpnbUPNEnGwajPP8SDgs/M4fC+ePYpi53fK6RPXjYtf
         8NdgqZrjx4u5tfQrXMJLXJSsqeQ4ybuZKLgCFCdMBXrwweoVTjyXvJED0P34MPOc9OhR
         pnZOqDOErQ43At2mi3w6R80HszbXtmmF+pdhgiGYgfrIbW8jMnbMXdRJGu+lDGsRaHBG
         BDqA==
X-Gm-Message-State: AGi0Pua9wZLFPMfqLIwp/6wUEeFjDionr8D6y8Hare05rysJ4m/cbQoA
        t9T1w/O9gbCrkdynZNmVMEgy9LiHVFRl2vSx8lXiXAShVQc=
X-Google-Smtp-Source: APiQypIOdgU3qfiHCOXvOwAXmnpFUQVUWSQNjZmmS76ylcixdqy9sW5giBuyHIWYoRJVgU4wmNzRZtDXB1DLpA4+hbw=
X-Received: by 2002:ab0:1381:: with SMTP id m1mr2773496uae.34.1587644005766;
 Thu, 23 Apr 2020 05:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com> <21061.1587602497@localhost>
 <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com> <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
 <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
In-Reply-To: <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Thu, 23 Apr 2020 14:13:14 +0200
Message-ID: <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Oh, i'm "lucky", shortly after starting "tcpdump -i eth1.3902 pppoed"
there was another disconnect:

Thu Apr 23 11:44:13 2020 daemon.notice pppd[10756]: Modem hangup

tcpdump output:

listening on eth1.3902, link-type EN10MB (Ethernet), capture size 262144 by=
tes
11:44:09.749322 PPPoE PADO [Service-Name] [AC-Name "SIMB_TABOR_BNG1"]
[Host-Uniq 0x44************long_number******************************AA]
[AC-Cookie ".5b************v"]
11:44:09.754297 PPPoE PADS [ses 0x1] [Service-Name] [Host-Uniq
0x44*******************long_number*********************************AA]
11:44:13.115312 PPPoE PADT [ses 0x1]
11:44:13.126422 PPPoE PADT [ses 0x1] [Host-Uniq 0x00002A04] [AC-Cookie
0xED****************************75]
tcpdump: pcap_loop: The interface went down
4 packets captured
22 packets received by filter
0 packets dropped by kernel


The ifconfig packet counter for the VLAN interface eth1.3902 is reset,
compare to values in quested message below, this is th eoutpu a few
minutes after the reconnect:

eth1      Link encap:Ethernet  HWaddr C4:3D:C7:90:CE:ED
          inet6 addr: fe80::c63d:c7ff:fe90:ceed/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:24193753 errors:0 dropped:0 overruns:3 frame:0
          TX packets:12513809 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:4171215264 (3.8 GiB)  TX bytes:2485973 (2.3 MiB)
          Interrupt:5

eth1.3902 Link encap:Ethernet  HWaddr C4:3D:C7:90:CE:ED
          inet6 addr: fe80::c63d:c7ff:fe90:ceed/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:255930 errors:0 dropped:0 overruns:0 frame:0
          TX packets:42015 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:126494373 (120.6 MiB)  TX bytes:25853728 (24.6 MiB)


PS: The IPv6 address is according to standards, ignore that question.



On Thu, 23 Apr 2020 at 13:12, David Bala=C5=BEic <xerces9@gmail.com> wrote:
>
> One more thing I noticed:
>
> the packet count for eth1 is much higher than for eth1.3902:
>
>
> eth1      Link encap:Ethernet  HWaddr C4:XX:XX:XX:XX:ED
>           inet6 addr: fe80::c6xx:xxff:fexx:xxed/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:23147175 errors:0 dropped:0 overruns:3 frame:0
>           TX packets:12334230 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:3553425618 (3.3 GiB)  TX bytes:4237688514 (3.9 GiB)
>           Interrupt:5
>
> eth1.3902 Link encap:Ethernet  HWaddr C4:XX:XX:XX:XX:ED
>           inet6 addr: fe80::c6xx:xxff:fexx:xxed/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:682037 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:91218 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:373700490 (356.3 MiB)  TX bytes:26176360 (24.9 MiB)
>
> As if the eth1.3902 is somehow reset every now and then. I'll keep my eye=
 on it.
>
>
> Also: the IPv6 address (the part derived from hwaddr) starts with c6
> instead of c4 like the actual hw address. Is that normal?
>
>
>
> On Thu, 23 Apr 2020 at 12:37, David Bala=C5=BEic <xerces9@gmail.com> wrot=
e:
> >
> > Some more info:
> >
> >  - the connect time is random:
> > # logread  | grep "Connect time"
> > Wed Apr 22 16:42:18 2020 daemon.info pppd[7960]: Connect time 1742.8 mi=
nutes.
> > Wed Apr 22 19:13:03 2020 daemon.info pppd[9563]: Connect time 150.7 min=
utes.
> > Thu Apr 23 09:38:31 2020 daemon.info pppd[9884]: Connect time 865.5 min=
utes.
> >
> >
> >
> >  - the assigned IP address is different on each connection
> >
> >
> >  - logs
> > On Thu, 23 Apr 2020 at 00:00, James Carlson <carlsonj@workingcode.com> =
wrote:
> > >
> > > On 2020-04-22 13:45, David Bala=C5=BEic wrote:
> > > > Hi!
> > > >
> > > > I have a router running openwrt connected to a GPON ONT, running a
> > > > PPPoE connection (hw details below).
> > >
> > > This looks to be (possibly) a PPPoE failure, though there's nothing
> > > interesting in the log messages provided.  If there were an interesti=
ng
> > > log message, it would almost certainly come somewhere (perhaps even
> > > *minutes*) before that initial "Modem hangup" message.
> >
> > Nothing there:
> >
> > Thu Apr 23 08:59:02 2020 daemon.info hostapd: wlan0: STA
> > 58:XX:XX:XX:XX:b9 IEEE 802.11: deauthenticated due to inactivity
> > (timer DEAUTH/REMOVE)
> > Thu Apr 23 09:38:31 2020 daemon.notice pppd[9884]: Modem hangup
> >
> > I'll try packet capture next.
> >
> > Regards,
> > David
