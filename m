Return-Path: <linux-ppp+bounces-110-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB649C1658
	for <lists+linux-ppp@lfdr.de>; Fri,  8 Nov 2024 07:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D067D1C22809
	for <lists+linux-ppp@lfdr.de>; Fri,  8 Nov 2024 06:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27EC1CF291;
	Fri,  8 Nov 2024 06:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKHLiO6q"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CEA1CEEB6;
	Fri,  8 Nov 2024 06:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731046210; cv=none; b=qOX+RWdPpKqS8CKidUkKG3X+mVg5SCIq3C4rtmyn4qg+YDSV8aR17hT6TZLnCUm34mdiMgDH8/bNl2isv/nS9VUPUxQRE8BQSIWjBQ+Qwiu6xfY3LkWXn974Ihf1AZjUgsQ9noX7inDdJ2Uc/6kAUnpOEBogdc6pWQClP6M2TTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731046210; c=relaxed/simple;
	bh=QNRHmkQNttL4XBC1OFrUpsQWNzgq+Jf7VcqAcf7oIns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FeKgXsRrGWha8+WY03/XTrHT/nFhp+SxI/DJT/lSxLDiR3Ife9Bb7uSezAoTyWkFw38/w8yg283kF5X9LMAUqf4eULl5vELK8gJ404hlQTewZnl6qYltGvwbbhk2SGD0GY5mzyxFIx4901n2ZmuP7cQZPXvkPr0eRLfAafeVZvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKHLiO6q; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e9ed5e57a7so14853877b3.1;
        Thu, 07 Nov 2024 22:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731046208; x=1731651008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNRHmkQNttL4XBC1OFrUpsQWNzgq+Jf7VcqAcf7oIns=;
        b=hKHLiO6qIvV4X7pDmYH7jbZvupO+ApIEz/VKn8wmaUxK3oQzmBO2fgjFPMf0d9sVeM
         s7xuRlL//KRtVR850/ZciHWrbKg+DJo8m47RvkUYpJV+DhS6vulGSp5E/C/myb9EKLxN
         +B245Xi8vnx7Ivm2uuvMc0NvI09to1l7kHl29kmn5ssdzXr3dZznTWh4pHUWvUIbem45
         DgU+CGd49zFw4UDxM+NN2hzBJ5ThUWYwWMX2eFdVAmVACIcQvoCIn+kZkH2IG/n4MnP+
         ouY65Kn9esBW5je0JKtoSHrItQy+NoKKs8r8W5pMnuJUEFFFlD21zAMqbO2IheDT2O26
         zQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731046208; x=1731651008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNRHmkQNttL4XBC1OFrUpsQWNzgq+Jf7VcqAcf7oIns=;
        b=swyN9Z6S5jaeNcBeIGUIsQnkOwydjAeIky2ybAkbBgkiph5YBK1V5X+tuT+Hva3Fu6
         A6WJZHuHQNwcCXvqvzjlhlE1Q7SQZvhsd9dxW4U9qFcbQJGEHUNuu1gQbgyQP+L5sQjS
         4N1oo84UbtHt0l71rCWevFD/53zRwo9DF4kK0ueJR3AAk9zHoN0dDPYPZmvMtZZRktpm
         bm6JNY71PGAEnm7gaNygsmkGEpPdFilflSyIe1uvlHru6qqztTMTtDUSaD2V2NYngqO0
         nVx675MOKmWvoOzoluCK4a8gcaTu8ISJDJEtG09rxXOxUeGwf/neMmPIhOKYwvpdxQAL
         SMOg==
X-Forwarded-Encrypted: i=1; AJvYcCUi6Jsh2vsldJsDp1Nq05FZxAK1Fe5axlA4Yui7R5PWvCWdxmwjMeIhqwfOhERWfnBinj2ppUIp/Om7S5M=@vger.kernel.org, AJvYcCUijrNVhA13IEZsxPaksq+lxII/CgOk7V3/SO9rdmeNsHdqjz5MyqWxgJcYLmbesN03PZmCE2y0oZlW@vger.kernel.org, AJvYcCX7RSAFyALU5Sc0lPzWGQ6Ts9oTYb3HBgayyB/MlPa348M9IP92u72fZNt2K/xxmgJ8CkW4URwR@vger.kernel.org
X-Gm-Message-State: AOJu0YyVTNaY/+KTYth3AmgPJ6CXEMa2nQf9YfUqnmM9e6TN/04M2oQe
	ES6GgbMrNfSDjxJy0xebnHS9JpQ8v04whERG8o1qSvJm1/BqxUjs0M9WW+k93Q3LG3Ezut4gTi4
	SQZ/nAO2l2mVh3reLjLAoRnX2r+U=
X-Google-Smtp-Source: AGHT+IHHn/w8b4Tg7Hd4Sr58w27FsTmfn+08/QY7kx6hk8l4BQYd7+PswpjPKal/gGm8RzZk8IrMXvQgoIbSuzppJkw=
X-Received: by 2002:a05:690c:6302:b0:6e5:bf26:578 with SMTP id
 00721157ae682-6eaddd96d06mr19916317b3.17.1731046208488; Thu, 07 Nov 2024
 22:10:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104092434.2677-1-dqfext@gmail.com> <7e0df321-e297-4d32-aac5-a885de906ad5@redhat.com>
In-Reply-To: <7e0df321-e297-4d32-aac5-a885de906ad5@redhat.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Fri, 8 Nov 2024 14:09:37 +0800
Message-ID: <CALW65jaKn7HQth6oYYHWYvg7CTZJj2QH66nHyo41BNjAA15Y7g@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ppp: remove ppp->closing check
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

On Thu, Nov 7, 2024 at 8:08=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
>
>
> On 11/4/24 10:24, Qingfang Deng wrote:
> > ppp->closing was used to test if an interface is closing down. But upon
> > .ndo_uninit() where ppp->closing is set to 1, dev_close() is already
> > called to bring down an interface and a synchronize_net() guarantees
> > that no pending TX/RX can take place, so the check is unnecessary.
> > Remove the check.
>
> I'm unsure we can remote such check. The TX callback can be triggered
> even from a write on the controlling file, and it looks like such file
> will be untouched by uninit.

ppp_release (when the file is closed) calls unregister_netdevice, and
no more writes can happen after that.

>
> Cheers,
>
> Paolo
>

