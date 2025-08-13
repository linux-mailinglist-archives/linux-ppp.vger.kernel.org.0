Return-Path: <linux-ppp+bounces-338-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CD7B23DDB
	for <lists+linux-ppp@lfdr.de>; Wed, 13 Aug 2025 03:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D18EA583904
	for <lists+linux-ppp@lfdr.de>; Wed, 13 Aug 2025 01:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D222A199223;
	Wed, 13 Aug 2025 01:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sk+NgtoE"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D56189F43;
	Wed, 13 Aug 2025 01:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755049591; cv=none; b=G6JO6BF28TKMVqzPKgYEJWL3tgM0baYJFGROIU/mDSjRlLgo1UWSOXnkfko/q1m66BRvQwPHt6C0zbPg+4YPk6UZhvHAHzekFI/oCQicq6dWoI+ek0uasjFj3RLtvz3xvGyxeoOYljO0v2qBVL0SRmZ4fuowRiei/95zOa/NVl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755049591; c=relaxed/simple;
	bh=BxAHfwvUeutHyF7z0KbqPRnjx5dPzwzosdYZbXsBGLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mnEA/5RgLgAenjXw8De3MMqCq4UfIGD4A09PGABl8Jlo7F3s2k907a749Xi4S1+NApehI7zyGuAscq/IBj6kr/HzRNP3ASw0+ddOehXl05mG+7R6iICKA9It3p/44qTvwDvaHlm39PVHZU7g2FGzoFencxj0SjMmv5PZ5CnI5CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sk+NgtoE; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71d4d7cfaddso3939607b3.2;
        Tue, 12 Aug 2025 18:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755049589; x=1755654389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxAHfwvUeutHyF7z0KbqPRnjx5dPzwzosdYZbXsBGLY=;
        b=Sk+NgtoELWQnEj9L9qbrZouSKLF4d6xhpenPyF8bOSWREkgKj8Z5ng9R7xHgaqyaL7
         zwAR+Rcoi4ssJjR6G+yAVbygEXvIj4GwNMO9MZ36BX0DJPZjLZFp1Yz19/+BnyEoKCRD
         KZoM7lpoZ15qVAeyYAbUw+Zknaw1trz7iYh4cV+CoXg8eWLOZPpRKfWenRB5epGFJK0E
         RV2N4ulNQBzy88Mjt5fNToVC8agPisnVuSwfQ3AxjoHYYe1CMFmhzhG7uBehRdpizALo
         3s/Zpl9Q7y9JMNmfVzxM14ntHc3mBCfAZ+OLXbGMYn0l9FQetmC+rLjWjl8F9WUNhZ/C
         f/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755049589; x=1755654389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxAHfwvUeutHyF7z0KbqPRnjx5dPzwzosdYZbXsBGLY=;
        b=eyLz35PwtU3jmCfuj/y4jMORMVxFBD8k7aAaqDJG2X9poeu9RMtQ4Po9Xw6sp45Zo9
         JsnhRKiWPodUCbTa8n6bvSV7mj1cFzt/dby19AE1QlD2iav92OX/PNgXe6LaZoCHBPm7
         4eQ9PatCkk9YUaiU9Zvy5np8Qn3owVxdISIr/wNcWJnT2+ZGT1KsPGTJ7LhKBIN9o+pq
         R4yfZWCPyULRgquORfy6aI0x8umc827wyZWSxVaPoVxaDsgpr0MaWpaP6j961eutudXJ
         /ET2ATMfdy1m5a4mElWojTEKdNOkl30G1/gRpnIe8XzS+fE19RWsc9Qj5+WkDOHB8jtM
         xpsw==
X-Forwarded-Encrypted: i=1; AJvYcCUS9Ua2hbd2aDlDcSbdTvTn/odHdjhCp+oCpBjgzxM2/GLaZuPS9Yotd2osYAUrhZxJe5eYrRg2CiV1@vger.kernel.org, AJvYcCUrd3sVSa4Jv9DvkU9K2luZnYXz5aXapltIDbO4JxsvR1SIVNg1SmfEDchgyZfxW4n3yCej4wnV@vger.kernel.org, AJvYcCXOwXVZ5lO1wQjeNSC38fpwZucRiqSp28oX68jcFK+dK2QK9lW8z+VcYdwoFXxsZhEzt9djKgL/kaHi+ZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YylZSLraFX1o/ow8T9wWLy2PcHXZoIHBxVPZUiTBrAlOBWKhp6o
	Xis0yPYjiuPomqlx6iQTqFFxV9yrddmXOtjB7+dUo5ed1LotSqHvSOkkLHET/ChpcpfHe5kZeZa
	pKWUw3hoESDioDJn0H+5uaByTLlRvGZk=
X-Gm-Gg: ASbGncsOegtj8a+SjMArlaTThjna71R78cy5Gzti6pjRIowDAqEWfaqM7vHRijCPWBC
	fBXxfQVrBBlal2HV0SGU2q9TcqKoBEBND4Svpn51k+VHYzcqeubRyn3sTCEAmR0bW7w5NM41mip
	a+mWHkHHRz50Fni/dwqm9yhDr5X8HwUznx3UF+uTd6VlCLvN8opPPemRFMPlL/nrP45M9XtVn9X
	UtFUCi7SWpVf27T3aG+nYsbgM01Lckv7yQ=
X-Google-Smtp-Source: AGHT+IEVMudK7EMyb12H1ANeIUXpSMdZyIwjr5gCjG2F24AgPdmURokyw8ICpJvtQdI4bZK/3Sn1UQYB/HGqqUoiaAU=
X-Received: by 2002:a05:690c:a8e:b0:71d:4acb:4df1 with SMTP id
 00721157ae682-71d4e5749f9mr15708557b3.33.1755049589140; Tue, 12 Aug 2025
 18:46:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811084427.178739-1-dqfext@gmail.com> <CANn89iLEMss3VGiJCo=XGVFBSA12bz0y01vVdmBN7WysBLtoUA@mail.gmail.com>
 <CALW65jZ-uBWOkxPVMQc3Yg-KEoVRdPQYVC3+q5MiQbvpDZBKTQ@mail.gmail.com>
 <CALW65jYNMNArwzmpHhYj3fpfL0Oz2fRYsJz0JMDUnyByu-8z3w@mail.gmail.com> <aJs7az9VnJ6aUwQT@calendula>
In-Reply-To: <aJs7az9VnJ6aUwQT@calendula>
From: Qingfang Deng <dqfext@gmail.com>
Date: Wed, 13 Aug 2025 09:46:03 +0800
X-Gm-Features: Ac12FXzNLQ2I06D-K6hqfr8sYQe_RGJBMXpzwCmUOjCmWs9agLas_DuM8OKpd5M
Message-ID: <CALW65jaxyMq=1+SpajwT8x9w8sARAdKYX2yxKV1z_3XFXq8WYw@mail.gmail.com>
Subject: Re: [PATCH net] ppp: fix race conditions in ppp_fill_forward_path
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Felix Fietkau <nbd@nbd.name>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 9:02=E2=80=AFPM Pablo Neira Ayuso <pablo@netfilter.=
org> wrote:
> mtk_flow_get_wdma_info() seems to be the exception at this point, so
> I'm inclined to add rcu_read_lock() to mtk_flow_get_wdma_info().

Okay. I'll send a v2 with this change.

