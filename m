Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 140B4400655
	for <lists+linux-ppp@lfdr.de>; Fri,  3 Sep 2021 22:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349535AbhICUL2 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 3 Sep 2021 16:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236027AbhICUL2 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 3 Sep 2021 16:11:28 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAAD9C061575
        for <linux-ppp@vger.kernel.org>; Fri,  3 Sep 2021 13:10:27 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id b64so331093qkg.0
        for <linux-ppp@vger.kernel.org>; Fri, 03 Sep 2021 13:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=xWTQOl6sk93RcNqW1T6BCmfuD1Yj/Aj0Crer4shVJDs=;
        b=c+DJGqb4OI0YHmPqk3Ho1XTJalyV2w8/8L3u8/dmUcsBqVf5msgbhb0L9LMnuh7d1l
         U04N8Z7S6TaBsizzIHyu/t4MfrKZOHmlxWtdu/3y1cpknbFHG1yi+UJSzL3yJMGB0BeL
         1GbhKBy4SAmYV2SR+JEYWzh86NMkwpOFuVOTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=xWTQOl6sk93RcNqW1T6BCmfuD1Yj/Aj0Crer4shVJDs=;
        b=rlLOo/seV/u6V5S7qLqO4iX8pR7r9Xl0EDuVRs4/uWZsD1+bEW7XLf/cXxSmM489bV
         BRfakMgjqn1luXXAeoadt/tBcoCeagcTE/x8mnXIwSWeX0XuviiOU5izaVOVLO1ql9cE
         vooPlcy6ML/lJC+a2JHiPZlhFs3wDPKu08o89yHhWY8TpfGzrnM176I411CJsaVKdY2h
         YTlX4cNU3t8NctFAAagSA+jKYavH8IPq3Ii0mgjxub12/KOF0FepVTW/ydklKnFSFgB0
         HXV6IlEqURMSCOSBC7Sgt4B/v7CkZVNPUAkwc2iONLufi6iHyq2IXSeXgqe6XFTWrpSB
         pwDQ==
X-Gm-Message-State: AOAM533fUyuAS7KIs3Q74mZdhhwgGIr76pUuFRA5g+mgnK7kemo9Rc55
        5WZSudo/nh3rD7HKInPPU5CH6y96yPf6ia+h
X-Google-Smtp-Source: ABdhPJyTrhMENR2ECBgtp3n4jVqfwvwR/jlCuFaQkGsAmvfyUBPAE+6I5jVPBDUEygy5iGNsvs1dPg==
X-Received: by 2002:a37:a38b:: with SMTP id m133mr591484qke.414.1630699826727;
        Fri, 03 Sep 2021 13:10:26 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id s20sm256348qtw.14.2021.09.03.13.10.26
        for <linux-ppp@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:10:26 -0700 (PDT)
Date:   Fri, 3 Sep 2021 16:10:24 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-ppp@vger.kernel.org
Subject: Test delivery to lore.kernel.org
Message-ID: <20210903201024.wj2ua3n3ftnq4mat@meerkat.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hello:

This is a test message to ensure that delivery to lore.kernel.org is working
as intended:
https://lore.kernel.org/linux-ppp/

-K
