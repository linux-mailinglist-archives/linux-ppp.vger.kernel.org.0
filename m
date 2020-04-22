Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5428E1B4C11
	for <lists+linux-ppp@lfdr.de>; Wed, 22 Apr 2020 19:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgDVRpZ (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 22 Apr 2020 13:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726060AbgDVRpY (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 22 Apr 2020 13:45:24 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB62C03C1A9
        for <linux-ppp@vger.kernel.org>; Wed, 22 Apr 2020 10:45:24 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id c17so2584410uae.12
        for <linux-ppp@vger.kernel.org>; Wed, 22 Apr 2020 10:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=RD4KhO9cpC4y7rgrSF3OBrtdL0LZO7TvFX8EhWiK5Ew=;
        b=mKsMC3DLq2GqlWKQmEmvGRa1m62MyFvjXe1Vomk2w3J7PIaWnVSzMTNegYMNGKQ+Oe
         /bLbjUBGeR/egVZKDWOQljYJwS0YFWOquIHd609jTG/EDkogsqe/DcNkJ1pO8yLipadP
         PaOILT1SpK72/BikbirQjTHP/bALswtOcDYZOogI+jq7EfFuZR2s+LZKDfi/OfkWwZMq
         vSxKEp5bm72x+E2yEneOjhb+jguzvfnpQYrSOLRKY1rpeV73chotx0SQkvwvVB/ImWPj
         h1FMCRBY0Tpr5zJy54yUXXoqIGEbWoE4ZsPqZPx8oneqpaDh9d7TVIeGNVDQQq9Yc89q
         OSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=RD4KhO9cpC4y7rgrSF3OBrtdL0LZO7TvFX8EhWiK5Ew=;
        b=FWF6hKQmm5q4Dk9KwbqE2wiTRQjNHfas0Vy2ymMxKsaR03whuE96dNbjaQtdLRe8Vu
         BYkfP0U1eqZTCse26fSRQgnDnmVGLj2ckjlurqImcSFWspaPpqNyYqA5ZWltqos9UzoE
         INJBMnsIe44+w5bGmmdXmnabCRiftHdk0XeBULKDbWwcNbfSC5Ws2oQAOs2/goDSLorL
         io82/OcAUCsoB6i1EuFKe7kZ4J5f678fVVbtVxB2N2DEkKbtvHHaaKZ7JVLM1Ww07dNL
         DGQpviJ9ZQrh6T4PiCYk7NbJ9uGG8zI1kPd+dWTN0lxjU7l0FOZ0HIKvQlrZ8PRFqojX
         kXyQ==
X-Gm-Message-State: AGi0PuaAROrtJJXga7gyQOhZaM3qu71FTxYOFSzjiSmiMZ7+A78RH292
        +cEc/FJD8KkVl/buF1glinrm/BilwVc4NuWEfDoHpjM25fw=
X-Google-Smtp-Source: APiQypLNPUt3p2ysdNB+/l2zcrcFAwIo0y26PhH9eHveEMmNQAfaadu/qQaADGrqzkw6qJglMncWq2B54C5+NNz38aA=
X-Received: by 2002:a67:eb17:: with SMTP id a23mr21890873vso.111.1587577522953;
 Wed, 22 Apr 2020 10:45:22 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Wed, 22 Apr 2020 19:45:12 +0200
Message-ID: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
Subject: PPPoE Modem hangup after random time - how to debug?
To:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hi!

I have a router running openwrt connected to a GPON ONT, running a
PPPoE connection (hw details below).

The problem is, that after some random time one to 20 hours, the
connection breaks. Then in about a minute it reconnects (successfully,
each time).
This happens almost every day.

I enabled the debug option, but there is nothing useful in the logs:

** there is nothing related before this line **
Tue Apr 21 10:04:32 2020 daemon.notice pppd[6515]: Modem hangup
Tue Apr 21 10:04:32 2020 daemon.info pppd[6515]: Connect time 1094.4 minutes.
Tue Apr 21 10:04:32 2020 daemon.info pppd[6515]: Sent 612360704 bytes,
received 3423392867 bytes.
Tue Apr 21 10:04:32 2020 daemon.notice netifd: Network device
'pppoe-wan' link is down
Tue Apr 21 10:04:32 2020 daemon.debug pppd[6515]: Script
/lib/netifd/ppp-down started (pid 7655)
Tue Apr 21 10:04:32 2020 daemon.notice pppd[6515]: Connection terminated.
Tue Apr 21 10:04:32 2020 daemon.debug pppd[6515]: Send PPPOE Discovery
V1T1 PADT session 0x1 length 28
Tue Apr 21 10:04:32 2020 daemon.debug pppd[6515]:  dst
a4:xx:xx:xx:xx:44  src c4:xx:xx:xx:xx:ed
Tue Apr 21 10:04:32 2020 daemon.debug pppd[6515]:  [host-uniq  00 00
19 73] [AC-cookie  ed 89 xx xx xx xx xx xx xx xx xx xx xx xx xx 75]
Tue Apr 21 10:04:32 2020 daemon.info pppd[6515]: Sent PADT
Tue Apr 21 10:04:32 2020 daemon.debug pppd[6515]: Waiting for 1 child
processes...
Tue Apr 21 10:04:32 2020 daemon.debug pppd[6515]:   script
/lib/netifd/ppp-down, pid 7655
Tue Apr 21 10:04:32 2020 daemon.debug pppd[6515]: Script
/lib/netifd/ppp-down finished (pid 7655), status = 0x1
Tue Apr 21 10:04:32 2020 daemon.info pppd[6515]: Exit.


The command line is:

 /usr/sbin/pppd nodetach ipparam wan ifname pppoe-wan
lcp-echo-interval 1 lcp-echo-failure 5 lcp-echo-adaptive +ipv6 set
AUTOIPV6=1 nodefaultroute usepeerdns maxfail 1 user XXXXXX password
YYYYYY ip-up-script /lib/netifd/ppp-up ipv6-up-script
/lib/netifd/ppp6-up ip-down-script /lib/netifd/ppp-down
ipv6-down-script /lib/netifd/ppp-down mtu 1492 mru 1492 plugin
rp-pppoe.so nic-eth1.3902

(the PPPoE goes over VLAN 3902, pppd version is  2.4.7)

I wrote about this on the openwrt forum [1], not much progress unfortunately.

Any ides? How to proceed? Sniff packets?

What does normally prompt pppd to to print "Modem hangup" ?

Thanks in advance,
David

[1] https://forum.openwrt.org/t/pppoe-disconnects-every-few-hours/61239

Setup details:

ONT: Innbox G21 (provided by ISP)
router: Netgear WNDR 3700v2 running OpenWRT 19.7.2
ISP provided router (not in use): Ubee TVW625  - I did not see such
disconnections when using this router (I ran a script calling ping in
a loop, for days, logging output, not problem except a lost (single)
packet every now and then)
