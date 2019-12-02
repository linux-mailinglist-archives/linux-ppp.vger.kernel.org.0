Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7964D10E4F9
	for <lists+linux-ppp@lfdr.de>; Mon,  2 Dec 2019 05:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbfLBEHC (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 1 Dec 2019 23:07:02 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:39026 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727298AbfLBEHC (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 1 Dec 2019 23:07:02 -0500
Received: by mail-il1-f200.google.com with SMTP id v11so1347765ilg.6
        for <linux-ppp@vger.kernel.org>; Sun, 01 Dec 2019 20:07:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=oWsENjm7d/+QABjuPHBYSJPPMCuN6XI9dZYPsoGDEJo=;
        b=ZTpjdti+KXpThYZBP2JJXNoEGDVbUe5m4gJQ/Ox0BnoSxxOIxlL+A2YSZ0GpfpAad5
         pmICii7O36xtFg0CJ+cZ3fd53WN1ddPnQmzeHBIGiOptXSmwOsrL31y0o8UGPPBisZ76
         h+sIkHM8jCEAZgph9PB1yVpT2hkikJedsqybPnuK/TfbRcZDVu6tYMQ/laRnu5RbKDpQ
         dXZZHsdPKax147z/Q1CCu4nhxwGipO3qBC4x+N8dTRjlvXdtcfz/gH01yDfdzV7uexs1
         TAfhhOFiGIquhN+E5F3Zqng7oTkMWLGdu5yJwYxu9Cqb76ildgJeNWCXm9H6nPu9R9M2
         VI1A==
X-Gm-Message-State: APjAAAV2S1E2xtvHTLAHJIgvQVL4R6HzPTf6oXtpVnnQoDes1Q9UwO6Y
        4waRXyP4uTSs+xY7W2bJpN7PsBCkho0kD/lBmhyHm7MlPQpQ
X-Google-Smtp-Source: APXvYqwbNau2iLq/cBIAuQInsyrPMPEuwnt2BDzeyB8yqBtnk0ZK4FLDDa7c3GeQTvUxRw7rZ0iE6vluQVplMVvE3Si4+oaVnUb7
MIME-Version: 1.0
X-Received: by 2002:a5d:8184:: with SMTP id u4mr50614802ion.155.1575259621372;
 Sun, 01 Dec 2019 20:07:01 -0800 (PST)
Date:   Sun, 01 Dec 2019 20:07:01 -0800
In-Reply-To: <000000000000c280ba05988b6242@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000293e9f0598b0b69d@google.com>
Subject: Re: BUG: sleeping function called from invalid context in __alloc_pages_nodemask
From:   syzbot <syzbot+4925d60532bf4c399608@syzkaller.appspotmail.com>
To:     a@unstable.cc, akpm@linux-foundation.org, alex.aring@gmail.com,
        allison@lohutok.net, andrew@lunn.ch, andy@greyhouse.net,
        ap420073@gmail.com, aryabinin@virtuozzo.com, ast@domdv.de,
        b.a.t.m.a.n@lists.open-mesh.org, bridge@lists.linux-foundation.org,
        christophe.leroy@c-s.fr, cleech@redhat.com, daniel@iogearbox.net,
        davem@davemloft.net, dja@axtens.net, dsa@cumulusnetworks.com,
        dvyukov@google.com, edumazet@google.com, f.fainelli@gmail.com,
        fw@strlen.de, glider@google.com, gor@linux.ibm.com,
        gregkh@linuxfoundation.org, gustavo@embeddedor.com,
        gvaradar@cisco.com, haiyangz@microsoft.com, hdanton@sina.com,
        idosch@mellanox.com, info@metux.net, j.vosburgh@gmail.com, j@w1.fi,
        jakub.kicinski@netronome.com, jhs@mojatatu.com, jiri@resnulli.us,
        johan.hedberg@gmail.com, johannes.berg@intel.com,
        jwi@linux.ibm.com, kasan-dev@googlegroups.com,
        kstewart@linuxfoundation.org, kvalo@codeaurora.org,
        kys@microsoft.com, lariel@mellanox.com, linmiaohe@huawei.com,
        linux-bluetooth@vger.kernel.org, linux-hams@vger.kernel.org,
        linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

syzbot has bisected this bug to:

commit ab92d68fc22f9afab480153bd82a20f6e2533769
Author: Taehee Yoo <ap420073@gmail.com>
Date:   Mon Oct 21 18:47:51 2019 +0000

     net: core: add generic lockdep keys

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15769712e00000
start commit:   419593da Add linux-next specific files for 20191129
git tree:       linux-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=17769712e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=13769712e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7c04b0959e75c206
dashboard link: https://syzkaller.appspot.com/bug?extid=4925d60532bf4c399608
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16148e9ce00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12a1f786e00000

Reported-by: syzbot+4925d60532bf4c399608@syzkaller.appspotmail.com
Fixes: ab92d68fc22f ("net: core: add generic lockdep keys")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
