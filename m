Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF2951B6008
	for <lists+linux-ppp@lfdr.de>; Thu, 23 Apr 2020 18:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbgDWP77 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ppp@lfdr.de>); Thu, 23 Apr 2020 11:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726109AbgDWP76 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 23 Apr 2020 11:59:58 -0400
Received: from tuna.sandelman.ca (unknown [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97F8C09B040
        for <linux-ppp@vger.kernel.org>; Thu, 23 Apr 2020 08:59:57 -0700 (PDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
        by tuna.sandelman.ca (Postfix) with ESMTP id 978603818F;
        Thu, 23 Apr 2020 11:58:07 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
        by sandelman.ca (Postfix) with ESMTP id 01B0CB54;
        Thu, 23 Apr 2020 11:59:56 -0400 (EDT)
From:   Michael Richardson <mcr@sandelman.ca>
To:     =?us-ascii?Q?=3D=3FUTF-8=3FQ=3FDavid=5FBala=3DC5=3DBEic=3F=3D?= 
        <xerces9@gmail.com>
cc:     linux-ppp@vger.kernel.org
Subject: Re: PPPoE Modem hangup after random time - how to debug?
In-Reply-To: <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com> <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com> <21061.1587602497@localhost> <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com> <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com> <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 25.1.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;<'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Date:   Thu, 23 Apr 2020 11:59:55 -0400
Message-ID: <7221.1587657595@localhost>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org


David Balažic <xerces9@gmail.com> wrote:
    > Also: the IPv6 address (the part derived from hwaddr) starts with c6
    > instead of c4 like the actual hw address. Is that normal?

There is a bit in the IPv6 IID (bit 2), which is the L/G bit, and says if the
IID is considered globally unique.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [

