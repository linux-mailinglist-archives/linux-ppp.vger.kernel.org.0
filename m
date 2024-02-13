Return-Path: <linux-ppp+bounces-8-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33401853721
	for <lists+linux-ppp@lfdr.de>; Tue, 13 Feb 2024 18:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBF5C1F29DCE
	for <lists+linux-ppp@lfdr.de>; Tue, 13 Feb 2024 17:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10865F56B;
	Tue, 13 Feb 2024 17:20:10 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079255FDAA
	for <linux-ppp@vger.kernel.org>; Tue, 13 Feb 2024 17:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.254.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707844810; cv=none; b=QMFNHlsVtm8o4K0cLUpdhni+RKiYX0GDVV6/bR5KT12aLu1ueb283ZOo+3pxOGKY8JtEUuCYS5UWJ7RIG9FD8+EDJK8b9O8HxQ0FFqpCbo83VK2DI2lnSizL6n+G+IaAbGPtuMykrl/3dcwWD8kozVL3y/zpgvQ2qGXU24dmh2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707844810; c=relaxed/simple;
	bh=1QyKdX0G5rlj3Dddk7cXXOqI8PqOzd6Ox5PUf7jH70c=;
	h=To:From:Subject:Date:Message-ID; b=AXZ2i78EhjW7J/7NmOXQY26XNcswE27VHWdPL5QnbErKuUB2o0oX6MWBRLUHgDiDl1Sam3LcdXskP1xfrcr/zq5EY51NWZ5iMykbHwVecx88G49LobqBUukZUfhJ5uzurMzvFfJYxzgX9vrNk8bceY5pO16gsru8KFFp3GUrwMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=chmurka.net; spf=pass smtp.mailfrom=m.gmane-mx.org; arc=none smtp.client-ip=116.202.254.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=chmurka.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.gmane-mx.org
Received: from list by ciao.gmane.io with local (Exim 4.92)
	(envelope-from <lnx-linux-ppp@m.gmane-mx.org>)
	id 1rZwRu-0003Q5-8Q
	for linux-ppp@vger.kernel.org; Tue, 13 Feb 2024 18:20:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: linux-ppp@vger.kernel.org
From: gmane2@chmurka.net (Adam W.)
Subject: [PATCH] pppd: typo in comment
Date: Tue, 13 Feb 2024 17:18:03 -0000 (UTC)
Message-ID: <uqg88b$hag$1@ciao.gmane.io>
User-Agent: tin/2.6.1-20211226 ("Convalmore") (Linux/6.1.21-v7+ (armv7l))
Cancel-Lock: sha1:B0cdmSPqlF3kxAtNBF7QL215ayc=
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>

Hi,

Just a small patch to correct a typo in one comment.

Signed-off-by: Adam Wysocki <ppp@chmurka.net>

--- a/pppd/sys-linux.c
+++ b/pppd/sys-linux.c
@@ -1718,7 +1718,7 @@ get_idle_time(int u, struct ppp_idle *ip)
 
 /********************************************************************
  *
- * get_ppp_stats_iocl - return statistics for the link, using the ioctl() method,
+ * get_ppp_stats_ioctl - return statistics for the link, using the ioctl() method,
  * this only supports 32-bit counters, so need to count the wraps.
  */
 static int


