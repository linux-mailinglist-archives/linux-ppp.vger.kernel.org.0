Return-Path: <linux-ppp+bounces-450-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCjBJvJIxWkU8wQAu9opvQ
	(envelope-from <linux-ppp+bounces-450-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 15:55:46 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CF63371E0
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 15:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21A353165B56
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 14:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64213F075F;
	Thu, 26 Mar 2026 14:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJqALb5A"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F70C37F8CF
	for <linux-ppp@vger.kernel.org>; Thu, 26 Mar 2026 14:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536200; cv=pass; b=mPPbSYnnWD6ci1ZxGqk1orEK+wynS5eTo9qcs9vc2uyl7xjq04IRaxWEnEFfWzAfyNqz1+KrM579Rv7eQm1BnEAB3ijz7Lm2gPFfar7EIiyHosaOyCCSzs+1C4HMtzA5cwqz3Pj8x3XdJ0vhbwlL/b1HzF7gIY5JF1kgTe0TPiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536200; c=relaxed/simple;
	bh=FVFmAgQz4gE6E0Y4ObIalXmNJsTFXoYF3zXEEXfO3R4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QmSD1ZkAoRBtWycjcHcQFKcpSspOGB8uJ6Dt3RtvJu/3mOWiywpgTqFol2PIIoIcf6R8PJYeX6iVgCNBAzij37E9ZF3M7dSLfUs5htFYt72PEfICXuEQwjcHtVbW9ARo2dje7yuWSFrOOadMSLpVhQNQk8I01WogXPfJ686wlu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJqALb5A; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82a655cfab5so1012369b3a.1
        for <linux-ppp@vger.kernel.org>; Thu, 26 Mar 2026 07:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774536198; cv=none;
        d=google.com; s=arc-20240605;
        b=KDBqU+FseFdxyGoL/ui82ZNCbo2twyFl9e/PH7UYTnIkmL8P9ikcfUcG3pWo4lVS6P
         LdQJRfnUdgiNhfVBmV3tuxyUo4iMiavWsx4UTQzNr8DR8oKwCchWF3KHCxQ+Mj6zIQxw
         fTU3VvtLDx1/IWCYxXXPDhnJO+k+7fEYjvQ/3ntqzoH6kea6IBECU6uty6cHHS61E4tr
         nRoZLhsm4KfOTxwZndzczdyJ+z1WZtvpc9ZaD1QM8hit1KX4HQ9SD+pGmpyXdxBciS7i
         bRfOeoRF+9TvopEqrCkoS1l6tHWbdLkwIljPofqM1hl9FYydabe/0KqSpVIK5qb8W9DF
         crZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FVFmAgQz4gE6E0Y4ObIalXmNJsTFXoYF3zXEEXfO3R4=;
        fh=xrhirsiXPD6W8CmR8S6PEOq4B09Iq9b6QxNI3L78BQs=;
        b=C3ziNFOqzG+33uq9XF/OFczlsOBnXIrFSgSNzrskdbU4rq5RUkr+0klgqRkxuWYbnC
         g2S18FD/IOerCh2IPFximLVpiSFpUm2eogv2r7ADLmF1Tlh7fUa/BnW+3Rdw/swosiVI
         uC8VMD6tiM8AW0unFRZZjyFK7dgZYPIROS7hTI9KqWa69bloxi0AW1VFH/dvNfH2GGpm
         zD4WW4sxFNsOGguAmWbhYTvBfwpr4FG4yMXyeb/zOl8nHnrr23nXZ+A1VZEKOOyUPjsc
         8I00pWa1/6EMbUC0OEPB4rcHBUkrSz/wmJZUOKQh6x7B43Ykn0laWHG+wrlCMr9DpaGF
         GZZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774536198; x=1775140998; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVFmAgQz4gE6E0Y4ObIalXmNJsTFXoYF3zXEEXfO3R4=;
        b=RJqALb5AAvygIJTVL50uaxLdZMrLhLvw+8ou2Un04sVISYn60ms/0wjR+SdjSEPN36
         Tf+w8ITMwvZSlzJFC+pT9d+9OrzZ+bDOoesuMLLIY/svIIs3OPiLd0t8UKfkF4Av6LGq
         df6NA3NyO1JYX8iz2iLfJUMGtUQOb3bQeDMY/W0H07+BCtu51Q+rsQq/fj3XMz6KbQ1U
         KCXWV+MDCdf/o+XAOiOnjtwuafUStOyj/PTGiDBO0ia2RP5KTW6EStfITMCscDnjc96c
         VUcd8u11sDOeO2UlMD1yKL1DlejYFx48nSki4hJOQql+6h9anr4oz/5PGCf6GFlcDgEa
         pG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774536198; x=1775140998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FVFmAgQz4gE6E0Y4ObIalXmNJsTFXoYF3zXEEXfO3R4=;
        b=Dtb/EDLEHeciYaycJ1M3qPmk+OasTAJsTNg1NkOByBCzEqcJq3nzfpFHLN8Ic5ycBa
         awW+gwgXO2lcvlCZlH9aVqYLrlsFHXoPkp3EnKiuFkKd4im7ynza79WwpJadoW14Tl5b
         bYLhHrML8JXjS2iY2TjB67tpnW/snCYji0QINc5orI+vb0jz15fJYKkexCllDi2YNKA1
         EzFcOH/1prDjgQ6wPEszM6qICV5Dm8Ad2qrGjsQvbEO7PgszaYif46Ki8e/0vRAYRuNO
         qzFdxvoPwAvzVGvZoL0E9IVonS3IDYC1AT0+p4LPfQw7SB13m6SrmhtsX/qIxgVChTgj
         IfOw==
X-Forwarded-Encrypted: i=1; AJvYcCWl5Horq6sVkbownIvT/13hAUBFZs4ymn7d82mi3vbdCcYjd31+j3BM04w12IECTSTFAhKbvPH2bGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMMofVUR0CTuPT/bwBUB/J93lXTsOyjs5FIktY0HHbJEpxXlP1
	8q5fndwHeJD+/aZvI0iM1ZLJAXsmsTN98C/BeSaMh/xZNXuWq1JJ6WwmoPeod+wHOfu1dNPgguK
	n+1rj5GFJmDIOcLrA9WKb18Z6NtEbuhY=
X-Gm-Gg: ATEYQzzyuHx3Y/UrQhQv5xTTcRudU4KQGO9S9YuxQAbGUqS/WH3MBJhYYkNyXi3un1D
	gcbfsbitw4xX9qOOf1K81lQVZbpeyaJUgqjjKidmpWSZjYaEXLtsEX96Cyo65mI51b8I8RfpBlh
	VkzoX8lcYuhNlApBjTipnKRBHrKYrN8B+BMx+SpRRYvCK126uKDr9LYE/r8vp4QFdfQmtcVyVOG
	FIKW4h7kI9g7/CNmXrVPtvuhVlic+kjevt7CPQoVkJ3EbGbXac5SrNTChCbmEkURtyPTBSOnfFn
	29nO78V30XLgxZat0KCgwOg5gz7VL+hg7aUdWlwX8X7I9iLmRPoAqioM6zxiZMBHX7Bpw9bLZ0F
	DjJHCta1NOKzEffWPICtPqNbvg79CI/Kz2bnfIVIL
X-Received: by 2002:a05:6a00:21d3:b0:827:3e19:574a with SMTP id
 d2e1a72fcca58-82c6e0c9316mr7888671b3a.42.1774536198060; Thu, 26 Mar 2026
 07:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305013852.3769-1-dqfext@gmail.com> <CALW65jZRyKydW6bs-mYwh2mEn0dpv3opVEr=WczKn_0952_+Yg@mail.gmail.com>
In-Reply-To: <CALW65jZRyKydW6bs-mYwh2mEn0dpv3opVEr=WczKn_0952_+Yg@mail.gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 26 Mar 2026 10:43:06 -0400
X-Gm-Features: AQROBzCH-dMP5gYoRzTA9-0LoSdsw0LRMs61HA75Mz0OWbc31OaZfkW_Re03PrI
Message-ID: <CADvbK_fj_26MLP=+U+rzOMfqdPpdvFQJgN_fozd2uAjRsfHweQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5] net: pppoe: implement GRO/GSO support
To: Qingfang Deng <dqfext@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Felix Fietkau <nbd@nbd.name>, linux-ppp@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Richard Gobert <richardbgobert@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-450-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,nbd.name,vger.kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lucienxin@gmail.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 16CF63371E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 10:43=E2=80=AFPM Qingfang Deng <dqfext@gmail.com> w=
rote:
>
> Hi all,
>
> In some cases (such as BIG TCP) a GRO skb length can overflow a u16,
> then what should I do with the u16 length field here?

I think you can either add a check in pppoe_gro_complete() to ensure
the aggregated size does not exceed U16_MAX, avoiding BIG TCP
behavior; Or, set phdr->length to 0 and rely on skb->len to determine
the actual length, as done in BIG TCP itself.

