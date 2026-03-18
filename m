Return-Path: <linux-ppp+bounces-428-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD8xNUoHummmQgIAu9opvQ
	(envelope-from <linux-ppp+bounces-428-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 18 Mar 2026 03:00:42 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFB62B515A
	for <lists+linux-ppp@lfdr.de>; Wed, 18 Mar 2026 03:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0382A30157E0
	for <lists+linux-ppp@lfdr.de>; Wed, 18 Mar 2026 02:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70848224FA;
	Wed, 18 Mar 2026 02:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMqxIik5"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FE2450F2
	for <linux-ppp@vger.kernel.org>; Wed, 18 Mar 2026 01:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773799200; cv=none; b=twt+npV4gdIunKvvv5+HrtRjRrYnWYDgg4Md1YYjJUP+nMbYofoi4Z0xmNVlsn2iPkv6KG92FHsb6qFG9Y7LPWSyIogr9BWFrk8/1rJ8ZnfEQrDR5PO8FpUUDh8X3dK17l9T24FW0SOdO2rlvXjZUMhLI1EkC2cV1meMZlky64U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773799200; c=relaxed/simple;
	bh=xrjVBeDv/Df2HmsrYK/HbHtrtCdVoSl6y/aclzbxdck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P29bjMBXbQN34hG+jTmFBnkVcFcRpc46z8biir9eevBLIyvZv/ScuJ8ydBpJCUZcS20Yxvc6/JGblIR8OoFyUHRZiSiG16SJ/222g0Hwyi4wINIyHMQuBTyMOLDXHIsnMqYb0x/YU78sf9/Q/WQunBTm0ESvxNIbRpWGtP0D8Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMqxIik5; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6611d20c026so9244583a12.1
        for <linux-ppp@vger.kernel.org>; Tue, 17 Mar 2026 18:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773799187; x=1774403987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1abtcIpGMom0wsy1NJZLYcHl6br7lH8/k/qysH5VHys=;
        b=WMqxIik5IgBnRUVDZvFQ0y+VMBep/00ZxCmxyYA8bHF04tlpOcVwhUb/MwLPy9CusZ
         WiFHJSJZ1Xz19Luiy26ZRhEmzeXwGmrvwerQKrpQ9BAlNN9/UjXlKkPuA7/+l2HOhSZv
         w7kP8Cc/Xq0+YOFbybvuGJMRyQU8qJ3+IT1TjLjhlHE0f+GxzU3ni+mUveB/+JOCdwc5
         Al/iYeawTc6LUaWRiWeGOBkiH3mgX8cB+mhH1B6nh8FGXQYQ4or+hPTnqvNGo9/eC7mr
         /Mq/OSRMvMbRIjWzXP5jFu2+/G8WnAq0o93QBWlfxqOpGB7vLfqJNAi58UyimOrSN2C0
         roZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773799187; x=1774403987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1abtcIpGMom0wsy1NJZLYcHl6br7lH8/k/qysH5VHys=;
        b=hvyNQtifbxk/c3u/jBWqNweZpNitZyvVDpcD/tdZIRqhg5MgKJaJAjFm6MjYvHOpR8
         6xnWpRgNHd23v5IJ3J6hUI81oWvhVyypY6NVrwQu78h3nhok2yMvVCTUzfpy5QtsutFw
         S7YGyVKWTOrSM1vHfdqXvAeHU1eeCkn8zYac0/l3h1znoYgSHsXIZ4ClFMKTWgF6muqr
         qW/FNsouIjNfapppuQlqnNhQj6KwlpISgFCDyB2ql2dKMfDG/haKFZDzkjA06tYc8LEc
         i76IKKeYbZ+C25g0J8QbggplWsEchc1oRPJ6gSgKMksQpTeLAdm6PlKcZmpdERBBC1M8
         OrMA==
X-Forwarded-Encrypted: i=1; AJvYcCWbIeOXjoz4xmPPtwJxNvU4qpfn/QN+ChIp6oz5odZIkw0o+Ww5w4zNn+StXLFg5hG/cX8xJ9i7bsI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpn3AIJp0hHI6oF0hIDZcVTae4yFxPe3woqT+fr9v/LCSaMtPK
	nb2HMJxFXDYaYYBgHVh9bc1PLWXe5NzAk5aRaj322a4di7MLmR57zxID
X-Gm-Gg: ATEYQzw3SQBSnCitJuo4n49gevae4r5iVeCsLVGniFHWcjGEmCMJTcEQNDLLsCFtKPL
	1j+N5dIw2OFG2Yav2udIgZSV1RGLvNlEnv65j1jLqAs258A5D4fphpVTk1V1JjqUjyKWG0YD2n/
	StUzJfcZ8xSev8+MvylNYTnh7G81dsyoWbWZBokyipb3Cbi1SETHc9EbUuwtWBZVooxWc8CXG0t
	Sr1g8ethKNYz5JSxviQKpu9wQKDzHe7rvK60XurumvchY2GpCzW4D0mONh845NN6qhAZsu9wEzk
	ueWZW+NwlQqdaKTgY+vVKEAbIAw3XRlUg0EUAYFhbUQS8z6pXgtRmnFL/t+WMmrfe5LUq3F3J62
	dbP/UzTbu/6HV9sZlnCqWfM0HSujmgOXPghyO67u3a7QIkDTmwVBtTxf78HItV0RzAY32cdzBQG
	ukYDg=
X-Received: by 2002:a17:907:9346:b0:b83:1326:7d45 with SMTP id a640c23a62f3a-b97f4a3db88mr83441666b.32.1773799187320;
        Tue, 17 Mar 2026 18:59:47 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:4e22:2e3c::49b:45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f16868cesm97079766b.33.2026.03.17.18.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 18:59:46 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Martin Olivier <martin.olivier@live.fr>
Cc: netdev@vger.kernel.org,
	linux-ppp@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Paul Mackerras <paulus@ozlabs.org>,
	Guillaume Nault <gnault@redhat.com>
Subject: Re: [PATCH net-next v2] ppp: add IFLA_PPP_UNIT netlink attribute
Date: Wed, 18 Mar 2026 09:59:29 +0800
Message-ID: <20260318015937.239409-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <PAWP192MB2411A808BB36F0086A9B00B99742A@PAWP192MB2411.EURP192.PROD.OUTLOOK.COM>
References: <PAWP192MB2411A808BB36F0086A9B00B99742A@PAWP192MB2411.EURP192.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-428-lists,linux-ppp=lfdr.de];
	FREEMAIL_TO(0.00)[live.fr];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,live.fr:email]
