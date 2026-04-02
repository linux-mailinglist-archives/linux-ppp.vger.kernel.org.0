Return-Path: <linux-ppp+bounces-478-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAyBKI0HzmnpkQYAu9opvQ
	(envelope-from <linux-ppp+bounces-478-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 08:07:09 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB6138447D
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 08:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA0E93038FC9
	for <lists+linux-ppp@lfdr.de>; Thu,  2 Apr 2026 06:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B052FE582;
	Thu,  2 Apr 2026 06:05:19 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from ida.uls.co.za (ida.uls.co.za [154.73.32.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20839223DFF;
	Thu,  2 Apr 2026 06:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.73.32.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775109919; cv=none; b=hqwXzl6M10F6YfcEGZUUK1hxp0m9o+OcMNhDFBkopyPlwoY7hf5orimUygrFU8Gly71R/KrywU/LasLPG+2g4tL7zx9e0mDCeUcnaCkI6qFdgLPSxS9a2XzSkbxg0zbpjfqYxJ0cxEmnPRFXTKYsjyXXXiL/m2ram7RnEusVbrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775109919; c=relaxed/simple;
	bh=+0eVG98Q/TKbg2kNG5RS0o6C82yZ+qtNhm3xpi6/+2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9EXMoXEua57SzxB0yn4/swQy/eAOXmDf6Z8A2ayeR2WCvA0JIM1xJ4+kI7+NAhlsW5sqkGBSJXBnSVjaaNXlXs1BRkOtwWcOEcdb1z27Gz9rU1ClhMq7JBwkciACB3sjJRUFkSyf3n/0sUfBZmkg0OP+qVDeIpfzJlEsVRKGlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uls.co.za; spf=pass smtp.mailfrom=uls.co.za; arc=none smtp.client-ip=154.73.32.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uls.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uls.co.za
Received: from [165.16.202.144] (helo=[192.168.1.162])
	by ida.uls.co.za with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <jaco@uls.co.za>)
	id 1w8BAh-000000002RW-1QDl;
	Thu, 02 Apr 2026 08:04:51 +0200
Message-ID: <08ad59aa-02e5-4d96-91a8-503ba322a77e@uls.co.za>
Date: Thu, 2 Apr 2026 08:04:47 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] ppp: update Kconfig help message
To: Qingfang Deng <qingfang.deng@linux.dev>, linux-ppp@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Julian Braha <julianbraha@gmail.com>, Eric Biggers <ebiggers@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>, Dianne Skoll <dianne@skoll.ca>,
 James Carlson <carlsonj@workingcode.com>
References: <20260402050053.144250-1-qingfang.deng@linux.dev>
Content-Language: en-GB
From: Jaco Kroon <jaco@uls.co.za>
Autocrypt: addr=jaco@uls.co.za; keydata=
 xsBNBFXtplYBCADM6RTLCOSPiclevkn/gdf8h9l+kKA6N+WGIIFuUtoc9Gaf8QhXWW/fvUq2
 a3eo4ULVFT1jJ56Vfm4MssGA97NZtlOe3cg8QJMZZhsoN5wetG9SrJvT9Rlltwo5nFmXY3ZY
 gXsdwkpDr9Y5TqBizx7DGxMd/mrOfXeql57FWFeOc2GuJBnHPZQMJsQ66l2obPn36hWEtHYN
 gcUSPH3OOusSEGZg/oX/8WSDQ/b8xz1JKTEgcnu/JR0FxzjY19zSHmbnyVU+/gF3oeJFcEUk
 HvZu776LRVdcZ0lb1bHQB2K9rTZBVeZLitgAefPVH2uERVSO8EZO1I5M7afV0Kd/Vyn9ABEB
 AAHNG0phY28gS3Jvb24gPGphY29AdWxzLmNvLnphPsLAdwQTAQgAIQUCVe2mVgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAILcSxr/fungCPB/sHrfufpRbrVTtHUjpbY4bTQLQE
 bVrh4/yMiKprALRYy0nsMivl16Q/3rNWXJuQ0gR/faC3yNlDgtEoXx8noXOhva9GGHPGTaPT
 hhpcp/1E4C9Ghcaxw3MRapVnSKnSYL+zOOpkGwye2+fbqwCkCYCM7Vu6ws3+pMzJNFK/UOgW
 Tj8O5eBa3DiU4U26/jUHEIg74U+ypYPcj5qXG0xNXmmoDpZweW41Cfo6FMmgjQBTEGzo9e5R
 kjc7MH3+IyJvP4bzE5Paq0q0b5zZ8DUJFtT7pVb3FQTz1v3CutLlF1elFZzd9sZrg+mLA5PM
 o8PG9FLw9ZtTE314vgMWJ+TTYX0kzsBNBFXtplYBCADedX9HSSJozh4YIBT+PuLWCTJRLTLu
 jXU7HobdK1EljPAi1ahCUXJR+NHvpJLSq/N5rtL12ejJJ4EMMp2UUK0IHz4kx26FeAJuOQMe
 GEzoEkiiR15ufkApBCRssIj5B8OA/351Y9PFore5KJzQf1psrCnMSZoJ89KLfU7C5S+ooX9e
 re2aWgu5jqKgKDLa07/UVHyxDTtQKRZSFibFCHbMELYKDr3tUdUfCDqVjipCzHmLZ+xMisfn
 yX9aTVI3FUIs8UiqM5xlxqfuCnDrKBJjQs3uvmd6cyhPRmnsjase48RoO84Ckjbp/HVu0+1+
 6vgiPjbe4xk7Ehkw1mfSxb79ABEBAAHCwF8EGAEIAAkFAlXtplYCGwwACgkQCC3Esa/37p7u
 XwgAjpFzUj+GMmo8ZeYwHH6YfNZQV+hfesr7tqlZn5DhQXJgT2NF6qh5Vn8TcFPR4JZiVIkF
 o0je7c8FJe34Aqex/H9R8LxvhENX/YOtq5+PqZj59y9G9+0FFZ1CyguTDC845zuJnnR5A0lw
 FARZaL8T7e6UGphtiT0NdR7EXnJ/alvtsnsNudtvFnKtigYvtw2wthW6CLvwrFjsuiXPjVUX
 825zQUnBHnrED6vG67UG4z5cQ4uY/LcSNsqBsoj6/wsT0pnqdibhCWmgFimOsSRgaF7qsVtg
 TWyQDTjH643+qYbJJdH91LASRLrenRCgpCXgzNWAMX6PJlqLrNX1Ye4CQw==
Organization: Ultimate Linux Solutions (Pty) Ltd
In-Reply-To: <20260402050053.144250-1-qingfang.deng@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-report: Relay access (ida.uls.co.za).
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[uls.co.za : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-478-lists,linux-ppp=lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jaco@uls.co.za,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.324];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samba.org:url,linux.dev:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,uls.co.za:email,uls.co.za:mid,skoll.ca:url,roaringpenguin.com:url]
X-Rspamd-Queue-Id: CDB6138447D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 2026/04/02 07:00, Qingfang Deng wrote:
> Both links of the PPPoE section are no longer valid, and the CVS version
> is no longer relevant.
>
> - Replace the TLDP URL with the pppd project homepage.
> - Update pppd version requirement for PPPoE.
> - Update RP-PPPoE project homepage, and clarify that it's only needed
>    for server mode.
>
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
FWIW:  Acked-by: Jaco Kroon <jaco@uls.co.za>

