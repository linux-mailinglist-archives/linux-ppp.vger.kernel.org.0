Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48F213D530
	for <lists+linux-ppp@lfdr.de>; Tue, 11 Jun 2019 20:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406968AbfFKSJA (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 11 Jun 2019 14:09:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:52804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406685AbfFKSJA (ORCPT <rfc822;linux-ppp@vger.kernel.org>);
        Tue, 11 Jun 2019 14:09:00 -0400
Received: from gmail.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8C512206E0;
        Tue, 11 Jun 2019 18:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560276539;
        bh=q/41VlzEConGkNSz8iGGkLIv+MXKhKdZsbWwwxboWtY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oKKxw8TeMRmGSVO/TcFauL5ayTnX70KK765iMDWSWCqeTg0Royf0Wr5XMXUhBFT6h
         6XX3GXwtEIBWqLJHy4Rhb9NYiEZlRSkmE/upjJvH+O87/u97SAXrfndi1HAWiE0Tln
         aqgB8DDKleZN3PSYxCTO6T6s3ATh7n8Vnf8gZfxg=
Date:   Tue, 11 Jun 2019 11:08:58 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-ppp@vger.kernel.org, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v3 6/7] ppp: mppe: switch to RC4 library interface
Message-ID: <20190611180857.GD66728@gmail.com>
References: <20190611134750.2974-1-ard.biesheuvel@linaro.org>
 <20190611134750.2974-7-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611134750.2974-7-ard.biesheuvel@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Tue, Jun 11, 2019 at 03:47:49PM +0200, Ard Biesheuvel wrote:
> @@ -728,8 +660,7 @@ static struct compressor ppp_mppe = {
>  static int __init ppp_mppe_init(void)
>  {
>  	int answer;
> -	if (!(crypto_has_skcipher("ecb(arc4)", 0, CRYPTO_ALG_ASYNC) &&
> -	      crypto_has_ahash("sha1", 0, CRYPTO_ALG_ASYNC)))
> +	if (!crypto_has_ahash("sha1", 0, CRYPTO_ALG_ASYNC))
>  		return -ENODEV;

Doesn't fips_enabled need to be checked here too?

- Eric
