Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF73F521365
	for <lists+linux-ppp@lfdr.de>; Tue, 10 May 2022 13:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240529AbiEJLUP (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 10 May 2022 07:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240506AbiEJLUO (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Tue, 10 May 2022 07:20:14 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 855691868CB
        for <linux-ppp@vger.kernel.org>; Tue, 10 May 2022 04:16:17 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id q2so16559773vsr.5
        for <linux-ppp@vger.kernel.org>; Tue, 10 May 2022 04:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=vjJ/DPgH5OA8A+lItdmXvfVjesRSStJY4gQ0upgp36A=;
        b=Czxm91EkLVe7Ez6XumHgESQQZT7wLS4goQTvHGVFrVD3IU+pnyMRQNEe+OGQNf4tfN
         /izz8MRclolAZreQ7n3bkr8jl/+0dhXpIf2AOPZlgPJt14m2+kXDhzV0ixj9GLlQtAbP
         +NijH2rOgreN3m7iwd09D76a3l+EiIZOTJW7ULTk9c/aBmm4oeeUiETXmLbAzsZM/ObR
         F2P48jkY+ebpkDcTt39D11cdaw7MUEe8XMioBcynXOMG0AGz9LwXLUOh/400io47Jhcq
         desGPpfhwmQJDP4MgzJWmp2BLuxyuTciVmROqq0qohajeyWPZ6iDzpOyCHHr2SI9g7W7
         ncUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=vjJ/DPgH5OA8A+lItdmXvfVjesRSStJY4gQ0upgp36A=;
        b=Cip9uAf00i5C2/pFr5IXa8iKbtQzPO5h3x+3Ix3oE2SHO7D+pXcfoyAcvMuGcnufc1
         aEQ6y8vvlnFMp5cTZ1HvQpJ9WidblKa+gAkOtQSue7c1SqZWv9J1K4/D4DL7a9XPRJRZ
         PJJcWvzICRhF8wU1TW6+1xSLUrgYP/7tjbIgGzOd0jQgWmAjiyVCGo9EIWIiI9pJOGp2
         Rd4e7lYRqX4pMl/BaKXPC1G1N3RSuXf3PY37MQ8hH8EBMB0uyV4R0sDsOylIujdLFu63
         k1KCRs3SiEYgtEzCTE7oyb4MIaqqH5fawaH7CnXrpMBmALXpz9Xhmdb3J/nzVk5VgtdE
         rtBw==
X-Gm-Message-State: AOAM531rbpSfpjYSn/7B6MGMfuvu7Z6RFAYmf7HjU3Ij9qrTbMD639jU
        G5ngGVVKH4qX8r1fCU9XAMxSvkxq26CO2m/83AY=
X-Google-Smtp-Source: ABdhPJydGkUmlVI6ppsaaCR9qKJrgb+5BQkmY3E1j+nXXAqulNSB8HDR69ePf/9oRPNCQjrk6GP5+6lF6zQWn9oATis=
X-Received: by 2002:a05:6102:e96:b0:32d:3ecd:36f3 with SMTP id
 l22-20020a0561020e9600b0032d3ecd36f3mr11126196vst.71.1652181376670; Tue, 10
 May 2022 04:16:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:a062:0:b0:2ae:48a4:68c4 with HTTP; Tue, 10 May 2022
 04:16:16 -0700 (PDT)
Reply-To: qatarfoundationendowment1@gmail.com
From:   "Qatar Foundation Endowment." <lawrencephilip397@gmail.com>
Date:   Tue, 10 May 2022 12:16:16 +0100
Message-ID: <CACjq-LQj+6Gcj9D+4Fg=onndYVNEzOBjaaswvkCDa-b_GD+FFg@mail.gmail.com>
Subject: Dear Beneficiary
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_50,DEAR_BENEFICIARY,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [qatarfoundationendowment1[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [lawrencephilip397[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [lawrencephilip397[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 DEAR_BENEFICIARY BODY: Dear Beneficiary:
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e29 listed in]
        [list.dnswl.org]
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Dear Beneficiary,

You have been selected to receive (=E2=82=AC1,000,000.00) from the Qatar
Foundation, kindly reply back with your full name and address for more
information;

Regards,

Mr. Rashid Al-Naimi.

Chief Executive Officer of Qatar Foundation Endowment.
