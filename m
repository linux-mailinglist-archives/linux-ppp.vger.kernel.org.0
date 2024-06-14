Return-Path: <linux-ppp+bounces-65-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC0B90876C
	for <lists+linux-ppp@lfdr.de>; Fri, 14 Jun 2024 11:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E99D82880CA
	for <lists+linux-ppp@lfdr.de>; Fri, 14 Jun 2024 09:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6BD1386A7;
	Fri, 14 Jun 2024 09:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wit.fr header.i=@wit.fr header.b="Xvhelg7o"
X-Original-To: linux-ppp@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2109.outbound.protection.outlook.com [40.107.22.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53A52AEE9
	for <linux-ppp@vger.kernel.org>; Fri, 14 Jun 2024 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718357348; cv=fail; b=kkscekOSc2SfvALdupKHyUmsekR797J2KQCrQBVxHIbXV1Wz2fjCQTMA9q1Yl8TIm7nKjXSK2N/4Qv9cykS27nEYtiU7iJ4ldA5qNsIYv05eGkh45y2wQ9C+CLiAUnmqfLLi9ho2ick0wB41qszHaPYCbzit3O+K+l8CRRghT0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718357348; c=relaxed/simple;
	bh=n0wg5gLrIpMFz74MRODqK/3b+r9Wdd4O/1O+ZpjDgbg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hMQEh24M9syAIk9Ob7TCFHORTLXb8UD4/+dFgF9n5sBbTL/zLyeO68vQ1JMeOLvbXs7ppSCM2s+jaK7q96zinngD4hJ8WNLZLZozV69wB5xwSsfMNwAOiZIGxiUhK/IWcSP27TJ222CP3SBORnanF6hkWmB9vWDF5cTjl8PHQpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wit.fr; spf=pass smtp.mailfrom=wit.fr; dkim=pass (1024-bit key) header.d=wit.fr header.i=@wit.fr header.b=Xvhelg7o; arc=fail smtp.client-ip=40.107.22.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wit.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wit.fr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2KHhGcprAGZ+fIwLocelM6gzmAQHOu5/2h4Dc3vqWcGwRBAmFo/6bGjxJlpHszoEQvuqXtghpTWPPXu5LbB9DChVAEVLJngatsPWFUyrmvV2fwAbomYoi5Ills4vvVUjRYooYa3vQCZRoW0O8Iy0aGG6NX2T56WVm/dw6LYkKScowWaaqi+xoOl0msb6wFDy0J2+biq7Gy5IRHi2sN52nxmCRjUNlQSnv3pFK8C8Z1gxrkinwrTtftKWOXuluk7qMbBdOHOr3GX10cxoqP0lbhKm2bNgReR4lvr2sr7SPBILJxMWcK401eulqkqfbAOVaQFD6m4f0BuzwUdoB8AVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XU0PRVvAQiXYRVwytqXsAfDT47SSHvRRjQUThIRe0Gg=;
 b=i47m32NKBOlJPHKyo8n88EBPLN+/aYVh/7bglK8cebXLtDatuUlbYdkacPU+fcIzetPKkYGXslYXiix4u3DTnBuk3tVGF5oGxT0sdThOnuAoGqu+n8Mwic9t3GodhGLkdUAmxPY18JifjXg05tZ36DAbmVUJvMP76JUNtgrH7l6Zo9qLNc8HCgLwfCLjFY7FSeGnLliRz2ZEfZBvDI4YTCA0zJjYLogBxAabIwAIvfA3TjMkhVmhxiaeTttw6TVkrWvyviIlQXxI44LLti7+dZlTSpeAe0AX/3YZn/Jsum4Bqf9LyP8Rz2kdJn0/uTJzc/Suf2ZJSweGHfcWs0MI5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wit.fr; dmarc=pass action=none header.from=wit.fr; dkim=pass
 header.d=wit.fr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wit.fr; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XU0PRVvAQiXYRVwytqXsAfDT47SSHvRRjQUThIRe0Gg=;
 b=Xvhelg7oojtDcSlamXtjUq/AkLpKjeSByrWR8wji/MGPsk7PiWZqovBbxRiMsvNsFmvYGnUm392gYahD9ryizy+9XXiKijNs8w0vdI4K/p7V5GVxgXaPuSCJXJcOcAHZq6E0LFxAK/zmxHws5/N8GxebNKeXGpSmOBy6H+hWT+E=
Received: from DU0PR02MB8689.eurprd02.prod.outlook.com (2603:10a6:10:3ec::11)
 by AM9PR02MB6980.eurprd02.prod.outlook.com (2603:10a6:20b:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 09:29:02 +0000
Received: from DU0PR02MB8689.eurprd02.prod.outlook.com
 ([fe80::527f:5fa8:7426:e188]) by DU0PR02MB8689.eurprd02.prod.outlook.com
 ([fe80::527f:5fa8:7426:e188%3]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 09:29:02 +0000
From: Jean Francois TRAP <jean-francois.trap@wit.fr>
To: "linux-ppp@vger.kernel.org" <linux-ppp@vger.kernel.org>
Subject: Problem CHAP Challenge with PPP v2.5.1-dev
Thread-Topic: Problem CHAP Challenge with PPP v2.5.1-dev
Thread-Index: Adq+O0++e9FFfdujR5OkprnrD20G0A==
Date: Fri, 14 Jun 2024 09:29:02 +0000
Message-ID:
 <DU0PR02MB8689D701B0331BC192E86145B3C22@DU0PR02MB8689.eurprd02.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wit.fr;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR02MB8689:EE_|AM9PR02MB6980:EE_
x-ms-office365-filtering-correlation-id: 088e1f9e-04c5-4329-b3b5-08dc8c546db9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230035|366011|376009|1800799019|38070700013;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7ZLh1MACH+0MicLVsT0q6erGoqM4Nxy7mXr+YhHurRpdm7wJmO3VCS97zF?=
 =?iso-8859-1?Q?TBEmno614NwVCVV8azE/6M4rUdIwCVV6QNsp/UOoPQemqMdfAWbqtQHLU/?=
 =?iso-8859-1?Q?uEyvRYHibdZSIiejzv1xYCbs2L940KPYZpbawUoS1yBFaACmud2Z9fFX0H?=
 =?iso-8859-1?Q?zlQYbunLqotyWUE7RbTF1R1D3n0pb0iv71HB6m/Nr4B7Zwx8zATOYHp3Cl?=
 =?iso-8859-1?Q?/KqCPH4k4XqdLRKUILju1jsQ9kd4AJU2kpETeR+2IcE5vkxIOYVh/wjMbh?=
 =?iso-8859-1?Q?FrARma1UVqvCPmUs4fEN1JgsKtUP5qmqHHyJ9kbe/1mwJ3lSCOh7kOwYga?=
 =?iso-8859-1?Q?scb5Tr5uzsI0gxKQGpx11iqbAhfuxWg4jTKhRaHQOl7KA37dq+ju+bcSV9?=
 =?iso-8859-1?Q?GKC9kgxCM0JKKjZ/vSotj8lCSGKvNXi3mjE8Lag6b5H2Rv/c3ovjK4Nrr7?=
 =?iso-8859-1?Q?57zNQ8hLuxcqsmNvqWvaxx71wJckkb2L2mbubP3BJX2n6PXkIUVUAX6OGf?=
 =?iso-8859-1?Q?87BxaKUOxzJnIhP5yTXuw8lnwlga00R72hWQGQIZRNcKWDdUp0bAw46VsB?=
 =?iso-8859-1?Q?P+E26+b97aToHbdsGum0Iea4Yx8A1GH+e/afJxgfNo5+1XYLM+J7fvAFAF?=
 =?iso-8859-1?Q?OXKo5MAFqid9M+bQg1cxNFsqs362HR2lboD92yeNqNVgPIKbmgEb7DktPY?=
 =?iso-8859-1?Q?VO9wTu0fEq4OJNBpAzuvQWoij+awlU9VKsvBEgnUiuXLLddxv78lGqAOCJ?=
 =?iso-8859-1?Q?OJ6NOAvmXAi/mxjCajumpzFQinrO/A/OQbL7x8xFM+B014bg+v9dpEimP8?=
 =?iso-8859-1?Q?nmyRVicGjJjG2555EH7k9EVnAaBZJ9YE1L+j1hpGbNLaqU2fqDeb/h5qot?=
 =?iso-8859-1?Q?5t0e29Y1bHWyxkwrrG9eB4PtdUFXQLeenZtqZAZIFHH3uLUHK6mMdwQhFh?=
 =?iso-8859-1?Q?wjPK/38bDa1NtP5h86jH6yaSKIIqYvcQbVvV76QmPzFzkb3BoWlQW2nYTD?=
 =?iso-8859-1?Q?tlq27JBao4JRmfyw3+OhCTSmQkBuHdRI/wiJSr784GwPycnAwTlrIdCEmk?=
 =?iso-8859-1?Q?8mnN94XUFmrUaOV4lw1avDs13jZ0j8SSgoHLU94tL1y7xgXhKrdeusufYS?=
 =?iso-8859-1?Q?hcWxno0KWRB3YUV1QuPnAVgkAXuFUaomh1Gu4US6DJ4SZT/PDYVoh9edk9?=
 =?iso-8859-1?Q?CJ56iQsTn6NTwFhRM5PMDcs56poKeIvN2pGQCGv/i0pjFG1tC4GndML5z7?=
 =?iso-8859-1?Q?D7Ul4UlOxhxzP0xVqLywAvaoqYrDA8UDYSAtUjK9qURNA/RnegH4V9Y89R?=
 =?iso-8859-1?Q?SYgCmieqMlNzd8dToussLm1vRsO9b/zj4uwbJP0If3LpRP8UwmxMnyDWw+?=
 =?iso-8859-1?Q?p8h7XCtGCutH2U7pMbscApSrNXtL63YabhLcAPxO062IkzpleIVzg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8689.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(366011)(376009)(1800799019)(38070700013);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?RYE0owaMXLW1E9hC5kr8c+qBZfzWk5xDrcNvYBs4yxbqGRu9iKHFz0j1+6?=
 =?iso-8859-1?Q?UngyPaRUh4fGpUwHHaxZqWculjULw1gFh3sb2EnmGWEGqiSqzBkkbfWe2p?=
 =?iso-8859-1?Q?929g2nauLpfsIP1oWljcde41+1vFP1gXzS+yAsSNSZtTlVI6nLdab2xDPC?=
 =?iso-8859-1?Q?mMP5h9vT3u9ymS1JL92uk5G3R7zdQ+5YvnlHIzwaGxoAKTkic6affs1mm4?=
 =?iso-8859-1?Q?tGdwSTn1O8xWgToWAALEhxQkKAbPWt74ZlsufjWHf4/IBT/x8EbbDO0+63?=
 =?iso-8859-1?Q?koKtNFQtfUEkrjcep3OFw4Iircfbx4BZKjeGVmg8d8aupHUiB/P4kmQq/3?=
 =?iso-8859-1?Q?5Hw7HQ3JKJHwUn/esADMUc5sa1iBL7ago+1Ej5zBzQeC5ZE9oDaHMGxobN?=
 =?iso-8859-1?Q?RNK+Eb5VBp6LOi7Sb8jw9h/Ytem242/Y49HG1bv2KXcSLlPjXiA2nLRhx/?=
 =?iso-8859-1?Q?zonEy+VQQKJFkdQs9ZC7FtEgQFO/e+uN9F3B3jJsteAIuFjFbhl66RcQQ8?=
 =?iso-8859-1?Q?beCnS306VRRpNlbOHz2XTcnw6DOk4vaQslBCOfcxztQcRHcsUwT2JcKS1Q?=
 =?iso-8859-1?Q?B8PCTYY1n3w79pU+Cw73ZiCLsyMSN/y/aj9QvKD0+nizxTEaicQ6ZxF5j/?=
 =?iso-8859-1?Q?8lDBd2NHFLhxU/Zv8mu2oBOnCFLruXImn7qeYuGGHtSj6YYxjnwk0/hk9A?=
 =?iso-8859-1?Q?mVPJ5i1zQJpVp1eIEigbmDPpkiEKTahZskyIpJOMToYco12lAUS/IIPNZX?=
 =?iso-8859-1?Q?+lnW8Dq8rSu3Z3rL3+e4kjuSg7vvS41DYEtUeA8Zv3lKOKX5a4t9u0AUp5?=
 =?iso-8859-1?Q?lZobONf9mlGweIsrzvIbnaYk2pvFFaf3xHtVgFnkXfEs8FM6CsPOgZV5VM?=
 =?iso-8859-1?Q?9NThU0AnQ+R9H4M5m3hXmiau3+Q6WlNcBLAaCBAF0s6vw2Rb+6nSIG90FO?=
 =?iso-8859-1?Q?RZX2aKvIjbKlludd99J0gkcQkCamIqMeWzq6CLA4PQi54z2tMgOdlISMJi?=
 =?iso-8859-1?Q?h4WcgFWE7rVzkcjqy0Brv+KHc9zGVQG/eOtK4bwW70Yl+OnrBLHiuV1iHE?=
 =?iso-8859-1?Q?L5ituv6mNbwcaK/Smo3tn5YVtxbRlm6P/heLjHb719sqBwIqj55RgUiUrf?=
 =?iso-8859-1?Q?gnMCg7X1AcVUz8nqGpBnAN+Ed3zD8wGCjp2eSmf9jvV5dCqu5604ZJorU7?=
 =?iso-8859-1?Q?QSZ3hGclq6QXNDzID0p7TcGzd6uaFRVoCrutWfonalOiN1eP7e80ZvFiz3?=
 =?iso-8859-1?Q?WO3Ap7pcCfXRZYeb9QyDkbLpAVsdJkda79le/W2I1tBUuqpYmm7l88NnHL?=
 =?iso-8859-1?Q?c8xIuPJLsupkgdauXBm1uaydV1h1yPCz2WAyh6eBAfsm04vneQO6rpmjaC?=
 =?iso-8859-1?Q?PUrAj6OsIovLgCniV5R1xCF+hLP7rsqsR0MwHxUFL5fyLl85I+W0fmHTpp?=
 =?iso-8859-1?Q?6wmrtTdYutThpRGb/AdyA3PE8BnOiosMlrRc+cLa61wk7uMUtnH+DtlRz8?=
 =?iso-8859-1?Q?O+a/o4EsPrGmyYTuBUKdvtrcrOXpLOfxXehUg657iQdrRTZN+n7glod5cy?=
 =?iso-8859-1?Q?NFXXbjDwIG/NG+Hp+1jMrpV9L8FenEGSwQLDU2v3f5PIWtfcjga9iyOLoE?=
 =?iso-8859-1?Q?lsSG7VxOwvzoIdqaqxmbeK5zjb/2i76+5v?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: wit.fr
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8689.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 088e1f9e-04c5-4329-b3b5-08dc8c546db9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 09:29:02.5370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2a98e845-a00c-4dbf-a147-57d7a6b4d161
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /8kLGG1hD12UuaFQdiRzxU/cCxDdyKkwAki+Xut1KvOyeEYN5zNM3o8IR8NA4yDHvroyjwHLSuC8Fp+7CAyn8ywz2rokvsFD8bOZeZnSkyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6980

Hello,

For an embedded system using ppp v2.4.7 on a linux from scratch v4.14 base,=
 this works without a hitch.
For security reasons, we're migrating to linux from scratch v6.1 and ppp v2=
.5.1-dev.

With the same configuration, the same SIM card, I encounter the following p=
roblem:

2024-06-14T10:52:56.761615+02:00 REDY-02448-00029 REDY: Script /usr/sbin/ch=
at -f /etc/ppp/modem/chat-dialer-3G finished (pid 1791), status =3D 0x0
2024-06-14T10:52:56.761666+02:00 REDY-02448-00029 REDY: Serial connection e=
stablished.
2024-06-14T10:52:56.761693+02:00 REDY-02448-00029 REDY: using channel 6
2024-06-14T10:52:56.764893+02:00 REDY-02448-00029 REDY: Using interface ppp=
0
2024-06-14T10:52:56.767072+02:00 REDY-02448-00029 REDY: Connect: ppp0 <--> =
/dev/ttymxc0
2024-06-14T10:52:56.774101+02:00 REDY-02448-00029 REDY: Warning - secret fi=
le /etc/ppp/pap-secrets has world and/or group access
2024-06-14T10:52:56.775690+02:00 REDY-02448-00029 REDY: sent [LCP ConfReq i=
d=3D0x1 <asyncmap 0xa0000>]
2024-06-14T10:52:56.789506+02:00 REDY-02448-00029 REDY: rcvd [LCP ConfAck i=
d=3D0x1 <asyncmap 0xa0000>]
2024-06-14T10:52:57.745536+02:00 REDY-02448-00029 REDY: rcvd [LCP ConfReq i=
d=3D0x1 <asyncmap 0x0> <auth chap MD5> <magic 0x52181044> <pcomp> <accomp>]
2024-06-14T10:52:57.745583+02:00 REDY-02448-00029 REDY: sent [LCP ConfRej i=
d=3D0x1 <magic 0x52181044> <pcomp> <accomp>]
2024-06-14T10:52:57.758670+02:00 REDY-02448-00029 REDY: rcvd [LCP ConfReq i=
d=3D0x2 <asyncmap 0x0> <auth chap MD5>]
2024-06-14T10:52:57.758742+02:00 REDY-02448-00029 REDY: sent [LCP ConfAck i=
d=3D0x2 <asyncmap 0x0> <auth chap MD5>]
2024-06-14T10:52:57.771800+02:00 REDY-02448-00029 REDY: rcvd [CHAP Challeng=
e id=3D0x1 <913f58c149608e12686da08e27fb8f01>, name =3D ""]
2024-06-14T10:52:57.773667+02:00 REDY-02448-00029 REDY: Warning - secret fi=
le /etc/ppp/chap-secrets has world and/or group access
2024-06-14T10:52:57.801692+02:00 REDY-02448-00029 REDY: sent [CHAP Response=
 id=3D0x1 <84ec7e00000000000000003b00000000000000161cd73a0000000038c0a67400=
bac779000d0000c0db877e09000000e44e060038c0a67468b3030028bda67400000000acdb8=
77e4454437470da877e000d00003b0000000000000027100f00000000000000000000bac779=
84dd877ef4c60400c0db877e00000000288e2901c0db877ec4da877e0000000000000000000=
000000000000000000000000000000000000000000000000000000000000000>, name =3D =
"orange"]
2024-06-14T10:52:57.820165+02:00 REDY-02448-00029 REDY: rcvd [CHAP Failure =
id=3D0x1 "I don't like you.  Go 'way."]
2024-06-14T10:52:57.820203+02:00 REDY-02448-00029 REDY: CHAP authentication=
 failed: I don't like you.  Go 'way.
2024-06-14T10:52:57.820226+02:00 REDY-02448-00029 REDY: CHAP authentication=
 failed
2024-06-14T10:52:57.820248+02:00 REDY-02448-00029 REDY: sent [LCP TermReq i=
d=3D0x2 "Failed to authenticate ourselves to peer"]
2024-06-14T10:52:57.821973+02:00 REDY-02448-00029 REDY: rcvd [LCP TermReq i=
d=3D0x3 "Authentication failed"]

Here is the file   /etc/ppp/chap-secrets

 orange    *      orange     *

when I delete the chap-secrets file it forces PAP authentication and the co=
nnection works again.
As it is preferable to work in CHAP, I need to solve this problem.

2024-06-14T10:35:06.757817+02:00 REDY-02448-00029 REDY: Script /usr/sbin/ch=
at -f /etc/ppp/modem/chat-dialer-3G finished (pid 1447), status =3D 0x0
2024-06-14T10:35:06.757866+02:00 REDY-02448-00029 REDY: Serial connection e=
stablished.
2024-06-14T10:35:06.757892+02:00 REDY-02448-00029 REDY: using channel 4
2024-06-14T10:35:06.760979+02:00 REDY-02448-00029 REDY: Using interface ppp=
0
2024-06-14T10:35:06.762779+02:00 REDY-02448-00029 REDY: Connect: ppp0 <--> =
/dev/ttymxc0
2024-06-14T10:35:06.769482+02:00 REDY-02448-00029 REDY: Warning - secret fi=
le /etc/ppp/pap-secrets has world and/or group access
2024-06-14T10:35:06.771248+02:00 REDY-02448-00029 REDY: sent [LCP ConfReq i=
d=3D0x1 <asyncmap 0xa0000>]
2024-06-14T10:35:06.784789+02:00 REDY-02448-00029 REDY: rcvd [LCP ConfAck i=
d=3D0x1 <asyncmap 0xa0000>]
2024-06-14T10:35:07.740286+02:00 REDY-02448-00029 REDY: rcvd [LCP ConfReq i=
d=3D0x1 <asyncmap 0x0> <auth chap MD5> <magic 0x52181044> <pcomp> <accomp>]
2024-06-14T10:35:07.740371+02:00 REDY-02448-00029 REDY: sent [LCP ConfRej i=
d=3D0x1 <magic 0x52181044> <pcomp> <accomp>]
2024-06-14T10:35:07.753004+02:00 REDY-02448-00029 REDY: rcvd [LCP ConfReq i=
d=3D0x2 <asyncmap 0x0> <auth chap MD5>]
2024-06-14T10:35:07.753050+02:00 REDY-02448-00029 REDY: sent [LCP ConfNak i=
d=3D0x2 <auth pap>]
2024-06-14T10:35:07.767028+02:00 REDY-02448-00029 REDY: rcvd [LCP ConfReq i=
d=3D0x3 <asyncmap 0x0> <auth pap>]
2024-06-14T10:35:07.767077+02:00 REDY-02448-00029 REDY: sent [LCP ConfAck i=
d=3D0x3 <asyncmap 0x0> <auth pap>]
2024-06-14T10:35:07.768474+02:00 REDY-02448-00029 REDY: Warning - secret fi=
le /etc/ppp/pap-secrets has world and/or group access
2024-06-14T10:35:07.768637+02:00 REDY-02448-00029 REDY: sent [PAP AuthReq i=
d=3D0x1 user=3D"orange" password=3D<hidden>]
2024-06-14T10:35:07.779335+02:00 REDY-02448-00029 REDY: rcvd [PAP AuthAck i=
d=3D0x1 ""]
2024-06-14T10:35:07.779382+02:00 REDY-02448-00029 REDY: PAP authentication =
succeeded
2024-06-14T10:35:07.781973+02:00 REDY-02448-00029 REDY: sent [CCP ConfReq i=
d=3D0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
2024-06-14T10:35:07.783382+02:00 REDY-02448-00029 REDY: sent [IPCP ConfReq =
id=3D0x1 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns2 0.0.=
0.0>]
2024-06-14T10:35:07.796410+02:00 REDY-02448-00029 REDY: rcvd [LCP ProtRej i=
d=3D0x4 80 fd 80 fd 01 01 00 0f 1a 04 78 00 18 04 78]
2024-06-14T10:35:07.796445+02:00 REDY-02448-00029 REDY: Protocol-Reject for=
 'Compression Control Protocol' (0x80fd) received
2024-06-14T10:35:10.784751+02:00 REDY-02448-00029 REDY: sent [IPCP ConfReq =
id=3D0x1 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns2 0.0.=
0.0>]
2024-06-14T10:35:13.786887+02:00 REDY-02448-00029 REDY: sent [IPCP ConfReq =
id=3D0x1 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns2 0.0.=
0.0>]
2024-06-14T10:35:13.799647+02:00 REDY-02448-00029 REDY: rcvd [IPCP ConfReq =
id=3D0x1]
2024-06-14T10:35:13.799692+02:00 REDY-02448-00029 REDY: sent [IPCP ConfNak =
id=3D0x1 <addr 0.0.0.0>]
2024-06-14T10:35:13.801671+02:00 REDY-02448-00029 REDY: rcvd [IPCP ConfRej =
id=3D0x1 <compress VJ 0f 01>]
2024-06-14T10:35:13.801705+02:00 REDY-02448-00029 REDY: sent [IPCP ConfReq =
id=3D0x2 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns2 0.0.0.0>]
2024-06-14T10:35:13.812676+02:00 REDY-02448-00029 REDY: rcvd [IPCP ConfReq =
id=3D0x2 <addr 192.200.1.21>]
2024-06-14T10:35:13.812713+02:00 REDY-02448-00029 REDY: sent [IPCP ConfAck =
id=3D0x2 <addr 192.200.1.21>]
2024-06-14T10:35:13.812737+02:00 REDY-02448-00029 REDY: rcvd [IPCP ConfNak =
id=3D0x2 <addr 90.117.164.221> <ms-dns1 192.168.10.110> <ms-dns2 194.51.3.5=
6>]
2024-06-14T10:35:13.812763+02:00 REDY-02448-00029 REDY: sent [IPCP ConfReq =
id=3D0x3 <addr 90.117.164.221> <ms-dns1 192.168.10.110> <ms-dns2 194.51.3.5=
6>]
2024-06-14T10:35:13.826431+02:00 REDY-02448-00029 REDY: rcvd [IPCP ConfAck =
id=3D0x3 <addr 90.117.164.221> <ms-dns1 192.168.10.110> <ms-dns2 194.51.3.5=
6>]
2024-06-14T10:35:13.829159+02:00 REDY-02448-00029 REDY: local  IP address 9=
0.xxx.xxx.xxx
2024-06-14T10:35:13.830292+02:00 REDY-02448-00029 REDY: remote IP address 1=
92.xxx.xxx.xxx
2024-06-14T10:35:13.831297+02:00 REDY-02448-00029 REDY: primary   DNS addre=
ss 192.xxx.xxx.xxx
2024-06-14T10:35:13.832379+02:00 REDY-02448-00029 REDY: secondary DNS addre=
ss 194.xxx.xxx.xxx
2024-06-14T10:35:13.839411+02:00 REDY-02448-00029 REDY: Script /etc/ppp/ip-=
up started (pid 1459)
2024-06-14T10:35:14.135757+02:00 REDY-02448-00029 REDY: Script /etc/ppp/ip-=
up finished (pid 1459), status =3D 0x0

the file   /etc/ppp/pap-secrets   is the same as   /etc/ppp/chap-secrets

The pppd v2.5.0 has the same problem with different folder locations.

thank you for your help

Jean-Fran=E7ois TRAP
WIT company

