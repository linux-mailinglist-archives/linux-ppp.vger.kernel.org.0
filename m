Return-Path: <linux-ppp+bounces-84-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D8C974235
	for <lists+linux-ppp@lfdr.de>; Tue, 10 Sep 2024 20:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A80061C25565
	for <lists+linux-ppp@lfdr.de>; Tue, 10 Sep 2024 18:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB59A14A088;
	Tue, 10 Sep 2024 18:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=in-unison.com header.i=@in-unison.com header.b="HiZOOIkF"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F091369B6
	for <linux-ppp@vger.kernel.org>; Tue, 10 Sep 2024 18:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725993063; cv=none; b=DkDPITxe598f7f3sS6vkQgjb7SjhMiVzQPGAO+mCFPUS/NpeB2pYT2gtSFkLKAm4PDHQ5qDp6Gij4M92Kq/prDLDutSXQYuBeb0OXKcqc0A1XgzbePGZvueX1jsb8Ig+UzRgXgMCtJK+Lo4BW7nyywT7cAFcCKhesHVr5pKAJAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725993063; c=relaxed/simple;
	bh=GxwoYV37Xb/LXRYrMZHzRnmyxQrXclajI1moXy7fz/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1atkCgQKiWh3hbCitvAT9lVRZVyuhazh8HQ7JybP09GsPD1Tsii1CZVcspcvBgAJk4i67WPgVpP04sWgoRjReKzsQsB7/wP1ov0AA1asjiOthPOhqjtN8sce727W6IcJwZaTrzFGHzy9zUlijIrUh9Wr6WG0R6JQf/H7V4xgaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-unison.com; spf=pass smtp.mailfrom=in-unison.com; dkim=pass (2048-bit key) header.d=in-unison.com header.i=@in-unison.com header.b=HiZOOIkF; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-unison.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-unison.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5356a0a56f4so890016e87.3
        for <linux-ppp@vger.kernel.org>; Tue, 10 Sep 2024 11:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=in-unison.com; s=google; t=1725993059; x=1726597859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jui5itSTA65IO2WrnPM+lsz8Qma5ocPtjf/uonE0CQo=;
        b=HiZOOIkF0hlJMamhJTjcQLIPXkZ1zXglCmaNE8wHaMElulxau44CX2ym0LGM89J02T
         igYWw5wNaQnjAwp/fcyCPV7WXKv2TLOBw+3nao4rQRTG6m3mNbI5LWmiPwDtEkiDhKi4
         XHXvUegmhIyTz4wf+Oxo11X3CRXcnVXxifkDTBh3BY1ITA+14Fd9LooA881qLQGTuNAE
         2ploXowFV2DpZWrXYK8M4S8tYqoY6zlEsihpYucYjkEb2fFz6/eEB4kqS8yveNL5HSQF
         YfZLNVwnXJsA6v2QzmbejAkAk86r0oFofldP2jZruEaBpYY2/tPJw5IonFKGInVfg7LV
         AKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725993059; x=1726597859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jui5itSTA65IO2WrnPM+lsz8Qma5ocPtjf/uonE0CQo=;
        b=bQfuGgi0v4brOHtkRe50ICJ0rl9Dp913icHf0HJb+BUbtzqHVVAKtRYtkqtP7O3KF1
         xyqBbAK2VeR4dnPCqCYMjsv+s52r7uik7Y/hjw3yrY7o0r+RMR+PvkBdz5REd5SVBJIg
         g6vSgqVWz3O8EqLuxllcmgaks44WeOnM0eFoYyAervti52crpDqjT56oSRnp5FAMAWav
         yq0A/zdIuteD2lKTJuX4GNp8vh9qlcZ9Yl/kh7mX38EjNIEx9tI5l7wzES2lytCRJyav
         svuB2jobZ31PpxyphatNvSd6GDE5IvUVFkVDCIds01gHIB7Y0/yyVxNfh2hQZvNZCLox
         bfpQ==
X-Gm-Message-State: AOJu0YwbAuUDgW6F4amwBeLKwige7GAvnLtb8/kau/sFT54nPNipxuKg
	pTBlDCaMc+TE09rz4QzrZdLfXM/Mx7vQlBc5n37Wh9sVcYasfy8pLLPBir7Y4JdZoNYpCzZSqAX
	iouQSd2imEkINVA4ToodFO9EJ9zocDUM4F9kIYT2eT8p124Uto4nzMw==
X-Google-Smtp-Source: AGHT+IHmaCndIMMjc2r4WwWyeBkcPKHJHcINxMBDES2q2FCE5xAuYf8yPTHm/fNF6EuzsmVA1OJ7YzJDkzNgW3+jViM=
X-Received: by 2002:a05:6512:3d26:b0:52f:287:a083 with SMTP id
 2adb3069b0e04-5365856e56cmr4502582e87.0.1725993059230; Tue, 10 Sep 2024
 11:30:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPKvdWd3rGxir3MEKrcfdjD4NfOQpCttv3yFPXY=Q35-8cs2Tw@mail.gmail.com>
 <358952.1725971979@dyas> <CAPKvdWdXozAW6DTtXpFix9ZYOQ956AMTqMCHhrGEX6BixA8AKw@mail.gmail.com>
 <377699.1725992617@dyas>
