Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C97DB3E7C80
	for <lists+linux-ppp@lfdr.de>; Tue, 10 Aug 2021 17:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242183AbhHJPkR (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 10 Aug 2021 11:40:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34138 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243517AbhHJPkJ (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Tue, 10 Aug 2021 11:40:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628609986;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PosN/BQlgO407DGmnaZ7DbLvbofuu3rHwhQkO8w4Da4=;
        b=iEOqYrXBdfer7vQ4GGllXdVGK5qW9J8iPyDkjpUN2Abgxvinps7msVDeXgJfl1fRlkSmSp
        KVJPv4dzyPkB0lRa85kirT+oboiBlxYQiI8m2I5zd+A9H4S+tLyw7kw9b2b9CAQeongKIp
        7GKIZ5MWGWy7SQLAlYkQzoiqhcxsKSo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-8_YsGydRMCWc5bnBcTjyFg-1; Tue, 10 Aug 2021 11:39:45 -0400
X-MC-Unique: 8_YsGydRMCWc5bnBcTjyFg-1
Received: by mail-wr1-f71.google.com with SMTP id a9-20020a0560000509b029015485b95d0cso6563998wrf.5
        for <linux-ppp@vger.kernel.org>; Tue, 10 Aug 2021 08:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PosN/BQlgO407DGmnaZ7DbLvbofuu3rHwhQkO8w4Da4=;
        b=P1UDrT69uE2137PWejkCVmCfVuscv9NZ9TL6asXmeMy8CkklpdMFxaU1IC4h14TOlI
         9tQ4ly5S9s/+s+nS2MPZgTS+uXOGKx5qnPjeDOMR8agZFUYdMTYbxLGT5X3Z7qgjABJm
         mRHbjmNLurPZghYXuY+lq9X7hN1oONEokoWgsI5Y4Do7essuXjGKIfH2uGpZMugQ97+A
         jQxdNop2J7F2B1Mf3Q/TdqTF0uPZONpHoEw0XgkLMM7gj9uAhAZT+O67q4ZLMHz9uFY5
         ByYz/cYf91WtAQMGVlGpvgpuQ5gAJONAD3OvKIfmdpsB1AIeNGpGPAkvBaIoI6OLB9r6
         v3QQ==
X-Gm-Message-State: AOAM533fubvnJ6GQCHmOQ8O5+PJiEGjs8h1yI4YilJzMiuxZX2IjZ+15
        YHr2LbbezCgZ/HwSepyqN4xFOWFaPuHxHTk6sfB1Vk3K1hHrcunIscF3GWtUhASpbNrJM+4syoc
        wXnT08TOxbHa2ue1A7UWh
X-Received: by 2002:a1c:7d06:: with SMTP id y6mr3626182wmc.7.1628609984549;
        Tue, 10 Aug 2021 08:39:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw72W8jCGvxKisUudy1C9Uk3WRrkPv1bMEx4uTRO/fxaJ6DDCtTXdBXdyOy3DU2WnJ8uX49ww==
X-Received: by 2002:a1c:7d06:: with SMTP id y6mr3626164wmc.7.1628609984390;
        Tue, 10 Aug 2021 08:39:44 -0700 (PDT)
Received: from pc-32.home (2a01cb058918ce00dd1a5a4f9908f2d5.ipv6.abo.wanadoo.fr. [2a01:cb05:8918:ce00:dd1a:5a4f:9908:f2d5])
        by smtp.gmail.com with ESMTPSA id p8sm3029396wme.22.2021.08.10.08.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 08:39:43 -0700 (PDT)
Date:   Tue, 10 Aug 2021 17:39:41 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>, linux-ppp@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ppp: Add rtnl attribute IFLA_PPP_UNIT_ID for specifying
 ppp unit id
Message-ID: <20210810153941.GB14279@pc-32.home>
References: <20210807163749.18316-1-pali@kernel.org>
 <20210809122546.758e41de@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210809193109.mw6ritfdu27uhie7@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210809193109.mw6ritfdu27uhie7@pali>
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Mon, Aug 09, 2021 at 09:31:09PM +0200, Pali Rohár wrote:
> Better to wait. I would like hear some comments / review on this patch
> if this is the correct approach as it adds a new API/ABI for userspace.

Personally I don't understand the use case for setting the ppp unit at
creation time. I didn't implement it on purpose when creating the
netlink interface, as I didn't have any use case.

On the other hand, adding the ppp unit in the netlink dump is probably
useful.

