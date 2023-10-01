Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C773A7B4A25
	for <lists+linux-ppp@lfdr.de>; Mon,  2 Oct 2023 00:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbjJAWTn (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 1 Oct 2023 18:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjJAWTm (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 1 Oct 2023 18:19:42 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194CFC9
        for <linux-ppp@vger.kernel.org>; Sun,  1 Oct 2023 15:19:40 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1dd5b98d9aeso1364818fac.0
        for <linux-ppp@vger.kernel.org>; Sun, 01 Oct 2023 15:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696198779; x=1696803579; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u3SmURZuvARO92GAlJkWRW2dm70OPsrown8/NErqXbo=;
        b=Mldbkth91xHw93neQtEGWzZ38OpAsbbWAJ59AuR0HyViYZXPNEgRUsP/DqsaQyRN3l
         iSTyjrPAFCsl8Kuezol9ZxID4x23AFDJv0nMqZIWm3TG9nwcl9P5j8+di6usq85hb/5F
         ZS8mi978KDd4+cUshfC9itW/hrTpfgvUP/7uv/pGBpeg8D8dMS+rFIWye+pdGD5UfHhQ
         pldD/kLvrZTTe7uWUmRgLGotYlTfOQKxQTi9Ui/4o13zXZQJdk2zh0ERcHIK9UYJqmuW
         srLoGcZqF6D1TlaNHXdG1Yszy4s53uP618ptODF5o7ykXaERo9M/7FkM03kvuQV8D0TM
         JF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696198779; x=1696803579;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u3SmURZuvARO92GAlJkWRW2dm70OPsrown8/NErqXbo=;
        b=GdJ0JUddtNzlh77hPZAHQh0akpE/kVrgbgtnL0HLuoNcOrfSBO4ru1gyEUun3WOJzW
         jujieaKUxnVPm3g+Gj+HwbsAfshCmILaKbRysKunioObQoq/SsxDW95eltpzvt+JMgqH
         8OhTDydfN8vHBGAryEAx7VLvp3k4BGAa3+VlO38d4fcDqYp/KCaZRul8hOcqP+srtpLR
         sUOBAiKgbWz/KsmJPoohr2OTs+XocXpQtdKvspXfyDzxkJki4uVbO0HqP3TQ5SIDRWJe
         nPE5M7g6NYm18PJyjUerVQ+r20FnJd5+z2BSMwMEDceKPBfFWKkC+Rne9XfidkB41dNy
         cvVw==
X-Gm-Message-State: AOJu0Yz6sknm890sXxhThBBTfSsKybZmvefYSgLX6ybhQpC6m1FmF7Aa
        Mg13ZPRbm8IQJuQJbl5W/tyY9zYd1RfoQPNle2N3xaihWPc=
X-Google-Smtp-Source: AGHT+IGgiCDLYKE0QFMwcILjHrV1XGYhluVomYeoCzn8hgCeuW1HQsJPTYjdM7GgWOct3MhVqLFT/dHCyHLhPmmUmU0=
X-Received: by 2002:a05:6870:3308:b0:1dd:3394:26cb with SMTP id
 x8-20020a056870330800b001dd339426cbmr6365131oae.15.1696198779143; Sun, 01 Oct
 2023 15:19:39 -0700 (PDT)
MIME-Version: 1.0
From:   William Tambe <tambewilliam@gmail.com>
Date:   Sun, 1 Oct 2023 17:19:34 -0500
Message-ID: <CAF8i9mP8BeFEubvv8MpuqP-K1okvoJHRb8m1V=JAE33UZrp2_g@mail.gmail.com>
Subject: [PATCH] drivers/net/slip: prevent data alignment fault
To:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

From c630b0aea59c1dced626c9da95fd71033763d606 Mon Sep 17 00:00:00 2001
From: William Tambe <tambewilliam@gmail.com>
Date: Sun, 1 Oct 2023 17:17:03 -0500
Subject: [PATCH] drivers/net/slip: prevent data alignment fault

---
 drivers/net/slip/slhc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/slip/slhc.c b/drivers/net/slip/slhc.c
index ba93bab948e0..78b07c46fe08 100644
--- a/drivers/net/slip/slhc.c
+++ b/drivers/net/slip/slhc.c
@@ -459,7 +459,8 @@ slhc_compress(struct slcompress *comp, unsigned
char *icp, int isize,
         *cpp = ocp;
         *cp++ = changes;
     }
-    *(__sum16 *)cp = csum;
+    *cp++ = (char)(csum&0xff);
+    *cp++ = (char)((csum>>8)&0xff);
     cp += 2;
 /* deltaS is now the size of the change section of the compressed header */
     memcpy(cp,new_seq,deltaS);    /* Write list of deltas */
@@ -534,7 +535,7 @@ slhc_uncompress(struct slcompress *comp, unsigned
char *icp, int isize)
     thp = &cs->cs_tcp;
     ip = &cs->cs_ip;

-    thp->check = *(__sum16 *)cp;
+    thp->check = (((__sum16)*cp)|(((__sum16)*(cp+1))<<8));
     cp += 2;

     thp->psh = (changes & TCP_PUSH_BIT) ? 1 : 0;
-- 
2.34.1
