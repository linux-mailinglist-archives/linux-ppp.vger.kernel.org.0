Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61A6861DA36
	for <lists+linux-ppp@lfdr.de>; Sat,  5 Nov 2022 13:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiKEMja (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sat, 5 Nov 2022 08:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiKEMjK (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sat, 5 Nov 2022 08:39:10 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B220E17A96
        for <linux-ppp@vger.kernel.org>; Sat,  5 Nov 2022 05:39:08 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id q71so6560458pgq.8
        for <linux-ppp@vger.kernel.org>; Sat, 05 Nov 2022 05:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c8XA1N0uaxkLO/wKHErNWHaSuu64k5Pjb5u9dmcZrOc=;
        b=RIHC9n/dKVExSLG73bd8Y0TEFLCe8HTSL+2d7yE6D2NKhaBTGC77yJTmz2n+UQEoLn
         jxE36/CP2zWRsxdrbl6Qipo/1wujKwbWTegmQtKA5KaKY5c5k0uls/46uPweryK1Q/70
         p7KuiiXfJ0vih3FChZlrnOZ0SimajpgL+AXRNjZnSx1jbzFH5llJcPftmYgxT0KBp7aY
         Nvw2mfIN1dkT84jofHnK9dh7XMfTMquPbJMMLMjB0Dp08MAIB2DxhF8xAtCfYFVwsPDo
         kuNK/heTlVtwv9hHFhKrR/b4yxRwRja7vVsRsbB9inWGKh1FmpKXNdm91a1Uu/cF0CiR
         QmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8XA1N0uaxkLO/wKHErNWHaSuu64k5Pjb5u9dmcZrOc=;
        b=hmo265n9nQ5VIMJafjIWYmaH82VUlkdT10DwEAmawc3ptonNpLHWheK5Poj/2OY2y/
         Yi6BGdQHeqD7MyFpJlYBnT5QTtOuOEgUeu5uKXfZDRACEP4bSm9BKActGbv0TxT7V+ps
         qhHUxfFIqHZQ6G4LNFy0Y/d65e82NYoq/n0aPg6FDmTjgyC6MfZU3Wp9xEbENHfnpPV+
         pZksIKkyLsrzgWrllHxYcizzEuwLp1W8+qT5u27avlzmqT6p0jB5demvUpZnRb5I150q
         kn/pup/InM3FOFWt2QjaCXjMUtMMpTRVJTI/bHDWaUyzWB9quc98IGyf1NO+RzZHAXVM
         o5/Q==
X-Gm-Message-State: ACrzQf2iNIYcNZkazsBQU2J7Mip4l8Bsyh3VJNeKq6wLAF9KaBvawxp+
        mrlL3nTulB1h+6PQcZ42J+DllA3+OMNeenKazQE=
X-Google-Smtp-Source: AMsMyM7B0KgO1ePqgiznBJPxBFqW0p1QJVzP9XdnRybtCWEEA1+7r7SGcBMaZXE781qwVCHZ0F/UGDKN4buuMG8EUng=
X-Received: by 2002:a63:8aca:0:b0:461:25fe:e7c5 with SMTP id
 y193-20020a638aca000000b0046125fee7c5mr34958534pgd.395.1667651947704; Sat, 05
 Nov 2022 05:39:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7301:2e91:b0:83:922d:c616 with HTTP; Sat, 5 Nov 2022
 05:39:06 -0700 (PDT)
Reply-To: stefanopessia755@hotmail.com
From:   Stefano Pessina <wamathaibenard@gmail.com>
Date:   Sat, 5 Nov 2022 15:39:06 +0300
Message-ID: <CAN7bvZKFRi6jCy913fp9Nu5T=uorMfPGun5ibm5bYqhSVn2ZFA@mail.gmail.com>
Subject: Geldspende
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

--=20
Die Summe von 500.000,00 =E2=82=AC wurde Ihnen von STEFANO PESSINA gespende=
t.
Bitte kontaktieren Sie uns f=C3=BCr weitere Informationen =C3=BCber
stefanopessia755@hotmail.com
