Return-Path: <linux-ppp+bounces-396-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIHJATYZl2nKugIAu9opvQ
	(envelope-from <linux-ppp+bounces-396-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 19 Feb 2026 15:07:50 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C21615F55E
	for <lists+linux-ppp@lfdr.de>; Thu, 19 Feb 2026 15:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1EC7304D17F
	for <lists+linux-ppp@lfdr.de>; Thu, 19 Feb 2026 14:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F87733B6E8;
	Thu, 19 Feb 2026 14:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TXP4YR1Y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="q422zGdR"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB8533A6FB
	for <linux-ppp@vger.kernel.org>; Thu, 19 Feb 2026 14:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771510016; cv=none; b=ocfMBRLaw5PnPqiva8koJGpugBMtA554RxI5HVhn27xU0WdOSrUUGX8kg5OU8QvzWgkFWz6JL3Ah6wlk2yeBBl/SRHgmh9HmIRnuhdkY9w2/ianIxw1GvxwNV/ZZtr7rcPrrF1mJqbP8BGwuIeV4HWWinnd7HmvEirCU1TFZWbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771510016; c=relaxed/simple;
	bh=jbwjG+wlfbHA1sBVc4a/Lk42FcEv/YYGo1s4g4cDdEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfMNxSvlV6AQB6ocoRHZOcN0KARLbLgCRiEeLdwDk5IEVXz1bkN1VhIo2c7JPwV8jpR5KhT6wF9uigbCCyH8fniPm2r/d6zU2ERBCJsLkU4cuUYo3OBFD5sZ2mLw0TT6ewengzsxDbijMAzS1lOUWV7jKHrwGA8xhGlhU4Mkazs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TXP4YR1Y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=q422zGdR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771510014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qHS6NPE0XCB+V5xU3uCNJPVD0Vb+HittHqs9HXFDi8M=;
	b=TXP4YR1YRhziTXrzQoCXCu4aoDcnDo9lvSChbkT/Z0Ijp+erD8YiadWMUh6S0WgmhSMHlv
	WZg75BI6/ljUbi0uOy37eexKlDnQnF2VK0E5hntOoW91lHTHPDWinRs64WnIiTrQvemwt3
	hCm0XNkjI/N7OEUQZqeGBjWQHDl3/YE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-3D9d9yHDNlOXyJxycxj_bg-1; Thu, 19 Feb 2026 09:06:52 -0500
X-MC-Unique: 3D9d9yHDNlOXyJxycxj_bg-1
X-Mimecast-MFC-AGG-ID: 3D9d9yHDNlOXyJxycxj_bg_1771510011
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4836abfc742so6801585e9.0
        for <linux-ppp@vger.kernel.org>; Thu, 19 Feb 2026 06:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771510011; x=1772114811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qHS6NPE0XCB+V5xU3uCNJPVD0Vb+HittHqs9HXFDi8M=;
        b=q422zGdRI+aLHYzCk33aZ+wg0/455ah4bH7Oa86jecmOjsuWnXhBkXfzzxKcGvs8j3
         y5s1kRN02rGbhBhHLN2MgB45NPMuhjt6qQLL0j4OsgE6hcE/0JU6A8o+ex4/4z8rZubS
         lyox9pi4ktdChXX/aTucjbd+158/3+YDlMNapftHsRnsaahhQBGdnMwI1+mC4Fs7HzY4
         9YwNlVwfgy3HXmprURsiCn8z4N7MWYR8gtCyHQ6XnJkzhbMiaJFEiDwp/Xg9Ql+tUmuY
         T7M9XqNyNdbBw8YsSHpR4Kkwco3db99U4y0tM02v2sp/rizzc+49dJ34yXCWNjVhUxwA
         ubIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771510011; x=1772114811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHS6NPE0XCB+V5xU3uCNJPVD0Vb+HittHqs9HXFDi8M=;
        b=mvYuFJBhUFLftKmfRxp/ySkIKPthgiE/ftH2cKB0bk0o5iiaZCStKdPbQKNmDJiFOq
         ErbnNjhwVQGrhD2FJ7mzuZWsDrX1VArVEnbYZPCZ2dJr+rYXuqxpOCyBFnmgOXEY80eC
         aCFVkScenIyZ1EfhGqz8StnIsvRWCr4cbUuAmdLmmPAfkNWg0prL1b5uQHqY2HSMegZF
         qDx+PcmLEDnleY6VBD2DUbUVnxX5S1j9CInyM8TsqwpEfD9q4ozqJkaVnx+esSykCtrc
         h5+KN0D3Le45FFsSjHYc6I3NPSX3gPFO7YFlZIB5PTCnw6wrKq1h+YCdFtaMRUXKVDZq
         QuQw==
X-Gm-Message-State: AOJu0Yxx5moH14HgRiTfrbzxkmAxcTX6WjhNMqUOaJ9F9CbzqIUeBBx1
	sD+VeZDGTtVII1Uk09+YWFl06Rp8gSPFyIyXQpC0ycp8ZvyLiHj/5NWn6LHy21XDHVpCFkSwxCx
	bL/E5VtpOIGWKBUp7ZGACh9XXGqOFqXPi4xhSpmIxZyOtKaEtOTSTEftOq9Iygw==
X-Gm-Gg: AZuq6aKNXigliIBmjDVafzDSIrUNwCdl6lxqWYbaAa8FFXwoeHItc5dY7Y/jGq1vG8i
	BeMnXBM8QXaBHYP87we8657N+g1+IwHgSjRsS3mLqE0X5SIIQKQlfWZXn1NBy5TKAFqr5rBX16q
	v8TGWvrcCrMpMeH6iT2C5vqD5QDvvS2USgjnYS2XvjbsVGkjAHynpvuiblzV7ufidAAJCEA1QrN
	V/k+fypMa7is/ltgIaqe7Ip/cXRHkwtLieRtH+QBwhBXAN3JUt4Lm1WVDFZLekC3RKOGypN3JO+
	oUtnmwwv4VII27imjxB1EjEyylCf4XTtqWUM81nudOd6isGGUIqmNOVStd+8tSmbrI+YQITEriU
	h2yWe0vBqdQ==
X-Received: by 2002:a05:600c:548e:b0:480:6dff:e786 with SMTP id 5b1f17b1804b1-48379bff816mr296563765e9.37.1771510011120;
        Thu, 19 Feb 2026 06:06:51 -0800 (PST)
X-Received: by 2002:a05:600c:548e:b0:480:6dff:e786 with SMTP id 5b1f17b1804b1-48379bff816mr296563195e9.37.1771510010565;
        Thu, 19 Feb 2026 06:06:50 -0800 (PST)
Received: from debian ([2001:4649:fcb8:0:7ef1:6110:bb21:b83a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b1d79sm16276135e9.3.2026.02.19.06.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 06:06:49 -0800 (PST)
Date: Thu, 19 Feb 2026 15:06:46 +0100
From: Guillaume Nault <gnault@redhat.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-ppp@vger.kernel.org, Michal Ostrowski <mostrows@earthlink.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michal Ostrowski <mostrows@gmail.com>,
	Dianne Skoll <dianne@skoll.ca>, Paul Mackerras <paulus@ozlabs.org>,
	Jaco Kroon <jaco@uls.co.za>,
	James Carlson <carlsonj@workingcode.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RFC net-next v2] pppoe: remove kernel-mode relay support
Message-ID: <aZcY9l35A-Yw8NYH@debian>
References: <20260213091605.132561-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213091605.132561-1-dqfext@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-396-lists,linux-ppp=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,earthlink.net,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,skoll.ca,ozlabs.org,uls.co.za,workingcode.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gnault@redhat.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C21615F55E
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 05:16:04PM +0800, Qingfang Deng wrote:
> The kernel-mode PPPoE relay feature and its two associated ioctls
> (PPPOEIOCSFWD and PPPOEIOCDFWD) are not used by any existing userspace
> PPPoE implementations. The most commonly-used package, RP-PPPoE [1],
> handles the relaying entirely in userspace.
> 
> This legacy code has remained in the driver since its introduction in
> kernel 2.3.99-pre7 for over two decades, but has served no practical
> purpose.

Also, this code was broken since its inception up to 2016, as it did
leak a socket reference in the normal data path (see commit 29e73269aa4d
("pppoe: fix reference counting in PPPoE proxy")). The bug was caught
by code inspection, which strongly suggests that nobody tried to use it
before that.

> Remove the unused relay code.

Reviewed-by: Guillaume Nault <gnault@redhat.com>


