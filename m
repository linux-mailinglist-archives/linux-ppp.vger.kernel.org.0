Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8EEA61EF
	for <lists+linux-ppp@lfdr.de>; Tue,  3 Sep 2019 08:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727407AbfICGyy (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 3 Sep 2019 02:54:54 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40818 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbfICGyt (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Tue, 3 Sep 2019 02:54:49 -0400
Received: by mail-pf1-f195.google.com with SMTP id w16so10172017pfn.7
        for <linux-ppp@vger.kernel.org>; Mon, 02 Sep 2019 23:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=dZueRWZd1uZbZNG0riAle5evD2RPXFUMBIbKb1n2stM=;
        b=FGEtBmTw+UijXa25Ipc7xQ4tq+qIvfBqVg1NmnanWKkTe7yno7WjcxKffa1nMJRAxD
         AOYney+tqn0eT+NmaNjlkHQOanv2QIDA74pDFkjN2+P7BgoLwUFLkf7WRlMExbShWPkY
         li/3kKiY2mP6zBN27Xf9uW7QmC1Xh1uz3qOhy4WUq3vxN6fp1IjTUXp0jvN9sbegwtGr
         jBZD8enNnF01X7NkZsKZipwUc+J5nvDpaxa6aPgYmHKkqoD/xsVarFNXkIr2mGdpaGkC
         eWL7t0M4ytePKm2cj76neBQtC3gx6gqV2FTcsx3B5KgRrVZLgUaYfZ51ZUJWctoicY7C
         TIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dZueRWZd1uZbZNG0riAle5evD2RPXFUMBIbKb1n2stM=;
        b=CZNNvsk2B3QT6UhMYrV960IBrvHZvustj/llyIWlq5TcIFRs0YPL5TwLnt7PDj1dgb
         gvUFIXQR/6VDVzSnfY1ksaFcsiPs0VfBRUIQBxXTlJlSDhI2ljXcr9ie4/Ecf+GlVEUk
         jjnu6/wfNvIS8hXWfUv0izouN6uQdw/eNXtsYQfcFhtc3kehYeWPOmhzjDrApqI6uFaL
         qvocvkJ0+LIH5DVqRloiuzEcuBrboM1LWJqd2KTF0+uUnDc9bwwF1AfhByGSws3rs9Id
         089n9L7iEAVLYjf0zJTU5fH/nOHfNneOazDxWJc+aSiGd+U9tNT/uzXc1mmn+UAOHYWb
         r7Pg==
X-Gm-Message-State: APjAAAW6oQCBw03hfmW9i0558dqjCtdDcuGevTXi+tGSo066NNfRtd0e
        inp0sMOGoQQ10xdv1TTum5G7dQ==
X-Google-Smtp-Source: APXvYqxkoDM0uGwkQpRgclz5RRJ0gAHteeMYv8Fxj1KTi5HwH2NFSQ2AQjYuF7bCDIFRGM9OMwEfJg==
X-Received: by 2002:a63:7887:: with SMTP id t129mr28954591pgc.309.1567493688797;
        Mon, 02 Sep 2019 23:54:48 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id s7sm5872032pjn.8.2019.09.02.23.54.39
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 02 Sep 2019 23:54:48 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     stable@vger.kernel.org, chris@chris-wilson.co.uk, airlied@linux.ie,
        davem@davemloft.net, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        edumazet@google.com, peterz@infradead.org, mingo@redhat.com,
        vyasevich@gmail.com, nhorman@tuxdriver.com,
        linus.walleij@linaro.org, natechancellor@gmail.com, sre@kernel.org,
        paulus@samba.org, gregkh@linuxfoundation.org
Cc:     intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        netdev@vger.kernel.org, longman@redhat.com,
        hariprasad.kelam@gmail.com, linux-sctp@vger.kernel.org,
        linux-gpio@vger.kernel.org, david@lechnology.com,
        linux-pm@vger.kernel.org, ebiggers@google.com,
        linux-ppp@vger.kernel.org, lanqing.liu@unisoc.com,
        linux-serial@vger.kernel.org, arnd@arndb.de,
        baolin.wang@linaro.org, orsonzhai@gmail.com,
        vincent.guittot@linaro.org, linux-kernel@vger.kernel.org
Subject: [BACKPORT 4.14.y 0/8] Candidates from Spreadtrum 4.14 product kernel
Date:   Tue,  3 Sep 2019 14:53:46 +0800
Message-Id: <cover.1567492316.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

With Arnd's script [1] help, I found some bugfixes in Spreadtrum 4.14 product
kernel, but missing in v4.14.141:

86fda90ab588 net: sctp: fix warning "NULL check before some freeing functions is not needed"
25a09ce79639 ppp: mppe: Revert "ppp: mppe: Add softdep to arc4"
d9b308b1f8a1 drm/i915/fbdev: Actually configure untiled displays
47d3d7fdb10a ip6: fix skb leak in ip6frag_expire_frag_queue()
5b9cea15a3de serial: sprd: Modify the baud rate calculation formula
513e1073d52e locking/lockdep: Add debug_locks check in __lock_downgrade()
957063c92473 pinctrl: sprd: Use define directive for sprd_pinconf_params values
87a2b65fc855 power: supply: sysfs: ratelimit property read error message

[1] https://lore.kernel.org/lkml/20190322154425.3852517-19-arnd@arndb.de/T/

Chris Wilson (1):
  drm/i915/fbdev: Actually configure untiled displays

David Lechner (1):
  power: supply: sysfs: ratelimit property read error message

Eric Biggers (1):
  ppp: mppe: Revert "ppp: mppe: Add softdep to arc4"

Eric Dumazet (1):
  ip6: fix skb leak in ip6frag_expire_frag_queue()

Hariprasad Kelam (1):
  net: sctp: fix warning "NULL check before some freeing functions is
    not needed"

Lanqing Liu (1):
  serial: sprd: Modify the baud rate calculation formula

Nathan Chancellor (1):
  pinctrl: sprd: Use define directive for sprd_pinconf_params values

Waiman Long (1):
  locking/lockdep: Add debug_locks check in __lock_downgrade()

 drivers/gpu/drm/i915/intel_fbdev.c        |   12 +++++++-----
 drivers/net/ppp/ppp_mppe.c                |    1 -
 drivers/pinctrl/sprd/pinctrl-sprd.c       |    6 ++----
 drivers/power/supply/power_supply_sysfs.c |    3 ++-
 drivers/tty/serial/sprd_serial.c          |    2 +-
 include/net/ipv6_frag.h                   |    1 -
 kernel/locking/lockdep.c                  |    3 +++
 net/sctp/sm_make_chunk.c                  |   12 ++++--------
 8 files changed, 19 insertions(+), 21 deletions(-)

-- 
1.7.9.5

