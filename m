Return-Path: <linux-ppp+bounces-262-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 108EFA4447C
	for <lists+linux-ppp@lfdr.de>; Tue, 25 Feb 2025 16:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E29F16CA3D
	for <lists+linux-ppp@lfdr.de>; Tue, 25 Feb 2025 15:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58384315C;
	Tue, 25 Feb 2025 15:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PzFDClw8"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C613F9D2
	for <linux-ppp@vger.kernel.org>; Tue, 25 Feb 2025 15:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740497582; cv=none; b=ALY6Tbkjb8/AfGek3rZ0FrI4loWjcxTix9PAFxTVi4gQm3/i6nYmSn7k4ANrMQGrvkooPNO1I5sHIDLXIhvECrolOqXaNhzEny0QP43Fwy2KnUhUMQRmAD8cbDoVh27gTVAQ72ze7SXfqX35sBLDIE6zN9jEVngNyJXrcblYVFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740497582; c=relaxed/simple;
	bh=C9Crx40HbvCbn4GeoVtQ3Ygq3ygOQ9nSYyB9A++NoMg=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=L+SS9BzNFFXBvSkSGEvdwTdqXqqV81SPw4Hqs4VP81STZlRS2LnKvMF6me/uuA2CuieUmi/O7SVirtys7cz1f4VbgtnTlA6yKgRnSGfLlnxSP/JHp+6iqUJoOa8czo1D67vzzGix12FZZnCSLT0BLuZiZX/8JGf5LF+/mFU72YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PzFDClw8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740497580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C9Crx40HbvCbn4GeoVtQ3Ygq3ygOQ9nSYyB9A++NoMg=;
	b=PzFDClw8RZ2FTOv8hlXfQbbFkHFJJHPzSPjsHlZDuTWosNU4jcsZ+Co9fIAcDCKDLQ8tMR
	HKcghCggnnnLTQL3ZOiSRYhC5SCI7XZ5hf3Ido0XJLUH1aAU0gwPNNaknzaY5z3NJqqOLR
	zV1gnr/RlcGselpCXqH475bKDup80IU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-e_CRLVRMMgSp23J4hMwU7A-1; Tue, 25 Feb 2025 10:32:58 -0500
X-MC-Unique: e_CRLVRMMgSp23J4hMwU7A-1
X-Mimecast-MFC-AGG-ID: e_CRLVRMMgSp23J4hMwU7A_1740497577
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-abba896add9so479922566b.1
        for <linux-ppp@vger.kernel.org>; Tue, 25 Feb 2025 07:32:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740497577; x=1741102377;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C9Crx40HbvCbn4GeoVtQ3Ygq3ygOQ9nSYyB9A++NoMg=;
        b=LlnaSFHr7uZ1gwWzb8t5KdfoqQZHRWqrbO6baPsrM34KY0Kt94wZncBAXK0FvwhAQk
         yR3dQhyEmbc82HwKXLvGXhIky0ml5K2uh6BsKuvNqKSdtJjkNJ1iZ1Iqgiil26lFkrFW
         937mKpTdIfVv/WKF51eOKJO7Ja7+7AkMITioVUypfrsuI9bE0Mg0tF7tPhV3MBdlY49Y
         0osydFQrr/AQdzO0VrfkMoZzsdzXjS4QXf8WQLIW+7w2VNogHwO1l/ujwc4tfNHzNu7z
         AmKGvhnh5GoU1PNNhLu2mnUjA76V0O27+8t+MWB89nxlNx3S116nK/oNrWNjEbjADh04
         I6yA==
X-Forwarded-Encrypted: i=1; AJvYcCU//ZFpZnn68Iyg7NpHSRmZYVW0G1PJ8yq8twzD2+Cu9/QX3Ru9+OG9+4puAfAfbBC66Ya3rTtka28=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKhMcPsRXdJc2dQknOhhonTXff8ZEeW1KoaC2k8Azs7mDgL2K+
	JpQrD3R7LKRkB3BbeRy9zOW5aaBS3OWV5UgxJEVxvVHAvbkjzQUtSVb7nGPMf8vg5SQdHowqfBv
	/e08CLCW4zrNARFu0HvCqXc19KhNuV755uidvObZplFPYRVCuKvqMc34dxQ==
X-Gm-Gg: ASbGncvn5bddXCMGlYJ4i9CPOt2yfypkc0RJN2XF5GGIBCLTk0eXgdaEKnzGexnHMrJ
	cUhRtxSZMfJatxpgB21mzjuHESjUxakdSlzNsrpnyKME0N11jQjJL+hlvWmWYIIR0qou3sP+ykF
	0ZLnmjC1W5Ln8Wdx53xDpWDA+vbvBwY8+QHvlQ7UJLoPZ3yXvc/osclsxtz9ELPnAbiFW84Y9uM
	gKl6Zst1aK9BczNvN234fYFNt6OOWlDPe5wCrHN7YcKRL543iuoOcPdg/FaLAfw90qkLwDf/Get
	PqmK1//J+Whn
X-Received: by 2002:a17:906:30cb:b0:ab7:b878:e8bc with SMTP id a640c23a62f3a-abc09c19ea5mr1607976966b.38.1740497577474;
        Tue, 25 Feb 2025 07:32:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFF3+i2Gm1aUPhUaBNxj5u5tbwyt3MeVX876gWJD/IfWjY9OJnLQDc37H8S9ky+bGoOp9yVRQ==
X-Received: by 2002:a17:906:30cb:b0:ab7:b878:e8bc with SMTP id a640c23a62f3a-abc09c19ea5mr1607974366b.38.1740497577103;
        Tue, 25 Feb 2025 07:32:57 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed20134fdsm160623866b.94.2025.02.25.07.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 07:32:56 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 5505318AFCBC; Tue, 25 Feb 2025 16:32:55 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Qingfang Deng <dqfext@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Michal Ostrowski <mostrows@earthlink.net>, James
 Chapman <jchapman@katalix.com>, Simon Horman <horms@kernel.org>,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH net-next v2] ppp: use IFF_NO_QUEUE in virtual
 interfaces
In-Reply-To: <20250225032857.2932213-1-dqfext@gmail.com>
References: <20250225032857.2932213-1-dqfext@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 25 Feb 2025 16:32:55 +0100
Message-ID: <87a5aaxcns.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Qingfang Deng <dqfext@gmail.com> writes:

> For PPPoE, PPTP, and PPPoL2TP, the start_xmit() function directly
> forwards packets to the underlying network stack and never returns
> anything other than 1. So these interfaces do not require a qdisc,
> and the IFF_NO_QUEUE flag should be set.
>
> Introduces a direct_xmit flag in struct ppp_channel to indicate when
> IFF_NO_QUEUE should be applied. The flag is set in ppp_connect_channel()
> for relevant protocols.
>
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
> RFC v1 -> v2: Conditionally set the flag for relevant protocols.
>
> I'm not sure if ppp_connect_channel can be invoked while the device
> is still up. As a qdisc is attached in dev_activate() called by
> dev_open(), setting the IFF_NO_QUEUE flag on a running device will have
> no effect.

No idea either. I don't think there's anything on the kernel side
preventing it, but it would make the most sense if the interface isn't
brought up before the underlying transport is established?

Anyway, assuming this is the case, I think this approach is better, so:

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>


