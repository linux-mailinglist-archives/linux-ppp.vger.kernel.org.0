Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C75F532664
	for <lists+linux-ppp@lfdr.de>; Tue, 24 May 2022 11:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234618AbiEXJ3D (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 24 May 2022 05:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234344AbiEXJ3C (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Tue, 24 May 2022 05:29:02 -0400
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com [136.143.188.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0841D3336E
        for <linux-ppp@vger.kernel.org>; Tue, 24 May 2022 02:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653384540; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=AtQ76/65D80MdNEitoT8StdKv/vXFRcupU2QTPmWk7fF8GyelQfN6JDD8NxjU5f9tTZBcTWGtV7P9c9cHoFlFSiJcShE0v21gfhZyugYhtrjp80qt+0uwGbLKnj13g8sY/oCwFigpvQPnOV3JQuz5VWLkFV6ZC9QGGn4HwR4Qos=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1653384540; h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=768jvw8nHU0YqOlBKHlbXilaoggjFgl0lSoDRKB65kU=; 
        b=PswDlWtPjHAvvrYyM+WwzRDO2SPX3urn8O6R65vi8U5HcX8c0lR4EKgTsq1hqxy/rHrpsXDvFtBRs57dYgR2J4oXqq7t7sU6/OqZkHrRPttQwR3m4GLyyUwDhDDJV7tWE+vOJlZybfsgkRpoB72Ihu5euLWllu9ld4TuWXWrNwg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=barratt.scot;
        spf=pass  smtp.mailfrom=andy@barratt.scot;
        dmarc=pass header.from=<andy@barratt.scot>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653384540;
        s=barratt; d=barratt.scot; i=andy@barratt.scot;
        h=From:From:Content-Type:Content-Transfer-Encoding:Mime-Version:Subject:Subject:Message-Id:Message-Id:Date:Date:To:To:Reply-To:Cc;
        bh=768jvw8nHU0YqOlBKHlbXilaoggjFgl0lSoDRKB65kU=;
        b=HateQa1JuzxkLPHuMko0mAwwcd9CYA3Lyt/j8DhrbsbgP0ZaLWY2VoMm5S8bUNBQ
        /oKg7x0hLtZtmS//ZiNMsKJe4mYiaeaGiHqiEqgc5JaM4WV+6a+0SC6OPjoMp4M/MwR
        8T5HOA639tUbFaZKhn1DlrHy/a4Rp2+8c9e0ZUoc=
Received: from smtpclient.apple (188.29.49.137.threembb.co.uk [188.29.49.137]) by mx.zohomail.com
        with SMTPS id 1653384537389912.8872825295111; Tue, 24 May 2022 02:28:57 -0700 (PDT)
From:   Andy Barratt <andy@barratt.scot>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: How to configure Netplan for VPN on boot
Message-Id: <FF40E3EB-CB33-4021-965D-A46E82A367C9@barratt.scot>
Date:   Tue, 24 May 2022 10:28:54 +0100
To:     linux-ppp@vger.kernel.org
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-ZohoMailClient: External
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hello all,

Thanks for having me.  I=E2=80=99m afraid I=E2=80=99m still somewhat of =
a novice when it comes to the sysadmin/devops/networking world so please =
be patient with me if I don=E2=80=99t understand things right away :)

I=E2=80=99ve set up a wee web server at home running Ubuntu 20.04 and a =
number of docker controllers.  As I am using a 5G modem for internet, IP =
addresses and port forwarding can be a bit unpredictable so I=E2=80=99ve =
chosen to hook this server up to a VPN provider to gain a static IP =
address and open ports directly to the machine.

I=E2=80=99ve successfully managed to set up my peer and all is well.  =
The only trouble is that I have to manually run `sudo pon purevpn` on =
each boot.  Whilst I do have a UPS in place, I do want to know that the =
connection will correct itself if there ever is a need for the box to =
reboot :)

Now I=E2=80=99ve looked at the documentation by you good folk here: =
http://pptpclient.sourceforge.net/howto-ubuntu.phtml
but I note that it was last updated 15 years ago (2007) and that it =
suggests I make some changes to my `/etc/network/interfaces` file.

The trouble lies here.  Ubuntu 20.04 does not, by default, have a =
`/etc/network/interfaces` file.  It would seem things have been migrated =
in this new version to something called NetPlan.

I figured I=E2=80=99d take the opportunity to not just google a solution =
but make sure you good folk were part of that solution so we can =
hopefully get this documentation updated for other lost souls like =
myself :)

Hope you are all well,
Andy Barratt

P.S. I note that my first attempt to subscribe failed when I sent a =
command to confirm my email address.  I guessed (seemingly correctly) =
that converting to Plain Text emails would solve this problem (Rich Text =
of course being the default in most clients these days!).  It might be =
helpful if someone could update the mailing list software to advise =
future participants to do the same :)

P.P.S. I=E2=80=99ve chosen to use `back ticks` to surround code snippets =
as this is what I=E2=80=99m used to in systems like markdown, but do let =
me know if there=E2=80=99re different conventions folk are used to in =
mailing lists like this.  Despite being born in the late 80s and grown =
up on dialup, I seem to have somehow missed out on the mailing list =
phase of the internet! :)=
