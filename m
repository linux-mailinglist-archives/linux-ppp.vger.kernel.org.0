Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53F5FE8A44
	for <lists+linux-ppp@lfdr.de>; Tue, 29 Oct 2019 15:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388633AbfJ2OJC (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 29 Oct 2019 10:09:02 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:47917 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727255AbfJ2OJC (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Tue, 29 Oct 2019 10:09:02 -0400
Received: by mail-io1-f71.google.com with SMTP id r84so11202553ior.14
        for <linux-ppp@vger.kernel.org>; Tue, 29 Oct 2019 07:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=ZXDP0wwnNkRnGcZ/hxzyUBVhVAKO5MP3N/7b/HrN89M=;
        b=oW6oTyb0acrlNSJceDwTdvRR8ymaAMZZFZ1CyvyGMmxvBaYUxSCWREp7l/9xHBjPRS
         Uil8cvl+SbE9soESwTqZGBWBIhoXo3LX+JZrhcd5NcY3xHkKPIMFqdIsRz0qmwp9yUZF
         PCLWziKUGfZCbzphZlrgpSyT7+qql+vrDj36GgWrIVj28U/Xxyvig/iyLscrtIdQcT4H
         Hxj/tNEZ8YH9+OghSVnNheLdl6jOKUu0SxapTG2XGWeVnL57rOYGjFdZlsfyoRV7HGHl
         RYp7Fvm5gMXu8BZAApUKGqxSDuaO2n36G2CAO0WN3a76VDqR2ZITGa8ZWkWmF3eWS5t+
         gyBQ==
X-Gm-Message-State: APjAAAUrGsKRhCCVhqd0zalhSKrZ55l91DUDxD0CmuN+LCTXhtdulN+x
        tgGZEbqIylhIsvFEjOWC5lXupgGx1jfm/h28skYe51KdnUXP
X-Google-Smtp-Source: APXvYqyEO6WTdX2TT1MAC5wh+aMxnQAZiQ9NAP9Ue+ASML0EMHR89Lk5xJp5JZTyc5Ij4tXWW9iYcXeag4DdS0UpQCxA/Rt7L8JZ
MIME-Version: 1.0
X-Received: by 2002:a92:8394:: with SMTP id p20mr28056667ilk.73.1572358141217;
 Tue, 29 Oct 2019 07:09:01 -0700 (PDT)
Date:   Tue, 29 Oct 2019 07:09:01 -0700
In-Reply-To: <0000000000009ea5720595dc03a3@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007792ff05960d289d@google.com>
Subject: Re: BUG: MAX_LOCKDEP_KEYS too low!
From:   syzbot <syzbot+692f39f040c1f415567b@syzkaller.appspotmail.com>
To:     a@unstable.cc, alex.aring@gmail.com, allison@lohutok.net,
        andrew@lunn.ch, andy@greyhouse.net, ap420073@gmail.com,
        aroulin@cumulusnetworks.com, ast@domdv.de,
        b.a.t.m.a.n@lists.open-mesh.org, bridge@lists.linux-foundation.org,
        cleech@redhat.com, daniel@iogearbox.net, davem@davemloft.net,
        dcaratti@redhat.com, dsa@cumulusnetworks.com, edumazet@google.com,
        f.fainelli@gmail.com, fw@strlen.de, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, gvaradar@cisco.com, haiyangz@microsoft.com,
        idosch@mellanox.com, info@metux.net, ivan.khoronzhuk@linaro.org,
        j.vosburgh@gmail.com, j@w1.fi, jakub.kicinski@netronome.com,
        jhs@mojatatu.com, jiri@mellanox.com, jiri@resnulli.us,
        johan.hedberg@gmail.com, johannes.berg@intel.com,
        john.hurley@netronome.com, jwi@linux.ibm.com,
        kstewart@linuxfoundation.org, kvalo@codeaurora.org,
        kys@microsoft.com, lariel@mellanox.com, linmiaohe@huawei.com,
        linux-bluetooth@vger.kernel.org, linux-hams@vger.kernel.org,
        linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ppp@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-wpan@vger.kernel.org, liuhangbin@gmail.com,
        marcel@holtmann.org, mareklindner@neomailbox.ch
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12e05224e00000
start commit:   60c1769a Add linux-next specific files for 20191028
git tree:       linux-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=11e05224e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=16e05224e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb86688f30db053d
dashboard link: https://syzkaller.appspot.com/bug?extid=692f39f040c1f415567b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10be9ed0e00000

Reported-by: syzbot+692f39f040c1f415567b@syzkaller.appspotmail.com
Fixes: ab92d68fc22f ("net: core: add generic lockdep keys")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
