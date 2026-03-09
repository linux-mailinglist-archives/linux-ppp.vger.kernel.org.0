Return-Path: <linux-ppp+bounces-408-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G5oNzOlrmkFHQIAu9opvQ
	(envelope-from <linux-ppp+bounces-408-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Mon, 09 Mar 2026 11:47:15 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 85441237553
	for <lists+linux-ppp@lfdr.de>; Mon, 09 Mar 2026 11:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8830E301983B
	for <lists+linux-ppp@lfdr.de>; Mon,  9 Mar 2026 10:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400103939A7;
	Mon,  9 Mar 2026 10:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alSYCNSh"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1176E392C45
	for <linux-ppp@vger.kernel.org>; Mon,  9 Mar 2026 10:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773053233; cv=pass; b=jzeNwyTMqcly+YGGwxuSatxf9LnliL90aphWeYMmm99THLcuPhBkvxBNC0F90z6JYFkeeKJfckZ8ajqdz99vzp6m5fT2ZckT7Mf4TXpFmJK43fOXP6ufvdUfNpc6wBfZ/0Xi3MAto5CyigtXzi/qw0hP1YWgEeOHMHfFzDF5RCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773053233; c=relaxed/simple;
	bh=WaGNRP8zBcq+FN96X1EiSW9HiX0AA+iytSmfZgPgEiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u724M7SqSeypL1NyDRrQi/UoiDjT3DoxAq6/GRWVkJbD30DpbMEgQTOcWhJmDKxh8zYUNbrAm0Qlz424uNdhd/IlP/JhOBOieHy7L4pK2k2lyaOG+EqktliAl/LFwE1xgqJEEfpETKXUVBwe6PdVFUkPc3PadR42ud68Dtdpih8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alSYCNSh; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79827d28feaso113236947b3.3
        for <linux-ppp@vger.kernel.org>; Mon, 09 Mar 2026 03:47:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773053231; cv=none;
        d=google.com; s=arc-20240605;
        b=hwY7UBzkFHhMLjAqGB6M99I70nt8y5aPrv+tr53j/tbu/cXgAUKaMokVgldGRqKPmQ
         P72EwD9vuHWWSl7XmHampQzLjZW1EUeFDJHccHol+ShL566r6hgv/kJgzfYs1vsVhq8L
         /cN26QFpde4TNzTeK++qT94nK28IyEjphtA9qrsFXrQZNSygFKq7PbAfb9ol/GSgIrvz
         rj3UOLGs5kR4VyC0OUvGwmEW529W0kyJjpMPWYCtYJKqPy9b0J/iFdZkhozMzy1j1kqT
         Jbz5uZbXjoe0NxVeEWVT5U60BLdmHq8PCMOvEWTvb0eo+AXeYWaoV3q0Uqsv7xkEPSJK
         BzKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WaGNRP8zBcq+FN96X1EiSW9HiX0AA+iytSmfZgPgEiI=;
        fh=htyqmBzePPmuO6QArZnI1aDsi6RguvGFRwsDCkje5iQ=;
        b=gyv/mnw1V00BQsxKDVzjfLioyaV8fgOG/xjsM6MSc8ZIsLLU71ih91jxhhUYM5Bcor
         kcKPt/mmAl2Lb5tYnll84Z0nU+XuR5+mrMWvjDmm84WsdeiVYMdezNn8QOkQ49HtGyow
         62Mbhxg3uaK3yAkatM5zJYNRb+RSjFDLE7i6fR/df+S2+cAdVa4RorHctJLo7OhcJ7+9
         Rv7giTdaZuku8K0hLGI/9kC0qlHRWWzh1N+kASk5rI8P7y4RF8YPb2iC5nMoNiNUZKb9
         sCeeMAvv8XfqUjvlVASKxq7eETxPvhK+ROnsrIVyuT2Lf/wmtA46AoZECi9iWUubr4PB
         tzag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773053231; x=1773658031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WaGNRP8zBcq+FN96X1EiSW9HiX0AA+iytSmfZgPgEiI=;
        b=alSYCNShrDmE37FWShOjhdt91KxEtlZs0wXmwGLxbNJmXHljBdLwFqr65D/eJn/W8p
         SkMyWzGPC4MvVuNiG6qpfafM7fB6yxFxDpjU8+WqLRDCPh79aiud16E2FMA95ZWNr15n
         KogLHXsirPpAhQiHibxFs6cSb+fmeUtKvJcZ0QeTMeFOLXdEYjbeVwqHUyMLiogtvzxe
         wynDYRdo7Ko4XvhnZZlZEeDSeR1zIK1YgY3AkA/79Z7DXfuqeRnepoTPZmoUdA0R8gZ7
         5c26IiVE8yYO5SGgb70GpPJmXTfKrHhnGFV4+optegmmGEPB3KjH6ZrAUEn117mb5CkX
         Jgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773053231; x=1773658031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WaGNRP8zBcq+FN96X1EiSW9HiX0AA+iytSmfZgPgEiI=;
        b=hMK22HsvwxE9EySQsQVrcSjygKqWFgaAS0jtdu2+db/OzpWtLtZy989Xlr43g8Q+AL
         iAa6awAg7rs7f4fBHt009vbGoR+JTzMeh92s5o2vwYQQN8y6eGBZEBpcCougCHEXOFZK
         3qegXEq2NRj31AOytGpcXhZpXgm2gExL9qMqXwn5qEubVd8F9UtzA6AU1XRsK2zhxRip
         cmXqGbmSlplEO+lUxMTe3KGed9OUN1Qbe6bO8zNnOL5tpYo5uiHNlzXgXMM0NQiwfFsn
         ldjn7p5vSNMEKNlETYITNx6l9ZoaS9Gy/3W8buX5h2+dr6Y2u27PPSP7/oSChT+lq5rj
         H6Dg==
X-Gm-Message-State: AOJu0Yx0+nurF8ekSalQuAWzSrofRaMHZ5Xm8pMxySDtTOl67q3zQsl7
	Yz4VEXF0rwYLac2EPUUz6WH0NG4S14U5Bc5/sq6WvG4tlRWqZg0KSNpp2XCqJnlhcGI1Uxg4SjN
	wvNGVvwmlkpMJaGqTJpdXF2imtvia1K3SuazRHlk7oA==
X-Gm-Gg: ATEYQzxXe4s9rxJ2No9CwlDunRx/HD96PY7cNVew2WWSy5x4Pfhj7hqOsyzSsiffoNq
	Xz5Ck4f0C4EvC7PaavihdWHyrsYudulFCj4guXI14QA2bukHGYoNclmlFlaA2Ug/qUgVMegZKHE
	VqHd+B4uVmK/VA6cShsGVTrbbU3iTW/z/l5CmXxa+r57dCt5PGRPhYBBeRveUITunmtziNG0UiV
	jtccLu3M2nf2n8d72wQnHAWx12xHp2vI9CSfkn6wdzwDoF4iG+GziEDmRSF7KLOXIZtdfoWsoEK
	GbTphSB+uGZa2u1z
X-Received: by 2002:a05:690c:f03:b0:798:740f:6af1 with SMTP id
 00721157ae682-798dd6e9b55mr95462887b3.24.1773053231166; Mon, 09 Mar 2026
 03:47:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305013852.3769-1-dqfext@gmail.com> <20260306170411.49912ae1@kernel.org>
In-Reply-To: <20260306170411.49912ae1@kernel.org>
From: Qingfang Deng <dqfext@gmail.com>
Date: Mon, 9 Mar 2026 18:46:59 +0800
X-Gm-Features: AaiRm52EFkMctGTRXJyZVgZys-IhjRENIU0NTzUX9qDahsc4Ed7hvqKpp3xPVQc
Message-ID: <CALW65jatv71b7G6jpr4g-6j520RjLBDJMH8uta5MPJHmEM1S1g@mail.gmail.com>
Subject: Re: [PATCH net-next v5] net: pppoe: implement GRO/GSO support
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-ppp@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 85441237553
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-408-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.945];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Jakub,

On Sat, Mar 7, 2026 at 9:04=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> Please add some selftests.

I haven't written a kselftest before. What tests should I include?

I think I can add a local ppp server and client over veth, and test
the connection with ping and iperf3.

> --
> pw-bot: cr

Regards,
- Qingfang

