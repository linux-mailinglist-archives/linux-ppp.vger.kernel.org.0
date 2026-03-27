Return-Path: <linux-ppp+bounces-459-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKSoKfmExmmhLQUAu9opvQ
	(envelope-from <linux-ppp+bounces-459-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 14:24:09 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E04A53451EC
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 14:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33BA830063BC
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 13:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79ED1FF7C7;
	Fri, 27 Mar 2026 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDCfkIYU"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728352E8B81
	for <linux-ppp@vger.kernel.org>; Fri, 27 Mar 2026 13:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774617794; cv=pass; b=rW9fFI4A6mDxxR1CnCubEYeVIqtNVOcCNjEVqqiRD54OuDW0S9Ta5l8yZqFMJjc/EysVpcjcM9ChbpoD6wPL7nG8PJuOFbu6WUhn/KL3XfwqiCNANlkp1FqTt1/dgthGzGxSbnl7JfZ9oehwXQJN4Xo7414oRRFEe6MeHF2A75g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774617794; c=relaxed/simple;
	bh=Q7oU4hJPlL6djnZwZRz9W0OHitIv8nDHH8/rU8cIL9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gDBQlH2RONbny6X46IxzFNR/PHzdDqDg9AH9+rk40qoY6qYz+/ypKcLg7z5uWCxwwkz2Jd5J7lw7RQpVWOpDrCceds+bnzn3CkH0xKf6phDViQ7tQBrItexKCUHTlf4Ks8vMZ+KV0ico2H8haESDGh6aBr3TCxxTB2DeZ8CkQmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDCfkIYU; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8297e0b27e5so1254293b3a.1
        for <linux-ppp@vger.kernel.org>; Fri, 27 Mar 2026 06:23:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774617793; cv=none;
        d=google.com; s=arc-20240605;
        b=kmDSeztCDXf49cnHnaJvqlmheaW1lFZHs1EGnP2YRQ89bTKzRsLtueN1vIkN7PIeWR
         BoghzjkLAZfVP/mXWfhwlv1+R0gqmdkeIMN1H36ii2fDDCBHk4Z0uNV+oSJvTIIcf0zo
         Uh6VCPHeQtEcqvm0HmAvnKs8u6hKVSyJYpHmdNgMLraO5MtKBDnvxH7cT+nAnaeZgKjx
         f45Gv+acVCyAUcGEoGGIivlVBxEqHDO4OeLkv4J1PwxxhO4FraPik9/Y8mDDlDEX1cjR
         7WwFIfCd11qIkLBiV8a+7dDJop5LU80q4Fp0St02MuiAeeau4HMW3xJyv8U+q/M3lp0u
         mX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q7oU4hJPlL6djnZwZRz9W0OHitIv8nDHH8/rU8cIL9E=;
        fh=O8U9mlBdBHMRG+MvT9CuMKikX9xahKOrWqa4dWH5b2Q=;
        b=ILgW5OdT/TlxnvFiFVTd2ua+l6/KshW2Ai56RLfgWgN2KvjhzY+qMu5eV6s2guzBeN
         a/8zhV1nsQiUe4xKzzxWxJ9RzNJlMKHDrn9P/5DSktK/SPKhcRWjySBSVPAtjO2pTZ52
         aKA0nO+x7F5IvmPs/47bAJpWpJkOxht6uETs/htzJN21O+dcLLkZz2dV1M59GW7kwOC2
         zUds1y/00/q+jwezfsUIE5DBJOOLaPI+Dw7HaxGrZUCGVlBDEvGtbcXENXRxz9P3yK8J
         +FY+iN2fLZYK8ezdvUyLj5XC5rrt+AsL4gCbkw2MiYCHQzW9rueJ3ZYASarS4Ja9bbA+
         +/7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774617793; x=1775222593; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7oU4hJPlL6djnZwZRz9W0OHitIv8nDHH8/rU8cIL9E=;
        b=XDCfkIYU5rDBEBTa5vmP9uZ/JNUMJlVrZmm8QlvpYXySCENxjFzEP0J15N+2blV4AL
         mqiAjZjEsl9tjDHQSWd4dB6lJG2L6eqz602L7xJIGA+xSzt4gKo79elrZcFT42HWaiLv
         lgMGbSku+Vtlfdl0RUjZWj1af60U2rD5uH6XQiAHLnLapQk+EsT0z5NrED7Cmndby8zo
         SImpwE2jCyipxmdOr6pCQjjvm05fEAm0Dgtheb0dCn4KV8kdk8IHQsKRzBYS9mXBnAPB
         kHh2XPS1U4/GgxiFlvrZV3Ka8w8ElP+gu3oDXkMnIYQ83HINIBFsCiDVHaamFIsSBylq
         qVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617793; x=1775222593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q7oU4hJPlL6djnZwZRz9W0OHitIv8nDHH8/rU8cIL9E=;
        b=LFBhrFRZX7akG8fgS4cxPdCk46Wf7hn3Uu/SVtxMo9MERilY7JFXuBEOqS2NVbBkbd
         mhdJQyJBvkseiw1UU+Rd42aMTRtJ/t1XlbABhLqhMV9BqbNP5qL2e/hFrBwuXFvdCdni
         PDFtHPjiKU9dBZIgPbwnH+Op7COqL6j4Ew16txD+uIW/UUVua70YEkmaG86aPOoLtvNm
         NRJp1dc9ou+5p4AmoDaoLGjFwKc42x3ArA4Uv5zeMlzxAcuci/h9XKLn9gPXQDKYvfqH
         qoeq9zerDlLNcEN4VFCMSvwmhJZ8o2BHOuQbeLPN34IcYD+YjOIA0OUPNaUcXXOeVeTj
         ETyg==
X-Forwarded-Encrypted: i=1; AJvYcCWbj5Ci0q+rqh0geWGnhUM5zgaWiRkFvZDBZbOIbXCZCVfOzZvvXketTn4YHpk77XIecEwVxfwKyvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB6IW0sWWW2ptT4AqPCTKji15UqMCFMObzJyodXFcaurLSyFuf
	SRfkDxKmYky/psEF3VIBAZhO4Lbec8mWWJ7bhkpjIXE2XlBUZQ+8PQMME1BUX5qQwDQ7iyZUMCl
	GwTeEq3CPLTrkWjVB4HPeajcZEQgfUk8=
X-Gm-Gg: ATEYQzx5oUolt+JQM+hi7TLD4bPJGlSxOY/2/MO2tgKT00teDitqYLWrMuysdF6kdwv
	WMUMAFluFmQqQfpBcD8qOnAfHPBvPcu54J3gVbiC6ZxZCimjgLTY8K2YS7bR/OjfILbZzvl4q4Z
	JOCq4xVKtc0Evba+Su1oV+jfx98X7OgqISJGSDaIVLIWO2eqXcr5RAuSAeNiUICI34wqaOQJcg0
	4/85pzNGWG0BrSbJdISjrPpu+8McUzTC+hIGFAzgfEfOTJd0ZbDpNb01qfxKHRMVD5sBRoNjixV
	FM6oUcn4MRHDOz5bR6CtxYtOx8NSflsH6k/0TI4QUfmngDC7uRB896pJw46lqTZcQDdWRP6fUdh
	jvdYksjvAFV7N65nN
X-Received: by 2002:a05:6a00:1253:b0:82c:212a:906a with SMTP id
 d2e1a72fcca58-82c9605d1e6mr2451504b3a.36.1774617792775; Fri, 27 Mar 2026
 06:23:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305013852.3769-1-dqfext@gmail.com> <CALW65jZRyKydW6bs-mYwh2mEn0dpv3opVEr=WczKn_0952_+Yg@mail.gmail.com>
 <CADvbK_fj_26MLP=+U+rzOMfqdPpdvFQJgN_fozd2uAjRsfHweQ@mail.gmail.com>
 <CADvbK_f3LwEt+-BG-1Pcr4jMn6Jxry+0p-Fu_s0C6Px+F_NHCA@mail.gmail.com> <CALW65javKc9H1zQ4m5cb0qPfXix+bWM9LcVZ+uQN5BdgdTQ=gQ@mail.gmail.com>
In-Reply-To: <CALW65javKc9H1zQ4m5cb0qPfXix+bWM9LcVZ+uQN5BdgdTQ=gQ@mail.gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 27 Mar 2026 09:23:00 -0400
X-Gm-Features: AQROBzDeJATj6uIDvTHeARXRmosZWl-Wxm7cMWSFpdK_thjyU_C8O3jj3D6-iPg
Message-ID: <CADvbK_fug3vckLkfufLTtqTEKzywRUw8C_dzfW032_cb6vLpZg@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-459-lists,linux-ppp=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.711];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lucienxin@gmail.com,linux-ppp@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,nbd.name,vger.kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E04A53451EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 9:49=E2=80=AFPM Qingfang Deng <dqfext@gmail.com> wr=
ote:
>
> Hi,
>
> On Thu, Mar 26, 2026 at 10:44=E2=80=AFPM Xin Long <lucien.xin@gmail.com> =
wrote:
> >
> > On Thu, Mar 26, 2026 at 10:43=E2=80=AFAM Xin Long <lucien.xin@gmail.com=
> wrote:
> > >
> > > On Wed, Mar 25, 2026 at 10:43=E2=80=AFPM Qingfang Deng <dqfext@gmail.=
com> wrote:
> > > >
> > > > Hi all,
> > > >
> > > > In some cases (such as BIG TCP) a GRO skb length can overflow a u16=
,
> > > > then what should I do with the u16 length field here?
> > >
> > > I think you can either add a check in pppoe_gro_complete() to ensure
> > sorry, I meant add a check in pppoe_gro_receive().
> > > the aggregated size does not exceed U16_MAX, avoiding BIG TCP
> > > behavior; Or, set phdr->length to 0 and rely on skb->len to determine
> > > the actual length, as done in BIG TCP itself.
>
> In my v6 patch, I set phdr->length to 0xFFFF. Is that okay?
>
> https://lore.kernel.org/netdev/20260326081127.61229-1-dqfext@gmail.com/

I think you need to check how the PPPoE stack handles this value. If
it recalculates the actual length using skb->len when phdr->length =3D=3D
0xFFFF, then this approach might be fine.

Also, how does the PPPoE stack distinguish between 0xFFFF being the
actual payload length versus it being used as a marker to indicate a
jumbo packet (similar to BIG TCP)?

Thanks.

