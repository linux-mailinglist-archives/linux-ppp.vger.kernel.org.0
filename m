Return-Path: <linux-ppp+bounces-452-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDYKDahhxWkJ+AQAu9opvQ
	(envelope-from <linux-ppp+bounces-452-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 17:41:12 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E176338966
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 17:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 487CC312F770
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 16:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D429407107;
	Thu, 26 Mar 2026 16:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jb5+RN/w"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1C14035B6
	for <linux-ppp@vger.kernel.org>; Thu, 26 Mar 2026 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542551; cv=none; b=spOL9IjZ7kGcOEEoz40qItCH7th4KzPOWv5Ev1hb/rXTOj8KfEKWQvWiDKzUTaNvk5a9xC9rKjnlqehWS0iR84zgIDbYdwKlUzqpkPKeDK1nwK4jkY3aNZOvOOnv0MKgfVc4dc8Dg39eqGO8t4dAj1Vjpc/I/VQdYBZe2mD0CZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542551; c=relaxed/simple;
	bh=z6GMWOCYmwQPpclwbRHQ3L8tkjcwK1pnli6GFBfiIKE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=ZiDcTDD9rAIrr2qnlYZDbf2LXgDqUptl6VWIresqMmi8yCGQ6F19nJkiXlkoyzo2heLQtruYql9HJUULNkS2r2mdWohqbxStWhYo2MBrshQQ6nifO9uph/BjV88WUD+i2YQJ/Qspp+p/VY3475aZXCHDc5LxVrs4dnqJodHH0SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jb5+RN/w; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64e9f9226a7so1337564d50.2
        for <linux-ppp@vger.kernel.org>; Thu, 26 Mar 2026 09:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774542549; x=1775147349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDlf2p6914NjJVCVaq2Q/Nq8XSjjhMKVxHPhxp+UG88=;
        b=Jb5+RN/wcmRrbnOKzgXeeDbTGMsRT1cr+jjEF+HdsswaqYWH9wBOTKkHp3MQ/Z/0iG
         KmcOQuVStTRWRh0vCysHuGOHtd7tkfUTHzXpIUJtP8Nc0TGmwrBw5QbsPEjO8FjoEA8N
         W+rcytTfs9K3Atk3eZ+dxwE4dSlAVOga9QOyBv2/nv0uJVivXhzLlHiMmxF/TNdC0xE4
         JjO5xiuz27vdWX9zno1Z6blJ30yXzLfRg9w1k5uY36O0j1wH4gBpXo093g2jlfAL4xyX
         ztXKRS5NRfJs+LJtPPdmiHMX+rRWk5adv0vl7IrYPg8b0XeYNMUcE4ZXivkmf40VCnav
         WsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774542549; x=1775147349;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CDlf2p6914NjJVCVaq2Q/Nq8XSjjhMKVxHPhxp+UG88=;
        b=nrTuWUVg2T/fXtz+cfV1jZVhdGv+JVQECaQpP3cmetH0yL4TUswP+ZzTjfT9dUL0dW
         cAF2xFwB19T9Z8bkaPHa65iAiOPg4dJN8xyh7BN2xro3kX0DKx3dPihCfo/pfIgZ/PTh
         c/n/NyuA0K2n2FHjtW12M+JzmoZ7WijO0zx3Y8RLQgRVFHocm7UPcXSjxplLaHCat4SH
         dDf4oPCZGzfZRTqdnx2ku16fwDavBR7DmhaGjIzqbibw04F1Yy5mk62lN1IToOid6Uwt
         qz3DMqSUiDn1SAE0vEHjpDamSY6iuQRPvKY7ZadbIqksGHFOZYwS8G5g4RF1VFhBGS2P
         EVwQ==
X-Gm-Message-State: AOJu0YxFIXyqQ98gtP0wAfy6exBKjeTlmib54fiAx1hLcQOm6//QxBN4
	cg5f2rA6i+4137JJ7FLQNfETmgMqaD1B2vVplINxmUiV//ulGXglJxgU
X-Gm-Gg: ATEYQzwD6Nb1QCP/K8bjtv9RTqARK+MZE4S4VF2FOzGXpl00xYXx1YN30LJDLg3XWZr
	VTGbo/SwIUtfBgcNci5nB7vEVSmXL7uwD8kYMEubQOYswff/JCBYhZvqy5PMx4MseeaNzC8SE46
	e9hy1rtFL1iUFF5fBOKJCRdkfLJ/cjG5UjvDzRtcSOpjx98OQV8G24xOYp2ZPmY+New21czW+WS
	s3Rnwe0z7vQ3Ra/YaT5ZjdsQeJcju/8lxBBuK8JXPIc8+4/gv25yltngxnmOTsuu1ZU/d2vuCbz
	FgsFnBPSY3rqqcfbk2vtN0OJpAtH8CmQitgoYDRZPNg2XtF1NOUVYGk47z6gOzU25OBnmnJZWNN
	q/IWXmWti4yzkDIIPtGWssklPEMZSu+oeLPMbp5p+hI4YILbUqvL3nybOBTT+KzCqKwJ2DORMmd
	amNdxuxtGmikqI6SIXUTmusHCnXx6hH83ysqlc0g37ty2hySRsKVVklXlPHrsmk2X+6t81KM461
	onUSWo9eli4xkw=
X-Received: by 2002:a53:e105:0:b0:64e:ba77:8412 with SMTP id 956f58d0204a3-64ee6185ff2mr5998843d50.73.1774542548777;
        Thu, 26 Mar 2026 09:29:08 -0700 (PDT)
Received: from gmail.com (180.134.85.34.bc.googleusercontent.com. [34.85.134.180])
        by smtp.gmail.com with UTF8SMTPSA id 956f58d0204a3-64ef58ca09csm1662948d50.5.2026.03.26.09.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 09:29:08 -0700 (PDT)
Date: Thu, 26 Mar 2026 12:29:07 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Simon Horman <horms@kernel.org>, 
 Willem de Bruijn <willemb@google.com>, 
 Petr Machata <petrm@nvidia.com>, 
 Richard Gobert <richardbgobert@gmail.com>, 
 Anubhav Singh <anubhavsinggh@google.com>, 
 Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, 
 netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: linux-ppp@vger.kernel.org
Message-ID: <willemdebruijn.kernel.29bf4e0691478@gmail.com>
In-Reply-To: <20260326081127.61229-2-dqfext@gmail.com>
References: <20260326081127.61229-1-dqfext@gmail.com>
 <20260326081127.61229-2-dqfext@gmail.com>
Subject: Re: [RFC PATCH net-next v6 2/2] selftests: net: test PPPoE packets in
 gro.sh
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-452-lists,linux-ppp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,nvidia.com,nokia-bell-labs.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willemdebruijnkernel@gmail.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9E176338966
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qingfang Deng wrote:
> Add PPPoE test-cases to the GRO selftest.
> 
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
> v6: new patch
> 
> I'm not sure if I should include all the existing IPv4/v6 tests for
> PPPoE. There are tests that hardcode ETH_HLEN as the NH offset, which
> are meant to test the L3 protocol, not the underlying protocol, and
> changing all of them seems too invasive.

Overall this change looks good to me. But indeed all the churn of

    (pppoe ? PPPOE_SES_HLEN : 0)
 
is a bit annoying. Left a few representative snippets below.
I think that could be avoided similar to MAX_HDR_LEN by having a
global definition and using that everywhere. Still a lot of churn, but
at least no repeated open-coded logic.

Also consider whether running all these tests again in PPPoE adds
value, if not, then indeed trim the tests to those that truly add
code coverage. 

> @@ -745,7 +777,7 @@ static void add_ipv4_ts_option(void *buf, void *optpkt)
>  	memcpy(optpkt + tcp_offset + optlen, buf + tcp_offset,
>  	       sizeof(struct tcphdr) + PAYLOAD_LEN);
>  
> -	iph = (struct iphdr *)(optpkt + ETH_HLEN);
> +	iph = (struct iphdr *)(optpkt + ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0));
>  	iph->ihl = 5 + (optlen / 4);
>  	iph->tot_len = htons(ntohs(iph->tot_len) + optlen);
>  	iph->check = 0;
> @@ -755,7 +787,7 @@ static void add_ipv4_ts_option(void *buf, void *optpkt)
>  static void add_ipv6_exthdr(void *buf, void *optpkt, __u8 exthdr_type, char *ext_payload)
>  {
>  	struct ipv6_opt_hdr *exthdr = (struct ipv6_opt_hdr *)(optpkt + tcp_offset);
> -	struct ipv6hdr *iph = (struct ipv6hdr *)(optpkt + ETH_HLEN);
> +	struct ipv6hdr *iph = (struct ipv6hdr *)(optpkt + ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0));
>  	char *exthdr_payload_start = (char *)(exthdr + 1);
>  
>  	exthdr->hdrlen = 0;



