Return-Path: <linux-ppp+bounces-360-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99511B59B13
	for <lists+linux-ppp@lfdr.de>; Tue, 16 Sep 2025 16:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 520713A6E0B
	for <lists+linux-ppp@lfdr.de>; Tue, 16 Sep 2025 14:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561F63043AB;
	Tue, 16 Sep 2025 14:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFADy+dW"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDA62DC79E;
	Tue, 16 Sep 2025 14:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034643; cv=none; b=Ttb9bUwFp8g9odkxq208WNbGkEsKTgy66iDsOlizDhUmh1ySSsOnI+t1zO6drfOp7p4AfZ8Hd6nqvDw8oXI3R0STW8qq52qNWKqyTkG+pHecbL66pw15NAHrV04aguyST5lmIYWsfMZAXf/q0Stzz4CpAmlWKOj1Z7MqOik83cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034643; c=relaxed/simple;
	bh=pyvOdrqvPXVuxna50dx+N08vi6tC72beUN88GAJV+xU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iRFmJ02Pixbu0WkTUWcu+d9wa8Kx0PYlP8z7e1YYGF/ytpLl4O3JaZFOFoByYgc/G0Rd3phmQTTk4YduDTzMbTQmn/WK44DPk13emgQBh5+xY++ChjxH+auLU1zi4GQHiy9n3vcpvW7JcQRox5KKdIzaw3a16eJTUEOh8akHMxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFADy+dW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2C4C4CEEB;
	Tue, 16 Sep 2025 14:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758034642;
	bh=pyvOdrqvPXVuxna50dx+N08vi6tC72beUN88GAJV+xU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aFADy+dWg2iTEaZ4QvusgKxWfvTt3+3y7nF0cfrzcxy8UDALoLnNlFQWLBEUwKaVD
	 /AndprpX+HX37vkH8N7Vm2M7gF5nvaoAYpR2W4zIDPROdVjghSqWyGplVCMTIwdHzd
	 8lh1v8Q9wng7HBK4fBXhse19YPL8Vj+MUOierSfp7oEfeSHJj6/2X2Qvoc/KAR/Ula
	 GHrvnk9NPEroPm9KV2HFrLYHgWGB3kU9risD0nd7S9LnXHPru85t8cksTDENTCq8Fz
	 xct1ceUw5OJ8PV99jpJMYWNe5qAUkGvXbXJFcLl/6gx3VFaSYhyXQn9F0fm6W88/vD
	 Obq53zhuE0Plw==
Date: Tue, 16 Sep 2025 07:57:21 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net-next] ppp: enable TX scatter-gather
Message-ID: <20250916075721.273ea979@kernel.org>
In-Reply-To: <CALW65jYgDYxXfWFmwYBjXfNtqWqZ7VDWPYsbzAH_EzcRtyn0DQ@mail.gmail.com>
References: <20250912095928.1532113-1-dqfext@gmail.com>
	<20250915181015.67588ec2@kernel.org>
	<CALW65jYgDYxXfWFmwYBjXfNtqWqZ7VDWPYsbzAH_EzcRtyn0DQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Sep 2025 10:57:49 +0800 Qingfang Deng wrote:
> Hi Jakub,
>=20
> On Tue, Sep 16, 2025 at 9:10=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> =
wrote:
> > Seems a bit racy. We can't netdev_update_features() under the spin lock
> > so there's going to be a window of time where datapath will see new
> > state but netdev flags won't be cleared, yet?
> >
> > We either need to add a explicit linearization check in the xmit path,
> > or always reset the flags to disabled before we start tweaking the
> > config and re-enable after config (tho the latter feels like a bit of
> > a hack). =20
>=20
> Can I modify dev->features directly under the spin lock (without
> .ndo_fix_features) ?

Hm, I'm not aware of a reason not to. You definitely need to hold
rtnl_lock, and call netdev_update_features() after.

