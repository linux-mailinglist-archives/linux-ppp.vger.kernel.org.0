Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317F948535E
	for <lists+linux-ppp@lfdr.de>; Wed,  5 Jan 2022 14:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237074AbiAENTg (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 5 Jan 2022 08:19:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43786 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240107AbiAENTe (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 5 Jan 2022 08:19:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641388773;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7mMRb17QN6XzgQlrzxtDXtE5EDZ+dGN19op16rmPahE=;
        b=RMaSahzGIMuObIbLltF1Xl0myVumFN+FlTexaZRtozjGnaiX/uCbijc6dziMswE8DFTIFC
        m3bw/Tzs1ISsO705oAePQo2LA69wRmmmbvUajg9mZgs832omhtoV9WjFx1eUR2hr31cCnH
        76kQGK9mYzWtXHysDiTMNvQ8JRu300I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-gAh1xYBSNladZZT9v4fHNw-1; Wed, 05 Jan 2022 08:19:32 -0500
X-MC-Unique: gAh1xYBSNladZZT9v4fHNw-1
Received: by mail-wr1-f70.google.com with SMTP id k4-20020adfc704000000b001a32d86a772so9101541wrg.5
        for <linux-ppp@vger.kernel.org>; Wed, 05 Jan 2022 05:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7mMRb17QN6XzgQlrzxtDXtE5EDZ+dGN19op16rmPahE=;
        b=12tMpV+pbwfhYstMY/ZXSnjLkXl06kG9O0uhdR9/40vXLT/5SR9zO8JVdPBVoceR6q
         W3PXq+xJ8d8tYlBWBFEkP98ZNiz3jMr3EZs7Xu52/YvOGCrPeg0MhWq+S2/LJPdJAGTT
         AdRRkbmS22kozdm3XX8tRpuxFUIOK1nrIoWyGBW5J1vNYNMicpqByG8k6pCyheJ78B1/
         Mk2fMDODIa+Vl5aYrsifvX8MZBYX4tPVhbSkKlr968VIEyG6M3PPmSvn/qiJf4lCqoMx
         Lhsve7BrINUMlC/gQdNMg7Ba5ToDwH/cLIv5AUsHrqmQESbzd6twAD1PR6Fj8rN1efB/
         g4bQ==
X-Gm-Message-State: AOAM531zJ96rz6rq8ziwzYgckDoetWBEipu5VP607+zJS4lnmUCoR2Gk
        bhlyrKg0xWsmYnkjBFTHWHe8DbOY+Z/+SxWve4peUcc/8sopUW6poZ1Qf+Ljpi6SCcuxeytTgzU
        UAmERfFSIkqW8NS1+d6zc
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr46890005wrs.527.1641388771552;
        Wed, 05 Jan 2022 05:19:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQScj6hdnqqFA+e8E8PLZfTEJbd+OlNtelJwRlLiyuB+9CZ+3oM6u8DVU0ok36Nic/ew5TmQ==
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr46889990wrs.527.1641388771377;
        Wed, 05 Jan 2022 05:19:31 -0800 (PST)
Received: from pc-1.home (2a01cb058d24940001d1c23ad2b4ba61.ipv6.abo.wanadoo.fr. [2a01:cb05:8d24:9400:1d1:c23a:d2b4:ba61])
        by smtp.gmail.com with ESMTPSA id h204sm2670787wmh.33.2022.01.05.05.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 05:19:30 -0800 (PST)
Date:   Wed, 5 Jan 2022 14:19:29 +0100
From:   Guillaume Nault <gnault@redhat.com>
To:     Eric Dumazet <eric.dumazet@gmail.com>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org,
        syzbot <syzkaller@googlegroups.com>
Subject: Re: [PATCH net] ppp: ensure minimum packet size in ppp_write()
Message-ID: <20220105131929.GA17823@pc-1.home>
References: <20220105114842.2380951-1-eric.dumazet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105114842.2380951-1-eric.dumazet@gmail.com>
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Wed, Jan 05, 2022 at 03:48:42AM -0800, Eric Dumazet wrote:
> From: Eric Dumazet <edumazet@google.com>
> 
> It seems pretty clear ppp layer assumed user space
> would always be kind to provide enough data
> in their write() to a ppp device.
> 
> This patch makes sure user provides at least
> 2 bytes.
> 
> It adds PPP_PROTO_LEN macro that could replace
> in net-next many occurrences of hard-coded 2 value.

The PPP header can be compressed to only 1 byte, but since 2 bytes is
assumed in several parts of the code, rejecting such packets in
ppp_xmit() is probably the best we can do.

Acked-by: Guillaume Nault <gnault@redhat.com>

