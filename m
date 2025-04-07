Return-Path: <linux-ppp+bounces-284-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 649F9A7E230
	for <lists+linux-ppp@lfdr.de>; Mon,  7 Apr 2025 16:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BE071884217
	for <lists+linux-ppp@lfdr.de>; Mon,  7 Apr 2025 14:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7B91DDC30;
	Mon,  7 Apr 2025 14:26:04 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1091E1E03
	for <linux-ppp@vger.kernel.org>; Mon,  7 Apr 2025 14:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035964; cv=none; b=vGaM51QO8GJU/UNZX7aXhUOvYdO8gKZGiJxhQRnzC3eZFN9OC8Pf+e56l2ButiazA6pBF3Mxhl0ryF3YtB8foUlzhf7qgKnJ1KDNsZiVRGoKT3ZP5dnRVEs3VV+bubz9gGmSBWBcgsz0N5plJqBijZMUnMDK9dfspM2OIpxzibI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035964; c=relaxed/simple;
	bh=KV9W6AUrHJdqHLgUBuRoozIFZ9XmFBTpBvPPo4dCfx4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bBH+6YOzDoc6h1DT/yN50sAgBEs1/RblPlRZu0GWhE2AnmbOb1NL/0pIfYYir4bzd3twwwZ8DO7qfyhTJgi85gRuTFA1NbOTk1pqFP6Mpzgjid4mZxVZtljXliZjvZUF/McXvJVAeZfpQjPExUKhchULnwG8oIP4qLvIRvyVzsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d453d367a0so95324955ab.3
        for <linux-ppp@vger.kernel.org>; Mon, 07 Apr 2025 07:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744035962; x=1744640762;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UjUxYvY1YiyC6OoVQvcfUdICOWiC2nlpSbYx2k4dA5E=;
        b=ZUZdVtK7kdaHDchqmh4wGycm4ijLPRAlIUItm1NypfloW08e527mpLVivQw6uhJyo3
         Re8OXyyAFqTGS3TyYEPkiNvh7SVOBRkRqOkxAchC0I8hY6xpuYILwt+0qg9BDspqdaAn
         LWphfP8McZuspBnPYzIrVEItOIO74ylqWIagcf3iWPkWyGe+tv1LwbKHMkQ705/6tqvF
         pzjKeg0f03pKt0gKIoycXqiYkOsW82+iUW3u6fbM0gzEfNJgMHH2eRg55R30aI5E+Brl
         G+MbKHwLHe9/V3t2WL2+SjzD8b86KVaDsNNyoWbfdoYpS4LsdfH8xljn7kb56dPcvQVz
         gVUA==
X-Forwarded-Encrypted: i=1; AJvYcCVwVU7C4/bfzTAjpIAXHKdJYnOxc6yZfQgyepGpuIcr1ZW+PDM5sh2NchYagom6icevfmAsh+RwArE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh28CnTVxJCSS77EFXTBmb183Mjvvv1J9sCd0q2YMycIgqwEpp
	2uD5reX7lSbO5B/N8ZY2XvdfKXN14V50l2Adqs8FfIVZeTPJrQhisqrh8QAD7bDWFDu9McjZ0X2
	w3H/2luMvrhscV6fm6veA5vGopbLb88pqot9Y4EHKJhmDu0UHYcEv3vo=
X-Google-Smtp-Source: AGHT+IES1QhFs+V/b6s7CUZ53WUmbrsnVac05k1xT+P7gkYs8jsVm0O6hIaL80/furuc5pXCxzZmBCavcYC6KBxWmpBPEquUvWTB
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3e91:b0:3d5:8103:1a77 with SMTP id
 e9e14a558f8ab-3d6e3eea919mr161227325ab.1.1744035962257; Mon, 07 Apr 2025
 07:26:02 -0700 (PDT)
Date: Mon, 07 Apr 2025 07:26:02 -0700
In-Reply-To: <20250407140603.91155-1-contact@arnaud-lcm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f3e07a.050a0220.396535.0550.GAE@google.com>
Subject: Re: [syzbot] [ppp?] KMSAN: uninit-value in ppp_sync_send (2)
From: syzbot <syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com>
To: andrew@lunn.ch, contact@arnaud-lcm.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo https://github.com/ArnaudLcm/linux/bounds-checking-txmung: failed to run ["git" "fetch" "--force" "98936a0cc8cd68334b039c881b39b10e6f0d7c99" "bounds-checking-txmung"]: exit status 128
fatal: couldn't find remote ref bounds-checking-txmung



Tested on:

commit:         [unknown 
git tree:       https://github.com/ArnaudLcm/linux bounds-checking-txmung
kernel config:  https://syzkaller.appspot.com/x/.config?x=f20bce78db15972a
dashboard link: https://syzkaller.appspot.com/bug?extid=29fc8991b0ecb186cf40
compiler:       

Note: no patches were applied.

