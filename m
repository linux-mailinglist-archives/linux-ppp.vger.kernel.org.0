Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD5316E5903
	for <lists+linux-ppp@lfdr.de>; Tue, 18 Apr 2023 08:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbjDRF7x (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 18 Apr 2023 01:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbjDRF7p (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Tue, 18 Apr 2023 01:59:45 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C47C35FC5
        for <linux-ppp@vger.kernel.org>; Mon, 17 Apr 2023 22:59:34 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id xd13so36322052ejb.4
        for <linux-ppp@vger.kernel.org>; Mon, 17 Apr 2023 22:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681797572; x=1684389572;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQlu0Oc2Q0nPMBCNq5iTPUZpwrRZlsMdPt2zjra8+VI=;
        b=Q9XcLLXP5e8wboQuneHNRwA5cMY+ukHK/VdkGLUEPa2WH97xr/iMWRqkGgFlRDRmww
         kBel7+Kq4mFvsQxYB/MnW5URrKGRuteDJwAFdC5isRzvOeI+yPizsN+hpI3D/XvqCk/g
         Xl5dFhJgEE5cs8jky/l0yby6XiNa6AOPcJhwxx1RIN7fVVIKvCyBjBFnT1HEjX7pQ02S
         pkJ79uNHwOtZ1HdzSdq79DxBfM4XPwZKyKgR4LcOSdw0f4O+AWz6LsnID8+kJhTdi4B6
         jUdMHmmhtkbx5PHp8QrT4g+gt0tleFnzRklW9+2puzm58tAorAL1028T+b3iCyAQJHV5
         91PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681797572; x=1684389572;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dQlu0Oc2Q0nPMBCNq5iTPUZpwrRZlsMdPt2zjra8+VI=;
        b=Iul9yFmU/r1C1xn8nqwP/KIo+qn9golk6+Vsw+4xtr+8zxVIzNMyIfcuQewVl+q1PV
         ufpAVF9mZukIgKJwnCFgC2RIDRVK4BPqy0WkNPzhOQnqXVgeDppsz+eqqhQfRaF+Sycd
         9iMcYb/wH7Shr5Qw3kXjwtECev+/U6qp9KkUzZuk18/LJqK4ZZ/i25Cp3nUdNWrn8DHt
         jro6277MjhpI9+Dnc1UNcU71B4VCgOW14GP0LAO9juKu+DtXrUCPUd2BVMsVK93cTyAy
         0Dz4y/BOLLFKVnx61zd0hkyssurdaJA/9uZBOfTlWwNZ0yp/ZmjhlPM9D3KsJZEfRM5W
         HSfw==
X-Gm-Message-State: AAQBX9d50tMOvTvX5pJydf6fiJu3CRoo89goS+u2FEib9EnfHTHC+Kpe
        Q+rRjjw17rjFLoMj5MGG5mZktKzooOa/rlPV/rC882d5M9HFg2yx
X-Google-Smtp-Source: AKy350YRsUSKQ0+i58Lzun7WtY7IrRwSkm+DWIi2JdfS71rVYYWUT2OQ/a/Q5PRWIBazn3AQLm2dWBYGVxBajLvvRoE=
X-Received: by 2002:a05:6512:96b:b0:4e8:4b7a:6b73 with SMTP id
 v11-20020a056512096b00b004e84b7a6b73mr2935594lft.4.1681797550844; Mon, 17 Apr
 2023 22:59:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab2:2681:0:b0:1b6:840f:9075 with HTTP; Mon, 17 Apr 2023
 22:59:10 -0700 (PDT)
Reply-To: mariamkouame.info@myself.com
From:   Mariam Kouame <mariamkouame1992@gmail.com>
Date:   Mon, 17 Apr 2023 22:59:10 -0700
Message-ID: <CADUz=agNY633M0qMXMnAP3Ms7-3rKuWtAZGCOQZKeYpCdBxT_w@mail.gmail.com>
Subject: from mariam kouame
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Dear,

Please grant me permission to share a very crucial discussion with
you. I am looking forward to hearing from you at your earliest
convenience.

Mrs. Mariam Kouame
