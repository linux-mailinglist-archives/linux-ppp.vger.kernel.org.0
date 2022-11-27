Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBE0639C9E
	for <lists+linux-ppp@lfdr.de>; Sun, 27 Nov 2022 20:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiK0TwJ (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 27 Nov 2022 14:52:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiK0TwI (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 27 Nov 2022 14:52:08 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82FA465C7
        for <linux-ppp@vger.kernel.org>; Sun, 27 Nov 2022 11:52:07 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id v1so13803646wrt.11
        for <linux-ppp@vger.kernel.org>; Sun, 27 Nov 2022 11:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=biw1utCmNyI+ef9futimPqL2qrgw3YwY9eWMD1oBQZg=;
        b=og7VgS1YbenSoQq97lC3cI8xrZ+c6/m06QA25RBZNPUpDdb2ZnUb0c7AaWtyI9fRhK
         1gm+q1zZGNoyUFJDyxditRYrB4ta8lgRM/8PYx+FCfYTlS4kX34ITMnvNJ4rCawKeY3m
         5zeTbleCJ9IrrR/4+bkUYKIdfns34X164U7qj91dQPRy+/9xLUQr+0jNmeJHoJkcLvXz
         pQ33uy+3M/gM1yFwwLlPT0rFljtiwZqGPnJqR4g+yG5TzQfYMsB4U8FULwrROxd6RBoK
         wRkuLW8qSnNYbVhmJ13cNkGU3/679IfG+v+9dPLYClOjPBtWQs04yk/MaXJZJ6NTkEhY
         wB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:mime-version:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=biw1utCmNyI+ef9futimPqL2qrgw3YwY9eWMD1oBQZg=;
        b=ntiYzlFunrht5KsWOZ9qZRx34NGc0v8RzRSE+vgTTFsaAzL/Iz9txCvaVEF+4JgfnN
         GFxCxLvh+vALyQahjO+i7n9X5PhDzH1TROXzp7pH3jF+b8Q3fE4wDER/KcPer9b9bcuc
         8NNNkB+ADLfRT/ACYFWyK0bmV8+oi62pMdJlacu/dSy9N7ZpdylHADwLklvx2dcCXwZk
         MghgPib+5elS91JnEV2afnYTVBL/FbRWxXct100XKStcIqkxwjx7HmRBX+hyGW5WwxJb
         +7O0ke5S6AR22XG67QZV8k+w2OCNYilxjNOjCskZLj8/JEMBWwa1XXvLYLAsf/ag2T+g
         9QfA==
X-Gm-Message-State: ANoB5pnU0T0Jfwwn09mvW9QH84kafu814f8tY8PyipOdSmxWQlzaXtou
        zXnCOGVQp+psGlH0Up1tg+debxe1YPZCaKzDCrj8HKkV9zjrlzMJ
X-Google-Smtp-Source: AA0mqf6tQYgL8malWf8Az5zT1nPrkkTnpUw5DuiZKVM0QvAu8MJCDGWgSz74m1uoSZNoIWLzBsmcH0pvNfse/lIzGD8=
X-Received: by 2002:a05:6000:c5:b0:236:596f:acb4 with SMTP id
 q5-20020a05600000c500b00236596facb4mr28211993wrx.586.1669578725889; Sun, 27
 Nov 2022 11:52:05 -0800 (PST)
Received: from 332509754669 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 27 Nov 2022 13:52:05 -0600
From:   HAROLD COOPER <haroldcooper810@gmail.com>
Mime-Version: 1.0
Date:   Sun, 27 Nov 2022 13:52:05 -0600
Message-ID: <CA+0JWioEiXDxENFppsK1PZTjk289FgjTZFnsv58MMOCbUpfJvw@mail.gmail.com>
Subject: HARD HAT
To:     linux-ppp@vger.kernel.org
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

To whom it may concern,
I would like to order HARD HAT . I would be glad if you could email me
back with the types and pricing you carry at the moment .

Regards ,
Mr HAROLD COOPER
PH: 813 750 7707
