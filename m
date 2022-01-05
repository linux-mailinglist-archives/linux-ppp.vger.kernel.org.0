Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6318A4856A8
	for <lists+linux-ppp@lfdr.de>; Wed,  5 Jan 2022 17:30:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241915AbiAEQaB (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 5 Jan 2022 11:30:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58165 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231290AbiAEQaA (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 5 Jan 2022 11:30:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641400199;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rhnD07g5paab63PHzRXGLYnd5v81Kd5rTKW8UNX8YzA=;
        b=JxhX6gXCRf5V6yhp+E2EgIEyfikcGllRQd0B9BJS0o035BPm3vaiW1OHQ7t+HN6OvlJhmB
        DJ49c6o7T+5cOuk3XA4fdJGbxlkUjP4Qh/pz9kf+0ql6GtdmPFTbcyEnijEyfVW1IEFCJi
        09LPAXmbf0cm3iWpDXZ3+AJ6BJXA/IM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-A4t8UJfAO9u51nqmYZdz2A-1; Wed, 05 Jan 2022 11:29:58 -0500
X-MC-Unique: A4t8UJfAO9u51nqmYZdz2A-1
Received: by mail-wr1-f70.google.com with SMTP id v6-20020adfa1c6000000b001a26d0c3e32so12699316wrv.14
        for <linux-ppp@vger.kernel.org>; Wed, 05 Jan 2022 08:29:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rhnD07g5paab63PHzRXGLYnd5v81Kd5rTKW8UNX8YzA=;
        b=z16i+QpGsGbK8OUTPHs+r03kdsLS92IMbCq9Kdg/ncjVNlFyu0X/lX0JL1vyVxlEuY
         of70dh48kiEw/L4P+AdW5pDrOFIoE5SDnwR44PrIqbzk7knu97szvn18AVlOSeP6BeW8
         UO2ocFM2T+0Mn+RnjrHg5sakl6dHd0N53IoGBXDVDxNWYITqQlhWl3GCxLqSb2H7XvJg
         xLrMBNP0Kh5ZDJUda0XT8aZmFb88IAzmjrYXp3D72iKDEnoWHENIDNUC/yOktYxiIif4
         +wZus6gRRlGEX8Fyjc/vNlC+At4oCr8CJTnD4SIoYNpQOs/Vpu5Dw4geMxcd4OxsQqNl
         y64g==
X-Gm-Message-State: AOAM531tvryre3nFiTMW7J4FDkMhS87AsgjQYZ6QQBo04IIdouudlSan
        7objsnsqNQywwHOHpvBSyJScwFiERB+aH57kxL4m3eOLNKByXThJEuyN7im6E8FnsLlHL3Usx31
        lQa1g9vSssaifFmnNjkD6
X-Received: by 2002:a7b:cc13:: with SMTP id f19mr3586731wmh.57.1641400197391;
        Wed, 05 Jan 2022 08:29:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPDF6neFuUdFAnSW7wX+PzCMUmHGZBZQTAzn+vyEAucDG2YwTrWOXDSAP/c6zHSePEyzkGKQ==
X-Received: by 2002:a7b:cc13:: with SMTP id f19mr3586720wmh.57.1641400197214;
        Wed, 05 Jan 2022 08:29:57 -0800 (PST)
Received: from pc-1.home (2a01cb058d24940001d1c23ad2b4ba61.ipv6.abo.wanadoo.fr. [2a01:cb05:8d24:9400:1d1:c23a:d2b4:ba61])
        by smtp.gmail.com with ESMTPSA id f6sm3583912wmq.6.2022.01.05.08.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 08:29:56 -0800 (PST)
Date:   Wed, 5 Jan 2022 17:29:54 +0100
From:   Guillaume Nault <gnault@redhat.com>
To:     James Carlson <carlsonj@workingcode.com>
Cc:     Eric Dumazet <eric.dumazet@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org,
        syzbot <syzkaller@googlegroups.com>
Subject: Re: [PATCH net] ppp: ensure minimum packet size in ppp_write()
Message-ID: <20220105162954.GB17823@pc-1.home>
References: <20220105114842.2380951-1-eric.dumazet@gmail.com>
 <20220105131929.GA17823@pc-1.home>
 <dbde2a45-a7dd-0e8a-d04c-233f69631885@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbde2a45-a7dd-0e8a-d04c-233f69631885@workingcode.com>
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Wed, Jan 05, 2022 at 10:30:09AM -0500, James Carlson wrote:
> On 1/5/22 08:19, Guillaume Nault wrote:
> > On Wed, Jan 05, 2022 at 03:48:42AM -0800, Eric Dumazet wrote:
> >> From: Eric Dumazet <edumazet@google.com>
> >>
> >> It seems pretty clear ppp layer assumed user space
> >> would always be kind to provide enough data
> >> in their write() to a ppp device.
> >>
> >> This patch makes sure user provides at least
> >> 2 bytes.
> >>
> >> It adds PPP_PROTO_LEN macro that could replace
> >> in net-next many occurrences of hard-coded 2 value.
> > 
> > The PPP header can be compressed to only 1 byte, but since 2 bytes is
> > assumed in several parts of the code, rejecting such packets in
> > ppp_xmit() is probably the best we can do.
> 
> The only ones that can be compressed are those less than 0x0100, which
> are (intentionally) all network layer protocols.  We should be getting
> only control protocol messages though the user-space interface, not
> network layer, so I'd say it's not just the best we can do, but indeed
> the right thing to do by design.

Well, I know of at least one implementation that used to transmit data
by writing on ppp unit file descriptors. That was a hack to work around
some other problems. Not a beautiful one, but it worked.

