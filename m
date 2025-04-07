Return-Path: <linux-ppp+bounces-281-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBE2A7E176
	for <lists+linux-ppp@lfdr.de>; Mon,  7 Apr 2025 16:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F3453B584A
	for <lists+linux-ppp@lfdr.de>; Mon,  7 Apr 2025 14:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC211D88C3;
	Mon,  7 Apr 2025 14:17:15 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4BB1D61B5
	for <linux-ppp@vger.kernel.org>; Mon,  7 Apr 2025 14:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035434; cv=none; b=ME2xI044gK2rgD8+PhicRuMrah/rQxWNBT2/pzU2TOF03MmizVQUvDaDPNcSpwyjt+2tFvqAM/G6ADx9tH1kdyjmKRvPfst5kH0L+q9Nb0IK91Tf2kFgbuM3+1Lo6/HKwj2Zmpa7sHZTdt4sDnWqUV/i4/YCRl9yTzEMnx9ojBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035434; c=relaxed/simple;
	bh=u7xBi8y8quGJVDkuhH0qHYxgViZkg+uXeLe/8fr0ctU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=JjJ4qNWhpSUsOIlHxXNvTVhPK3E4mcnfW0GPo2xueG5z/w4o2IDQlC7lphITHMDECWt6ndyIv3p4E3Y7eHH1WwAT0IRKxPYZRgR7Y57F0w/y9AhWgJq9c9mhnXKqxtolUID3pBtGRWiR3NslfhixexxfdNAM1xavKqL7x1TO/q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d443811f04so41992375ab.1
        for <linux-ppp@vger.kernel.org>; Mon, 07 Apr 2025 07:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744035432; x=1744640232;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7uaNP5LiQosFTE3+99qu/GfFM+fsc9WqdSZxMpRvfLk=;
        b=HwnGnpoVqb2n6otNahfrQOa2Up1RKJrzbnZyuQMmUkze5ze5kbdxUJdtcYpOncL8Qr
         VQuV05cW+Y5as2l7FPKboEgWuqe24Hs6FHUzBm7XXp4wraGN4TZF1uMqn8jkLzzkg2gA
         ripITz9r/4wiurqu6UfYFAmPvi15LCe3cAunsaCw4vu+zc6s6XZ35NWRt1m6FLXYHpjS
         6aXQ63OCcHz19JBDbvrr62n1spRECCG6teIJbYgkDoSUYqA5CQ124zdMjcRjunwZYCWv
         1goRWJE7EEMZP1aa/9yz/8wNCQWCtvNXN3T262wMTXgqyDcmvpmxAlSC5LjURKr4UbZX
         tgyA==
X-Forwarded-Encrypted: i=1; AJvYcCUcNPAm6ldhViiU6jkCfeD3mvQJ3lAlAzyjFKTIf8+MCf+Z6ajNx7W9fUh+Cndkipwm8hg5jFOlaaM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx2HRtUAfMQ1Pba+PVNe8GTJGtyuwksYk1w/KGUz9bs/KIVMt8
	ppKKJYL0GW9KZCp/J+XiuPzT+J8+KDxd978O8iM88tGf9uyGl9Zuu0dtW/iKq4fDHqyz45/pOpE
	NbcRhW4OtHKa7BRf4SMyCcQOjW8lkgvtTKaUpdtOxLsMepGHjodC1u7o=
X-Google-Smtp-Source: AGHT+IE4CIzkVeo6NDC8dq8GCEK3Bm8+KBaaoCschs0czWHzY8PZIOmO1Z5AnKypOkUFkYMIyeOFb/wYjaRSjp0Bia06IV0yyJEQ
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4401:10b0:3d4:6ff4:261e with SMTP id
 e9e14a558f8ab-3d6e3e67eacmr87122795ab.0.1744035432461; Mon, 07 Apr 2025
 07:17:12 -0700 (PDT)
Date: Mon, 07 Apr 2025 07:17:12 -0700
In-Reply-To: <20250407141705.92770-1-contact@arnaud-lcm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f3de68.050a0220.396535.054f.GAE@google.com>
Subject: Re: [syzbot]
From: syzbot <syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com>
To: contact@arnaud-lcm.com
Cc: andrew@lunn.ch, contact@arnaud-lcm.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> Author: contact@arnaud-lcm.com
>
> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

want either no args or 2 args (repo, branch), got 5

>
> diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
> index 644e99fc3623..520d895acc60 100644
> --- a/drivers/net/ppp/ppp_synctty.c
> +++ b/drivers/net/ppp/ppp_synctty.c
> @@ -506,6 +506,11 @@ ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *skb)
>  	unsigned char *data;
>  	int islcp;
>  
> +	/* Ensure we can safely access protocol field and LCP code */
> +	if (!skb || !pskb_may_pull(skb, 3)) {
> +		kfree_skb(skb);
> +		return NULL;
> +	}
>  	data  = skb->data;
>  	proto = get_unaligned_be16(data);

