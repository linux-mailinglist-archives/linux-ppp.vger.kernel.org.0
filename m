Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8A0636DB2
	for <lists+linux-ppp@lfdr.de>; Wed, 23 Nov 2022 23:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbiKWW74 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 23 Nov 2022 17:59:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiKWW7z (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 23 Nov 2022 17:59:55 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D539259170
        for <linux-ppp@vger.kernel.org>; Wed, 23 Nov 2022 14:59:54 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id ci10so10868092pjb.1
        for <linux-ppp@vger.kernel.org>; Wed, 23 Nov 2022 14:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o07omFriqnhNOjfhpCiCirEGK3M8lz5V4M5BDPl7N1Y=;
        b=bO5ZCGEwmV69YwjCPQbA2RHNFcQkLNyr0tgMyLOsikJMRHlh36j8ObYTTwTV25pYia
         L5bgVPOL1Fvc45I5oqJCsUabAc8tdeva/7Yh6TAavpGOgl2iab9Za2en3352aXqLPRlV
         4CuPp72uXoRjxaLKpFVAZ44lvS1I+ZYJMz2GYifX1Z0qkPif0WbtAvErvN0go0GNBm+A
         6GnuJ29PVU0FiU5s/7K2wk6VSuLbTDuz8tv23LpfIjG3QAfr8wdArtEJS/RGmPDpS+rk
         VmYt+KDhe8PEXM10sLVRYH484tsntR+WSJpyiMhTnLAWyXgOzUcVsfiw7NwzaUKtWNJ4
         WTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o07omFriqnhNOjfhpCiCirEGK3M8lz5V4M5BDPl7N1Y=;
        b=e6BF6Uc+fpGCsmJbQEQLloeRKqJTXLzuWou4O1xidqzCu6u+BaBVyZpQLkeAxkb/wD
         9n472xvBzpl4zYhrll5geAzvRdWNcxpoebgz2qN5iqD8bUyrkKDM2Wpqqxm5foTK4Wpq
         6n+CNIszPGCjg2g871jDOFiRTybzMv4avLF2RQPBIB08iltwVtGbp4bUuUhVm+Y8HMKY
         T19AxhtjCxwVJIsf2UWQoXMcuacDPD8lyVzBnF71EI6ahhT1oXsWVVvL5+yiJRrjCt3O
         eLauPhUTEIXtMaKLivKmEJGIso+3wvJJyhh3BwL6LckM4sxAz/cUQ0k74z2fwALrQ99m
         MvnA==
X-Gm-Message-State: ANoB5pniKFeErbYALqzGJYLpvuyVExnJhNTFQ9dYfyjajQ+3672FqKSq
        SCVY8978paXNJMW9SvshSfbW/F6Gwgs=
X-Google-Smtp-Source: AA0mqf76qMrmpe5DwPKKDyEZZracL6GP3T6tTLRD+Qb0VPNQ+X/WhTejA2SVRIpmJtxsUCEVCjH+1Q==
X-Received: by 2002:a17:90a:bc4b:b0:212:d796:d30f with SMTP id t11-20020a17090abc4b00b00212d796d30fmr32798105pjv.9.1669244394291;
        Wed, 23 Nov 2022 14:59:54 -0800 (PST)
Received: from localhost ([2401:4900:547a:9239:d8fa:2460:729b:457e])
        by smtp.gmail.com with ESMTPSA id p3-20020a170902e74300b00188a7bce192sm14906609plf.264.2022.11.23.14.59.52
        for <linux-ppp@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 14:59:53 -0800 (PST)
Date:   Thu, 24 Nov 2022 04:29:49 +0530 (GMT+05:30)
From:   mr.chorotia@gmail.com
To:     linux-ppp@vger.kernel.org
Message-ID: <8791865.53.1669244389958@localhost>
Subject: =?UTF-8?Q?Decision_makers_have_told_us=E2=80=A6?=
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Salutations. Many organizations now consider business objectives and technology objectives to be completely equal in the eyes of key stakeholders. This is the logical conclusion after decades of technology advancements.
