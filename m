Return-Path: <linux-ppp+bounces-218-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A7AA38DE8
	for <lists+linux-ppp@lfdr.de>; Mon, 17 Feb 2025 22:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EFCB188F343
	for <lists+linux-ppp@lfdr.de>; Mon, 17 Feb 2025 21:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77F423A56B;
	Mon, 17 Feb 2025 21:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="nrspRon2"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com [52.119.213.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88A42A8C1;
	Mon, 17 Feb 2025 21:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739826985; cv=none; b=LbJX8xxCtnHtV6etwHKowvYljknxGAfolJ7NlX9jpgxBttVg9P+30EJYhydYXTf8+/6gZYqh6+mzhmdeDXraMi1N47GfNpcYjH25BDYsKAYhnrkM8zDQl2aDGdt3GhTCG27bT+wKYN32r/7uvxiSeCBSSjlVZ6AA745+DImawY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739826985; c=relaxed/simple;
	bh=PPjfiOmwbpWM+RmtTmazEjgL1lGTqx2+iDorgMiSrk0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=czGeLmJIneZrm/lw+cvawsvQn2xgyWOOD8AHpREf5tGeWWS2DzYXH+0m+gVA/5GE6LFrLZ0AoCuKuT8fMkdFMYKfIBsQAO78SUQVP0D24Vdll7YMhZDRSsnCMN6P29shqksX/H/wmpGTT9xnz6YKRp3pPnAEqK/2px/MsH9/Lac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=nrspRon2; arc=none smtp.client-ip=52.119.213.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1739826984; x=1771362984;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gNlaD28MqcKHrKBaRnTcGssUepgxFLXIh5MJ0Sy36b8=;
  b=nrspRon2macj5XtbLzVQqkDVpmSaqVlbvR7ffHbVrMIEEmRRw6/kyNOE
   fCn0iQMIObnKLkAz+nva/DhK6blmAUuaj3Zj5Q6WOBeZBfJkEhXCax2iD
   TBsgyFlF/b8txyd/Bnd1exU5bVVPAuEJAsRJ5h1CpibG2CG39y8/OLifg
   o=;
X-IronPort-AV: E=Sophos;i="6.13,293,1732579200"; 
   d="scan'208";a="719576709"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52005.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 21:16:20 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.21.151:51414]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.41.245:2525] with esmtp (Farcaster)
 id 9a035a9d-6cc0-4857-950f-a90b95689e6f; Mon, 17 Feb 2025 21:16:19 +0000 (UTC)
X-Farcaster-Flow-ID: 9a035a9d-6cc0-4857-950f-a90b95689e6f
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Mon, 17 Feb 2025 21:16:19 +0000
Received: from 6c7e67bfbae3.amazon.com (10.88.189.161) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 17 Feb 2025 21:16:16 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <purvayeshi550@gmail.com>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-ppp@vger.kernel.org>, <netdev@vger.kernel.org>, <pabeni@redhat.com>,
	<skhan@linuxfoundation.org>,
	<syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com>
Subject: Re: [PATCH] ppp: Prevent out-of-bounds access in ppp_sync_txmunge
Date: Mon, 17 Feb 2025 13:16:09 -0800
Message-ID: <20250217211609.60862-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250216060446.9320-1-purvayeshi550@gmail.com>
References: <20250216060446.9320-1-purvayeshi550@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D038UWB004.ant.amazon.com (10.13.139.177) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)

From: Purva Yeshi <purvayeshi550@gmail.com>
Date: Sun, 16 Feb 2025 11:34:46 +0530
> Fix an issue detected by syzbot with KMSAN:
> 
> BUG: KMSAN: uninit-value in ppp_sync_txmunge
> drivers/net/ppp/ppp_synctty.c:516 [inline]
> BUG: KMSAN: uninit-value in ppp_sync_send+0x21c/0xb00
> drivers/net/ppp/ppp_synctty.c:568
> 
> Ensure sk_buff is valid and has at least 3 bytes before accessing its
> data field in ppp_sync_txmunge(). Without this check, the function may
> attempt to read uninitialized or invalid memory, leading to undefined
> behavior.
> 
> To address this, add a validation check at the beginning of the function
> to safely handle cases where skb is NULL or too small. If either condition
> is met, free the skb and return NULL to prevent processing an invalid
> packet.
> 
> Reported-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=29fc8991b0ecb186cf40
> Tested-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> ---
>  drivers/net/ppp/ppp_synctty.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
> index 644e99fc3..e537ea3d9 100644
> --- a/drivers/net/ppp/ppp_synctty.c
> +++ b/drivers/net/ppp/ppp_synctty.c
> @@ -506,6 +506,12 @@ ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *skb)
>  	unsigned char *data;
>  	int islcp;
>  
> +	/* Ensure skb is not NULL and has at least 3 bytes */
> +	if (!skb || skb->len < 3) {

When is skb NULL ?


> +		kfree_skb(skb);
> +		return NULL;
> +	}
> +
>  	data  = skb->data;
>  	proto = get_unaligned_be16(data);
>  
> -- 
> 2.34.1

