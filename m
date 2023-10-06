Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3F317BB170
	for <lists+linux-ppp@lfdr.de>; Fri,  6 Oct 2023 08:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbjJFGVP (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 6 Oct 2023 02:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjJFGVP (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 6 Oct 2023 02:21:15 -0400
Received: from w4.tutanota.de (w4.tutanota.de [81.3.6.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E9CA90
        for <linux-ppp@vger.kernel.org>; Thu,  5 Oct 2023 23:21:10 -0700 (PDT)
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
        by w4.tutanota.de (Postfix) with ESMTP id A39ED1060122;
        Fri,  6 Oct 2023 06:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1696573268;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=QeZ1qtCcrGpvP7TpACm3+wLhJXA59+S9SMqv6Yt7lXI=;
        b=fa2g51d1Eu5Njnt1BamseIXbUJ9W/qWBM50+EcK/fMwpiyCwXoLUsm2dmfUKnyvo
        1vagyUZj4zpCU7UCT3vkyVcyz+h4jeVzB9YVeNz+afx2sjCLA6N1CdZ3J23Bku033rK
        ZNiyhWkQhLmKVqlyqKnNT7HreQWYjLuzajhtIq6cNK0dwlmvg34gO0DywYS6AFM6tZU
        BS+JdmBuKO9d1yRdGebe0b5s9qFnLNoS8a6Nq6ykFONPjxl9hioCOLPdrr1zbmGyU9J
        3dADQmJO6GfBsRfmDF4rnVYurKRj4g7dEy0MUNUoVGqU3t3IokvMd3Rargdmw0Zk391
        Cxp+AHW2lg==
Date:   Fri, 6 Oct 2023 08:21:08 +0200 (CEST)
From:   Sagar Acharya <sagaracharya@tutanota.com>
To:     Narasimhan S <simha@multitech.co.in>
Cc:     Linux Ppp <linux-ppp@vger.kernel.org>
Message-ID: <Ng2dOzz--3-9@tutanota.com>
In-Reply-To: <b750b194-59cf-4a7b-a7c2-2995e5b0d8dc@multitech.co.in>
References: <Ng-zxyt--3-9@tutanota.com> <b750b194-59cf-4a7b-a7c2-2995e5b0d8dc@multitech.co.in>
Subject: Re: Support for udp
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

So are you saying pppd does not support udp or does it?
Thanking you
Sagar Acharya
https://humaaraartha.in/selfdost/selfdost.html



6 Oct 2023, 11:06 by simha@multitech.co.in:

> pppd works at IP layer. All IP protocols not dependent on broadcast capabilities should work.
>
> On 05-10-2023 23:30, Sagar Acharya wrote:
>
>> Does pppd support udp? I am able to access tcp but not udp with pppd.
>> Thanking you
>> Sagar Acharya
>> https://humaaraartha.in/selfdost/selfdost.html
>>
>> Kindly cc me as I am not subscribed.
>>
