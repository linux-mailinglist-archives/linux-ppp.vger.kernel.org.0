Return-Path: <linux-ppp+bounces-336-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB1DB2235D
	for <lists+linux-ppp@lfdr.de>; Tue, 12 Aug 2025 11:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1724500181
	for <lists+linux-ppp@lfdr.de>; Tue, 12 Aug 2025 09:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256852E92C6;
	Tue, 12 Aug 2025 09:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YS+XDPyH"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97072E88B7;
	Tue, 12 Aug 2025 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754991509; cv=none; b=K4iFlCB6Z9Q3ToG5afw0WltxNQyXTeLusxcdaW9/Qrv9D7pNCpIMar05mkB7n0NPdir2k0kSzk0yXeog+akw7iX32ICn4nGUSgWg6peUGCPOc9GTxkXoWDtuB4PH+lKoDa47x/pjhwjjkzSosl2xph1s8tOxPWY/btJp8UXlEhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754991509; c=relaxed/simple;
	bh=koaFm8FvB39ZLSjO9y8mETs6PzsiMdWay6NKARPb85s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KOHpuNxh/r5/nD6dTt5FyAlsHT9IhYbPjApHRKsUOdsj5FhfguuCmKlylmrOnW9KiwYabP0XilmNuc2EQBCja5zuXQBWQ5OmibFz1LEsirwTrEz1vy+yC3qmKOlupgU4Q4st40s63sn2UA9Q93G/cTQJr1qOfG3Ifrbr67puc5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YS+XDPyH; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71c42f1b4e7so7933647b3.1;
        Tue, 12 Aug 2025 02:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754991506; x=1755596306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koaFm8FvB39ZLSjO9y8mETs6PzsiMdWay6NKARPb85s=;
        b=YS+XDPyHE67IS0RuVQNIcv7KefVFK9SP0ADghW3sIMvdjS2N4jLovmTeU/JAiV2ouS
         Z0aVSo6rC/iY0d70F5taJtOlwB9cOerZU52Y3t9ncEQuovwpt0+D+GPCTs3J3vrRywVy
         0oVyqS3/A5x9wTcNDS/2tOJWb2UF0XSjnAAzAnzunXt1kOla/iU7RUeyOZF8IMM/UJuO
         fwpFneOdSFzd8ZM/3YEUTX0n9ptaLOTwpeyUbgj4MwG1chpYHPb4nRUgQo3beKimc03n
         69083UA+jEvsdQRYsD9t849HUjuWTqFl37XYBNq86MkTSS9T8u597pBfojGQcszu285T
         dfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754991506; x=1755596306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koaFm8FvB39ZLSjO9y8mETs6PzsiMdWay6NKARPb85s=;
        b=ssiGLBcFMomb7B8TtxdyY8lyUB8ubYOf20RroPN0UMh4sMg4zd2GV433gnX9EBpc6i
         KM1wVluuGwQA+6wVv4c/6ZysWJOQuTpqGeZXsI6fYXM1eFg0Bva9vVmKnfLiHyNu3E7Q
         CTCr2aOpAQc7G/A4Fb92gbYOFnGG7jXJMvvya9r9HbezbuFiYvzO/PzyBBOiYiL+Wv5t
         dikJRV/iBXOxd/ooyazai37oRnhxu++f3CVRJx/v8o2QyxUEAgaT5DgOnvzmZVyLgGO6
         18MD6h4WPflKCJLytfAFBjaqPvXGu6gVN9MeTUVSeBdvchhZK3Ixq+3DhgT+PPzK27Aw
         UQtA==
