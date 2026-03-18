Return-Path: <linux-ppp+bounces-431-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MknJ1J7ummTWwIAu9opvQ
	(envelope-from <linux-ppp+bounces-431-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 18 Mar 2026 11:15:46 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5862B9BB2
	for <lists+linux-ppp@lfdr.de>; Wed, 18 Mar 2026 11:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30CE930A318A
	for <lists+linux-ppp@lfdr.de>; Wed, 18 Mar 2026 10:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6322139184A;
	Wed, 18 Mar 2026 10:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0k4XASj"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8E338F95E;
	Wed, 18 Mar 2026 10:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773828707; cv=none; b=aICCpzCyoXoL8KZMmud0Cgk809VwNvOcJUZbErsehyPpec6exbVBMu3U124/vxajsauQ8qKb/dy3V0l+/W5mhqcQINPZ1WBega7ga/cf6lEOvoUP/2MS5bVwppKA3CEC0AsqhKXYSVSNBvlcl6NvuaxaVypYs1HrutSFmIiGy+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773828707; c=relaxed/simple;
	bh=IS3a/sOENE8SgknLtoECPSOF+09XakF4xL8C7Jf9gJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCmdBhiJXIZYeY66peT1rD7Agpv5h2qFcDIeJxoJ5kTW7hXMyaCKHxJwF57tYZkakwuZC2cfAR5Zcp0/DgbSlK+YxkSslWwJ6MkyG8EOnH5d70en+VbWIOxf2PmWHs+zNgWylyG1wPQXPPGD2rkrBCsYR0KOy/9Rb7hrO8h3uXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0k4XASj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33861C19421;
	Wed, 18 Mar 2026 10:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773828706;
	bh=IS3a/sOENE8SgknLtoECPSOF+09XakF4xL8C7Jf9gJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f0k4XASjuVzN0EN7x6z+KGxi2BHOTbdAbbDTVq2llgR2viO3UqGRYHYS9fDjUlO49
	 zxw8hfrDkmM7AFDPUmxrmu9tmJM07eH1GXnPibU8auuFuSu1GQ/1/DqY9Ary58mJ+D
	 AM+rN3tX3aZkkH4jKZHLcODqJJ6mrcJ6i74sO8ISNbadThas28vT6eYX/Aabb6rQ0y
	 cqbRKP0qKy7omXh7d1te0KsbkiSH5ub2D1k3lbrrgc+56aUOvA7NqJZ/5ZBNrx6Sq3
	 TGWPyevEyHldREQFsaqTpb+J60rXBVGEd3Eny3Z3nAKVWvXzButyHXuZbVNAQp+Jju
	 nNoYJg3b+sI5g==
Received: by pali.im (Postfix)
	id 404A155E; Wed, 18 Mar 2026 11:11:42 +0100 (CET)
Date: Wed, 18 Mar 2026 11:11:42 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Martin Olivier <martin.olivier@live.fr>,
	Qingfang Deng <dqfext@gmail.com>
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
	Paul Mackerras <paulus@ozlabs.org>,
	Guillaume Nault <gnault@redhat.com>
Subject: Re: [PATCH net-next v2] ppp: add IFLA_PPP_UNIT netlink attribute
Message-ID: <20260318101142.6uzqxyyjsazfeirk@pali>
References: <PAWP192MB2411A808BB36F0086A9B00B99742A@PAWP192MB2411.EURP192.PROD.OUTLOOK.COM>
 <20260318015937.239409-1-dqfext@gmail.com>
 <20260318100738.vcnp7kntuzavyula@pali>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318100738.vcnp7kntuzavyula@pali>
User-Agent: NeoMutt/20180716
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-431-lists,linux-ppp=lfdr.de];
	FREEMAIL_TO(0.00)[live.fr,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pali@kernel.org,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[live.com:url,live.fr:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1B5862B9BB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello, I was not able to send my previous message to Martin. It failed on error:

<martin.olivier@live.fr>: host eur.olc.protection.outlook.com[52.101.68.24]
    said: 550 5.7.1 Unfortunately, messages from [172.105.4.254] weren't sent.
    Please contact your Internet service provider since part of their network
    is on our block list (S3140). You can also refer your provider to
    http://mail.live.com/mail/troubleshooting.aspx#errors. [Name=Protocol
    Filter Agent][AGT=PFA][MxId=11BD098F3639132A]
    [DB3PEPF0000885E.eurprd02.prod.outlook.com 2026-03-18T10:07:44.206Z
    08DE84C79B425097] (in reply to MAIL FROM command)

Can somebody forward my previous email message to Martin and ideally
mention that error?

