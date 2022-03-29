Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABAD4EB601
	for <lists+linux-ppp@lfdr.de>; Wed, 30 Mar 2022 00:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237383AbiC2Wbr (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 29 Mar 2022 18:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232767AbiC2Wbp (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Tue, 29 Mar 2022 18:31:45 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72B067563D;
        Tue, 29 Mar 2022 15:30:01 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id p12-20020a05600c430c00b0038cbdf52227so2366168wme.2;
        Tue, 29 Mar 2022 15:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=aqDO9b0s4rFbWyQhu08KqzA7mRlaQ2TzL/mNoslu4XdaO+OCcW1SzdwNHbDoZAOyd9
         d3/j4RQaPaIoH1FSD5p5ZPrWgy+IE1GjAiEJXbpZrX2TVrMuDzyYpEtobJ12h0d/B92H
         R5qDpYZPPgfSk0opZ94kW7+pbkAwIeb3V5QkIy2VUnPvDAcJ3p0OP3f/yophHVIqXbVc
         RhumBoMpCglpyOay9MECQOjm2ssOJ3ineGg1d73vbJedCJmHNTxtR+xlIY0gAVIMSGSJ
         7tbY01M/zEbOd10NBYz/Q6KKxYrM8sJ6b/kF9PtwmtV+SpQioqCmLxr+N7SIq5cIjE9f
         12Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=o8UXjzetuFbr1yz5awmLsAcRr0xnP7SX/mB1dWJDmJxE4Su9CCYIcgiWD+/LZSwopC
         RGMbv/oYRzSwz9WNEwu81TsUioVCut4Mg/1vZztG7F0nDnpLT1A5FvtwcNKsisuu54IJ
         smJnu95GYH1hfr5BrPh9cbQ7uRTssh92/xM9629NXVoFwbEMXs4JBSySIxkcPXAkYlPx
         b35/QTXCDkfW2ubWaZWY3aIKfwPh9niI2p59KOAL0XMJjrV9c4UuM4WweQ/EfPFFOKtW
         dRQ/+GQ6yPHPGzW7kjQ+YGkBbNd9BNWeAch7m0AJRu82B0zGCDPaNuj58Qgm1K2uU0gA
         993A==
X-Gm-Message-State: AOAM530uCoTgq8YUHhMzavSw+ygjImMF7SVIjWI40UTDia+ivRUdCtEW
        uz/48+FNeC54XDxmHdWUxKo=
X-Google-Smtp-Source: ABdhPJzhAaCqjq90Bt/EUr9RedRfOwbmv2czyUkqcXa0y5McDQHqN+v1E4rj4O+0Uo1flGxwp6g55g==
X-Received: by 2002:a05:600c:2146:b0:38c:ab68:1919 with SMTP id v6-20020a05600c214600b0038cab681919mr1640106wml.52.1648593000119;
        Tue, 29 Mar 2022 15:30:00 -0700 (PDT)
Received: from [172.20.10.4] ([102.91.4.187])
        by smtp.gmail.com with ESMTPSA id p16-20020a5d48d0000000b00205cf199abcsm2851970wrs.46.2022.03.29.15.29.54
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2022 15:29:57 -0700 (PDT)
Message-ID: <62438865.1c69fb81.a7286.bcda@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Gefeliciteerd, er is geld aan je gedoneerd
To:     Recipients <adeboyejofolashade55@gmail.com>
From:   adeboyejofolashade55@gmail.com
Date:   Tue, 29 Mar 2022 23:29:49 +0100
Reply-To: mike.weirsky.foundation003@gmail.com
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,T_US_DOLLARS_3 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Beste begunstigde,

 Je hebt een liefdadigheidsdonatie van ($ 10.000.000,00) van Mr. Mike Weirs=
ky, een winnaar van een powerball-jackpotloterij van $ 273 miljoen.  Ik don=
eer aan 5 willekeurige personen als je deze e-mail ontvangt, dan is je e-ma=
il geselecteerd na een spin-ball. Ik heb vrijwillig besloten om het bedrag =
van $ 10 miljoen USD aan jou te doneren als een van de geselecteerde 5, om =
mijn winst te verifi=EBren
 =

  Vriendelijk antwoord op: mike.weirsky.foundation003@gmail.com
 Voor uw claim.
