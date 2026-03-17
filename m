Return-Path: <linux-ppp+bounces-420-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBSIF0bGuGnTjAEAu9opvQ
	(envelope-from <linux-ppp+bounces-420-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 17 Mar 2026 04:11:02 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F39372A30C9
	for <lists+linux-ppp@lfdr.de>; Tue, 17 Mar 2026 04:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6342F300D693
	for <lists+linux-ppp@lfdr.de>; Tue, 17 Mar 2026 03:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD0F2C21C0;
	Tue, 17 Mar 2026 03:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0nXchQH"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3A52C08C4
	for <linux-ppp@vger.kernel.org>; Tue, 17 Mar 2026 03:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773716805; cv=pass; b=OX27psMRDRiKwXMF2X1pXLPSSiYbAvyK8qclqqR+B1ctKt69T/PbUPoli755qjc6C1NecfUersfKjZ2T711Yyp2CjOk8GKA8SzxarcPqoraSC2H4w3yclQYtzK9RBodP2ViNxRDAxfA5nk+5pCA8tEgtMg+PM/ZxI1WGMMsXBo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773716805; c=relaxed/simple;
	bh=KHyuNaMd/zewSaRimahrmp0hwQ4b9EQOYNegrTRKIpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGmMAt4I8N9dXGwhFf1UFZXIGCItplW81FHqIJblz+R1y4YyqmcmwXkHGtCXNftkwhW+AT/H9BV9XSbM/+oqasTwBsrTh+lD5pIgI0lu5WOsVE9oS/E16JRSlKTcXQtTNffpDdDc6/4Blu8UcToulmZNhPIo8G3GnuqYnAqYt/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0nXchQH; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79a50948018so16957577b3.3
        for <linux-ppp@vger.kernel.org>; Mon, 16 Mar 2026 20:06:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773716803; cv=none;
        d=google.com; s=arc-20240605;
        b=icY4b9xBOVec8x5+xCr22H9xCewzHnlX3J4qHOGtsKqyjcsJi7L1Q6FZML1B+LPdcs
         PWJo/a1uXjfYyq8BSwv//5CdChPVpUpYJvXbpFPm48tkqD4C2idFlTTBtp31b5Eiq51M
         XD5svljCnqus20V6h4dZs/cOnGyqbF19OwkJz4ReAV8btrVblwXucHHC1t6xSpKt8Oke
         4NHfc/uRGjzylJT/G4FyRpFHxEmOyaXVaoAHcHqIWpjRC6OVTHHBfqpyifQy7UDX+4Kk
         qkueZtnqmRz06aLEj8ZhuHnmtGZz66ilyVG+WB8VV3WqSZ+7uoYONwMXu2dveP20ZoUA
         h0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KHyuNaMd/zewSaRimahrmp0hwQ4b9EQOYNegrTRKIpU=;
        fh=lTmHTGjiXPwRizOY5WhgNLtUH0BzVelWbWsnk/Ial08=;
        b=HkYBWhbUwF/HoSo4a1hulETyc30DDZeHKvrt1v9oH5OZhx+YMT8HkrTPOtFLwArFMp
         8cGORFung0Q5HFId5Y75M9kiyMlR3le5cWCUMU59wVqnlcI47dvhB4VWFT0iy6hCY/MQ
         OoMZB3syNwqQT74XwSK/nVLIpgILy2RMeA4tt/VIwJvdzFbbMoa0OhEZN4JNL1ThyKB/
         nMhY0V5qOfYVv9j/9iD+6gkdiPhKQmlyc5540oOF7HPzKdgtv1MhlBPL7c6BcLLnY5mb
         qcsklS3/dFemZC6Y8UlohU2dkqABUvHFsPkuDcF/AdPzrio14/AvAn7XHZ1Dsz2BUUTn
         eA9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773716803; x=1774321603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHyuNaMd/zewSaRimahrmp0hwQ4b9EQOYNegrTRKIpU=;
        b=S0nXchQHYdRFr9eAa0GDMMfuJa9FHqzkSymQ2qfwGCtAAn5pzm50x2pQU/BxEPTAOG
         U2jr9T8+fML2Zk/yzs89KUUaOJtXZT9HzxvjmuaWD5QlDwwr21NOL4ZqfDJa38eAWMRM
         J/3xHZwV2WHdo7U564qnCGJIqtXx5c+Nf4AifsSIJOnTMiDO+lz8CaeFw8wUpxHwl+cf
         wWiLrU3Oyai+LlRipRRo/cTheTzfYKQZdZUiapHzLBqwRKsq528gFQQucqC2SK8XZZR0
         hsaJiGXNPh7/CfzCELCgjVn6TlHmY4wqVMEenOqfT/GypoP2R9RYIfKG7vRcR/Z4ko7O
         FjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773716803; x=1774321603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KHyuNaMd/zewSaRimahrmp0hwQ4b9EQOYNegrTRKIpU=;
        b=QjPZKsXFCc74AeLZcN/7duQdZdkWS20Yxz51eFcQrmOiRnLx1n8lBjPQRP+PtXL+VH
         hv2qsHTdbHnTjnQbYQScb2obVrVwfWGrkagCL8zz98QY7msnYFtVwWstPIfPFsuWoZkF
         V/+fpB/dMrrCgnaQhe3gRMxEspA34vPEXywWPjemf7qxDIkFVP/VS1m3P4dbKLXnvNGJ
         jpCG6Q/4x33eKSvd6ZT1CGBbDTlgJ7IjMsnj6MpRRa7gii6ha0Rj/pqRvl05hnTEBFN8
         5ODNBg2xhrIJAyQSOLVnQ4nsHNM3hqqJtHrf+4LDNduKVRVm976JUcGSmq1ulzf3C6wE
         aYBQ==
X-Gm-Message-State: AOJu0Yy4bTU4tzQab6AIuv0CQ58qE1fdc+C/QA3wG6/Gh7gFFCLwgdN7
	O7f/xC01UDkLsJMCagZrbg+kNE0owlQmFk5aCKJj93S7Hbr+DgXF8ue6mH7+Jteo1m1TfLZD1gY
	0UDQ8E4dVVSCR+6c/wm2w/EB9oVy7rvo=
X-Gm-Gg: ATEYQzzkwLf7HjrMTMHffE6zeODNAMN348xBHlvWKo8gApTYi6yM6fnWmZTnG/jQPOR
	zeC7lusv024GWxNSbRCUojfoxg/MKYif0VU8HmGmp8w64zHglihmkX18fNG4FdjscDu7zMkfSxE
	0ZG92M79zDT0ulWgD0HkxKnJmmJLgzqTDqwSol8Cx/RwVaN3Nh2dPgQPThxjcnhqXrSqBbJaupi
	ogLgNPbx8zfV43HhopWEDfVOVGwP6d+8g1J0p2NEL3Snh57+BFYIqwtuYQ+VCqh2ygREzcZPOft
	baozRFPB1GnFmkxP
X-Received: by 2002:a05:690c:6d10:b0:794:b5aa:9c71 with SMTP id
 00721157ae682-79a1c188226mr145576267b3.34.1773716803385; Mon, 16 Mar 2026
 20:06:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313034732.209792-1-dqfext@gmail.com> <20260316195459.6e4d6d9b@kernel.org>
In-Reply-To: <20260316195459.6e4d6d9b@kernel.org>
From: Qingfang Deng <dqfext@gmail.com>
Date: Tue, 17 Mar 2026 11:06:32 +0800
X-Gm-Features: AaiRm51kcVupIusAK_mL8GpvXC0j6yjDwi907eM0BgIIWSGZspNSviDkhtqURIs
Message-ID: <CALW65jbz+tLH3h5HhHw_623VJf0SMMu9hcLJ9Ssd_k759beQwg@mail.gmail.com>
Subject: Re: [PATCH net] l2tp: ppp: use max L2TP header size for PPP channel hdrlen
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-ppp@vger.kernel.org, James Chapman <jchapman@katalix.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-420-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F39372A30C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 10:55=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
> If the main effect of this patch is that we avoid reallocations I think
> this is an optimization and should go to net-next?

Yes, it is to avoid skb reallocations. I can repost it to net-next.

Regards,
Qingfang

