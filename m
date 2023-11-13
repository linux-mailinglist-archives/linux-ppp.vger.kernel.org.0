Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 078707E9403
	for <lists+linux-ppp@lfdr.de>; Mon, 13 Nov 2023 02:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbjKMBWD (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 12 Nov 2023 20:22:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbjKMBWC (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 12 Nov 2023 20:22:02 -0500
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB851BFB
        for <linux-ppp@vger.kernel.org>; Sun, 12 Nov 2023 17:21:59 -0800 (PST)
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-7ba8e3107c9so1548305241.1
        for <linux-ppp@vger.kernel.org>; Sun, 12 Nov 2023 17:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699838518; x=1700443318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vNurDf4CzF9QkoO3QEAYVk3z0Y7lyIAVjWoGpsctJQ=;
        b=KB/5dor3DmCO5wfvgSADINlKWtFIpzd9TDcqHZHCA+g09UTRvBOIHkdXcqNcqAwDNm
         FDA+wf7A2rzBkl3ybVkpmFmUqVQQhy0yvt0Ay0vzEjGjtgVMxNO02p1NGyrS4Tr0XFhI
         bgG6eEJ1iVVpMLfeeMgRh/VA4N3PZ0Kr7aoI1My5pQ/LEtkLXzAOJ/RWFkHYYb6VATJY
         o7Ophfh8UkAJblmMhMM17l/yObcuAyDojdjohcx4qTKIOYI9UVZxA/wZZrQ3bLBAgyE9
         XfX/f1RCGD0euHrHUCQS6jCMz/qLNCaUA7UUDjSVgL5wTyGBsG3jgJEypjPTrNnm5o5s
         AuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699838518; x=1700443318;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3vNurDf4CzF9QkoO3QEAYVk3z0Y7lyIAVjWoGpsctJQ=;
        b=RzbTPSn0DZ1y6jH5KaCGTIZY8Nk2Rp28W1lkVSSPJj5+VVUYCtKpsMukxv6e5rDSfD
         Gr4pLDxWZwqrPp4SUC1PBUyoZ8qn3HNs26BpxAyM8lW0TYL9DNCA+qZG2Z0RSt+8MAOk
         nXGEqAxbkFWGblsKBYSh5UO1FONGFmKwp1DfJvxZL8gljm4PmV6EEf5xuYFL81X8jRNs
         Zvx1fnqwBKvJt3WKlRz5gGhtrwvTOV++cUD/H7FlwRASK3qb7cKlRB15W0TU7gjw+giY
         UU/PBZVAKcUnTdYbKXGRGJDEkodfjFv43GI8d4aYQMETXpdctQ25tloi6ptRs/uTYHRB
         x0pw==
X-Gm-Message-State: AOJu0YxbWGFakWygpBlwWx7noXxh0L6Y8snMOz/dzy5jmFD/yjBTwYg/
        6Um423DkEqJlP+3MNEibpZCVFGjkzh8=
X-Google-Smtp-Source: AGHT+IFvsR+EXsTXVaIKfanbSgbZXFubJrFTNZFIMGaXHuLkIN1rDz2U7ADVLdtVMPCG7yLQJ9N1GQ==
X-Received: by 2002:a05:6102:1481:b0:45d:9cb0:28fc with SMTP id d1-20020a056102148100b0045d9cb028fcmr6669986vsv.9.1699838518048;
        Sun, 12 Nov 2023 17:21:58 -0800 (PST)
Received: from localhost (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id i25-20020ac84899000000b0041cc2852f62sm1559620qtq.5.2023.11.12.17.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 17:21:57 -0800 (PST)
Date:   Sun, 12 Nov 2023 20:21:57 -0500
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To:     William Tambe <tambewilliam@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>
Cc:     linux-ppp@vger.kernel.org
Message-ID: <65517a353b434_a2295294bc@willemb.c.googlers.com.notmuch>
In-Reply-To: <CAF8i9mO24ByRSjNR6N0ym-LU30z-NTfiw=Q_+Dvx6L6baEq0HQ@mail.gmail.com>
References: <CAF8i9mO42DbVzPhz9cpaL2frpYUyOcSC7qdx6r6bYxkS+QYrKw@mail.gmail.com>
 <ZRpj0LotoVlBRWs7@cleo>
 <CAF8i9mO24ByRSjNR6N0ym-LU30z-NTfiw=Q_+Dvx6L6baEq0HQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/net/slip: prevent data alignment fault
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

William Tambe wrote:
> Thanks, sending v2 of the patch that uses put_unaligned() here, and
> get_unaligned().

I can't find your v2 archived in lore, so responding to this thread.

If you want a patch merged to networking, you'll have to cc
netdev@vger.kernel.org and the networking maintainers.

Consider running scripts/get_maintainer.pl and also see
https://www.kernel.org/doc/Documentation/process/maintainer-netdev.rst

