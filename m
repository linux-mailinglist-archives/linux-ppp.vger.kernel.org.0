Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBFECA98C7
	for <lists+linux-ppp@lfdr.de>; Thu,  5 Sep 2019 05:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730893AbfIEDLS (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 4 Sep 2019 23:11:18 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46168 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730805AbfIEDLS (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 4 Sep 2019 23:11:18 -0400
Received: by mail-pl1-f194.google.com with SMTP id t1so549125plq.13
        for <linux-ppp@vger.kernel.org>; Wed, 04 Sep 2019 20:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fcnS+G2pmrv/7FtDCpDg3ydXize5+qRthlkH+i6Nzg4=;
        b=ZDy0QoVXR8NP5HmcAeSd42ZlxZcaLRWuNT1x335B6K+p+Wl3Du5eTC5yr6GVVDrjSH
         7WRPbXrq1z8SL59ItZNjYg8SzxrkWTv6LI7g+hPEQl2BjMN2TmQxgCKh8woupiYlfAlj
         AV0o7p5uLxvxmSttnBp6QAb3dzRHetI1bKxJE7v6/CDOhbqHlreQ6Hz/6+puwDsD0Nq7
         YiBQQfuUrE1WkAkIq3ITPMKBQi/oLcpy5oCvmMtSPX6o1XstJ5KBLtOEqVYy4td6/8rp
         k4RHtKkJeyANVP6Y72Z9ATUdqnf4C7K624iLqDVZ9ropU0y3Z3zO4zvDwY5xE5A3Foq0
         PBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fcnS+G2pmrv/7FtDCpDg3ydXize5+qRthlkH+i6Nzg4=;
        b=Lrf6HQXSDkN5WR/vV+W7S4IyQeeHQTI6NrNzx+rNpl10F8XEm/fSDa2XmwxFnQhOM9
         I8GFQdG4jHH+Yss9P0eL2nlyNeFTWZt2OA/7p3AuZmvyqNx+XlZkkonU0X6XQsdxcJOc
         mq9N9SaygeIDmploF6Z5h0uY/jp5PKKS3lJ/LxjRE9zNVeVbd4nA5l4AjMvRgvy/J7Ax
         VQ/Dhku06cKQ8f+SssTgeULkG5l7I5SzVYVun/YKhxBcqhpbX1IebHeQNK/jtMpugUVa
         HqyG9lqVl0H6iIvU9mywuWu5QToXI6izeHaVLlGF0RlWrpCeVGw3n36AusXYV3sYfYO4
         v7nQ==
X-Gm-Message-State: APjAAAX3l6oTPUzIt++pBb465yVaj3ZGQ+4dVVELXfPp7KuqtefosDJY
        b57OCCl9gifLVru3Bh6ucqXUzw==
X-Google-Smtp-Source: APXvYqzBFhlg64JEELcYEpxge8o+Trj6bBxB+7UyvFsapXetocrCnzyulDI8AJ5Yy6Z/egaVAHxGog==
X-Received: by 2002:a17:902:8a81:: with SMTP id p1mr1019815plo.71.1567653078050;
        Wed, 04 Sep 2019 20:11:18 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id q4sm531864pfh.115.2019.09.04.20.11.15
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 04 Sep 2019 20:11:17 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     stable@vger.kernel.org, paulus@samba.org
Cc:     ebiggers@google.com, linux-ppp@vger.kernel.org,
        netdev@vger.kernel.org, arnd@arndb.de, baolin.wang@linaro.org,
        orsonzhai@gmail.com, vincent.guittot@linaro.org,
        linux-kernel@vger.kernel.org
Subject: [BACKPORT 4.14.y v2 5/6] ppp: mppe: Revert "ppp: mppe: Add softdep to arc4"
Date:   Thu,  5 Sep 2019 11:10:45 +0800
Message-Id: <c24710bae9098ba971a2778a1a44627d5fa3ddc0.1567649729.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1567649728.git.baolin.wang@linaro.org>
References: <cover.1567649728.git.baolin.wang@linaro.org>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

[Upstream commit 25a09ce79639a8775244808c17282c491cff89cf]

Commit 0e5a610b5ca5 ("ppp: mppe: switch to RC4 library interface"),
which was merged through the crypto tree for v5.3, changed ppp_mppe.c to
use the new arc4_crypt() library function rather than access RC4 through
the dynamic crypto_skcipher API.

Meanwhile commit aad1dcc4f011 ("ppp: mppe: Add softdep to arc4") was
merged through the net tree and added a module soft-dependency on "arc4".

The latter commit no longer makes sense because the code now uses the
"libarc4" module rather than "arc4", and also due to the direct use of
arc4_crypt(), no module soft-dependency is required.

So revert the latter commit.

Cc: Takashi Iwai <tiwai@suse.de>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/net/ppp/ppp_mppe.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ppp/ppp_mppe.c b/drivers/net/ppp/ppp_mppe.c
index d9eda7c..6c7fd98 100644
--- a/drivers/net/ppp/ppp_mppe.c
+++ b/drivers/net/ppp/ppp_mppe.c
@@ -63,7 +63,6 @@
 MODULE_DESCRIPTION("Point-to-Point Protocol Microsoft Point-to-Point Encryption support");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("ppp-compress-" __stringify(CI_MPPE));
-MODULE_SOFTDEP("pre: arc4");
 MODULE_VERSION("1.0.2");
 
 static unsigned int
-- 
1.7.9.5

