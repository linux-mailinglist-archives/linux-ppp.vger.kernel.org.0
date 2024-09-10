Return-Path: <linux-ppp+bounces-82-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D95973D89
	for <lists+linux-ppp@lfdr.de>; Tue, 10 Sep 2024 18:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49F6FB23756
	for <lists+linux-ppp@lfdr.de>; Tue, 10 Sep 2024 16:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E10A14F12C;
	Tue, 10 Sep 2024 16:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=in-unison.com header.i=@in-unison.com header.b="Dowz3pXE"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1A613A3E8
	for <linux-ppp@vger.kernel.org>; Tue, 10 Sep 2024 16:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725986576; cv=none; b=AChAptkarMyqdESSFxWu4sfv8IR5bTRlcuQ8nak5YoiOESYZRAqluLVl4Q3PYOfDLn8WLKpM+TPJoV224csVKC5hxsHmcSezjYBXvy5f8SsQytWeHOOUnLMJIM/uKMHSII7PNb1IOfvFAzyN018bwD9ghvDaRqbfvwo7PCiFSQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725986576; c=relaxed/simple;
	bh=Y6zUfnTXeOQMpg9EwvvwZ6oRkTcpvtUKi3OUs8n5bo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmmZqC+2jdp6rT0hMkD2LCBIBrOy01vanNRJKThMR0HUHcFhjht1h7fewhwLlG0WtAfwgcyaoA+nrwTaD/voek9O0WeGp8CL/24A8c+zV2vP8NRrAiiDpSmrNWpuLNSb4vmwNMta0CH5XLb2qY0wSF7qL4NKspLIVM+K3j8cfbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-unison.com; spf=pass smtp.mailfrom=in-unison.com; dkim=pass (2048-bit key) header.d=in-unison.com header.i=@in-unison.com header.b=Dowz3pXE; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-unison.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-unison.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5361bae70b9so851234e87.3
        for <linux-ppp@vger.kernel.org>; Tue, 10 Sep 2024 09:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=in-unison.com; s=google; t=1725986572; x=1726591372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEaZ2Exu6aiAUzlu8It3d4+Cago/rrZ4cDDFTvP7+PA=;
        b=Dowz3pXEVfbg4xRT+J3Ny1fRVw7c7l6e3zRqz7oAYARH7svo311dOg+p4cU0JFt8mM
         fkPcqdVfxCEEmNb263kVUkDa4hn6wF+VNw1u3NBWvN2N/P1p7fDWvD/4Hp+5XTnMK9cl
         WtfESe57JQLswHzmlZVxwbqY0LllQsfgc/p1oQLWotwa8JButcCM5BMaFAe3Xh4UUjWC
         U4PaVKcEdKRfb2GJ4bPtM9b0ARFnvldNpv7fxe76KI7Why4PNTFM6rFZEkq21feyrIK9
         xj49rrx34LfJOgf19jmjv1M0tXAy3y6HB5y55zG20TJ9qdhPGs9k6RI5yrW0jra8XCY1
         u/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725986572; x=1726591372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEaZ2Exu6aiAUzlu8It3d4+Cago/rrZ4cDDFTvP7+PA=;
        b=EwQsX0sWGy1SU8zW6SZnRThLndA82vglN2MqfVe4qgWBE66C2hs+l+eUOHnDPyoxYd
         ZQb2QyutRNk0V2143zHcbK+waaHnwcmzi7D20HZMcWc9iPMkXV+BeEDrpzrx9fD6sVbB
         qfWJ/cq15tG34oIj++NIQxJPCepoy5sAf9TsGF3I8UoSKs2Z+UbSaQ32sqeigGVt9uMc
         yOvkjmXjmjEU++0YOmvwtGpIpDpWs9JKo1mFCvPYYtBIuKniJ6Yi5OCKRcyEjp7quVDl
         bTvOlWkKoU0vatlEqtVXQNAx+BnHkbGfJfWYAIz3PIxy/juKsGLvXi7eibepAPIN2j2b
         yTig==
