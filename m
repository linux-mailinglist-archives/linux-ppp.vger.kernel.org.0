Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 330B6504731
	for <lists+linux-ppp@lfdr.de>; Sun, 17 Apr 2022 10:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233682AbiDQIhu (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 17 Apr 2022 04:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233678AbiDQIhp (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 17 Apr 2022 04:37:45 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC7B1B790
        for <linux-ppp@vger.kernel.org>; Sun, 17 Apr 2022 01:35:09 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id 80so4911909vkw.0
        for <linux-ppp@vger.kernel.org>; Sun, 17 Apr 2022 01:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=z+v8ugHyK4Bi1bsAOtuex5rzJWIULuLfF++ZnJg6JJs=;
        b=oNJc2INf8Rhr5FB/7dmVLUtXIN32Zpr+JOws5mZo8yLIZkx20k3ktobg4cFsyHfo10
         opyovUTmrMqZBrjIIPL8dwM3Cl42hbyZvaLR8TbrZDbPh7rgV94AneypUIz7gx5LvazE
         zDLFkcDX1nbPbvLE1YDjvnnDO6sd+MeRRKk7hJojVtPLOuB8iX7Tisqm37Yqye5BOvOD
         qrtEmC9HZPFnF8UhgjxviHDBiEkp+KFrjrNS6AiUfUOujeKcrIPlTDjJJypvibkN2ZRc
         Fcc5bL7t8fX01QLLow126XRV2cU5sFntAnAB/7YbhrXrCEA2hg1PeuWagasZGrwW/+fq
         MCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=z+v8ugHyK4Bi1bsAOtuex5rzJWIULuLfF++ZnJg6JJs=;
        b=WwyMRldd36tAitj/u6HQZHzZXXyp7UbnN1kWzx7nkS0Y2ggtqewKfXVbj7Hebr6Esw
         qhNFBXJrUrEQx6PnLPPy8Znt+rW60frVUfy17TJpY1OMSjVsHbXCbauuI6ZVJbyq4SeK
         Go6wMwsKqujgDzWrSmA48TGIdNis3kwXvJJJ6Ajol7m2ZwYaimZjcLb4lSHO3RomT0uU
         gFaCQPTCY3ig8/NUShlyNxg8cqp4beCV889/TZnq9EldrLr2yJJVRe8Ljx+OAalBDBN7
         jWLMIO1Keai6WUJg1SFGKLvGOdTNEJMfzQ+2FLSMQjXvYj4TbInj/z3o6LO/MkZ9EEcA
         RJjQ==
X-Gm-Message-State: AOAM532O8/DL8rTXDyXWrHYAwhHGl8455PrPZ02syB3M6Si6J0NCye88
        j3mx5XZPOUzEAYV+HGW8ITLAK5bdQTHlH9VbejM=
X-Google-Smtp-Source: ABdhPJw9Xt2OFrIK7hURg4kp9HjRikv5sLzHEzVl1NzDr5ZjkMyPbwTBECFNWcwqZlk35V3UQisOkE0Lf5eHqEkQTho=
X-Received: by 2002:a1f:5105:0:b0:345:252e:b0f5 with SMTP id
 f5-20020a1f5105000000b00345252eb0f5mr1463329vkb.22.1650184508047; Sun, 17 Apr
 2022 01:35:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:612c:2303:b0:2a3:2b46:b7d with HTTP; Sun, 17 Apr 2022
 01:35:07 -0700 (PDT)
Reply-To: markwillima00@gmail.com
From:   Mark <muhammadsuleima888@gmail.com>
Date:   Sun, 17 Apr 2022 01:35:07 -0700
Message-ID: <CANCcrFBrB3Qw8Ab_hBy19n0Ch6+XNpkXj3PjXKrc26cej7s+Kg@mail.gmail.com>
Subject: Re: Greetings!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:a42 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [markwillima00[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [muhammadsuleima888[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [muhammadsuleima888[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hello,

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
