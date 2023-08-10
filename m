Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECCA377771C
	for <lists+linux-ppp@lfdr.de>; Thu, 10 Aug 2023 13:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233585AbjHJLde (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 10 Aug 2023 07:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231962AbjHJLdd (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 10 Aug 2023 07:33:33 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17CF89C
        for <linux-ppp@vger.kernel.org>; Thu, 10 Aug 2023 04:33:33 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-63cf9eddbc6so9255196d6.0
        for <linux-ppp@vger.kernel.org>; Thu, 10 Aug 2023 04:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691667212; x=1692272012;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YjILqunSAAovpHtIg5sSJfoo/Rq2SaCSaqU4SdAUItU=;
        b=IY3LmBO6TZY7i/vmLwgjjCSck+ZgpQox0Nqc0umd7vbVJ4Su8JC39gC5r19X8W5ouT
         g9dP+8vamoXZ7rTk5LyVCX6dUBsjtaBCRH0UaleMWfH7IvlOBWXgyusbU0Tp2JkL+078
         y6CohBVzfrd5o1FBZFDyDCmQTHqimSzVI1lbPSf61n038ABQmnFTcVoISDXYVzZmvC/V
         UD8GyKNYbrZXqC/WJ3M3wWm0jMRTacGhvFoeM0cyMkRggatx2xFLLRRaRJfeQGzIpOK8
         J0TZ24s0c1AdDJFLQ82V8hYZ28zquE6+qgcnguZtNYUeL6MfI/8Tif8Wr280RC0KIKs9
         LScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691667212; x=1692272012;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YjILqunSAAovpHtIg5sSJfoo/Rq2SaCSaqU4SdAUItU=;
        b=MVVs4xPX4yC3oDmxPrlm1Nhg8JdvEv2ynFeJdNnBV3F+BlFOcnYkEYNnoNXE9Kfq2a
         EqxwWbhp4BxRUJGUd0yds0TZWi0yWF0eSKpbsIlHOH/OFM1Gupiq+rrwTOWqZY52/843
         FbHBkCJ90b+lZ1y+Sc8w5mhhPm5u7zq1Pzs6HLIsh/JtuVQlXmv/qyLG9351Zc+WJSGR
         pp+24Xm32YU3WMOuaYeGi6G5XrdOuwfmBlXmoZuCgcYLgOcb2335o1i/uf4BGhkhyoK+
         hqdL94begKhljXmkruN4gb6C63pRyh9gum0I8EEpV2yjon8K7KICYIu6aIgDguIpUF6q
         23ew==
X-Gm-Message-State: AOJu0YwjJqVi45Q0PqFY/VWbLo3NyphBGhUiPTGcIA1Q7qhM4AJhhIyR
        ZJJm0RBRMKoOf5VXBozLd9OFFJGZyfbcAO9FTh+lId3cusg=
X-Google-Smtp-Source: AGHT+IEYo7mAdRTFMwiX5+68s+GQrqlAvjV/4s5mpZurFH7i5fwpHKttPvHX1SSBoMnZUVT5SwvvyleARnFomSelUm8=
X-Received: by 2002:a0c:de0d:0:b0:63c:f7be:f266 with SMTP id
 t13-20020a0cde0d000000b0063cf7bef266mr2214436qvk.3.1691667211976; Thu, 10 Aug
 2023 04:33:31 -0700 (PDT)
MIME-Version: 1.0
From:   David Gyimesi <david6670@gmail.com>
Date:   Thu, 10 Aug 2023 21:33:22 +1000
Message-ID: <CAO+buQMqbKsFHiSA4yXwyfcU4nLGhO7p7J87ZZKMVQAWDE_5tw@mail.gmail.com>
Subject: "Timeout waiting for PADO packets" until reboot
To:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hello

My parents have an FTTH connection with an Asus DSL-AC68U router which
runs linux and pppd version 2.4.7. The network devices are connected
to a UPS for stable power.

Options configured:
lcp-echo-interval 10
lcp-echo-failure 15
lcp-echo-adaptive

If there is a short, let's say only 10 minutes, outage between the
home and the ISP, the router prints
"pppd[17084]: Timeout waiting for PADO packets"
messages but it is able to re-establish the connection automatically
when the outage is resolved.

However if the outage is relatively longer the router just keeps printing
"pppd[17084]: Timeout waiting for PADO packets"
messages and even if the outage has been resolved the router is not
able to re-establish the PPPoE connection. However after a reboot the
router is able to establish the PPPoE connection without problem.

Because I am remote I am not able to access the router for
troubleshooting during outage.

Others have the same problem for example with OpenWrt where I also see
ppp version 2.4.7 is used
https://github.com/openwrt/openwrt/issues/7826


Would you please help what can be the issue and how to fix it?

Thank you!
Best regards
David
