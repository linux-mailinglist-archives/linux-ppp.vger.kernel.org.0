Return-Path: <linux-ppp+bounces-471-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAPVFyrby2lHMAYAu9opvQ
	(envelope-from <linux-ppp+bounces-471-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 31 Mar 2026 16:33:14 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4728F36B042
	for <lists+linux-ppp@lfdr.de>; Tue, 31 Mar 2026 16:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B63093068CF5
	for <lists+linux-ppp@lfdr.de>; Tue, 31 Mar 2026 14:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB253FADE3;
	Tue, 31 Mar 2026 14:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=skoll.ca header.i=@skoll.ca header.b="F+kOVDit"
X-Original-To: linux-ppp@vger.kernel.org
Received: from dianne.skoll.ca (dianne.skoll.ca [144.217.161.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A003F8E03;
	Tue, 31 Mar 2026 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.217.161.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774967141; cv=none; b=mBJMDKuiKVxUZzFJHLA86gqbzvObAOcvD7qcUSm+EP+a1/18sTDg5ZXI+IkNpIaFl5KRNl3aZdLadvNFx0Ax5nHJr0V/qkOxBFSUDsaMjcCDB3PpXkHzsYAQt8QNMq5BZufp+BJ2Yg03VqqJmC2FZgz+IIS2nQepjZWY2uW3txg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774967141; c=relaxed/simple;
	bh=U5uM51uyVywz0Ku3+6t2AG2QfNtCodrg01eurmUPSo8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=crEOHVIxQoqRHs1razT+O9QYaVpw6i7c8U7TOR/pm9jO+t0gvJ4W6tPpGdaK7VYrW+VwCwqF+owitr0r3rco9S5M766OlZ/P8UdiJEVS+dDDxeb/8hz8Goxn7GDKjJr26oFNEThtECuI2PxiihgKvcfV8Vciu7NJ+FXy2aBxlqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=skoll.ca; spf=pass smtp.mailfrom=skoll.ca; dkim=pass (2048-bit key) header.d=skoll.ca header.i=@skoll.ca header.b=F+kOVDit; arc=none smtp.client-ip=144.217.161.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=skoll.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skoll.ca
Received: from pi4.skoll.ca ([192.168.84.18])
	by dianne.skoll.ca (8.18.1/8.18.1/Debian-6) with ESMTPS id 62VEP91q825675
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 31 Mar 2026 10:25:10 -0400
Received: from gato.skoll.ca (gato.skoll.ca [192.168.83.21])
	by pi4.skoll.ca (Postfix) with ESMTPS id 4flVks1M0SzdZY88;
	Tue, 31 Mar 2026 10:25:09 -0400 (EDT)
Date: Tue, 31 Mar 2026 10:25:08 -0400
From: Dianne Skoll <dianne@skoll.ca>
To: Jaco Kroon <jaco@uls.co.za>
Cc: Qingfang Deng <dqfext@gmail.com>, linux-ppp@vger.kernel.org,
        Andrew Lunn
 <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo
 Abeni <pabeni@redhat.com>, Eric Biggers <ebiggers@kernel.org>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Mackerras
 <paulus@ozlabs.org>,
        James Carlson <carlsonj@workingcode.com>
Subject: Re: [PATCH net-next] pppoe: update Kconfig URLs
Message-ID: <20260331102508.2eb6dce8@gato.skoll.ca>
In-Reply-To: <1bba860e-a204-4a5b-9b8f-4d55a559d01e@uls.co.za>
References: <20260331033303.5664-1-dqfext@gmail.com>
	<0aa6aa20-0e2a-48e9-8273-53b2fecd287b@uls.co.za>
	<20260331091655.30212333@gato.skoll.ca>
	<1bba860e-a204-4a5b-9b8f-4d55a559d01e@uls.co.za>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skoll.ca; h=date
	:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=canit2;
	 bh=00IX2/FPj4y7ZScMI81Y5QFxmS44uuUj/r6XE4KfdQ4=; b=F+kOVDitfAgI
	UcjOIi/bfiaYiuxz2Pr2IDV6kAlR7NPGZ7BC4gdWET+ns0TjwnsG5biq7yUpDO/Y
	ujepG4vjaTgu9Xk+p/vGB+0jaYTyQ+BqlWj0kBfG/EKHrgJQb4meo0pVIJniwat8
	+0inZ2IBXsQ2E48MK+72sN6n9GTP0hvB25R9HALEriJ7TYjpmdX3NX6dVACCFANu
	Hz/hB8dOHNxiur0IpYleywnRKr66HQVkPy23o9xI2tOHqiosx/XqH0RhUhysMDYS
	rw2wccVzlULFakF7quUk1qwSFheQ633zg1iFv2kXEz6U6LqYOIlW5dKXL8cMfjjK
	GFMJiugYGA==
X-Scanned-By: CanIt (www . roaringpenguin . com)
X-Scanned-By: mailmunge 3.20 on 192.168.83.18
X-Spam-Score: undef - relay 192.168.84.18 marked with skip_spam_scan
X-CanIt-Geo: No geolocation information available for 192.168.84.18
X-CanItPRO-Stream: outbound (inherits from default)
X-Canit-Stats-ID: Bayes signature not available
X-CanIt-Archive-Cluster: tWKWaF/NcZkqjWIj0BEJTBHJhwY
X-CanIt-Archived-As: base/20260331 / 01gVqp93O
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[skoll.ca,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[skoll.ca:s=canit2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,ozlabs.org,workingcode.com];
	TAGGED_FROM(0.00)[bounces-471-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[skoll.ca:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianne@skoll.ca,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,skoll.ca:dkim,gato.skoll.ca:mid]
X-Rspamd-Queue-Id: 4728F36B042
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, all,

> My bad, my apologies. It was the userspace code you dropped then, which 
> does NOT require the kernel options?

I was considering doing that, but I kept the userspace code.  The reason is
that on some platforms, such as uclinux on a processor without an MMU,
the dlopen() system call is not implemented, so there's no way to use
a plugin with pppd.  One user asked me to keep the userspace code, so I
did.

But you are correct in that 99.99% of Linux users will not need to download
rp-pppoe if all they want to do is connect to the Internet using a PPPoE
client.

Regards,

Dianne.

