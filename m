Return-Path: <linux-ppp+bounces-443-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICsBJ12exGki1gQAu9opvQ
	(envelope-from <linux-ppp+bounces-443-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 03:47:57 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ABD32E7B3
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 03:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BB863015CBB
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 02:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6383D22068D;
	Thu, 26 Mar 2026 02:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXClnkjF"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFA8322A00
	for <linux-ppp@vger.kernel.org>; Thu, 26 Mar 2026 02:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774493032; cv=pass; b=BPYYC8WrziGeO3ETjzh795UyxAygFz+qbK0tlJrDSAXSf/zaqg0TK+UV7UXEkwkJ8uJYN4JZ8IAcImfOTSYQRH8Rb9PRxTWDiZExLxI6TQot70MGtDcL8vySAgf4Yq0LBNYZ7kp9Wq4rIrHwxpTVR0a/QcUefwKb9KIPFDtEdC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774493032; c=relaxed/simple;
	bh=qLx333URmIcSDNbmRn8sNbUnlkIvjnasy4zTLQtbW1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gxktwyerCsFiOoG3EiuII4rXNX/r5b7HdSqURxJOsVdinnXnHASHf+5MEfI56kDShDdQHV4qXhCucRettKsQ+fQtx1Luv2wJNaS0jbYkW0ZdHWqtcQ/BCVSULRcz6ZzxOovcSpvz1xu+J1beGsw74/VfTdrRvPZygK9LRC3MeSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXClnkjF; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-793fdbb8d3aso5521627b3.3
        for <linux-ppp@vger.kernel.org>; Wed, 25 Mar 2026 19:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774493030; cv=none;
        d=google.com; s=arc-20240605;
        b=fYyyobE4TtIZJoUR7UBlGnWXTzar4vOjDWPD21FDoSFHoRvzsxeRNfYUCZ6B7OoM0K
         X9/Iq+yEBX7nS9LEHeGXCyT3LVotIQEqUAmTr7BLM0LhFfshs32Cfnoc4/oh7N2mkm86
         /Zju9+gylwQjhBs2y+R89vGnLNSZUoaEO5WxTQ/i2k4e8FspcAZhC2IVJUI30E1z4nje
         yq7QdJc5pS0mgnb0ciAduXI4Lga3t7eLT3dD89HTsOL4Jkntj0aAIr6il4arceX3y0xT
         3Smbg/PaekKJRmwWPargjhtLBxs3TqXGpAwyy8EnVFlCg3zb0cJY2+y+PYT3iSGz7clC
         hMrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qLx333URmIcSDNbmRn8sNbUnlkIvjnasy4zTLQtbW1k=;
        fh=35Jd31Lqxnohdbuio9jU5NLNSdlJ3zOKp0pyfzsRS4M=;
        b=iPVmS5/P71WP7NHCAHwJVbu6gAoMs7TW0DTJzZ63Tu4isFoPY6ADAWBokP37dMfDYk
         5E5PzXm7QwS+qEsKSkTC7RE35tHimqDUtmy6XQ0AqBAGK9CLlKcL5vnT31EqGOwfZwoP
         BkAPDjp+ZWuCtUpuid4rCEeDnBemJSyj9cFYrF1nKdYGmqFlBQ1o+VjVOEyKpA36FUd6
         ET0RhBLIlWKD0EurzDl7DEbXThJ7ixzXXpYXnHTpelGVrC9MltNHdZuZy++QUKRdoaSR
         nIlY9rQASb+12BGzfnz39qVC59sInvIfaB1sm1xp+4MAQOSpmoOpMkVnMuK7i7vGqPZQ
         eymA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774493030; x=1775097830; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qLx333URmIcSDNbmRn8sNbUnlkIvjnasy4zTLQtbW1k=;
        b=LXClnkjFvVYusr38mt8NwxpRrDOcsAfSuPZ1KEFVbpwjghsBEN8n0GZ68VQ1SBc9zq
         laeVzyaRtqNX3N+BP29g2bHS/7c4KmLhILJnhlck4rMonijCCF9EA1b7XPXGw9WAdwpl
         69CEaUqEnRwoiB4N7FItayT6x/KOsd3dxonF4iVNLQWHNXn/bH1EeGzRo9AmEaBaG4cB
         MjVb/LmMlz7fcIOnSUI0wcdB/Q2PaSNLrjrlGTufSfs9EGoL0YUenPHEMBVwzc5qWhY4
         EWcJFE8OS/YD1XmcajNKhO5CxyNsB0g9RxZO//U6uJXpKUOiCj+2qJcZXrwoM2GgcECb
         6HHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774493030; x=1775097830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLx333URmIcSDNbmRn8sNbUnlkIvjnasy4zTLQtbW1k=;
        b=KNQ3B9N4td2o29tmDiNpXJTDGPofj7EdVP48pXhTUIU1lSWmGqpQEyGOxszJZdsx/6
         ujBybDa5mJ2eiHNRWhjPHkZUKsHvnvqaCj2XRyMC4Ch63DmX8iy4P7GrgnLhqAPa3vZH
         Y3mx+rly47IFFzSUHWXXOEu+IcclgPPXcQVGzPLFiqf9Z/sGMBCbK8GbtyX5Ubffyozy
         1fDx+v406dHCQslG7FwFRBR/QpFqDLQbS4FbrQk0sXrUsRMXuODTDP/AW+LNizt83VhI
         PktsY1hZ8iR2KnBtGt57y6QwwT+ZLiapDNPp0U69zuvbSYOpVsXCFzDoPNYs+SEWrMi3
         0aig==
X-Forwarded-Encrypted: i=1; AJvYcCWuTa+Lut5T0IAufWnKeZmZWcLX0lqbaLM0O1E0QuTKIlWHiGkEML/Ae06kPIki/fkX4A3c3doSXUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YytembO4dpPR4Fv/J7Z1OGXdW7G9ydcPpQjLWcto7ed3us9a54N
	ifSkkX/pp6kybnyjeV62OMA99n8aFMi3G+qQgyUPXBSO1OUdzpkij2lDaqZA17I+8317mqmih6/
	nivxgVapgFkb7pH4ixKWgv7dludwhloo=
X-Gm-Gg: ATEYQzzU3+OK3NB1KsEzB2pRO1gxPsz3e+hctCaO5MgI2tEvZYVTfV0LyZgR3CJidcg
	LuDeDCnSYji/11BKn00kKhZ5idkNPHqMBW5iADaRXWDAza4/23sU7RhD/SJm1pGCILt5bEg3xOd
	1NjdsJXRLNJqDZ5dWTbWz7ZJREbjhhRm+RgtAVRZpe82R+oxbAKYozm5vFeFVLm2N43Ry7ebHbh
	tnn2X8IvRLgMdfdENFB7w1YoeUc/5r6dyeVIyClh0iC3wTsLS6hMEk7tMpKr7XC8ngCdLMdJaC+
	8w0ZEofLLtgyIsog
X-Received: by 2002:a05:690c:22c9:b0:79a:c31d:d4c4 with SMTP id
 00721157ae682-79acf69608bmr61632107b3.50.1774493030251; Wed, 25 Mar 2026
 19:43:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305013852.3769-1-dqfext@gmail.com>
In-Reply-To: <20260305013852.3769-1-dqfext@gmail.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Thu, 26 Mar 2026 10:43:38 +0800
X-Gm-Features: AQROBzAdfgjQ3EvaovMTRBjJ8zwYAbD4YryX23wkdd5nHdaS2VmnEjB2d85KrZQ
Message-ID: <CALW65jZRyKydW6bs-mYwh2mEn0dpv3opVEr=WczKn_0952_+Yg@mail.gmail.com>
Subject: Re: [PATCH net-next v5] net: pppoe: implement GRO/GSO support
To: Jakub Kicinski <kuba@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, linux-ppp@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xin Long <lucien.xin@gmail.com>, 
	Richard Gobert <richardbgobert@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-443-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[nbd.name,vger.kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 22ABD32E7B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

In some cases (such as BIG TCP) a GRO skb length can overflow a u16,
then what should I do with the u16 length field here?

