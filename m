Return-Path: <linux-ppp+bounces-362-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC59B81E76
	for <lists+linux-ppp@lfdr.de>; Wed, 17 Sep 2025 23:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16B147B57A4
	for <lists+linux-ppp@lfdr.de>; Wed, 17 Sep 2025 21:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC71302770;
	Wed, 17 Sep 2025 21:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WjGrIP+g"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E484D29A323;
	Wed, 17 Sep 2025 21:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143676; cv=none; b=nHJiJk80ohvFXjhWMoC/aPlmf6Dq1yLaakLv1MOr1X8XaXitk+oL1DxGK85gtiIQF3MMBp91OnplgHNaD5h9JX9NP7YzJY116xksSIMgBSzcnLLVyU5FC/PfHeyoCe3EVhRVUAyWmc38K/GnNQKK+Y9MqzUB0qJNAqyO5GlimbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143676; c=relaxed/simple;
	bh=J4z5cEqKbEspPdyozEYrcyU1xwoqZA19vQU8cDASk9A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I967HPAC/t5H4GA8DpP+oRu6nzYWehW5wu37VXtZu9/Aj+x8GTa+k6JDRGts05ljUZKNPjYWfF4bjBKDbTNaXET2pqJ9H7g93BKsM6tTSqDHp/wxAs8JAFowZ2pl4obpE0a2s77zs8KWuWZFD3R2hAk0wg7lDVkWlCphT8rdgW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WjGrIP+g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25DAFC4CEE7;
	Wed, 17 Sep 2025 21:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758143675;
	bh=J4z5cEqKbEspPdyozEYrcyU1xwoqZA19vQU8cDASk9A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WjGrIP+gdqicn/RQIuhpLGRt1mLDHTY960t5rIHoAz7EDRp0wgegE793Z055cMJIS
	 huXD8b5KBMnngLM3Ncsk8INVRwiDJmuM1Rmn2Q6wdtfDQ9e/q2Pz2YqyF2cr5G89eK
	 8+0jezQGXBnDCeYS5njAWU8tM8xwkT+te8FUEgM/6PdHwOR6310ra3pdYnkSx9tIkf
	 6SJyZQPwOrBbu6OTwi/jGVN+7ntM33yNzu7uRPCUsSWH8zgLxmZOlVtdUBNGaPZx+8
	 L3sCTq2Luc1JEW7OoPKNhiGysmta1AF5gnfDxtnDlg12uQJIq/DOhzMiBK5KUjjEn5
	 v6qP25/zm5gVw==
Date: Wed, 17 Sep 2025 14:14:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net-next] ppp: enable TX scatter-gather
Message-ID: <20250917141434.596f6b8b@kernel.org>
In-Reply-To: <CALW65jZaDtchy1FFttNH9jMo--YSoZMsb8=HE72i=ZdnNP-akw@mail.gmail.com>
References: <20250912095928.1532113-1-dqfext@gmail.com>
	<20250915181015.67588ec2@kernel.org>
	<CALW65jYgDYxXfWFmwYBjXfNtqWqZ7VDWPYsbzAH_EzcRtyn0DQ@mail.gmail.com>
	<20250916075721.273ea979@kernel.org>
	<CALW65jZaDtchy1FFttNH9jMo--YSoZMsb8=HE72i=ZdnNP-akw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Sep 2025 19:00:16 +0800 Qingfang Deng wrote:
> On Tue, Sep 16, 2025 at 10:57=E2=80=AFPM Jakub Kicinski <kuba@kernel.org>=
 wrote:
> >
> > On Tue, 16 Sep 2025 10:57:49 +0800 Qingfang Deng wrote: =20
> > > Can I modify dev->features directly under the spin lock (without
> > > .ndo_fix_features) ? =20
> >
> > Hm, I'm not aware of a reason not to. You definitely need to hold
> > rtnl_lock, and call netdev_update_features() after. =20
>=20
> Will the modification race against __netdev_update_features(), where
> dev->features is assigned a new value?

Shouldn't race if we're holding rtnl_lock when we make the modification
and until we call netdev_update_features()? I'm just spitballing tho,
haven't studied the code.

