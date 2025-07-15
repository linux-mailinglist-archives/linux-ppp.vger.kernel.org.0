Return-Path: <linux-ppp+bounces-322-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F45B06269
	for <lists+linux-ppp@lfdr.de>; Tue, 15 Jul 2025 17:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94FEE188C13F
	for <lists+linux-ppp@lfdr.de>; Tue, 15 Jul 2025 15:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BEF204598;
	Tue, 15 Jul 2025 15:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DSPfuo0Q";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jBd1iSgC"
X-Original-To: linux-ppp@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3F41FF1B4;
	Tue, 15 Jul 2025 15:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752592093; cv=none; b=OAQG+NaorfTS5icTT2gcVx0+Be3L5JmQwEC34zuBkO0OnjGiwpWGbc61WGHMsi5u3tkmMwrfDh5z6kycnJ8A9Xf34Y7DypZOTixHCyTEaPFvIsrLrv7P9EBm03KkDBpBVPVOumls0BivZirjbxQ8SJX9tcE92IF8Gqh8Rqr5dMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752592093; c=relaxed/simple;
	bh=6QeSIAD6W5Fk0wIrHNtDcO2N5KUdaVmd0nRRmGW6ssM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O2mX3TDjpxjwsY+hSkUhDXvnNqAv0rjvWV/7eKK/YK6HuUlLL0WX4F/F0LijOqd/VZ4C2Bp9g2we6xatotjDA1QL5JZSeT31hMXb8p5L8vz2eNCo6wDt3AuxwNzJ6tWIDqpAbJSAGNGcmhL4+tlk8umE5tj8hZRPBKAa3/VxvtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DSPfuo0Q; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jBd1iSgC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752592089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5almdexjqBnkQqctZ+isdcmEgknj9Xuw31Qh+l8oUlo=;
	b=DSPfuo0QmNb92pM1g0v809F8LzuFFIRe7JbiRUN2YYY9GhX84Byx1Ga+Z+zqeyOFX63M0q
	N7NO+6/mSbnVCYRWlajxx0Dl1rwwA2yt0myGVCn9jIvMT3GsJzKV2kD5QuhejSB4sE399/
	ypkdvIgdLNTkTE3lM30w+ehiZjSxfHSRfsWAcJEw8yvySqC/pCDIcyTReYHex6FeyT0obK
	3zbnsiWU3lwwY9Zz1Ru7K+rp51AFVLsVJlE3nDWy3dVJH1wf15w6ubrR4o2IwlIffhCOsY
	4GEdupTm3qDULGcB5tNGND+2RA4iDKQ8nUb+zRVtcbD35eMAfLyleRgOMpDKKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752592089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5almdexjqBnkQqctZ+isdcmEgknj9Xuw31Qh+l8oUlo=;
	b=jBd1iSgC3iafEdg0shcvuxCIM6Bnzk1W9e+7rx630OeB5VSq343yg09aKC8tU/Uu684FT9
	AFnIniIG7NY9pdAw==
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
	Guillaume Nault <gnault@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH net-next v3 0/1] ppp: Replace per-CPU recursion counter with lock-owner field
Date: Tue, 15 Jul 2025 17:08:05 +0200
Message-ID: <20250715150806.700536-1-bigeasy@linutronix.de>
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

I do admit that this looks easier to review.

v2=E2=80=A6v3 https://lore.kernel.org/all/20250710162403.402739-1-bigeasy@l=
inutronix.de/
  - rebase on top of net-next
  - replace "ppp channel" with "ppp unit" in the patch description

v1=E2=80=A6v2 https://lore.kernel.org/all/20250627105013.Qtv54bEk@linutroni=
x.de/
  - Instead of rewriting the sequence and adding two owner fields to
    the two variables that may recurse it now adds a per-CPU variable
    for locking and keeping mostly the old code flow.=20=20

Sebastian Andrzej Siewior (1):
  ppp: Replace per-CPU recursion counter with lock-owner field

 drivers/net/ppp/ppp_generic.c | 38 ++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

--=20
2.50.0


