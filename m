Return-Path: <linux-ppp+bounces-85-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A6D974708
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Sep 2024 01:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 770E11C25B08
	for <lists+linux-ppp@lfdr.de>; Tue, 10 Sep 2024 23:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7E11A4F24;
	Tue, 10 Sep 2024 23:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b="vo0HpjnD"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E42192D98
	for <linux-ppp@vger.kernel.org>; Tue, 10 Sep 2024 23:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726012404; cv=none; b=Q/ux+SlOHvgM/ItqoTEl4wB88SlQ7jYyQ86qGdJ9q1/xMk75tqrp248IFUzslLHg2Iqs3JwzzfmLMsrwoPntUQ9ZEfmsRGDiy3wNyucng4rv0+nMc9z1egro68XWfVnAfv208wipCTDEQbhcsEsNUJGa7KbXxNzAmApObr/mtrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726012404; c=relaxed/simple;
	bh=cxKuA7M3MNQLMWoWqwle1Rq7m+5PDs3bFW5ExPXXB00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKbjVJZbB6XRjxvmjIRKrSmylIin5aMMem5xrAEjJeXzEFaD/WeXogVOYUX6j3GR5mEVD9cbJBoVJGYkIdMq9nxS3BUGE6or+BG2j6WvlX29FQi6CtPes6EXoR8vfqk+mlOJWfh4AMSbq4P2mP+R3tY0Q+gGLDvgMK2UDw7lyPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=vo0HpjnD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1726012399;
	bh=MMFqRHU5GM5pamvSrG8MADREmZM1ITlJ0EU4fWPtP+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vo0HpjnDK8Q0z8udeaSTlDU09nsMxkVgaIOScSgFVyOF5R6DUBQMkKdcCXZPFHDAZ
	 ASeyWpYfIk/xNh02PNjn+fW6LkpVKWCf5qtauMzIbq8QzTSAzXsnfRSaUup2QYIwmH
	 eT0247KXhO9mkowvKhkjhgQHWzEAaZvN19Sy954El404E5S7aaccEG7HjYZeylopIN
	 4fObbNXwYCIgDLM4aN7+/6l5te2u9miNt4jPAb7WtqBY8jtpnTSOZEzCMThlGQ88kT
	 BlNMzl0PZnnm1s04W1N02Jk5DroHHYyCOUqOTkuIaWzc7WwQxpu/rA+ZtRNvT9dl8a
	 T1BueqgdGw/Cw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4X3LB709Vdz4x8D; Wed, 11 Sep 2024 09:53:19 +1000 (AEST)
Date: Wed, 11 Sep 2024 09:53:14 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Devesh Chipade <devesh@in-unison.com>
Cc: linux-ppp@vger.kernel.org
Subject: Re: PPP Modem Hangup
Message-ID: <ZuDb6r9xLIku_vxd@cleo.paulus.ozlabs.org>
References: <CAPKvdWd3rGxir3MEKrcfdjD4NfOQpCttv3yFPXY=Q35-8cs2Tw@mail.gmail.com>
 <358952.1725971979@dyas>
 <CAPKvdWdXozAW6DTtXpFix9ZYOQ956AMTqMCHhrGEX6BixA8AKw@mail.gmail.com>
 <377699.1725992617@dyas>
 <CAPKvdWcQH207rUofzgHYvCa6_ULs5dWxEvRbqmw5+PeYY5QYqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPKvdWcQH207rUofzgHYvCa6_ULs5dWxEvRbqmw5+PeYY5QYqg@mail.gmail.com>

On Tue, Sep 10, 2024 at 11:30:48AM -0700, Devesh Chipade wrote:
> In my options file, I have debug and kdebug 7.
> This is all the logs I could get:

The pppd logs look fine.  There is nothing in the kernel (dmesg) log
that looks relevant (in fact kdebug 7 is mostly useful if you are
actually debugging the kernel driver; it doesn't really help with
problems like this).

Do you have logs from pppd on the ubuntu/linux side?  Is something
causing it to terminate?

Alternatively, do you have another service running on either side
which also thinks it is using the same serial port?  Something like a
getty, or whatever the systemd equivalent is for providing a login
prompt?  You could do "fuser /dev/ttyMSM0" or "fuser /dev/ttyUSB0" as
root during the 6 seconds when the link is up to check if something
other than pppd also has the serial port open.

Paul.

