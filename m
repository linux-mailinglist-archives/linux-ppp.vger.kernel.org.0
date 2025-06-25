Return-Path: <linux-ppp+bounces-302-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE092AE7551
	for <lists+linux-ppp@lfdr.de>; Wed, 25 Jun 2025 05:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09E007AB91E
	for <lists+linux-ppp@lfdr.de>; Wed, 25 Jun 2025 03:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD02C1DDC0F;
	Wed, 25 Jun 2025 03:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jl6rkeFg"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7110B30748F;
	Wed, 25 Jun 2025 03:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750822828; cv=none; b=KsFoAAw2HGjsZwOglUrxl2uluseAeA/fF4iQyWK98OgWDDkzF2ljomlDoMxSi2GRlkbVhdzRxYNgocR2GUO87BvfZwcrGlWj4aa4RWAC2SJKLW3L9ihBOGpQGjlQMNvZ/Ti3jdSFYV8hqAX7wRb8MKuuHFlo//LuUn8NaehXMwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750822828; c=relaxed/simple;
	bh=D2uft687uOcMoYMjIVfLxJqincxWHhSlGaw6ERfFB0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lCEYqMMFtnxkYUFf47nxNOy2IaYo+jRG2JGhZTiTwLJNQTpsaNklyrC+/qtN+VRvSeA4L5Pg+YAS0t0U8y4kKcdwAIw4tLyUadbMLi9zKVUCxhMD84LemnOrvwC3NFI2q4KLwBeHBKs/DQyZE1574xF0VH4lYdRK1RklBgqcINM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jl6rkeFg; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-747fba9f962so364197b3a.0;
        Tue, 24 Jun 2025 20:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750822827; x=1751427627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qJ1ps6XctK/RtarAkB2GVQp1bsirF1gnPxiK6n5xUmA=;
        b=Jl6rkeFgUPrLvsrvPh0MY6CckP97EgtsK7nNz9RXzU0dIEYosxtfkQ2lMOleUfQwAL
         TVgS6wLsYiZCAcB1d3DLRcq4WbwkNAqhOlFAljCEQAjZqz0lTMuobtTUDnpMuVr6C9so
         v4orpyfloRCgteXu4u3XGLOrkz6MgMDfvVZ0PEy5HuYeZpmkrsT0QLVLAonlCwU54+nN
         tBTOOVRlTOwFI7c1V3QQr8MFpAjUDY6zSql6DuTJ8WzknlOAOznr5xRtvc9g6vE6xpYL
         eHsJh+JAbBlGyP/7P/8L1UpNDEfbF4tMVU94IGrJCK4oyuFcFDV7kxnywdt39aNULOSW
         NL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750822827; x=1751427627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJ1ps6XctK/RtarAkB2GVQp1bsirF1gnPxiK6n5xUmA=;
        b=YOQWjXe1l7lyIaFgdQ7d/vhEbwtQy6WOrrzIk3JVt9j885nGIveKAujR9LUpn6heNE
         vGC+EQyzkD40C4HjznkcgHRFWcApmhIx42BuoPFfIZXLgRPu96uIbxxKqMK8uIuEpe7y
         iSMd3bozAHi588mzQR4LOAI0H1IizYzXjGgV9sYf/LJ6qx++E4KaxZ6oV6gAQ8Si/FZA
         N1XNxieD9xHooNo7pVJ6SH1Nvnar1fL9G3bTJ1zjGhVgIZHzclPAkghM3ef/7Y2mgWgf
         I/vpe1cJcljScGTRJy/FzItmgA6H2IiNH5VJB0xQAie34hBe56zP5Z7m+bs6ZW28Mnvt
         SJ6g==
X-Forwarded-Encrypted: i=1; AJvYcCWarJDLzQMv7qvNKhmz92LtiS+QaRkXfZuGoN3FJBh3ZrNQx32rZ+mFnvmR6h9lPlqs8MZz2dGg@vger.kernel.org, AJvYcCX4XDM6Nz3IYGDIDCJJdeRMhVaO/j2dqadPjF91EUhwwWawGdgJYpBxT+giVVcJZSIrOgkqTRNXYHr8@vger.kernel.org, AJvYcCXv4hE5j8Q5ImAkz1DlOtImCVAMLpD+zbsWj+4QJF8YrtI87xjj0W2XjOUr9YWE53Ef3BcMqqKWiaVq3FM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVjemM3/vPo9+mARcYWBKOUfovBmZUd3CDXIAbwm0J683EXHm6
	b4lgoquX2kysPdV17ohfGtv6oJjhi+HGE0iS1PpVK/AR38QmSwHcWvXW
X-Gm-Gg: ASbGncufZ/J/dv+klj89bSiGZoy/zGi6hSvAmcFWBPREJgjPlBRXaqdJM2hwyhVv0MW
	ZnozHMdSD3dPpDy3yG6nVCTmc7tatqhtIwIdyoiiDs8lWlj+X+kFlACzyFAGBVcV85SG8MV0F3b
	VITVWCXftLQMR4POH6EGwp4fDiaMSN8W0an5Hev9ClEFmZQcyhGUsOH9XEtzEqyaLTxBcKFU4Ye
	Iowkh0J/3X5mdWVPIAY9iIRwlwWKZV6wp1+4oigSfMUYJI5TgonYUwqiGFbVxEpL5QBNcBagNAC
	TAN8cVcfT/iM3aCbHAelEM+lKVL/4+wmGz5GfxCyzACO4iGxtrAOGvak
X-Google-Smtp-Source: AGHT+IHgtxNjVYinI4CT0Wv5clSw/Tk248UXXrpoykXSZhDDKkHfiXbNw7NVM0/Owj0q4jVo86DVdg==
X-Received: by 2002:a05:6a20:7344:b0:220:3a2:e0c6 with SMTP id adf61e73a8af0-2206a025bdbmr11731111637.6.1750822826601;
        Tue, 24 Jun 2025 20:40:26 -0700 (PDT)
Received: from gmail.com ([116.237.168.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1241f4asm9640143a12.44.2025.06.24.20.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 20:40:25 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guillaume Nault <gnault@redhat.com>
Subject: [PATCH net-next 0/3] ppp: improve receive path performance
Date: Wed, 25 Jun 2025 11:40:17 +0800
Message-ID: <20250625034021.3650359-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series improves the performance of the PPPoE receive paths.

Patch 1 converts the ppp->rlock from a spinlock to a read-write lock,
allowing concurrent receive-side processing when no state is being
modified.

Patch 2 optimizes PPPoE receive performance by bypassing sk_receive_skb()
when the socket is in the PPPOX_BOUND state, avoiding unnecessary socket
locking and overhead.

Patch 3 synchronizes all updates to net_device->stats using
DEV_STATS_INC() to prevent data races now that the receive path may run on
multiple CPUs.

Qingfang Deng (3):
  ppp: convert rlock to rwlock to improve RX concurrency
  pppoe: call ppp_input directly when PPPOX_BOUND
  ppp: synchronize netstats updates

 drivers/net/ppp/ppp_generic.c | 32 +++++++++++++++++---------------
 drivers/net/ppp/pppoe.c       | 10 +++++++++-
 2 files changed, 26 insertions(+), 16 deletions(-)

-- 
2.43.0


