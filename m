Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D754A3967FD
	for <lists+linux-ppp@lfdr.de>; Mon, 31 May 2021 20:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbhEaSi7 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 31 May 2021 14:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhEaSi5 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 31 May 2021 14:38:57 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650DDC061574
        for <linux-ppp@vger.kernel.org>; Mon, 31 May 2021 11:37:11 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id d25so12787334ioe.1
        for <linux-ppp@vger.kernel.org>; Mon, 31 May 2021 11:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=IFJn9hzIDt81XJU9NNIoX/Ob20/anNJAd1gw5P1DUJw=;
        b=bspWkuzoPI8qvHYMq4HsUTGFo8E3vlJpnhSdrC+vy3ThSGm8nU41ZifZGIB6KNiuJp
         rsZuifBFDUPbuPeun4ylx3RWMlSKq1F3te2muvJ1JI5Zpl5hC4qAjMexO9MVAbZLLECH
         MPZNIlIMXABZxByu9KRNDGicBhjPlS/kyeOVgJfgQs1Rd5yTfO5LM0ydV1HPbe/8Mclp
         kY2Hx0LHVrSEzq5Axy1FBHfOiieIVbmpOycfAEwUWv62U0oAekWXhgVIVezTcwnEdZ+3
         QBT2WCYB++BMYNNY9LUtSzky3OgrwIEtAVOluau6NyTf06H6K4BI/nwKFH58xGOR+frp
         S/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=IFJn9hzIDt81XJU9NNIoX/Ob20/anNJAd1gw5P1DUJw=;
        b=PGK31KTuac1RAteC1COmuhfuWFyF4ytBBSgEz4og+28yrHsouX0SUmf5F4Hgi49yjw
         6X2pLVdrt9uGriuxPEciu32ypyXxgzc23t//UxG8zt/WPRWISM3/Op5oaACOFp2wap9a
         Me31aAGT3Nu6SvFPgfqgaKYisjIb3L/0SMY/O14KTP1gogCo9tieVTcToueDiUVHjiZC
         ihVUrQ0wvZ8OM2OnrI9vBDTL5AlG4dsUe7rv6RPOVtJjq8WuBp1zSQHaqTb/nct1MCE6
         78kFG4xmsuFG5RNc9vllTZ61Xwa0XukAACv1nFFF0xz/C33ukUR6gU0v4GHoeL6SxjJM
         bjrA==
X-Gm-Message-State: AOAM532KxHMSqFX5lhEDGvMcDaMEyswXa1eC3fee8MkjEQb6+IX/lm2k
        nzS5RhC41hrsojeuAW9XKdRO/KqfqrazIKSGTwxx/hcqU4cyFg==
X-Google-Smtp-Source: ABdhPJyQs+qV3jGxaPUaJFbpgh8EoSAVxWjUKjBsfzQsTCKmYsOJP5Ecc9ymZl9iEFTWq8yFQKHlTaFy29kqj5iaeBg=
X-Received: by 2002:a05:6638:148c:: with SMTP id j12mr4988475jak.74.1622486230494;
 Mon, 31 May 2021 11:37:10 -0700 (PDT)
MIME-Version: 1.0
From:   Artem Mygaiev <joculator@gmail.com>
Date:   Mon, 31 May 2021 21:36:58 +0300
Message-ID: <CAJwc6KsAwMXDcw8LH6s9JUDLPyBOsaohReG4kt4r0q8bR86D4A@mail.gmail.com>
Subject: PPP ECP (RFC1968) support
To:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hello

Going through the pppd and drivers/net/ppp/* code I cannot find a finished
implementation of ECP encryption. The only relevant commit in pppd I can see
is adding ECP patches from Frank Cusack including beginnings of ecp.c which,
as it seems, was never finished. On a kernel side I can only see MPPE
compressor and nothing related to ECP.

Am I missing something? Maybe there is some repo with unfinished work?

Appreciate any pointers

Best regards,
Artem Mygaiev
