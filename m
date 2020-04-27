Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD571BA0A5
	for <lists+linux-ppp@lfdr.de>; Mon, 27 Apr 2020 11:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgD0J7i (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 27 Apr 2020 05:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726537AbgD0J7i (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 27 Apr 2020 05:59:38 -0400
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F18C0610D5
        for <linux-ppp@vger.kernel.org>; Mon, 27 Apr 2020 02:59:38 -0700 (PDT)
Received: by mail-ua1-x929.google.com with SMTP id y10so16696655uao.8
        for <linux-ppp@vger.kernel.org>; Mon, 27 Apr 2020 02:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=E5FR/vTYBwV7C7despNpuNc/th3RGQUqZNAsHw6VSoQ=;
        b=DnL9kekv8Govk6FKxt+AxPZIZfyX/qe/6cUYtTskISd3BgOiFcE1rJ6agXiAfjAyHi
         JV343jqPVdq0u+KlkCXy+JzNsraze5t6DLhiE0pUUKrL7tR4Wqu8wYxxBPW4UujQEHP1
         uF72jaL3RA7/vePKlzPBTw9ToXgwdmzZG9G90OHQ6343vyHXGqtZxKY2Q/DwMGdbk+UA
         GeTbZBU+jtYuk275MCAXZ2NiHhiak55Yd2fhFugstzrTgU0OfR3Y4YO1YYlCl12H65Cy
         vcqDpsrd6YmhEuMUgAExcvVYW1bfpg+iWzp1usRzMcY/UiqQM0B6X/7b7nkj5KdyvF/z
         QBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=E5FR/vTYBwV7C7despNpuNc/th3RGQUqZNAsHw6VSoQ=;
        b=EnQRN+zi6XPxP5AJ9v/yOpHuEpGgZkgkDVvHlDjUa0YIKCXdYrmx8Ldvl91XjIq9mg
         9FTur+2AoYctaXRLbNPZSZkrx7YJQWudNecrr8xqAeZh89tc5B06ukqVMB/bTVbgxnqY
         6qjvbsDxCoNfgOp+4kw03iuMEVAaQeSfocvqlsCXulNqg8Qgi74RhWuTzIPZ7nunh7FL
         vibPqG1a+vCuc/GUDYvOr7M3fu3kJjmjI7hUF5f8U+BlY9za3QzcGG+9Yo/rtEA/ziUG
         wPiaIxG8JzGj0T7BMQE1fqSKx1iLPol1Jp6md49a3hTQExouPpCh5gNMrL2FIXyO9En/
         d//Q==
X-Gm-Message-State: AGi0PuYyYO1ZQgTFdu2LKn2LMN4fG9X2/czQbmoh271jJXMS7U/QCyBh
        2BwVdang+ssJZLYe8IEJ2BbFiIxO3iItV4ZmA2TTAIjiUlw=
X-Google-Smtp-Source: APiQypKRgUwESunpsl/z4xRij5ptqGqNIPpu6gPSoc8kJ7FBz0ztHBoCJBmyi/c47sCZsjVBN2qpDZf2tQZLCcEeOxA=
X-Received: by 2002:a67:ea93:: with SMTP id f19mr16750255vso.216.1587981576458;
 Mon, 27 Apr 2020 02:59:36 -0700 (PDT)
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
 <CAPJ9Yc8AQZnATT07zUC0397vSGCuuh8STyQRbdBk5LLPp3Xfyg@mail.gmail.com> <5466.1587953651@localhost>
In-Reply-To: <5466.1587953651@localhost>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Mon, 27 Apr 2020 11:59:25 +0200
Message-ID: <CAPJ9Yc_9E5PjDf7duYusKo3KnQ8kXUA7xkdiNgc2Vtsu3ufEUg@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     Michael Richardson <mcr@sandelman.ca>
Cc:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Mon, 27 Apr 2020 at 04:14, Michael Richardson <mcr@sandelman.ca> wrote:
>
>
> David Bala=C5=BEic <xerces9@gmail.com> wrote:
>     > Sun Apr 26 17:34:57 2020 daemon.debug pppd[20289]: sent [IPV6CP
>     > ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
>     > Sun Apr 26 17:35:00 2020 daemon.debug pppd[20289]: sent [IPV6CP
>     > ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
>     > Sun Apr 26 17:35:03 2020 daemon.debug pppd[20289]: sent [IPV6CP
>     > ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
>     > Sun Apr 26 17:35:06 2020 daemon.debug pppd[20289]: sent [IPV6CP
>     > ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
>     > Sun Apr 26 17:35:09 2020 daemon.warn pppd[20289]: IPV6CP: timeout
>     > sending Config-Requests
>
> Could this be the reason for the hangup?
> pppd gets tired of no IPv6, decides it should hangup?

These lines are logged in the 30 seconds after the connection is
established. Later they never show up. It was like that for all
connections thus far.

>     > The strange part is in the tcpdump there is a PADT sent to an
>     > "unknown" MAC and my pppd responds. At least that is how I see it.
>
>     > You think NOT putting the interface into promiscuous mode (done by
>     > tcpdump) would prevent this?
>     > Anyway, now I startted tcpdump with the -p option:  tcpdump -e -v -=
p
>     > -i eth1 vlan 3902 and pppoed
>
> It could be that promisc mode (no -p) means that the PADT makes something
> break, different than what you are investigating.  -p avoid promisc mode,=
 so
> would avoid seeing that packet.
>
> You mention in another thread that you were trying to do DHCPv6 on a
> different (non-PPPoE) interface.  I don't see how that would matter unles=
s
> the failure caused netifd to decide to retry it all.
>
> It seems that you ought to try the noipv6 option to pppd.

I removed it (from the system config, the file /etc/config/network ).
I also removed that "other interface", so there is no IPv6 stuff left.
The new command line is:
/usr/sbin/pppd nodetach ipparam wan ifname pppoe-wan lcp-echo-interval
1 lcp-echo-failure 5 lcp-echo-adaptive nodefaultroute usepeerdns
maxfail 1 user YYYYYY password XXXXX ip-up-script /lib/netifd/ppp-up
ip-down-script /lib/netifd/ppp-down mtu 1492 mru 1492 plugin
rp-pppoe.so nic-eth1.3902

For the record: The new connection with new settings was started on
Mon Apr 27 09:47:48 (UTC)
