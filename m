Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6C3B2B01
	for <lists+linux-ppp@lfdr.de>; Sat, 14 Sep 2019 12:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728196AbfINKgN (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sat, 14 Sep 2019 06:36:13 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:22951 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726313AbfINKgN (ORCPT <rfc822;linux-ppp@vger.kernel.org>);
        Sat, 14 Sep 2019 06:36:13 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id 81D0120358;
        Sat, 14 Sep 2019 12:36:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1568457366; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Es/MiPyCfr0G7L32hjce7Rfv0YnP7NgRF2lVj2oRdL0=;
        b=Ee/+1tqq41WwaLOf0WFIfPAUHMMwvDm01AcsiMUqYZIkRP9SoBrXIeY36WN3kNENofNjzh
        aIaf/j8f3RXvGirVLwj1dy6SmoFHxPTXDqJzXSO0eFcCC92jFYEzxXcSAA+jkZRZRyBPWJ
        dHTk+BhUvq7pGMC4H1ocb2IGW3EGU6H/O9I1Gy4Cbk8zh2asNJ1Nh0tSPCrumLqmKIeJMM
        DxWiz5zhiLrAHArDq5I7ilrvq9t120JNCKt8z3SYKlXawc4YHmZazxBzpFcjXOKf1e9vgv
        EA1mcG+/Hbg0I2v9xYhQEALkl6HDYACfk+ymXRXvGeP1HluXmd9qwnjV8M8/VQ==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id 1F34ABEEBD;
        Sat, 14 Sep 2019 12:36:06 +0200 (CEST)
Message-ID: <5D7CC295.3090402@bfs.de>
Date:   Sat, 14 Sep 2019 12:36:05 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     Takeshi Misawa <jeliantsurux@gmail.com>
CC:     Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>, linux-ppp@vger.kernel.org
Subject: Re: [PATCH] ppp: Fix memory leak in ppp_write
References: <20190914040958.GA2363@DESKTOP>
In-Reply-To: <20190914040958.GA2363@DESKTOP>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.10
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.10 / 7.00];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         TO_DN_SOME(0.00)[];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         FREEMAIL_TO(0.00)[gmail.com];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-3.00)[100.00%];
         ARC_NA(0.00)[];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[4];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         MIME_GOOD(-0.10)[text/plain];
         DKIM_SIGNED(0.00)[];
         NEURAL_HAM(-0.00)[-0.999,0];
         RCVD_COUNT_TWO(0.00)[2];
         RCVD_TLS_ALL(0.00)[]
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org



Am 14.09.2019 06:09, schrieb Takeshi Misawa:
> When ppp is closing, __ppp_xmit_process() failed to enqueue skb
> and skb allocated in ppp_write() is leaked.
> 
> syzbot reported :
> BUG: memory leak
> unreferenced object 0xffff88812a17bc00 (size 224):
>   comm "syz-executor673", pid 6952, jiffies 4294942888 (age 13.040s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<00000000d110fff9>] kmemleak_alloc_recursive include/linux/kmemleak.h:43 [inline]
>     [<00000000d110fff9>] slab_post_alloc_hook mm/slab.h:522 [inline]
>     [<00000000d110fff9>] slab_alloc_node mm/slab.c:3262 [inline]
>     [<00000000d110fff9>] kmem_cache_alloc_node+0x163/0x2f0 mm/slab.c:3574
>     [<000000002d616113>] __alloc_skb+0x6e/0x210 net/core/skbuff.c:197
>     [<000000000167fc45>] alloc_skb include/linux/skbuff.h:1055 [inline]
>     [<000000000167fc45>] ppp_write+0x48/0x120 drivers/net/ppp/ppp_generic.c:502
>     [<000000009ab42c0b>] __vfs_write+0x43/0xa0 fs/read_write.c:494
>     [<00000000086b2e22>] vfs_write fs/read_write.c:558 [inline]
>     [<00000000086b2e22>] vfs_write+0xee/0x210 fs/read_write.c:542
>     [<00000000a2b70ef9>] ksys_write+0x7c/0x130 fs/read_write.c:611
>     [<00000000ce5e0fdd>] __do_sys_write fs/read_write.c:623 [inline]
>     [<00000000ce5e0fdd>] __se_sys_write fs/read_write.c:620 [inline]
>     [<00000000ce5e0fdd>] __x64_sys_write+0x1e/0x30 fs/read_write.c:620
>     [<00000000d9d7b370>] do_syscall_64+0x76/0x1a0 arch/x86/entry/common.c:296
>     [<0000000006e6d506>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> Fix this by freeing skb, if ppp is closing.
> 
> Reported-and-tested-by: syzbot+d9c8bf24e56416d7ce2c@syzkaller.appspotmail.com
> Signed-off-by: Takeshi Misawa <jeliantsurux@gmail.com>
> ---
> Dear Paul Mackerras
> 
> syzbot reported memory leak in net/ppp.
> [TITLE] memory leak in ppp_write
> 
> I send a patch that passed syzbot reproducer test. 
> Please consider this memory leak and patch.
> 
> Regards.
> ---
>  drivers/net/ppp/ppp_generic.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index a30e41a56085..9a1b006904a7 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -1415,6 +1415,8 @@ static void __ppp_xmit_process(struct ppp *ppp, struct sk_buff *skb)
>  			netif_wake_queue(ppp->dev);
>  		else
>  			netif_stop_queue(ppp->dev);
> +	} else {
> +		kfree_skb(skb);
>  	}
>  	ppp_xmit_unlock(ppp);
>  }

nitpicking:

i would suggest
if (ppp->closing)
	kfree_skb(skb)

else
 ......

i think that make that more easy to read as people tend to overlook
things like *not*.

re,
 wh
