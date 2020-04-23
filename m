Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C56E41B6011
	for <lists+linux-ppp@lfdr.de>; Thu, 23 Apr 2020 18:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729463AbgDWQBl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ppp@lfdr.de>); Thu, 23 Apr 2020 12:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729176AbgDWQBl (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 23 Apr 2020 12:01:41 -0400
Received: from tuna.sandelman.ca (tuna.sandelman.ca [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9419C09B040
        for <linux-ppp@vger.kernel.org>; Thu, 23 Apr 2020 09:01:40 -0700 (PDT)
Received: from sandelman.ca (obiwan.sandelman.ca [209.87.249.21])
        by tuna.sandelman.ca (Postfix) with ESMTP id 2B6C43818F;
        Thu, 23 Apr 2020 11:59:50 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
        by sandelman.ca (Postfix) with ESMTP id 8A5C1B54;
        Thu, 23 Apr 2020 12:01:38 -0400 (EDT)
From:   Michael Richardson <mcr@sandelman.ca>
To:     =?us-ascii?Q?=3D=3FUTF-8=3FQ=3FDavid=5FBala=3DC5=3DBEic=3F=3D?= 
        <xerces9@gmail.com>
cc:     linux-ppp@vger.kernel.org
Subject: Re: PPPoE Modem hangup after random time - how to debug?
In-Reply-To: <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com> <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com> <21061.1587602497@localhost> <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com> <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com> <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com> <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 25.1.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;<'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Date:   Thu, 23 Apr 2020 12:01:38 -0400
Message-ID: <7689.1587657698@localhost>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org


David Balažic <xerces9@gmail.com> wrote:
    > tcpdump: pcap_loop: The interface went down
    > 4 packets captured
    > 22 packets received by filter
    > 0 packets dropped by kernel

    > The ifconfig packet counter for the VLAN interface eth1.3902 is reset,
    > compare to values in quested message below, this is th eoutpu a few
    > minutes after the reconnect:

.. your counter reset suggests that somehow your VLAN interface is being
killed and restarted.
That's really weird.

This is openwrt?

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [

