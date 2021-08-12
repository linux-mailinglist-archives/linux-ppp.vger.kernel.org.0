Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8434A3EA1DA
	for <lists+linux-ppp@lfdr.de>; Thu, 12 Aug 2021 11:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235463AbhHLJUN (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 12 Aug 2021 05:20:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26286 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235414AbhHLJUM (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 12 Aug 2021 05:20:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628759987;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6uptNExuKEIuNgoc8EcEJuQBa/x6m5qowXa+uwaPt9E=;
        b=T63lv2n4z6mmUk7Z5nz6W0It6rDMmtx0zK0gM5rzFLovRpOyHxkUiSf4aMx5PnVZVqdk17
        uIIGAqRXUNbC1h0LakVsBjc9Me9goDZHHZmh7iKNy+AF9ZFjKPWrd9Bv3XzwtB58SHMwQI
        wvKMRaZHpv3SNTP1UaWTnAL7aD4OrvY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-HH5akuJ4MLiVIGrgQgQfCA-1; Thu, 12 Aug 2021 05:19:45 -0400
X-MC-Unique: HH5akuJ4MLiVIGrgQgQfCA-1
Received: by mail-wm1-f72.google.com with SMTP id 11-20020a05600c024bb02902e679d663d1so1637042wmj.1
        for <linux-ppp@vger.kernel.org>; Thu, 12 Aug 2021 02:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6uptNExuKEIuNgoc8EcEJuQBa/x6m5qowXa+uwaPt9E=;
        b=uIojD4RN02Bdp2SqsrYtxzp7f63uBaVYgQvxXn3YdmfA3YZCgYF6dcNnTKcwk2ANbL
         0Tf+lhGmhDqg4E/zLHrq2br/LNtvEE+z1LIHAp8Lr/aTXkZq9sgopNXSC6pLbCw9slfJ
         noNh86Eu7NHgVJ0qivqKss6ElC6Q9jngSA+VdL9cOemICdmtPYeFeeoNJcPWHQPaFMaw
         X7dL5x4YuoreDvZzJwfmzRAA6RBHpKQD5OWChu/34z526IQYzxoYji58HxZJ77puGlkT
         vs3Mmzdf7RRbJLgHRiECRAv7NtxaONEjuchsq/UuqBy6DIpll81jaj+4rOmXbyR6FKyT
         ae1g==
X-Gm-Message-State: AOAM533gmw4F7/UAbcYooaLzU/Y/UL2sq44bFNyuByxc2PrGGkGupbnE
        rKi7U/86CkWlh2ppvPdLzEpKZpL91eT9dDR97rcdGpV/ylOe1lSIHB3modH9NitF/kxv/5+nT79
        QS2lzlkmSsJG+2ZQE0ENG
X-Received: by 2002:a5d:4ac5:: with SMTP id y5mr2932783wrs.125.1628759983680;
        Thu, 12 Aug 2021 02:19:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBFx0oSmW5sgQYRFuFDFnUpMMCJ5QwPr8hMO8QynVlV2y6epDdIA01tsvcamaxfJPRDC0IOw==
X-Received: by 2002:a5d:4ac5:: with SMTP id y5mr2932774wrs.125.1628759983518;
        Thu, 12 Aug 2021 02:19:43 -0700 (PDT)
Received: from pc-23.home (2a01cb058d01b600c841afd12834a14e.ipv6.abo.wanadoo.fr. [2a01:cb05:8d01:b600:c841:afd1:2834:a14e])
        by smtp.gmail.com with ESMTPSA id e25sm2712231wra.90.2021.08.12.02.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 02:19:43 -0700 (PDT)
Date:   Thu, 12 Aug 2021 11:19:41 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>, linux-ppp@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ppp: Add rtnl attribute IFLA_PPP_UNIT_ID for specifying
 ppp unit id
Message-ID: <20210812091941.GA3525@pc-23.home>
References: <20210807163749.18316-1-pali@kernel.org>
 <20210809122546.758e41de@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210809193109.mw6ritfdu27uhie7@pali>
 <20210810153941.GB14279@pc-32.home>
 <20210810160450.eluiktsp7oentxo3@pali>
 <20210811171918.GD15488@pc-32.home>
 <20210811175449.5hrwoevw7xv2jxxn@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210811175449.5hrwoevw7xv2jxxn@pali>
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Wed, Aug 11, 2021 at 07:54:49PM +0200, Pali Roh�r wrote:
> On Wednesday 11 August 2021 19:19:18 Guillaume Nault wrote:
> > On Tue, Aug 10, 2021 at 06:04:50PM +0200, Pali Roh�r wrote:
> > > On Tuesday 10 August 2021 17:39:41 Guillaume Nault wrote:
> > > > On Mon, Aug 09, 2021 at 09:31:09PM +0200, Pali Roh�r wrote:
> > > > > Better to wait. I would like hear some comments / review on this patch
> > > > > if this is the correct approach as it adds a new API/ABI for userspace.
> > > > 
> > > > Personally I don't understand the use case for setting the ppp unit at
> > > > creation time.
> > > 
> > > I know about two use cases:
> > > 
> > > * ppp unit id is used for generating network interface name. So if you
> > >   want interface name ppp10 then you request for unit id 10. It is
> > >   somehow common that when ppp interface has prefix "ppp" in its name
> > >   then it is followed by unit id. Seems that existing ppp applications
> > >   which use "ppp<num>" naming expects this. But of course you do not
> > >   have to use this convention and rename interfaces as you want.
> > 
> > Really, with the netlink API, the interface name has to be set with
> > IFLA_IFNAME. There's no point in adding a new attribute just to have a
> > side effect on the device name.
> 
> Yes, if you set IFLA_IFNAME then interface has name which you set. But
> if IFLA_IFNAME is not set then there is already API/ABI behavior how
> this interface name is generated. And all existing ppp software depends
> on it.

They depend on the ioctl api, which is not going to change.
The netlink api on the other hand is free to avoid propagating mistakes
from the past.

> > > * Some of ppp ioctls use unit id. So you may want to use some specific
> > >   number for some network interface. So e.g. unit id 1 will be always
> > >   for /dev/ttyUSB1.
> > 
> > But what's the point of forcing unit id 1 for a particular interface?
> > One can easily get the assigned unit id with ioctl(PPPIOCGUNIT).
> 
> Same point as ability to assign any other id to objects. It is
> identifier and you may want to use specific identifier for specific
> objects.

Again, what's the use case? Unit ids are kernel internal identifiers.
The only purpose of setting them from user space was to influence the
name of the ppp device for legacy systems that couldn't do that in a
clean way. But any system with the netlink interface won't need this
work around.

> Old ioctl API provides a way how to set this custom unit id. Why should
> somebody use new rtnl API if it provides only half of features?

You still haven't provided any use case for setting the unit id in user
space, appart for influencing the interface name. Netlink also allows
to set the interface name and provides much more features (like
creating the device in a different netns).

> Existing
> software already use this feature to allow users / administrators to
> specify ids as they want.

And that was a mistake, as you realised when working on
https://lore.kernel.org/netdev/20210807160050.17687-1-pali@kernel.org/t/#u.

> > > And with unit id there also another issue:
> > > https://lore.kernel.org/netdev/20210807160050.17687-1-pali@kernel.org/t/#u
> > 
> > This patch shows why linking unit id and interface name are a bad idea.
> 
> Yea... It is not a good idea, but it is how ppp is implemented in
> kernel since beginning. And it affects both ioctl and rtnl APIs. So we
> cannot do anything with it due to backward compatibility :-(

Sorry, but I still hardly see the problem with the netlink api.
I shouldn't have accepted to let the unit id influence the interface
name, true. But that doesn't seem to be what you're complaining about.
Also, it could be useful to add the unit id in netlink dumps. But we
already agreed on that.

> > Instead of adding more complexity with unit id, I'd prefer to have a
> > new netlink attribute that says "don't generate the interface name
> > based on the unit id". That's how the original implementation worked by
> > the way and I'm really sad I accepted to change it...
> 
> Main issue there is that kernel currently does not provide any way how
> to retrieve interface which was created by rtnl call. So matching
> interface name by string "ppp" followed by unit id is currently the only
> option.

Yes, that's an old limitation of rtnl. But it's a much more general
problem. A work around is to set the interface name in the netlink
request. I can't see how forcing the unit id could ever help.

> I must admit that ppp rtnl API was designed incorrectly. If it was able
> to solve this issue since beginning then this unit id <--> interface
> mapping did not have to been implemented in rtnl code path.

As I already proposed, we can add an attribute to make the interface
name independant from the unit id.

> But it is too late now, if rtnl API has to be backward compatible then
> its behavior needs to be as it is currently.

Adding a new attribute is always possible.

> > > But due to how it is used we probably have to deal with it how ppp unit
> > > id are defined and assigned...
> > > 
> > 
> 

