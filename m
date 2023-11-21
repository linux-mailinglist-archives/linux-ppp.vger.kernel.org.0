Return-Path: <linux-ppp+bounces-1-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A803B7F241F
	for <lists+linux-ppp@lfdr.de>; Tue, 21 Nov 2023 03:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 635CD281E50
	for <lists+linux-ppp@lfdr.de>; Tue, 21 Nov 2023 02:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B25C111BF
	for <lists+linux-ppp@lfdr.de>; Tue, 21 Nov 2023 02:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LD8vNAwf"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B734217CA
	for <linux-ppp@vger.kernel.org>; Tue, 21 Nov 2023 00:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1456BC433C8;
	Tue, 21 Nov 2023 00:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700528245;
	bh=WydedWHI5hgSzmjYaAgFcEvQrWisnvd0Tah1sl3VwoE=;
	h=Date:From:To:Subject:From;
	b=LD8vNAwfhT29vyVRiSwbCOQgwQivReJdwmBvSgC8BGvkL7WjyYq0RJ+0+LtJNdj+8
	 2v8+3T/V6FnP2VZmscqp+9oVMA8uKrJ6a6PPuvtKRiXNzcOHVPKZ6GZv/lEuKAE3/p
	 36D8g6U93o5Y5KGoKLxp2uCEgiVc2bbM4PFwPHGY=
Date: Mon, 20 Nov 2023 19:57:24 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-ppp@vger.kernel.org
Subject: PSA: this list has moved to new vger infra (no action required)
Message-ID: <20231120-small-marvellous-stingray-251ef0@nitro>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list has been migrated to new vger infrastructure. No action is required
on your part and there should be no change in how you interact with this list.

This message acts as a verification test that the archives are properly
updating.

If something isn't working or looking right, please reach out to
helpdesk@kernel.org.

Best regards,
-K