X-Gm-Message-State: AOJu0YxMY+nbBROkpqZXgOXLR+NOflvOyam/gNiA6+cnB7Z5Cyq36/nd
	U6qgRNDb4r8MA1aQD0xVtKMiib3emBiel5AwE9EBbk/ZdnBULUve9upogn0zJDylTniHYgatz5D
	KWvi3Fg1WV4NgAhgAtCQSqX4FC6ZkXxB5AO6ABg==
X-Google-Smtp-Source: AGHT+IHK/Y6sG4Eci4tBEokw5jUyrmi7b5mzOo+jgWfYACSl2LnxmFU32087BXoqDgTj1ddmCG5G/ewdEnsGV6PSxxI=
X-Received: by 2002:a05:6512:3d16:b0:536:5821:e419 with SMTP id
 2adb3069b0e04-536587ef0a6mr4164259e87.4.1725986572091; Tue, 10 Sep 2024
 09:42:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPKvdWd3rGxir3MEKrcfdjD4NfOQpCttv3yFPXY=Q35-8cs2Tw@mail.gmail.com>
 <358952.1725971979@dyas>
In-Reply-To: <358952.1725971979@dyas>
From: Devesh Chipade <devesh@in-unison.com>
Date: Tue, 10 Sep 2024 09:42:41 -0700
Message-ID: <CAPKvdWdXozAW6DTtXpFix9ZYOQ956AMTqMCHhrGEX6BixA8AKw@mail.gmail.com>
Subject: Re: PPP Modem Hangup
To: Michael Richardson <mcr@sandelman.ca>
Cc: linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I get the following output:

on AOSP Target Device:
# stty -F /dev/ttyMSM0  -a
speed 115200 baud; rows 0; columns 0; line =3D 0;
intr =3D ^C; quit =3D ^\; erase =3D ^?; kill =3D ^U; eof =3D ^D; eol =3D <u=
ndef>;
eol2 =3D <undef>; swtch =3D <undef>; start =3D ^Q; stop =3D ^S; susp =3D ^Z=
;
rprnt =3D ^R; werase =3D ^W; lnext =3D <undef>; discard =3D <undef>; min =
=3D 1;
time =3D 0;
-parenb -parodd -cmspar cs8 -hupcl -cstopb cread clocal -crtscts
ignbrk -brkint ignpar -parmrk -inpck -istrip -inlcr -igncr -icrnl
-ixon -ixoff -iuclc -ixany -imaxbel -iutf8
-opost -olcuc -ocrnl -onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0
bs0 vt0 ff0
-isig -icanon -iexten -echo -echoe -echok -echonl -noflsh -xcase
-tostop -echoprt -echoctl -echoke -flusho -extproc

on Ubuntu/Linux machine:
speed 115200 baud; rows 0; columns 0; line =3D 0;
intr =3D ^C; quit =3D ^\; erase =3D ^?; kill =3D ^U; eof =3D ^D; eol =3D <u=
ndef>;
eol2 =3D <undef>; swtch =3D <undef>; start =3D ^Q; stop =3D ^S; susp =3D ^Z=
;
rprnt =3D ^R; werase =3D ^W; lnext =3D ^V; discard =3D ^O; min =3D 1; time =
=3D 0;
-parenb -parodd -cmspar cs8 -hupcl -cstopb cread clocal -crtscts
ignbrk -brkint ignpar -parmrk -inpck -istrip -inlcr -igncr -icrnl
-ixon -ixoff -iuclc -ixany -imaxbel -iutf8
-opost -olcuc -ocrnl -onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0
bs0 vt0 ff0
-isig -icanon -iexten -echo -echoe -echok -echonl -noflsh -xcase
-tostop -echoprt -echoctl -echoke -flusho -extproc

On Tue, Sep 10, 2024 at 5:39=E2=80=AFAM Michael Richardson <mcr@sandelman.c=
a> wrote:
>
>
> Given that you have:
>
>       local                     # Do not use modem control lines; assume =
a
>
> then pppd ought to tell the TTL to ignore DCD drops.
> Is this a real serial connection, or actually serial over USB or PPPoE?
> Looks like USB0.  USB/TTL adapter I bet.  Are other pins being used for
> (JTAG) programming, reset?
>
> Maybe "stty -F /dev/ttyUSB0 -a" (as root) during your magic 6s.
> Is clocal set?
>
>

