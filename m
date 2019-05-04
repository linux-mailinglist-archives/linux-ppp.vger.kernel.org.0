Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B25C613AE5
	for <lists+linux-ppp@lfdr.de>; Sat,  4 May 2019 17:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbfEDPTv (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sat, 4 May 2019 11:19:51 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46002 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbfEDPTv (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sat, 4 May 2019 11:19:51 -0400
Received: by mail-lj1-f196.google.com with SMTP id w12so7575612ljh.12
        for <linux-ppp@vger.kernel.org>; Sat, 04 May 2019 08:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CQRhFh2xs6S5VpYws2ikDz1NrhC59yZjui1llzlbQkY=;
        b=NQF6T36d01Qiwn76Jm0g4H/NaANbigvAFN218VRWObl+BLdIgfXt9rsJuyeM9UPcIN
         5JToiyDSthjboaiHl+pIWHXCmN+T8j35/biwQyy6e8dPOG0KCSMSKYxMcCqNG8QAbwut
         WEuAxf6lP9WfAI0HpwOQe2zD5FU8J3O4NWy9jFJ92szGdaQac3hAqBxYxTjiQRQYfnUT
         kwl5utcroTDunnOq5KvuaP9802VZc9JLIyzrE68QOLtxgMk2t6B833Eb2VVWE1uu7FEE
         0HHc1LAAlfDQXYTtAYMDJqvVd15R/otWUqncvQhWVslbspTpRNF8IEn9JkgVeicflqkE
         oFjw==
X-Gm-Message-State: APjAAAW1kI4OBmnBz82mmlbalZoBS9I3OnjaGuz11eFR56OodSzM8tCY
        ieTjQRjZj3MxnyF3qyDlaRtBRvjW55qe/hwBeGYY94I/
X-Google-Smtp-Source: APXvYqxtdM9XieFf+vSeif3koYJHo3K2tmi5k4NdMkmEBqKivr3gpt1ezKs+dkOB1xEZd1JnML2jK0MtmdBcejiDKtQ=
X-Received: by 2002:a2e:2b03:: with SMTP id q3mr8236466lje.67.1556983189010;
 Sat, 04 May 2019 08:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20181123184153.24638-1-mcroce@redhat.com>
In-Reply-To: <20181123184153.24638-1-mcroce@redhat.com>
From:   Matteo Croce <mcroce@redhat.com>
Date:   Sat, 4 May 2019 17:19:13 +0200
Message-ID: <CAGnkfhyvakY7cV=qKSrVhoEvWRa855pXJua-042qbjX7GvxXQg@mail.gmail.com>
Subject: Re: [PATCH v4] pppoe: custom host-uniq tag
To:     linux-ppp@vger.kernel.org
Cc:     Paul Mackerras <paulus@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Fri, Nov 23, 2018 at 7:41 PM Matteo Croce <mcroce@redhat.com> wrote:
>
> Add pppoe 'host-uniq' option to set an arbitrary
> host-uniq tag instead of the pppd pid.
> Some ISPs use such tag to authenticate the CPE,
> so it must be set to a proper value to connect.
>
> Signed-off-by: Matteo Croce <mcroce@redhat.com>
> Signed-off-by: Jo-Philipp Wich <jow@openwrt.org>

Ping, any update? I'm sending this to netdev too, in case this list is outdated

-- 
Matteo Croce
per aspera ad upstream
