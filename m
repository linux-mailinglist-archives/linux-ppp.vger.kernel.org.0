Return-Path: <linux-ppp+bounces-63-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DA58BAA2A
	for <lists+linux-ppp@lfdr.de>; Fri,  3 May 2024 11:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5603C1C219DE
	for <lists+linux-ppp@lfdr.de>; Fri,  3 May 2024 09:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D65314F9CF;
	Fri,  3 May 2024 09:50:05 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp5.ctinetworks.com (smtp5.ctinetworks.com [205.166.61.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A35013959C
	for <linux-ppp@vger.kernel.org>; Fri,  3 May 2024 09:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.166.61.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714729805; cv=none; b=LHGXS7UTilcNU0AFLu1aXim97UehYlNgPsobLfF3TBZ8WLFrOWSLpRcgJSFer+y9W9EXmsB9agqZewS7hjtGhBO9LixSbNk6LuxEbfAjTHdO7aEW+LxRlb+OwplqJiB+U2KP48JlSa5Lzk27Rng3cgR1sBSHzrlx31gmQS3ZGV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714729805; c=relaxed/simple;
	bh=oHKvfYGRv1K0Pqndew448EMCUx5VpadwjIOLRTDRGm4=;
	h=Date:Message-Id:To:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jEbOynL3mhCLP0XRjvQ7hcy0nPGNum16KOCUmy2pb9jjXzjDdvM0d2e66ZgVTNxDCiYCKgbkhi72tryhtFoROi9H8+4C5vsQplTftw4WJEIvptsgxPVmqKjUMJ/JLTVSCJmt4L2lQ109vGXBvcT9O4RNarPKgsM8i/Hm+nd+ajw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=meer.net; spf=pass smtp.mailfrom=meer.net; arc=none smtp.client-ip=205.166.61.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=meer.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meer.net
Received: from localhost (unknown [117.193.3.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: enometh@meer.net)
	by smtp5.ctinetworks.com (Postfix) with ESMTPSA id D24291655D9
	for <linux-ppp@vger.kernel.org>; Fri,  3 May 2024 05:41:20 -0400 (EDT)
Date: Fri, 03 May 2024 15:11:10 +0530 (IST)
Message-Id: <20240503.151110.1561650016112331638.enometh@meer.net>
To: linux-ppp@vger.kernel.org
Subject: Re: ppp-2.5.0 sometimes doesn't print stats on terminating on
 signal 2
From: Madhu <enometh@meer.net>
In-Reply-To: <20240326.220015.873398620206616683.enometh@meer.net>
References: <20240326.220015.873398620206616683.enometh@meer.net>
X-Mailer: Mew version 6.9 on Emacs 30.0.50
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
 boundary="--Next_Part(Fri_May__3_15_11_10_2024_105)--"
Content-Transfer-Encoding: 7bit
X-ctinetworks-Information: Please contact the ISP for more information
X-ctinetworks-MailScanner-ID: D24291655D9.A4188
X-ctinetworks-VirusCheck: Found to be clean
X-ctinetworks-SpamCheck: 
X-ctinetworks-Watermark: 1715593287.36072@1A6Gq9eGuEunQUAeMnr/zw

----Next_Part(Fri_May__3_15_11_10_2024_105)--
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

*  Madhu <20240326.220015.873398620206616683.enometh@meer.net>
Wrote on Tue, 26 Mar 2024 22:00:15 +0530 (IST)
> Hello, I've only now updated from 2.4.9 to 2.5.0 (on gentoo) and am
> noticing this non-deterministic behaviour, pppoe plugin,
>
> I call pppd with the nodetach option, and frequently terminate the
> connection with ^C. Usually I get output like this
> ```
> ^CTerminating on signal 2
> Connect time 26.4 minutes.
> Sent 85749 bytes, received 1323321 bytes.
> Connection terminated.
> ```
> But sometimes I only get
> ```
> ^CTerminating on signal 2                                                       Connection terminated.
> ```
>
> i.e.  connection time and send/recv stats are not printed
> or sent to syslog, and the accounting information is being lost.
>
> Has this been encountered by others since the release?  Any
> suggestions on where to look for the changes which might cause this?

I downgraded for a while to 2.4.9 and didn't see the problem on the
same system, so it was def. to do with the changes in 2.5.0.
Following on a hunch after seeing a log like this

```
May  3 05:35:30 localhost pppd[15375]: peer from calling number XX:XX:XX:XX:XX:XX authorized
May  3 05:35:31 localhost pppd[15375]: local  IP address n1.n2.n3.n4
May  3 05:35:31 localhost pppd[15375]: remote IP address m1.m2.m3.m4
May  3 05:35:31 localhost pppd[15375]: primary   DNS address XXX
May  3 05:35:31 localhost pppd[15375]: secondary DNS address XXX
May  3 05:35:33 localhost pppd[15375]: Connect time 0.1 minutes.
May  3 05:35:33 localhost pppd[15375]: Sent 14 bytes, received 10 bytes.
May  3 05:35:33 localhost pppd[15375]: local  IP address n1.n2.n3.n4
May  3 05:35:33 localhost pppd[15375]: remote IP address m1.m2.m3.m4
May  3 05:35:33 localhost pppd[15375]: primary   DNS address XXX
May  3 05:35:33 localhost pppd[15375]: secondary DNS address XXX
May  3 08:33:50 localhost pppd[15375]: Terminating on signal 2
```

(After the ipcp quirk in connection I was connected Between 5:35 and
8:33, but the ^C didn't print the connection information.  This was
without the persist option.)

The problem seems to be caused by faulty logic with `link_stats_print'
in pppd/main.c (which seems to have been separated out of
link_stats_valid). It is initialized to 1 in main(), and reset to 0 in
print_link_stats().  This means that print_link_stats() will only ever
print once.  This cannot possibly be correct with with persist option.

I'm not sure if this covers my initial report, but I'm now running
with the attached patch, which resets link_stats_print to 1 in
reset_link_stats().  (please review, it also skips the conditional on
the return value) -- Regards, Madhu


----Next_Part(Fri_May__3_15_11_10_2024_105)--
Content-Type: Text/X-Patch; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-fix-reliability-of-print_link_stats-with-option-pers.patch"

From c7ce6adfc3d81cdc44291fe03f907844fc1318c6 Mon Sep 17 00:00:00 2001
From: Madhu <enometh@net.meer>
Date: Fri, 3 May 2024 14:57:07 +0530
Subject: [PATCH] fix reliability of print_link_stats (with option persist)

* pppd/ipcp.c: (ipcp_down): fix comment
* pppd/main.c: (reset_link_stats): reset print_link_stats to 1, set
start_time even if get_ppp_stats fails.
---
 pppd/ipcp.c | 2 +-
 pppd/main.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/pppd/ipcp.c b/pppd/ipcp.c
index 5d9ff11..b67f934 100644
--- a/pppd/ipcp.c
+++ b/pppd/ipcp.c
@@ -2026,7 +2026,7 @@ ipcp_down(fsm *f)
     sifvjcomp(f->unit, 0, 0, 0);
 
     print_link_stats(); /* _after_ running the notifiers and ip_down_hook(),
-			 * because print_link_stats() sets link_stats_valid
+			 * because print_link_stats() sets link_stats_print
 			 * to 0 (zero) */
 
     /*
diff --git a/pppd/main.c b/pppd/main.c
index 8310c98..da68fc5 100644
--- a/pppd/main.c
+++ b/pppd/main.c
@@ -1331,9 +1331,9 @@ print_link_stats(void)
 void
 reset_link_stats(int u)
 {
-    if (!get_ppp_stats(u, &old_link_stats))
-	return;
+    get_ppp_stats(u, &old_link_stats)
     ppp_get_time(&start_time);
+    link_stats_print = 1;
 }
 
 /*
-- 
2.39.2.101.g768bb238c4


----Next_Part(Fri_May__3_15_11_10_2024_105)----

