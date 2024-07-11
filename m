Return-Path: <linux-ppp+bounces-71-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EF792E298
	for <lists+linux-ppp@lfdr.de>; Thu, 11 Jul 2024 10:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8841C284EE6
	for <lists+linux-ppp@lfdr.de>; Thu, 11 Jul 2024 08:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E8D1527AC;
	Thu, 11 Jul 2024 08:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D7jwt28+"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5895152169
	for <linux-ppp@vger.kernel.org>; Thu, 11 Jul 2024 08:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720687313; cv=none; b=pBO8RRucLLNZd4pj+SkOmUpmtYr/qolBtb5aUb53HV1MtpIciwNWpBoVc6y8D0S6enNSnCe7I9C2BhWFhSblujNePbMdCQ9l7zISWw4Jke7QZoXBjPaw4l/nI2Rbay9QPlRcfRgSP/siTaykOgjpNbx1Q0WhAnXHaY0W5jj4l8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720687313; c=relaxed/simple;
	bh=y30Jqp++2IFGTGHZWtjkecjFTK0AQrgd7dn+RTar6po=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aT0GGCHGBWVGqRmn1dd0hj3hDodr2Q+mBDlVeDjR//j0I3N4jWvOVks6AlicnlAa9x7M8Vet0wh150cNXqtR15mlqvQ+LIkSpycY6g+ZyA3Dkegg+DUitbglOXMpdAnHtzsSzt4anUo6nhzjo8UetVtL9zsXU+EQ1vYl5E+Wm3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D7jwt28+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720687310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y30Jqp++2IFGTGHZWtjkecjFTK0AQrgd7dn+RTar6po=;
	b=D7jwt28+B8ivRGVxZWTO+8kBOqY5dkpj9xdw7l+0P6VlOLOskKoNyhBHq5NdxYsQBmoQ/h
	41s9ca13cnK/41OSPvqfTkSUO2MDm3gp1xZfbJJlehQFZvR3t5aGVOX3l2S7PH+VRrO+5Z
	OCiYoXNAWJ6sMNnz1UN/W6j0Ra60pIQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-FOMHJdoWOYaNpnug96fktg-1; Thu, 11 Jul 2024 04:41:48 -0400
X-MC-Unique: FOMHJdoWOYaNpnug96fktg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4267378f538so1423055e9.1
        for <linux-ppp@vger.kernel.org>; Thu, 11 Jul 2024 01:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720687307; x=1721292107;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y30Jqp++2IFGTGHZWtjkecjFTK0AQrgd7dn+RTar6po=;
        b=rJnBT+7/9yosirMz1uP+5K9ftszgECWmyrba7FuwGGDwGlLXEvUHXZxRrqPapSwz5U
         hWDWegmPug99E+yaniSo4zpNnEgAUR6CTrRW+TTPK3LqOpMq9voE0wzqZQz8qkrlVktg
         8G80hEDwlyxOD0uekTsRYL5vp0MYXScfSy4ZS1/FquoyfjwNovN8uMWM5ERcnNI+e1Mv
         24VU9RZMT5y7frVgGotwruZEe0hO1o/lFFMSGWlRHdQD7R+Q6UCQ/S2gsT19tNC4Abqj
         /VSwumPyhSij58xk/N2Azh989HJookBazxyrJjaRe7wJxtYkGY/y/L9/XxqWKMpYs1WH
         UV2g==
X-Forwarded-Encrypted: i=1; AJvYcCWgveeHdhWilW8gR2k8pAT/OA6j3mQwlb7VYSHf/AeBE552hm3jBz/yT5oGQ4/QDLPP8nMu0rHReMdysOvoof7S+lRHaBhpAPbh
X-Gm-Message-State: AOJu0YzdlCQDIFLbdeaQi73st209cT3H/VYSFGT2P6/ed2CCLTUYCGkV
	lTH8W43sYVc59lKq0cP0KEJAEoKY3MLzFunNetQDji9boiL0qEMG/V7ssE2opYGimRhYuSjF+rd
	Ovw0JZBF8YSIRMkS4JfZ4PeybQqIFF9NO80YBw1vEOW0D8PGs5aNbrJbdsA==
X-Received: by 2002:a05:600c:3b8c:b0:426:4920:2846 with SMTP id 5b1f17b1804b1-4279834f1e5mr10957805e9.3.1720687307447;
        Thu, 11 Jul 2024 01:41:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHziNP+eSx3qFkHHfFaQqnwolckTG7DqbWZet5vk53/bk704bnkIgelJp9Anm3RDZbuac+ODw==
X-Received: by 2002:a05:600c:3b8c:b0:426:4920:2846 with SMTP id 5b1f17b1804b1-4279834f1e5mr10957655e9.3.1720687307027;
        Thu, 11 Jul 2024 01:41:47 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3344:1710:e810::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6f5a27sm107740045e9.23.2024.07.11.01.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 01:41:46 -0700 (PDT)
Message-ID: <e572a9447628fc6b6ff511df30d923176e664fec.camel@redhat.com>
Subject: Re: [PATCH net v2] ppp: reject claimed-as-LCP but actually
 malformed packets
From: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>
Cc: "David S. Miller" <davem@davemloft.net>, "Ricardo B. Marliere"
 <ricardo@marliere.net>, Eric Dumazet <edumazet@google.com>, 
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 lvc-project@linuxtesting.org, 
 syzbot+ec0723ba9605678b14bf@syzkaller.appspotmail.com, Guillaume Nault
 <gnault@redhat.com>, Jakub Kicinski <kuba@kernel.org>
Date: Thu, 11 Jul 2024 10:41:45 +0200
In-Reply-To: <20240709083012.GD346094@kernel.org>
References: <20240706093545.GA1481495@kernel.org>
	 <20240708115615.134770-1-dmantipov@yandex.ru>
	 <20240709083012.GD346094@kernel.org>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-07-09 at 09:30 +0100, Simon Horman wrote:
> + Guillaume, Jakub
>=20
> On Mon, Jul 08, 2024 at 02:56:15PM +0300, Dmitry Antipov wrote:
> > Since 'ppp_async_encode()' assumes valid LCP packets (with code
> > from 1 to 7 inclusive), add 'ppp_check_packet()' to ensure that
> > LCP packet has an actual body beyond PPP_LCP header bytes, and
> > reject claimed-as-LCP but actually malformed data otherwise.
> >=20
> > Reported-by: syzbot+ec0723ba9605678b14bf@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3Dec0723ba9605678b14bf
> > Fixes: 44073187990d ("ppp: ensure minimum packet size in ppp_write()")
>=20
> Sorry for not noticing this earlier.
>=20
> I think that the cited commit is not where this problem was introduced.
> What that commit does is to introduce a length check.
> And what this patch does is to add another, more specific length check.
> But the problem fixed by this patch existed before the cited commit.
>=20
> I expect that, like the cited commit, this patch:
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

No need to resend, I'll update the tag while applying the patch.

Thanks!

Paolo


