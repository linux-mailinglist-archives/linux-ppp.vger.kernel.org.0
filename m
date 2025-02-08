Return-Path: <linux-ppp+bounces-189-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC8EA2D434
	for <lists+linux-ppp@lfdr.de>; Sat,  8 Feb 2025 07:02:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB13F3ABBC8
	for <lists+linux-ppp@lfdr.de>; Sat,  8 Feb 2025 06:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D2B1990C7;
	Sat,  8 Feb 2025 06:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=truemaisha.co.tz header.i=@truemaisha.co.tz header.b="wkojrPcV"
X-Original-To: linux-ppp@vger.kernel.org
Received: from server-598995.kolorio.com (server-598995.kolorio.com [162.241.152.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBDB192B63
	for <linux-ppp@vger.kernel.org>; Sat,  8 Feb 2025 06:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.241.152.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738994520; cv=none; b=R7+wDQo3qEk1AqTeN+m6TacNYpfuzkfpvBomSd+W3HxQUM2uKiALWTozjg4tztW/nCMe5cXv8G2z3/nO/FHvjWeYSrL0gdie8ymXXeeb9EoMmntRAWtOe1wFTvt7GpStemZOQg+4Jmhp3pjhCqzjfPxfyJ6THFAdSSBkaE8lIuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738994520; c=relaxed/simple;
	bh=gl4+7vNxgV9+JzZtw7EthQ6aGDgi0WVn3wQV/lnKiyo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W4X6SAE8TrfS0kcDf1ppCj44lYokDOJbyAq7W4NUBl4XHGKfSsLt6pOY/aCz+6KEU3m6JtPwTAdbo8xjE42NMYlGh4oAm7uQafaSSb2y52xWfkQvIvlKdVc/G9K36tZ7UleEOq7R2RfcKPjfSQwQ+6rMwHLxVSWCgr1W6AnPNI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=truemaisha.co.tz; spf=pass smtp.mailfrom=truemaisha.co.tz; dkim=pass (2048-bit key) header.d=truemaisha.co.tz header.i=@truemaisha.co.tz header.b=wkojrPcV; arc=none smtp.client-ip=162.241.152.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=truemaisha.co.tz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truemaisha.co.tz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=truemaisha.co.tz; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gl4+7vNxgV9+JzZtw7EthQ6aGDgi0WVn3wQV/lnKiyo=; b=wkojrPcVP4tSuGiVmk4FEqUg1p
	vyw0xKuaZ2J06UlriV7j3MfXswmHPJf1ZDQ+907uItYXPYebR7nARNt7uHF4Iom9Ar7w+8BoPbq+9
	mK69MGVJRt6/BW97/vXK/QFO5eo40FFJpaGYFi/aqsESmj/qrLxhWrxxY+7zyTPmBW2zuJ0ZJUIRI
	DdaTorJ1SeFdKGBnmT9WkRGP03FzMrwXqOk5DyHkwSv00W3GEnv1aJJPvhFpkMKMaqyCIdkopAScC
	ELB0/mmovWoISvQO3Q6OEnAFcMdRjclFSVGcTXRQzyoh73OLPkjkiIe+cHpZOQAabEFNI4Sr4651Q
	nCMhwzNQ==;
Received: from [74.208.124.33] (port=53641 helo=truemaisha.co.tz)
	by server-598995.kolorio.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <chrispinerick@truemaisha.co.tz>)
	id 1tgdud-0008Fm-15
	for linux-ppp@vger.kernel.org;
	Sat, 08 Feb 2025 00:01:56 -0600
Reply-To: dsong@aa4financialservice.com
From: David Song <chrispinerick@truemaisha.co.tz>
To: linux-ppp@vger.kernel.org
Subject: Re: The business loan- 
Date: 08 Feb 2025 06:01:57 +0000
Message-ID: <20250208015436.9BE70826142AC7B8@truemaisha.co.tz>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server-598995.kolorio.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - truemaisha.co.tz
X-Get-Message-Sender-Via: server-598995.kolorio.com: authenticated_id: chrispinerick@truemaisha.co.tz
X-Authenticated-Sender: server-598995.kolorio.com: chrispinerick@truemaisha.co.tz
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hello,

My name is David Song, at AA4 FS, we are a consultancy and
brokerage Firm specializing in Growth Financial Loan and joint
partnership venture. We specialize in investments in all Private
and public sectors in a broad range of areas within our Financial
Investment Services.

 We are experts in financial and operational management, due
diligence and capital planning in all markets and industries. Our
Investors wish to invest in any viable Project presented by your
Management after reviews on your Business Project Presentation
Plan.

 We look forward to your Swift response. We also offer commission
to consultants and brokers for any partnership referrals.

 Regards,
David Song
Senior Broker

AA4 Financial Services
13 Wonersh Way, Cheam,
Sutton, Surrey, SM2 7LX
Email: dsong@aa4financialservice.com


