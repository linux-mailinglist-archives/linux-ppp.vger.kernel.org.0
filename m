Return-Path: <linux-ppp+bounces-569-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAVTBTRC/GlYNgAAu9opvQ
	(envelope-from <linux-ppp+bounces-569-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 07 May 2026 09:41:40 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8854E4313
	for <lists+linux-ppp@lfdr.de>; Thu, 07 May 2026 09:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8845300CBEB
	for <lists+linux-ppp@lfdr.de>; Thu,  7 May 2026 07:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A78F3630A7;
	Thu,  7 May 2026 07:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0oCZPEWl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zLkk9fDV"
X-Original-To: linux-ppp@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FEA33B6F9;
	Thu,  7 May 2026 07:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778139655; cv=none; b=TcSE6kyCejjRWtQ12iRD5p16l76EJwxIJSd/nT8OTxBDkCGOB3WINs7V6oE8TA3PXBhJVA2xEznCgxqOK0imUXXnEZ+GkDG8tS7h1EnB2sV9BJv5/szPJaYyqOSIqjtx3p7lKjSDSuUSlMtcJoaSVtOVPLa5jGGfToQKBgGb6iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778139655; c=relaxed/simple;
	bh=o+LnA4jeP3t3ewYiAbawcbRTEZKZpSvcElrTCJ7WZ4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUNmKaMR8KUdAeIsQEQqui+M2eW+ilLR+KYb2REFjSaYWZ+WZF5sy5I4GtcOMsAEdd8TCwbnPzQLGehB5bUOB3hmgpOUg45wAFcHi6efi/JfvWWb/feTUrnKGdQULPxXJhc5YYpeO1jPzs/gVVlXZ0nVeaU06+kpYuMGWkJ7SjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0oCZPEWl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zLkk9fDV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 7 May 2026 09:40:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778139653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o+LnA4jeP3t3ewYiAbawcbRTEZKZpSvcElrTCJ7WZ4A=;
	b=0oCZPEWlaug3h8RTl81RQMj3VPRLLHxomb8NtddxGstnlrH8iccIro4YhGq+YTVXTb8gkc
	0oXwNf9gDTbO/8it3oKV5zJSa6+bXIRxLvLf11hZVXEpYPWfvZYTKh5IBfc/IrigDVRAkd
	AAIGupi5kcxMKfv34seC6jeg1rdwOGuvikA6hmtN5+TnxkX6WHpRgSkuj7TjxnhPuFGaLw
	VGUGbme1OsKzXLI1NFzv4OC6toJmPDOmTv65UJ5nHwqYLRlVUkFKBym/Kcmp7fhdfj5KOJ
	PJHitp8ACo8Ep7JXYfx9dKEMOg2I/jaf1sozJ+GZFAaJcYzMt5mtkNT0EF2U8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778139653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o+LnA4jeP3t3ewYiAbawcbRTEZKZpSvcElrTCJ7WZ4A=;
	b=zLkk9fDV4nxwu9n6abRNR4RuBgxwnWqHPkh79MYH7CL7hOjijFXi0/e7GuyQlAx8Fdt5rY
	kTW0oJwPng0/LHBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	David Sterba <dsterba@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Mitchell Blank Jr <mitch@sfgoth.com>,
	Chas Williams <3chas3@gmail.com>, Simon Horman <horms@kernel.org>,
	James Chapman <jchapman@katalix.com>, Kees Cook <kees@kernel.org>,
	Taegu Ha <hataegu0826@gmail.com>,
	Guillaume Nault <gnault@redhat.com>,
	Eric Woudstra <ericwouds@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Dawid Osuchowski <dawid.osuchowski@linux.intel.com>,
	Breno Leitao <leitao@debian.org>, linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net
Subject: Re: [PATCH net-next 2/3] ppp: unify two channel structs
Message-ID: <20260507074051.mqO5DaWL@linutronix.de>
References: <20260430090532.244758-1-qingfang.deng@linux.dev>
 <20260430090532.244758-2-qingfang.deng@linux.dev>
 <590d7931-02b0-45d6-8f43-ef909c9bde89@redhat.com>
 <c9993ee6-4023-4331-a1c1-4e30952146fe@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c9993ee6-4023-4331-a1c1-4e30952146fe@linux.dev>
X-Rspamd-Queue-Id: 6F8854E4313
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[redhat.com,lunn.ch,davemloft.net,google.com,kernel.org,suse.com,linuxfoundation.org,sfgoth.com,gmail.com,katalix.com,arndb.de,linux.intel.com,debian.org,vger.kernel.org,lists.sourceforge.net];
	TAGGED_FROM(0.00)[bounces-569-lists,linux-ppp=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	RCPT_COUNT_TWELVE(0.00)[26];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 2026-05-07 13:53:30 [+0800], Qingfang Deng wrote:
> > This patch is IMHO a bit too big and should be split. Also this kind of
> > refactor looks very invasive and potentially regression prone. I think
> > it should include a signficant self-test coverage increase.
> This is indeed too big. But how do I split it without breaking the build?

The current ppp tests would yell if you accidentally broke something?

Sebastian

