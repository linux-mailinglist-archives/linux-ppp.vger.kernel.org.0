Return-Path: <linux-ppp+bounces-364-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC173BE8BC1
	for <lists+linux-ppp@lfdr.de>; Fri, 17 Oct 2025 15:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CD0F583C7E
	for <lists+linux-ppp@lfdr.de>; Fri, 17 Oct 2025 13:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A956F345723;
	Fri, 17 Oct 2025 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=debtmanager.org header.i=@debtmanager.org header.b="Vh2PoAZ/"
X-Original-To: linux-ppp@vger.kernel.org
Received: from manage.vyzra.com (unknown [104.128.60.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5B0343D61
	for <linux-ppp@vger.kernel.org>; Fri, 17 Oct 2025 13:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.128.60.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706311; cv=none; b=rDSVsNe96A1lTH8D3eYHwg7UcQXAvFc81kIfeMfdUvYgekvrCD2BYry5GGtZVfEPXwt4dUqvz/gtq8zLf+lO82GiFlabKEA0P5kDEfxfUkvoJ0gtz8zwQYnRsedAdpdMeNeoZoMz97AVRlgLspR6WDMAv9UMCttcr5CequKPA70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706311; c=relaxed/simple;
	bh=biLnUx9jTTyVdIbdiavoTAgEZeIqqOihfb373MH/e18=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XUzzcaXafZ1GvrLvOq1EykFebVvedY4flvw4TqNvNqPSza52Z0v6uCSGHyqdBJc2NGH7Gz8M3bm3SlWgMgBLi41hli0UOBrn4HxHnM+g/o3sGl9VHHULIIMpAOAi+seh7fGcVHjnldQ3yzWy4ZmPek8jw3YU94u6AADuX6RE+Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debtmanager.org; spf=none smtp.mailfrom=manage.vyzra.com; dkim=fail (0-bit key) header.d=debtmanager.org header.i=@debtmanager.org header.b=Vh2PoAZ/ reason="key not found in DNS"; arc=none smtp.client-ip=104.128.60.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debtmanager.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=manage.vyzra.com
Received: from debtmanager.org (unknown [103.237.86.103])
	by manage.vyzra.com (Postfix) with ESMTPA id 8FB5F53386F4
	for <linux-ppp@vger.kernel.org>; Fri, 17 Oct 2025 07:45:34 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=debtmanager.org;
	s=DKIM2021; t=1760705135; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=Aj8bDacQlJB5qNMC5+yWWged1+K/M8YReXQkzUminbQ=;
	b=Vh2PoAZ/p0a/Z6vJZnyiTanzTsgV0oYpl9COzN7D6J+OX91eq8R0KS/rrJ2TGQz4SwEmpP
	JUvSf8ligEniNuGlw+kPfD4+77jy9dab5I1YW6Gtrc2bYH+4MS0qmZL8o3BoL4135qH7Ju
	LZ9eHy9+eHtV01lNubfCwa2hS8oGpd30a98Ee5NOREIAHNkIMW/JNjKAL2rYRW5uhqwXBj
	/z9fNKtmVX/lGZfj7nO3rmbAoryTwlUVYsCJ9SjuIgYpG4h7S691PBW+GBkEzvq6TOnwLh
	PsrrEm6w36YkC62mmfZ364htaSOHquNxRKOuObAcCYmlorBc7s9O0Erx04GwRA==
Reply-To: vlad.dinu@rdslink.ro
From: "Vlad Dinu" <info@debtmanager.org>
To: linux-ppp@vger.kernel.org
Subject: *** Urgent Change ***
Date: 17 Oct 2025 05:45:34 -0700
Message-ID: <20251017054534.BDEED383BC626FBA@debtmanager.org>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -0.10

Hello,

I am Vlad Dinu, the newly appointed Director of IMF Legal=20
Affairs, Security and Investigation. I have been given the=20
responsibility to look into all the payments that are still=20
pending and owed to fund beneficiaries / scam victims worldwide.

This action was taken because there have been issues with some=20
banks not being able to send or release money to the correct=20
beneficiary accounts. We have found out that some directors in=20
different organizations are moving pending funds to their own=20
chosen accounts instead of where they should go.

During my investigation, I discovered that an account was=20
reported to redirect your funds to a bank in Sweden.
The details of that account are provided below. I would like you=20
to confirm if you are aware of this new information, as we are=20
now planning to send the payment to the account mentioned.

NAME OF BENEFICIARY: ERIK KASPERSSON
BANK NAME: SWEDBANK AB
ADDRESS: REPSLAGAREGATAN 23A, 582 22 LINK=C3=96PING, SWEDEN
SWIFT CODE: SWEDSESS
ACCOUNT NUMBER: 84806-31282205


A payment instruction has been issued by the Department of=20
Treasury for an immediate release of your payment to the bank=20
account above without further prejudice. We cannot approve or=20
schedule payment to the 

given bank account without your confirmation. May we proceed with=20
the transfer to the Beneficiary: Erik Kaspersson, bank account in=20
Sweden?

I await your urgent response.

Mr. Vlad Dinu.

