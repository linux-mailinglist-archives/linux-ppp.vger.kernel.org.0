Return-Path: <linux-ppp+bounces-460-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBDdHWKYxmnrMQUAu9opvQ
	(envelope-from <linux-ppp+bounces-460-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 15:46:58 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFB13464B0
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 15:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB7E13038AC2
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 14:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E854D3F7A90;
	Fri, 27 Mar 2026 14:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gn0zYwQ2"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A873F0A9E
	for <linux-ppp@vger.kernel.org>; Fri, 27 Mar 2026 14:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774622593; cv=pass; b=Nw7XXRzDlKNd4qr4rNSxpNNS9zebFbKGheWL/jaE2QW+rqHyVHZuIy0pN0nyelRGIma7JQpDoHrbvVmNE/ev5uo2h2dD097YbDqtMZ+K/Kw6ya3shsMOt0/f6VtZruNL5gxuG6QBhcs+rgOQx4Br61TcTveq8zZsGXp5p80yHQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774622593; c=relaxed/simple;
	bh=VoXmf57WJpwyR3+/FyywPtdgcsZegXDOU57WERuaduQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qI/oGT0SFAH8QCZlRVGbYBTgOq7uR3BNzClPBl/P1MllIXEcbfKx4sDysW/GLj6Pkhv9w4wSQPgCB4r5v3nugCmff9qDjEW3MkK6bHUgT0KQbx1pu/luyOMuwTGgtD5EN0ozT/7dSGUryI60iRsizQNjvNvv2dnU+y1HN8AEYng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gn0zYwQ2; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79a60975dc5so24184367b3.0
        for <linux-ppp@vger.kernel.org>; Fri, 27 Mar 2026 07:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774622591; cv=none;
        d=google.com; s=arc-20240605;
        b=Aj9V/RuflUASt9uFDBkxY2BA2L/SDRkntnT2bwqKsleC2TCre7k79wuAOdbYFsQYPi
         qz6PxfHy3oma+eg3130fM1i+2aIf4reQgiwa02WEbO6KgVBSJ4861UpUumri7tGFW2C/
         M92HiaiCSKc193OeCvAZ4Lgyt7M2M7KHhBknjz6+h3YGWfvLcnZLlin/nh1hbPFM1kZy
         WP7KxTAb30g4crNp41TvB2akFoNEOVG/vfFvPMYLxoxnT28yU5erj5nd/7zxH7zX62fg
         NxB74Eq1M7mA9T8SxYfD2CQfIqEV8c/WwiwVZfjpYbrLEVPEMUWSadG2IypuuPd6yr5Z
         Znbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VoXmf57WJpwyR3+/FyywPtdgcsZegXDOU57WERuaduQ=;
        fh=x+YXJblNE0/MUc2aGQLVjcykkq3+8HTVNQfyIFR9IqE=;
        b=hmEomzeU2CwthUtL724kmLEcmsXXkjumMBRj9IBUu8sYDschGp+TpLSnqJvLabYYOM
         JGrXbIOm1X+zS+jRmeVNpWZXAIFytEhO+Tyv0Bu5XhA4pQOPZMmnPAKC99EZ/r/67VBm
         MfCw73WR89MbTCRI6F/vElocEhR7uxg67JTDAQqawB9Wpo41rT53XF7fTOtoPfqpoJ4K
         LI7J+M9ubZOS3FpXCh+R7cYFRDYlA2XHvQc76mJXcQN6X64YqUcRrz8sYPlkuYOf46Yg
         uysdcURDM+kXgJ//CcGz81nAZ1gfBD0bBxd4zu1Xz4vJWQjP6Wst8PEbhlULn/CpjrsH
         ngVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774622591; x=1775227391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoXmf57WJpwyR3+/FyywPtdgcsZegXDOU57WERuaduQ=;
        b=gn0zYwQ2528vxW5WwddSueWefFTCAXhJD3A36QF5QvF9E2bb7Fytf/J8Mx3Z4TR2Lr
         YW2MEaAWECTkB9S02m2tdUPZEg8bAXw2agSY+K6cjW5AbuMbkPjI+ad1uUHaZZFarWGY
         RHvsON7s7zVAcLTNJXrOiBLPyRnQfnbk32KcIzBcmgrolKjD+h7WevlnLOQ7NMITgJbO
         jo0c8VcvGuwtB+0FcWQPc91Cr6ZgYU5DvujI/r/osDCJPwPpBC7gX3pM7jEKkjuDMTZ5
         ztCvQaoQV+xXCsQNRxFxmZKHX8pRrT6q09o5qON1mPQywiElaivhOnOCUEnWWK//mlVy
         ebww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774622591; x=1775227391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VoXmf57WJpwyR3+/FyywPtdgcsZegXDOU57WERuaduQ=;
        b=dBzrJEOQYibxdAa6T4s4SMBdK/yOlav7cj19o66LobqbD7Gnf5KhhuWSUBTOPJ1+eb
         TFVCiwdoRJtUN6TGDpFtJAV958dnnjORlOneuCSL7azIynqZLz9yGh+1SmrfxTnq0yAa
         HcYFWShAU0l0TqSzZYHRw8qEzfENivTj2f1ez+lsqPqJSOjolL7dPdOBykaX+WJkbass
         KrkqYIXop8/RAmEEN6fbne66s1e93dvmTUtUubA1M7ikoI1nDvCmM5GSMWlRroppbGwv
         drX+RY6JtMRBiz+fccY52y8St70z2Kdalhpo/iSgb5QH3g2uV5b0dDACA0LJXGejZpkA
         zRZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZlaJne3Qy/SSXkskkyTRsEB7Ab4dvgWO1HEerpAunAMySyfBHD7Zyr0SamL1LrRQrElBbarpcRWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHUPR5w61c2mx/kMFk6nRFZMTVq8tMmJFhn5IU9jXTlQf7lmCw
	UJ5rkJOqpGLDjqRKPuQdbnqbOfWlq/J3WWiyE+jx/TStORxdYHKQQIFFxvZ+JQ4HaLyQQ0EemxU
	uFRHF3F2rN78YYO6DzMaJ8GHa6QpvQzk=
X-Gm-Gg: ATEYQzzdcpuiyskk72RoTQK/mekWKzxAvl2tw/fVPWZWmKPBvhpeXM/XMTkqvsBhChM
	ULa/X/uPYbbXUBcIPJKr1uNv/y43RWZiYjPyT+tiEcqpN9Wp5MnqFn4AYYbmxkKLhEoNMe7dseT
	rTEZMVuEximNtSSguLH+qWF6nqmKS6tFzVC7Icn65iyh2+NYHeU/cyuZiu8qEVVzD5H1mMnMvvB
	RtRvZralOI9Tk4HgSJCIJUsjM+2LhoJ5qrx/VgZm5aFky83Mtxad6mYxWlkhCSWjHTxqsdx6ABz
	HtrQrl9BdAf+NsWKXceepPZhFewaw/fl7OLL
X-Received: by 2002:a05:690c:30a:b0:799:266:83e0 with SMTP id
 00721157ae682-79bde0a99e7mr26912277b3.34.1774622591479; Fri, 27 Mar 2026
 07:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305013852.3769-1-dqfext@gmail.com> <CALW65jZRyKydW6bs-mYwh2mEn0dpv3opVEr=WczKn_0952_+Yg@mail.gmail.com>
 <CADvbK_fj_26MLP=+U+rzOMfqdPpdvFQJgN_fozd2uAjRsfHweQ@mail.gmail.com>
 <CADvbK_f3LwEt+-BG-1Pcr4jMn6Jxry+0p-Fu_s0C6Px+F_NHCA@mail.gmail.com>
 <CALW65javKc9H1zQ4m5cb0qPfXix+bWM9LcVZ+uQN5BdgdTQ=gQ@mail.gmail.com> <CADvbK_fug3vckLkfufLTtqTEKzywRUw8C_dzfW032_cb6vLpZg@mail.gmail.com>
In-Reply-To: <CADvbK_fug3vckLkfufLTtqTEKzywRUw8C_dzfW032_cb6vLpZg@mail.gmail.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Fri, 27 Mar 2026 22:42:59 +0800
X-Gm-Features: AQROBzCTVnUCnEkObm9eV9Wpx-1Um5gzBGefD-FTNsN1J9iBMTj2-Zz0FzfAi3U
Message-ID: <CALW65jYQt9-EQ0tKkgPRGMdf4Ra2oq4BT4XkCPu0zaRH=rzviQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5] net: pppoe: implement GRO/GSO support
To: Xin Long <lucien.xin@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-460-lists,linux-ppp=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.736];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,nbd.name,vger.kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DAFB13464B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Xin Long,