In-Reply-To: <377699.1725992617@dyas>
From: Devesh Chipade <devesh@in-unison.com>
Date: Tue, 10 Sep 2024 11:30:48 -0700
Message-ID: <CAPKvdWcQH207rUofzgHYvCa6_ULs5dWxEvRbqmw5+PeYY5QYqg@mail.gmail.com>
Subject: Re: PPP Modem Hangup
To: Michael Richardson <mcr@sandelman.ca>
Cc: linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In my options file, I have debug and kdebug 7.
This is all the logs I could get:


logcat:
09-04 14:44:21.829 24869 24869 I pppd    : Using interface ppp0
09-04 14:44:21.829 24869 24869 I pppd    : Connect: ppp0 <--> /dev/ttyMSM0
09-04 14:44:21.831 24869 24869 D pppd    : sent [LCP ConfReq id=3D0x28
<mru 128> <asyncmap 0xa0000> <magic 0x2fe08c15> <pcomp> <accomp>]
09-04 14:44:21.854 24869 24869 D pppd    : rcvd [LCP ConfReq id=3D0x28
<mru 128> <asyncmap 0xa0000> <magic 0x3ffaa0d> <pcomp> <accomp>]
09-04 14:44:21.854 24869 24869 D pppd    : sent [LCP ConfAck id=3D0x28
<mru 128> <asyncmap 0xa0000> <magic 0x3ffaa0d> <pcomp> <accomp>]
09-04 14:44:21.859 24869 24869 D pppd    : rcvd [LCP ConfAck id=3D0x28
<mru 128> <asyncmap 0xa0000> <magic 0x2fe08c15> <pcomp> <accomp>]
09-04 14:44:21.861 24869 24869 D pppd    : sent [IPCP ConfReq id=3D0x4f
<addr 0.0.0.0>]
09-04 14:44:21.880 24869 24869 D pppd    : rcvd [IPCP ConfReq id=3D0x28
<addr 10.0.0.1>]
09-04 14:44:21.880 24869 24869 D pppd    : sent [IPCP ConfAck id=3D0x28
<addr 10.0.0.1>]
09-04 14:44:21.882 24869 24869 D pppd    : rcvd [IPCP ConfNak id=3D0x4f
<addr 10.0.0.2>]
09-04 14:44:21.882 24869 24869 D pppd    : sent [IPCP ConfReq id=3D0x50
<addr 10.0.0.2>]
09-04 14:44:21.897 24869 24869 D pppd    : rcvd [IPCP ConfAck id=3D0x50
<addr 10.0.0.2>]
09-04 14:44:21.898 24869 24869 I pppd    : local  IP address 10.0.0.2
09-04 14:44:21.898 24869 24869 I pppd    : remote IP address 10.0.0.1
09-04 14:44:26.800 24869 24869 I pppd    : Modem hangup
09-04 14:44:26.800 24869 24869 I pppd    : Connect time 0.1 minutes.
09-04 14:44:26.800 24869 24869 I pppd    : Sent 0 bytes, received 1316 byte=
s.


dmesg:
3:msm_serial_geni0(53):131203 GICv3:190b6400.qcom,bwmon-llcc(32):86828
GICv3:19091000.qcom,bwmon-ddr(33):58165
[ 4529.150036] (cpu:irq_count)- 0:318453 1:255610 2:1953373 3:2116553
4:1351087 5:1350685
[ 4529.150116] (ipi:irq_count)- 0:3822209 1:149695 2:0 3:0 4:0 5:370658 6:0
[ 4530.754440] init: ... started service 'console' has pid 25224
[ 4530.759148] init: starting service 'audioserver'...
[ 4530.768765] init: ... started service 'audioserver' has pid 25225
[ 4530.769623] init: starting service 'vendor.audio-hal'...
[ 4530.779094] init: ... started service 'vendor.audio-hal' has pid 25226
[ 4530.779157] init: Service 'console' (pid 25224) exited with status 0
[ 4530.779181] init: Sending signal 9 to service 'console' (pid 25224)
process group...
[ 4530.779346] libprocessgroup: Successfully killed process cgroup uid
2000 pid 25224 in 0ms
[ 4530.780358] init: processing action (init.svc.audioserver=3Drunning)
from (/system/etc/init/audioserver.rc:35)
[ 4530.780380] init: service 'vendor.audio-hal' requested start, but
it is already running (flags: 4)
[ 4530.911254] healthd: battery l=3D100 v=3D4068 t=3D25.0 h=3D2 st=3D2 c=3D=
-116091
fc=3D3588000 cc=3D0 chg=3Du
[ 4530.985181] servicemanager: Found
android.hardware.bluetooth.audio.IBluetoothAudioProviderFactory/default
in device VINTF manifest.
[ 4530.986106] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[ 4531.739378] healthd: battery l=3D100 v=3D4425 t=3D25.0 h=3D2 st=3D2 c=3D=
109499
fc=3D3588000 cc=3D0 chg=3Du
^[[A^[[A^[[A^[[A^[[A^[[A[ 4532.423386] logd: logdr: UID=3D1041 GID=3D1005
PID=3D25301 n tail=3D500 logMask=3D8 pid=3D25226 start=3D0ns deadline=3D0ns

On Tue, Sep 10, 2024 at 11:23=E2=80=AFAM Michael Richardson <mcr@sandelman.=
ca> wrote:
>
>
> Devesh Chipade <devesh@in-unison.com> wrote:
>     > I get the following output:
>
> Looks sane to me.
> I had problems with my ISP connection where one of their DSLAMs would not
> answer IPCP echo requests if there was already traffic flowing.  I had to
> turn off that check at my end, but you already did that.
>
> I think you'll have to enable lots more debuging, and maybe throw in a
> printf() here or there.

