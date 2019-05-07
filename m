Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C893E160FA
	for <lists+linux-ppp@lfdr.de>; Tue,  7 May 2019 11:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfEGJdG (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 7 May 2019 05:33:06 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42052 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbfEGJdF (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Tue, 7 May 2019 05:33:05 -0400
Received: by mail-lf1-f66.google.com with SMTP id w23so11303648lfc.9
        for <linux-ppp@vger.kernel.org>; Tue, 07 May 2019 02:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hE0tGFZInJasil0DMyANrcRCEy3iRRwz1piA5wDFZiU=;
        b=tU5huayaeutIf1jyzqdGs2S5QuwuPOXGaJxetgSnLbgoB5TDqvcM24iqI3RCrU5DZ9
         nVvj5/x6wUXeUBGEsV3xVAllMU/qTXVLPFyXCP8gP93qmTCZX1J8mD9VIKBVQT032uty
         St0/2JA4A2gKj/e3oyk9cMcvQ+BT/uroRPjF3KJxrqaNB/4ccOglRk9BdK82LYKnNbyq
         x4mhnOm+BhSooWJFVywVZtraMUsDRccZvLLeMg/+sVV5rmzARFdFyei8FcyGjgxchgtA
         pHKZAEOof3hhXiboT5N+iBvFiVlkipQosTPCbGs6kQYRRo3F1CB3XhzId9IrC+1UB2jj
         50wA==
X-Gm-Message-State: APjAAAXZnpF/6GRMdR0GQpL/VmxHRj+Vy9Pb0Ka8ucAMl1c8WCxIsTAa
        g8jcFsMZCzp2dQ5/ZPh7gc+vHq09XgDeIoIRSauh3A==
X-Google-Smtp-Source: APXvYqy1nXzRE6oSr9dQpsM0uTKmUFqWEbGu+5Jqjy9kBSUABK4uqELy/3A+cULnx/jdXYZQ/BuUlSt3U1JQyDfwXxs=
X-Received: by 2002:ac2:5621:: with SMTP id b1mr5823858lff.27.1557221583694;
 Tue, 07 May 2019 02:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190504164853.4736-1-mcroce@redhat.com> <20190507091034.GA3561@jackdaw>
In-Reply-To: <20190507091034.GA3561@jackdaw>
From:   Matteo Croce <mcroce@redhat.com>
Date:   Tue, 7 May 2019 11:32:27 +0200
Message-ID: <CAGnkfhwVvF4qcqoU6wC8tCb6vrvNipP0UG4MxqAd1--5fLmjQg@mail.gmail.com>
Subject: Re: [PATCH pppd v4] pppoe: custom host-uniq tag
To:     Tom Parkin <tparkin@katalix.com>
Cc:     linux-ppp@vger.kernel.org, netdev <netdev@vger.kernel.org>,
        Paul Mackerras <paulus@ozlabs.org>,
        Jo-Philipp Wich <jo@mein.io>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Tue, May 7, 2019 at 11:10 AM Tom Parkin <tparkin@katalix.com> wrote:
>
> Hi Matteo,
>
> On Sat, May 04, 2019 at 06:48:53PM +0200, Matteo Croce wrote:
> > Add pppoe 'host-uniq' option to set an arbitrary
> > host-uniq tag instead of the pppd pid.
> > Some ISPs use such tag to authenticate the CPE,
> > so it must be set to a proper value to connect.
> >
> > Signed-off-by: Matteo Croce <mcroce@redhat.com>
> > Signed-off-by: Jo-Philipp Wich <jo@mein.io>
> > ---
> >  pppd/plugins/rp-pppoe/common.c          | 14 +++----
> >  pppd/plugins/rp-pppoe/discovery.c       | 52 ++++++++++---------------
> >  pppd/plugins/rp-pppoe/plugin.c          | 15 ++++++-
> >  pppd/plugins/rp-pppoe/pppoe-discovery.c | 41 ++++++++++++-------
> >  pppd/plugins/rp-pppoe/pppoe.h           | 30 +++++++++++++-
> >  5 files changed, 96 insertions(+), 56 deletions(-)
> >

Hi Tom,

this was a known bug of the v3 patch, I've fixed it in the v4.

Regards,
-- 
Matteo Croce
per aspera ad upstream
