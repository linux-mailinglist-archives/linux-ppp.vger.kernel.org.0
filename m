Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28169AA81B
	for <lists+linux-ppp@lfdr.de>; Thu,  5 Sep 2019 18:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732010AbfIEQQt (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 5 Sep 2019 12:16:49 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46684 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbfIEQQs (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 5 Sep 2019 12:16:48 -0400
Received: by mail-pg1-f193.google.com with SMTP id m3so1658506pgv.13
        for <linux-ppp@vger.kernel.org>; Thu, 05 Sep 2019 09:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zLM+6nR5kv0jA5pGHIzbvsVXa3x+dUW2QtYks/r40f8=;
        b=Rs23x8dw7GNwFF5sAuRVlA7534c9DKs0L/yALEsSWRiX4/5qSOq4NsK/+UkxmIa5la
         Gq/rTRc8kEE1eEFrGxGAuNTTnQ0iawxg53jfe6sYokG7mIkkq3ZYbAE1uMWLCmsnerLw
         +pC8IIsmjQ2c7fy3Y9Qq+TjopTvaljw//fQliuUdnTRWCD+tev7K5ztgokg9Qw5qdoRi
         LKD6d0yFh9jVBb/gWWCma52CyZziSZyX6VcXQ/WVHH7eQt66nfsmI5Zn5Dd849Dwqmyj
         BZjMHQ9xA9yr1+faHo1NgNM8I47zagV/SXGBm4tcYhSdY7w/8Zt/7H2SRUPZH9wE0Ohw
         raZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=zLM+6nR5kv0jA5pGHIzbvsVXa3x+dUW2QtYks/r40f8=;
        b=QNiNjUetPa8gE4wn/CYnaiFAcw+xag5k88oa1eOsdN4hlTqIR2UM8vxFClIHgDEj6h
         j1CUJy2qOlLz2mqA2fFnSAB25QF4OKzamTRGGNP/rqSb8vHnvGYirr75NNDIDO0waPNY
         Fw9hOLMLH+FqIsyFrZGA3BzzVpaiUKvYMztNmvoyvIiBMftBWvXOI6jtD35ScflYei/c
         WT2xdaRpMlTkTt5Wz4aVS6/uEkop3/mX5ORQC72RLGBAsG/Dz+U820JvOPYDv93ieDyB
         SYDOkK1I+d7AjFR7vSp2zGqt/u9Xi+SwzvLfzCrG4oQKAWMo5LKBHY0Uuo57CPCE55aO
         MKyQ==
X-Gm-Message-State: APjAAAULd9uzeu1l08/NTQIfpzJBzVvqWrQrJrHoavSnz98vpCS/mkwr
        wzKfBOd7QhqnjU++4PLNrWo0PQ==
X-Google-Smtp-Source: APXvYqxEBFkp4cs0Pgueg9uCVRPDD958q5uceWoGhxYtP8uOhgc042tzvTTvOAKl/Q+rSGxux5qnbg==
X-Received: by 2002:a63:5648:: with SMTP id g8mr3831728pgm.81.1567700207580;
        Thu, 05 Sep 2019 09:16:47 -0700 (PDT)
Received: from google.com ([2620:15c:201:2:765b:31cb:30c4:166])
        by smtp.gmail.com with ESMTPSA id c125sm4858015pfa.107.2019.09.05.09.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 09:16:46 -0700 (PDT)
Date:   Thu, 5 Sep 2019 09:16:42 -0700
From:   Eric Biggers <ebiggers@google.com>
To:     Baolin Wang <baolin.wang@linaro.org>
Cc:     stable@vger.kernel.org, paulus@samba.org,
        linux-ppp@vger.kernel.org, netdev@vger.kernel.org, arnd@arndb.de,
        orsonzhai@gmail.com, vincent.guittot@linaro.org,
        linux-kernel@vger.kernel.org
Subject: Re: [BACKPORT 4.14.y v2 5/6] ppp: mppe: Revert "ppp: mppe: Add
 softdep to arc4"
Message-ID: <20190905161642.GA5659@google.com>
Mail-Followup-To: Baolin Wang <baolin.wang@linaro.org>,
        stable@vger.kernel.org, paulus@samba.org, linux-ppp@vger.kernel.org,
        netdev@vger.kernel.org, arnd@arndb.de, orsonzhai@gmail.com,
        vincent.guittot@linaro.org, linux-kernel@vger.kernel.org
References: <cover.1567649728.git.baolin.wang@linaro.org>
 <c24710bae9098ba971a2778a1a44627d5fa3ddc0.1567649729.git.baolin.wang@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c24710bae9098ba971a2778a1a44627d5fa3ddc0.1567649729.git.baolin.wang@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Thu, Sep 05, 2019 at 11:10:45AM +0800, Baolin Wang wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> [Upstream commit 25a09ce79639a8775244808c17282c491cff89cf]
> 
> Commit 0e5a610b5ca5 ("ppp: mppe: switch to RC4 library interface"),
> which was merged through the crypto tree for v5.3, changed ppp_mppe.c to
> use the new arc4_crypt() library function rather than access RC4 through
> the dynamic crypto_skcipher API.
> 
> Meanwhile commit aad1dcc4f011 ("ppp: mppe: Add softdep to arc4") was
> merged through the net tree and added a module soft-dependency on "arc4".
> 
> The latter commit no longer makes sense because the code now uses the
> "libarc4" module rather than "arc4", and also due to the direct use of
> arc4_crypt(), no module soft-dependency is required.
> 
> So revert the latter commit.
> 
> Cc: Takashi Iwai <tiwai@suse.de>
> Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: David S. Miller <davem@davemloft.net>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
>  drivers/net/ppp/ppp_mppe.c |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/ppp/ppp_mppe.c b/drivers/net/ppp/ppp_mppe.c
> index d9eda7c..6c7fd98 100644
> --- a/drivers/net/ppp/ppp_mppe.c
> +++ b/drivers/net/ppp/ppp_mppe.c
> @@ -63,7 +63,6 @@
>  MODULE_DESCRIPTION("Point-to-Point Protocol Microsoft Point-to-Point Encryption support");
>  MODULE_LICENSE("Dual BSD/GPL");
>  MODULE_ALIAS("ppp-compress-" __stringify(CI_MPPE));
> -MODULE_SOFTDEP("pre: arc4");

Why is this being backported?  This revert was only needed because of a
different patch that was merged in v5.3, as I explained in the commit message.

- Eric
