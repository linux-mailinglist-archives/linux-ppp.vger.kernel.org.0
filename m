Return-Path: <linux-ppp+bounces-422-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE2TEGcmuWm1sQEAu9opvQ
	(envelope-from <linux-ppp+bounces-422-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 17 Mar 2026 11:01:11 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E3D2A76AE
	for <lists+linux-ppp@lfdr.de>; Tue, 17 Mar 2026 11:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 648353079FBA
	for <lists+linux-ppp@lfdr.de>; Tue, 17 Mar 2026 09:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8213A2550;
	Tue, 17 Mar 2026 09:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c1KBpy8h";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UTpBMRpM"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CD63A3E73
	for <linux-ppp@vger.kernel.org>; Tue, 17 Mar 2026 09:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741468; cv=none; b=SewH4r0crIpRtb717jd7XfjIykdso97Lx2AudWFqfvGLIaduLtP2BurG0YOB2qvWW+kfIVl5jpBGkyMxRZGo1HfTaXLSahf0hEC58mQTvZbiyTu7ktaQdzVHq483tT2WZkKsFJQtWj4IVhmDwxG7CjGzAvqcUvjvIp5OVjpPcN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741468; c=relaxed/simple;
	bh=mKVRVOSt/fsx4ilTPwxMzDSFGIg2+3/bIQ+LVhC/BS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tt1dV8dS9nMtSttTdWLN5iG2pGSqhSbCvbErEfTqaSFS4+XHrCKcyFVM9VWX/E/M6/SAMI1yGNdEHQZa2ekzWga4ZnAeakN2M4UYWV6pv6YSsXfYdDELPehY8JJBG4OwKXO11VZ+RxnvveOLSitvRxDSjBmBG3Q91/NSQMSVHpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c1KBpy8h; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UTpBMRpM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773741463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FVn25Xo84DjYnUkEutgl608g8cHLDvs9Iup/54uYbZk=;
	b=c1KBpy8hiXCxTSwZzQa4hh/3EE3idRi3FeLzOMBejLnjAY+NW9h4FFI6waGebx6YNXcff4
	VN2bNBFl1t+rnJIFMxdw27oxXqd83AY12db4PztXHBmv2fRhrGxfr5wZzLf3DaZOE53CNw
	VQgHjgr9jAjyeO7K/8VeqsyWLsim+rE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-2qcgKxjhOEC-PXA2C4r72Q-1; Tue, 17 Mar 2026 05:57:42 -0400
X-MC-Unique: 2qcgKxjhOEC-PXA2C4r72Q-1
X-Mimecast-MFC-AGG-ID: 2qcgKxjhOEC-PXA2C4r72Q_1773741461
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43b42fe9031so1309081f8f.0
        for <linux-ppp@vger.kernel.org>; Tue, 17 Mar 2026 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773741461; x=1774346261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FVn25Xo84DjYnUkEutgl608g8cHLDvs9Iup/54uYbZk=;
        b=UTpBMRpM4dBaOfKIjN8h9Ycd4Rd0V5pnqJvgX1SGb5Hgg/9LwrZDbxDUrhdKOM6Et1
         66JMZW8CSZ7OutsqoLVLW3NelfHDYrufO5zo9Q5VJLuQ7XXQyQP70VCqbbg4DHqfEIJq
         812rBY6Uieaq1gOC/rPFU7gmDzR2NErVs3aJpyQDI5XTffPfySHqBKwwl3dzZavJXxVq
         Ls5mk2pzWsiqtDXMT8wOyUr9GanrymfVLHocKXMvN5JG5ZyzZGg+jjJKyej05jLZcvQu
         lE+tyvwdlw2CVULa1XiE8wB1YksPN6xJ2sdtUcEL3dsEVe4zQ/IeMOZx4KSalg9w/zSX
         he6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773741461; x=1774346261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVn25Xo84DjYnUkEutgl608g8cHLDvs9Iup/54uYbZk=;
        b=W7uWt+aPdatk1vGU+Rox1/A5fh5EmIDVShqRD8ayUMDFyKSeeLxIrI6yMcCeQnwQpa
         C644ds+cbWZKwzbHqclug2J3WqyNaUBUGpAkg93ZrAaY88fevg/0rzXxyY/peMRbqrq3
         z7uIpNYe4d0it0DBFtqXFwgNz9P+7OlKRt6vnyGg8mS4WXgKDsIUowgx77R+VjDFAR/D
         HdG1bblTCzU048jjAsDaVPYxPtHWRnypak5bXJFznpJRhM7DaxwYUnbX4bXE5NbkKsoo
         RaCJkExVr6Sj0+Vj+oZKAL6YP7OYbsKPfgq9g8RdPlaPk5PGALOZxJdEW7fIAqvJdG0i
         a4ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUislmYw/dSOPrIMrdlXsJgCaq39UmcYMvfWv8e6o34MP2HMwpv+PQIkAkFUdurQd7RRDrMMxMwWkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzupkR0+NvtRcogoiTydJ46rzlZ8JdsFJ6PukaBGNOhkfUS7MoZ
	gIH3dB15V/Y3NN/REi3CwY6zu26Ha60yLzQJjvMpF6taiUKCYruVR8bTvGEiyBY7tb2PvUs4LXz
	e4VkN6I1fEWLFuLyFVBX9sMEWkqUlTkthAaMo8c0ZCA+sBbWB+fVkX6ZNSoJ4EA==
X-Gm-Gg: ATEYQzzhs38DCD6KUgtYuOLxD516zePkrYNDGvU+YRagpBamC8NT2HuVPJ21+cDB5hS
	C7GrYap9kjUN3uokGBfWH64sAUIyDWjAIW9CT8axzRwPj5l1Po+VWoA/lQbHGLcU74WCZeLd1OH
	qPkrdQB3q0bw1bSBpaOAVyHCy7DYU7c2Js18GcsOvFmtrjTvmmwgbCnKmw1R9syBfYlxN2NqoQK
	XXUncKNST6AHgS5K7j8qhtKwgmxYehdhTULW1v0GUyfeUpJP7Uy6aUdMWuIPa7oKUKMSznhuvDm
	WCbfHMGxkJ5VKUjITCKGf5u7Wkl8zIP/9FC2WWCB8SlDCMR3g9ZR8QH+Q4AQMMqAI5usp+ds9rO
	0QJdva6LrSIVl927qKkDgLqw+9arkau5iBDUtBsPRRvHchop/5LwwI8E=
X-Received: by 2002:a05:6000:2288:b0:439:b79d:b9a5 with SMTP id ffacd0b85a97d-43a04dae73dmr29950117f8f.37.1773741461021;
        Tue, 17 Mar 2026 02:57:41 -0700 (PDT)
X-Received: by 2002:a05:6000:2288:b0:439:b79d:b9a5 with SMTP id ffacd0b85a97d-43a04dae73dmr29950070f8f.37.1773741460554;
        Tue, 17 Mar 2026 02:57:40 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1affe9sm51534817f8f.15.2026.03.17.02.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 02:57:40 -0700 (PDT)
Message-ID: <7b082017-5245-434c-9668-49b630af6484@redhat.com>
Date: Tue, 17 Mar 2026 10:57:38 +0100
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] ppp: remove pch->chan NULL checks from tx
 path
To: Qingfang Deng <dqfext@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>
References: <20260312093732.277254-1-dqfext@gmail.com>
 <20260312093732.277254-2-dqfext@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260312093732.277254-2-dqfext@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-422-lists,linux-ppp=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-ppp@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 09E3D2A76AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 10:37 AM, Qingfang Deng wrote:
> Now that ppp_disconnect_channel() is called before pch->chan is set to
> NULL, a channel from ppp->channels list on the transmit path is
> guaranteed to have non-NULL pch->chan.
> 
> Remove the pch->chan NULL checks from ppp_push(), ppp_mp_explode(), and
> ppp_fill_forward_path(), where a channel is obtained from the list.
> Remove the corresponding WRITE/READ_ONCE annotations as they no longer
> race.
> 
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>

Looks sane to me.

It looks like you are investing a significant amount of effort to
improve the ppp driver. I strongly suggest you to create some functional
self-tests before any other changes in this area.

The code is pretty intricate and obscure, a reasonable code coverage
could add significant confidence in non trivial changes, and could
possibly help revisiting/cleaning-up the locking schema (which is AFAICS
the most significant pain-point).

/P