On Fri, Mar 27, 2026 at 9:23=E2=80=AFPM Xin Long <lucien.xin@gmail.com> wro=
te:
>
> On Thu, Mar 26, 2026 at 9:49=E2=80=AFPM Qingfang Deng <dqfext@gmail.com> =
wrote:
> >
> > In my v6 patch, I set phdr->length to 0xFFFF. Is that okay?
> >
> > https://lore.kernel.org/netdev/20260326081127.61229-1-dqfext@gmail.com/
>
> I think you need to check how the PPPoE stack handles this value. If
> it recalculates the actual length using skb->len when phdr->length =3D=3D
> 0xFFFF, then this approach might be fine.
>
> Also, how does the PPPoE stack distinguish between 0xFFFF being the
> actual payload length versus it being used as a marker to indicate a
> jumbo packet (similar to BIG TCP)?

In the receive function 'pppoe_rcv()': if a skb's actual payload
length is less than phdr->length, it will be dropped; if greater than
phdr->length, it will be trimmed to match phdr->length. After that,
the phdr is popped and the skb is passed to the generic PPP layer.
There is also a fastpath in Netfilter flowtable for IPv4/IPv6 that
bypasses pppoe_rcv(): it does not check phdr->length at all, and only
relies on the length field in the network header.

In the v2 version of this patch, phdr->length is not updated in
gro_complete(), so an additional check 'skb_is_gso()' is added to the
function to avoid trimming a GRO skb. Then Richard Gobert suggested
that the length field needs to be updated, and if the updated field
matches the actual length, the 'skb_is_gso()' is not necessary, but
only if the length fits in the u16 field.

