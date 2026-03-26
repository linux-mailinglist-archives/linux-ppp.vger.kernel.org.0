Return-Path: <linux-ppp+bounces-451-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCvmKOpHxWkU8wQAu9opvQ
	(envelope-from <linux-ppp+bounces-451-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 15:51:22 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF51337107
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 15:51:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C63D30D01EC
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 14:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07432334C1D;
	Thu, 26 Mar 2026 14:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXaBPP8c"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEFC248F72
	for <linux-ppp@vger.kernel.org>; Thu, 26 Mar 2026 14:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536249; cv=pass; b=LyfZOPNZDIhpunGJKm336DmOFX1KTr5pmqTEWA8cJ3NAI3sUE3H9XgTwk4J1+IDZcuIfrTi+AoRBjblGybkqhRc+7/f5umZ/RrOPxyvgNu0MoxM/ZRY4U8qdfwXe28jIPMueIa/ED1vAWrg7dWf+nOfFV50sPiry22wySMNX8X0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536249; c=relaxed/simple;
	bh=d2b1AenXbF8WtFPruJXyv0RsQxaTrh+JdXuGW9HMB+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QhvGReEyKOPfymiTqRR0P0DzRF/Hh4ZDhc40CTMsfyws1KKbReSGOdIPju2aHfJzqWPGpBrxhrES+D6WHi0a82+aSp53jncUqZSUKvXx421dne28NIlm1rScjta7RLF8b1hrjXTj+89FyLxwEh7jDSUmNPUmPpFQFX+xQqQNUCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXaBPP8c; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82c4b5dfe6cso542399b3a.2
        for <linux-ppp@vger.kernel.org>; Thu, 26 Mar 2026 07:44:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774536248; cv=none;
        d=google.com; s=arc-20240605;
        b=aySX1wjU9Ws82/zpyfAIIesMc3GQBZDyZxmW036w3xdaxUAaffG72yk/dtf7HNMI2t
         CFWlZYjWrJmAmp+Zgy1RQDxScH+IYJQBkFM3qW8yDkRSsFSQDmWLsG5uLHtFHm6o2Ghr
         MFqDz5C4Ubn44hLer8fcE26eOdHDinafiKdyOSbEt+TtISqNAO6NpLEodpVUOqpDkBkI
         bc0XgJf3JdQ4wKfo6naPQbBR7lmlwIXEmq970oBDDB77aWA6OmB0b/mxfhqmknieZgWs
         ROCG2bQJiXu0cR6NARmYNtwDeCzufXBCCseuCNvtn3RX5gNDNxECkAPZrPWnsc6o8OM3
         mACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d2b1AenXbF8WtFPruJXyv0RsQxaTrh+JdXuGW9HMB+c=;
        fh=7HDIjmCz8mfh7e/UhRTDo9382/UbERmdeRP5KUnbLiE=;
        b=TmNKtSsdJgQzmZ6QQPBUM/wSd4IYzqHZKPtsRZb/AjwfUAyRw/DZg8LJLNZbAQXa50
         lWlyPw5kqGDeoUdCBSqdkJzRwF0CPE4umAIxPl0YyyR8qDrrJGalRETDthGcHtHXm+uK
         IHBZVRVAvOhS5AnxUfecWJVP7yC99phQ9S7CPEKzYW3zMdj/w3rPrc3OMjEXx4t07KXm
         x1Uaqi/1r8KJQPOscK6cgMkfhdKgbWbRP9luUGdSPn+eKrysXIKKlNxaf++Prg9XwtjB
         g03Fyp4+zF8oAokT+xlWRZ9snOrNsi8ca6B7gc37BNTzVx/pJT4SZ51XxcVsARVvHxed
         LB6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774536248; x=1775141048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2b1AenXbF8WtFPruJXyv0RsQxaTrh+JdXuGW9HMB+c=;
        b=TXaBPP8c7thizJAJNA79E2T9QrBHA2aINV9d6GcBkQsPnKHXFT+R0db6fH5vA54ZTP
         Mn1ALU89uvbAxuyJw7KomX83UGwUh+rdMjCs61R0/HYIbz6WWofEYGgpIWoJoSFCBEsy
         gVNrJSJSczAy7NIAOMq+KFjyDwZQPFlbBIFje0DNSVM7kKq+ekhnF/9c6m1ElzU8e8on
         WNob8E45z6y+8dWQEqQ41giAyZUEF0w38qsk6BEZIgyeXUVl69Oq0u/2o51vYQrlhBxF
         w8UCQ+GpfI+xZnwm5HFaIXN+v7Wh7RR/aZISYCGWeSQ60ZFZXwTGuZjuSUFapvsHlj8q
         wCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774536248; x=1775141048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d2b1AenXbF8WtFPruJXyv0RsQxaTrh+JdXuGW9HMB+c=;
        b=Mg735kqDJwATMmYTl3xovqMlOQNyT8qLIg81pl2M8CkQYGMxryBOtBvSLUe9FHrnwr
         1+msSkOJAfRwGuZ5NH9BBywGMCyC4vOfr5krR4XR8ehOoo6kLiGmx38N8lm7hQ2SVuD2
         yaYGzAQCeVK7yP4kMuwALABdJhvticWwt+aeSf+tT1QAWh2dSKT29rqg8oFpa2cN79I/
         yihhODOj4q1xOXlplU8gRPPaSuTQdHxE9lECVT+NBXM0Kq7LnC6v/pvJqQAmS3bKtefh
         /iD6aStKkSdxLZjU7GKrxGk8rkOB7V+3EbzAYRdEFLGnO/f+t+PMgims01Y+/ON+rvWV
         1xAA==
X-Forwarded-Encrypted: i=1; AJvYcCV+Zgo4kPA1Gp8TMrMgru+8xHE245wwp7HMVdrbvS23HILzHDOElFcqzjsbD7vXtHdqAgDuzcpscp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGJaL5AYqfyuNvN7MMZrY7ezMdKNp7dGXsZ3086kiuiEYxqya5
	VAEmSEmHfsUDCpMRi9CApor8AhGirvk283cmIDkw/5oe9LMAg5Qkd1+y5sSffgzPzOSsR6NyEzx
	xQSa/D/+7D61qtM/u/5ONK79N66ttUMY=
X-Gm-Gg: ATEYQzyYQlp3T7vHPbtPXTFk1GUU1fcHtbmoYBhnbIhLfhr+j6fpWeqSR8MUlqsXq98
	W26iW55EM/DZaUaJfLunJsVzT00cUlq1QtUf7cvfB2xiJAj7YX0gIk9GRYzXZy2TjcG45RTpncp
	LmwDWt1Zq2ifzDhReMl8JdaFpkVLCNMORcUVAvgWKwSinneCm70DemjPxYKv1InHznS76fyPpTy
	kOyBuILn7J8FF0f1+RL7OxrD/48+H8sxoW+yU7NSbFqR/dDqjp5b1/PVKbheG1YU562JBhwcCq8
	FghRFGvWzdgUkc62HDPatEdHTPbbs0IB+jbcAAdfQ8r+dDW7a5NGWjkXziu1NpducDs49sYh4OG
	PVJgrRMGcDDQB5BME/Uo7hdwW1e9rmCMtPPj66J3F
X-Received: by 2002:a05:6a00:f8e:b0:829:7057:b99e with SMTP id
 d2e1a72fcca58-82c6e14675amr7240862b3a.54.1774536248015; Thu, 26 Mar 2026
 07:44:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305013852.3769-1-dqfext@gmail.com> <CALW65jZRyKydW6bs-mYwh2mEn0dpv3opVEr=WczKn_0952_+Yg@mail.gmail.com>
 <CADvbK_fj_26MLP=+U+rzOMfqdPpdvFQJgN_fozd2uAjRsfHweQ@mail.gmail.com>
In-Reply-To: <CADvbK_fj_26MLP=+U+rzOMfqdPpdvFQJgN_fozd2uAjRsfHweQ@mail.gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 26 Mar 2026 10:43:54 -0400
X-Gm-Features: AQROBzCmY5h-d4E66DSyoIkaUfNQKP2g7Esgvdfp7L2gh6AVWsUfdsoPzpij108
Message-ID: <CADvbK_f3LwEt+-BG-1Pcr4jMn6Jxry+0p-Fu_s0C6Px+F_NHCA@mail.gmail.com>
Subject: Re: [PATCH net-next v5] net: pppoe: implement GRO/GSO support
To: Qingfang Deng <dqfext@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Felix Fietkau <nbd@nbd.name>, linux-ppp@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Richard Gobert <richardbgobert@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-451-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,nbd.name,vger.kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lucienxin@gmail.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1BF51337107
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 10:43=E2=80=AFAM Xin Long <lucien.xin@gmail.com> wr=
ote:
>
> On Wed, Mar 25, 2026 at 10:43=E2=80=AFPM Qingfang Deng <dqfext@gmail.com>=
 wrote:
> >
> > Hi all,
> >
> > In some cases (such as BIG TCP) a GRO skb length can overflow a u16,
> > then what should I do with the u16 length field here?
>
> I think you can either add a check in pppoe_gro_complete() to ensure
sorry, I meant add a check in pppoe_gro_receive().
> the aggregated size does not exceed U16_MAX, avoiding BIG TCP
> behavior; Or, set phdr->length to 0 and rely on skb->len to determine
> the actual length, as done in BIG TCP itself.

