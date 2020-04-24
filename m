Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA9EB1B7A66
	for <lists+linux-ppp@lfdr.de>; Fri, 24 Apr 2020 17:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727934AbgDXPpH (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 24 Apr 2020 11:45:07 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:45285 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728243AbgDXPpG (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 24 Apr 2020 11:45:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587743105;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qlBZR+mPVgCswD68XWqSN8zSoWot5Q1RmEimrdlHwLI=;
        b=jFM2rlnk3et/HiRHjklnNUHNpvDmnqVJMuEAK0iQOpeN2eQ++JK1e6hK+05Q5/+U+hb4Er
        SHjv5iSoSdWkepiz1C9uVicMyy8xVd+Qz467gwd1XhwNlKWOgb68xIBwr1eVEO0f/OyAZy
        T7RVE1f5H+NIDjE8spTEM5aSw5x+vuw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-d8EnH-TEMQa0QZpnLxt3OQ-1; Fri, 24 Apr 2020 11:45:03 -0400
X-MC-Unique: d8EnH-TEMQa0QZpnLxt3OQ-1
Received: by mail-wm1-f71.google.com with SMTP id d134so5571927wmd.0
        for <linux-ppp@vger.kernel.org>; Fri, 24 Apr 2020 08:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qlBZR+mPVgCswD68XWqSN8zSoWot5Q1RmEimrdlHwLI=;
        b=PnVAl+AG62q0EYUnIpTq4ZgAe/Qjmf/jbJdlYPA+twGx7fQARZ64nXMX4idde8cJXJ
         9a4E5InMma6M5LsuV6dbjVA7EPodY0g8sURiqAJtq79V3ekQB4OE0V7gRtu3aUpwIfyv
         bMeKSZ+DdL+Pv74UkIkvLM1/YwGgU/uc2udvdnTIkiq6l1KLcE23xLAbhq4u5976b/po
         lEzEdPxh/iRmBBZh4D2vpkhzuLHBWbmwdcPESLxt7N8tViPQUN1RodzCVIZNKOqeleAf
         +ox19EKSthK+TZ0Q1axCYo+3mdGtfjVehLpWdgUNm6EIgDYOP9wXk0mJo3IYNuIW5OjZ
         2Dxw==
X-Gm-Message-State: AGi0Pub60ubH7b5OvSDxcH+LlR0Sp85TaojArTJYPCiVg/guG3ecXmtq
        xbqNIEvXcWQGLfjFeqAhm0T6uHVx5fulFvHbuaXoWd8Wtcr2Hi7oNwYZvynxq1VIrnHO31uUTNo
        zyYMovuJ67mnSwOwiZ66o
X-Received: by 2002:adf:ee05:: with SMTP id y5mr11416541wrn.176.1587743102443;
        Fri, 24 Apr 2020 08:45:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypKqeNxRe1ePWyPp8w+WlMSTXrCi8Ik/Nt8Wjh98JqXyc+QQXj9kExyV1nchwdOX4bW535fwyQ==
X-Received: by 2002:adf:ee05:: with SMTP id y5mr11416528wrn.176.1587743102269;
        Fri, 24 Apr 2020 08:45:02 -0700 (PDT)
Received: from pc-3.home (2a01cb0585138800b113760e11343d15.ipv6.abo.wanadoo.fr. [2a01:cb05:8513:8800:b113:760e:1134:3d15])
        by smtp.gmail.com with ESMTPSA id w12sm9073093wrk.56.2020.04.24.08.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 08:45:01 -0700 (PDT)
Date:   Fri, 24 Apr 2020 17:44:59 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     David =?utf-8?Q?Bala=C5=BEic?= <xerces9@gmail.com>
Cc:     linux-ppp@vger.kernel.org
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-ID: <20200424154459.GA21114@pc-3.home>
References: <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com>
 <21061.1587602497@localhost>
 <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com>
 <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
 <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
 <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
 <7689.1587657698@localhost>
 <CAPJ9Yc9rdbwd0OTcJhmuqG_r6qPfYKwiScLOxiwe41_ye_PNGw@mail.gmail.com>
 <CAPJ9Yc9uuOKk=fh3Ke7riuZN2JgB2Ma3F2Njy69_6nms1kC=bQ@mail.gmail.com>
 <CAPJ9Yc_iOxyDzrL9cs_ERSEjnVttYgk4JFqhO7T=yg03420LMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPJ9Yc_iOxyDzrL9cs_ERSEjnVttYgk4JFqhO7T=yg03420LMA@mail.gmail.com>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Fri, Apr 24, 2020 at 03:47:34PM +0200, David Balažic wrote:
> On Thu, 23 Apr 2020 at 21:36, David Balažic <xerces9@gmail.com> wrote:
> >
> > OK, more data:
> > I started tcpdump with the -e option as suggested on openwrt forum:
> > tcpdump -e -v -i eth1.3902 pppoed
> >
> > on disconnect, this was logged (times are UTC):
> >
> >
> > tcpdump: listening on eth1.3902, link-type EN10MB (Ethernet), capture
> > size 262144 bytes
> > 18:23:09.204991 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
> > (oui Unknown), ethertype PPPoE D (0x8863), length 97: PPPoE PADO
> > [Service-Name] [AC-Name "SIMB_TABOR_BNG1"] [Host-Uniq
> > 0x44************long_number******************************AA]
> > [AC-Cookie ".5b************v"]
> 
> Isnt this strange? The dst addr is not my router or any other known.
> Also the Host-Uniq value is different.
> As if is traffic meant for someone else.
> 
You're probably not supposed to receive this frame, but a PADO
shouldn't disconnect you. If that was a PADT, then yes, it'd be a good
suspect.

