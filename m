Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20BCA1BAF7E
	for <lists+linux-ppp@lfdr.de>; Mon, 27 Apr 2020 22:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgD0Uap (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 27 Apr 2020 16:30:45 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57257 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726205AbgD0Uap (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 27 Apr 2020 16:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588019443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CnOEd9wTnrDxJLMVHyWKID/RIQLeuf7tPHJoWplkdkw=;
        b=i2IkSJx+U9lpH9xN7/g2BAZtqSuqjg1V0jM9NaZZ/T62tONkVBUI4uVQr1s4OtMdcQedSK
        pasU1gFP8hrFjBeD3PDdYXAKh7bpcPmYtyGmwx7SaOkSx8AN0+gtfb+4py38w6qDk0Bvmi
        fHP1iImz05tjJdXPR5+NEhxF3TrFBEI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-30zqlqd6MV6A5LLc7YDjnw-1; Mon, 27 Apr 2020 16:30:40 -0400
X-MC-Unique: 30zqlqd6MV6A5LLc7YDjnw-1
Received: by mail-wr1-f71.google.com with SMTP id j22so11203628wrb.4
        for <linux-ppp@vger.kernel.org>; Mon, 27 Apr 2020 13:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CnOEd9wTnrDxJLMVHyWKID/RIQLeuf7tPHJoWplkdkw=;
        b=dk7YqWtwnQHCcWgQs684gRaeXandYYAaqfddzrhQFqGs/i6ER9V5mlK5xxm+HAChLa
         5jwfZnbPJFoZ68wytcAU66FRQ0q7Up8ri97WRjFLPoR4KHFWirDfPBzIkMF/XWqf9a4/
         C5M9p8xdgw3RY1K90Xfnhs9uz+TzQ+HuhHvzEKnwtbobLQImzCaxw7iHT8pWPxqYjqga
         1Hr3lG/oW6eT4iajABMcN2jpcihQjAGBLsF9T4gGrooAmysONQyqj7+oStYwXMD43lck
         8vEwHTorbyjExVH3XXd5gq7njRvAvKQ1Olr+5eLFDKi3ED7KXB7izNZQChaY91/gsvcY
         HfoQ==
X-Gm-Message-State: AGi0PubjRxQOVCanQuGm7wzOghuZubMehVFjEMj+HTy8O77VeTFZDoU/
        8uIuCYKa6d8PEx+MPtu1m6W+eJkV1+DLJBSn5aj2PVCKFNCoMMtONxXGBLjVWLd55DNlYj7RnQQ
        evxR/exKuImN9zI9Gr6Gm
X-Received: by 2002:a5d:4e06:: with SMTP id p6mr28569297wrt.35.1588019437300;
        Mon, 27 Apr 2020 13:30:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypIEBWL//1wx8z407kDJjBmBmfS9RJKLfJl8uNXQFb2uNYvHd3QCiTWknO2Iqyo659gH98V44w==
X-Received: by 2002:a5d:4e06:: with SMTP id p6mr28569277wrt.35.1588019437050;
        Mon, 27 Apr 2020 13:30:37 -0700 (PDT)
Received: from pc-3.home (2a01cb0585138800b113760e11343d15.ipv6.abo.wanadoo.fr. [2a01:cb05:8513:8800:b113:760e:1134:3d15])
        by smtp.gmail.com with ESMTPSA id i17sm22346283wru.39.2020.04.27.13.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 13:30:36 -0700 (PDT)
Date:   Mon, 27 Apr 2020 22:30:34 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     David =?utf-8?Q?Bala=C5=BEic?= <xerces9@gmail.com>
Cc:     Michael Richardson <mcr@sandelman.ca>, linux-ppp@vger.kernel.org
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-ID: <20200427203034.GA4949@pc-3.home>
References: <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
 <7689.1587657698@localhost>
 <CAPJ9Yc9rdbwd0OTcJhmuqG_r6qPfYKwiScLOxiwe41_ye_PNGw@mail.gmail.com>
 <CAPJ9Yc9uuOKk=fh3Ke7riuZN2JgB2Ma3F2Njy69_6nms1kC=bQ@mail.gmail.com>
 <CAPJ9Yc_iOxyDzrL9cs_ERSEjnVttYgk4JFqhO7T=yg03420LMA@mail.gmail.com>
 <29906.1587865115@localhost>
 <CAPJ9Yc-Tj+pLJ_vfLuERUi-2oGadeaWTJSkDFNw0rLoqMCmL3Q@mail.gmail.com>
 <CAPJ9Yc8AQZnATT07zUC0397vSGCuuh8STyQRbdBk5LLPp3Xfyg@mail.gmail.com>
 <5466.1587953651@localhost>
 <CAPJ9Yc_9E5PjDf7duYusKo3KnQ8kXUA7xkdiNgc2Vtsu3ufEUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPJ9Yc_9E5PjDf7duYusKo3KnQ8kXUA7xkdiNgc2Vtsu3ufEUg@mail.gmail.com>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Mon, Apr 27, 2020 at 11:59:25AM +0200, David Balažic wrote:
> On Mon, 27 Apr 2020 at 04:14, Michael Richardson <mcr@sandelman.ca> wrote:
> >
> >
> > David Balažic <xerces9@gmail.com> wrote:
> >     > Sun Apr 26 17:34:57 2020 daemon.debug pppd[20289]: sent [IPV6CP
> >     > ConfReq id=0x1 <addr fe80::d035:60ed:928e:f741>]
> >     > Sun Apr 26 17:35:00 2020 daemon.debug pppd[20289]: sent [IPV6CP
> >     > ConfReq id=0x1 <addr fe80::d035:60ed:928e:f741>]
> >     > Sun Apr 26 17:35:03 2020 daemon.debug pppd[20289]: sent [IPV6CP
> >     > ConfReq id=0x1 <addr fe80::d035:60ed:928e:f741>]
> >     > Sun Apr 26 17:35:06 2020 daemon.debug pppd[20289]: sent [IPV6CP
> >     > ConfReq id=0x1 <addr fe80::d035:60ed:928e:f741>]
> >     > Sun Apr 26 17:35:09 2020 daemon.warn pppd[20289]: IPV6CP: timeout
> >     > sending Config-Requests
> >
> > Could this be the reason for the hangup?
> > pppd gets tired of no IPv6, decides it should hangup?
> 
> These lines are logged in the 30 seconds after the connection is
> established. Later they never show up. It was like that for all
> connections thus far.
> 
Your provider doesn't support IPv6. As James pointed out, it isn't even
capable of reporting that fact. So your device keeps trying for a few
seconds. Nothing to worry about (appart that you won't have IPv6
connectivity of course).

> >     > The strange part is in the tcpdump there is a PADT sent to an
> >     > "unknown" MAC and my pppd responds. At least that is how I see it.
> >
> >     > You think NOT putting the interface into promiscuous mode (done by
> >     > tcpdump) would prevent this?
> >     > Anyway, now I startted tcpdump with the -p option:  tcpdump -e -v -p
> >     > -i eth1 vlan 3902 and pppoed
> >
> > It could be that promisc mode (no -p) means that the PADT makes something
> > break, different than what you are investigating.  -p avoid promisc mode, so
> > would avoid seeing that packet.
> >
> > You mention in another thread that you were trying to do DHCPv6 on a
> > different (non-PPPoE) interface.  I don't see how that would matter unless
> > the failure caused netifd to decide to retry it all.
> >
> > It seems that you ought to try the noipv6 option to pppd.
> 
> I removed it (from the system config, the file /etc/config/network ).
> I also removed that "other interface", so there is no IPv6 stuff left.
> The new command line is:
> /usr/sbin/pppd nodetach ipparam wan ifname pppoe-wan lcp-echo-interval
> 1 lcp-echo-failure 5 lcp-echo-adaptive nodefaultroute usepeerdns
> maxfail 1 user YYYYYY password XXXXX ip-up-script /lib/netifd/ppp-up
> ip-down-script /lib/netifd/ppp-down mtu 1492 mru 1492 plugin
> rp-pppoe.so nic-eth1.3902
> 
> For the record: The new connection with new settings was started on
> Mon Apr 27 09:47:48 (UTC)
> 

