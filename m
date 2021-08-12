Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB983EAAAC
	for <lists+linux-ppp@lfdr.de>; Thu, 12 Aug 2021 21:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbhHLTN3 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 12 Aug 2021 15:13:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48025 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230110AbhHLTN2 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 12 Aug 2021 15:13:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628795582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7cS3BPbsqKnOYb42Mhut/iF8oyajtsumJDuTzp4/dis=;
        b=HONUjXFC54tcgUPSLWaJhZNpY3TzyZKxCBTbaijOL48qUwOCSGGbObKHMWzROl3d24GSZE
        7fkNveSJ2DPhGeTccJwJcpadJoWYPmkGRg8Ow9xQOiFsx9EsuXTdjVHs3lur+c1dhYvWrs
        gxpuS7TfUlBbBNahUTVUw6iZGAfh9MM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-I7xcak_0M6-LA6G_6-WjFg-1; Thu, 12 Aug 2021 15:13:01 -0400
X-MC-Unique: I7xcak_0M6-LA6G_6-WjFg-1
Received: by mail-wr1-f70.google.com with SMTP id m2-20020a0560000082b0290154f6e2e51fso2148269wrx.12
        for <linux-ppp@vger.kernel.org>; Thu, 12 Aug 2021 12:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7cS3BPbsqKnOYb42Mhut/iF8oyajtsumJDuTzp4/dis=;
        b=NMSuBIxbvF6uTD9aCX/odhik+m0z75AHN7w1ogBmqpXKZy1wbWb8HzszxFcvC7n+tx
         EG7x2ew7FzuyrX3pDEEOtkG1iXvR/I8nprF1d0xd5CX/63Vx+bghiqtxjdreaand/aoW
         0SR23zitJWUWt+OaViDBoc3KwPaOA/M4n/pui1OXdchBtyXq8ML34gR9t1o8UZBqQszo
         l2QmzMBxNcx+WjP13QKJARmAidnhc9ErBf/VQA0jO7hvPhjE7KMC2rfToDtJtRKGF1T0
         v0F8bcW+g512E1O0kXi3Mj89Ow2JPIGbkWDDkafnZX+RWQeMSmPRAu7qbM57cu6ONvGz
         8+hQ==
X-Gm-Message-State: AOAM533AXcQi7pplyR/ZmFY8W110sDpsj/GTlQVNxoMALJ5YqZV0iuno
        3sRxFNUxj/bCHSqEsxXDYy4OUVBiIVZaklu17X44e3s8f1uJ6bZF0ISSdypkvs+0/xnecCJ0em4
        W8Os1rA0qt1MiSpL7mkx8
X-Received: by 2002:a05:600c:3590:: with SMTP id p16mr50578wmq.33.1628795580333;
        Thu, 12 Aug 2021 12:13:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw32p2/am0ZJ06W9UE/TEcfIPIgdiBvMFsnUFpCT9QrohG/fN16OhxFpBe+HXUWxiCgfqywTQ==
X-Received: by 2002:a05:600c:3590:: with SMTP id p16mr50556wmq.33.1628795580060;
        Thu, 12 Aug 2021 12:13:00 -0700 (PDT)
Received: from pc-23.home (2a01cb058d01b600c841afd12834a14e.ipv6.abo.wanadoo.fr. [2a01:cb05:8d01:b600:c841:afd1:2834:a14e])
        by smtp.gmail.com with ESMTPSA id k17sm11902206wmj.0.2021.08.12.12.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 12:12:59 -0700 (PDT)
Date:   Thu, 12 Aug 2021 21:12:57 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>, linux-ppp@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ppp: Add rtnl attribute IFLA_PPP_UNIT_ID for specifying
 ppp unit id
Message-ID: <20210812191257.GB10725@pc-23.home>
References: <20210807163749.18316-1-pali@kernel.org>
 <20210809122546.758e41de@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210809193109.mw6ritfdu27uhie7@pali>
 <20210810153941.GB14279@pc-32.home>
 <20210810160450.eluiktsp7oentxo3@pali>
 <20210811171918.GD15488@pc-32.home>
 <20210811175449.5hrwoevw7xv2jxxn@pali>
 <20210812091941.GA3525@pc-23.home>
 <20210812140918.lfll55przd4ajtc7@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210812140918.lfll55przd4ajtc7@pali>
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Thu, Aug 12, 2021 at 04:09:18PM +0200, Pali Rohár wrote:
> The problem is that ppp from rtnl is of the same class as ppp from
> ioctl. And if you want to use ppp, you still have to use lot of ioctl
> calls as rtnl does not implement them. And these ioctl calls use ppp
> unit id, not interface id / interface name.

Indeed, the netlink api only replaces ioctl(PPPIOCNEWUNIT). It's
technically feasible to implement other ppp unit ioctls with netlink,
but I didn't do that because:
  * some of them make no sense,
  * netlink wouldn't bring any advantage over ioctl() for these cases
    (and ppp is ioctl-centric anyway, so users will have to write
    ioctl() calls no matter what).

If there was a bright future for ppp in sight, I'd certainly work on a
new modern ioctl-less api. But in the current situation, that'd be just
feature duplication and code churn.

> So in the end you can use RTM_NEWLINK and then control ppp via ioctls.
> And for controlling you have to known that ppp unit id.
> 
> If you are using ppp over serial devices, you can "simplify" it by
> forcing mapping that serial number device matches ppp unit id. And then
> you do not have to use dynamic ids (and need for call PPPIOCGUNIT).

How is dropping a single PPPIOCGUNIT call going to simplify the code
while you have to write netlink message handlers?

> With dynamic unit id allocation (which is currently the only option when
> creating ppp via rtnl) for single ppp connection you need to know:
> * id of serial tty device
> * id of channel bound to tty device
> * id of network interface
> * id of ppp unit bound to network interface

I see you're not working with L2TPv2 :). A few more things you'd need
to add to the list:
 * a UDP socket,
 * a tunnel id,
 * a session id,
 * a tunnel file descriptor,
 * a session file descriptor,
 * a new ioctl() to figure out which channel id is assigned to your
   L2TP session,
 * a bunch of setsockopt() to configure the whole thing,
 * ...
(and I'm not counting the ioctl() calls necessary to set up the channel,
which also apply to your use case).

Really, I'm sorry, but the possibility to drop a single PPPIOCGUNIT
call isn't going to simplify the ppp landscape.

> > As I already proposed, we can add an attribute to make the interface
> > name independant from the unit id.
> 
> I agree, that above proposal with a new attribute which makes interface
> name independent from the ppp unit id is a good idea. Probably it should
> have been default rtnl behavior (but now it is too late for changing
> default behavior).

Well, it was the default, until a collegue complained and I accepted to
align the default device name with the original ioctl() behaviour. But
the beauty of netlink is that we can revise this behaviour without
breaking compatibility.

> But prior adding this attribute, we first need a way how to retrieve
> interface name of newly created interface. Which we agreed that
> NLM_F_ECHO for RTM_NEWLINK/NLM_F_CREATE is needed.

Yes, that'd be ideal. That might require quite some work though (I
haven't looked in detail). At last resort, if adding NLM_F_ECHO
support to rtnl proves too hard, it might be possible to add a call to
get the device name associated to a ppp unit file descriptor.

At least know I understand why we had this conversation about
NLM_F_ECHO :).

