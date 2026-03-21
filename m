Return-Path: <linux-ppp+bounces-434-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id W+kSMbVdvmnxNgMAu9opvQ
	(envelope-from <linux-ppp+bounces-434-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Sat, 21 Mar 2026 09:58:29 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBC02E4457
	for <lists+linux-ppp@lfdr.de>; Sat, 21 Mar 2026 09:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6731D3011164
	for <lists+linux-ppp@lfdr.de>; Sat, 21 Mar 2026 08:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392AF2D238F;
	Sat, 21 Mar 2026 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4gZV1CA"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A122550AF;
	Sat, 21 Mar 2026 08:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774083506; cv=none; b=VAhb2f7wGcbezFlwnqEMkeVUt7cz+kVcaLhuTvn/9agiCRFgsV+BwGlX29CrjzcEh9GHs3m5PdfXPwkl994Z2VxbFsALTDvl4fUugSl3GuawhzR7QXwNKgr21HijhIjvZyS6yVV608R/23szXeEh5Jqp4NwGJuVNv+qpkaSMDEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774083506; c=relaxed/simple;
	bh=X0l86Q/FsTDOlq3OiuWxtwnJacrqKs2tW0wtjaEiE9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSI6JibciBuidUwreDCP9N/51NUvhTdA+0AyXRnuI8skUyoxl0HLH7yxdXlm8F4vh7GwS+HPoLMS3nxqz2BgciPbiYqb+eiL2/zJtyPyggmc2IK/tkvVW87JjSwk6Q7Aj87c36nIKaUoFXr2g6P8uZf4HK0luE5Od77ohIgFK/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4gZV1CA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59663C19421;
	Sat, 21 Mar 2026 08:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774083505;
	bh=X0l86Q/FsTDOlq3OiuWxtwnJacrqKs2tW0wtjaEiE9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S4gZV1CAp6hr8I1eFdbVQzStMcXlScsBtWun0XPrHz2JVxbvmFfgoch+AUgEJLrbs
	 LC/GzY5FpMaLj4QjkXpl50/TOlt+/hTC/gAKJGxWlQ2fhNRJd6wVXXtxvPHSueGIC/
	 LI1jkilThsMLIW92GhDjMoUAEFh9sGNYbbhiKK/Cot86OV0u+lzdfSaK2jSDNTowWW
	 eVjC4l1vi9cODbzRArMHUO4oHr+eT65TzmhD97QZ9BT5mohkkLJ34mhcCuMHaj6e4J
	 brVgfFB/lEMiG08OlFr5UabDkYrPjMrDlZq954O2UDbKVIdwCQ05zGgQMWsj4uybtw
	 REpLHFyOb1EOw==
Date: Sat, 21 Mar 2026 08:58:20 +0000
From: Simon Horman <horms@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
	Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH net-next] selftests: net: add tests for PPP
Message-ID: <20260321085820.GO74886@horms.kernel.org>
References: <20260320071755.483733-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320071755.483733-1-dqfext@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-434-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-ppp@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ppp_common.sh:url]
X-Rspamd-Queue-Id: 5CBC02E4457
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 03:17:54PM +0800, Qingfang Deng wrote:
> Add ping and iperf3 tests for ppp_async.c and pppoe.c.
> 
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
>  MAINTAINERS                                   |  1 +
>  tools/testing/selftests/Makefile              |  1 +
>  tools/testing/selftests/net/ppp/Makefile      | 15 +++++++
>  tools/testing/selftests/net/ppp/config        |  8 ++++
>  tools/testing/selftests/net/ppp/ppp_async.sh  | 37 +++++++++++++++++
>  tools/testing/selftests/net/ppp/ppp_common.sh | 40 +++++++++++++++++++

Shellcheck flags two issues in ppp_common.sh. As we are aiming
for new tests to be shellcheck-clean I'd appreciate it if you could
look into this.

My suggestion is that SC2148 can be addressed by adding #!/bin/bash
to the top of the file.

And SC2153 can be suppressed using # shellcheck disable=SC2153 

For reference
+  https://www.shellcheck.net/wiki/SC2148
+  https://www.shellcheck.net/wiki/SC2153

...

> diff --git a/tools/testing/selftests/net/ppp/Makefile b/tools/testing/selftests/net/ppp/Makefile
> new file mode 100644
> index 000000000000..d2cbd6099255
> --- /dev/null
> +++ b/tools/testing/selftests/net/ppp/Makefile
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +top_srcdir = ../../../../..
> +
> +TEST_PROGS := \
> +	ppp_async.sh \
> +	pppoe.sh

Please add a trailing " \" to the line above,
so it won't need to be modified if another item
is added after it on a new line.

> +# end of TEST_PROGS
> +
> +TEST_FILES := \
> +	ppp_common.sh \
> +	pppoe-server-options

Here too.

> +# end of TEST_FILES
> +
> +include ../../lib.mk

...

