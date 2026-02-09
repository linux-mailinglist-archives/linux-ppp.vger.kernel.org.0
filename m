Return-Path: <linux-ppp+bounces-387-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MACGIfTaiWlFCgAAu9opvQ
	(envelope-from <linux-ppp+bounces-387-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Mon, 09 Feb 2026 14:02:44 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D345210F561
	for <lists+linux-ppp@lfdr.de>; Mon, 09 Feb 2026 14:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DD5E3006B62
	for <lists+linux-ppp@lfdr.de>; Mon,  9 Feb 2026 11:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92477371056;
	Mon,  9 Feb 2026 11:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwnVmbRZ"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DED9371051
	for <linux-ppp@vger.kernel.org>; Mon,  9 Feb 2026 11:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770637279; cv=pass; b=Fqrh4Rm4Hn4qfogkegSiEb5XmsGuCJaotYMrVwoS2IAemPKsKAPFUj/+5nclaFd412H8XXxuWg8CdO61t0vy3CMnLqrbKZtPTcb3b79tGjz1nEiG/+ZhgB2uR1pvrWrk8NpQCPbI2SwmeiWuck+NSjTw2+nKmuUDPTxUmFkS3Wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770637279; c=relaxed/simple;
	bh=AjNuSZh4zcviKXKCnZlS9/KAmPUU2mz+9QTgCjQZ+QI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXaldCUEnEWfClu3ryxAL0b9LiCphUfZWRv56tYBjm+kOJ+JlfV6smP6QKBrNpFoPLs3FI1WU2q1/sZWFQLJrqWTc/q+eAJzorEFavrCFe2cCg2v6m/KGPAJuva+BDneFt/D5dxqMjWMXnWGUL3vAQ2RR4WsmLbF1bry0FBSCYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwnVmbRZ; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-790b7b3e594so46289987b3.3
        for <linux-ppp@vger.kernel.org>; Mon, 09 Feb 2026 03:41:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770637278; cv=none;
        d=google.com; s=arc-20240605;
        b=j8JHiUAmvmelos0R15g7yDQbn1eSsTSU8XjCpJYgsiTz8abLG7HDvjLBDBeXwvEkqo
         l/07czeL00zQGsdzgS6uTz+2qHMFY5B/OxK0rdorABHL3j7y9kxiRlVzkdcLJArLKt4F
         K4F/BSL4nXKJzh2/iABpsHLkkFtG4HE32sTfamA0fCqsM498fNUJrwpwpnVJilzEXUe1
         jgkjY4/mdg//1W7oUPinaPvxgy/R4j5bZqD1Looysyo++YI3Zzk2yVQmJwLNpnzF4htK
         dE2NcVuArPK+w6l0mcJdgLJ4Wj7goZvvbiM0zaVEMEQ5pLYjsO+iRBUalAfLNi1bciE9
         bn9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=agfwRv5BYKvKOnJn+0U2423jmDQfU0HQzH4z0m85B1I=;
        fh=0U+CVNtgp2g4VrdCKSVswM23xmYdk6VbBFlbYyScqAg=;
        b=DvqFZSQOtxwIM9D0wRc1klb4h2ibfmHkOuxcS5EqV7sRGvhUblzj99YSsPFrcYPrdn
         BBiIyZmZxSvVmI/GnWXDXvT1CJ6sUjRBMYW5CAR+YDO91k6A81ZIKzPIT7KrDv+KxoYe
         75iMw2L5i4K+IdOP05/Q4NfjydG2nDQ3ax8nuSm1o2X77xp0o+yhb8TVdV6kwfPMWR11
         mjO+1sgllXhLj0Dho0r/PeamqUln6eosd2EUipBQdCrgVc5keBpWdbntw5pFQMJAvhmm
         /2iqV0YUdp4cbpLa9TZ+nKc4m1UxD1R7jvy1oZZTfOrn4uvg1KH65LERAZmY2R5nvf4Q
         w9sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637278; x=1771242078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agfwRv5BYKvKOnJn+0U2423jmDQfU0HQzH4z0m85B1I=;
        b=fwnVmbRZ/ZkBwwiPCbkH1kUxYxjeTPZpqYsEnXXMR8+zryVP5Ko1TmDeVEfbMBwLWL
         9Nn+ugwnVyTdDwhrsJuYfkdw2DQfzVjU2zxkDl2rI49ueAya2O5ub/P65jo639b++RuI
         gGTdmERCceHMtCh9SqyEDoNU9VVUNavm5yfx3MGaoma0+gnbD2h8nWxRaEgIqpSn7O7v
         wgpk4fhqHKXHDoWh+zjrm4JMDiOCB7O2bBBXqwluTrp0rwotImiKpBI4uv9bCS0q6Cqr
         AODfvKZmB5Zhh2PzHvkFLTE/uzqApe+fbHhVhDwJlKQ6VR6NnjgKPu/I1au48HyfBlrC
         nijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637278; x=1771242078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=agfwRv5BYKvKOnJn+0U2423jmDQfU0HQzH4z0m85B1I=;
        b=TZe8thk976y8B7N/ycmpoqEGpFBzaKM07S10qGXmvBvd0rxW7digEB+p7atSch5AWH
         6IEYbQKnc9OWL40ryF/zLzoLJQ+Jiv+JG0sBy2ENZcVPqp03jwRAmBMGwJq8HtSG+XNF
         EWfQbwtxR2vrI5FIDejaHTmUIf99BGVDee3BiWFDfiGQxBcyt9i1irfTM5bb0BATthvF
         vqz+1DAosrtwXozJmbYy+mbOjty54MjDKMrPom36p1VHszQnqZi/BuZ2Z3ze7gqZHyfq
         8l4PLgWGNBE4OATLBXuMe6PnO44pIlKS33QGEfUyRx/JCX26EqI4FF9s9DRV1GHScUbS
         euyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJLTB2eJUOkeTMNrE+OzOubgsGMY1TMptdB2Wh96QPuNzMqYCLz5bOU1mAyKPPpYle4SoODw1WV1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbVMSr4MvvtouY5DIcKl5f63X1el5arVCAvSJU8gJg3p/lg5Mb
	q42vmlcg4z7GyPB40Ke7YfhSIPfoYrJGq4TFBk/wP+JYifk/SJsv81POuj9GUdPsda44aEu9qWE
	EUc7oln8kLPgv3/mukNX9xAUAE/I/QUc=
X-Gm-Gg: AZuq6aKYavtL8XQWubt9XWKCYABXRL3HCvZv6LdMOKUXX7ulLl59EZpzfsJhfO866VH
	9VFn25FbwDEL8g9uRQ+jaZ/1oYG/TYSpvsxHGKMAPLGXdI7NnJWCG3YcqNkjyAtejNFHUnYJy7X
	UUIYv/PXaWLcyn6OFnrZGh2XCfHZq/qtvgLHu47fLiCyGRffdcN7uRb9QbS9jjb3QDaOjPWVM0u
	7WYk73Ga0pWVuA01sROuRX/f+MyIzfzn+LmlP7kVjVYq/H1L15HC63OZPvdlNPgahgGuGjPfNLn
	LeHRht2XASVKeAgna1MVrThr
X-Received: by 2002:a05:690c:d93:b0:794:7866:2630 with SMTP id
 00721157ae682-7952aa603b5mr111212367b3.5.1770637278373; Mon, 09 Feb 2026
 03:41:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209021134.21194-1-dqfext@gmail.com> <24606a3d-b8b6-4e34-845f-8a76e9d13154@linux.dev>
In-Reply-To: <24606a3d-b8b6-4e34-845f-8a76e9d13154@linux.dev>
From: Qingfang Deng <dqfext@gmail.com>
Date: Mon, 9 Feb 2026 19:41:07 +0800
X-Gm-Features: AZwV_QhMm4Zxz1Q8Dev-7zvOAUXSfimxjHOUYIrGZfk99aitdgmQ3MLIffvN0Ao
Message-ID: <CALW65jbaV4WCznjo4NxYe2Vs0NLLU+xV6-Z4sV9DNu91A+sUGA@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] ppp: don't store tx skb in the fastpath
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-387-lists,linux-ppp=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email]
X-Rspamd-Queue-Id: D345210F561
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 7:17=E2=80=AFPM Vadim Fedorenko
<vadim.fedorenko@linux.dev> wrote:
> On 09/02/2026 02:11, Qingfang Deng wrote:
> > Currently, ppp->xmit_pending is used in ppp_send_frame() to pass a skb
> > to ppp_push(), and holds the skb when a PPP channel cannot immediately
> > transmit it. This state is redundant because the transmit queue
> > (ppp->file.xq) can already handle the backlog. Furthermore, during
> > normal operation, an skb is queued in file.xq only to be immediately
> > dequeued, causing unnecessary overhead.
> >
> > Refactor the transmit path to avoid stashing the skb when possible:
> > - Remove ppp->xmit_pending.
> > - Rename ppp_send_frame() to ppp_prepare_tx_skb(), and don't call
> >    ppp_push() in it. It returns 1 if the skb is consumed
> >    (dropped/handled) or 0 if it can be passed to ppp_push().
> > - Update ppp_push() to accept the skb. It returns 1 if the skb is
> >    consumed, or 0 if the channel is busy.
> > - Optimize __ppp_xmit_process():
> >    - Fastpath: If the queue is empty, attempt to send the skb directly
> >      via ppp_push(). If busy, queue it.
> >    - Slowpath: If the queue is not empty, or fastpath failed, process
> >      the backlog in file.xq. Split dequeueing loop into a separate
> >      function ppp_xmit_flush() so ppp_channel_push() uses that directly
> >      instead of passing a NULL skb to __ppp_xmit_process().
> >
> > This simplifies the states and reduces locking in the fastpath.
>
> Quite insteresting optimization. Did you measure the improvements? Like
> pps over PPP interface, or the length of backlog at some ppp rate?

Not yet. I may test it with PPPoE when I have access to a network
traffic generator tomorrow.

