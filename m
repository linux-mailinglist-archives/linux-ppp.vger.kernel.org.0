Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 519C26ABC64
	for <lists+linux-ppp@lfdr.de>; Mon,  6 Mar 2023 11:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjCFK05 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 6 Mar 2023 05:26:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbjCFK0d (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 6 Mar 2023 05:26:33 -0500
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3FC26867
        for <linux-ppp@vger.kernel.org>; Mon,  6 Mar 2023 02:26:04 -0800 (PST)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1755e639b65so10844175fac.3
        for <linux-ppp@vger.kernel.org>; Mon, 06 Mar 2023 02:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678098351;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vh7FN/ulAdnmY8O0LKz7bqpIFk4oOSQ9iCZ8VQ/AkNo=;
        b=EDbhPO1WKzSJy97Cp1KR4Ue1wIcLFSscoH9L1E67CyPoJvstONJwP7RxKCqsDiuar/
         4XZc6UhnyOFrEHlIQ3KmGU6oX8xWOyZpiVA4bD6F27cjopM5KQeiwoXnQq1r2hu/0hkW
         LgiQ9FGonNq8AsMsEKBqZEvtwgOfW2lv3iUKapY2ocqE+LRWfsVifUNA3eNbIcULbvPT
         nBBU0ns0xWwmvS7ETCAh5Z5lhdCiLVSRis+m63aq8CObwyUrMLAjGQpDeSf4OVAOQav5
         5TuEH4NOUnTGCqcHGRIE0/tBavRRplzW4HaWY1DRs+pas+nyfL/37adPjYmqfexbl/Di
         PS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098351;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vh7FN/ulAdnmY8O0LKz7bqpIFk4oOSQ9iCZ8VQ/AkNo=;
        b=4DSijBqrAqxqhdLoE+KEohKN35uVcv0tTrFBSuiVS/P4v0d7T8Y6SXgv4bAMIlv3XU
         Bu3wg34VEoglcZd3ZXPyNZK8tbjlqSVy32BvI7bp8I8QoQpx+/UPq85YFmxNJoN6QWcR
         eas13uRhfFthqTcfTIDpwtuDftoDk65iC7XyyW2WUdn6uuf3HtKcbmY2I7pEcVKbtAcM
         /HQN8zuatmzQAYMu6wDEiDiH/lhV5d6P3Rzhs00c01JE0KBmfegboNyajhmiiz41wj1X
         9U3+RgIZaeUcXZwTu81fHhOewWjygKhiWmJXCdrWchPhi/UOoLUVjgbzs5XdGli7RG7W
         MNEg==
X-Gm-Message-State: AO0yUKV7MF0nFdRtvl6grIVcYnKNMyVJCc4Ej1HuWoKUKpJXg3jApMwK
        L8o8JoA/mHwj/tUspsMgmodUVRlf0lMZqwMFiu6vMdl/4Fk=
X-Google-Smtp-Source: AK7set9YqazPiOkBuGm+YrFZOLe51O90+qKBrIr6WBjXtnVrmZ9RIOYyWRLBWcHI+/rsVoNhMQhwnCpcR6G8n2Z6mzE=
X-Received: by 2002:a05:6102:e44:b0:402:999f:44d3 with SMTP id
 p4-20020a0561020e4400b00402999f44d3mr6975472vst.1.1678098330725; Mon, 06 Mar
 2023 02:25:30 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:ce6f:0:b0:3ae:930b:3e70 with HTTP; Mon, 6 Mar 2023
 02:25:30 -0800 (PST)
Reply-To: madis.scarl@terlera.it
From:   "Ms Eve from U.N" <denisagotou@gmail.com>
Date:   Mon, 6 Mar 2023 11:25:30 +0100
Message-ID: <CAD6bNBi6bPCYboaF4-xBgmeUTFn6JMXqU6TNepQig=NRMqhdUg@mail.gmail.com>
Subject: Re: Claim of Fund:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_SCAM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hello Good Morning,
This is to bring to your notice that all our efforts to contact you
through this your email ID failed Please Kindly contact Barrister.
Steven Mike { mbarrsteven@gmail.com } on his private email for the
claim of your compensation entitlement

Note: You have to pay for the delivery fee.
Yours Sincerely
Mrs EVE LEWIS
