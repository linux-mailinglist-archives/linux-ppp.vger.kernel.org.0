Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB296B11EB
	for <lists+linux-ppp@lfdr.de>; Thu, 12 Sep 2019 17:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732836AbfILPRC (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 12 Sep 2019 11:17:02 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:47843 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732698AbfILPRC (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 12 Sep 2019 11:17:02 -0400
Received: by mail-io1-f69.google.com with SMTP id q1so15676327ios.14
        for <linux-ppp@vger.kernel.org>; Thu, 12 Sep 2019 08:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=RPiyZVry3vcCdktPjsrAehjjz4bpmZ6S8izbMfh4+Qw=;
        b=k9MbK3FOYd85gU26PaRIUDrvcUBgKMJnTWOlrMrEd2r9TFJEhF1YWYG+8pST+8LT42
         oUp8xqGvTxRChq7VEryD/Yt1f2Wyt9vDpz6Mw3bBTbzkxpRebx5RQOcGRvbIu3QcLO3P
         FQYRdaSo4DNMe1wdFPMfanf5ICj+BjisbiSv+TDVDuhjNxqYH1R1NgPzu6Cl/LnGxv7W
         hVTypnXP0A+CS+l5hqX34Qq5iF+ShB5ail6eP27tNYtY8/D/RJXRLTB3wS/bcy5xrvvh
         9EFl8s6Xej33B5jQK87KVdSZrOojWq2nrZWO1s8zjNxoGuXI4Z3vD7qMB2eY3dDBA9Uh
         AoAw==
X-Gm-Message-State: APjAAAVWOGBff0nHGkWR/lLo0f/IarVAcSynj9KRbyT6QJ5P8hrOpU0n
        jUN098zj8G01N8IahswNUHC21E9L5jspnN5z9sKo8EA60e85
X-Google-Smtp-Source: APXvYqzSR03YPSVhMgY8omiNzjtKp/LsOhihqJynqTinJuXFm9yeiEQpDpPKj8OnPE+PaoUQpZvFmlFn8e22sLT7FtGXZct/f2eo
MIME-Version: 1.0
X-Received: by 2002:a02:aa84:: with SMTP id u4mr23912052jai.14.1568301421376;
 Thu, 12 Sep 2019 08:17:01 -0700 (PDT)
Date:   Thu, 12 Sep 2019 08:17:01 -0700
In-Reply-To: <CAKK_rchVQCYmjPSxk9MszV9BtF8y04-j2dpjV0Jg3c+nrRNEWQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001f3a3a05925ca177@google.com>
Subject: Re: memory leak in ppp_write
From:   syzbot <syzbot+d9c8bf24e56416d7ce2c@syzkaller.appspotmail.com>
To:     ast@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        davem@davemloft.net, jeliantsurux@gmail.com, kafai@fb.com,
        linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org,
        netdev@vger.kernel.org, paulus@samba.org, songliubraving@fb.com,
        syzkaller-bugs@googlegroups.com, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+d9c8bf24e56416d7ce2c@syzkaller.appspotmail.com

Tested on:

commit:         6525771f Merge tag 'arc-5.3-rc7' of git://git.kernel.org/p..
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=e6131eafb9408877
dashboard link: https://syzkaller.appspot.com/bug?extid=d9c8bf24e56416d7ce2c
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12610ef1600000

Note: testing is done by a robot and is best-effort only.
