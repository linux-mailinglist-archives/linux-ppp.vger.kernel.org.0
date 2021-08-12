Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C214E3EA204
	for <lists+linux-ppp@lfdr.de>; Thu, 12 Aug 2021 11:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236251AbhHLJ3T (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 12 Aug 2021 05:29:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23821 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236247AbhHLJ3S (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 12 Aug 2021 05:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628760533;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=azALnNzJ2DxInJKcscL1YP4WRO484x/30y4kh0GvdSg=;
        b=cyj4n+ESO/TYED95A4+C7w0vFchYINFHTeRH/NPoLmMk7UZZ1j/YYGFqLkDD5oe6O54Fs+
        yW2YjrnJoM6c8pF/tzkWGoDuRfABbhIHev3eiGgtswjcnmlbrJlimVZ2qMgviIU4juafxV
        iSYnIgBYxAgt+Lva92Nxwi5/jm7DH6U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126--yFhKVfWO4-QMcTMVoCHzQ-1; Thu, 12 Aug 2021 05:28:51 -0400
X-MC-Unique: -yFhKVfWO4-QMcTMVoCHzQ-1
Received: by mail-wr1-f71.google.com with SMTP id m5-20020a5d6a050000b0290154e83dce73so1596677wru.19
        for <linux-ppp@vger.kernel.org>; Thu, 12 Aug 2021 02:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=azALnNzJ2DxInJKcscL1YP4WRO484x/30y4kh0GvdSg=;
        b=tyVaHO8tf33gayt+w9Gm9zwSyDeIwt+5rYIgJZhxJ0aFcpv5SMLXd0wdJrHOwdMKv6
         w63KYGiWYUaEsU80EHkCZyp6MWmtO3aJQbeM9FX9CIbK87kpPDnTNMpO6EbxrkzmKNDS
         3mCdET8Glal3qfO/rjmV7v+iKbRTtQqG2VyQeHmMn2BJo/CK44sO7W+Jmw+3tWOzBYxi
         ahjGyLcaG3Tp0mcDh5hxROVHae8F7N8mcNMI6Urf9WYxgrbOyts59fyAyl381ZZSR40Z
         0Gp4rDjwDriysxatG+5Goj8pFdlbiQ3eozxhLGiyj3HrxRzvQ53lrshuqAiIc+T52pmo
         j3FA==
X-Gm-Message-State: AOAM53163W+3EEsnbTV9uVUdoh2CyJ+nlLa70HT8cSigM4AyQBbQzmu0
        Rk5Fq3eEg4i/jQbBQ9LrRfndz35OUsfza4JBLpTDinvUkBpEw3HLbmqthGPLkJYrKm9+5fqJFko
        IkMydCUgpOrwf5mgsq1QW
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr14553350wmg.130.1628760530312;
        Thu, 12 Aug 2021 02:28:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1l289vOE6o41DRiqCxf3bCTO+hW4WWNdkiSVawC7o2rOn/YBaeOsFkBd9K30ANEwDh/ErtQ==
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr14553334wmg.130.1628760530160;
        Thu, 12 Aug 2021 02:28:50 -0700 (PDT)
Received: from pc-23.home (2a01cb058d01b600c841afd12834a14e.ipv6.abo.wanadoo.fr. [2a01:cb05:8d01:b600:c841:afd1:2834:a14e])
        by smtp.gmail.com with ESMTPSA id c10sm9589411wml.44.2021.08.12.02.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 02:28:49 -0700 (PDT)
Date:   Thu, 12 Aug 2021 11:28:47 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc:     James Carlson <carlsonj@workingcode.com>,
        Chris Fowler <cfowler@outpostsentinel.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>,
        "linux-ppp@vger.kernel.org" <linux-ppp@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ppp: Add rtnl attribute IFLA_PPP_UNIT_ID for specifying
 ppp unit id
Message-ID: <20210812092847.GB3525@pc-23.home>
References: <20210807163749.18316-1-pali@kernel.org>
 <20210809122546.758e41de@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210809193109.mw6ritfdu27uhie7@pali>
 <20210810153941.GB14279@pc-32.home>
 <BN0P223MB0327A247724B7AE211D2E84EA7F79@BN0P223MB0327.NAMP223.PROD.OUTLOOK.COM>
 <20210810171626.z6bgvizx4eaafrbb@pali>
 <2f10b64e-ba50-d8a5-c40a-9b9bd4264155@workingcode.com>
 <20210811173811.GE15488@pc-32.home>
 <20210811180401.owgmie36ydx62iep@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210811180401.owgmie36ydx62iep@pali>
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Wed, Aug 11, 2021 at 08:04:01PM +0200, Pali Rohár wrote:
> On Wednesday 11 August 2021 19:38:11 Guillaume Nault wrote:
> > On Tue, Aug 10, 2021 at 02:11:11PM -0400, James Carlson wrote:
> > > On 8/10/21 1:16 PM, Pali Rohár wrote:
> > > > On Tuesday 10 August 2021 16:38:32 Chris Fowler wrote:
> > > > > Isn't the UNIT ID the interface number?  As in 'unit 100' will give me ppp100?
> > > > 
> > > > If you do not specify pppd 'ifname' argument then pppd argument 'unit 100'
> > > > will cause that interface name would be ppp100.
> > > > 
> > > > But you are free to rename interface to any string which you like, even
> > > > to "ppp99".
> > > > 
> > > > But this ppp unit id is not interface number. Interface number is
> > > > another number which has nothing with ppp unit id and is assigned to
> > > > every network interface (even loopback). You can see them as the first
> > > > number in 'ip -o l' output. Or you can retrieve it via if_nametoindex()
> > > > function in C.
> > > 
> > > Correct; completely unrelated to the notion of "interface index."
> > > 
> > > > ... So if people are really using pppd's 'unit' argument then I think it
> > > > really make sense to support it also in new rtnl interface.
> > > 
> > > The pppd source base is old.  It dates to the mid-80's.  So it predates not
> > > just rename-able interfaces in Linux but Linux itself.
> > > 
> > > I recall supported platforms in the past (BSD-derived) that didn't support
> > > allowing the user to specify the unit number.  In general, on those
> > > platforms, the option was accepted and just ignored, and there were either
> > > release notes or man page updates (on that platform) that indicated that
> > > "unit N" wouldn't work there.
> > > 
> > > Are there users on Linux who make use of the "unit" option and who would
> > > mourn its loss?  Nobody really knows.  It's an ancient feature that was
> > > originally intended to deal with systems that couldn't rename interfaces
> > > (where one had to make sure that the actual interface selected matched up
> > > with pre-configured filtering rules or static routes or the like), and to
> > > make life nice for administrators (e.g., making sure that serial port 1 maps
> > > to ppp1, port 2 is ppp2, and so on).
> > > 
> > > I would think and hope most users reach for the more-flexible "ifname"
> > > option first, but I certainly can't guarantee it.  It could be buried in a
> > > script somewhere or (god forbid) some kind of GUI or "usability" tool.
> > > 
> > > If I were back at Sun, I'd probably call it suitable only for a "Major"
> > > release, as it removes a publicly documented feature.  But I don't know what
> > > the considerations are here.  Maybe it's just a "don't really care."
> > 
> > I'm pretty sure someone, somewhere, would hate us if we broke the
> > "unit" option. The old PPP ioctl API has been there for so long,
> > there certainly remains tons of old tools, scripts and config files
> > that "just work" without anybody left to debug or upgrade them.
> > 
> > We can't just say, "starting from kernel x.y.z the unit option is a
> > noop, use ifname instead" as affected people surely won't get the
> > message (and there are other tools beyond pppd that may use this
> > kernel API).
> > 
> > But for the netlink API, we don't have to repeat the same mistake.
> 
> ifname is not atomic (first it creates ppp<id> interface and later it is
> renamed) and have issues. Due to bug described here:
> https://lore.kernel.org/netdev/20210807160050.17687-1-pali@kernel.org/
> you may get your kernel into state in which it is not possible to create
> a new ppp interface. And this issue does not happen when using "unit"
> argument.

This is specific to the ioctl api. Netlink doesn't have this problem.

> To fix above issue it is needed to migrate pppd from ioctl API to rtnl.

It would have helped a lot if you had explained that before.

> But this would be possible only after rtnl API starts providing all
> features, including specifying custom "unit" argument...

You can already simulate the "unit" option by setting the interface
name as "ppp${unit}" and retrieving the kernel assigned id with
ioctl(PPPIOCGUNIT). What's wrong with that?

> I hit above problem, so now I'm migrating all pppd setups from "ifname"
> to "unit" option.

Why did you write 3125f26c51482 ("ppp: Fix generating ppp unit id when
ifname is not specified") then?

