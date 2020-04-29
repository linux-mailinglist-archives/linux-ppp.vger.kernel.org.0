Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0CE21BDB38
	for <lists+linux-ppp@lfdr.de>; Wed, 29 Apr 2020 13:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgD2L6w (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 29 Apr 2020 07:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726511AbgD2L6w (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 29 Apr 2020 07:58:52 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 756E3C03C1AD
        for <linux-ppp@vger.kernel.org>; Wed, 29 Apr 2020 04:58:50 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id e22so1145802vsa.12
        for <linux-ppp@vger.kernel.org>; Wed, 29 Apr 2020 04:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A/qHiOizydaiYmA1tl251sqQ/H50OXgLT3ABLQPRS3Q=;
        b=u9pz0pNNgKNjsHlUuZuivga3vodYT78hhP+kMmt3ajyxQAuA+YhKz6J/VvvuaT+wqD
         sC/kl9BF/JgvlnrR+RpAR2FqHBT3EekpQrEfJj+YH8b2qoYgIi12jQ3F8Tfzd/0nINa2
         whTRy4zkcpZyIsJbA+LNwxECpVkRQKLfMiyUc/fmiua3Pldu1QVX57E3/NL2a9cXvXTi
         YLZFRtDkmHIasQllQIwwObq28G5ItLZ8oIed/KkwCpv8ePMRI5afQBDfp+RYHGEr6AAf
         S9+UemmCqBf2APTTUD1T2SGOp5MbzMk/NR/DYE6MmURZMsw67bHD645Wh4ekoYIkn2R9
         hc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A/qHiOizydaiYmA1tl251sqQ/H50OXgLT3ABLQPRS3Q=;
        b=fRBOACBufEHEqNjZiv3mLzJs/JPr304uBIfZL+nBW/mbjU9LuGes7YDNSs5TAE8xk5
         nxkrOx6eN/fXeotRctmShkzH7bR0RbKqAX19r2b+xqyLlrMyEjWz7vva+/bz0XW0Vl6w
         umy1iY3RP+pmuqIWmANyczkQ6JSjx0p0ItkpBHA6O5nBiWT34eubWl6p8/ZyjRslTQH6
         29nMM4KQUC8lC0AnEWwFEi8I1Tb+E737uD8PQaRwW1LYR1ndbPjG1WxYT6A8emNywBlP
         fBGWCBoWIrcLjCd16wnbY8pK/liXjOiRCxKk4xyf9Hy8d39elzPn2YDkJQd/aD4LQ2fB
         mx7A==
X-Gm-Message-State: AGi0PuatES37g7Mw9SYD7O7+PdslDTPQzQrflcojHPmqN2uLMbnKnbzH
        mWBXPDp7cq9eHNL+8HFrc1P0r0sKdkcs4ztZNvtaFXpLD4o=
X-Google-Smtp-Source: APiQypLU1Jx1ekpGNupyt2EWWTyTWaYovfMh8insfWsBn0V1nbBP2hJhKp/FaUXG+B4JGIwVcdLt4TDgO2CyUn0pmkk=
X-Received: by 2002:a67:1943:: with SMTP id 64mr12389474vsz.113.1588161529075;
 Wed, 29 Apr 2020 04:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com> <21061.1587602497@localhost>
 <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com> <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
 <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
 <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
 <20200424155459.GB21114@pc-3.home> <CAPJ9Yc_kHZKCSG7o7YtU7YCvAF4+OPm9MJzYK12mmQOg5FQD2w@mail.gmail.com>
 <CAPJ9Yc82m71opZ5nkxqtGuJ8rsuY83opnZPOiS7_DWjiC4JFrg@mail.gmail.com> <20200428110033.GA25921@pc-3.home>
In-Reply-To: <20200428110033.GA25921@pc-3.home>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Wed, 29 Apr 2020 13:58:37 +0200
Message-ID: <CAPJ9Yc_nBzy5zWPBAOgD2FPmnOegHUEYi+vpURtwm8z9wHeoQw@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     Guillaume Nault <gnault@redhat.com>
Cc:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Next disconnect:

NOTE: c4:XX:XX:XX:XX:ed  is my wan interfaces MAC address

tcpdump -e -v -i eth1 vlan 3902 and pppoed
tcpdump: listening on eth1, link-type EN10MB (Ethernet), capture size
262144 bytes
** several PADO and PADS packet sent from server/AC to
44:4e:6d:fd:c7:39 before this, during the day **
05:03:44.348738 a4:7b:2c:9e:c7:44 (oui Unknown) > 00:0f:94:ef:64:e0
(oui Unknown), ethertype 802.1Q (0x8100), length 75: vlan 3902, p 1,
ethertype PPPoE D, PPPoE PADO [Service-Name] [AC-Name
"SIMB_TABOR_BNG1"] [Host-Uniq 0x960B0000] [AC-Cookie
0xDCC3248D61A5D76C7C1DD4138431B17C]
06:40:27.668095 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
(oui Unknown), ethertype 802.1Q (0x8100), length 101: vlan 3902, p 1,
ethertype PPPoE D, PPPoE PADO [Service-Name] [AC-Name
"SIMB_TABOR_BNG1"] [Host-Uniq
0x444E6DFDC739AAAAAAAA92000000AAAAAAAA4621426F78202020AAAAAAAA]
[AC-Cookie ".5b.u...~.F.mlKv"]
06:40:27.674078 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
(oui Unknown), ethertype 802.1Q (0x8100), length 62: vlan 3902, p 1,
ethertype PPPoE D, PPPoE PADS [ses 0x1] [Service-Name] [Host-Uniq
0x444E6DFDC739AAAAAAAA92000000AAAAAAAA4621426F78202020AAAAAAAA]
06:40:30.552119 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
(oui Unknown), ethertype 802.1Q (0x8100), length 60: vlan 3902, p 1,
ethertype PPPoE D, PPPoE PADT [ses 0x1]
06:40:31.158067 c4:XX:XX:XX:XX:ed (oui Unknown) > a4:7b:2c:9e:c7:44
(oui Unknown), ethertype 802.1Q (0x8100), length 52: vlan 3902, p 0,
ethertype PPPoE D, PPPoE PADT [ses 0x1] [Host-Uniq 0x000057CF]
[AC-Cookie 0xED891159D8A73577F9B098A2E3E36875]
tcpdump: pcap_loop: The interface went down
12 packets captured
12 packets received by filter
0 packets dropped by kernel


ip monitor link

[2020-04-29 06:40:30] 47: pppoe-wan: <POINTOPOINT,MULTICAST,NOARP> mtu
1492 qdisc fq_codel state DOWN group default
[2020-04-29 06:40:30]     link/ppp
[2020-04-29 06:40:31] Deleted 47: pppoe-wan:
<POINTOPOINT,MULTICAST,NOARP> mtu 1492 qdisc noop state DOWN group
default
[2020-04-29 06:40:31]     link/ppp
[2020-04-29 06:40:31] 46: eth1.3902@eth1: <BROADCAST,MULTICAST> mtu
1500 qdisc noqueue state DOWN group default
[2020-04-29 06:40:31]     link/ether c4:XX:XX:XX:XX:ed brd ff:ff:ff:ff:ff:ff
[2020-04-29 06:40:31] 3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu
1500 qdisc fq_codel state UP group default
[2020-04-29 06:40:31]     link/ether c4:XX:XX:XX:XX:ed brd ff:ff:ff:ff:ff:ff
[2020-04-29 06:40:31] Deleted 46: eth1.3902@eth1:
<BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default
[2020-04-29 06:40:31]     link/ether c4:XX:XX:XX:XX:ed brd ff:ff:ff:ff:ff:ff
[2020-04-29 06:40:31] 3: eth1: <BROADCAST,MULTICAST> mtu 1500 qdisc
fq_codel state DOWN group default
[2020-04-29 06:40:31]     link/ether c4:XX:XX:XX:XX:ed brd ff:ff:ff:ff:ff:ff
[2020-04-29 06:40:31] 3: eth1: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc
fq_codel state UP group default
[2020-04-29 06:40:31]     link/ether c4:XX:XX:XX:XX:ed brd ff:ff:ff:ff:ff:ff
[2020-04-29 06:40:31] 3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu
1500 qdisc fq_codel state UP group default
[2020-04-29 06:40:31]     link/ether c4:XX:XX:XX:XX:ed brd ff:ff:ff:ff:ff:ff
[2020-04-29 06:40:31] 48: eth1.3902@eth1: <BROADCAST,MULTICAST> mtu
1500 qdisc noop state DOWN group default
[2020-04-29 06:40:31]     link/ether c4:XX:XX:XX:XX:ed brd ff:ff:ff:ff:ff:ff
[2020-04-29 06:40:31] 3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu
1500 qdisc fq_codel state UP group default
[2020-04-29 06:40:31]     link/ether c4:XX:XX:XX:XX:ed brd ff:ff:ff:ff:ff:ff
[2020-04-29 06:40:31] 48: eth1.3902@eth1:
<BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UNKNOWN
group default
[2020-04-29 06:40:31]     link/ether c4:XX:XX:XX:XX:ed brd ff:ff:ff:ff:ff:ff
[2020-04-29 06:40:31] 3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu
1500 qdisc fq_codel state UP group default
[2020-04-29 06:40:31]     link/ether c4:XX:XX:XX:XX:ed brd ff:ff:ff:ff:ff:ff
[2020-04-29 06:40:31] 49: ppp0: <POINTOPOINT,MULTICAST,NOARP> mtu 1500
qdisc noop state DOWN group default
[2020-04-29 06:40:31]     link/ppp
[2020-04-29 06:40:31] 49: pppoe-wan: <POINTOPOINT,MULTICAST,NOARP> mtu
1500 qdisc noop state DOWN group default
[2020-04-29 06:40:31]     link/ppp
[2020-04-29 06:40:32] 48: eth1.3902@eth1:
<BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP
group default
[2020-04-29 06:40:32]     link/ether c4:XX:XX:XX:XX:ed brd ff:ff:ff:ff:ff:ff
[2020-04-29 06:40:34] 49: pppoe-wan: <POINTOPOINT,MULTICAST,NOARP> mtu
1492 qdisc noop state DOWN group default
[2020-04-29 06:40:34]     link/ppp
[2020-04-29 06:40:35] 49: pppoe-wan:
<POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1492 qdisc fq_codel
state UNKNOWN group default
[2020-04-29 06:40:35]     link/ppp


syslog:

Wed Apr 29 02:36:07 2020 daemon.info dnsmasq-dhcp[1565]:
DHCPREQUEST(br-lan) 192.168.1.197 XX:XX:XX:XX:XX:XX
Wed Apr 29 02:36:07 2020 daemon.info dnsmasq-dhcp[1565]:
DHCPACK(br-lan) 192.168.1.197 XX:XX:XX:XX:XX:XX ffoo
Wed Apr 29 05:21:53 2020 daemon.info dnsmasq-dhcp[1565]:
DHCPREQUEST(br-lan) 192.168.1.111 XX:XX:XX:XX:XX:XX
Wed Apr 29 05:21:53 2020 daemon.info dnsmasq-dhcp[1565]:
DHCPACK(br-lan) 192.168.1.111 XX:XX:XX:XX:XX:XX bar
Wed Apr 29 05:53:34 2020 daemon.info dnsmasq-dhcp[1565]:
DHCPREQUEST(br-lan) 192.168.1.217 XX:XX:XX:XX:XX:XX
Wed Apr 29 05:53:34 2020 daemon.info dnsmasq-dhcp[1565]:
DHCPACK(br-lan) 192.168.1.217 XX:XX:XX:XX:XX:XX baz
Wed Apr 29 06:01:46 2020 daemon.info dnsmasq-dhcp[1565]:
DHCPREQUEST(br-lan) 192.168.1.225 XX:XX:XX:XX:XX:XX
Wed Apr 29 06:01:46 2020 daemon.info dnsmasq-dhcp[1565]:
DHCPACK(br-lan) 192.168.1.225 XX:XX:XX:XX:XX:XX foobar
Wed Apr 29 06:36:11 2020 daemon.info dnsmasq-dhcp[1565]:
DHCPREQUEST(br-lan) 192.168.1.193 XX:XX:XX:XX:XX:XX
Wed Apr 29 06:36:11 2020 daemon.info dnsmasq-dhcp[1565]:
DHCPACK(br-lan) 192.168.1.193 XX:XX:XX:XX:XX:XX barfoo
Wed Apr 29 06:40:30 2020 daemon.notice pppd[22479]: Modem hangup
Wed Apr 29 06:40:30 2020 daemon.info pppd[22479]: Connect time 2351.5 minutes.
Wed Apr 29 06:40:30 2020 daemon.info pppd[22479]: Sent 524878898
bytes, received 2649683636 bytes.
Wed Apr 29 06:40:30 2020 daemon.notice netifd: Network device
'pppoe-wan' link is down
Wed Apr 29 06:40:30 2020 daemon.debug pppd[22479]: Script
/lib/netifd/ppp-down started (pid 9434)
Wed Apr 29 06:40:31 2020 daemon.notice pppd[22479]: Connection terminated.
Wed Apr 29 06:40:31 2020 daemon.debug pppd[22479]: Send PPPOE
Discovery V1T1 PADT session 0x1 length 28
Wed Apr 29 06:40:31 2020 daemon.debug pppd[22479]:  dst
a4:7b:2c:9e:c7:44  src c4:XX:XX:XX:XX:ed
Wed Apr 29 06:40:31 2020 daemon.debug pppd[22479]:  [host-uniq  00 00
57 cf] [AC-cookie  ed 89 11 59 d8 a7 35 77 f9 b0 98 a2 e3 e3 68 75]
Wed Apr 29 06:40:31 2020 daemon.info pppd[22479]: Sent PADT
Wed Apr 29 06:40:31 2020 daemon.debug pppd[22479]: Waiting for 1 child
processes...
Wed Apr 29 06:40:31 2020 daemon.debug pppd[22479]:   script
/lib/netifd/ppp-down, pid 9434
Wed Apr 29 06:40:31 2020 daemon.notice netifd: Interface 'wan' has
lost the connection
Wed Apr 29 06:40:31 2020 daemon.warn dnsmasq[1565]: no servers found
in /tmp/resolv.conf.auto, will retry
Wed Apr 29 06:40:31 2020 daemon.debug pppd[22479]: Script
/lib/netifd/ppp-down finished (pid 9434), status = 0x1
Wed Apr 29 06:40:31 2020 daemon.info pppd[22479]: Exit.
Wed Apr 29 06:40:31 2020 daemon.notice netifd: Interface 'wan' is now down
Wed Apr 29 06:40:31 2020 kern.info kernel: [825025.766137] IPv6:
ADDRCONF(NETDEV_UP): eth1.3902: link is not ready
Wed Apr 29 06:40:31 2020 kern.info kernel: [825025.781197] eth1: link down
Wed Apr 29 06:40:31 2020 daemon.notice netifd: Interface 'wan' is disabled
Wed Apr 29 06:40:31 2020 kern.info kernel: [825025.815043] IPv6:
ADDRCONF(NETDEV_UP): eth1: link is not ready
Wed Apr 29 06:40:31 2020 kern.info kernel: [825025.822423] eth1: link
up (1000Mbps/Full duplex)
Wed Apr 29 06:40:31 2020 kern.info kernel: [825025.844083] IPv6:
ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
Wed Apr 29 06:40:31 2020 daemon.notice netifd: Interface 'wan' is enabled
Wed Apr 29 06:40:31 2020 daemon.notice netifd: Interface 'wan' is setting up now
Wed Apr 29 06:40:31 2020 kern.info kernel: [825026.010950] device eth1
left promiscuous mode
Wed Apr 29 06:40:31 2020 daemon.err insmod: module is already loaded - slhc
Wed Apr 29 06:40:31 2020 daemon.err insmod: module is already loaded -
ppp_generic
Wed Apr 29 06:40:31 2020 daemon.err insmod: module is already loaded - pppox
Wed Apr 29 06:40:31 2020 daemon.err insmod: module is already loaded - pppoe
Wed Apr 29 06:40:31 2020 daemon.info pppd[9495]: Plugin rp-pppoe.so loaded.
Wed Apr 29 06:40:31 2020 daemon.info pppd[9495]: RP-PPPoE plugin
version 3.8p compiled against pppd 2.4.7
Wed Apr 29 06:40:31 2020 daemon.notice pppd[9495]: pppd 2.4.7 started
by root, uid 0
Wed Apr 29 06:40:31 2020 daemon.debug pppd[9495]: Send PPPOE Discovery
V1T1 PADI session 0x0 length 12
Wed Apr 29 06:40:31 2020 daemon.debug pppd[9495]:  dst
ff:ff:ff:ff:ff:ff  src c4:XX:XX:XX:XX:ed
Wed Apr 29 06:40:31 2020 daemon.debug pppd[9495]:  [service-name]
[host-uniq  00 00 25 17]
Wed Apr 29 06:40:31 2020 daemon.debug pppd[9495]: Recv PPPOE Discovery
V1T1 PADO session 0x0 length 51
Wed Apr 29 06:40:31 2020 daemon.debug pppd[9495]:  dst
c4:XX:XX:XX:XX:ed  src a4:7b:2c:9e:c7:44
Wed Apr 29 06:40:31 2020 daemon.debug pppd[9495]:  [service-name]
[AC-name SIMB_TABOR_BNG1] [host-uniq  00 00 25 17] [AC-cookie  ed 89
11 59 d8 a7 35 77 f9 b0 98 a2 e3 e3 68 75]
Wed Apr 29 06:40:31 2020 daemon.debug pppd[9495]: Send PPPOE Discovery
V1T1 PADR session 0x0 length 32
Wed Apr 29 06:40:31 2020 daemon.debug pppd[9495]:  dst
a4:7b:2c:9e:c7:44  src c4:XX:XX:XX:XX:ed
Wed Apr 29 06:40:31 2020 daemon.debug pppd[9495]:  [service-name]
[host-uniq  00 00 25 17] [AC-cookie  ed 89 11 59 d8 a7 35 77 f9 b0 98
a2 e3 e3 68 75]
Wed Apr 29 06:40:31 2020 daemon.debug pppd[9495]: Recv PPPOE Discovery
V1T1 PADS session 0x1 length 12
Wed Apr 29 06:40:31 2020 daemon.debug pppd[9495]:  dst
c4:XX:XX:XX:XX:ed  src a4:7b:2c:9e:c7:44
Wed Apr 29 06:40:31 2020 daemon.debug pppd[9495]:  [service-name]
[host-uniq  00 00 25 17]
Wed Apr 29 06:40:31 2020 daemon.debug pppd[9495]: PADS: Service-Name: ''
Wed Apr 29 06:40:31 2020 daemon.info pppd[9495]: PPP session is 1
Wed Apr 29 06:40:31 2020 daemon.warn pppd[9495]: Connected to
a4:7b:2c:9e:c7:44 via interface eth1.3902
Wed Apr 29 06:40:31 2020 daemon.debug pppd[9495]: using channel 20
Wed Apr 29 06:40:31 2020 kern.info kernel: [825026.248151] pppoe-wan:
renamed from ppp0
Wed Apr 29 06:40:31 2020 daemon.info pppd[9495]: Renamed interface
ppp0 to pppoe-wan
Wed Apr 29 06:40:31 2020 daemon.info pppd[9495]: Using interface pppoe-wan
Wed Apr 29 06:40:31 2020 daemon.notice pppd[9495]: Connect: pppoe-wan
<--> eth1.3902
Wed Apr 29 06:40:31 2020 daemon.debug pppd[9495]: sent [LCP ConfReq
id=0x1 <mru 1492> <magic 0x5455b2ef>]
Wed Apr 29 06:40:31 2020 daemon.debug pppd[9495]: rcvd [LCP ConfAck
id=0x1 <mru 1492> <magic 0x5455b2ef>]
Wed Apr 29 06:40:34 2020 daemon.debug pppd[9495]: rcvd [LCP ConfReq
id=0x22 <mru 1492> <auth chap MD5> <magic 0x3b0f63c8>]
Wed Apr 29 06:40:34 2020 daemon.debug pppd[9495]: sent [LCP ConfAck
id=0x22 <mru 1492> <auth chap MD5> <magic 0x3b0f63c8>]
Wed Apr 29 06:40:34 2020 daemon.debug pppd[9495]: sent [LCP EchoReq
id=0x0 magic=0x5455b2ef]
Wed Apr 29 06:40:34 2020 daemon.debug pppd[9495]: rcvd [CHAP Challenge
id=0x1 <5f38**********************************************5423>, name
= "SIMB_TABOR_BNG1"]
Wed Apr 29 06:40:34 2020 daemon.debug pppd[9495]: sent [CHAP Response
id=0x1 <c02**********************e9f>, name = "username"]
Wed Apr 29 06:40:34 2020 daemon.debug pppd[9495]: rcvd [LCP EchoRep
id=0x0 magic=0x3b0f63c8]
Wed Apr 29 06:40:34 2020 daemon.debug pppd[9495]: rcvd [CHAP Success
id=0x1 "CHAP authentication success"]
Wed Apr 29 06:40:34 2020 daemon.info pppd[9495]: CHAP authentication
succeeded: CHAP authentication success
Wed Apr 29 06:40:34 2020 daemon.notice pppd[9495]: CHAP authentication succeeded
Wed Apr 29 06:40:34 2020 daemon.notice pppd[9495]: peer from calling
number A4:7B:2C:9E:C7:44 authorized
Wed Apr 29 06:40:35 2020 daemon.debug pppd[9495]: sent [IPCP ConfReq
id=0x1 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns2 0.0.0.0>]
Wed Apr 29 06:40:35 2020 daemon.debug pppd[9495]: rcvd [IPCP ConfReq
id=0x2d <addr 94.127.30.0>]
Wed Apr 29 06:40:35 2020 daemon.debug pppd[9495]: sent [IPCP ConfAck
id=0x2d <addr 94.127.30.0>]
Wed Apr 29 06:40:35 2020 daemon.debug pppd[9495]: rcvd [IPCP ConfNak
id=0x1 <addr 146.X.Y.Z> <ms-dns1 212.18.32.10> <ms-dns2 212.18.32.12>]
Wed Apr 29 06:40:35 2020 daemon.debug pppd[9495]: sent [IPCP ConfReq
id=0x2 <addr 146.X.Y.Z> <ms-dns1 212.18.32.10> <ms-dns2 212.18.32.12>]
Wed Apr 29 06:40:35 2020 daemon.debug pppd[9495]: rcvd [IPCP ConfAck
id=0x2 <addr 146.X.Y.Z> <ms-dns1 212.18.32.10> <ms-dns2 212.18.32.12>]
Wed Apr 29 06:40:35 2020 daemon.notice pppd[9495]: local  IP address 146.X.Y.Z
Wed Apr 29 06:40:35 2020 daemon.notice pppd[9495]: remote IP address 94.127.30.0
Wed Apr 29 06:40:35 2020 daemon.notice pppd[9495]: primary   DNS
address 212.18.32.10
Wed Apr 29 06:40:35 2020 daemon.notice pppd[9495]: secondary DNS
address 212.18.32.12
Wed Apr 29 06:40:35 2020 daemon.debug pppd[9495]: Script
/lib/netifd/ppp-up started (pid 9560)
Wed Apr 29 06:40:35 2020 daemon.notice netifd: Network device
'pppoe-wan' link is up
Wed Apr 29 06:40:35 2020 daemon.notice netifd: Interface 'wan' is now up
Wed Apr 29 06:40:35 2020 daemon.info dnsmasq[1565]: reading
/tmp/resolv.conf.auto
Wed Apr 29 06:40:35 2020 daemon.info dnsmasq[1565]: using local
addresses only for domain test
Wed Apr 29 06:40:35 2020 daemon.info dnsmasq[1565]: using local
addresses only for domain onion
Wed Apr 29 06:40:35 2020 daemon.info dnsmasq[1565]: using local
addresses only for domain localhost
Wed Apr 29 06:40:35 2020 daemon.info dnsmasq[1565]: using local
addresses only for domain local
Wed Apr 29 06:40:35 2020 daemon.info dnsmasq[1565]: using local
addresses only for domain invalid
Wed Apr 29 06:40:35 2020 daemon.info dnsmasq[1565]: using local
addresses only for domain bind
Wed Apr 29 06:40:35 2020 daemon.info dnsmasq[1565]: using local
addresses only for domain lan
Wed Apr 29 06:40:35 2020 daemon.info dnsmasq[1565]: using nameserver
212.18.32.10#53
Wed Apr 29 06:40:35 2020 daemon.info dnsmasq[1565]: using nameserver
212.18.32.12#53
Wed Apr 29 06:40:35 2020 daemon.debug pppd[9495]: Script
/lib/netifd/ppp-up finished (pid 9560), status = 0x1
Wed Apr 29 06:40:36 2020 user.notice firewall: Reloading firewall due
to ifup of wan (pppoe-wan)
Wed Apr 29 08:07:42 2020 daemon.info dnsmasq-dhcp[1565]:
DHCPREQUEST(br-lan) 192.168.1.197 XX:XX:XX:XX:XX:XX


Regards,
David
