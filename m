Return-Path: <linux-ppp+bounces-435-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDoKLVOQvmmjTAMAu9opvQ
	(envelope-from <linux-ppp+bounces-435-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Sat, 21 Mar 2026 13:34:27 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 264102E54C5
	for <lists+linux-ppp@lfdr.de>; Sat, 21 Mar 2026 13:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FE1630156DD
	for <lists+linux-ppp@lfdr.de>; Sat, 21 Mar 2026 12:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4661E317170;
	Sat, 21 Mar 2026 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRDQmd9Y"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F5825CC74
	for <linux-ppp@vger.kernel.org>; Sat, 21 Mar 2026 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774096463; cv=pass; b=nwW3gdXm1gPK5VEShee6CldYppzILz+FR/3xH+n49P27RlmCG+MO58QDK7YPimZGMOlWk201DIY2xjjwAyB7NpTGRkVuyoZTDF9Zcgy8wgD46vE1XdSVrOO+LFKXIkthFs+jaVauIW6Oont5RrIc7VS8czHQ+cz7XAab7FJHO3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774096463; c=relaxed/simple;
	bh=vAOxLc/iYSbulqsSrn9p0RF47QF7jBTSEff5apcZ5J8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XK3Fhjj/ktjm6nlItZR96P4CsvdI+Fv7l6MGNhZjEzmiUr3MauCS78+scdIcveBuF2fT3p6rzVlUf6BReNnc1gInKr2laAnnfNxGvGjt8vbsqpJ195CqDV204oOEjj92atGoKulWYzoqJcetsXi8dIOVf63TzcchMCokqjYLhqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRDQmd9Y; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-794719afcd4so23207987b3.1
        for <linux-ppp@vger.kernel.org>; Sat, 21 Mar 2026 05:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774096460; cv=none;
        d=google.com; s=arc-20240605;
        b=PbHVcQcOClUWEPpodB/f6suWxX6LJ9ib2NNroMuZeurX0/RdplmP2VmKzJpYa0MJ9a
         3u+/wGJ4sZ/r4borSpDzvDwiuWW45cCBBAvZIMoJiPfppi9gcMyd8egTq9s6Omc/qor2
         /BfcRQrDVGM1OUaHDwHj3Tknn7jdWXbM45FaMWt2kFCQ3/Dft4E8amzRRzPLgBY0hqHm
         NvkrFn1PViXVrzMPJzAtnlQK4xALrb/bL3/dqIK7ihwX5KwKLno1gJzlHiQG3o0oG5KL
         jLF47EUbC6KM8FFg3B0BrWVdSQZnXpGMRvWVWqyR2NIn86FARvCV4zxDclHdq4VnzhaP
         ya3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rNCB/fNUc/FK23+8KOYdAudgq7bzv4Aj6mVALRVzF8U=;
        fh=Znl62ZtTivA16ivlPaXRJ7cPFK9spfo/yoDNSYCSoSw=;
        b=VmBxiJVBypv4KHAxJhy2awu4P3gnyIwyaVWm1sekNn3bvrNgeCEzbxfJpgO83R62m0
         HtuLEIZIqzB4nmQ81s78cJIAl+mjxTK3VfplD5vqtQFS3q0iRz6oqoQDiayHQ3OphxGq
         LneYrVT608/LRl8vTgLVlQYUSM8OftYFLGHg1qhKggOntNAa1jhtr+Dxtc4EpkX9g7zU
         hnMks+SH5SjtediImsHhJsSBdwhA9K02mTakgNOpO5u3tghgEAJB5AiL0Q1+PQuODSTl
         S2KauqUmSaYnN1cj0RpQkvHWUj+W3Alb3moPYB5sC6mqb7FLeFKdaSjThYXYxBuwN5t/
         2Xow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774096460; x=1774701260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNCB/fNUc/FK23+8KOYdAudgq7bzv4Aj6mVALRVzF8U=;
        b=bRDQmd9YnCxRcgOmFCMYSRtZpUAiAcjJdog4xBtuXRZn6QoVWo9HjflJwUiBQ3akxZ
         RQRXh1k7Z5OG+PTByTdvIyET/twQSBB5VixOyH67/21boqg/ZV+DPa+9SsjCLguUnseD
         rMltPTg2tSXTUBTANgLmeSFxMbg3wQx13iN/ZlsgUekY5jgPdK++fNtU5w22MVBfjB4X
         y3vyH5bHOIMudoVDzm09apmuU2lK4nAK95BGm+wQqF1sGeJAzFz5kL9sPJUxFU85wKzC
         Z5013IHkzoNG3md2N/BCtMLXAlwPnJafsPfgtmHoQP5cVRYCaWn6Wbh6xUvAymHoMk33
         DzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774096460; x=1774701260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rNCB/fNUc/FK23+8KOYdAudgq7bzv4Aj6mVALRVzF8U=;
        b=DHj/QOvDt71Azj9A98NUrkrYr1OuStQu9GAKwzkBotAxpu1Y8Jh6HTGxouA/Amx5bi
         fpBjL7QyzgSvyzK8bvxwKLVh9GR0xHtgQNdA5Ze4WQ4hdKctATHiDGH303ydzTDGUZHy
         wOJlThrv5Aum+bl4JQTS9uuu/29v8KW+zOKnnQzr39Bf4n1KZ/JwGfnzUVp2qEoCzG+2
         OH9cB3k3pmt/ovqeTeVvk+K+tS7//WYhvbKqeTYku0QIl4D+dlONReXo7QXmXbEShJpV
         tdsUPIqbrMwtgPMQ/8nf6Lt1hfRM2fSxw1gcyO6Uet6Jd0wJLXQrI5Nj8FMhkDVUNSVg
         K0sw==
X-Forwarded-Encrypted: i=1; AJvYcCUPYARbxuiyQOMveJ6c0jN2WjQ9uAFLL0lc816LnRlOSspjHnFjzzUGQF1tXG389UazHM3neMLwtBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQBJn9UfNq9qGU/80KeV3eWYTk/oy4Z3fbUXsMsmorr1OAd7Ra
	R8ae4jPe9gWzhXJJPqsg19yujgfl3WD7ASguG3mOPOmC2sONVfF2g9z5hSdXbfc1lltQ0pxE4Vh
	7yOTgiHOpM1mvaEVi6D/VeZ6nNlSIGUs=
X-Gm-Gg: ATEYQzwZYaYxLSxT3lOsvRjwP6b7A8cZS8yZnx3pznG1FbLUIoLsHjUnJ5Q/GZ3nplm
	uYy7A2XSDf1S6+IV5WEACG9IjN2ypkVXvF0d5pULl8xDi0095rFnYMc6ouzxbZPnrqNDlug0cZk
	jU9p8rdCWt2q5nYzdzVAnfJjnjE2oYVfbMoNxWRbfXQ3/iIelkuWXx0cEqRWm6lS7NsVVho6mSy
	j/s4uoiTub/PBZ7mLp8EFKccd3PUzQwFcMhXpRIqg3a35GSzlD9ABNvBjOSXwy+bK1Fr2FX31ix
	yZEmGYTJikytMb2OkUvsvrZqRuthrM1bK6RLBOPl14WaZ9A=
X-Received: by 2002:a05:690c:e688:b0:79a:8dd1:53bd with SMTP id
 00721157ae682-79a90ac1347mr44295527b3.7.1774096460153; Sat, 21 Mar 2026
 05:34:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320071755.483733-1-dqfext@gmail.com> <20260321085820.GO74886@horms.kernel.org>
In-Reply-To: <20260321085820.GO74886@horms.kernel.org>
From: Qingfang Deng <dqfext@gmail.com>
Date: Sat, 21 Mar 2026 20:34:09 +0800
X-Gm-Features: AaiRm50ubEYsiJ8QdUgGTYRZ9K8nu7fagVUr9fv4mGrb8iGhNnEk2zwf6BQK5rQ
Message-ID: <CALW65jajTpzKPAfc3nNpKeBOLbqqP7LZjaNaq6Eji1G17ZzKkw@mail.gmail.com>
Subject: Re: [PATCH net-next] selftests: net: add tests for PPP
To: Simon Horman <horms@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	Paul Mackerras <paulus@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-435-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ppp_common.sh:url]
X-Rspamd-Queue-Id: 264102E54C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 4:58=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
>
> On Fri, Mar 20, 2026 at 03:17:54PM +0800, Qingfang Deng wrote:
> > Add ping and iperf3 tests for ppp_async.c and pppoe.c.
> >
> > Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> > ---
> >  MAINTAINERS                                   |  1 +
> >  tools/testing/selftests/Makefile              |  1 +
> >  tools/testing/selftests/net/ppp/Makefile      | 15 +++++++
> >  tools/testing/selftests/net/ppp/config        |  8 ++++
> >  tools/testing/selftests/net/ppp/ppp_async.sh  | 37 +++++++++++++++++
> >  tools/testing/selftests/net/ppp/ppp_common.sh | 40 +++++++++++++++++++
>
> Shellcheck flags two issues in ppp_common.sh. As we are aiming
> for new tests to be shellcheck-clean I'd appreciate it if you could
> look into this.

Okay, I'll fix the shellcheck issues and the trailing backslashes in v2.

