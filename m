Return-Path: <linux-ppp+bounces-593-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPxjFNpGFWqLUAcAu9opvQ
	(envelope-from <linux-ppp+bounces-593-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 26 May 2026 09:08:10 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9075D17EB
	for <lists+linux-ppp@lfdr.de>; Tue, 26 May 2026 09:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 835733022632
	for <lists+linux-ppp@lfdr.de>; Tue, 26 May 2026 07:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2BB38F922;
	Tue, 26 May 2026 07:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b="txzpfRE8"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2382D2C08C8
	for <linux-ppp@vger.kernel.org>; Tue, 26 May 2026 07:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779127; cv=none; b=cJAVwd1RHDOwOosk514UmttemWSg5p12HnmDiAtNzNtYHUnG3huZWj4MhdJ6ZX4KNoRdRyVKRqqnoepqX/IU3UcJIsj1Xhj1WYbDBfh6i4XEZOfFqIgSb5pdz1KoGCDx51IECRWHsanmQCgNDLD9NgPDHGsfKMxj8nb97ilPHOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779127; c=relaxed/simple;
	bh=bMlBBMYKxGtq5Cp6eF6ZfJWXx0PmwZQKshZCvqB6uAc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nZs8UzGBhROSNnqHhUZHLzQ3p7yWU+hqo5JoPGzp1tdG05JjNgKuXKlDfiJi3MGwN6WG/z4mas+w7bEc/qWd7VwQ26HxaxzCjv6qdFUMAjXr3jl5MiBGEwOiukAHxgga7UhYJDt5psAtavo54/WW5ktH6CJ/i6kVC+Hm37yWzAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=txzpfRE8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1779779117;
	bh=m9vkaxhsMMRcdgv+HQ3mcLsCjDxo7VhhRY4SJ9evStA=;
	h=Date:From:To:Subject:From;
	b=txzpfRE8w2SKT49kty38OWxYYQKWauakqQ+9pfDGCRMKHmR8Hx52MgBK00PJ8+fXl
	 oq+cDnhme0lIa37glz0MvHvjnltZCFAmecsKHlbIZwZHJXj/1PBDA5Q1sEvKEDl6S1
	 yoJB0aB9lHTTF9fehmIk29T3S3s9gByuWjEhFOmfanQdIZ3lQRIB47ZRjfAR5zqY3x
	 +6mYa5BaE4uexFKVf2pSanjjRq7hSCbDA8B9V94xJkOOgXjLj6hPRKva1YtMKH7Sih
	 bqoPUCWzJ/Vu9lm0Pa/fE6cwCJsytRf59UeidXHHG9FuMD+qwrfouuV6VA7hm8QEMb
	 gfbH5GeiY2+Tw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4gPkKT2Kldz4wKx; Tue, 26 May 2026 17:05:17 +1000 (AEST)
Date: Tue, 26 May 2026 17:05:12 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linux-ppp@vger.kernel.org
Subject: PPP version 2.5.3 released
Message-ID: <ahVGKLw35vabzTIj@bruin>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ozlabs.org,none];
	R_DKIM_ALLOW(-0.20)[ozlabs.org:s=201707];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-593-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ozlabs.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulus@ozlabs.org,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ozlabs.org:dkim]
X-Rspamd-Queue-Id: 9C9075D17EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I just released PPP version 2.5.3.  The tarball is in the usual place,
https://download.samba.org/pub/ppp/.  This release includes several
security fixes, including fixes for a couple of bugs that can allow
out-of-bounds writes, so I would encourage people to upgrade.

Paul.

