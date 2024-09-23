Return-Path: <linux-ppp+bounces-95-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB7997E80E
	for <lists+linux-ppp@lfdr.de>; Mon, 23 Sep 2024 11:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9D3A1F21A8E
	for <lists+linux-ppp@lfdr.de>; Mon, 23 Sep 2024 09:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0D11946C3;
	Mon, 23 Sep 2024 09:02:24 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FA81885AD
	for <linux-ppp@vger.kernel.org>; Mon, 23 Sep 2024 09:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727082144; cv=none; b=FbMo1b0PYq8jTMWXPBTEg9WkZV2lQ34YpbXcQAGp2P2GCqVFivkL1cbuIVKh8tP9pFhc2pcPjY1IW93Jl33OH4kMcJv0rYxzQ7Nn+vU30eAqX2WHMJrZlvNtt6EccmyH+XD0tXYTVDEnhy4kHvyT1p1Pf5hTVdx2JbbKB2Lv34Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727082144; c=relaxed/simple;
	bh=GAd44S+5klCaPfKDd6etwTCIXJl3mBx+mqeSxPW4+dE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=H7dJNEdTkGNd4h3ZpBe0AD4XzF3Z9ckVEbLOQ2j4UCEE8I9DszV9PV22KlcoL3tnGFmj7U9u3jLkvLfGsOOwpIMdzdr5HF8dBShJ+WBZ/O3UB9QUs9uBxK1Fw8nuEjYNu6UUiK2ZNa5rKYDRfpVn1Iq5iH7UAeAK8YOksRnn9No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-82b930cd6b2so571910839f.1
        for <linux-ppp@vger.kernel.org>; Mon, 23 Sep 2024 02:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727082142; x=1727686942;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5iWrHDgy75ujQSAtkrd1YSd/BK1uHyW7PPvp12qtc8g=;
        b=civpuICqb1wZXONpeI7JPXNLRtNi3xgKv9zwa1dssIbblyS3IDi7SJiFAJ+m6hZceN
         PECgMf50b17VkppnUBvTJFoFMGK1JeicQuk14Rw9rNuYmgwxp+tYaELar8hP3njHEem2
         U/z9KRpvzP4Eksk9Kb4i8auQuxJiLXC8Grpmksd0niWBUcfbh/4k5hDxUTcrl6W0TXUz
         jrXcJnC0V2wm4h4oq2EkTM0resLDynVek11kUmUtZa+xn/EbnNg9bVt9ydWZo4PtnGiV
         M9Kwr8u8aDm4D5LkiKCkIe4/JjMXYymb00KJzp9fo9DZk9pYnti8nukzP+uc72zdP29J
         FtSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKzcZ/s1rUGn/yHwKkc3WDSdEvSWVqpK6G6SKxOV1NckWeBVhYqsEQSnLToOneAxXpSDMwbGuGbX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwF/kYZS4naPcBCALNdEUfu/886xJlVUedGYP10hBxWLMMm5cd
	xtJizCW2O7LLlDhybZ68UJ7+FJBGC28x7F76SanZgkgtQMWWjssjqKOizyOjplUC91o3vM4Sc2G
	w26fvZE/yOn76uZeF+7kQ6valFOJB7P+qmIZZBVSGK612Kz/P3bKLrKc=
X-Google-Smtp-Source: AGHT+IHr/1nMZN9npsBJqflH8EDyMKxMKowp6Z57TX0KA0hBnVZKYlmZ/dMEdZ0nIpW8iSX+MxjK+mYO90E3bQ/u+/HoicntAi0w
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2184:b0:3a0:b0dc:abfe with SMTP id
 e9e14a558f8ab-3a0c8d25cffmr81200665ab.17.1727082142465; Mon, 23 Sep 2024
 02:02:22 -0700 (PDT)
Date: Mon, 23 Sep 2024 02:02:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <66f12e9e.050a0220.3eed3.000a.GAE@google.com>
Subject: [syzbot] Monthly ppp report (Sep 2024)
From: syzbot <syzbot+list22f4c01bc59cfcacc23a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ppp maintainers/developers,

This is a 31-day syzbot report for the ppp subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ppp

During the period, 1 new issues were detected and 0 were fixed.
In total, 4 issues are still open and 9 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 73      No    INFO: task hung in ppp_exit_net (4)
                  https://syzkaller.appspot.com/bug?extid=32bd764abd98eb40dea8
<2> 27      Yes   inconsistent lock state in valid_state (4)
                  https://syzkaller.appspot.com/bug?extid=d43eb079c2addf2439c3
<3> 16      No    possible deadlock in ppp_input
                  https://syzkaller.appspot.com/bug?extid=38ad8c7c6638c5381a47

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

