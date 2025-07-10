Return-Path: <linux-ppp+bounces-317-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A266B00877
	for <lists+linux-ppp@lfdr.de>; Thu, 10 Jul 2025 18:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B8121CA0AA7
	for <lists+linux-ppp@lfdr.de>; Thu, 10 Jul 2025 16:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809BA2EFD87;
	Thu, 10 Jul 2025 16:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rkkMKh8u";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VmOgyZwx"
X-Original-To: linux-ppp@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EFC2EFD80;
	Thu, 10 Jul 2025 16:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164650; cv=none; b=LacGUuNMFKQQDXBqubEGWWnj8V8NV/jy3bBnRYa5vEKQdIRdoRIdwYBa+a7BfNcfArruHcZmbXevGAHftVwj76qCLqFd9dTq3keNL6HyOQB91udU2aaGZR/gOBNzN1SUo4Rf5hBm3FfnnL/1cMRRUShvB5uPuKdgY01DFr4D/2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164650; c=relaxed/simple;
	bh=yhXnlookodcUEcmo8ztk+UB5W/O098X3DHk1+abEzEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VRzEWzSTiLjmIW4ZEslLatFp7rgToWhPsyl8LL4FHpCYL8igAwGQmBca9wWjfQTTzsC+ntAWX32nDuTq20bQLV09HS5VVPQJS+bibTKa+2jYK+NtlZOXtWAQsqVPcQjbFSLtnvAmFBQYRBC3srgAUkt1NNlsGyp2e/9rzw3uyaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rkkMKh8u; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VmOgyZwx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752164646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tQMC4S7/L1wvzxI5yirgcxP5rYPtfD7o+g83A17/u9o=;
	b=rkkMKh8uvipgG6D7/Dq46KcRca2gSEbWJXohqfs3YbWf49pjBrSi4bduCLLIqkDw3vMTqq
	fdHp4hNwzuuQ6q4Wtqi1qLJLotFL3RdE8E06z9GP/TxmSzMPdesynOCVGEHzC8uZQIh9eX
	kFaxFa7gyiVwcODdTOxBKihcJYc6gv0uU/IhHH8hT5djihycps41vpKPby+cnxuw9IcJQs
	GT6+wIj9Ckv5KCwZtp3/aQZhFmvutKzC9a3BMfvTB2/c3avbjTHXbXN/x0VCRMQE6K0c9u
	OOGKsaH1NYG/G9bbh1FdIP+ZPuZJV0BboeGZnrShEjAkuX7q77ugUXWmnWVYtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752164646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tQMC4S7/L1wvzxI5yirgcxP5rYPtfD7o+g83A17/u9o=;
	b=VmOgyZwxeYAci8wXyNSCrI4xXM+Uw9pwyFdd1fp4tVT2xmUkDJAQWkHXIpABr2zdZ3Hz/K
	qq69rt/nm96sblDQ==
To: netdev@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-ppp@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Williams <clrkwllms@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH net-next v2 0/1] ppp: Replace per-CPU recursion counter with lock-owner field
Date: Thu, 10 Jul 2025 18:24:02 +0200
Message-ID: <20250710162403.402739-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This is another approach to avoid relying on local_bh_disable() for
locking of per-CPU in ppp.

I redid it with the per-CPU lock and local_lock_nested_bh() as discussed
in v1. The xmit_recursion counter has been removed since it served the
same purpose as the owner field. Both were updated and checked.

The xmit_recursion looks like a counter in ppp_channel_push() but at
this point, the counter should always be 0 so it always serves as a
boolean. Therefore I removed it.

I do admit that this looks easier to review. On the other hand v1 had a
negative diffstat :)

v1=E2=80=A6v2 https://lore.kernel.org/all/20250627105013.Qtv54bEk@linutroni=
x.de/
  - Instead of rewriting the sequence and adding two owner fields to
    the two variables that may recurse it now adds a per-CPU variable
    for locking and keeping mostly the old code flow.

Sebastian Andrzej Siewior (1):
  ppp: Replace per-CPU recursion counter with lock-owner field

 drivers/net/ppp/ppp_generic.c | 38 ++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

--=20
2.50.0


