Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A873253C975
	for <lists+linux-ppp@lfdr.de>; Fri,  3 Jun 2022 13:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244059AbiFCLd4 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 3 Jun 2022 07:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244050AbiFCLdz (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 3 Jun 2022 07:33:55 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9582431DEA
        for <linux-ppp@vger.kernel.org>; Fri,  3 Jun 2022 04:33:54 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id r123-20020a1c2b81000000b0039c1439c33cso4177272wmr.5
        for <linux-ppp@vger.kernel.org>; Fri, 03 Jun 2022 04:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=PaEzrm9U0WjJMxkE+zbw8yGRv0uhjcRl9sFl9vmbKpk=;
        b=EWFovaa+4VchWKdamHt9DH8/OQTrNKeNvK5rCmI6nUroDcxfYvo+FLeSLGjF7oh0+4
         3OCOX+w3qAwkj6XIPMLC7CFYpkeZI5HIVg1OGop/whsHosI2uyxzLcJe6Hp35gHeRW/b
         UlOxt6ROJmI0nL4XaTDsTUrTv5nuondIGyoUkjy9w+mmew1beH8HMycCpzsaIMsUQ4JX
         waEEfh4XyFdgspSK/38qToJ32C79KylD54H8LVBKRr/t2S2LrkxAJt03GTC41pin6T9T
         8FxkXHdotGTqFI5tX8Am+EBg54CzhMw4ZaIS5iIH7YhnEFDptU1krDXXnKcNn9qhU3Cl
         huOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=PaEzrm9U0WjJMxkE+zbw8yGRv0uhjcRl9sFl9vmbKpk=;
        b=dlQg3wVics+hj76pWxdik4yMKlh0PzDOQeARlNpJ1JCDi5cqOcVjvgY5fTHCDXCwJi
         uOVNXOc00a9/5w5EI04wY+rIgu4vC0yqnMP+2I2Rerh8UB4E/F2gXUfbYF6jCbX5qkJM
         KsbYdDHZ4Bq8AOyRsua0JyM/QIp3Rv9zQ6jYW20E+sFnGsD0BnbJwV94xUc5KQHSxPKR
         f40cDUoN1H4063gr0uD3W1x3cUAoyoUWwWA1jLt5lLPnzVL96jzYXN0S7/vbHkyQ+XcW
         nR29RDXXMMW16L4+j9D6zxfMBkrT1L+/8Ltgs6lMj/m29aT7JoqjlqFfaRLAUHLUUDE7
         6v1Q==
X-Gm-Message-State: AOAM533wnyjOPnJKWpJGNkKP3UdUcUg9twXuKcK80gWfYg8IMerqRR1A
        tgzPMdAP3ltKHusiAsNZC5VaXWuVzj6R5aGwKAQ=
X-Google-Smtp-Source: ABdhPJwol/A0N4M7AbOZAdlxWrgqkaS+Pz92low/NSQYymgaE/l7iFdSCBGjx960Sl4APqb8sP/EHo6f8iE72Z+WVvk=
X-Received: by 2002:a05:600c:1c9f:b0:397:7ac4:b29c with SMTP id
 k31-20020a05600c1c9f00b003977ac4b29cmr8015785wms.155.1654256033146; Fri, 03
 Jun 2022 04:33:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:64ed:0:0:0:0:0 with HTTP; Fri, 3 Jun 2022 04:33:52 -0700 (PDT)
Reply-To: markwillima00@gmail.com
From:   Mark <mariamabdul888@gmail.com>
Date:   Fri, 3 Jun 2022 04:33:52 -0700
Message-ID: <CAP9xyD1z22Q94ya1SEwH9x1LvC2cXjo1R2JYHEeVLAtE_MKttw@mail.gmail.com>
Subject: Re: Greetings!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hello,

Good day,

The HSBC Bank is a financial institution in United Kingdom. We
promotes long-term,sustainable and broad-based economic growth in
developing and emerging countries by providing financial support like
loans and investment to large, small and
medium-sized companies (SMEs) as well as fast-growing enterprises
which in turn helps to create secure and permanent jobs and reduce
poverty.

If you need fund to promotes your business, project(Project Funding),
Loan, planning, budgeting and expansion of your business(s) , do not
hesitate to indicate your interest as we are here to serve you better
by granting your request.


Thank you
Mr:Mark
