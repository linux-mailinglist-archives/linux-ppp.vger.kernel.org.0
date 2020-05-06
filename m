Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94CC81C6E70
	for <lists+linux-ppp@lfdr.de>; Wed,  6 May 2020 12:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729201AbgEFKes (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 6 May 2020 06:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728716AbgEFKes (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 6 May 2020 06:34:48 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921E3C061A0F
        for <linux-ppp@vger.kernel.org>; Wed,  6 May 2020 03:34:46 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id b6so301009uak.6
        for <linux-ppp@vger.kernel.org>; Wed, 06 May 2020 03:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Rwvtt9OlRoCdq6kTY1gIxyKk7ly3Qgfkfj3+t4VyqtU=;
        b=FHULwJliXow/g1z2zlNPo+tLHbM+7JPM4IbeK7oDlAag4tzA26Yu2Qspix7198EDnJ
         Wp1SmOpVWiMYahyG9a0J9IVYEHAW1azg5XGsmHvC6OG20Mehup0aY2yRGU1t3OsJoXPa
         jq/TIhK9RDtWwXysf7LfT5dlGRKU4PtGbSwNV/u7yAwh/kDg3oEbi1BVvO5X5kBkrxb/
         7kAKMzS2ajdcTnbKa5Lw7B41Wg4AJFpShaWpaFtiL3d+2qSSXXo5CedNYF793RzJ1AqU
         1G4Un+wyomRm/cB0tQoY4OaakZYoa84C0I8dVobnQnc/PLzCVvMUaW+UKVJ1yDA1mIis
         AQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Rwvtt9OlRoCdq6kTY1gIxyKk7ly3Qgfkfj3+t4VyqtU=;
        b=GFSIQfGfhw3Xzf1eGw6uu5RKJtEZplatYbHSgbcFm0EktSU4qrW8nO20fH9tSs5BbN
         3TOzDnyffeIgIuKQ4plHZtReIxfaPvfQrTRlH70GIqqruTHsbd1/bmxPtP+xsXNpNpml
         rgaKC6L34GY+g6vf4rb5GNUC4s8Ao2Og2fDl51UFdYAu/JR+wzPMrwJSJx2ZBCXEPZQt
         mjTtpoQUrlEXDAVKHX27UGhCgAof7jx5uHOtsQeb22wnSKU+mQTSsuFjNH+n+wqitwlG
         r8wvSv8H+/OGAH7cRvTs79ZpJpBZZbYzfAHBWglvpNEY8kKXFIhZckIkxRKkYA5PxjLJ
         lF2A==
X-Gm-Message-State: AGi0PuYhPaPjzvL8eJjTsZGX18K1cO43prwlL2OvZuzyWW6yKp6hDd3L
        MA8pF4dSQ7O0SQGQWXNIApl2JgX79yTTfOo6GCkQxX72j2I=
X-Google-Smtp-Source: APiQypK6lB5qeWC+CQ4GFMXOp9154k8gND9MCX+9Eh9qBmBKEdwVOYV7rcXIF54LNkptlsEXCQsfuSDvE1u/8S+Xo+w=
X-Received: by 2002:a9f:2508:: with SMTP id 8mr6228960uaz.115.1588761285817;
 Wed, 06 May 2020 03:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <CAPJ9Yc8eDBsGtFy_juZ3Z6biKKD4-JoNg0icv4otHK=o66aBZw@mail.gmail.com>
 <20200504130149.GB27585@pc-3.home> <CAPJ9Yc_kvqAD5d1XJGQmzVC5d8_HXtp5aH-4OSyqBXDLu1Na8g@mail.gmail.com>
 <20200504181159.GA7717@pc-3.home> <CAPJ9Yc-a4ax_RgYLJT71ukkcPasz+z2dU6bm9yiE+k664JhNqA@mail.gmail.com>
In-Reply-To: <CAPJ9Yc-a4ax_RgYLJT71ukkcPasz+z2dU6bm9yiE+k664JhNqA@mail.gmail.com>
From:   =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date:   Wed, 6 May 2020 12:34:34 +0200
Message-ID: <CAPJ9Yc8-P0wOtUx3V=fNXaQM=wUJcRRvJ5DbU1Hkya3SgeXpxA@mail.gmail.com>
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     Guillaume Nault <gnault@redhat.com>
Cc:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Wed, 6 May 2020 at 11:52, David Bala=C5=BEic <xerces9@gmail.com> wrote:

> I'll clean up and post the patch later.

Patch and description at https://bugzilla.kernel.org/show_bug.cgi?id=3D2075=
97
