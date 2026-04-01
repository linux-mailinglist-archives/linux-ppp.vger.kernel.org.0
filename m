Return-Path: <linux-ppp+bounces-472-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULNCLQc8zWn5awYAu9opvQ
	(envelope-from <linux-ppp+bounces-472-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 01 Apr 2026 17:38:47 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C7237D45F
	for <lists+linux-ppp@lfdr.de>; Wed, 01 Apr 2026 17:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D3CBC302BA0D
	for <lists+linux-ppp@lfdr.de>; Wed,  1 Apr 2026 15:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567CE372678;
	Wed,  1 Apr 2026 15:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUjewFnI"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327702EC083;
	Wed,  1 Apr 2026 15:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056237; cv=none; b=Zg9ODoFqhfoAE7TPGzJEt3vpN4MCrU5iOAkJrCzvsHbAfntjYaYUo+ziaDNX3eIow2k+LV6l9fniY5dgTCENargm90MUXRSRZU5DIeKEXvdDWZj81HcfurCvvFRBl4udgeromjTJDC1iLyvunxG8gWZy5BIMxcIAJi2vzBS6okI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056237; c=relaxed/simple;
	bh=dUggK2Z/RSrKdEz6hBYx2oKXZ3+aAG/sQMXxAisukQI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cch/5PJGB62Q/c1q0Ma/AGEdMqUTo7UyMBXTDQYG2aEi8J6laG1ae8j3cLGoNDqY3cQbKg/3KUZ8UfDB6TVJ+vZJ9hFK5MnICgj2xa0pBEguDGIoQV+tR5zDAow8F4QAZ0opXHUcMFhmwLhoEVncQu53UekqF2OXeAyZEQD8+sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUjewFnI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D9CC4CEF7;
	Wed,  1 Apr 2026 15:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775056236;
	bh=dUggK2Z/RSrKdEz6hBYx2oKXZ3+aAG/sQMXxAisukQI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pUjewFnIw1dEO/HoyUnIlPpT/EXB3rDKVXq8QsyJcQbZ2n11gtq78vY6nEWyt/ps2
	 EoPPhSMG4L45fOU+g4qdfm8ki+TdXUhh4tzG+/YmwBM67epDfRFBTGjvvplRutOD1+
	 vM8Zk9VV9G8Gc/acPFk7gturlK8p8igwfBrzc5hUO4x2RJHd100hnGNvLRQwPZm7Ot
	 DqDCiprJvjA9HHiPGOyz9niIpsD7Xd3eJrR2b4+IQk7qtvz17UXWYP7p+mKWEF4V8x
	 6sKfRAFxO/IiQN8xmDOv9kmdxfDRNtVX786/KwN10brmBO9/AYtnqvD4qYHDFJ/5vZ
	 Ga+fXiqXEU1RA==
Date: Wed, 1 Apr 2026 08:10:30 -0700
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
Message-ID: <20260401081030.29b050d5@kernel.org>
In-Reply-To: <20260330035604.133073-1-dqfext@gmail.com>
References: <20260330035604.133073-1-dqfext@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-472-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pppoe.sh:url,pppoe.so:url]
X-Rspamd-Queue-Id: B4C7237D45F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 11:55:44 +0800 Qingfang Deng wrote:
> Add ping and iperf3 tests for ppp_async.c and pppoe.c.

Hi! I added the new TARGET to netdev CI, the pppoe.sh test does not
seem happy:

# timeout set to 45
# selftests: net/ppp: pppoe.sh
# Plugin pppoe.so loaded.
# PPPoE plugin from pppd 2.5.1
# Send PPPOE Discovery V1T1 PADI session 0x0 length 12
#  dst ff:ff:ff:ff:ff:ff  src b2:36:d8:0d:61:83
#  [service-name] [host-uniq 9b 08 00 00]
# Recv PPPOE Discovery V1T1 PADO session 0x0 length 73
#  dst b2:36:d8:0d:61:83  src 4e:f5:66:23:13:38
#  [AC-name vmksft-net-extra,debug-threads=on] [service-name] [AC-cookie e5 e4 8c f0 87 72 d8 3a 60 66 4e 32 e4 ee af 6f 9a 08 00 00] [host-uniq 9b 08 00 00]
# Send PPPOE Discovery V1T1 PADR session 0x0 length 36
#  dst 4e:f5:66:23:13:38  src b2:36:d8:0d:61:83
#  [service-name] [host-uniq 9b 08 00 00] [AC-cookie e5 e4 8c f0 87 72 d8 3a 60 66 4e 32 e4 ee af 6f 9a 08 00 00]
# Recv PPPOE Discovery V1T1 PADS session 0x1 length 12
#  dst b2:36:d8:0d:61:83  src 4e:f5:66:23:13:38
#  [service-name] [host-uniq 9b 08 00 00]
# PPP session is 1
# Connected to 4E:F5:66:23:13:38 via interface veth-client
# using channel 1
# Using interface ppp0
# Connect: ppp0 <--> veth-client
# sent [LCP ConfReq id=0x1 <mru 1492> <magic 0x6db8fab4>]
# Modem hangup
# Connection terminated.
# Send PPPOE Discovery V1T1 PADT session 0x1 length 32
#  dst 4e:f5:66:23:13:38  src b2:36:d8:0d:61:83
#  [host-uniq 9b 08 00 00] [AC-cookie e5 e4 8c f0 87 72 d8 3a 60 66 4e 32 e4 ee af 6f 9a 08 00 00]
# Sent PADT
# ping: connect: Network is unreachable
# iperf3: error - unable to connect to server - server may have stopped running or use a different port, firewall issue, etc.: Network is unreachable
# TEST: PPPoE                                                         [FAIL]
not ok 1 selftests: net/ppp: pppoe.sh # exit=1

