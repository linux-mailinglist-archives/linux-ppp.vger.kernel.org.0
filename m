Return-Path: <linux-ppp+bounces-476-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCN5CifazWmliQYAu9opvQ
	(envelope-from <linux-ppp+bounces-476-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 04:53:27 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF242382DB8
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 04:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2477D3052BBA
	for <lists+linux-ppp@lfdr.de>; Thu,  2 Apr 2026 02:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F24350285;
	Thu,  2 Apr 2026 02:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z22ZCEuT"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BC634A797;
	Thu,  2 Apr 2026 02:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775098322; cv=none; b=Rl00RsKHLkYH1oiY1oisRfuwAp9cji/W75n7MHvFT+IELnUR6FnzGQXgYxYCSISXQPp3gFz/E34UADd7neAA3noBZbvk8laiUbIymMywmJWYdb9V5uGAszUIey3tLNpZtugx59MmNfGQ29vMjL7TDc7EyWfpaSxIjAj4MntCAbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775098322; c=relaxed/simple;
	bh=JlFe5p1Rr6DbsmMsVteKHyCUbAaklj2Cad1tyjiluoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sH4O5a9znIsYZaShr68Lg8ZZUjK+v0i5q4Lv8hPSifUpBtL5YScfScQZHCEqJs3+AsE5o65ULDeKKGqc/FsI0SJpF9VfWgl16u28Bj6vDSlB+IhdKdQK0u60cOV8R7NG0aUlCvcDXxRx1oMpLmQMHuaXvZ2SmVl4e04OyL/nqwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z22ZCEuT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACEFC4CEF7;
	Thu,  2 Apr 2026 02:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775098321;
	bh=JlFe5p1Rr6DbsmMsVteKHyCUbAaklj2Cad1tyjiluoQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z22ZCEuTqh199yHh/wBF7ii4b90XeEJG9aiqBl5wEtKab3FztaSHmB1MjWVqt+DCp
	 W2Jm2SmhORhCJPsKp6VErpJVQwMkWB7+R1+bYKLkju2LE8WR+W/d/hOZncIfSzdbcA
	 q2N46AkJXCAB383B0q0JJiyIW8EJGu3rXvVfX+QqMHU2Fsg+qdEjtWDh3/ujcFzQDs
	 xW2UCNS7XbhMFGlGo105DmJKvfRNyWCJHPDyiSq6Hn3hTlqLD364oY6rxO1qp8HzL7
	 Gp0bydSXPBRTEWUYJcWHcY3bKWdMNKDzR/1AFH2GRT6huHW2gezO0poqFp+6a5FNUg
	 DST6cgQfkL4yQ==
Date: Wed, 1 Apr 2026 19:52:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Dianne Skoll <dianne@skoll.ca>, Shuah Khan <shuah@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Felix Maurer
 <fmaurer@redhat.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org, Paul Mackerras
 <paulus@ozlabs.org>
Subject: Re: [PATCH net-next v7] selftests: net: add tests for PPP
Message-ID: <20260401195200.34548957@kernel.org>
In-Reply-To: <CALW65jaTbaosbO8ypKZ6G37HxuxXabeTaP_Fhq72xTovmDj+8g@mail.gmail.com>
References: <20260330035604.133073-1-dqfext@gmail.com>
	<20260401081030.29b050d5@kernel.org>
	<CALW65jahWApDnVmFReW+Y3HDxBEmCwzsT1oyh03SW7X5ry6PzA@mail.gmail.com>
	<20260401175621.549c492e@kernel.org>
	<CALW65jaTbaosbO8ypKZ6G37HxuxXabeTaP_Fhq72xTovmDj+8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-476-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF242382DB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2 Apr 2026 10:26:11 +0800 Qingfang Deng wrote:
> Hi,
>=20
> On Thu, Apr 2, 2026 at 8:56=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
> >
> > On Wed, 1 Apr 2026 23:45:38 +0800 Qingfang Deng wrote: =20
>  [...] =20
> > >
> > > It looks like pppoe-server fails to start. You may check the syslog to
> > > see what's going on. =20
> >
> > Hm, we don't capture syslog automatically :S We capture stdout and
> > stderr
> >
> > I'm not even sure there's something listening on syslog in virtme-ng
> > Is it possible to make the daemon log to stdout or a file and dump
> > that file to stdout on failure? Even if we fix the current issue
> > it will be quite inconvenient if we have to go into syslog every time
> > the test is failing. The test output should provide enough info to
> > debug failures. =20
>=20
> Add Cc: Dianne
>=20
> I checked the man page of pppoe-server and did not find such option.
> We can instead start our own listener and redirect the syslog to a
> file or stdout:
>=20
> socat -u UNIX-RECV:/dev/log,ignoreeof STDOUT &

That should work for vng, I confirmed it doesn't seem to have a syslog
socket

$ vng -r
...
$ ls /dev/log
ls: cannot access '/dev/log': No such file or directory

