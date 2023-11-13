Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E03F47E975E
	for <lists+linux-ppp@lfdr.de>; Mon, 13 Nov 2023 09:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjKMIJT (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 13 Nov 2023 03:09:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbjKMIJS (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 13 Nov 2023 03:09:18 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB86910F5
        for <linux-ppp@vger.kernel.org>; Mon, 13 Nov 2023 00:09:14 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-54366bb1c02so9726a12.1
        for <linux-ppp@vger.kernel.org>; Mon, 13 Nov 2023 00:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699862953; x=1700467753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZoiKeK25c+eUBM5+IcX3nIvRllqin03QRw6rKMwSeI=;
        b=HT9S/jFtfBICCDUuwqg3igBCTDY12VJMgbFVv31E54kzTJCJA24qB8sEVWdViVd0Iw
         oJdIpN3g34otI/ZELCUdKVgI7OKYeBMZMc9IYWR+1XVuAySV4YhUFCWw/uZHJ0Y4gu03
         l3cKD2UyBJmpcBXBx+tojBllS5xXlPuovSp0MOAiFV+zJW/gw4DQRcncyhpQMJYzHovs
         nteST+XAVzXbNvInh/RkEEryJAf1O8Ec4ui6Nj5nXfOW9NT7DK3D7Pns+sTmDydK4fuh
         G/6p8nNVcGDR/VjNNuAI9B+RzaPBXnTX7qvqIP2oWHs7tuJZyBH7DfA3kVIwcgtkUPD2
         GfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699862953; x=1700467753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZoiKeK25c+eUBM5+IcX3nIvRllqin03QRw6rKMwSeI=;
        b=VaXpAoMXRRPvMqJC92I/M1H8XYWiFCcYAxjZviNNPy4mi5Wy/JA8K0FiOIKIXVX2XN
         ujtGOljA+wJLS5RmSBvPt/BkZhSOb+Alm8dPz4SHnm6W9aiSVtoxvlpRPiRCCTBnlKg8
         iVrcLgukTgCsbeb4CcZHRafeGmAUiatxyfbqx/ge3wJ374fqXOYXy9iwM91Zq/ZpuYWN
         1/K8jAa12v9KL3Wh7x/gNwOSrTlO1OxiLEuiXHrksisAUt+WDNuDpFMDUdpJkKvtYeot
         eLIgIbjVwf1uR61annLDlQT5BxBRHndYLrnha7coXf+gBF2AlSspe8mo74klvz8lCQvo
         dT/g==
X-Gm-Message-State: AOJu0YzcgbfBPJNYAO1pnFN2DtuYGQieVDMQsKXjyqjzwnbGnPDKr7o3
        Eb/qo2sJ2xSltXm7IH0P8YBAAr0eVOh8rGOoesXqmw==
X-Google-Smtp-Source: AGHT+IFzRJ5jkVI6/mAvKVYmcFvOau5ZJS31ms3DOXuF4B7wj28TwQl+V6wt0JtbBzn8SakFOoOq6C4IAp58Rg6NfHQ=
X-Received: by 2002:a05:6402:51a:b0:545:94c:862e with SMTP id
 m26-20020a056402051a00b00545094c862emr115385edv.2.1699862953009; Mon, 13 Nov
 2023 00:09:13 -0800 (PST)
MIME-Version: 1.0
References: <20231113031705.803615-1-willemdebruijn.kernel@gmail.com>
In-Reply-To: <20231113031705.803615-1-willemdebruijn.kernel@gmail.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Mon, 13 Nov 2023 09:09:00 +0100
Message-ID: <CANn89iLeuGukAFOYk-mMaow1j4EPeO-VEA0wWVFA=byabJ91yw@mail.gmail.com>
Subject: Re: [PATCH net] ppp: limit MRU to 64K
To:     Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc:     netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
        pabeni@redhat.com, linux-ppp@vger.kernel.org,
        stable@vger.kernel.org, mitch@sfgoth.com, mostrows@earthlink.net,
        jchapman@katalix.com, Willem de Bruijn <willemb@google.com>,
        syzbot+6177e1f90d92583bcc58@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Mon, Nov 13, 2023 at 4:17=E2=80=AFAM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> From: Willem de Bruijn <willemb@google.com>
>
> ppp_sync_ioctl allows setting device MRU, but does not sanity check
> this input.
>
> Limit to a sane upper bound of 64KB.
>
> No implementation I could find generates larger than 64KB frames.
> RFC 2823 mentions an upper bound of PPP over SDL of 64KB based on the
> 16-bit length field. Other protocols will be smaller, such as PPPoE
> (9KB jumbo frame) and PPPoA (18190 maximum CPCS-SDU size, RFC 2364).
> PPTP and L2TP encapsulate in IP.
>
> Syzbot managed to trigger alloc warning in __alloc_pages:
>
>         if (WARN_ON_ONCE_GFP(order > MAX_ORDER, gfp))
>
>     WARNING: CPU: 1 PID: 37 at mm/page_alloc.c:4544 __alloc_pages+0x3ab/0=
x4a0 mm/page_alloc.c:4544
>
>     __alloc_skb+0x12b/0x330 net/core/skbuff.c:651
>     __netdev_alloc_skb+0x72/0x3f0 net/core/skbuff.c:715
>     netdev_alloc_skb include/linux/skbuff.h:3225 [inline]
>     dev_alloc_skb include/linux/skbuff.h:3238 [inline]
>     ppp_sync_input drivers/net/ppp/ppp_synctty.c:669 [inline]
>     ppp_sync_receive+0xff/0x680 drivers/net/ppp/ppp_synctty.c:334
>     tty_ldisc_receive_buf+0x14c/0x180 drivers/tty/tty_buffer.c:390
>     tty_port_default_receive_buf+0x70/0xb0 drivers/tty/tty_port.c:37
>     receive_buf drivers/tty/tty_buffer.c:444 [inline]
>     flush_to_ldisc+0x261/0x780 drivers/tty/tty_buffer.c:494
>     process_one_work+0x884/0x15c0 kernel/workqueue.c:2630
>
> With call
>
>     ioctl$PPPIOCSMRU1(r1, 0x40047452, &(0x7f0000000100)=3D0x5e6417a8)
>
> Similar code exists in other drivers that implement ppp_channel_ops
> ioctl PPPIOCSMRU. Those might also be in scope. Notably excluded from
> this are pppol2tp_ioctl and pppoe_ioctl.
>
> This code goes back to the start of git history.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+6177e1f90d92583bcc58@syzkaller.appspotmail.com
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> ---
>  drivers/net/ppp/ppp_synctty.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.=
c
> index ea261a628786..52d05ce4a281 100644
> --- a/drivers/net/ppp/ppp_synctty.c
> +++ b/drivers/net/ppp/ppp_synctty.c
> @@ -453,6 +453,10 @@ ppp_sync_ioctl(struct ppp_channel *chan, unsigned in=
t cmd, unsigned long arg)
>         case PPPIOCSMRU:
>                 if (get_user(val, (int __user *) argp))
>                         break;
> +               if (val > U16_MAX) {
> +                       err =3D -EINVAL;
> +                       break;
> +               }
>                 if (val < PPP_MRU)
>                         val =3D PPP_MRU;
>                 ap->mru =3D val;
> --
> 2.43.0.rc0.421.g78406f8d94-goog
>

Reviewed-by: Eric Dumazet <edumazet@google.com>

It is unclear why ppp_sync_input() does not allocate an skb based on
@count argument though...

diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
index ebcdffdf4f0e0193635d2b479e8a9f7a32703509..79cb7916ff03c9b311109372e3d=
3e434e3669fa6
100644
--- a/drivers/net/ppp/ppp_synctty.c
+++ b/drivers/net/ppp/ppp_synctty.c
@@ -659,14 +659,14 @@ ppp_sync_input(struct syncppp *ap, const u8
*buf, const u8 *flags, int count)
        struct sk_buff *skb;
        unsigned char *p;

-       if (count =3D=3D 0)
+       if (count <=3D 0)
                return;

        if (ap->flags & SC_LOG_INPKT)
                ppp_print_buffer ("receive buffer", buf, count);

        /* stuff the chars in the skb */
-       skb =3D dev_alloc_skb(ap->mru + PPP_HDRLEN + 2);
+       skb =3D dev_alloc_skb(count + PPP_HDRLEN + 2);
        if (!skb) {
                printk(KERN_ERR "PPPsync: no memory (input pkt)\n");
                goto err;
