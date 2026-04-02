Return-Path: <linux-ppp+bounces-474-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFy2N7++zWlMggYAu9opvQ
	(envelope-from <linux-ppp+bounces-474-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 02:56:31 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BAC3821B5
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 02:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58C643037896
	for <lists+linux-ppp@lfdr.de>; Thu,  2 Apr 2026 00:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EF0263F5E;
	Thu,  2 Apr 2026 00:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asAYXoSu"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC132571D7;
	Thu,  2 Apr 2026 00:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775091383; cv=none; b=AALcSpKAyh1yDu0dzQl73udgaR+nUOqNn3/hgtn7V/szAvAu9vDw4nlwtdPLKh/Yn06IkhaGo62/cdaa/DychdyxA2VaWpjvsr8y/5srBD2LZPHHWYtOWTu5hwUvpJCWVmk1nBP1nw01CVnj6xsP6S8Tho43FU2Bd/o5u9zPWQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775091383; c=relaxed/simple;
	bh=e2QI+rIqwi6RKccJOXV7cRkQhyCjqCLDKS5ak4bJvZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OOIFlte0md2SP6eaLq/bYcG0LnMgAP22/l4HpuI6x0WE7lmnGg8hJv4DhdyiOFtOH4BK+1GqKCG53101IZbu2aVinzWd9wH4FOnGGWODPyJIYRuS/q61whlVkotzpXwAZwiZ8SCLHMmzEmMRVbZvgCzezWnT7Z+GxAMZv+wzNdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asAYXoSu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879D3C4CEF7;
	Thu,  2 Apr 2026 00:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775091383;
	bh=e2QI+rIqwi6RKccJOXV7cRkQhyCjqCLDKS5ak4bJvZQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=asAYXoSueduEx0vo4OQi1AoLG1Bd7JB/6fpnh2+O9ClU+dFEt0+P6Z+9XCib2zdtX
	 0cuVDG9Qi4VLhQ9IbYKMll0qlKdndYTPhQUTuhZ/CJLXrNucN9tH/19o42CTn8gn3b
	 ZWpAjZvw7hDWFfife0hfQwbOtnjBv+QmU6986gkUIt4yDPbbaHeBADdLbv2TJ60GSM
	 IM0K6y0J0ng2Com9yuPHW6CadPlkPbz27foLTZ9+Hn/8l77GtVtuyK9VXdNIC/cMau
	 uEpiWHyz+7rATpNWoN2HJMuiR8EGtFjXqSnW8p68X+lTfsvxd/mPodWHMwj3tP9LeC
	 rNJ7G3WZS3sPQ==
Date: Wed, 1 Apr 2026 17:56:21 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Felix Maurer <fmaurer@redhat.com>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>, "Matthieu Baerts (NGI0)"
 <matttbe@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH net-next v7] selftests: net: add tests for PPP
Message-ID: <20260401175621.549c492e@kernel.org>
In-Reply-To: <CALW65jahWApDnVmFReW+Y3HDxBEmCwzsT1oyh03SW7X5ry6PzA@mail.gmail.com>
References: <20260330035604.133073-1-dqfext@gmail.com>
	<20260401081030.29b050d5@kernel.org>
	<CALW65jahWApDnVmFReW+Y3HDxBEmCwzsT1oyh03SW7X5ry6PzA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-474-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pppoe.sh:url]
X-Rspamd-Queue-Id: 38BAC3821B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 1 Apr 2026 23:45:38 +0800 Qingfang Deng wrote:
> > # iperf3: error - unable to connect to server - server may have stopped running or use a different port, firewall issue, etc.: Network is unreachable
> > # TEST: PPPoE                                                         [FAIL]
> > not ok 1 selftests: net/ppp: pppoe.sh # exit=1  
> 
> It looks like pppoe-server fails to start. You may check the syslog to
> see what's going on.

Hm, we don't capture syslog automatically :S We capture stdout and
stderr

I'm not even sure there's something listening on syslog in virtme-ng
Is it possible to make the daemon log to stdout or a file and dump
that file to stdout on failure? Even if we fix the current issue
it will be quite inconvenient if we have to go into syslog every time
the test is failing. The test output should provide enough info to
debug failures.

