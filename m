Return-Path: <linux-ppp+bounces-68-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC2A929247
	for <lists+linux-ppp@lfdr.de>; Sat,  6 Jul 2024 11:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D09CF282E28
	for <lists+linux-ppp@lfdr.de>; Sat,  6 Jul 2024 09:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442F847773;
	Sat,  6 Jul 2024 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X296gz03"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A18F1804F;
	Sat,  6 Jul 2024 09:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720258550; cv=none; b=kfoY9NgKtcaImULdzG/v8ErCzFyBW69zxAYkd0wqgQOnDBC9xsYL6GhZPeoQ2ulgQ5IjiE1mhDSG9DCoMwx8COsOzPrZRt5heMA4g9AU6uRvIJB9bwYWcrXiswNsB/7xlgmgPnKN9hWAda/AJJL+ab3HHwyMTrS8dlcTHmWyoEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720258550; c=relaxed/simple;
	bh=TsL34T/F7oR/95XQunnwvOsRd932cw4s38BYIYJjNGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DlyVM8hYTUT1nTQNea4055ANPp2ZfHzLMAKFDvr58xQlAyWeVDU8vsVIniB3bFqTSghc1mfgV/eA/Ncaa5/IFZaYu9qszGaFApxm5Lqo1c7dbKQaREzSR9gDg3snNbq8DHzW15omVsbColvDG5+0SyPL+8HWqKyptC4DVBgqnLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X296gz03; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65E4C2BD10;
	Sat,  6 Jul 2024 09:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720258549;
	bh=TsL34T/F7oR/95XQunnwvOsRd932cw4s38BYIYJjNGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X296gz03TsEeGAvE8xVmqzWlOgLfD7ih8VPD04Bhc4q/xIR3v1EzXaaTaztbtPuYw
	 Lc/GvH/O3od5ORV6zoNBV6xk1vAVqJJZVdXaqFKBc05Q0LjnhLx/RAkNbZ2X3MrK35
	 jtFwLabmBl576EG5MSEAV345aVAp5QUMpVf7FmIe2FXxNqJ3eKPPAK/bsoC+nFLb79
	 PzPjexjYXX2zNd7ynkfd7xPHuPH+EDNX4sq7ZOspYEPs98j04/v4ducyh2WsK1fOK7
	 3xYhgCwhVpuzUIsNp3BEy8hLDk007Cb8J/CnKWgbeJj1aOAskH80Psj63NN0OPOyxe
	 GgHSMqunCyzGg==
Date: Sat, 6 Jul 2024 10:35:45 +0100
From: Simon Horman <horms@kernel.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: "David S. Miller" <davem@davemloft.net>, linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org, lvc-project@linuxtesting.org,
	syzbot+ec0723ba9605678b14bf@syzkaller.appspotmail.com,
	"Ricardo B. Marliere" <ricardo@marliere.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH] net: ppp: reject claimed-as-LCP but actually malformed
 packets
Message-ID: <20240706093545.GA1481495@kernel.org>
References: <20240705160808.113296-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705160808.113296-1-dmantipov@yandex.ru>

+ Ricardo, Eric, Jakub, and Paolo
  Please derive CC list from get_maintainers.pl my.patch

On Fri, Jul 05, 2024 at 07:08:08PM +0300, Dmitry Antipov wrote:
> Since 'ppp_async_encode()' assumes valid LCP packets (with code
> from 1 to 7 inclusive), add 'ppp_check_packet()' to ensure that
> LCP packet has an actual body beyond PPP_LCP header bytes, and
> reject claimed-as-LCP but actually malformed data otherwise.
> 
> Reported-by: syzbot+ec0723ba9605678b14bf@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=ec0723ba9605678b14bf

Hi Dmitry,

As a fix, a Fixes tag should go here (no blank line between any tags).
And the patch should be targeted at the net tree:

	Subject: [PATCH net] ...

> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>  drivers/net/ppp/ppp_generic.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index 0a65b6d690fe..2c8dfeb8ca58 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -493,6 +493,18 @@ static ssize_t ppp_read(struct file *file, char __user *buf,
>  	return ret;
>  }
>  
> +static bool ppp_check_packet(struct sk_buff *skb, size_t count)
> +{
> +	if (get_unaligned_be16(skb->data) == PPP_LCP &&
> +	    count < PPP_PROTO_LEN + 4)
> +		/* Claimed as LCP but has no actual LCP body,
> +		 * which is 4 bytes at least (code, identifier,
> +		 * and 2-byte length).
> +		 */
> +		return false;
> +	return true;
> +}

I agree that this fix is correct, that it addresses the issue at hand,
and that ppp_write() is a good place for this check for invalid input.
But I have some minor feedback on the implementation above.

1. It might be nicer to add define, say near where PPP_PROTO_LEN is
   defined, instead of using 4.

   E.g. #define PPP_LCP_HDR_LEN 4

2. I would express the boolean logic without an if condition:
   (Completely untested!)

static bool ppp_check_packet(struct sk_buff *skb, size_t count)
{
	/* LCP packets must include LCP header which 4 bytes long:
	 * 1-byte code, 1-byte identifier, and 2-byte length.
	 */
	return get_unaligned_be16(skb->data) != PPP_LCP ||
		count >= PPP_PROTO_LEN + PPP_LCP_HDR_LEN;
}

> +
>  static ssize_t ppp_write(struct file *file, const char __user *buf,
>  			 size_t count, loff_t *ppos)
>  {
> @@ -515,6 +527,11 @@ static ssize_t ppp_write(struct file *file, const char __user *buf,
>  		kfree_skb(skb);
>  		goto out;
>  	}
> +	ret = -EINVAL;
> +	if (unlikely(!ppp_check_packet(skb, count))) {
> +		kfree_skb(skb);
> +		goto out;
> +	}

FWIIW, I agree the above is in keeping with the existing flow of this function.

>  
>  	switch (pf->kind) {
>  	case INTERFACE:
> -- 
> 2.45.2
> 
> 

