Return-Path: <linux-ppp+bounces-350-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D37B41CE8
	for <lists+linux-ppp@lfdr.de>; Wed,  3 Sep 2025 13:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7BB33AEA20
	for <lists+linux-ppp@lfdr.de>; Wed,  3 Sep 2025 11:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174392E8B9C;
	Wed,  3 Sep 2025 11:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r3+xe0jS"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742F327C872
	for <linux-ppp@vger.kernel.org>; Wed,  3 Sep 2025 11:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756898333; cv=none; b=YatPkGj1U2aADo/sFXz/A3pRHlvc/GNApCh/GgDmJ1IyXHq3TluX0JUVR+CinI8o++o9yvefQD62EdD43oVlT7ayLdQmuQ0zzeat/JhyrY5oCXdYrBwwXMBoNtJvDRHph0SRPaG1ZQ63SidS/Eqm4gqiUkoSSbCPxfAwiIzfQTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756898333; c=relaxed/simple;
	bh=wQiM/5AZS8Rs9dKwc19dQHM6v3kDpVefyLPtNeG0C4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gaZJ6Zo5JUr6p4bdhMAd9Cmd74jYI6ubL9J1LYt4GQgdj1nhkSKDT6DtFjSUVs7fsRBm0Myq+6X5t2Zgvp2zI5rNEIMflXcKUcpPU+zgMjMOmGovTjHcDlsZVXDtAI8D6B0uNwI4jr50Zka3WwEzJobTGKCNws/7wVmvrcHyimw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r3+xe0jS; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b32ce93e30so23547061cf.2
        for <linux-ppp@vger.kernel.org>; Wed, 03 Sep 2025 04:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756898330; x=1757503130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g65usQiEADiywraoPq3aeiL0ohX+1gqW8ybEa5s0ySI=;
        b=r3+xe0jSXqKImdG+ozNYwt2xRHgya4iJQVrTQflJLEFK9lGpOp9Ui5y8S/xNzVi+Ix
         CEuFIVadKR989jjJG0P+Cmw+QPxSH0cM+H9PaeudDEiv3Lel3n8dPbN05gpiKBxJNjja
         8Eoyn3rA/C8hjwht46Osl/u6NARZUyDm0Egh4aDIZf9daV9aVvi6t6ytkz+BtXjcNIqL
         ZhkM1filUybaEPztEkybGcG65QvHRTaxAWIhvbG/5VRFgy4pSDHLnGBEN7OFj1ZDna+I
         y1r+jDBFGIefQ71/YBVk4jaay0/SkWgKvngNn2Fn+fPUZO9ineKbSDWrzBkcGVCWRQs4
         pZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756898330; x=1757503130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g65usQiEADiywraoPq3aeiL0ohX+1gqW8ybEa5s0ySI=;
        b=TH7Mtfcf3VR2CJPpGR2KYvZqdOFEdK7chKtGSfGTo4goE6dcXL6txUsgqZqIDi78bc
         wdATEfXIFxWFwQuIqhMYKlHutwiu5N1nFeM+3hM5Sr2Bf0ZaJrKaz9v9APTjLzn8LDij
         4mKyY10FULFoOZ9oVMAFqabFdpkCmUUJA3HbWHf17yjjTh26qFnIbxaRZm0ZdpM6QS6g
         s9SEthOSiDupJjetLR+RTli+zHDdcXmP9yHv+d07QOj4FJvHkaYKwko/aLpC76OQjGn8
         6YvbXnqFxaT7RoaYnlt1M3ZPDP7gUoANF1+lCSjvHhz4BeqmEtTVCx18Oi5TFPm+YJTp
         T6pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDfBBZI1GvtnqDGRKlEe3ykz0G/Z3jiB++tLMQAWA2VFQMb99wCNTjk9k6tkdGRrK7Nt7Ftk/db5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwISyo2TGtcdoO6iGce1c0np9iNX1k3yaEo21GM+M+0ImtYDShs
	FyNd7VEwL3EsWAPVW7xx2CD+YJ25kk2fnIimdKYRtR2S6pJxS6WdIsWOLzy9liPvi2ed5NOn6sE
	RI3TqLeUbfE8NSttgCct7eDOxSOybAcJyMvlLienG
X-Gm-Gg: ASbGncsPbB2t3vG2nk2h09xONpmK68PY92vYnvI/IPJqVCWwl9xt+E1SiYC2mp+a1DE
	9ddgBamEQSe/T8HecXNFCN6UpdAUxxAEit6Qf6L19p4+Rrknb1oG2MzRWfO+jARKUtLlU+IxmYj
	O3Vxa3hHC5XjCPasw+i+d1Qt7Do609oEFJnZZq8e3RQCse92ujYtxXiAjAfI0nhiuHr6wS9RG7A
	KPNO/laCE07nWt3kPUrggF3
X-Google-Smtp-Source: AGHT+IG7T+o/X0aqJDtHlsUzsDC+Wkotc8u0nlkLWn9pGaI8xqUZoO6jGHO88KFm5axoLJRxpmQLqYaZHmrlg9EeFIk=
X-Received: by 2002:a05:622a:1a8b:b0:4b4:8ec7:2a34 with SMTP id
 d75a77b69052e-4b48ec72b50mr28090041cf.4.1756898329940; Wed, 03 Sep 2025
 04:18:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903100726.269839-1-dqfext@gmail.com>
In-Reply-To: <20250903100726.269839-1-dqfext@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 3 Sep 2025 04:18:38 -0700
X-Gm-Features: Ac12FXwYWjMG9LIOcl_3Pd2ndTXw74bH4r6NAmReUG5ykZjRGoGz9MTaZaZZBGU
Message-ID: <CANn89iLKpJaF0VcWxqCUuouJw8mZ4Fjk_cc89yMmuZWCLx70-w@mail.gmail.com>
Subject: Re: [PATCH net] ppp: fix memory leak in pad_compress_skb
To: Qingfang Deng <dqfext@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Paul Mackerras <paulus@ozlabs.org>, 
	Matt Domsch <Matt_Domsch@dell.com>, Andrew Morton <akpm@osdl.org>, 
	Brice Goglin <Brice.Goglin@ens-lyon.org>, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 3:07=E2=80=AFAM Qingfang Deng <dqfext@gmail.com> wro=
te:
>
> If alloc_skb() fails in pad_compress_skb(), it returns NULL without
> releasing the old skb. The caller does:
>
>     skb =3D pad_compress_skb(ppp, skb);
>     if (!skb)
>         goto drop;
>
> drop:
>     kfree_skb(skb);
>
> When pad_compress_skb() returns NULL, the reference to the old skb is
> lost and kfree_skb(skb) ends up doing nothing, leading to a memory leak.
>
> Align pad_compress_skb() semantics with realloc(): only free the old
> skb if allocation and compression succeed.  At the call site, use the
> new_skb variable so the original skb is not lost when pad_compress_skb()
> fails.
>
> Fixes: b3f9b92a6ec1 ("[PPP]: add PPP MPPE encryption module")
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>

