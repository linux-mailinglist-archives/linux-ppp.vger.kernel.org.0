Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3536C5EB634
	for <lists+linux-ppp@lfdr.de>; Tue, 27 Sep 2022 02:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbiI0AVp (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 26 Sep 2022 20:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiI0AVn (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 26 Sep 2022 20:21:43 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED216A4BAB
        for <linux-ppp@vger.kernel.org>; Mon, 26 Sep 2022 17:21:42 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3321c2a8d4cso85486987b3.5
        for <linux-ppp@vger.kernel.org>; Mon, 26 Sep 2022 17:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date;
        bh=AH29rNFat8gr8vzSfH/p9KdgBsHyVh3Eh4ohXf5CfQ4=;
        b=QY1m12rqONPwqOtd8qXdiGqRXiguACXQx0amgcbA1BbY4PUjcYxYhYnh7Q7Ob3ukbx
         2+JMEUDPMZld3yRQWBiDiA2eucWIt8NashFTHcAQrbad8md14MOoFi7d9Mx+CvejwdiX
         QgI/ridBus6YEaMZjM06Cs778v4xOBOc3GuJd0fEBGii2OA4Tyk7lcWsB364+R/4dmmm
         afSjLPRIwP5p+6RYWZ7PBv9yAK2rGcWeR/VLbyfzyt04EPNtmdHFTfyK5Riz9obQMGNi
         aXqRP5CyIyVpwf/8DSJqvV2hSfiEjMQQCbWViaag10vLamClrh3sGbTljw1TOBi8hIJE
         XFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=AH29rNFat8gr8vzSfH/p9KdgBsHyVh3Eh4ohXf5CfQ4=;
        b=u6Vz0RHTae74dgBzO3hrRKCmwXd4MZk0o0jD1/ersHXxXtkU/wCOklhPkz7G5074jF
         ZaT8FC16wFztvkYZfEhgRXuOIgYNhrU5ioyiaVMrMFOLyk+hlZpK0nvVbRMTLoSv99v5
         H2JNz8C+pwiCqwxU80dAWWNwUiEk0nIghiq6J65gS2To0g9idhvKJFQ/+kUNK3Ql667v
         9s3X0ZHJOSFjYCKrdILeuwsEp5k8GaUrhHLGfbQSTzVCEYwPdCOGcw5Ngk6Jrlf22rrz
         0xsF+WnT60pFMT/HmD2JT1scKVenMZKB6s73t+zSmacuS+rjJOT0Blqwry6p6W4z8gES
         dfgw==
X-Gm-Message-State: ACrzQf0eHOsXVvD9pXDmQOuOcLK2FIIhVmumzgNjJ7ojz3JeRd2IHm5+
        /gzFs7sFCs49binnLQJQ8LI2YN5hS0UZfZEVqPc=
X-Google-Smtp-Source: AMsMyM4nbxuR9dBOKxRwWeo7vhYpeiDXNwA6tudo97JBqYv0unraiOYwHi+9+7VBWytjGGEX+b+gRuWVI4qVMbAWUJw=
X-Received: by 2002:a81:2587:0:b0:350:f4ae:9d16 with SMTP id
 l129-20020a812587000000b00350f4ae9d16mr4838356ywl.371.1664238102233; Mon, 26
 Sep 2022 17:21:42 -0700 (PDT)
MIME-Version: 1.0
Sender: katherinemcmillian2@gmail.com
Received: by 2002:a05:6918:71c8:b0:df:4fe9:b499 with HTTP; Mon, 26 Sep 2022
 17:21:41 -0700 (PDT)
From:   Jessica Daniel <jessicadaniel7833@gmail.com>
Date:   Tue, 27 Sep 2022 00:21:41 +0000
X-Google-Sender-Auth: LcgZp3S0WtIBWPuPPafNRfuD-yU
Message-ID: <CAGn3a5hRXD0E6urv-qvu+-oi67fGeF4sbLj+zb-pdVZdz1idnA@mail.gmail.com>
Subject: ???
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

-- 
Hello Dear
Good Day
