Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993401B77E1
	for <lists+linux-ppp@lfdr.de>; Fri, 24 Apr 2020 16:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbgDXODG (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 24 Apr 2020 10:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728177AbgDXODF (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 24 Apr 2020 10:03:05 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC29C09B045
        for <linux-ppp@vger.kernel.org>; Fri, 24 Apr 2020 07:03:05 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id y10so9520891uao.8
        for <linux-ppp@vger.kernel.org>; Fri, 24 Apr 2020 07:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=wDhj2wKPHYnulFvIW9b6XB+kEUV59C1g4loV4sGL2Ps=;
        b=SOOX/xAv/PCBgTq1KVgpVsZeB5o3ufhNEK+dvW4PVvhQh2SPWFPeIcD0mqOE2x4Mwn
         Y8jWthy1zuiov8xtagidIdgGdcy59mAR7guv236c7suWJWs4Qb4WrECc2SiixQ9tUPgb
         K1pm18TybjUM14ra7sEQ++APzACxHLLMxV/mBkHxCBWIJuH7WqUTSEK2Jko349EEcn2w
         3kxY66lqGHwS9yzOAdx8att0bIu8YX25gAffAm1IVFcaNx0JTb3uFyTKxCeFsAhTtc7t
         K4zDDDNEPG5sh0xjMkZoP5BDt9xhkbyIJ3CQ3ERINz2UjrIrKl53aJg43hmpslHXQoeA
         DMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=wDhj2wKPHYnulFvIW9b6XB+kEUV59C1g4loV4sGL2Ps=;
        b=rpAQ6AXR5z8cAmLjcndSY4ue+fLdVHefozk7aIr6dXMUX/oXP+ChMexHDnzeK7bPxw
         aHoaQEmIkNHthPQ5HMNbyWVPLEuoueE2ba6TW50GoGvno390p3DvY2ExcPXz83bJiCi5
         0Z8BhGZtJJlxB+vGAJynvUoxkJFtwanktPgrIcgmFtrfV9NQIc/i20bhHGpBcM0Is4b3
         OVfGq/zWyOwhrbMPZHttRXLF0LzhnvTeAFJHRb/gl4a0xoU930xsT/H79cv7Ml0WFeFS
         pCbVqnzcNgabbHnTf1ExW/nS/9bDUA6WbmNDFHPKtmX7JJLIGC2eVumOSOJzQim7EzGL
         cyFw==
X-Gm-Message-State: AGi0PuaJF4TttbXs3296UFWi09lzdF1DQT0Nsc7qsMlSWcc/zYfYMpAp
        lUTUcp7jV5VJYqygrpCevUBmuIfrPZxxU8QoOWRR+QWgQ+o=
X-Google-Smtp-Source: APiQypIjA03fO2uowjrlhRuBCzk0pNqZmanKcmIINmeH9phxaVeoDNBSt8NOD74q6MmKps3nBF6pKR3osQpKa1CfOX4=
X-Received: by 2002:a67:1582:: with SMTP id 124mr7952149vsv.113.1587736984151;
 Fri, 24 Apr 2020 07:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com> <21061.1587602497@localhost>
 <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com> <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
 <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
 <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
 <7689.1587657698@localhost> <CAPJ9Yc9rdbwd0OTcJhmuqG_r6qPfYKwiScLOxiwe41_ye_PNGw@mail.gmail.com>
 <CAPJ9Yc9uuOKk=fh3Ke7riuZN2JgB2Ma3F2Njy69_6nms1kC=bQ@mail.gmail.com> <CAPJ9Yc_iOxyDzrL9cs_ERSEjnVttYgk4JFqhO7T=yg03420LMA@mail.gmail.com>
In-Reply-To: <CAPJ9Yc_iOxyDzrL9cs_ERSEjnVttYgk4JFqhO7T=yg03420LMA@mail.gmail.com>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Fri, 24 Apr 2020 16:02:52 +0200
Message-ID: <CAPJ9Yc8O5t9ak_AB51We6w=EnURkbUjS1hXDHAuCroGLjeUxOg@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Sorry for another post, but I just noticed I had a disconnect again,
this time I captured the LCP traffic with: tcpdump -evpni eth1.3902
'not ether[0x14:2] =3D 0x21 and not ether[0x14:2] =3D 0x57'


10:42:01.795885 c4:xx:xx:xx:xx:ed > a4:xx:xx:xx:xx:44, ethertype PPPoE
S (0x8864), length 30: PPPoE  [ses 0x1] LCP (0xc021), length 10: LCP,
Echo-Request (0x09), id 20, length 10
        encoded length 8 (=3DOption(s) length 4)
          Magic-Num 0x277f6119
10:42:01.807239 a4:xx:xx:xx:xx:44 > c4:xx:xx:xx:xx:ed, ethertype PPPoE
S (0x8864), length 56: PPPoE  [ses 0x1] LCP (0xc021), length 10: LCP,
Echo-Reply (0x0a), id 20, length 10
        encoded length 8 (=3DOption(s) length 4)
          Magic-Num 0x631aa5be
10:42:04.799255 c4:xx:xx:xx:xx:ed > a4:xx:xx:xx:xx:44, ethertype PPPoE
S (0x8864), length 30: PPPoE  [ses 0x1] LCP (0xc021), length 10: LCP,
Echo-Request (0x09), id 21, length 10
        encoded length 8 (=3DOption(s) length 4)
          Magic-Num 0x277f6119
10:42:04.809234 a4:xx:xx:xx:xx:44 > c4:xx:xx:xx:xx:ed, ethertype PPPoE
S (0x8864), length 56: PPPoE  [ses 0x1] LCP (0xc021), length 10: LCP,
Echo-Reply (0x0a), id 21, length 10
        encoded length 8 (=3DOption(s) length 4)
          Magic-Num 0x631aa5be
10:42:06.801533 c4:xx:xx:xx:xx:ed > a4:xx:xx:xx:xx:44, ethertype PPPoE
S (0x8864), length 30: PPPoE  [ses 0x1] LCP (0xc021), length 10: LCP,
Echo-Request (0x09), id 22, length 10
        encoded length 8 (=3DOption(s) length 4)
          Magic-Num 0x277f6119
10:42:06.807236 a4:xx:xx:xx:xx:44 > c4:xx:xx:xx:xx:ed, ethertype PPPoE
S (0x8864), length 56: PPPoE  [ses 0x1] LCP (0xc021), length 10: LCP,
Echo-Reply (0x0a), id 22, length 10
        encoded length 8 (=3DOption(s) length 4)
          Magic-Num 0x631aa5be
10:42:08.803817 c4:xx:xx:xx:xx:ed > a4:xx:xx:xx:xx:44, ethertype PPPoE
S (0x8864), length 30: PPPoE  [ses 0x1] LCP (0xc021), length 10: LCP,
Echo-Request (0x09), id 23, length 10
        encoded length 8 (=3DOption(s) length 4)
          Magic-Num 0x277f6119
10:42:08.817232 a4:xx:xx:xx:xx:44 > c4:xx:xx:xx:xx:ed, ethertype PPPoE
S (0x8864), length 56: PPPoE  [ses 0x1] LCP (0xc021), length 10: LCP,
Echo-Reply (0x0a), id 23, length 10
        encoded length 8 (=3DOption(s) length 4)
          Magic-Num 0x631aa5be
tcpdump: pcap_loop: The interface went down
52753 packets captured
52760 packets received by filter
0 packets dropped by kernel

ppp log:


Fri Apr 24 10:42:32 2020 daemon.notice pppd[11986]: Modem hangup
Fri Apr 24 10:42:32 2020 daemon.info pppd[11986]: Connect time 979.3 minute=
s.
Fri Apr 24 10:42:32 2020 daemon.info pppd[11986]: Sent 325423487
bytes, received 1643504692 bytes.

It seems echo requests come more often towards the end, almost every
second. Earlier they are also irregular, but come at 30-60 second
intervals.



On Fri, 24 Apr 2020 at 15:47, David Bala=C5=BEic <xerces9@gmail.com> wrote:
>
> On Thu, 23 Apr 2020 at 21:36, David Bala=C5=BEic <xerces9@gmail.com> wrot=
e:
> >
> > OK, more data:
> > I started tcpdump with the -e option as suggested on openwrt forum:
> > tcpdump -e -v -i eth1.3902 pppoed
> >
> > on disconnect, this was logged (times are UTC):
> >
> >
> > tcpdump: listening on eth1.3902, link-type EN10MB (Ethernet), capture
> > size 262144 bytes
> > 18:23:09.204991 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
> > (oui Unknown), ethertype PPPoE D (0x8863), length 97: PPPoE PADO
> > [Service-Name] [AC-Name "SIMB_TABOR_BNG1"] [Host-Uniq
> > 0x44************long_number******************************AA]
> > [AC-Cookie ".5b************v"]
>
> Isnt this strange? The dst addr is not my router or any other known.
> Also the Host-Uniq value is different.
> As if is traffic meant for someone else.
