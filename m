Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 076C4B581F
	for <lists+linux-ppp@lfdr.de>; Wed, 18 Sep 2019 00:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbfIQWkV (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 17 Sep 2019 18:40:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30231 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727770AbfIQWkU (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Tue, 17 Sep 2019 18:40:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1568760020;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LUUYI8CjNVzBmJujeYRXb7+pohElHXvrx9xNBUv2jWY=;
        b=RRoEOqG5NK+KJuku053qSzuHmgGBth+buC/PqZGR58xOtet2FAQpD1nUoYfU5M+agypgW4
        UIw5T6iHeGZV2HDBT84RcBDlrzOC7QHGQh/9YNzS3Oy5BBLueP9OsmLVYV11Eyxqo4aRun
        wc3lvBaYOqyiTaXp8M8mmpVNUW8nC+M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-LJI5F8X0Pb6zdCTwQsRBlA-1; Tue, 17 Sep 2019 18:40:17 -0400
Received: by mail-wm1-f71.google.com with SMTP id 190so121319wme.4
        for <linux-ppp@vger.kernel.org>; Tue, 17 Sep 2019 15:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UTkaJK5j2qCJwl7pxcvNmihLdBRvEi/tLlYKvdtQFBk=;
        b=TGpF/zW7phPXJG/u8yGK2ArDUa6Srvfz5jktSccooI34OT0mbMEdkqOwbT1HE6YKTn
         1L2LGFzeGiXh+3/IoL0iypBHJ5Bx6YNHMz7Jyo2fMya7qqt3xjETI0UI1GxYji+fiPli
         v94Zfko6Zr8O+bvfGQqg2CxyDDxHIXN55zEg8A9ncH2pRexrmm9kGAReUDEhqWCUeXJJ
         RZmL7RJVtNK7VKk0wqBMyVcuCTpDgBBERQFf7+Cj00soOqRE+c+viHW/acyZZrCJY5jd
         Yl5R5cHGlDzsTOVCiMWhQRF6IF2UjoXtmGQNCnrrvVkUUsbUNKdC0AApuSsZP9ERIvmG
         Zvhw==
X-Gm-Message-State: APjAAAWPAIvOPaGbHuwVNVoksjJp3SKdBW04VBbMk4R64Gd11v+pKn5y
        LFRJNztXmOgIH5YhB7IXZpbgDUOoKpVhiSfOVGKdYnSUvwq+EXlUGuIO1jGeL3AntrHq8wij3m1
        LCYpw/Km18SxKRkGTsQuW
X-Received: by 2002:a7b:c156:: with SMTP id z22mr281017wmi.142.1568760015558;
        Tue, 17 Sep 2019 15:40:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwdfsB0wI0pUF12eNXf1OVIPPHsoKiZpw/a93RWu0IXiCSLpB9SDlDDFuoUfAF/yHNz0beSIQ==
X-Received: by 2002:a7b:c156:: with SMTP id z22mr281010wmi.142.1568760015310;
        Tue, 17 Sep 2019 15:40:15 -0700 (PDT)
Received: from linux.home (2a01cb0585290000c08fcfaf4969c46f.ipv6.abo.wanadoo.fr. [2a01:cb05:8529:0:c08f:cfaf:4969:c46f])
        by smtp.gmail.com with ESMTPSA id z142sm594077wmc.24.2019.09.17.15.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 15:40:14 -0700 (PDT)
Date:   Wed, 18 Sep 2019 00:40:12 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     Takeshi Misawa <jeliantsurux@gmail.com>
Cc:     Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>, linux-ppp@vger.kernel.org
Subject: Re: [PATCH] ppp: Fix memory leak in ppp_write
Message-ID: <20190917224012.GA10899@linux.home>
References: <20190914040958.GA2363@DESKTOP>
MIME-Version: 1.0
In-Reply-To: <20190914040958.GA2363@DESKTOP>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-MC-Unique: LJI5F8X0Pb6zdCTwQsRBlA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Sat, Sep 14, 2019 at 01:09:58PM +0900, Takeshi Misawa wrote:
> When ppp is closing, __ppp_xmit_process() failed to enqueue skb
> and skb allocated in ppp_write() is leaked.
>=20
> syzbot reported :
> BUG: memory leak
> unreferenced object 0xffff88812a17bc00 (size 224):
>   comm "syz-executor673", pid 6952, jiffies 4294942888 (age 13.040s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<00000000d110fff9>] kmemleak_alloc_recursive include/linux/kmemleak.=
h:43 [inline]
>     [<00000000d110fff9>] slab_post_alloc_hook mm/slab.h:522 [inline]
>     [<00000000d110fff9>] slab_alloc_node mm/slab.c:3262 [inline]
>     [<00000000d110fff9>] kmem_cache_alloc_node+0x163/0x2f0 mm/slab.c:3574
>     [<000000002d616113>] __alloc_skb+0x6e/0x210 net/core/skbuff.c:197
>     [<000000000167fc45>] alloc_skb include/linux/skbuff.h:1055 [inline]
>     [<000000000167fc45>] ppp_write+0x48/0x120 drivers/net/ppp/ppp_generic=
.c:502
>     [<000000009ab42c0b>] __vfs_write+0x43/0xa0 fs/read_write.c:494
>     [<00000000086b2e22>] vfs_write fs/read_write.c:558 [inline]
>     [<00000000086b2e22>] vfs_write+0xee/0x210 fs/read_write.c:542
>     [<00000000a2b70ef9>] ksys_write+0x7c/0x130 fs/read_write.c:611
>     [<00000000ce5e0fdd>] __do_sys_write fs/read_write.c:623 [inline]
>     [<00000000ce5e0fdd>] __se_sys_write fs/read_write.c:620 [inline]
>     [<00000000ce5e0fdd>] __x64_sys_write+0x1e/0x30 fs/read_write.c:620
>     [<00000000d9d7b370>] do_syscall_64+0x76/0x1a0 arch/x86/entry/common.c=
:296
>     [<0000000006e6d506>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
>=20
> Fix this by freeing skb, if ppp is closing.
>=20
> Reported-and-tested-by: syzbot+d9c8bf24e56416d7ce2c@syzkaller.appspotmail=
.com
> Signed-off-by: Takeshi Misawa <jeliantsurux@gmail.com>
> ---
> Dear Paul Mackerras
>=20
> syzbot reported memory leak in net/ppp.
> [TITLE] memory leak in ppp_write
>=20
> I send a patch that passed syzbot reproducer test.=20
> Please consider this memory leak and patch.
>=20
Hi Takeshi,

Kernel networking patches are reviewed on netdev ML. Your patch looks
good but the description misses a Fixes tag:

Fixes: 6d066734e9f0 ("ppp: avoid loop in xmit recursion detection code")

Can you please send this patch formally to netdev? Don't forget to
indicate which tree you're tagetting in the subject. In this case, it
should be [PATCH net] (see Documentation/networking/netdev-FAQ.rst for
details).

Thanks for fixing my bug :)

Guillaume

