Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2EF1F21F5
	for <lists+linux-ppp@lfdr.de>; Tue,  9 Jun 2020 00:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgFHWwu (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 8 Jun 2020 18:52:50 -0400
Received: from 23-24-207-145-static.hfc.comcastbusiness.net ([23.24.207.145]:12762
        "EHLO ns.mahan.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgFHWwu (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 8 Jun 2020 18:52:50 -0400
Received: from Cone-of-Silence.local (crowTrobot [23.24.207.146])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ns.mahan.org (Postfix) with ESMTPSA id BBE9CA2DF92;
        Mon,  8 Jun 2020 15:52:49 -0700 (PDT)
Subject: Re: PPP cycling between UP and DOWN
To:     =?UTF-8?Q?David_Bala=c5=beic?= <xerces9@gmail.com>,
        James Carlson <carlsonj@workingcode.com>
Cc:     linux-ppp@vger.kernel.org
References: <f44e7e14-1621-7141-66a3-3a2218e8db86@mahan.org>
 <84d4375a-a446-6a15-9388-db312b77e50a@workingcode.com>
 <8d6fcc7e-c727-7979-13ca-a3e80d9eb514@mahan.org>
 <c3e9fab3-116c-ee26-cfa7-7fb7c76c7c4c@workingcode.com>
 <CAPJ9Yc8JBJ+x4L2B=Mo6HFSm3q5YHBrG256Czpqx0WAKB0hQbw@mail.gmail.com>
From:   Patrick Mahan <mahan@mahan.org>
Message-ID: <671a6499-f5f6-1170-e7d3-36a9aaa31486@mahan.org>
Date:   Mon, 8 Jun 2020 15:52:49 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAPJ9Yc8JBJ+x4L2B=Mo6HFSm3q5YHBrG256Czpqx0WAKB0hQbw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 6/8/20 2:32 PM, David Balažic wrote:
> On Mon, 8 Jun 2020 at 19:16, James Carlson <carlsonj@workingcode.com> wrote:
>> "Modem hangup" means that PPPoE, not PPP, shut down this link.  It would
>> be a completely wild guess -- I know the pppd code fairly well, but I
>> don't know the separate rp-pppoe code too well at all -- but it's
>> possible that this user was bit by the same stray PADT problem that
>> someone reported earlier on this list.  Or maybe not.
> 
> RP-PPPOE has that bug fixed for quite a while.
> 
> (I reported that PADT problem)

Okay, well we are moving to the latest RP-PPPOE and PPP versions on our new 
platform which uses the 4.14 kernel.  So that fix will at least be there in the 
future.

Thanks,

Patrick
