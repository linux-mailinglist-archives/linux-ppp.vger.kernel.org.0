Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 664377E9AC4
	for <lists+linux-ppp@lfdr.de>; Mon, 13 Nov 2023 12:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjKMLKa (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 13 Nov 2023 06:10:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjKMLK3 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 13 Nov 2023 06:10:29 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED19F10E2;
        Mon, 13 Nov 2023 03:10:24 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D12AC433CC;
        Mon, 13 Nov 2023 11:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699873824;
        bh=ExY8ABX+iV1daP2D0jLDdL7Fvhf76TXH+N7JEGyRTRI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=utTQ57/7tis1IBrFNvNhsfTp8PD2nGin4E3EZxjUcgTEUlGlmZXTsOlx34/fl80Lz
         yAZG7Oyqi2x5UIdUVf+UxVBbYn9H9PvA4SpY/ATQBZgxCb98EjU0g7ALaZ09tOslY/
         gf5wYeZBKTijG6uoAG1Bsi7mR9agqcErfzvcFI0ySG/4mSbY/UAIIZ3LeDG4WLnVph
         qkCXI7tnTwRpddt5wHt1pIzCCvBwiCIw97ThPLhnc9NByj0vFKDgGiPx7XaMgIBBQd
         CxvMneHmCLbqwvHdrBJXleCKa5KmHIUAgn91R+khUKFx2SSapqPuoIIbaSsyiaLaSV
         IsLBEdHFld3yw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6A69BC04DD9;
        Mon, 13 Nov 2023 11:10:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] ppp: limit MRU to 64K
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169987382443.356.16944997528877845349.git-patchwork-notify@kernel.org>
Date:   Mon, 13 Nov 2023 11:10:24 +0000
References: <20231113031705.803615-1-willemdebruijn.kernel@gmail.com>
In-Reply-To: <20231113031705.803615-1-willemdebruijn.kernel@gmail.com>
To:     Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc:     netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
        edumazet@google.com, pabeni@redhat.com, linux-ppp@vger.kernel.org,
        stable@vger.kernel.org, mitch@sfgoth.com, mostrows@earthlink.net,
        jchapman@katalix.com, willemb@google.com,
        syzbot+6177e1f90d92583bcc58@syzkaller.appspotmail.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Sun, 12 Nov 2023 22:16:32 -0500 you wrote:
> From: Willem de Bruijn <willemb@google.com>
> 
> ppp_sync_ioctl allows setting device MRU, but does not sanity check
> this input.
> 
> Limit to a sane upper bound of 64KB.
> 
> [...]

Here is the summary with links:
  - [net] ppp: limit MRU to 64K
    https://git.kernel.org/netdev/net/c/c0a2a1b0d631

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


