Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D011B595B
	for <lists+linux-ppp@lfdr.de>; Thu, 23 Apr 2020 12:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgDWKhx (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 23 Apr 2020 06:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725863AbgDWKhx (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 23 Apr 2020 06:37:53 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A055C035493
        for <linux-ppp@vger.kernel.org>; Thu, 23 Apr 2020 03:37:53 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id i22so5152680uak.6
        for <linux-ppp@vger.kernel.org>; Thu, 23 Apr 2020 03:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=WMOpOWufO1cChPGYcIkn7StyTq27uNX3DbFOCrjUIUY=;
        b=aO8JsShye2jNdzau1pQbkhlYug63yeC0EyfjXktp1ISgnn0kwhNcXjadS1F9uNsRTO
         XMLYCFlLCtdFLbFBl/84smbL3Nny9Np+Z48muBhokKW1tukwx7NEQWYz4yvVQZlj4Tth
         J8QeklNrZJeYM0xWUBB82EpXfugN/AScB8OQzIlopmAD3y5+988Bb3Bsyuv3taAXQDsx
         hqW5fk2Y9NqbbQjSRP2QqImixtmJqn9jdo0kDhD5hOyoVJm2R6l1w4Sx8Rw1jTAkLUBz
         oWAbhihNYUaqmBdaJeSjus37xhzBRPr8+6PQWafGGxZMl3wc0PwqScvc7nQE0TzhxRX2
         1bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=WMOpOWufO1cChPGYcIkn7StyTq27uNX3DbFOCrjUIUY=;
        b=B6QIsOKPmUR1Yde2JlFXCuFYdxYFv/eqGHLqkkopa/zhXYev55MKffVXQeYS2shZkh
         VRimhsrQJ+bIxmTr5I7tQ4UrRNcKlY6i8LcAzrAchn8b1QqrETT7REDevQUpc1NjIEpT
         CwvBeLNyVYgcu9xOphh+RzwHJUqASOi8a5n2EormxXAT8vkYUrfL8ItcoTG6yF0z/++G
         /pwRYkue8UJayNIT/b6dsgcMZedXQkoR8uq7PHwesjaVnaT+63ysculGBPoPcVR/N4om
         JXyRTBCeUV9ce2taoN1DA7xBfSVGHulWr3l9xECfeLi9qqCEYIFLcYdipFHycCtOvKaW
         y+Ug==
X-Gm-Message-State: AGi0PubZFCaYeszUNRffxpVYExvPIUDYtqIiJ1WFvAxsq4eR7QLuoa4G
        PmTkhAXnPfIcachaqRIUpcS4ZUKmmfEI1+06eypMxrHiJco=
X-Google-Smtp-Source: APiQypKEKr4d2qZ+6Rkou+MP3MfR0Xoy1MgzFFwmtbmtAk1xg5QMiHkYGbEr8tdGOMjAt1COaW71/ybm4FzLqDtj72c=
X-Received: by 2002:ab0:61cf:: with SMTP id m15mr2248623uan.99.1587638272105;
 Thu, 23 Apr 2020 03:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com> <21061.1587602497@localhost>
 <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com>
In-Reply-To: <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Thu, 23 Apr 2020 12:37:41 +0200
Message-ID: <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Some more info:

 - the connect time is random:
# logread  | grep "Connect time"
Wed Apr 22 16:42:18 2020 daemon.info pppd[7960]: Connect time 1742.8 minute=
s.
Wed Apr 22 19:13:03 2020 daemon.info pppd[9563]: Connect time 150.7 minutes=
.
Thu Apr 23 09:38:31 2020 daemon.info pppd[9884]: Connect time 865.5 minutes=
.



 - the assigned IP address is different on each connection


 - logs
On Thu, 23 Apr 2020 at 00:00, James Carlson <carlsonj@workingcode.com> wrot=
e:
>
> On 2020-04-22 13:45, David Bala=C5=BEic wrote:
> > Hi!
> >
> > I have a router running openwrt connected to a GPON ONT, running a
> > PPPoE connection (hw details below).
>
> This looks to be (possibly) a PPPoE failure, though there's nothing
> interesting in the log messages provided.  If there were an interesting
> log message, it would almost certainly come somewhere (perhaps even
> *minutes*) before that initial "Modem hangup" message.

Nothing there:

Thu Apr 23 08:59:02 2020 daemon.info hostapd: wlan0: STA
58:XX:XX:XX:XX:b9 IEEE 802.11: deauthenticated due to inactivity
(timer DEAUTH/REMOVE)
Thu Apr 23 09:38:31 2020 daemon.notice pppd[9884]: Modem hangup

I'll try packet capture next.

Regards,
David
