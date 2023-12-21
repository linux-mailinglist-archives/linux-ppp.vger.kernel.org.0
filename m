Return-Path: <linux-ppp+bounces-2-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C97D81ACB8
	for <lists+linux-ppp@lfdr.de>; Thu, 21 Dec 2023 03:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C72971F2421E
	for <lists+linux-ppp@lfdr.de>; Thu, 21 Dec 2023 02:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FA61843;
	Thu, 21 Dec 2023 02:45:55 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63A24696;
	Thu, 21 Dec 2023 02:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1fa981e0a9ac4fb8b6eeedb8fe97a0db-20231221
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:0714505d-1e12-4565-826b-5a7d1ba633c9,IP:25,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:45
X-CID-INFO: VERSION:1.1.33,REQID:0714505d-1e12-4565-826b-5a7d1ba633c9,IP:25,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-META: VersionHash:364b77b,CLOUDID:79b50082-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:231221104536RFASABPQ,BulkQuantity:0,Recheck:0,SF:72|19|44|66|24|102,
	TC:nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 1fa981e0a9ac4fb8b6eeedb8fe97a0db-20231221
Received: from node4.com.cn [(39.156.73.12)] by mailgw
	(envelope-from <liyouhong@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 417191506; Thu, 21 Dec 2023 10:45:33 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 9059416001CD7;
	Thu, 21 Dec 2023 10:45:33 +0800 (CST)
X-ns-mid: postfix-6583A6CD-18814229
Received: from localhost.localdomain (unknown [172.20.185.164])
	by node4.com.cn (NSMail) with ESMTPA id 5E8A016001CD7;
	Thu, 21 Dec 2023 02:45:31 +0000 (UTC)
From: YouHong Li <liyouhong@kylinos.cn>
To: paulus@samba.org
Cc: linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	liyouhong <liyouhong@kylinos.cn>,
	k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH] drivers/net/ppp/ppp_async.c: Fix spelling typo in comment
Date: Thu, 21 Dec 2023 10:44:48 +0800
Message-Id: <20231221024448.1317341-1-liyouhong@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: liyouhong <liyouhong@kylinos.cn>

Fix spelling typo in comment

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: liyouhong <liyouhong@kylinos.cn>

diff --git a/drivers/net/ppp/ppp_async.c b/drivers/net/ppp/ppp_async.c
index fbaaa8c102a1..840da924708b 100644
--- a/drivers/net/ppp/ppp_async.c
+++ b/drivers/net/ppp/ppp_async.c
@@ -533,7 +533,7 @@ ppp_async_encode(struct asyncppp *ap)
 	proto =3D get_unaligned_be16(data);
=20
 	/*
-	 * LCP packets with code values between 1 (configure-reqest)
+	 * LCP packets with code values between 1 (configure-request)
 	 * and 7 (code-reject) must be sent as though no options
 	 * had been negotiated.
 	 */
--=20
2.34.1


