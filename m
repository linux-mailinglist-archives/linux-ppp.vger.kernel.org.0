Return-Path: <linux-ppp+bounces-280-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B01DA7E0CB
	for <lists+linux-ppp@lfdr.de>; Mon,  7 Apr 2025 16:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0DBF7A41F0
	for <lists+linux-ppp@lfdr.de>; Mon,  7 Apr 2025 14:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D692A1D54EF;
	Mon,  7 Apr 2025 14:15:19 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070902BAF4;
	Mon,  7 Apr 2025 14:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035319; cv=none; b=BAuB/pUhUgIx1UM7hbQxcVuVb/+WpQu6XZvCAy6i5H/S7E8/6WqiUKG4dOd9QBFPC5RAvFyasuhzeaRlnu3FygQWPp/rUM48oVWmWIXFeUUzWkfvo/K6/EravLn/Z8regOydYc2v3Ez+Ullj9i04Lxvu+mRHD5Iie2m60BPUQ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035319; c=relaxed/simple;
	bh=jmRe4AEApQULrs3bNjFMB9TRFmOHumBSMwnhP64rRyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=doCQrLOjZEixfoiQU5/avB6wY4mlVpeEGwa4lQmPltzunP1HG1YUnELG/99FtuPZr24uZTwKBfrxYC/4QuFMVHK4zGDdtbc4xTrQlFIi8o05twRz7FJvNPDZo7cL6X7oJFlpe5A9wEcV+PkCxFfGaRl+EG/6j6qzEdaIulmTFtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from arnaudlcm-X570-UD.. (unknown [IPv6:2a01:e0a:3e8:c0d0:3b93:9152:d50e:6d45])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id DE86E479B8;
	Mon,  7 Apr 2025 14:06:09 +0000 (UTC)
Authentication-Results: Plesk;
	spf=pass (sender IP is 2a01:e0a:3e8:c0d0:3b93:9152:d50e:6d45) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=arnaudlcm-X570-UD..
Received-SPF: pass (Plesk: connection is authenticated)
From: Arnaud Lecomte <contact@arnaud-lcm.com>
To: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot]
Date: Mon,  7 Apr 2025 16:06:03 +0200
Message-ID: <20250407140603.91155-1-contact@arnaud-lcm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <67ae3912.050a0220.21dd3.0021.GAE@google.com>
References: <67ae3912.050a0220.21dd3.0021.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174403477041.13227.827809552128555155@Plesk>
X-PPP-Vhost: arnaud-lcm.com

#syz test: https://github.com/ArnaudLcm/linux bounds-checking-txmung

