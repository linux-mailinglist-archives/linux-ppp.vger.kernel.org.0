Return-Path: <linux-ppp+bounces-120-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9429CFFA8
	for <lists+linux-ppp@lfdr.de>; Sat, 16 Nov 2024 16:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 919DA284364
	for <lists+linux-ppp@lfdr.de>; Sat, 16 Nov 2024 15:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDC7188014;
	Sat, 16 Nov 2024 15:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crvDdF+E"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7347180A80
	for <linux-ppp@vger.kernel.org>; Sat, 16 Nov 2024 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771650; cv=none; b=IZ7NSAsu6H6f+MXRB7DEG7AiWrDBlwKZIhjY8G6qXmWOYpsbmsYe7A6WouLQnedVBOrPmTsI3wpHSbZkT2oIZ2tN6UWwLzFmC2uMo5O098fvQKmaGDAjlAYH/dr7+8stsIW02GKO25PmvgB1n8y3ed2w7efKF8IhWLnoKBzDDSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771650; c=relaxed/simple;
	bh=Wd+7kLQISUZlzyPvYmSUTVOb8NV4Vyd3OpsFXw6X7a0=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=ZnSmxu5cuhJjdbAYIWYoq60PHIfBpG3gW0kLibmM7NVr4uJixbRH7WisCjT1It8OKswiKOKXi6pfGBPzD/pL6unQ5q8bZRJ5RjpeIpjkVnibqS8OptzuM56OeW9Avm7/Lj7nO7foWb7WUb2RYkXYzYbL6zjuwqW60OvygGW2Kes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crvDdF+E; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cbca51687so4735635ad.1
        for <linux-ppp@vger.kernel.org>; Sat, 16 Nov 2024 07:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731771647; x=1732376447; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=crvDdF+EkZ7aXiFZeosc+WVZBs6zmMsPVvnYqO6xDZqjXfFBYWCUC/pt5ElJj21PYo
         oMQzvANFi4k3/cArVRkgBV823i3CuZEy/Aq2MRUCVuIcrnbc7fVchshNXmJR7TduLSLj
         Z7mndUhB2JonBgnoKE4YYzXpvuQOJ7s+fquL3bNLlBo8xoqGco/f/Nc7tSPBMkAOBOuh
         Ztdf8eLcxgHtrorDji49ZoYtEZyaaOfoCQHnD06Io8au96Ybd3SS3uRqD98rvghtpj10
         5MaAEn6j6YtN58L8QoeycUydMvO8NhQwianNFyQCMuvqK4Mm6P5mTE5vZjqSKf6Fn/ix
         Ud4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731771647; x=1732376447;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=qpZPtYve682sM9eoj1i5RldTjPT9yZRtpaKrjQZYxDKtGwEXrS9/Z1I6ZDF46UMSFJ
         EugHonkXsXsS3zRYVJkTThsryu4DHIHPoCTPKIEgiiZk8g7RkodCVF8pogPND0AWiTb4
         YDdhs2H/5ZRUOE6MQf/tacFZ/ZL4GHRf/MWD3XZUcBKZ4lfG4eS+zHsvSnJhQM/aPLBK
         qIh56OUhnhzD2i2YK19rmbp0z6R3zqbQqE3GLaS52RLCV+tdrq1mA8FHT8xui6ojUUMI
         kWQtSWHVWqyVcKufvXB2eQ537Wx5BzvkrLHiC6qLzurFu+NtrN1eJtYdF/aI5dYJdVWO
         628w==
X-Gm-Message-State: AOJu0YwwteivCLgvwWbsPx0jmYxQsOXzLS7i0z1xQnzZDE4OLPl0lapK
	S470lcUGpq/ZlJ2GOSBFH+mmVQxHyG3UP7EsQmo0WYyqybHVmpw6SXAiqA==
X-Google-Smtp-Source: AGHT+IElfdWjNXCKXyqGsmrOGwzkDAM8VdhPRQe1Ad/8tq8NG0Y6D3fQnTZph0n3ccSTk5tmsnwd9w==
X-Received: by 2002:a17:902:d486:b0:20c:aae9:7bd7 with SMTP id d9443c01a7336-21200a55267mr15059605ad.39.1731771647342;
        Sat, 16 Nov 2024 07:40:47 -0800 (PST)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724770ee7fesm3184538b3a.39.2024.11.16.07.40.46
        for <linux-ppp@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Nov 2024 07:40:46 -0800 (PST)
From: "Van. HR" <hussainsheikh59235@gmail.com>
X-Google-Original-From: "Van. HR" <infodesk@information.com>
Message-ID: <9d47eedb4397c10c284425a1e0f11ebba5c33c1bd4ccca12f274ec7d2fd4d589@mx.google.com>
Reply-To: dirofdptvancollin@gmail.com
To: linux-ppp@vger.kernel.org
Subject: Nov:16:24
Date: Sat, 16 Nov 2024 10:40:44 -0500
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,
I am a private investment consultant representing the interest of a multinational  conglomerate that wishes to place funds into a trust management portfolio.

Please indicate your interest for additional information.

Regards,

Van Collin.


