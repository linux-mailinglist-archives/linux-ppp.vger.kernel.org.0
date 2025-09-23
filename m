Return-Path: <linux-ppp+bounces-363-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E3CB97E7F
	for <lists+linux-ppp@lfdr.de>; Wed, 24 Sep 2025 02:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20744323E2C
	for <lists+linux-ppp@lfdr.de>; Wed, 24 Sep 2025 00:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C175C19539F;
	Wed, 24 Sep 2025 00:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b="BzBUdFW7"
X-Original-To: linux-ppp@vger.kernel.org
Received: from sender4-g3-154.zohomail360.com (sender4-g3-154.zohomail360.com [136.143.188.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283EF156678
	for <linux-ppp@vger.kernel.org>; Wed, 24 Sep 2025 00:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758674102; cv=pass; b=cZ1VUBY/2uWPZ6Ec+Gav7LTt5GQ9nmxHiCUjotIA/85/PODWOOuZZJNBRnHdYrcb20OZZBGLOeV/ZBlPI1zfuGkyzFw7LEl9l2sZuJkU9nzGEGB64j9tGiDe9CSwy+tPM6s+WF2CwaCVqG0vou6DRtiqgeOxgswOiqT+8pc3XzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758674102; c=relaxed/simple;
	bh=3zG5tsi3LQ2HHdcdZcQqRiNqirTuitKJQusfXySh8rA=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=BSpd/88CPBhwy7Sc2M3Y+t/1DLvSUrj1lyQU4uH8NNr6ZNU1lb54iVqP+mlZKJu5fK3jLwdrXdX8LRQdkfzfUJwC4PZ46pWnskuK3EbzQTcLwxC7YNK8SAydYjC71rxV5YVjqihVuHFsd40akcBjyN1p/MK/HDTTP8n2GIJNGnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx; dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b=BzBUdFW7; arc=pass smtp.client-ip=136.143.188.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx
ARC-Seal: i=1; a=rsa-sha256; t=1758674100; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=VfEz4u8gKWdBcfYj94MzpghUj+8Fba5ddkUULYQRGYy1CLY1jVv/PlOKTHQjp25IZJ5dGj/RzKHGOJeE4WCohOMmLnzd7A305uah0BoqqAI0wsJWccWnKGOrbRXzvJrAFLB1X1M+aMAw/J/QPouglKwH9n2y3y5uT8jr5UIPD90=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1758674100; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=3zG5tsi3LQ2HHdcdZcQqRiNqirTuitKJQusfXySh8rA=; 
	b=pKrLl2RBA9xWEdikTSTwzClZxheiBSe77i4bCsly+E19kCnEjkWEhKeOchtQfQ5G3BQTDOcD3CtHPHzUIpuX5/bqaLSf9e13MTSuHAtIOPIgZSINF3IajfJKADF6e/GMJiOlotbiOigC7jXMnH4CwP/TKpNOiGJXJpjiDqO66Y0=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=maguitec.com.mx;
	spf=pass  smtp.mailfrom=investorrelations+9aa09b20-98d8-11f0-8217-5254007ea3ec_vt1@bounce-zem.maguitec.com.mx;
	dmarc=pass header.from=<investorrelations@maguitec.com.mx>
Received: by mx.zohomail.com with SMTPS id 1758671652961670.9601708817262;
	Tue, 23 Sep 2025 16:54:12 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; b=BzBUdFW7FrPm1ODLAUSOIbTdNS2Ujdj/eLu3zsGDuH18fhMnjtkcNfa3f9uiNqFlA2PFjVbfZUl/EH3WgJaaLyQZgfnZyqTt7UrY+0Z/zf93++cHdeSHJw0UQjHuh84QojKcFIEVcwYItD7qHVcEs5BUK5HTR8kd1jhrqy6wUyE=; c=relaxed/relaxed; s=15205840; d=maguitec.com.mx; v=1; bh=3zG5tsi3LQ2HHdcdZcQqRiNqirTuitKJQusfXySh8rA=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:reply-to:to:message-id:subject;
Date: Tue, 23 Sep 2025 16:54:12 -0700 (PDT)
From: Al Sayyid Sultan <investorrelations@maguitec.com.mx>
Reply-To: investorrelations@alhaitham-investment.ae
To: linux-ppp@vger.kernel.org
Message-ID: <2d6f.1aedd99b146bc1ac.m1.9aa09b20-98d8-11f0-8217-5254007ea3ec.19978ffc5d2@bounce-zem.maguitec.com.mx>
Subject: Thematic Funds Letter Of Intent
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
content-transfer-encoding-Orig: quoted-printable
content-type-Orig: text/plain;\r\n\tcharset="utf-8"
Original-Envelope-Id: 2d6f.1aedd99b146bc1ac.m1.9aa09b20-98d8-11f0-8217-5254007ea3ec.19978ffc5d2
X-JID: 2d6f.1aedd99b146bc1ac.s1.9aa09b20-98d8-11f0-8217-5254007ea3ec.19978ffc5d2
TM-MAIL-JID: 2d6f.1aedd99b146bc1ac.m1.9aa09b20-98d8-11f0-8217-5254007ea3ec.19978ffc5d2
X-App-Message-ID: 2d6f.1aedd99b146bc1ac.m1.9aa09b20-98d8-11f0-8217-5254007ea3ec.19978ffc5d2
X-Report-Abuse: <abuse+2d6f.1aedd99b146bc1ac.m1.9aa09b20-98d8-11f0-8217-5254007ea3ec.19978ffc5d2@zeptomail.com>
X-ZohoMailClient: External

To: linux-ppp@vger.kernel.org
Date: 24-09-2025
Thematic Funds Letter Of Intent

It's a pleasure to connect with you

Having been referred to your investment by my team, we would be=20
honored to review your available investment projects for onward=20
referral to my principal investors who can allocate capital for=20
the financing of it.

kindly advise at your convenience

Best Regards,

Respectfully,
Al Sayyid Sultan Yarub Al Busaidi
Director

