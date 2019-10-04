Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11998CC1E2
	for <lists+linux-ppp@lfdr.de>; Fri,  4 Oct 2019 19:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388146AbfJDRky (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 4 Oct 2019 13:40:54 -0400
Received: from relay-b01.edpnet.be ([212.71.1.221]:37815 "EHLO
        relay-b01.edpnet.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387428AbfJDRky (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 4 Oct 2019 13:40:54 -0400
X-ASG-Debug-ID: 1570210848-0a7ff54e96847ca0001-vz1ewb
Received: from zotac.vandijck-laurijssen.be (77.109.104.71.adsl.dyn.edpnet.net [77.109.104.71]) by relay-b01.edpnet.be with ESMTP id bwqympGQo1JZ5JgP; Fri, 04 Oct 2019 19:40:48 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.104.71.adsl.dyn.edpnet.net[77.109.104.71]
X-Barracuda-Apparent-Source-IP: 77.109.104.71
Received: from x1.vandijck-laurijssen.be (x1.vandijck-laurijssen.be [IPv6:fd01::1a1d:eaff:fe02:d339])
        by zotac.vandijck-laurijssen.be (Postfix) with ESMTPSA id 3C232A307B2;
        Fri,  4 Oct 2019 19:40:47 +0200 (CEST)
Date:   Fri, 4 Oct 2019 19:40:46 +0200
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To:     James Carlson <carlsonj@workingcode.com>
Cc:     Levente <leventelist@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>, linux-ppp@vger.kernel.org
Subject: [PATCH] time.h: include header before using time_t
Message-ID: <20191004174046.GA868@x1.vandijck-laurijssen.be>
X-ASG-Orig-Subj: [PATCH] time.h: include header before using time_t
Mail-Followup-To: James Carlson <carlsonj@workingcode.com>,
        Levente <leventelist@gmail.com>, Paul Mackerras <paulus@ozlabs.org>,
        linux-ppp@vger.kernel.org
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20191003224054.GA26158@blackberry>
 <CACwWb3BoHF0WQ3ve3PQ_7L3LfJsvqC3Z9ZF5zOwd-r-GWv8CuA@mail.gmail.com>
 <20191004104958.GD881@x1.vandijck-laurijssen.be>
 <6fb1fd97-7e97-8088-ef46-2d4003dbd4e6@workingcode.com>
 <20191004142900.GC22901@x1.vandijck-laurijssen.be>
 <f274b8fb-d472-c66d-5bc7-6af229a5f1b1@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f274b8fb-d472-c66d-5bc7-6af229a5f1b1@workingcode.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Barracuda-Connect: 77.109.104.71.adsl.dyn.edpnet.net[77.109.104.71]
X-Barracuda-Start-Time: 1570210848
X-Barracuda-URL: https://212.71.1.221:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 2261
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.5323 1.0000 0.7500
X-Barracuda-Spam-Score: 0.75
X-Barracuda-Spam-Status: No, SCORE=0.75 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.77102
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On vr, 04 okt 2019 10:49:17 -0400, James Carlson wrote:
> On 10/04/19 10:29, Kurt Van Dijck wrote:
> > Now that I know that that file is used as include for kernel code, I'd
> > rather include time.h in the userspace c-files.
> 
> My point is that include/net/ isn't strictly userspace.
> 
> If you feel the need, then go ahead and include <time.h> in user level
> files.  This just isn't one of those.
> 
> If you must do this in ppp_def.h, then it needs to be guarded against
> *all* of the systems where including a top-level header file inside a
> kernel module is the wrong thing to do, not just "ifndef SOLARIS".  Do
> you know which systems those are?  I can tell you that Solaris/Illumos
> is at least one such system, but I can't tell you that it's *all* of them.
> 
> I think this include is out of place here.
ack

I think you confirm 4x what I said, but I probably expressed myself
badly, so "show me code!", I created this patch.
It (1) works for me and (2) does not mix userspace headers in kernel
space anywhere.
Would this work for you?

---
commit 567d505b1b8eff3d1579e849a4272d114f047bf3
Author: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date:   Fri Oct 4 19:24:22 2019

    time.h: include header before using time_t
    
    Since include/net/ppp_defs.h is used in both kernelspace and userland
    makes it hard to put time.h include there.
    This commit fixes the problems in userspace code individually and leaves
    ppp_defs.h as-is.
    
    Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

diff --git a/pppd/plugins/rp-pppoe/pppoe-discovery.c b/pppd/plugins/rp-pppoe/pppoe-discovery.c
index 8b2e946..f19c6d8 100644
--- a/pppd/plugins/rp-pppoe/pppoe-discovery.c
+++ b/pppd/plugins/rp-pppoe/pppoe-discovery.c
@@ -15,6 +15,7 @@
 #include <unistd.h>
 #include <errno.h>
 #include <string.h>
+#include <time.h>
 
 #include "pppoe.h"
 
diff --git a/pppd/sha1.c b/pppd/sha1.c
index f4f975c..4e51cee 100644
--- a/pppd/sha1.c
+++ b/pppd/sha1.c
@@ -17,6 +17,7 @@
 /* #define SHA1HANDSOFF * Copies data before messing with it. */
 
 #include <string.h>
+#include <time.h>
 #include <netinet/in.h>	/* htonl() */
 #include <net/ppp_defs.h>
 #include "sha1.h"
