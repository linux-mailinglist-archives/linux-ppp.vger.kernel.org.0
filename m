Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C91C7B4ADA
	for <lists+linux-ppp@lfdr.de>; Mon,  2 Oct 2023 04:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjJBCqF (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 1 Oct 2023 22:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235120AbjJBCqF (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 1 Oct 2023 22:46:05 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3036CB8
        for <linux-ppp@vger.kernel.org>; Sun,  1 Oct 2023 19:46:03 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1d544a4a2f2so9034928fac.3
        for <linux-ppp@vger.kernel.org>; Sun, 01 Oct 2023 19:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696214762; x=1696819562; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a4rzx+Er2yqeScmlfWnDzHLPmabH2iPVsvWpEk20/zI=;
        b=cNGR3UPMvIf6ST6h8ymz02ZhEeHZKrdc2CuB6MU8XO+E+Rajx7sFHnSm34/U/eVTmh
         tyfm//oiOHWXHxLT/27sXjgAcbvhhoICDgHUwFtx7hFDtn8Ba/8610dk3iQm2/YPMe80
         VBEik2N4/zBbRIx/gwCVqhqlB+lkWvveMzQZGd2EsxemdRQAhLf18qr2FH5mUI3oFUjv
         LNZEnjxJNtrhcWe2ysD11DeIyV24Uqqek50MjlN/WT4mxZ0d8MazjE7QBI2O1ULQ/vkF
         E71Li9mrs1BA7ptJte/s3nLJYnZLcg913Fng6dir41UShpdb0RIgi6P96qC6q6nCVl08
         5Lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696214762; x=1696819562;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a4rzx+Er2yqeScmlfWnDzHLPmabH2iPVsvWpEk20/zI=;
        b=nW/tEnM8j52u7lfYUlaNuvEFfVNzRNHBqxLm4eNMl3Uat34TOMwFGXJ+BvIodBppek
         Ac4sl9ksRSfad1gY4wkDjiahc/rTlaa/IgVj6sBiWq12HzweWp36ZoT+TvedJ9K/mWTO
         +/4bKo31lkuV5u79Gu/R1bVKC5eyMXposYRSPEVNFewcz4AZXqu53xOcuV5INbzLY9m9
         8kOdTtemR9NjV+J/nukgxrlmocMin0jOgOmavoqPc2pfAs+NKRGqrVs5CCCnAmAX+j91
         JZIY9/0jD08GwRgRC+53A1XYXhuOxPidlnsPWGf0xleWL9CkkObNRI0xR9YSqFA0DDB8
         U0iA==
X-Gm-Message-State: AOJu0YzWjGrg5QZBIoivuAZca4PnpzgmIDskT3hRs+s7bWFzv6bsO3qE
        fWMWq3tBpYnJwcM8LbWaNNsBnBem87Liq/svj9tbtGcQIb8=
X-Google-Smtp-Source: AGHT+IGUSFqQxkerV7yW5uuXYqpU0lKWiNT+FfOpai4bha9XADh8UylsljjuxG5akp0zbs/EgJomaY7G2lo6HAVhOiY=
X-Received: by 2002:a05:6870:65a7:b0:1bb:bcc3:c96 with SMTP id
 fp39-20020a05687065a700b001bbbcc30c96mr13994165oab.33.1696214762272; Sun, 01
 Oct 2023 19:46:02 -0700 (PDT)
MIME-Version: 1.0
From:   William Tambe <tambewilliam@gmail.com>
Date:   Sun, 1 Oct 2023 21:45:57 -0500
Message-ID: <CAF8i9mO42DbVzPhz9cpaL2frpYUyOcSC7qdx6r6bYxkS+QYrKw@mail.gmail.com>
Subject: [PATCH] drivers/net/slip: prevent data alignment fault
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

From 594e53fa4913b1cb6232dbcc73d905a94c0cae73 Mon Sep 17 00:00:00 2001
From: William Tambe <tambewilliam@gmail.com>
Date: Sun, 1 Oct 2023 21:38:15 -0500
Subject: [PATCH] drivers/net/slip: prevent data alignment fault

Prevent data alignment fault on architectures which cannot
do unaligned memory access.
---
 drivers/net/slip/slhc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/slip/slhc.c b/drivers/net/slip/slhc.c
index ba93bab948e0..08fd570a6d40 100644
--- a/drivers/net/slip/slhc.c
+++ b/drivers/net/slip/slhc.c
@@ -459,8 +459,8 @@ slhc_compress(struct slcompress *comp, unsigned
char *icp, int isize,
         *cpp = ocp;
         *cp++ = changes;
     }
-    *(__sum16 *)cp = csum;
-    cp += 2;
+    *cp++ = (char)(csum&0xff);
+    *cp++ = (char)((csum>>8)&0xff);
 /* deltaS is now the size of the change section of the compressed header */
     memcpy(cp,new_seq,deltaS);    /* Write list of deltas */
     memcpy(cp+deltaS,icp+hlen,isize-hlen);
@@ -534,7 +534,7 @@ slhc_uncompress(struct slcompress *comp, unsigned
char *icp, int isize)
     thp = &cs->cs_tcp;
     ip = &cs->cs_ip;

-    thp->check = *(__sum16 *)cp;
+    thp->check = (((__sum16)*cp)|(((__sum16)*(cp+1))<<8));
     cp += 2;

     thp->psh = (changes & TCP_PUSH_BIT) ? 1 : 0;
-- 
2.34.1
