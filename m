Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8681E1C3F13
	for <lists+linux-ppp@lfdr.de>; Mon,  4 May 2020 17:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgEDPyj (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 4 May 2020 11:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725941AbgEDPyj (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 4 May 2020 11:54:39 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF80C061A0E
        for <linux-ppp@vger.kernel.org>; Mon,  4 May 2020 08:54:38 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id r2so4926891uam.7
        for <linux-ppp@vger.kernel.org>; Mon, 04 May 2020 08:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bC/EavGwQJNEu16czcJB1MPQJWmO9eMBGmZSsWNJ09c=;
        b=QabzX3l9xEfUlOD8FcpNW+HM9dH1LC3E+0PaYaQoWlbbSMOLqkjTSwkJQK19Ntv2EL
         +pIkmoPSwSQLS5C7Fn67/JKTE7d+aX8daSgp1NaG+OXTe8FgDX1LHPb0eLAS1MY1bhPS
         9sEstMYGKEmJbh8lkWnorBh8JbEjW8l9iMeVh4TDqDQG7N9cCRJd+F4nX8BjTHFNLV69
         xrbPX6pZneuZNhoTh+lS/RFAKEuFzApcbog9aQqTWovBGCYuSyJIStWQwXc4dTBWi12d
         uHkPEucjRtq8P9h+xkEScIlCsQWlg3NzsfFxp1t42Ve4nFcm1BdPt/Vs1XGHm1ly910z
         gAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bC/EavGwQJNEu16czcJB1MPQJWmO9eMBGmZSsWNJ09c=;
        b=fMGXV2yVkr0g5KC2IONPqeBK/7BC5+nu4qXHcgCtDcaJuwDmnY0xM0EF8MTWXbll9s
         e7W7TQSvG25TWQ0Uc/IhQhMLZUEZiGjpvtYyAVkjhNQbrr/JvnJATxWEJKRd+gPzzEH0
         tOv7hXpHHHJYsF9Q5Yv5vBVx+48yG51diLsT1mAm8617HoG1rpPXsloA7kZwp/N2RkGv
         48RsgklbAMsML5Ap5FxDuIASFTJc9UgyMECBIIMB3/SbY2z0vWPVH+Ir9oYVDmlLBHto
         UuIz+8k5c8+NomoytJDfXxjmP2yG21If6sucMTcCHW4NHLUBDfqkc9d3Fx9qROmGVdIn
         q7ww==
X-Gm-Message-State: AGi0PuYtBHOLhAasHI+QdMZ0QwttiOZdOKgQ3zmrYxSbUTcOxZQrTKU4
        G6jzuM/dT8+3TLRi37dc0ueAJbIvkJ/1XWKr51Lzi3MI
X-Google-Smtp-Source: APiQypIZzLPW5vq1PSsp1ic1augjX6yNNs4XH4kYj7l77eae0YkAsST48N3Dgoh/P8JC7w8wunBwA9U1hU0ARoPijlM=
X-Received: by 2002:a9f:2508:: with SMTP id 8mr7359104uaz.115.1588607677936;
 Mon, 04 May 2020 08:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <21061.1587602497@localhost> <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com>
 <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
 <CAPJ9Yc_JEuDV4yEjhyJp-+bo7fkYcFrW58vypqZzAyjRFcuvoA@mail.gmail.com>
 <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
 <20200424155459.GB21114@pc-3.home> <CAPJ9Yc_kHZKCSG7o7YtU7YCvAF4+OPm9MJzYK12mmQOg5FQD2w@mail.gmail.com>
 <CAPJ9Yc82m71opZ5nkxqtGuJ8rsuY83opnZPOiS7_DWjiC4JFrg@mail.gmail.com>
 <20200428110033.GA25921@pc-3.home> <CAPJ9Yc_nBzy5zWPBAOgD2FPmnOegHUEYi+vpURtwm8z9wHeoQw@mail.gmail.com>
 <20200504122740.GA27585@pc-3.home>
In-Reply-To: <20200504122740.GA27585@pc-3.home>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Mon, 4 May 2020 17:54:26 +0200
Message-ID: <CAPJ9Yc8JyaaevLwuTriytxF7axtCchv790Vm=Tw01oz+eZEEOg@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     Guillaume Nault <gnault@redhat.com>
Cc:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Mon, 4 May 2020 at 14:27, Guillaume Nault <gnault@redhat.com> wrote:
>
> Also, please avoid wrapping your log lines, that makes them close to
> unreadable.

Sorry about that, it is gmail.com doing it. (a long time know issue
they refuse to fix).
