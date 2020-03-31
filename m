Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C900198A94
	for <lists+linux-ppp@lfdr.de>; Tue, 31 Mar 2020 05:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbgCaDkX (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 30 Mar 2020 23:40:23 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37970 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbgCaDkX (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 30 Mar 2020 23:40:23 -0400
Received: by mail-pl1-f194.google.com with SMTP id w3so7601322plz.5
        for <linux-ppp@vger.kernel.org>; Mon, 30 Mar 2020 20:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l4PyPOOwYcsnUNr8rMZ7Gc9bG2fWRhrxkfBoIATkfa0=;
        b=hQV30P9bhnlOnk94njXdE5tc9UzDbNjZkNPXR7RqQ0nbolguc1og0o8muZ3+jFlVAQ
         ogKGNxflB/f8fPFVYazMEzdf4XixTC7wwvDXCgpmFy3Ekc5E52vdNCt28uXch+rz09pj
         BwteKqztAmF6K1cleKNlS8gFCCJZkD2PiBnsjLyFCP1m8ks1XKyF2vubMY/fPNrx6isR
         H15dmsdNmHdOIGTwVBVEn99stz+8+WbyqTN6XNTBGSL8SYRgcMap78ixAWmsDcL9xoNj
         S5OLicZ5e6emmOuJuQ3xsnYgBQeLOlPlcvoJUOTzh5B6U/lv0+vIOTF3qRH3RTYmWEsx
         E2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l4PyPOOwYcsnUNr8rMZ7Gc9bG2fWRhrxkfBoIATkfa0=;
        b=Qzsws67rlNrMWQPzkN4qOlKmjesGqYwxGqZv/xyG+NMAx44BFLvevMb+5lLPrx5G9+
         WwqnrdJpmTFOKu+y2DtFqNfTUCWT8H9Wz0iD4LRoCubayW5mBItWgBr/DzZKZiPXy549
         elNzbmED3Emc8CrFdlF74BunpIQPMBS5Yb7Cfn+5uMLWCi1ggRNJqVHer0NnSX49QJiJ
         cBSZWKY41GNMbAuGF1i+PyWKgjGh9bZWFMCHcj9l/hMBT6nWHs8dKY+wHliFTvFn7Fjk
         PQYoi/CZHgZu9EP5kt4Phj3oDIqi1CPbXeMSziX9V3vWdF54gA78ouO0Ibdfk6piy7zx
         obwg==
X-Gm-Message-State: ANhLgQ1wDiBeWm+U5KqbhHLQhMvMWH+9J/gPYHU8PciaAjruSwOhBnm9
        S5iamu1lnY6GCiLENh5tjFfjsiwdoYg=
X-Google-Smtp-Source: ADFU+vswYPOQoQhICOuNLC3MHgSbq6te8OLAgbVP7jtVqL2i5AJ5QKDMP5Km2EFyC9PWlA5zZsHHKQ==
X-Received: by 2002:a17:902:7688:: with SMTP id m8mr15190395pll.160.1585626022064;
        Mon, 30 Mar 2020 20:40:22 -0700 (PDT)
Received: from mangix-trapnet.lan (astound-69-42-19-227.ca.astound.net. [69.42.19.227])
        by smtp.gmail.com with ESMTPSA id w69sm3511786pfc.52.2020.03.30.20.40.21
        for <linux-ppp@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 20:40:21 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-ppp@vger.kernel.org
Subject: [PATCH] pppd: add missing header for musl
Date:   Mon, 30 Mar 2020 20:40:20 -0700
Message-Id: <20200331034020.3457868-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 pppd/pppd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pppd/pppd.h b/pppd/pppd.h
index b31b78d..50c0e95 100644
--- a/pppd/pppd.h
+++ b/pppd/pppd.h
@@ -53,6 +53,7 @@
 #include <stdlib.h>		/* for encrypt */
 #include <unistd.h>		/* for setkey */
 #include <limits.h>		/* for NGROUPS_MAX */
+#include <sys/cdefs.h>		/* for __P */
 #include <sys/param.h>		/* for MAXPATHLEN and BSD4_4, if defined */
 #include <sys/types.h>		/* for u_int32_t, if defined */
 #include <sys/time.h>		/* for struct timeval */
-- 
2.25.1

