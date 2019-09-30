Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA476C20CA
	for <lists+linux-ppp@lfdr.de>; Mon, 30 Sep 2019 14:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728214AbfI3MpO (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 30 Sep 2019 08:45:14 -0400
Received: from relay-b01.edpnet.be ([212.71.1.221]:52553 "EHLO
        relay-b01.edpnet.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbfI3MpO (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 30 Sep 2019 08:45:14 -0400
X-ASG-Debug-ID: 1569847510-0a7ff54e954e4320001-vz1ewb
Received: from zotac.vandijck-laurijssen.be (77.109.119.18.adsl.dyn.edpnet.net [77.109.119.18]) by relay-b01.edpnet.be with ESMTP id R45Q9D1dNbRVZAfi for <linux-ppp@vger.kernel.org>; Mon, 30 Sep 2019 14:45:10 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.119.18.adsl.dyn.edpnet.net[77.109.119.18]
X-Barracuda-Apparent-Source-IP: 77.109.119.18
Received: from x1.vandijck-laurijssen.be (74.250-240-81.adsl-static.isp.belgacom.be [81.240.250.74])
        by zotac.vandijck-laurijssen.be (Postfix) with ESMTPSA id B8419A18D52
        for <linux-ppp@vger.kernel.org>; Mon, 30 Sep 2019 14:45:09 +0200 (CEST)
Date:   Mon, 30 Sep 2019 14:45:08 +0200
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To:     linux-ppp@vger.kernel.org
Subject: Re: [PATCH 7/9] pppoe: remove the use of cdefs
Message-ID: <20190930124508.GA27078@x1.vandijck-laurijssen.be>
X-ASG-Orig-Subj: Re: [PATCH 7/9] pppoe: remove the use of cdefs
Mail-Followup-To: linux-ppp@vger.kernel.org
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <1569482466-9551-8-git-send-email-dev.kurt@vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1569482466-9551-8-git-send-email-dev.kurt@vandijck-laurijssen.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Barracuda-Connect: 77.109.119.18.adsl.dyn.edpnet.net[77.109.119.18]
X-Barracuda-Start-Time: 1569847510
X-Barracuda-URL: https://212.71.1.221:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 1303
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.5715 1.0000 0.7500
X-Barracuda-Spam-Score: 1.25
X-Barracuda-Spam-Status: No, SCORE=1.25 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=BSF_RULE7568M
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.76963
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
        0.50 BSF_RULE7568M          Custom Rule 7568M
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

sys/cdefs.h contains the __P() macro.
The header doesn't exist in my musl toolchain,
the __P() macro has been obsoleted even by glibc,
and it's never used in the code.
This commit removes the need for this remainder.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 pppd/plugins/rp-pppoe/config.h | 3 ---
 pppd/plugins/rp-pppoe/pppoe.h  | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/pppd/plugins/rp-pppoe/config.h b/pppd/plugins/rp-pppoe/config.h
index 5703087..a708859 100644
--- a/pppd/plugins/rp-pppoe/config.h
+++ b/pppd/plugins/rp-pppoe/config.h
@@ -101,9 +101,6 @@
 /* Define if you have the <netpacket/packet.h> header file.  */
 #define HAVE_NETPACKET_PACKET_H 1
 
-/* Define if you have the <sys/cdefs.h> header file.  */
-#define HAVE_SYS_CDEFS_H 1
-
 /* Define if you have the <sys/dlpi.h> header file.  */
 /* #undef HAVE_SYS_DLPI_H */
 
diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
index 813dcf3..55f0ca3 100644
--- a/pppd/plugins/rp-pppoe/pppoe.h
+++ b/pppd/plugins/rp-pppoe/pppoe.h
@@ -39,10 +39,6 @@
 #error Unknown method for accessing raw Ethernet frames
 #endif
 
-#ifdef HAVE_SYS_CDEFS_H
-#include <sys/cdefs.h>
-#endif
-
 #ifdef HAVE_SYS_SOCKET_H
 #include <sys/socket.h>
 #endif
