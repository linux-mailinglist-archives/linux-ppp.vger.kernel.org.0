Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA6961BBBC9
	for <lists+linux-ppp@lfdr.de>; Tue, 28 Apr 2020 13:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbgD1LAl (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 28 Apr 2020 07:00:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30467 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726430AbgD1LAk (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Tue, 28 Apr 2020 07:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588071639;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9uJZSfh0FItmZgFe6vtqf/l8+J4Kn4RToYA366HPq30=;
        b=Z7r9qrv8ST1hjw3UGZ90BR6s+Q66Cf8zjxVfdwZxk7Wjdl3fISUBE8NoGzsz/i6t46OXJO
        dykyXIZfyW87ksPZbqs6vGmdQDcWPLNNwbJnXmgnb6FUBulGe7UoR0QZUxEXR+4y53THIU
        kFf3M+w1Bhqqc8T6W+knxnTgU3BM4Gw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-X3uKcBudNFClitUq1xarYQ-1; Tue, 28 Apr 2020 07:00:37 -0400
X-MC-Unique: X3uKcBudNFClitUq1xarYQ-1
Received: by mail-wr1-f71.google.com with SMTP id o8so11631098wrm.11
        for <linux-ppp@vger.kernel.org>; Tue, 28 Apr 2020 04:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9uJZSfh0FItmZgFe6vtqf/l8+J4Kn4RToYA366HPq30=;
        b=krlvldkr5bflu3sKTqg4zN+UNs3api7BZq7C510geLuAYDoSlmtVfi2XcX2Hts9XjU
         envreEGzTLH8xtPPVkWLOtYeSdP47UTEUsPBBeQrsJjSG4P16xpaF1XuvC5Om+HMQbEY
         IogIs7GW9bBGEu129mm8bdnij0BmtcImENnjlKOseY0Wr4T94PO+allH3v8m/xiFwBXN
         N8oCiYGWlH253EQSKc2Wlv6vKDcNULRcoYwg8twLD+N2yYoCWG4TrpB2UYn559rxdz8f
         4px4M6zn4uhT0J7vLLmcUekyAQEZdPndR83QF3Ccs6eHaZPAMIifwErHo9uQKUv8hrWU
         hfaQ==
X-Gm-Message-State: AGi0PuZjcfW6bwA6wjwZ9Dwz2bk7MgA1SptQzgKgbYfPByYl/f61roXZ
        +Ec5qv9QzNnMhGNPqpicIlaP/JqhIRCx+0ua+kGM6/RLnMDVDQsf7iDr6nqUhqLl5ovRdq7Vzl8
        KC26H2nMaLc9UVNsxsvNm
X-Received: by 2002:a7b:cb0c:: with SMTP id u12mr4316423wmj.137.1588071636295;
        Tue, 28 Apr 2020 04:00:36 -0700 (PDT)
X-Google-Smtp-Source: APiQypI5BQX6RXvYKUTHa/UZaAl+TlgMogriY8at5Eo8D1YPNmIXa5lYI9u0GezuuQzb6eTA4vsyJA==
X-Received: by 2002:a7b:cb0c:: with SMTP id u12mr4316401wmj.137.1588071636101;
        Tue, 28 Apr 2020 04:00:36 -0700 (PDT)
Received: from pc-3.home (2a01cb0585138800b113760e11343d15.ipv6.abo.wanadoo.fr. [2a01:cb05:8513:8800:b113:760e:1134:3d15])
        by smtp.gmail.com with ESMTPSA id j13sm25991917wrq.24.2020.04.28.04.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 04:00:35 -0700 (PDT)
Date:   Tue, 28 Apr 2020 13:00:33 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     David =?utf-8?Q?Bala=C5=BEic?= <xerces9@gmail.com>
Cc:     linux-ppp@vger.kernel.org
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-ID: <20200428110033.GA25921@pc-3.home>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com>
 <21061.1587602497@localhost>
 <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com>
 <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
 <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
 <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
 <20200424155459.GB21114@pc-3.home>
 <CAPJ9Yc_kHZKCSG7o7YtU7YCvAF4+OPm9MJzYK12mmQOg5FQD2w@mail.gmail.com>
 <CAPJ9Yc82m71opZ5nkxqtGuJ8rsuY83opnZPOiS7_DWjiC4JFrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPJ9Yc82m71opZ5nkxqtGuJ8rsuY83opnZPOiS7_DWjiC4JFrg@mail.gmail.com>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Tue, Apr 28, 2020 at 12:18:38PM +0200, David Balažic wrote:
> On Tue, 28 Apr 2020 at 01:34, David Balažic <xerces9@gmail.com> wrote:
> >
> > On Fri, 24 Apr 2020 at 17:55, Guillaume Nault <gnault@redhat.com> wrote:
> > > You can monitor the evolution of you network devices with rtmon:
> > > $ rtmon file ./some/file.log link
> > >
> > > Then read it with ip monitor:
> > > $ ip monitor file ./some/file.log
> > >
> > > That should tell if eth1.3902 is ever passed down or even deleted.
> >
> > rtmon does not seem to be available on openwrt. It is part of iproute2, right?
> >
> > Are there any alternatives?
> > (until I find or compile it myself...)
> 
Sorry for late reply.
Yes, rtmon is part of iproute2.

> OK, I found 'ip', but not 'rtmon'.
> 
> Is running 'ip monitor link' equivalent?
> I'll start that...
> 
Yes. Both listen to the kernel netlink messages that are sent when
network interfaces are modified.

> Regards,
> David
> 