X-Forwarded-Encrypted: i=1; AJvYcCVodLSfrPTlhssI1QBGy5rTvZ4BHRTGFGRT/1QOOPe65Q3LEUaVh1vLqSzgu83aP5V0QfZRF2cIu9XK9sg=@vger.kernel.org, AJvYcCWMPlEs8JAPaZYBY4K9y4MzfzCZyWcnZ+aNQpLqGe50IeoV/DX83RV0G6XAYhqtkgJ8qYxn0fUIFpZ1@vger.kernel.org, AJvYcCXCCQ+hNx0LnsJECp68di8WS8+sIcqF+K3Pvb/cGHi6GUxCrkQObNcoPpJdcxCvwT+ycRpP0dK9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw99se8hKfHsRERjvllI2nyWlsckGABxRWYyMPinoLuprsuQs+l
	ovBujGRddkpQvcyLW0R6DcY2aL7bqfq85js4V8J3DUCFwUX3McB+zjIWUNjlX5AfCkzc1n92kpF
	JiRDFVyP3NWtl207mAH+pZMr9vsujmDE=
X-Gm-Gg: ASbGncv8d3sgoqGertMnLrojC5tQQ7TgJrTB2IRXGzvHqYDJ3iOgwJqNwYuofHdqPvS
	SNCdf7F8aWKmbgStxg2XY4r4AuRVeXRgxgcN7SySxdpX1+TRs1BfcKzpNIDGPkIIaZp1SwPvaBO
	Fch1l6TCSRIqpylPWM9xwP1H26oQWEr9Gr0U7E+jUypqYUpRlUeeVhWlEnhSOfAr4gn6qs+iH21
	BDNAOfR3FelI9QfrtTFVqscp47AXIyXpco=
X-Google-Smtp-Source: AGHT+IFr7lgvZZY1y9lc5TCDH28j16QxyQ1XjQ4nf1DDvgSq+pDk5VobcnsC+NpttWTdlPZ4ZOAiPz3KKhhYzaqQfyo=
X-Received: by 2002:a05:690c:700b:b0:71c:1673:7bcf with SMTP id
 00721157ae682-71c42a7ba20mr34696007b3.33.1754991506451; Tue, 12 Aug 2025
 02:38:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811084427.178739-1-dqfext@gmail.com> <CANn89iLEMss3VGiJCo=XGVFBSA12bz0y01vVdmBN7WysBLtoUA@mail.gmail.com>
 <CALW65jZ-uBWOkxPVMQc3Yg-KEoVRdPQYVC3+q5MiQbvpDZBKTQ@mail.gmail.com>
In-Reply-To: <CALW65jZ-uBWOkxPVMQc3Yg-KEoVRdPQYVC3+q5MiQbvpDZBKTQ@mail.gmail.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Tue, 12 Aug 2025 17:38:02 +0800
X-Gm-Features: Ac12FXw0Y-iPDS0UmW3suIhNsvD18mqQHDwpTsV75hK8tZWdg2KKvy21TEpnv3I
Message-ID: <CALW65jYNMNArwzmpHhYj3fpfL0Oz2fRYsJz0JMDUnyByu-8z3w@mail.gmail.com>
Subject: Re: [PATCH net] ppp: fix race conditions in ppp_fill_forward_path
To: Eric Dumazet <edumazet@google.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Pablo Neira Ayuso <pablo@netfilter.org>, Felix Fietkau <nbd@nbd.name>, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 5:35=E2=80=AFPM Qingfang Deng <dqfext@gmail.com> wr=
ote:
>
> On Mon, Aug 11, 2025 at 5:19=E2=80=AFPM Eric Dumazet <edumazet@google.com=
> wrote:
> >
> > On Mon, Aug 11, 2025 at 1:44=E2=80=AFAM Qingfang Deng <dqfext@gmail.com=
> wrote:
> > It is unclear if rcu_read_lock() is held at this point.
> >
> > list_first_or_null_rcu() does not have a builtin __list_check_rcu()
>
> ndo_fill_forward_path() is called by nf_tables chains, which is inside
> an RCU critical section.

Update: mtk_flow_get_wdma_info() in mtk_ppe_offload.c calls
dev_fill_forward_path() in process context without RCU, so
ppp_fill_forward_path() can be called from two different contexts.
Should I add rcu_read_lock() to mtk_flow_get_wdma_info() or
ppp_fill_forward_path()?

