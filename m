Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97EFA1C3951
	for <lists+linux-ppp@lfdr.de>; Mon,  4 May 2020 14:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgEDM1u (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 4 May 2020 08:27:50 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25144 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728009AbgEDM1t (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 4 May 2020 08:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588595268;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jISNqT2tKlqzNpVYZwi5Er8ZieOdgsurT2tIuLhzdlc=;
        b=ESxjdN5rhqY5d/N8oseq3Ak53Ypy4AmSGXw/ncSdIYTlB73KBXmJQpK9l+p+XU16VbjG3N
        E0jn6iM79UqeigPxV0i/MrvJpXxLT3slzvmkUZeVB1plCZ5AN1ZKMZSBZUsq8M0riBce3I
        RbniBartpFN2nGBFHr98lzp+25mZ16Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-M79_3XmONl6A0bFiYfpdUQ-1; Mon, 04 May 2020 08:27:45 -0400
X-MC-Unique: M79_3XmONl6A0bFiYfpdUQ-1
Received: by mail-wr1-f72.google.com with SMTP id m5so10635150wru.15
        for <linux-ppp@vger.kernel.org>; Mon, 04 May 2020 05:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jISNqT2tKlqzNpVYZwi5Er8ZieOdgsurT2tIuLhzdlc=;
        b=aW2Vii3+0eEj0RmVbGmtErgB74NO8zVfnPcDcLX/QFnJSpdQhursbxx96sdiZh2jU8
         SQX2/G8z7FqBclSBL7fQE6tnc1hbjmaOrXg/BrfDv+VJPgc3X9zfv+TPmLpImBb8FplS
         JyE3MTrPhKvnmqn/izQn+24vTfpoVD1bsklHodhRpPRnnOIJQI1mmuFxoepiLPD2ABAd
         ydTK3EIS1bG31aLI7IBWzPfxjl0JgiRLAvTRYFCCqGqW1MqfaHmdnOkYZ+eiWSGDoSot
         W+adXKmAFekAkBU12WQqDUpQOTemUOnKkHebOuccGUExgaGKYdBqMLwqOvt4Iurdj5lZ
         vojw==
X-Gm-Message-State: AGi0PuZkaIbf89KBfJ74OLFDwGL5xp26DULaMWR/3M6mGBEXMKgmHjFa
        HtflZTkw+gDFjSZ8cu1SamfyFM8J2eUuXukoSKq/iZr3SWaEtvHfLzBw9D6UD2GydcWUQRRK1vO
        gPbzP1HanTAzAsWwb9//b
X-Received: by 2002:a5d:658c:: with SMTP id q12mr20398327wru.128.1588595263760;
        Mon, 04 May 2020 05:27:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypKjuDq4/mxd8kBBpzp4TVmerGt2tJdwXrZ0mTtaaCfaSmzN25V67oPhXer+qxuf3+F5jYTNjg==
X-Received: by 2002:a5d:658c:: with SMTP id q12mr20398309wru.128.1588595263527;
        Mon, 04 May 2020 05:27:43 -0700 (PDT)
Received: from pc-3.home (2a01cb0585138800b113760e11343d15.ipv6.abo.wanadoo.fr. [2a01:cb05:8513:8800:b113:760e:1134:3d15])
        by smtp.gmail.com with ESMTPSA id t17sm18277841wro.2.2020.05.04.05.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 05:27:42 -0700 (PDT)
Date:   Mon, 4 May 2020 14:27:40 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     David =?utf-8?Q?Bala=C5=BEic?= <xerces9@gmail.com>
Cc:     linux-ppp@vger.kernel.org
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-ID: <20200504122740.GA27585@pc-3.home>
References: <21061.1587602497@localhost>
 <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com>
 <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
 <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
 <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
 <20200424155459.GB21114@pc-3.home>
 <CAPJ9Yc_kHZKCSG7o7YtU7YCvAF4+OPm9MJzYK12mmQOg5FQD2w@mail.gmail.com>
 <CAPJ9Yc82m71opZ5nkxqtGuJ8rsuY83opnZPOiS7_DWjiC4JFrg@mail.gmail.com>
 <20200428110033.GA25921@pc-3.home>
 <CAPJ9Yc_nBzy5zWPBAOgD2FPmnOegHUEYi+vpURtwm8z9wHeoQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPJ9Yc_nBzy5zWPBAOgD2FPmnOegHUEYi+vpURtwm8z9wHeoQw@mail.gmail.com>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Wed, Apr 29, 2020 at 01:58:37PM +0200, David Balažic wrote:
> Next disconnect:
> 
> NOTE: c4:XX:XX:XX:XX:ed  is my wan interfaces MAC address
> 
> tcpdump -e -v -i eth1 vlan 3902 and pppoed
> 
This puts the parent interface in promiscuous mode.

> tcpdump: listening on eth1, link-type EN10MB (Ethernet), capture size
> 262144 bytes
> ** several PADO and PADS packet sent from server/AC to
> 44:4e:6d:fd:c7:39 before this, during the day **
> 05:03:44.348738 a4:7b:2c:9e:c7:44 (oui Unknown) > 00:0f:94:ef:64:e0
> (oui Unknown), ethertype 802.1Q (0x8100), length 75: vlan 3902, p 1,
> ethertype PPPoE D, PPPoE PADO [Service-Name] [AC-Name
> "SIMB_TABOR_BNG1"] [Host-Uniq 0x960B0000] [AC-Cookie
> 0xDCC3248D61A5D76C7C1DD4138431B17C]
> 06:40:27.668095 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
> (oui Unknown), ethertype 802.1Q (0x8100), length 101: vlan 3902, p 1,
> ethertype PPPoE D, PPPoE PADO [Service-Name] [AC-Name
> "SIMB_TABOR_BNG1"] [Host-Uniq
> 0x444E6DFDC739AAAAAAAA92000000AAAAAAAA4621426F78202020AAAAAAAA]
> [AC-Cookie ".5b.u...~.F.mlKv"]
> 06:40:27.674078 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
> (oui Unknown), ethertype 802.1Q (0x8100), length 62: vlan 3902, p 1,
> ethertype PPPoE D, PPPoE PADS [ses 0x1] [Service-Name] [Host-Uniq
> 0x444E6DFDC739AAAAAAAA92000000AAAAAAAA4621426F78202020AAAAAAAA]

> 06:40:30.552119 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
> (oui Unknown), ethertype 802.1Q (0x8100), length 60: vlan 3902, p 1,
> ethertype PPPoE D, PPPoE PADT [ses 0x1]
> 
Because the interface is in promiscuous mode, this PADT is accepted,
even though the destination MAC address is different from the one of
your interface. That's certainly the reason why you got disconnected
(assuming your PPPoE session Id. was 1).

Also, please avoid wrapping your log lines, that makes them close to
unreadable.

