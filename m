Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 308924CF1A3
	for <lists+linux-ppp@lfdr.de>; Mon,  7 Mar 2022 07:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbiCGGJh (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 7 Mar 2022 01:09:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbiCGGJh (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 7 Mar 2022 01:09:37 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F581CFD5
        for <linux-ppp@vger.kernel.org>; Sun,  6 Mar 2022 22:08:38 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-2db2add4516so151881757b3.1
        for <linux-ppp@vger.kernel.org>; Sun, 06 Mar 2022 22:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=7Im1JG6q3q15hqSa7NWQHVGGERLfnPf1iBbuaSTqgJQ=;
        b=evDudyk1tDXb81pex6vJKwDwf7TzSv3FSF0X34O7haGMiWKa14f6GfYAIN1+I6G/oP
         TvuBbmX+WlMqv3v2k6OhsarobVDQVgnT2v/Q/9b34YVvkm4qnEEesBHIdcth3x8O8Xvt
         yi92PGAmHo+MwmddvP3R4gqpZ701MJv0iUkzydzITks0plJqJOyJSguoLB7UmIsGSf4d
         csOTcZrvWfF0e5u8sgz5RMazJ2afpFTquwbWuSb/laUAFGkrnVYinQjFMRIe0GAAqoCQ
         zRaL+aWHxUJkSQTBGow56EErkgsvxVoEfGMUJXScU/PQED/hLZCUPUI2Svq/xco+eVes
         l2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=7Im1JG6q3q15hqSa7NWQHVGGERLfnPf1iBbuaSTqgJQ=;
        b=eknFozz6l4xE+ycCdLrOEJ/FNbdw5IssxWwoE0PltrYtpx/lHgn5x2mBlHcdujbABJ
         Fnf61rDVJ1MoiAf7mbVUIxAw7l2EdfM08JAXHGigCYVSymT49o01PagAftvv7bi2y3Yl
         yWPyvUwh8YoIS88KxMBz3FgNgP/KxwIhga7ooNV4uRLJTXd7RETbsAvOnRcTT/FYdjcY
         /0pDZ+c6HR9PZR9HkOyob5QAOvm+bmrequW+4inwxmAxCwubQYovZso2SoxKMwnNiLv8
         B9KkU/COrKu57dhrcoiMACaZB+TQufRwcr7PIvpkuRERK6RBgzBTLD8Bv0xhx7L4ZVvC
         Zhew==
X-Gm-Message-State: AOAM531q93KI+vFtHJyaD7YiDdndAWuHQ3qRLCLvIz3qo+/cmq6oAYHr
        lxnm7059m7T4g+agBSo9wFhEoZyNKZyvvbeytI0=
X-Google-Smtp-Source: ABdhPJykU5NGOcB06qcHYyeCRi8uBLZ9CDzUWJ6NCkOEllpZJ4pWuxBTPZIjD1dAKi+1laOtItGcpdHh8KIE0S1wDG4=
X-Received: by 2002:a81:1392:0:b0:2dc:5a38:95e1 with SMTP id
 140-20020a811392000000b002dc5a3895e1mr7246428ywt.225.1646633317216; Sun, 06
 Mar 2022 22:08:37 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6918:b986:b0:a4:b698:78d9 with HTTP; Sun, 6 Mar 2022
 22:08:36 -0800 (PST)
Reply-To: markwillima00@gmail.com
From:   Mark <markpeterdavid@gmail.com>
Date:   Sun, 6 Mar 2022 22:08:36 -0800
Message-ID: <CAC_St28fBJ5hnUyejwW8K6MC0x8FYPz-CUfOJPQ35iRPXEZUag@mail.gmail.com>
Subject: Re: Greetings!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1136 listed in]
        [list.dnswl.org]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [markwillima00[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [markpeterdavid[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
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
