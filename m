Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0851B9388
	for <lists+linux-ppp@lfdr.de>; Sun, 26 Apr 2020 21:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgDZTEK (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 26 Apr 2020 15:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726165AbgDZTEK (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 26 Apr 2020 15:04:10 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BACDCC061A0F
        for <linux-ppp@vger.kernel.org>; Sun, 26 Apr 2020 12:04:09 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id f5so5199916ual.5
        for <linux-ppp@vger.kernel.org>; Sun, 26 Apr 2020 12:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc
         :content-transfer-encoding;
        bh=vVCRjK2mdaZbLPHgzrv4Y3Phr1f5eFP4K/vuVjpjrLA=;
        b=jvjR7u33EXmIJT3CJC515V1iQ2b+1rRq021qk8eCOLKo6d45YohYPrPmR92V3+Fifk
         vY2EAmMlVfODzuaMKlqOTI4tle0SIcxftuDUH0rHfexvjnOoGGwB5LpL8aXuDW3/vrhK
         HHCKJt0voY4DAcT5AlpyDrvt1Scif/FxHg2YS7Bymsq3Sl20QwFtcOHqBrHbiwHIdkSO
         QolmmezkhLlIcYRva8EHjk1zCTD+XFhnbqYrhUg+xecu2ZmLuLv394qoEk+she55TT60
         +T9xL2OoaczNS4x2FfYHdrpsf4+u0XB8skUSKkjibL4qhmrWtQeYsqMDsn+YA5zp/zGD
         mpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc:content-transfer-encoding;
        bh=vVCRjK2mdaZbLPHgzrv4Y3Phr1f5eFP4K/vuVjpjrLA=;
        b=WWgXadw5SwLlgjH496sjddXp42XA2zY+3hF1otT/SKgqp0wuWqsf+x+E4WIdEmBdCQ
         hppa4Ws13eCYv5yaq/TMTRVEmAoj1fE1iT37FeHeMCXH3uTyZ2bAPRoyZJNTo3avyqX7
         CiTMDH428qjqzLLA2XyK8qilccU/L2kOZbVkmpPmawUJPIst2M/+D1PJySF4/tyTX592
         QdHuVLcrkfky23xGczsBAuncU/iTN8KdJ2iWunwH7fjsMJhFN4CjoaFLNUrAO0rlIkz3
         ymdyrAYd9DpUFQ2p9HWjdG0il/IOmiIaFwVqlmUNjCOZm7YwEnAq3I+w5ttf9letDpOm
         boiQ==
X-Gm-Message-State: AGi0PubonegOouB3isvijQpqYk/OroEulRKMAhHwFeHCx1EjhY/YhEWN
        52bdup9IsqTObYNcUNBmZGx6kyzSEC0Dy7oGmmDbuD/jHXU=
X-Google-Smtp-Source: APiQypLAx9ckgJzj059sMfuqiRIbOcFsZBFLUl8LKdzO3x32bd4f5Askz2KrJWs1L9/Q08A0+TWkJw6gwSR4hE8/0iI=
X-Received: by 2002:a67:ec43:: with SMTP id z3mr14103987vso.135.1587927848202;
 Sun, 26 Apr 2020 12:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com> <21061.1587602497@localhost>
 <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com> <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
 <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
 <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
 <7689.1587657698@localhost> <CAPJ9Yc9rdbwd0OTcJhmuqG_r6qPfYKwiScLOxiwe41_ye_PNGw@mail.gmail.com>
 <CAPJ9Yc9uuOKk=fh3Ke7riuZN2JgB2Ma3F2Njy69_6nms1kC=bQ@mail.gmail.com>
 <CAPJ9Yc_iOxyDzrL9cs_ERSEjnVttYgk4JFqhO7T=yg03420LMA@mail.gmail.com>
 <29906.1587865115@localhost> <CAPJ9Yc-Tj+pLJ_vfLuERUi-2oGadeaWTJSkDFNw0rLoqMCmL3Q@mail.gmail.com>
In-Reply-To: <CAPJ9Yc-Tj+pLJ_vfLuERUi-2oGadeaWTJSkDFNw0rLoqMCmL3Q@mail.gmail.com>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Sun, 26 Apr 2020 21:03:57 +0200
Message-ID: <CAPJ9Yc8AQZnATT07zUC0397vSGCuuh8STyQRbdBk5LLPp3Xfyg@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Cc:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

OK, next round.

First:
> Do you have ebtables?  Could you arrange to filter out packets like that?
> That would point to there being some kernel bug.
They seems to "arrive" only if the interface is put into promiscuous mode.
That is tcpdump  captures them unless I add the -p option.
I will recheck this to be sure.


The current disconnect:

 - output of  tcpdump -e -v -i eth1 vlan 3902 and  pppoed:

tcpdump: listening on eth1, link-type EN10MB (Ethernet), capture size
262144 bytes
17:34:34.805424 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
(oui Unknown), ethertype 802.1Q (0x8100), length 60: vlan 3902, p 1,
ethertype PPPoE D, PPPoE PADT [ses 0x1]
17:34:34.815673 c4:3d:c7:90:ce:ed (oui Unknown) > a4:7b:2c:9e:c7:44
(oui Unknown), ethertype 802.1Q (0x8100), length 52: vlan 3902, p 0,
ethertype PPPoE D, PPPoE PADT [ses 0x1] [Host-Uniq 0x00003003]
[AC-Cookie 0xED****************************75]
tcpdump: pcap_loop: The interface went down
2 packets captured
2 packets received by filter
0 packets dropped by kernel

system logs:  logread | grep -v -E '(hostapd|dnsmasq)'


Sun Apr 26 14:40:26 2020 authpriv.info dropbear[22495]: Exit (root):
Disconnect received
Sun Apr 26 17:34:34 2020 daemon.notice pppd[12291]: Modem hangup
Sun Apr 26 17:34:34 2020 daemon.info pppd[12291]: Connect time 606.7 minute=
s.
Sun Apr 26 17:34:34 2020 daemon.info pppd[12291]: Sent 105754253
bytes, received 999814297 bytes.
Sun Apr 26 17:34:34 2020 daemon.notice netifd: Network device
'pppoe-wan' link is down
Sun Apr 26 17:34:34 2020 daemon.debug pppd[12291]: Script
/lib/netifd/ppp-down started (pid 20230)
Sun Apr 26 17:34:34 2020 daemon.notice pppd[12291]: Connection terminated.
Sun Apr 26 17:34:34 2020 daemon.debug pppd[12291]: Send PPPOE
Discovery V1T1 PADT session 0x1 length 28
Sun Apr 26 17:34:34 2020 daemon.debug pppd[12291]:  dst
a4:XX:XX:XX:XX:44  src c4:XX:XX:XX:XX:ed
Sun Apr 26 17:34:34 2020 daemon.debug pppd[12291]:  [host-uniq  00 00
30 03] [AC-cookie  ed XY XY XY XY XY XY XY XY XY XY XY XY XY XY 75]
Sun Apr 26 17:34:34 2020 daemon.info pppd[12291]: Sent PADT
Sun Apr 26 17:34:34 2020 daemon.debug pppd[12291]: Waiting for 1 child
processes...
Sun Apr 26 17:34:34 2020 daemon.debug pppd[12291]:   script
/lib/netifd/ppp-down, pid 20230
Sun Apr 26 17:34:34 2020 daemon.notice netifd: Interface 'wan' has
lost the connection
Sun Apr 26 17:34:34 2020 daemon.debug pppd[12291]: Script
/lib/netifd/ppp-down finished (pid 20230), status =3D 0x1
Sun Apr 26 17:34:34 2020 daemon.info pppd[12291]: Exit.
Sun Apr 26 17:34:35 2020 daemon.notice netifd: Interface 'wan' is now down
Sun Apr 26 17:34:35 2020 kern.info kernel: [605071.537261] eth1: link down
Sun Apr 26 17:34:35 2020 daemon.notice netifd: Interface 'wan' is disabled
Sun Apr 26 17:34:35 2020 kern.info kernel: [605071.567649] IPv6:
ADDRCONF(NETDEV_UP): eth1: link is not ready
Sun Apr 26 17:34:35 2020 kern.info kernel: [605071.574985] eth1: link
up (1000Mbps/Full duplex)
Sun Apr 26 17:34:35 2020 kern.info kernel: [605071.579700] IPv6:
ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
Sun Apr 26 17:34:35 2020 daemon.notice netifd: Interface 'wan' is enabled
Sun Apr 26 17:34:35 2020 daemon.notice netifd: Interface 'wan' is setting u=
p now
Sun Apr 26 17:34:35 2020 kern.info kernel: [605071.645168] device eth1
left promiscuous mode
Sun Apr 26 17:34:35 2020 daemon.err insmod: module is already loaded - slhc
Sun Apr 26 17:34:35 2020 daemon.err insmod: module is already loaded -
ppp_generic
Sun Apr 26 17:34:35 2020 daemon.err insmod: module is already loaded - pppo=
x
Sun Apr 26 17:34:35 2020 daemon.err insmod: module is already loaded - pppo=
e
Sun Apr 26 17:34:35 2020 daemon.info pppd[20289]: Plugin rp-pppoe.so loaded=
.
Sun Apr 26 17:34:35 2020 daemon.info pppd[20289]: RP-PPPoE plugin
version 3.8p compiled against pppd 2.4.7
Sun Apr 26 17:34:35 2020 daemon.notice pppd[20289]: pppd 2.4.7 started
by root, uid 0
Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]: Send PPPOE
Discovery V1T1 PADI session 0x0 length 12
Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]:  dst
ff:ff:ff:ff:ff:ff  src c4:XX:XX:XX:XX:ed
Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]:  [service-name]
[host-uniq  00 00 4f 41]
Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]: Recv PPPOE
Discovery V1T1 PADO session 0x0 length 51
Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]:  dst
c4:XX:XX:XX:XX:ed  src a4:XX:XX:XX:XX:44
Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]:  [service-name]
[AC-name SIMB_TABOR_BNG1] [host-uniq  00 00 4f 41] [AC-cookie  ed XY
XY XY XY XY XY XY XY XY XY XY XY XY XY 75]
Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]: Send PPPOE
Discovery V1T1 PADR session 0x0 length 32
Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]:  dst
a4:XX:XX:XX:XX:44  src c4:XX:XX:XX:XX:ed
Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]:  [service-name]
[host-uniq  00 00 4f 41] [AC-cookie  ed XY XY XY XY XY XY XY XY XY XY
XY XY XY XY 75]
Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]: Recv PPPOE
Discovery V1T1 PADS session 0x1 length 12
Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]:  dst
c4:XX:XX:XX:XX:ed  src a4:XX:XX:XX:XX:44
Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]:  [service-name]
[host-uniq  00 00 4f 41]
Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]: PADS: Service-Name: ''
Sun Apr 26 17:34:35 2020 daemon.info pppd[20289]: PPP session is 1
Sun Apr 26 17:34:35 2020 daemon.warn pppd[20289]: Connected to
a4:XX:XX:XX:XX:44 via interface eth1.3902
Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]: using channel 14
Sun Apr 26 17:34:35 2020 kern.info kernel: [605072.063661] pppoe-wan:
renamed from ppp0
Sun Apr 26 17:34:35 2020 daemon.info pppd[20289]: Renamed interface
ppp0 to pppoe-wan
Sun Apr 26 17:34:35 2020 daemon.info pppd[20289]: Using interface pppoe-wan
Sun Apr 26 17:34:35 2020 daemon.notice pppd[20289]: Connect: pppoe-wan
<--> eth1.3902
Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]: sent [LCP ConfReq
id=3D0x1 <mru 1492> <magic 0x5182441e>]
Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]: rcvd [LCP ConfAck
id=3D0x1 <mru 1492> <magic 0x5182441e>]
Sun Apr 26 17:34:38 2020 daemon.debug pppd[20289]: sent [LCP ConfReq
id=3D0x1 <mru 1492> <magic 0x5182441e>]
Sun Apr 26 17:34:38 2020 daemon.debug pppd[20289]: rcvd [LCP ConfAck
id=3D0x1 <mru 1492> <magic 0x5182441e>]
Sun Apr 26 17:34:38 2020 daemon.debug pppd[20289]: rcvd [LCP ConfReq
id=3D0xc5 <mru 1492> <auth chap MD5> <magic 0x1ec8e8c8>]
Sun Apr 26 17:34:38 2020 daemon.debug pppd[20289]: sent [LCP ConfAck
id=3D0xc5 <mru 1492> <auth chap MD5> <magic 0x1ec8e8c8>]
Sun Apr 26 17:34:38 2020 daemon.debug pppd[20289]: sent [LCP EchoReq
id=3D0x0 magic=3D0x5182441e]
Sun Apr 26 17:34:38 2020 daemon.debug pppd[20289]: rcvd [CHAP
Challenge id=3D0x1
<f*********************************************************************50>,
name =3D "SIMB_TABOR_BNG1"]
Sun Apr 26 17:34:38 2020 daemon.debug pppd[20289]: sent [CHAP Response
id=3D0x1 <83****************************c4>, name =3D "username"]
Sun Apr 26 17:34:38 2020 daemon.debug pppd[20289]: rcvd [LCP EchoRep
id=3D0x0 magic=3D0x1ec8e8c8]
Sun Apr 26 17:34:38 2020 daemon.debug pppd[20289]: rcvd [CHAP Success
id=3D0x1 "CHAP authentication success"]
Sun Apr 26 17:34:38 2020 daemon.info pppd[20289]: CHAP authentication
succeeded: CHAP authentication success
Sun Apr 26 17:34:38 2020 daemon.notice pppd[20289]: CHAP
authentication succeeded
Sun Apr 26 17:34:38 2020 daemon.notice pppd[20289]: peer from calling
number a4:XX:XX:XX:XX:44 authorized
Sun Apr 26 17:34:39 2020 daemon.debug pppd[20289]: sent [IPCP ConfReq
id=3D0x1 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns2 0.0.0.0>]
Sun Apr 26 17:34:39 2020 daemon.debug pppd[20289]: sent [IPV6CP
ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
Sun Apr 26 17:34:39 2020 daemon.debug pppd[20289]: rcvd [IPCP ConfReq
id=3D0xf4 <addr 94.127.WW.ZZ>]
Sun Apr 26 17:34:39 2020 daemon.debug pppd[20289]: sent [IPCP ConfAck
id=3D0xf4 <addr 94.127.WW.ZZ>]
Sun Apr 26 17:34:39 2020 daemon.debug pppd[20289]: rcvd [IPCP ConfNak
id=3D0x1 <addr 46.164.XX.YY> <ms-dns1 212.18.32.10> <ms-dns2
212.18.32.12>]
Sun Apr 26 17:34:39 2020 daemon.debug pppd[20289]: sent [IPCP ConfReq
id=3D0x2 <addr 46.164.XX.YY> <ms-dns1 212.18.32.10> <ms-dns2
212.18.32.12>]
Sun Apr 26 17:34:39 2020 daemon.debug pppd[20289]: rcvd [IPCP ConfAck
id=3D0x2 <addr 46.164.XX.YY> <ms-dns1 212.18.32.10> <ms-dns2
212.18.32.12>]
Sun Apr 26 17:34:39 2020 daemon.notice pppd[20289]: local  IP address
46.164.XX.YY
Sun Apr 26 17:34:39 2020 daemon.notice pppd[20289]: remote IP address
94.127.WW.ZZ
Sun Apr 26 17:34:39 2020 daemon.notice pppd[20289]: primary   DNS
address 212.18.32.10
Sun Apr 26 17:34:39 2020 daemon.notice pppd[20289]: secondary DNS
address 212.18.32.12
Sun Apr 26 17:34:39 2020 daemon.debug pppd[20289]: Script
/lib/netifd/ppp-up started (pid 20355)
Sun Apr 26 17:34:39 2020 daemon.notice netifd: Network device
'pppoe-wan' link is up
Sun Apr 26 17:34:39 2020 daemon.notice netifd: Interface 'wan' is now up
Sun Apr 26 17:34:39 2020 daemon.debug pppd[20289]: Script
/lib/netifd/ppp-up finished (pid 20355), status =3D 0x1
Sun Apr 26 17:34:39 2020 user.notice firewall: Reloading firewall due
to ifup of wan (pppoe-wan)
Sun Apr 26 17:34:42 2020 daemon.debug pppd[20289]: sent [IPV6CP
ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
Sun Apr 26 17:34:45 2020 daemon.debug pppd[20289]: sent [IPV6CP
ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
Sun Apr 26 17:34:48 2020 daemon.debug pppd[20289]: sent [IPV6CP
ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
Sun Apr 26 17:34:51 2020 daemon.debug pppd[20289]: sent [IPV6CP
ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
Sun Apr 26 17:34:54 2020 daemon.debug pppd[20289]: sent [IPV6CP
ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
Sun Apr 26 17:34:57 2020 daemon.debug pppd[20289]: sent [IPV6CP
ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
Sun Apr 26 17:35:00 2020 daemon.debug pppd[20289]: sent [IPV6CP
ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
Sun Apr 26 17:35:03 2020 daemon.debug pppd[20289]: sent [IPV6CP
ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
Sun Apr 26 17:35:06 2020 daemon.debug pppd[20289]: sent [IPV6CP
ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
Sun Apr 26 17:35:09 2020 daemon.warn pppd[20289]: IPV6CP: timeout
sending Config-Requests


The strange part is in the tcpdump there is a PADT sent to an
"unknown" MAC and my pppd responds. At least that is how I see it.

You think NOT putting the interface into promiscuous mode (done by
tcpdump) would prevent this?
Anyway, now I startted tcpdump with the -p option:  tcpdump -e -v -p
-i eth1 vlan 3902 and pppoed


On Sun, 26 Apr 2020 at 14:48, David Bala=C5=BEic <xerces9@gmail.com> wrote:
>
> On Sun, 26 Apr 2020 at 03:38, Michael Richardson <mcr@sandelman.ca> wrote=
:
> >
> >
> > David Bala=C5=BEic <xerces9@gmail.com> wrote:
> >     >> OK, more data:
> >     >> I started tcpdump with the -e option as suggested on openwrt for=
um:
> >     >> tcpdump -e -v -i eth1.3902 pppoed
> >     >>
> >     >> on disconnect, this was logged (times are UTC):
> >     >>
> >     >>
> >     >> tcpdump: listening on eth1.3902, link-type EN10MB (Ethernet), ca=
pture
> >     >> size 262144 bytes
> >     >> 18:23:09.204991 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7=
:39
> >     >> (oui Unknown), ethertype PPPoE D (0x8863), length 97: PPPoE PADO
> >     >> [Service-Name] [AC-Name "SIMB_TABOR_BNG1"] [Host-Uniq
> >     >> 0x44************long_number******************************AA]
> >     >> [AC-Cookie ".5b************v"]
> >
> >     > Isnt this strange? The dst addr is not my router or any other kno=
wn.
> >     > Also the Host-Uniq value is different.
> >     > As if is traffic meant for someone else.
> >
> > oh, I understand.
> > thank you for noting this.
> > So, it's as if you are getting a PPPoE message for someone else, and wh=
en
> > that happens, the interface is dying.
> > Is it always the same ethernet address?
>
> Yes,the same.
>
> > Do you have ebtables?  Could you arrange to filter out packets like tha=
t?
> > That would point to there being some kernel bug.
> >
> > Clearly, your ISP has some other bug that they are sending stuff down t=
he
> > wrong pipe, but that could just be hash collisions that they assume are
> > "harmless".
>
> Those packets don't seem to be a problem. In the last connection, I
> received 15 of them and no reconnect.
>
> As suggested on OpenWRT, I removed a IPv6 wan device config that was
> running DHCPv6 on eth1.
>
> Then he connection was up for 45 hours before dropping. Could be a
> coincidence...
>
> I posted the logs at
> https://forum.openwrt.org/t/pppoe-disconnects-every-few-hours/61239/22
> (gmail wraps lines...)
>
> Regards,
> David
