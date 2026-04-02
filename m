Return-Path: <linux-ppp+bounces-475-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N7pKuHTzWmWiAYAu9opvQ
	(envelope-from <linux-ppp+bounces-475-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 04:26:41 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FDB382A65
	for <lists+linux-ppp@lfdr.de>; Thu, 02 Apr 2026 04:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3FE73017254
	for <lists+linux-ppp@lfdr.de>; Thu,  2 Apr 2026 02:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBEC3321A7;
	Thu,  2 Apr 2026 02:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p4aFogyf"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9729228CF5F
	for <linux-ppp@vger.kernel.org>; Thu,  2 Apr 2026 02:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775096784; cv=pass; b=MQiXhzpTwAinEnwL0h+7n3Qmmns5OGuBE62WcBr3g+mH3pd9XSuCwkiIKSDXIV+AlVExaxmfEUBb1AiWKlujv6b9WHJTm1yK5WXt54XT9jflv4vQ+pRCVK7OWo4ySKTdrmv9LsHL2c35E3Dteo3lyjweKCDG+y/AyUlBZ01Q1VU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775096784; c=relaxed/simple;
	bh=tWl3PMbY8WSVMBe70id0QojUsUjc22+YUzk3cAiXrqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PyvY8a0BzsTpnQvWow4x+fINC9dkg6pcMNQbjXd2e0V74drnV3PWNVT3HEiqWi+HjT+WMHQjmvtBLFR+lY4YfnLAg/rjL9hjkkThmhJBnd4EYYL//6j7nrgtLqEpaKNWK1GT93VdTcIDJnRpJiI3f8DO4qIIDp2A6QNurVVUsiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p4aFogyf; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7a17bc5745eso3583247b3.1
        for <linux-ppp@vger.kernel.org>; Wed, 01 Apr 2026 19:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775096782; cv=none;
        d=google.com; s=arc-20240605;
        b=c7xAvjE1wnw3BvMeED39GpRE9NT21r8jYCDmJoKRCSz/fr0Fw5yNWfkkRiDxQr2GTM
         jYV/FhimeoNEv6afLTx0pidPP0FPX5XQdatgoAS26xzPzOKVHw8s+ljI7Dmn2voFl9TM
         nt7oe8thQ7pDoy3CthFPAB5blCDTwrb6vzVWawELVSvhaIa2fvle4roLUAhde0jO8q6b
         dUUMCdEjtaDpriFbRJoIW1fAiDcIUm8yF5kup3iaXztLCZVSZ3djiGirbrgj3/u75P2a
         /WmGSv236ur35lF+4uzlafhmSa54ZXekmzYaXq6v2/pDDOj5K+2wIHHGbFKA7lbBNVG1
         Evig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jbcLxyNKssJ/qsojKtaGf1w4cEtkGVy5OnWNXj+J5+I=;
        fh=IdW20VFpdcfOXKIIhGAhGnPIOg7/cVrYTTKufxoFWBo=;
        b=RB454H9gygroKP+cwpacchRGYLgn4gKAlvUMfSpaVoW7u9fb/JjuqNmWNr2feH/cdl
         Q689WPkKjXcBoirDXYqdxWg1oBwiLPqzQplN6orFB2sHg9nt8DnW5XfpzoIit0fwliqi
         K8vXrhi8S7w+h8EedbCJJPsWe3/q8BkXRH1vru6RmpOpvZ3KhJNZZNjSUiWBOtexKgnf
         VpCT/w/6BOXydijJfAWl0A+aoFPYv47HbKNhjKpPKio/ErsceYhcdRJobJNT1SqFatbg
         v+kqIx02TPDnobo0Fa1WtN2fr4tJ15Nv5IA0Z2IwMkuERQlFW1ZxduNfct6DQJrH7XnO
         sJVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775096782; x=1775701582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbcLxyNKssJ/qsojKtaGf1w4cEtkGVy5OnWNXj+J5+I=;
        b=p4aFogyfFr6le/lnlniUfRCoP7kFoelYDJjViX9zSJow1SN/7nRdsyh16+zn6tyTBC
         c3FnPv0hxAJkGyded0hKEK9fJ24TmzC2jSFUYpto2nLTOkvgodS2mJCYi/rjfDFHz1xT
         y2c/mrdkAI5qYvyOZM4/xvrnRnUH8otrnRrXAh4B3qMIeAIPDCFgD4WbhXDf5dB7VS1q
         4ZWmln7A4Ljxu5QGzYecl0r48R+ntnmblYHyFvdjgOocsRqrSJNYvzGJJYH4FaL13A81
         V8Tl6OY+vIPjrnjJuQGOeZWF5VmEcGrkleWaB9wtA0ix9Gr9sio7VQworo+nctlvWrFL
         jFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775096782; x=1775701582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jbcLxyNKssJ/qsojKtaGf1w4cEtkGVy5OnWNXj+J5+I=;
        b=qCussc+uVDxNHwDLtLW0BAM308ZSqHcXUXnjdpp0ftGeTBxqYfUBfrSDT9L6XDMihg
         FRoBl0SHH5chRlsQgXP6ZufvV0VJ0h/OURonIGj/BJ3CQFZc0+inTIkvYAVy1E1bN1ON
         u5wwMJjwavjzUwK+qXgCLiCofvJDxsSTjTuuJADE+n+rEy/V7KhCByCv+L9z1oXC5lPQ
         KI+ZcFuds6x9bpOgqBrolpsjvqIPRh0ZEFAI79ou8Uh+xZ2l1fICYuJCgeMj/Vf7R1N3
         tPxeav717qleT3xJWjvSa6AV75MaAj5dCVl4v3+W6IW7KYYIP88YTPcj16GM5uEf647J
         +B2g==
X-Forwarded-Encrypted: i=1; AJvYcCVJRRDAl4y46T5NqF0y0HDFxbB6Qfz3NCXu2KCsTMEC/DJyTODA4ZLyihagfKjd+cNMbik+hWWSuXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPxtQyS6OTJhO99scox9etDrUzRomeJRtYGDI0p7frj8AknJs0
	d9ohHzaTo1xfXdCCOECjjo4udrfJsjWivd6Tj/WQ/P7O6Hjwyrd9t8Br3IhNT1eNPAbbtzJtfo7
	iZ8vnMW+jCdJV1aDI6Rc/nqTCP53Lbi8=
X-Gm-Gg: AeBDietxGs+/hfTqxNe9LD4TvEYX2sHIRZtkf/7QGyWH/+lwuqkuT7w5tSCg9pzd5CB
	2WyOUqnZ6d6CMnNni6MMFZPp906uNSfnxc7PzILYEUSD184ys+FNfiA57z+B5VgfuwVjeZiLfCK
	k2K6qiUyQjFZHRrf26A7TDswfN4H+cq3XQgPeGmQJWhBlgw1rX0U6CbZ0c3hdIsKBdK/M0J3nGp
	cICnTuPnsJiDc7gIKdSU9JKlSnMbF0ahkm+W+q4kLh/Qx4emLL7nGO8TYYgbFrY8dEGj41wrFsO
	EaNO2An3O7l6xUqMiAY/gN8Yxrwqnigc6gt1JfLK
X-Received: by 2002:a05:690c:13:b0:79a:5164:bb2b with SMTP id
 00721157ae682-7a20f6eec2bmr61155537b3.7.1775096782537; Wed, 01 Apr 2026
 19:26:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330035604.133073-1-dqfext@gmail.com> <20260401081030.29b050d5@kernel.org>
 <CALW65jahWApDnVmFReW+Y3HDxBEmCwzsT1oyh03SW7X5ry6PzA@mail.gmail.com> <20260401175621.549c492e@kernel.org>
In-Reply-To: <20260401175621.549c492e@kernel.org>
From: Qingfang Deng <dqfext@gmail.com>
Date: Thu, 2 Apr 2026 10:26:11 +0800
X-Gm-Features: AQROBzCtPXGaDqROF8pKtII2foTv_tDo-gjdvN7lGgVfBU6XpEEcgXimHm6lXKs
Message-ID: <CALW65jaTbaosbO8ypKZ6G37HxuxXabeTaP_Fhq72xTovmDj+8g@mail.gmail.com>
Subject: Re: [PATCH net-next v7] selftests: net: add tests for PPP
To: Jakub Kicinski <kuba@kernel.org>, Dianne Skoll <dianne@skoll.ca>
Cc: Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Felix Maurer <fmaurer@redhat.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	"Matthieu Baerts (NGI0)" <matttbe@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-475-lists,linux-ppp=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 05FDB382A65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Thu, Apr 2, 2026 at 8:56=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed, 1 Apr 2026 23:45:38 +0800 Qingfang Deng wrote:
> > > # iperf3: error - unable to connect to server - server may have stopp=
ed running or use a different port, firewall issue, etc.: Network is unreac=
hable
> > > # TEST: PPPoE                                                        =
 [FAIL]
> > > not ok 1 selftests: net/ppp: pppoe.sh # exit=3D1
> >
> > It looks like pppoe-server fails to start. You may check the syslog to
> > see what's going on.
>
> Hm, we don't capture syslog automatically :S We capture stdout and
> stderr
>
> I'm not even sure there's something listening on syslog in virtme-ng
> Is it possible to make the daemon log to stdout or a file and dump
> that file to stdout on failure? Even if we fix the current issue
> it will be quite inconvenient if we have to go into syslog every time
> the test is failing. The test output should provide enough info to
> debug failures.

Add Cc: Dianne

I checked the man page of pppoe-server and did not find such option.
We can instead start our own listener and redirect the syslog to a
file or stdout:

socat -u UNIX-RECV:/dev/log,ignoreeof STDOUT &

Regards,
Qingfang