X-Rspamd-Queue-Id: 8AFB62B515A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 14 Mar 2026 02:14:29 +0100, Martin Olivier wrote:
> Currently, the PPP rtnetlink API allows creating a new network interface
> with a custom ifname, but it lacks the ability to specify a custom PPP
> unit id.
> 
> Setting a specific unit id is currently only possible with the
> PPPIOCNEWUNIT ioctl. If a user-space program also requires a custom
> interface name, it must create the interface first with PPPIOCNEWUNIT
> and then rename it.
> 
> Resolve this by introducing the IFLA_PPP_UNIT netlink attribute. This
> allows user-space programs to atomically request both a custom ifname
> and a specific PPP unit id during the RTM_NEWLINK creation process,
> eliminating the post-creation renaming for this use case.
> 
> Signed-off-by: Martin Olivier <martin.olivier@live.fr>
> ---
> Changes in v2:
> - use nl policy to set IFLA_PPP_UNIT min allowed value instead of a manual check in ppp_nl_validate()
> - use of nla_get_s32_default() to collect IFLA_PPP_UNIT value
> Link to v1: https://lore.kernel.org/netdev/PAWP192MB2411A5E7D3BE1B55E155A92F9747A@PAWP192MB2411.EURP192.PROD.OUTLOOK.COM/

The patch itself looks good to me, but I would like to check the
userspace changes too. Please create a pull request at
https://github.com/ppp-project/ppp/pulls

+Cc: Paul Mackerras, Guillaume Nault, Pali Rohár

Regards,
Qingfang