Looks good to me.

> ---
> v2:
>   - replace TLDP URL with pppd homepage
>   - update pppd version requirement
>   - document that rp-pppoe is only required for server
>   https://lore.kernel.org/netdev/20260331033303.5664-1-dqfext@gmail.com/
>
>   drivers/net/ppp/Kconfig | 16 +++++++---------
>   1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/ppp/Kconfig b/drivers/net/ppp/Kconfig
> index f57fba84fe55..753354b4e36c 100644
> --- a/drivers/net/ppp/Kconfig
> +++ b/drivers/net/ppp/Kconfig
> @@ -13,10 +13,9 @@ config PPP
>   	  otherwise you can't use it; most Internet access providers these
>   	  days support PPP rather than SLIP.
>   
> -	  To use PPP, you need an additional program called pppd as described
> -	  in the PPP-HOWTO, available at
> -	  <http://www.tldp.org/docs.html#howto>.  Make sure that you have
> -	  the version of pppd recommended in <file:Documentation/Changes>.
> +	  To use PPP, you need an additional program called pppd, available at
> +	  <https://ppp.samba.org>.  Make sure that you have the version of pppd
> +	  recommended in <file:Documentation/Changes>.
>   	  The PPP option enlarges your kernel by about 16 KB.
>   
>   	  There are actually two versions of PPP: the traditional PPP for
> @@ -116,11 +115,10 @@ config PPPOE
>   	help
>   	  Support for PPP over Ethernet.
>   
> -	  This driver requires the latest version of pppd from the CVS
> -	  repository at cvs.samba.org.  Alternatively, see the
> -	  RoaringPenguin package (<http://www.roaringpenguin.com/pppoe>)
> -	  which contains instruction on how to use this driver (under
> -	  the heading "Kernel mode PPPoE").
> +	  To work in client mode, pppd version 2.4.2 or later is required.
> +	  To work in server mode, the pppoe-server command from the RP-PPPoE
> +	  package is also required, available at
> +	  <https://dianne.skoll.ca/projects/rp-pppoe/>.
>   
>   choice
>   	prompt "Number of PPPoE hash bits"

