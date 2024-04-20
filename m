Return-Path: <linux-ppp+bounces-58-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D21C98AB820
	for <lists+linux-ppp@lfdr.de>; Sat, 20 Apr 2024 02:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 864601F2167B
	for <lists+linux-ppp@lfdr.de>; Sat, 20 Apr 2024 00:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BDDF633;
	Sat, 20 Apr 2024 00:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uX+L69o3"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6585038B;
	Sat, 20 Apr 2024 00:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713573070; cv=none; b=hM5u+RxcIVlDuUK+dCexZYAfqArfyGz6leEObrWCqbYyWHrl4elxgQl+Zflv1+a+exyoqNchDW2bsz4C/zIW66e7t9rnhXWIp6eUFKZxQ++EtYwJ69Pi24s2c1sgcEzJ5q0D/07Nu8b6wTXmaFv8WQtM9Xgr74+rjbyAiKMYfV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713573070; c=relaxed/simple;
	bh=8+dpRPiptMkZ3dTt3rMuDZcF1luHqnaTz7Dab/WvOwk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RxtmMuvSonqhLJ2wLZ7E78fORhV3M5XwPMo1f7ix+7pmALLzWfzIt3PUvndeZo8pO05kDLSEUOFjGEV2GSZzTm8YDOdIxkJ3FdfUF2nGagHl+6vnjrxg6alUx6CgQAaq3q/fg04jYV0BrUklJa/XKFoAA8+/TJI9ciYVfROzLcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uX+L69o3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4DFC072AA;
	Sat, 20 Apr 2024 00:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713573070;
	bh=8+dpRPiptMkZ3dTt3rMuDZcF1luHqnaTz7Dab/WvOwk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uX+L69o30JkAFqFnhYzTPAkdvX7dyUdPaC7g1s+4NkxGj0btLivYGQRmkBAGd+71U
	 jhx7gR6hpfWSBndVTEnn/M/gRycHCbUWtZoNm7WI6SIxo6oMm1sjQ3khNCtuqEmbbU
	 NYb0kORbdg21809awnjaFhLg/6dtlPF546F4C3g0vr2D4rWcWgDPofGIWPN3LNDWoz
	 DoPVJMzisCk4LITxdJeBOkUtySJ75ZQcwhhLRUaCPc843zgcc9IHj1jFweCWYgwGTy
	 3Q7SSFWOan9KaWzWSSukpAJRTk/DvLSOVcFbMOVYW2xr0wZrUl23cyoyJjiEupkNp8
	 /mjcnnX0GxoZw==
Date: Fri, 19 Apr 2024 17:31:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jeongjun Park <aha310510@gmail.com>
Cc: syzbot+393d0ef63475d9bb1f16@syzkaller.appspotmail.com,
 davem@davemloft.net, edumazet@google.com, linux-kernel@vger.kernel.org,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org,
 syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH net,v3] net: ppp: Fix deadlock caused by unsafe-irq lock
 in ap_get()
Message-ID: <20240419173108.30cf9090@kernel.org>
In-Reply-To: <20240419183815.30147-1-aha310510@gmail.com>
References: <000000000000423dd10611261d47@google.com>
	<20240419183815.30147-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 20 Apr 2024 03:38:15 +0900 Jeongjun Park wrote:
> read_lock() present in ap_get() is interrupt-vulnerable, so the function needs to be modified.
> 
> 
> Reported-by: syzbot+393d0ef63475d9bb1f16@syzkaller.appspotmail.com

Improve the commit message to explain the problem more clearly.
Drop the meaningless "so the function needs to be modified."
Remove the double empty line.
Wrap the description at 72 characters.
Read this:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#tl-dr
do not repost in 24h
do not repost in-reply-to other threads

Thanks!
-- 
pw-bot: cr

