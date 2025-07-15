Return-Path: <linux-ppp+bounces-325-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A987B06545
	for <lists+linux-ppp@lfdr.de>; Tue, 15 Jul 2025 19:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B8F7565930
	for <lists+linux-ppp@lfdr.de>; Tue, 15 Jul 2025 17:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3348285C9F;
	Tue, 15 Jul 2025 17:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fnCkJ8E0"
X-Original-To: linux-ppp@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7CE27465A
	for <linux-ppp@vger.kernel.org>; Tue, 15 Jul 2025 17:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752601068; cv=none; b=eDRHAKImHW2p60BTUoSHXFamAV0zFuJcnueFLMEZWD+NrVU6X4JMEn+PSX6BPTJXx7GwL4Aa2Rx0eIXxT6v2Lq9VDt6wUIBKH6JMdByosoF0rcrpSyWNwij1A7Pqxm4oOqt9P6MPbw1/VD5y3HBFs8u22gkPknuMtAj7dclT9QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752601068; c=relaxed/simple;
	bh=XfSVpD9Z7XphBM4ixb2rCWDLMorg8f3Q4PGNqpR6KAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDM7YevT80H7AEGsFwDeqoox2yPNdqWt8Elzg3hofa+G4aXKRf1XD34b241RT0POv6XuHKTCr+qCC2VOzgb7WmfySS87eNW+AA1GSaVP6yux5DZQaK/IsYPApwBikR/pr/9naRZk5XndxYrMlO0A04Y3OCrQnJhbrudgcS4LsBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fnCkJ8E0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752601065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cdcx7QAfZlAuJUAK+fb/wqda3KOPzzyARCBWyre1UeA=;
	b=fnCkJ8E0iqQ1IrgmBXXhRZuQEBrpytLcyjXRHaGiIctJmdzbQDEco/jcEMaZlNlxEIvCSs
	BdGMK28+JVGKIWEz2w0NxkBFfoJAq1iY6oMNRZaauJ3rqnhNXT9zoevfuUNqupQ+fDgxbT
	UHNtWPdsVb1FyNCzsxX91L2+w03R96Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-26na-i31OvCrCedTtZ6Naw-1; Tue, 15 Jul 2025 13:37:42 -0400
X-MC-Unique: 26na-i31OvCrCedTtZ6Naw-1
X-Mimecast-MFC-AGG-ID: 26na-i31OvCrCedTtZ6Naw_1752601061
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45597cc95d5so23049625e9.1
        for <linux-ppp@vger.kernel.org>; Tue, 15 Jul 2025 10:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752601061; x=1753205861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cdcx7QAfZlAuJUAK+fb/wqda3KOPzzyARCBWyre1UeA=;
        b=Ddp4fQFdssuzCEGiJzsSxxxRBELCbMS8wb/bubP57q4rEvR1IsK9mpCj+16EW14eyw
         9yZJt/LJ3C0JAgnsn2NmLB2WnNRB4JcxiR1/WT3kaAaJUejc3T8yVSYUhd76bHQgpsNE
         ZXQIRyX+sak5yVyw07KRUE1ExbDDVrFPXM3wYjL/gefJb7EdaOSOkWzsLrqKek3VjvMp
         ecb7qbOeWr6kLEi/YjcgZfX2aIhnyR6k7HRYOCC3lDX/empG58MUt17Yr8eb5lrtIJxN
         bPStbxJ08TXTKRlQk8JmgcyJgGmgV4ZV+9RoUx/UY+lnsDrr9C2QiBTiAsproCP/3+r/
         jakA==
X-Forwarded-Encrypted: i=1; AJvYcCX9HF2MXxaXNlMUgdHAS8+o/qC2YlQqA7N2tAA0XVbGPSt06V2HFW9gHjKRoKAYhJ/ZuHJvSnH5TQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfGwLPpv4ozzn4UniQDc4jxDaM6bqAQjfbWdS+VyjpNnGR3sRI
	j/VisRZhdEEJMuIHHFhNgK2pWYOMJ4fehTxQqfOoNKK+14+eYVbKVmnLlHQ652rnP73bKZ5NGxB
	dGygswHcl+qNTUDxLbibPltsRFPQi0hHDnc3s4VO6ZsSXF20u8WUGoQA7dhWKhg==
X-Gm-Gg: ASbGncsy+YSOIMaBzbPqr9DkqHKz+einYQa9KNFWinVSjokuo0IxT0LiRAP2q4lyogS
	BgfrTzINJG1mP1JR06XCSg+HPUc+WXbKwnUe++Xfbre8uaIQC8MbZJWV59WsGkaQPoz9bYXyHgM
	dpt/GB4mVSMmWZt4l2YPgsdI32UrAjqUB1YORp+6GiWZKVPjYd4GqSshE4lqPuuO4nMCg9Zxs5P
	z7xxRJz2nwvUW8fmhEidBG7bQsTAD2bhslFEaY1nz/rFXK0xX8+qL3Sk7ygOWZHGnSZeb1rAlK2
	Vtn2cSeENysbZGTFjD6TmtbQvf4=
X-Received: by 2002:a05:600c:c11c:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-454ec146a71mr126236665e9.11.1752601061312;
        Tue, 15 Jul 2025 10:37:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEav7jSZeI2X7Lu4R457llVbI4CiXULRrrPNd8TKiDciKzpga3jeaECrjhf/ot1tIBrxWWMDw==
X-Received: by 2002:a05:600c:c11c:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-454ec146a71mr126236465e9.11.1752601060964;
        Tue, 15 Jul 2025 10:37:40 -0700 (PDT)
Received: from debian ([2001:4649:f075:0:a45e:6b9:73fc:f9aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5050d34sm209336735e9.9.2025.07.15.10.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 10:37:40 -0700 (PDT)
Date: Tue, 15 Jul 2025 19:37:37 +0200
From: Guillaume Nault <gnault@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: netdev@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	linux-ppp@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Williams <clrkwllms@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH net-next v3 0/1] ppp: Replace per-CPU recursion counter
 with lock-owner field
Message-ID: <aHaR4QzKvCDi/LYx@debian>
References: <20250715150806.700536-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715150806.700536-1-bigeasy@linutronix.de>

On Tue, Jul 15, 2025 at 05:08:05PM +0200, Sebastian Andrzej Siewior wrote:
> This is another approach to avoid relying on local_bh_disable() for
> locking of per-CPU in ppp.
> 
> I redid it with the per-CPU lock and local_lock_nested_bh() as discussed
> in v1. The xmit_recursion counter has been removed since it served the
> same purpose as the owner field. Both were updated and checked.
> 
> The xmit_recursion looks like a counter in ppp_channel_push() but at
> this point, the counter should always be 0 so it always serves as a
> boolean. Therefore I removed it.
> 
> I do admit that this looks easier to review.

Thanks!

Reviewed-by: Guillaume Nault <gnault@redhat.com>


