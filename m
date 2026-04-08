Return-Path: <linux-ppp+bounces-502-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAf6M+gV1mnwAwgAu9opvQ
	(envelope-from <linux-ppp+bounces-502-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Apr 2026 10:46:32 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 352933B94A6
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Apr 2026 10:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1139F3012209
	for <lists+linux-ppp@lfdr.de>; Wed,  8 Apr 2026 08:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B828934E747;
	Wed,  8 Apr 2026 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="I77LQLbu"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C813AB290
	for <linux-ppp@vger.kernel.org>; Wed,  8 Apr 2026 08:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775637965; cv=none; b=GMiJ3zOefxoIVMnmfsU8O7ALjY+Gl4fw6OVHmbRSyifrSCDlBRace9G53RZtnSgpTxeuBhanapUncXAa8PCIJ24ydv1vh3JjaaSCMTNRmNqYmYBmcNVMlO1SD5xRuQ1pOqoN1egHVUbZ9Nn6qvPEb4mgoZ7AnmEYiH3U9afO68Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775637965; c=relaxed/simple;
	bh=8x8vc8D9egJ2Nzv01sylk4ZXVNBRuPY3+H3jcXm7TZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EooRTD8NCfWqXRKUOkfX/S6LipomHxMRBJSfglgr5CEuVqllGl/AKONuwMFLEihqbDJJSaQDyhIvGlxRZkHa8GSJlEWVotroV4a1CiHJjceHpsAmnPV0T8G3YRw9HsWKdXy280/xyQ+sGrc1KeDBNkimTkUUXWYqP90SvTsJObg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=I77LQLbu; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <bfc722c7-0e70-4e7a-98c6-64b762509469@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775637942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3V78EK3mG2WKYBtg7w5ETpi7/fd1k9rE7OPVs8ofvwg=;
	b=I77LQLbulmG42TGY9+SkONDVoHMdhzgAiBzkWjsos2BGLMzwCiJWMBw0IDSKK+sFaNRlPW
	BHFxqSABQr1uIEIHYA1huHWp74PsVDru8w8KQwYosS9CevbwhWdL9d8SIxw7ZZ/n8YPxBC
	B29kEIba1P9verifiaeS9cBJsrrDYgc=
Date: Wed, 8 Apr 2026 16:45:36 +0800
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net v2] ppp: require CAP_NET_ADMIN in target netns for
 unattached ioctls
To: Taegu Ha <hataegu0826@gmail.com>
Cc: linux-ppp@vger.kernel.org, gnault@redhat.com, jaco@uls.co.za,
 richardbgobert@gmail.com, ericwouds@gmail.com, netdev@vger.kernel.org
References: <20260408065109.2171-1-hataegu0826@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <20260408065109.2171-1-hataegu0826@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-502-lists,linux-ppp=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,redhat.com,uls.co.za,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.dev:dkim,linux.dev:mid]
X-Rspamd-Queue-Id: 352933B94A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Taegu

Please wait at least 24 hours before posting a new patch to netdev. See 
https://docs.kernel.org/process/maintainer-netdev.html for more information.


