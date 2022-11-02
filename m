Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93E7661631C
	for <lists+linux-ppp@lfdr.de>; Wed,  2 Nov 2022 13:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiKBMyd (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 2 Nov 2022 08:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiKBMyc (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 2 Nov 2022 08:54:32 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C6725C6B
        for <linux-ppp@vger.kernel.org>; Wed,  2 Nov 2022 05:54:32 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id u6so16469666plq.12
        for <linux-ppp@vger.kernel.org>; Wed, 02 Nov 2022 05:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sz/uTvOc0gNmc74MGKA7yKeLqyFqD/joiI1SxwVZLms=;
        b=DDFEiayQZ0aoc0j8qESuVnOrtsgN5r1JfRISZ4nM+EYkfmTJlRPlm7Y+AZC56B524+
         8YdNh/HgVQbMo2vcUXYq2vQmTn0YdaOcGDjti9IX4G6cRymbZmoCTjUHLxXVwmRC9qBl
         OdinLiru+8Pml2k9zan/H8hdSdExvduPYeCO59VTcm7Llk6SKFcDj3EyrL0ZdGJjYuqd
         K8wtoFtk0+FwXeXBRcKlf90+WUJhcQp27kVvr5Mcctbdr0YLlkhPeiZxYWIV8j9PpGiG
         aIzs7R+/1P7vOMAMzwYE9/YrGCcQm0URgz/E+itu1V6EItOtoAdAMhiNVzQcC+A0kBmf
         T4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sz/uTvOc0gNmc74MGKA7yKeLqyFqD/joiI1SxwVZLms=;
        b=JsIcp3j2AdzkhYTTiMLfbpe7Nf24YIWEhjO8r65Clyv+JsLpXpsIfpMXGLCU9MX0Uy
         GWLMkOivFG8jBZuS+F77uQQ2eAfzWoOcLSD9QZBXX8svbu8RmTFQr55Oi6z8m3ovINrc
         BBRHOGg2uiaBUyk8atfhSLUIJCNTPBPZNDTTEc46fP5wN+v4XitQs7uWNR9DLkrmBfus
         8F0juAZ/5ly9O+CKxhglwydpK7vqu5+tC9t8WnJWsC8aiD5+79vhpLK9ZgCUCfX7OcrZ
         DisnCMKBsvQZFEK7ViA9wr7gSo5UtndLxVMuqY/S/vfIpRgRlkNe6YpmHToDw8YluMPY
         +ftg==
X-Gm-Message-State: ACrzQf0b2gM8PUxVu3TCgdoTHWMyPSjbGKqIMxyrdDYKEiMRXRamt1DD
        kwa0K9g3ieftj+DcK4cn7Nmd+hOA6HRVgJnz1t8=
X-Google-Smtp-Source: AMsMyM7+miAJDv7qelUCGkkZ05hxtl7x7HJMtyp7DQn7D0q0ldtWWGIZBgAku92SDkk/oh9+nyoDHiXkJPU/t93oasQ=
X-Received: by 2002:a17:903:2303:b0:186:8ef3:5efb with SMTP id
 d3-20020a170903230300b001868ef35efbmr25230418plh.118.1667393671821; Wed, 02
 Nov 2022 05:54:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:662c:b0:46:197b:656c with HTTP; Wed, 2 Nov 2022
 05:54:31 -0700 (PDT)
Reply-To: rihabmanyang1993@gmail.com
From:   Rihab Manyang <omardiakhate751@gmail.com>
Date:   Wed, 2 Nov 2022 12:54:31 +0000
Message-ID: <CAAs2n944ZSQU8Wa0F+KREYLjrXzMA9_nsDebXxsymwe=X9LQhA@mail.gmail.com>
Subject: HI DEAR..
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:632 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [omardiakhate751[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [rihabmanyang1993[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [omardiakhate751[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

-- 
My name is Rihab Manyang,i am here to search for a business partner and
friend who will help me to invest my fund in his country.
