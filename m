Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C816E7B5675
	for <lists+linux-ppp@lfdr.de>; Mon,  2 Oct 2023 17:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238089AbjJBPZK (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 2 Oct 2023 11:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238115AbjJBPZJ (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 2 Oct 2023 11:25:09 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ADC4E0
        for <linux-ppp@vger.kernel.org>; Mon,  2 Oct 2023 08:25:03 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1e10ba12fd3so2569465fac.1
        for <linux-ppp@vger.kernel.org>; Mon, 02 Oct 2023 08:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696260302; x=1696865102; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PloZHtMWJwTrSlhA6YxlQX6eiJULi3WZRmULehribQs=;
        b=SjFHCMZqvn1rYUvqwQsTidmgCQXmSMGsNX/oVVd4LCGFVwmVL/lcouj6MZeotWyNuq
         Jocq/aoLArF4/Y2jodqiZtw3BPze/2nawePTbO/JJbud44PfOV43eokRw12X5ta+dmvL
         03SSuMcpozNYu6fmrpWgI6h1EpQN1pnt4gXfOMu1XdFp1wjSrNfxpznoYIqbnjr5aELj
         qvsV89dIXDvexfgckczBlxqdKv1V8c9vT008tzMSUjHh8GBD9gJxQbofTkX3pwxBxTnb
         ZNz7XsYT2tWFaNQHJgW0da9G/adk1Qf9jUCpXNmbOnY3TsQakgxRCI1HQ3wqhGmJxizf
         jTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696260302; x=1696865102;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PloZHtMWJwTrSlhA6YxlQX6eiJULi3WZRmULehribQs=;
        b=v9WDbYraPoJaiO9vGFyJzDm7BonSufVaW5AcI+fy4Z38bI6fBb1liVu6Wxqc0hv09Y
         wFjpi0FKHKppBjdRX9l8aNemFl7Zf7agEzTvp4qhbWxouoaBEzK7SsC4mKLEa26jKWw5
         SitroLwlrF/E2P5hSx9UJVgHf4iolw1L9UphBeHmS4Cq1UIJ5g9yYO4mTQeYZ7ejPJf8
         0ukF19G8NKpoRLIQwVRjTpjPfEfUUExd2+QLIJv6lTPBdqNQH4B3VlYkar6W59eKbUSv
         VAVd7Az5+G9HbkuSeHTrPHEarufMrrvdCcYCMZZTEgpphIYg3b8I7HUDJDkUpNO5WNcl
         xutQ==
X-Gm-Message-State: AOJu0Ywff1G4emxGmmjJ/VGxm1/4XdRqJkTbpN7ix1dZj7GdQLXj39Yb
        0bRbUWbs9T/9FF0b7ETCoYY9jdwtRKXa77dLeZ7KhePQ/ds=
X-Google-Smtp-Source: AGHT+IELq8zdSTuhD4ajVvQsRr/9jxuWoPUNs4DBIJSa757won2rdhH2qgb5/wBQFNJOSNA/Kn37qTFiD9Qd/Z1XU80=
X-Received: by 2002:a05:6870:f6a1:b0:1d5:a72e:154e with SMTP id
 el33-20020a056870f6a100b001d5a72e154emr13562480oab.36.1696260302088; Mon, 02
 Oct 2023 08:25:02 -0700 (PDT)
MIME-Version: 1.0
From:   William Tambe <tambewilliam@gmail.com>
Date:   Mon, 2 Oct 2023 10:24:59 -0500
Message-ID: <CAF8i9mP0q9cKG+GigeQUd_YTZaOG6oTNzho+xrv8Bi3oPtJ2yA@mail.gmail.com>
Subject: [PATCH v2] drivers/net/slip: prevent data alignment fault
To:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

From d30bc4e92236e72bb0a9a743f3ad605ea1c1152e Mon Sep 17 00:00:00 2001
From: William Tambe <tambewilliam@gmail.com>
Date: Mon, 2 Oct 2023 10:16:54 -0500
Subject: [PATCH v2] drivers/net/slip: prevent data alignment fault

Prevent data alignment fault on architectures which cannot
do unaligned memory access.
---
 drivers/net/slip/slhc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/slip/slhc.c b/drivers/net/slip/slhc.c
index ba93bab948e0..f198be2c7205 100644
--- a/drivers/net/slip/slhc.c
+++ b/drivers/net/slip/slhc.c
@@ -459,7 +459,7 @@ slhc_compress(struct slcompress *comp, unsigned
char *icp, int isize,
         *cpp = ocp;
         *cp++ = changes;
     }
-    *(__sum16 *)cp = csum;
+    put_unaligned(csum, (__sum16 *)cp);
     cp += 2;
 /* deltaS is now the size of the change section of the compressed header */
     memcpy(cp,new_seq,deltaS);    /* Write list of deltas */
@@ -534,7 +534,7 @@ slhc_uncompress(struct slcompress *comp, unsigned
char *icp, int isize)
     thp = &cs->cs_tcp;
     ip = &cs->cs_ip;

-    thp->check = *(__sum16 *)cp;
+    thp->check = get_unaligned((__sum16 *)cp);
     cp += 2;

     thp->psh = (changes & TCP_PUSH_BIT) ? 1 : 0;
-- 
2.34.1
