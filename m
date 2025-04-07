Return-Path: <linux-ppp+bounces-285-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1819DA7E30D
	for <lists+linux-ppp@lfdr.de>; Mon,  7 Apr 2025 17:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F40F1885CE7
	for <lists+linux-ppp@lfdr.de>; Mon,  7 Apr 2025 14:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC33D1F4189;
	Mon,  7 Apr 2025 14:54:04 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1047B1EB5DF
	for <linux-ppp@vger.kernel.org>; Mon,  7 Apr 2025 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744037644; cv=none; b=Q7wWmVWRJkhARHK/eVsGfNknYv1HQ/2kG9P/JiG22yxpQ7cpduCoouO3CVty83lTHXkYiZZZ9zPeCbu7b45OlnZ7LHUjNiyVhofhhOtnhxMvRWpCm1dmNP16fXUyHzwo2YWy93Rc2prIGWlr5Wd6PzTLQLbqVSQfWHAWo/NH3DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744037644; c=relaxed/simple;
	bh=4w78mRBZGZNNPI600JuP+cOnyzbvyrz8F2Axik6zU38=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=E8ZEXbZW+Y4YsWeY+l9uKL1kyMAhBINNFKz2Q9DragSEM0FWw5lW8qgUot3vu4UDgV2FoJM8wfaB4hRrhvbdkVmBPXhdJHdXcteZ1Y8Ad+N7LVlEXzP26+HmcYQMONH2F/wiF6Mhud0sSVVGYan9fuN69LrnuY36KuSNkgC0KY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d5da4fd946so90822855ab.1
        for <linux-ppp@vger.kernel.org>; Mon, 07 Apr 2025 07:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037642; x=1744642442;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=87eXy0/HAb1l8mSEeghgon1TgAuvqIEpPCir2UTgld0=;
        b=g49oNQ4Hg+yEUPVccWF3TyNhen2MvuDnqFjWja5tcl0Kdl+KTxlvleLpT7rxQFtkTW
         FdHdB+r+voDB/8+52wsBPqN3lgMkXHINGUFuDjiHe2du2salydZskuGzlzbqgojSUmAt
         Rutt2pDqUQ3meh8xJa8B8HlZJuKQA/aXnsbViteXFBqPDPHjSRcG8KYSp1TfsdivpEx/
         CCT2fBecF4yYxwkguHf8eNz2UnbEaYeVZvor68p5aWKEQgRKCK4h00YzICHZEgCDJGXS
         DgpF4Q88kIcUm8EAy8L9ohb3EJBSmtS9F+R/FBZ1HFQxQcBDu47iwL8bH+cAd55BjGHs
         XD6A==
X-Forwarded-Encrypted: i=1; AJvYcCW9HULjPdzKWEKhsv/UTTO9SBZyPIA4ZEGZGUX1sfzakkPO9ASRq1yS4yxrEGQJYSUcTii2Q+K+7RU=@vger.kernel.org
X-Gm-Message-State: AOJu0YygWae/DgCSeMi2ah9BG2TeSpaRvZ7foDmPXxq0BypOOzR04YMu
	yJkE+1RIHZfj8wuRremfVBiHnBBdwng8LZMVViouKNeHPLSx7RheSAvO0o+BPUZa52MvP9ZV6u5
	vDJqAeULQqPCFLJaDjeRFiqqgYwG3pbLLd1dFnFaA3OCoJFibsGJGffQ=
X-Google-Smtp-Source: AGHT+IEApL7+tBTTM3/AYmjFUw2oyXy+24vzKRuL5QFleomUWv+TfmCZZ8M0Kz2xXcWYob1yS+NvoqfHAmDxj9IcA/hPSIfMGIXL
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fe7:b0:3d5:bdee:8a8 with SMTP id
 e9e14a558f8ab-3d6ec52d113mr84753915ab.3.1744037642206; Mon, 07 Apr 2025
 07:54:02 -0700 (PDT)
Date: Mon, 07 Apr 2025 07:54:02 -0700
In-Reply-To: <20250407141747.92874-1-contact@arnaud-lcm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f3e70a.050a0220.107db6.059f.GAE@google.com>
Subject: Re: [syzbot] [ppp?] KMSAN: uninit-value in ppp_sync_send (2)
From: syzbot <syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com>
To: andrew@lunn.ch, contact@arnaud-lcm.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
Tested-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com

Tested on:

commit:         0af2f6be Linux 6.15-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11f81b4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a6e21b5ffe4f6eb
dashboard link: https://syzkaller.appspot.com/bug?extid=29fc8991b0ecb186cf40
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=105b3b4c580000

Note: testing is done by a robot and is best-effort only.

