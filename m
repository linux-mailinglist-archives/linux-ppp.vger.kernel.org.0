Return-Path: <linux-ppp+bounces-54-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DE288C979
	for <lists+linux-ppp@lfdr.de>; Tue, 26 Mar 2024 17:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F4EA1F81E3E
	for <lists+linux-ppp@lfdr.de>; Tue, 26 Mar 2024 16:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB56848A;
	Tue, 26 Mar 2024 16:35:42 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp7.ctinetworks.com (smtp7.ctinetworks.com [205.166.61.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9AC1C6A7
	for <linux-ppp@vger.kernel.org>; Tue, 26 Mar 2024 16:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.166.61.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711470942; cv=none; b=Vt5/o8HuxkdtD3Kk522TfSu7S4wMhAIdM1Bky5321G2I6GpRtVLwFFIc0LARWk1gPnWPhfhBHMXGfnkRyLk8cnPt96mOuzmVsipld5kbE7iDe1h9zQd18908e7fEtAHeQZETcgftJ5YM7eDdl4ny4KuMenxypgMb5BnqEn1tYwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711470942; c=relaxed/simple;
	bh=HHUDynTwKP19Y9zepwXYPmawj5f8ErCxQSQj29dXogI=;
	h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type; b=RM8lIZwe9U9lznlrSSRZIZLIxHWJtsYbbsBGtntBXBv4hNZiUR0qe1cGEmzYAq5TCSglANTIoYL8sLTqMeG4yDbTBrPOjNTOplcg0KLm7C8SCjmnzqC0Ew/aYxVaWG4/9b/yZL2CB2Zv3YSGa1AWIQQS9OWGd/n7qPvg7KEMCTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=meer.net; spf=pass smtp.mailfrom=meer.net; arc=none smtp.client-ip=205.166.61.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=meer.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meer.net
Received: from localhost (unknown [117.254.37.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: enometh@meer.net)
	by smtp7.ctinetworks.com (Postfix) with ESMTPSA id 7828512CAC4
	for <linux-ppp@vger.kernel.org>; Tue, 26 Mar 2024 12:30:14 -0400 (EDT)
Date: Tue, 26 Mar 2024 22:00:15 +0530 (IST)
Message-Id: <20240326.220015.873398620206616683.enometh@meer.net>
To: linux-ppp@vger.kernel.org
Subject: ppp-2.5.0 sometimes doesn't print stats on terminating on signal 2
From: Madhu <enometh@meer.net>
X-Mailer: Mew version 6.9 on Emacs 30.0.50
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-ctinetworks-Information: Please contact the ISP for more information
X-ctinetworks-MailScanner-ID: 7828512CAC4.A3732
X-ctinetworks-VirusCheck: Found to be clean
X-ctinetworks-SpamCheck: 
X-ctinetworks-Watermark: 1712334617.38261@emompRowclLfWTD2/vgI0g

Hello, I've only now updated from 2.4.9 to 2.5.0 (on gentoo) and am
noticing this non-deterministic behaviour, pppoe plugin,

I call pppd with the nodetach option, and frequently terminate the
connection with ^C. Usually I get output like this
```
^CTerminating on signal 2
Connect time 26.4 minutes.
Sent 85749 bytes, received 1323321 bytes.
Connection terminated.
```
But sometimes I only get
```
^CTerminating on signal 2                                                       Connection terminated.
```

i.e.  connection time and send/recv stats are not printed
or sent to syslog, and the accounting information is being lost.

Has this been encountered by others since the release?
Any suggestions on where to look for the changes which might cause this?

--- Regards,Madhu


