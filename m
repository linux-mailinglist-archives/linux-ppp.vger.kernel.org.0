Return-Path: <linux-ppp+bounces-222-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC865A3A65A
	for <lists+linux-ppp@lfdr.de>; Tue, 18 Feb 2025 19:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9728F3B5C36
	for <lists+linux-ppp@lfdr.de>; Tue, 18 Feb 2025 18:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EBE11F582D;
	Tue, 18 Feb 2025 18:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="DZt7UW1l"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com [207.171.184.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575C02356BA;
	Tue, 18 Feb 2025 18:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.184.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904653; cv=none; b=tFELqTjIjT0U3lkog8sxuA+1wuv9Gs3jy9+CKnxmEOpMR5hgA/KHtwjUWA86O8dYr3Vhn8IEDOxiCbXYoZ4w+1fZ8vmiItDksB4Ms/qZ1icEnG1FavQsICCV2rUsFSVLQzEW2hD0x6r//rSQBfVINWAcyOBY9DYdTNZy5n0/NSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904653; c=relaxed/simple;
	bh=lsflQrO1N48O+jshUWxiHl8d7dgJUl8JR7UUofGDcOU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cxLRRPWfNs1eDBZf4J5Ka3GEJaUZagSF5/lczajNGB286tetBTcnO5p9xq0he00jHSicJHOh2czX9trtOjqRuQXA/L/Ei2HZG0JFjDUe0O+RC8aGx+4hhzaLa8zcALQUajtBv2bL8Ftxbsafs9dcqjeIAo0YgpszIdtIHawdcSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=DZt7UW1l; arc=none smtp.client-ip=207.171.184.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1739904651; x=1771440651;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/1XY/m7rlHy9RJvp29NIT0p6dcrQvEcQVV1BnoOoOvg=;
  b=DZt7UW1l/2ky4722t3/PIRud+K7BivymcsD91nyw+va21WNfHR7A9Jh6
   onz6NuouVBzoE9hxQOJdUENIUeUqIOqs+cDhBU5j/Eje51bFlrT34i3ov
   ODI/+xY9COHTi7OEzVhV/0IvuI0CkbODdssUehXFUPSfGNKbp3noewquj
   A=;
X-IronPort-AV: E=Sophos;i="6.13,296,1732579200"; 
   d="scan'208";a="494971099"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 18:50:46 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.7.35:49314]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.115:2525] with esmtp (Farcaster)
 id ad366e28-5030-4d80-9ae4-2708614bf9a9; Tue, 18 Feb 2025 18:50:45 +0000 (UTC)
X-Farcaster-Flow-ID: ad366e28-5030-4d80-9ae4-2708614bf9a9
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Tue, 18 Feb 2025 18:50:44 +0000
Received: from 6c7e67bfbae3.amazon.com (10.106.101.36) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Tue, 18 Feb 2025 18:50:41 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <purvayeshi550@gmail.com>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <kuniyu@amazon.com>, <linux-kernel@vger.kernel.org>,
	<linux-ppp@vger.kernel.org>, <netdev@vger.kernel.org>, <pabeni@redhat.com>,
	<skhan@linuxfoundation.org>,
	<syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com>
Subject: Re: [PATCH] ppp: Prevent out-of-bounds access in ppp_sync_txmunge
Date: Tue, 18 Feb 2025 10:50:33 -0800
Message-ID: <20250218185033.26399-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <1e906059-83c7-4f29-a026-76cd73d8b6fa@gmail.com>
References: <1e906059-83c7-4f29-a026-76cd73d8b6fa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D039UWB001.ant.amazon.com (10.13.138.119) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)

From: Purva Yeshi <purvayeshi550@gmail.com>
Date: Tue, 18 Feb 2025 11:58:17 +0530
> On 18/02/25 02:46, Kuniyuki Iwashima wrote:
> > From: Purva Yeshi <purvayeshi550@gmail.com>
> > Date: Sun, 16 Feb 2025 11:34:46 +0530
> >> Fix an issue detected by syzbot with KMSAN:
> >>
> >> BUG: KMSAN: uninit-value in ppp_sync_txmunge
> >> drivers/net/ppp/ppp_synctty.c:516 [inline]
> >> BUG: KMSAN: uninit-value in ppp_sync_send+0x21c/0xb00
> >> drivers/net/ppp/ppp_synctty.c:568
> >>
> >> Ensure sk_buff is valid and has at least 3 bytes before accessing its
> >> data field in ppp_sync_txmunge(). Without this check, the function may
> >> attempt to read uninitialized or invalid memory, leading to undefined
> >> behavior.
> >>
> >> To address this, add a validation check at the beginning of the function
> >> to safely handle cases where skb is NULL or too small. If either condition
> >> is met, free the skb and return NULL to prevent processing an invalid
> >> packet.
> >>
> >> Reported-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
> >> Closes: https://syzkaller.appspot.com/bug?extid=29fc8991b0ecb186cf40
> >> Tested-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
> >> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> >> ---
> >>   drivers/net/ppp/ppp_synctty.c | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
> >> index 644e99fc3..e537ea3d9 100644
> >> --- a/drivers/net/ppp/ppp_synctty.c
> >> +++ b/drivers/net/ppp/ppp_synctty.c
> >> @@ -506,6 +506,12 @@ ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *skb)
> >>   	unsigned char *data;
> >>   	int islcp;
> >>   
> >> +	/* Ensure skb is not NULL and has at least 3 bytes */
> >> +	if (!skb || skb->len < 3) {
> > 
> > When is skb NULL ?
> 
> skb pointer can be NULL in cases where memory allocation for the socket 
> buffer fails, or if an upstream function incorrectly passes a NULL 
> reference due to improper error handling.

Which caller passes NULL skb ?

If it's really possible, you'll see null-ptr-deref at

  data = skb->data;

below instead of KMSAN's uninit splat.


> 
> Additionally, skb->len being less than 3 can occur if the received 
> packet is truncated or malformed, leading to out-of-bounds memory access 
> when attempting to read data[2].
> 
> > 
> > 
> >> +		kfree_skb(skb);
> >> +		return NULL;
> >> +	}
> >> +
> >>   	data  = skb->data;
> >>   	proto = get_unaligned_be16(data);
> >>   
> >> -- 
> >> 2.34.1

