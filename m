Return-Path: <linux-ppp+bounces-467-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP8/Kd6Cy2l4IgYAu9opvQ
	(envelope-from <linux-ppp+bounces-467-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 31 Mar 2026 10:16:30 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE51365F53
	for <lists+linux-ppp@lfdr.de>; Tue, 31 Mar 2026 10:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA6FE3019174
	for <lists+linux-ppp@lfdr.de>; Tue, 31 Mar 2026 08:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C9339D6F9;
	Tue, 31 Mar 2026 08:09:09 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from ida.uls.co.za (ida.uls.co.za [154.73.32.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7621E2D3ED1;
	Tue, 31 Mar 2026 08:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.73.32.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944549; cv=none; b=M/Gcwle+cQA4Wx0qjYKavl8DaJ+Xf2F92lpal8NujlsF2ldlDbC5CWgRwAjRVWe2XponiFOXNK1cbjYyGbmaUOaqsI+pZvAtjLbCwBqpVCIMLisUua5dAcjMC2KtUNOQQ0cnbFCrWi/XpmI9A9u6b6RZ9QpqMNnfg61D+Hkt554=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944549; c=relaxed/simple;
	bh=voN4zkkG1QRyEOmKlMzsZ7FxBc/G7IYZvBjrhtdfMgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQhvyEOgCh2U86NNIdQLhMspO9cgoeA1MhW6RXWUUtR2aXVE1l7aua6t6yktbhOdifeg87w+KZpxo4gRgkMr1RAqj4uBTo4j+auW/TqZFOofrt5qIEmMIyD9u6MhLV0Tls1cFKw2Z6mXdLAmuQVRk6Pq9uOdGZjdQCqpSdrI0AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uls.co.za; spf=pass smtp.mailfrom=uls.co.za; arc=none smtp.client-ip=154.73.32.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uls.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uls.co.za
Received: from [165.16.203.0] (helo=[192.168.42.23])
	by ida.uls.co.za with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <jaco@uls.co.za>)
	id 1w7U9Z-000000006XJ-01J2;
	Tue, 31 Mar 2026 10:08:49 +0200
Message-ID: <f37fca7f-710c-4f7a-a7c5-9d8cc129bf21@uls.co.za>
Date: Tue, 31 Mar 2026 10:08:46 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] pppoe: update Kconfig URLs
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-ppp@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Biggers <ebiggers@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
 Dianne Skoll <dianne@skoll.ca>, James Carlson <carlsonj@workingcode.com>
References: <20260331033303.5664-1-dqfext@gmail.com>
 <0aa6aa20-0e2a-48e9-8273-53b2fecd287b@uls.co.za>
 <20260331075438.290119-1-dqfext@gmail.com>
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
In-Reply-To: <20260331075438.290119-1-dqfext@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-report: Relay access (ida.uls.co.za).
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[uls.co.za : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-467-lists,linux-ppp=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jaco@uls.co.za,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.280];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,skoll.ca:url,samba.org:url,roaringpenguin.com:url]
X-Rspamd-Queue-Id: 1EE51365F53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 2026/03/31 09:54, Qingfang Deng wrote:
> Hi,
>
> On Tue, 31 Mar 2026 08:21:40 +0200, Jaco Kroon wrote:
>> On 2026/03/31 05:33, Qingfang Deng wrote:
>>> --- a/drivers/net/ppp/Kconfig
>>> +++ b/drivers/net/ppp/Kconfig
>>> @@ -122,11 +122,10 @@ config PPPOE
>>>    	help
>>>    	  Support for PPP over Ethernet.
>>>    
>>> -	  This driver requires the latest version of pppd from the CVS
>>> -	  repository at cvs.samba.org.  Alternatively, see the
>>> -	  RoaringPenguin package (<http://www.roaringpenguin.com/pppoe>)
>>> -	  which contains instruction on how to use this driver (under
>>> -	  the heading "Kernel mode PPPoE").
>>> +	  This driver requires the latest version of pppd at
>>> +	  <https://ppp.samba.org>.
>>> +	  Alternatively, see the out-of-tree RP-PPPoE plugin at
>>> +	  <https://dianne.skoll.ca/projects/rp-pppoe/>.
>> ppp now exclusively has the plugin code (originally from roaring penguin
>> I believe).  Latest version is no longer relevant, that plugin has been
>> available since at least a few versions back already (at least a decade,
>> probably closer to two).
>>
>> That same code has recently been dropped from rp-pppoe, which now
>> primarily focusses on pppoe-server, and relies on the plugin now part of
>> ppp package itself. rp-pppoe is only required if you're running a
>> pppoe-server, and I don't think rp-pppoe at this stage will function
>> without ppp.
>>
>> Most people will never need rp-pppoe.
> Thanks for the information.
>
> I just checked pppd's changelog: version 2.4.2 or later has the PPPoE
> plugin.
>
> I can update the help message accordingly:
>
> 	  To work in client mode, pppd version 2.4.2 or later is
> 	  required. To work in server mode, the pppoe-server command
> 	  from the RP-PPPoE package is also required, available at
> 	  <https://dianne.skoll.ca/projects/rp-pppoe/>.

I like this.  You have however dropped the ppp.samba.org link, just 
re-add that I reckon.

Signed-off-by: Jaco Kroon <jaco@uls.co.za>

For what my sign-off is worth in this case :).

Kind regards,
Jaco


