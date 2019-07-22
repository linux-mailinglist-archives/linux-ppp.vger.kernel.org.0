Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F180C70D62
	for <lists+linux-ppp@lfdr.de>; Tue, 23 Jul 2019 01:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731009AbfGVXf3 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 22 Jul 2019 19:35:29 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33102 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727157AbfGVXf2 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 22 Jul 2019 19:35:28 -0400
Received: by mail-pl1-f196.google.com with SMTP id c14so19759829plo.0
        for <linux-ppp@vger.kernel.org>; Mon, 22 Jul 2019 16:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=AiBRlIAT7I3Amav9LowS8+fXTV/KTasGBHcnvFRYuag=;
        b=vAMuAqh2XoekcoPKyj9VJmbY4PAh++wKlVSvBjwD6bU4mT39aLw1bdXL9F422E0nS4
         jIrNtKbO/bqFV/RZF+Qe7E8eSbCY10ZelVVvyk7az8DBPrAZguFdPSOglkWDuxNR4GhU
         8a0HOP0fj2D/PmcZzZwN0R1y363I+AYaHcdGvFB+pREPW5gsywLdE5dCehSEfuu/S8Vt
         Mhu6Fm8kUcXRWJiCANGy98RG+QH+PgOQahCIhmhnP4fauCFbUC7Q7O/34yn+SO3HCVIP
         WVMZlTBnEz3AdLI8vqSwLGHnFzwIZO8GvEso4ZSkWu9pbRyAcY6lFm5hmyvCU0uA0Mjs
         hYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=AiBRlIAT7I3Amav9LowS8+fXTV/KTasGBHcnvFRYuag=;
        b=BfMD5dPgNYvdAGcMoUQ6m6yFWApNq8CtWp1ZYRHtWtUMv4/1dDC2x23yzE7rwasjWh
         Op8YDyLpVV3ix6+P/MUyO3/C4WK0KXpBXfiekvaeI93+gA+9Vw93wcAiF0RruCcvyarM
         0S7GTYu7bPwgc3GVZuzUbB2sD+4F/qkQWGyLJSlBlD/VZJJhofox1pkWw/2l5nfn/j5I
         zILdFo3btbkVWhkGmtJ3NiwzkihCYw8+yqlxfX/T1JLZ+HtPNr87iEZ9WgY/sjjcj3SO
         PFxdo+lPdPOLTcIYh6zj8ypvWzAlTzvmJb0/BlQheXrEBFYHFaczcGYpyDlI3O1Qfu+a
         /C1g==
X-Gm-Message-State: APjAAAWmOyppkQ5QaO00jV4uVFR93gf3xM+YoUlHOEtNntIuGcs+vaxq
        r5jrMnhvEGhxszaYuruyv1TR5yGXnJY=
X-Google-Smtp-Source: APXvYqxIXKTBPgRRCdCyfrHH4LB9+seUP9+q6so1zacryVsXExSORaBCCTD+kDI6fvDRPmQlss3aVw==
X-Received: by 2002:a17:902:900a:: with SMTP id a10mr78780549plp.281.1563838527733;
        Mon, 22 Jul 2019 16:35:27 -0700 (PDT)
Received: from localhost.localdomain (76-14-106-55.rk.wavecable.com. [76.14.106.55])
        by smtp.gmail.com with ESMTPSA id h1sm31069053pgv.93.2019.07.22.16.35.26
        for <linux-ppp@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 16:35:27 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-ppp@vger.kernel.org
Subject: [PATCH] pppcrypt: Add headers for encrypt and setkey
Date:   Mon, 22 Jul 2019 16:35:25 -0700
Message-Id: <20190722233525.29203-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Fixes compilation with musl when building against strict C standard.
Implicit function declarations are a GNU extension.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 pppd/pppcrypt.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/pppd/pppcrypt.h b/pppd/pppcrypt.h
index adcdcbc..48d0d1a 100644
--- a/pppd/pppcrypt.h
+++ b/pppd/pppcrypt.h
@@ -41,6 +41,9 @@
 #include <des.h>
 #endif
 
+#include <stdlib.h>		/* for encrypt */
+#include <unistd.h>		/* for setkey */
+
 extern bool	DesSetkey __P((u_char *));
 extern bool	DesEncrypt __P((u_char *, u_char *));
 extern bool	DesDecrypt __P((u_char *, u_char *));
-- 
2.17.1

