Return-Path: <linux-ppp+bounces-358-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B59D8B58ADD
	for <lists+linux-ppp@lfdr.de>; Tue, 16 Sep 2025 03:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75B0016E2E9
	for <lists+linux-ppp@lfdr.de>; Tue, 16 Sep 2025 01:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9231AF0C8;
	Tue, 16 Sep 2025 01:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b6tEYVOR"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E661397;
	Tue, 16 Sep 2025 01:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757985018; cv=none; b=X0oll3IFaeuIMsAYyOMCIR+6GkTJvl+hU51Nqo0ItmEER5bYgwEJMXAwNpEc0ZrYzC++305GkJq/ovgp+yljIzkzILFV+WxjnNWmwB7F5Ux493yIexzxvLBkeiULK40bBYUMhrWRpZpa9wIH6hLnHKdYzRVwP5qvVXiBjRkIT9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757985018; c=relaxed/simple;
	bh=kOJRebOyNrjtGQTHYFxOMmCbyn7l6GlPyxXq/vEITR4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=muOHVnhK44J5IovOEeEHMgTr+I24xRzgNNgDnocwo702Av7TZYHMI4rUuk0B4Enr3TWBWy+lMElSOB0bNKWWbmRgGs8h0XF7UlEfNR80kWJsM3ik58rSTI16TqAf/aZtGFkqcxr6FigtToqKFkS3Tca0CrJaMudmPsPkV+wguMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b6tEYVOR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C380C4CEF1;
	Tue, 16 Sep 2025 01:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757985017;
	bh=kOJRebOyNrjtGQTHYFxOMmCbyn7l6GlPyxXq/vEITR4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=b6tEYVORKtq5k8fBdicdRDr13J9nfXjirDWwjUxutxLGZttb4HmFdNQQydUVcDyLy
	 r+5vv/+//odchuC6QLnJkrA5DCA3YDxtcPW0ZbSLZxXs3XguLmODL2P1qEkmiU4/HQ
	 FMoLTLPmuH6q5nOnvfTJIP1RJJEiJokgQqm5Jmnol4xAVAFWKyjMT1kzVp2e1H5unA
	 DEfazjPPfnP1m30pw4QZTjsv/LtOGH0Fm/ynrby6itxOuDC6yD2HX1aeDKleqwr5Di
	 QFD7sDZ+jTKkfe0enM/dY+BTkM9Df3RI7utZHpJeiq1HMxYHgMb/Gd+5qqF+c42rhv
	 5CuQ5ZO3Xv1Sg==
Date: Mon, 15 Sep 2025 18:10:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net-next] ppp: enable TX scatter-gather
Message-ID: <20250915181015.67588ec2@kernel.org>
In-Reply-To: <20250912095928.1532113-1-dqfext@gmail.com>
References: <20250912095928.1532113-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 12 Sep 2025 17:59:27 +0800 Qingfang Deng wrote:
> When chan->direct_xmit is true, and no compressors are in use, PPP
> prepends its header to a skb, and calls dev_queue_xmit directly. In this
> mode the skb does not need to be linearized.
> Enable NETIF_F_SG and NETIF_F_FRAGLIST, and add .ndo_fix_features()
> callback to conditionally disable them if a linear skb is required.
> This is required to support PPPoE GSO.

Seems a bit racy. We can't netdev_update_features() under the spin lock
so there's going to be a window of time where datapath will see new
state but netdev flags won't be cleared, yet?

We either need to add a explicit linearization check in the xmit path,
or always reset the flags to disabled before we start tweaking the
config and re-enable after config (tho the latter feels like a bit of 
a hack).
-- 
pw-bot: cr

