Return-Path: <linux-ppp+bounces-458-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJSdIAeBxmnQLAUAu9opvQ
	(envelope-from <linux-ppp+bounces-458-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 14:07:19 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D96344C2E
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 14:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2B223168215
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 12:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC273BA24F;
	Fri, 27 Mar 2026 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eHx/pxhM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pnMWSKA+"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5758399013
	for <linux-ppp@vger.kernel.org>; Fri, 27 Mar 2026 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616331; cv=none; b=Irra/176eCPAqDCaJMggIKv0EynZvQNaSkz/nbDlKlD4Q5c+86gER2p6dE7DMQ8V85uP31/uQVKaI74lIdotrLcMZ/rPK1KeIuPJzMbQyqXptj+dr8mFXWtTdlBICBemgWqjNB8BOVHxvjVRAUgKZprK03dFmIuGZ2BsPEZh3ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616331; c=relaxed/simple;
	bh=T/MncoWZVwS48wLOvcaP5pmO5KoCebx4I8w5SbYrRow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/AmGjN0Wkj/QkjxzqZsXevRkPR/wNllFK5A3Mv/kDfTPGTuxM1gPyaFrpOgDQbHGUIRQtsaQDFBmQC/PWuCzl/Zj3yDGyvhWg69GGKKg793cAv+3AQJzHVhresvklHJ2LRPyRBQgQ3qKUN0neEhAqZBarz7UhtFgzfPUtR1WHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eHx/pxhM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pnMWSKA+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774616328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xhz+6dozSsvrLdg2FUPvcHN2R/yxft2xWhen9c3tayI=;
	b=eHx/pxhMv6g/Wkz6PTOdRXWrxYEQVrePQDEou4SS2U1/0Qf7Z3+fZUrUa68/2aJ1Vpg179
	qoWBUNNk1SeoyhJewBKZgjh8WpTnJRG6NAzgdkrhDwpjX14LSU67mGHEtuzuPCzJLg8Mbr
	VPQXUp0+yl6Tu+UHtmCTdAWAnGq8BkA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-RUEeyt4CMIKECHwa2UK5DA-1; Fri, 27 Mar 2026 08:58:47 -0400
X-MC-Unique: RUEeyt4CMIKECHwa2UK5DA-1
X-Mimecast-MFC-AGG-ID: RUEeyt4CMIKECHwa2UK5DA_1774616326
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43b8f23bdc7so734189f8f.3
        for <linux-ppp@vger.kernel.org>; Fri, 27 Mar 2026 05:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774616326; x=1775221126; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xhz+6dozSsvrLdg2FUPvcHN2R/yxft2xWhen9c3tayI=;
        b=pnMWSKA+hGjYZ9CoXOfasqoeJE+S767+gz7suvfWUIH0aNICqAJklTfoA2r0sPxt+O
         7PJwuiX+4eH3ORnI78TaUvzHrzoHlSgn3I7bH0fvr+qzdoH7NM47L3H8iIhP7BG+65mn
         9CWtFwv+jt1P0rdp0tuIv1TOIi4nKlinUqOV5eZ/SAI0uaCwMswZ+vWOUYp4+/7JwGbM
         cpKW2cUmjODk0RnKxbyHSEUtfCSSmQNkBxjLVDwvvmxyELOnKkNbyWBPK9VYCdoANI7a
         e2hK7f5nXfa3V/ppsfkhvJSbMPudcVwuH2Em29IWG7esY/aKkKnabW8FN10M51rfJNyN
         JEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616326; x=1775221126;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xhz+6dozSsvrLdg2FUPvcHN2R/yxft2xWhen9c3tayI=;
        b=gwRXoVfUzAz3zc70j/SjX3w/9OhniugZGHZsyKEC1WrNErnUSFVxS4cgTI/MNhz3iR
         7g/ZlxEhTnW6iYGoUqk5H2Uv6YMQW8xffrYC0gwZ5yLCtbAkypiFkwa8SU7zUg6DBue1
         Eaqkd3dXMXO1g7xUqPp/qVc8UMLLRnN1C1DqU+5ToewY1RanS4z0SNm8OF347fnzHaLU
         D8ZkvtYdJvM6baYY7XvXflgCpEXCqkpuNSxzLxyBxv1HW3Q0CvdZfLV1uXj941G7xASr
         e2uTi+IMLglHVihjA6kWml/w18iPXOXNbarprmgOtpuIQTAT13hT6nzXQRwp8SEBwGwT
         ShIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV714RK9j0Pww97+rLQXb1NPQ2DT6/61FC49OLNqzDh1pGswWJz6zgchElSFD7LbikOwXqdxE+VjAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhOzpKmts03rB7iaQTwGt7+r9oCEtx4HZTLNqWianKswQS9xo+
	WKXpoTxAWqk78uwB3gzX0pFHOwMN0PWoPZ9D4IEsplBT9iZUelH6MI0kCRj+z7B7ui9QtNxcM0p
	S9w81y5MPRhsYrCrPm0X03E/X1lsMn8/81Dqt3TqINY7hyTw2lQMbv4rd2d/ANQ==
X-Gm-Gg: ATEYQzzTfmliDTg1STo7HjfZ54BxxGPcOzAfcMEmIN6HeaO6Hi+U+N6MkRacBV0WYjV
	tXiHrPRN9qagpYbpFageJbl2aXxCyMHOudf6To6xy9XTSyMYi91IxxeiPxzIdEo7bVTnkVwfOt4
	U5eSm1qRae1LNZf4IzAObxT1CGh7OvZJmFRp0jh9ur96FhGV0zODjjC3BqIcqrP4/WmulfFptbl
	Uh7bMp3VkXqHCktp4x5zcpYpj9HkBib4IBmml0Vq5QGvAyxzqi8ZrmQyrAon7HWyFPaApSbwhDO
	sUTZ74f81gbofF+0VQnodR5dUNk+uU5U8Kyk5Pvw8Tpgh0EbMuCS2TfMWVECL/rre4Hh9LRr8sw
	yA23ZKAjksPw4XyPu0vCZ+xBAy+sHwLI4zAtJMe78ap3PUb07YsyX5bGJEjWUnXW5lkKOp2ANlg
	==
X-Received: by 2002:a5d:6107:0:b0:43c:482b:afc1 with SMTP id ffacd0b85a97d-43c482bb099mr289815f8f.36.1774616326276;
        Fri, 27 Mar 2026 05:58:46 -0700 (PDT)
X-Received: by 2002:a5d:6107:0:b0:43c:482b:afc1 with SMTP id ffacd0b85a97d-43c482bb099mr289762f8f.36.1774616325794;
        Fri, 27 Mar 2026 05:58:45 -0700 (PDT)
Received: from debian (2a01cb05923c9a002e69015071700bd3.ipv6.abo.wanadoo.fr. [2a01:cb05:923c:9a00:2e69:150:7170:bd3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919dfb54sm14881269f8f.31.2026.03.27.05.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:58:45 -0700 (PDT)
Date: Fri, 27 Mar 2026 13:58:42 +0100
From: Guillaume Nault <gnault@redhat.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Felix Maurer <fmaurer@redhat.com>,
	Antonio Quartulli <antonio@openvpn.net>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
	Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH net-next v4] selftests: net: add tests for PPP
Message-ID: <acZ_AgXhJVyUT_yj@debian>
References: <20260326021642.29170-1-dqfext@gmail.com>
 <20260326081304.xKa7-s_1@linutronix.de>
 <CALW65jYdzn_rZWa2zwYd5J+Gd=kyaGMsVFyX0fMJfKfgULMO6w@mail.gmail.com>
 <acZp3gRUqVIbw9yb@debian>
 <CALW65jZNi3oA7V7at_Jr5Vr4AdL03JYdA9WeK5G7cNr-XS2Bvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALW65jZNi3oA7V7at_Jr5Vr4AdL03JYdA9WeK5G7cNr-XS2Bvg@mail.gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-458-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gnault@redhat.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:email]
X-Rspamd-Queue-Id: 16D96344C2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 08:39:11PM +0800, Qingfang Deng wrote:
> On Fri, Mar 27, 2026 at 7:28 PM Guillaume Nault <gnault@redhat.com> wrote:
> >
> > On Thu, Mar 26, 2026 at 04:26:23PM +0800, Qingfang Deng wrote:
> > > Hi Sebastian,
> > >
> > > On Thu, Mar 26, 2026 at 4:13 PM Sebastian Andrzej Siewior
> > > <bigeasy@linutronix.de> wrote:
> > > >
> > > > On 2026-03-26 10:16:24 [+0800], Qingfang Deng wrote:
> > > > > Add ping and iperf3 tests for ppp_async.c and pppoe.c.
> > > >
> > > > Oh thank you for doing this.
> > > > I haven't look in detail but this cover the "invalid loop" cases that
> > > > ppp tries to catch?
> > >
> > > By "invalid loop", do you mean transmit recursion?
> > > https://lore.kernel.org/all/20250715150806.700536-2-bigeasy@linutronix.de/
> > >
> > > AFAIK, this can only happen with PPTP or L2TP, which were not included
> > > in this patch.
> >
> > The problem was originally reproduced using L2TP, indeed. But I guess
> > that it could also be reproduced with PPPoE by using a UDP tunnel
> > device like VXLAN (like sending a packet through a PPP interface,
> > handled by PPPoE, running on top of a VXLAN device, that routes the UDP
> > encapsulated packet back to the original PPP interface).
> 
> Yeah I've thought of that also. It can technically happen, though
> there's no practical use. For self tests purpose, I may just add the
> recursion test into PPTP or L2TP tests.

Yes, no problem.

> Regards,
> Qingfang
> 


