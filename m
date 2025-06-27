Return-Path: <linux-ppp+bounces-311-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FD5AEB2CB
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Jun 2025 11:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5A285671A9
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Jun 2025 09:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33AED27F00F;
	Fri, 27 Jun 2025 09:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUuKt6Ez"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A782F293B44;
	Fri, 27 Jun 2025 09:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751016300; cv=none; b=ITPEEHc5g7YNNmeEZdcXrliUPgbZ1PFsZ8u7yIkhrIeXUyR1BOtDtHUeb8KswwNYi5Yue9V+j/1U84f9ZuvnvCI6K28aSSXvblwEMIRQ1y+UxBqrxKjCofWyzjAeHbJ2ISwCYyPycPs8sHMYVtvflCyBxESNhscFNah8NgwYkR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751016300; c=relaxed/simple;
	bh=fTMx8rb32wbLt/IUEYiBHCCWHWc+a7WER+T49cPbs0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pv1IDfTEdqVLWcfhATHczrzk+CQQihJ7iw2C4nXHc9P+msiJWcW98oKthQc479AdiMlRY+98G29GaQ30JbkVhSyJ/N05OMi5AAPUldStzWazqefq1S/iW6MVbWgcc5jxA9k8EIvH3K5Uqk6mr8IqFRUvpKIfFzTRvf8+ZgwPIFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUuKt6Ez; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e3c6b88dbso15042937b3.0;
        Fri, 27 Jun 2025 02:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751016298; x=1751621098; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTMx8rb32wbLt/IUEYiBHCCWHWc+a7WER+T49cPbs0Y=;
        b=fUuKt6EzBJ8OU9fiF35QW8xoV8uvWFsEjbxOHkyfJ2Zi0llrxfCg08WHApaWZNwFDI
         E6vWJ42Bn0g5oW2kstQxmtqHeiJCJPQH3Lcq3ep+yUt5GeHh+e2jZf827OXT7CyY1Sng
         gK2iCToQhZZej9tDq9jwHD4UqkVMqZd6OfTYtnSnuNJh9lLyaZHgVxc8rnFap1s1/0ru
         yl913zzGyGlVihkhxj335UzcCnDh57Q97IHkObSsY9EFlUf1tngdAMVNtDzSYZgW2GXM
         HfqsxyPQbmUMzTGfOApi3rz4xk5P8G6pFXZ8F76Z/dL92vWpBCVQgAdq8U7ba/+oyqc6
         XAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751016298; x=1751621098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTMx8rb32wbLt/IUEYiBHCCWHWc+a7WER+T49cPbs0Y=;
        b=Bk/D2BDJYShDc5WpLTkq6FoMqok+64d2nqan0cxMtjMRLQ780tlDZ8B6ixMkcN0CRG
         NGrT9b4dZaJk4OA3tYn9Gz0bzquxSxXue5B9DifkfRKKyQKst8NcONjGOqhAg+3JZDrU
         f5bRB5VUOQaOLQJfNjXR+DwquBBZoGVSlH1YLF7N/SwdZa1V83gB2z0UpMjbHt06O26C
         EYJVJbkWSD++4OQV3D9alHQoQj9SPRvTBpTJiu3hSLdjWKQVd70IvSGTkHI03abKbJC5
         mdlbxcxT8381Wftvc25BNScA8URWZ883lVcT3Y1oMpVQOZdLbAtXyd+usB6HskRb5xFP
         drhg==
X-Forwarded-Encrypted: i=1; AJvYcCUKNW+g519mn6Q/CBERbLIRcu1nXOTyd7xjF1kdmWJsIFG373iPug/uVNXoc48+5TVQdAHBqIMk@vger.kernel.org, AJvYcCUT+9DWX3XdhybauliZxxOKvCfWkgkVdwMhblSf9sM5dBAp6HuymF9kHszoOtDvPe9EpxTe15Ur5eVd@vger.kernel.org, AJvYcCUbvn1mHVWWmFEDuMfHRWdqGPTVjjG+6U9lWT9qLS1VAtzw43OvTx2SZc0EmXgYgOk70GCiZaTGuoUlyN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcWUg3Zlq+z59Uoa/619sOvm0fcICXL+u1wvZ+cVw2Zz0d/HDF
	znHAuxK0k4HoNATBkFYDRmsPCBFXgnvkg7iVNjtBaPBlIQ/lPHL4pzxrHpAUdVCu4axWa2bhzJm
	+SNMXhPw8UpOiQlEirdwDZSwwztS4JHI=
X-Gm-Gg: ASbGncuRUVojFCRR6DmlB4NYLqJ+pMr1PfFDCmyLn0OBWknu5mhA/S1Sk3hK0/li+uX
	b6KHur/1BCmnRVRT3Pu/MfXTNSfivuWXirnPs7Gppz4NFua0Gdag2T3syjHk2GFtAcBa/LE30Ra
	HmlYjng+6H+GlRH/esZk/63rnMu2rDCF3uCYrF9lM6Grmwqch0Uvu8U4Ga1bU=
X-Google-Smtp-Source: AGHT+IGNZcANUoWP2jrMIN61xvoSkkh9KBZ4rbYthxo5FCWebGW1fUx33iM4krJaMn+WsZpF2OHyebBzTpGYu6PXbDQ=
X-Received: by 2002:a05:690c:c99:b0:70c:a57c:94ba with SMTP id
 00721157ae682-715171aad9bmr38119057b3.17.1751016297598; Fri, 27 Jun 2025
 02:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625034021.3650359-1-dqfext@gmail.com> <20250625034021.3650359-2-dqfext@gmail.com>
 <aF1z52+rpNyIKk0O@debian> <CALW65jasGOz_EKHPhKPNQf3i0Sxr1DQyBWBeXm=bbKRdDusAKg@mail.gmail.com>
 <CANn89i+GO3jSDs94SaqvC8FvO9uv4Jyn_Q0W752QcvRSPLnzcQ@mail.gmail.com>
In-Reply-To: <CANn89i+GO3jSDs94SaqvC8FvO9uv4Jyn_Q0W752QcvRSPLnzcQ@mail.gmail.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Fri, 27 Jun 2025 17:23:47 +0800
X-Gm-Features: Ac12FXxd4QKeAf442j7P__1zTr1GFkPVFZcdi80YtPqwUzDSPRC4uI9B0UP9q54
Message-ID: <CALW65jarGfgtkSJ3pdNTxgDpjzN-K_unqz3GWqH=BHdhmHKMug@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] ppp: convert rlock to rwlock to improve RX concurrency
To: Eric Dumazet <edumazet@google.com>
Cc: Guillaume Nault <gnault@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 2:50=E2=80=AFPM Eric Dumazet <edumazet@google.com> =
wrote:
> tldr: network maintainers do not want rwlock back.
>
> If you really care about concurrency, do not use rwlock, because it is
> more expensive than a spinlock and very problematic.
>
> Instead use RCU for readers, and spinlock for the parts needing exclusion=
.
>
> Adding rwlock in network fast path is almost always a very bad choice.
>
> Take a look at commit 0daf07e527095e6 for gory details.

Thanks for the info, I'll see how to refactor it using RCU instead.

