Return-Path: <linux-ppp+bounces-74-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC2A9515AC
	for <lists+linux-ppp@lfdr.de>; Wed, 14 Aug 2024 09:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1FEA1C20C4F
	for <lists+linux-ppp@lfdr.de>; Wed, 14 Aug 2024 07:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D892E4D8BC;
	Wed, 14 Aug 2024 07:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konecranes.com header.i=@konecranes.com header.b="Ix+LSVt2"
X-Original-To: linux-ppp@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2048.outbound.protection.outlook.com [40.107.22.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72FA29CFB
	for <linux-ppp@vger.kernel.org>; Wed, 14 Aug 2024 07:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723621209; cv=fail; b=YLbeRAtnRH+yWngbjUB/WNFie3V2C6s8zmzdl8npaC4J/BMcZzy4Rwnmi6frYXElyZuuauUxNs79qiJBGyaDLBnRKuIBBECC/sowYtuNSsgrpazTjZhUpfUJfiUZmOGQpzDNaj0YefiwlMRpUUbLVkWqK93/N8EbsD3O04dvROA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723621209; c=relaxed/simple;
	bh=BXLobpugfeDQmuTBHo+UGeDxMuIvDkREyrK3U36O520=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=b+5mfETaNNDGtXl631T0mBhf1gD58Z/G0j582vlGghuUAovHsl1ua2g3HbVRq2/0b9j3fBWPnJvHfI8UUD1/XMBP/XaW+3yQOmkT+5F1DcOjdtZYuM2CsbQWqwyjHmi/tLHFAWAKsEZoAgURA8Fiq0x36Fl4QCx7lofrA7mSo20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=konecranes.com; spf=pass smtp.mailfrom=konecranes.com; dkim=pass (2048-bit key) header.d=konecranes.com header.i=@konecranes.com header.b=Ix+LSVt2; arc=fail smtp.client-ip=40.107.22.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=konecranes.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konecranes.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptibOsXhu2xnCJpwR7VvOZ8d064D2nyCE+euQjNaHfrXKD22+VjmJuvkqvUZUUKaEch9bsBCC0JwUUd6U0ZF2zz85gVlfZvSRQlnyY9edwvGE9vlkU7LyKbgG2ccXXTAsisH5BSG12E2Rt0DTu4SlPuiVB4XpSShRQJfUstpqXh8R6BWXVbLcknu6e/1ebF+2iIjHTKJ8xmCshj/kfpUsQNSZsfM24m0g3j3LwWabuu9m6ngvaMY3pt0NWi/SGmeW1MOhBahRMun0xszQkrx+dmPtsuSdZpH11VqVtaMmRJu2g4g1xR/kqs1hvjSgT0wkB72IVkfkMk9EDWmS326aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXLobpugfeDQmuTBHo+UGeDxMuIvDkREyrK3U36O520=;
 b=PDFyEtlofqhKViJe1R8Agl8tslhJ2vHj0vjsb/xL1ORWfbwaZVlM/EdEyzjW2jTtBas/dNFRTL9VXcw8cYd6eZjLO19P7B5XVOWH8r2cQfcKhv6GPj/UoZPXaVJDagYgOe0Ry8KE9LzOte7a/GNw136WXmLD91pt1T5h5GwIdexvC5VYuUSrQZTAZNioHLWDPrIM51/1zLC+koiDfvkB2PBECCQSKutgTctmiKzMRuh9VFxgI6U4gGV1Bxju/k5eKz/9FKDv23mpNnWWO7GlH12abxQxNBcje3LheHYWjNU8Ulk0BtTp3KVizU4dKx4RReEwl+4LEXliPzWuIhHX9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=konecranes.com; dmarc=pass action=none
 header.from=konecranes.com; dkim=pass header.d=konecranes.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konecranes.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXLobpugfeDQmuTBHo+UGeDxMuIvDkREyrK3U36O520=;
 b=Ix+LSVt2AgGLK8D8MCn2B8m4yIhaXpBgf5pT5M+rkL2R7ZFmIMFa9OUVaAmXTTgrfKzwok59Zt4+qUUT/8d18hLnJk/L7Eu8GZ1ALhmfZYKKYhfDC/+o1MIlJigi5Uf+Z9XH256lSehvnFXzkRAuLJ3cWC14dkOyIYXSj463bRHKe4HDVZapnk3k38Ed8vHdPS95ii9kpMMZrhwEcHWzlDG73SKNLN+VlbHFHR7h2xOKprywZF+5HXjZoU3bSGYaVvY8c7VDKNilZv048sE1rPj0XZk+8139BIkkFstdvLGa+kUDzDVskjYgnmg49Id3XyD/2j/ZyWwFZljHmciAEA==
Received: from AS8PR04MB9511.eurprd04.prod.outlook.com (2603:10a6:20b:44b::18)
 by PA4PR04MB9365.eurprd04.prod.outlook.com (2603:10a6:102:2a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Wed, 14 Aug
 2024 07:40:03 +0000
Received: from AS8PR04MB9511.eurprd04.prod.outlook.com
 ([fe80::9744:ae71:33b7:f2a7]) by AS8PR04MB9511.eurprd04.prod.outlook.com
 ([fe80::9744:ae71:33b7:f2a7%4]) with mapi id 15.20.7849.014; Wed, 14 Aug 2024
 07:40:03 +0000
From: Scott Threet <scott.threet@konecranes.com>
To: "linux-ppp@vger.kernel.org" <linux-ppp@vger.kernel.org>
Subject: Modem hangup immediately after sending IPCP ConfReq after CHAP
 authentication succeeded, only occurs sometimes
Thread-Topic: Modem hangup immediately after sending IPCP ConfReq after CHAP
 authentication succeeded, only occurs sometimes
Thread-Index: AdruHStfe5GGYQ0gS8mfIWbzrFPJow==
Date: Wed, 14 Aug 2024 07:40:03 +0000
Message-ID:
 <AS8PR04MB9511B33E8E3655C5176E4F67F9872@AS8PR04MB9511.eurprd04.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=konecranes.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9511:EE_|PA4PR04MB9365:EE_
x-ms-office365-filtering-correlation-id: d346d8e4-67db-4802-4979-08dcbc344f57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?z9TL2YDN8qzNSO+gYa3Fz3LvTF/8/Jsn2k2Sv6I3l5JeXai51Krf0tixZe?=
 =?iso-8859-1?Q?vaY2hxkBrvFfb8/jG1TqMLfx6VH90WVtM6FAHMXiVbszJ/RCAkZoB8rzZK?=
 =?iso-8859-1?Q?nmGuyujChx254andH1qmS7jYJ+yaB+nngY1wlbPeaYK235PqP8/UDO40YI?=
 =?iso-8859-1?Q?pl/jBejd16cwNDai7LzHyCQz7ZuumnikQJK289yX9zd/HmkJfVm+C6OROA?=
 =?iso-8859-1?Q?YAXU9tXZaOj/6TBWYGhN+9GSYApM5yGpxgsmZSu+cw6QKyOr5uUcbpSGg3?=
 =?iso-8859-1?Q?9keCzYlqg7bNLv9iLOKWO89Pzlw2d5om3pu4dzcv9P/1ZHYbMNdvcOFo8/?=
 =?iso-8859-1?Q?44jx8wVEa3DQC9nIfk/P/33mLb/umWy35QtFsxGkLlbqwtN1hCEEoJAUjK?=
 =?iso-8859-1?Q?wvZTvccufk/LIttlx6gjlDNB3sGbTXtKE7DzKHOa/lyCLXvJEHqHmCy3j2?=
 =?iso-8859-1?Q?ljixYl2Nr055f4dX+aBRSTHDeHzeFMbhVq5C7qLR6gHtBhpdhanxOdmAN+?=
 =?iso-8859-1?Q?lt7wGbPUUg8GIWRXuHB1bQCJb5kFtiH0p1ais/mpGRYiyrf5GTyPwKEK3X?=
 =?iso-8859-1?Q?D8imnR8JMBSrYzjVdg+g0a/yd+yxIkn4o7jRekuPmT+YmJPnMd9Nuo0LuW?=
 =?iso-8859-1?Q?2t4H4UVKall80kksUEbswSrETOnTI/khbTbEzVrwq+6lZkXxLvzdFFBLph?=
 =?iso-8859-1?Q?ouMajY5/Y8qi/jvjAc3ezVRiSDnAcByxb0ZdwVyRyGt/h4LvxPC6NKkimz?=
 =?iso-8859-1?Q?/OgSzvpUsU15nJz1CKWnMwheFxzym2HijrWIDAHzx5Xd07CYeV9byiSeVP?=
 =?iso-8859-1?Q?M88vgXr3SycEteRMbY85jXSMZ3jEU2S1nfMQI3RqELAfRe4vpjNh5RMGPD?=
 =?iso-8859-1?Q?BYlwSiL4zgtvkumXENK+vKk78ksYn4AWXPg9FepWj05T3ixwzaCmCSr6Aj?=
 =?iso-8859-1?Q?GIPWXnpZ7OgESA9dSJa94KnwN++62DnatoAxztmqlx9oJB6P0AOok/eipa?=
 =?iso-8859-1?Q?aDkZ4T807bhJbLHm+liLxg93fyuCPq3mvG2P9y37n6Af+MKxfhX0Pkp57X?=
 =?iso-8859-1?Q?pXYelF47dN3T4NntyBOOGbdOXpC2xhb7FVnrseIzviYtST+kFQpqje2AsL?=
 =?iso-8859-1?Q?prZzActUJ/yVgSAfCBDFQwo2/aGkFOubIvj714mnMdVO2ggFrZJjPFruvJ?=
 =?iso-8859-1?Q?8Z51d99UsFnid9SU23J84JWJPZNj2Ylow82hvRk+Ofs6iVyTYwuKisOEFm?=
 =?iso-8859-1?Q?KQHtgJ6Tzkns1UUTiK0e/TKlRllQYaue0WK1DsQPHkH4rv64VmYXEbJ1+n?=
 =?iso-8859-1?Q?uiepJZvUD4gOgacCxXXGt/vtQZO7cfqgqACP4BHuZWslGzoxu1128z2VDv?=
 =?iso-8859-1?Q?seT0XtR6pd4NQQrcO/TcEsr2v48rJyYameHfqhNmh5IrhMTot8QO/qPb9d?=
 =?iso-8859-1?Q?ytig6h0BvjLzq964lIBYXZ8KksuotKWUv6DLyA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9511.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tTMWAukD/sjnFBgPOoDc5YxM45gaM5Qr3T9Y8Srvhno9LDcBlICBp3VaI0?=
 =?iso-8859-1?Q?nhahARPGtgsJDirp0/jTUQ4WG8VmWovIqvC3GjIAsqwvAJi4FV11489/GW?=
 =?iso-8859-1?Q?PP2lE+LPqcqY1IEaaF4Eo4u7fBWPdDNKRHfKD3XxD+EZPGyWWJcLHMK15r?=
 =?iso-8859-1?Q?80EJVkOqrRpzHBh+oDKWANVFkuEHBWEbdaPEby7qWO0sUSfyK7is5ipGci?=
 =?iso-8859-1?Q?iaZVzh8prngVUM8dmlO6nn33GxxlRrdckr+9118Atd+WL1PHpwze6j5O9F?=
 =?iso-8859-1?Q?AJKUqZCJpT1Okwb3yMFL+yr0+MF/+teGu85/3wdYiPyr9CUtwijz9OCSh+?=
 =?iso-8859-1?Q?X+NSHLqcLMIMYfPYco5DIAnPFdsXNJvXBH59HP01gcKcle6HjjRo1RX6rn?=
 =?iso-8859-1?Q?A3vXIvPnkIC8jdRt/upry851dYCcNUJy7GAh0EtvRMSrZVQkEDkcMUebBi?=
 =?iso-8859-1?Q?/ykh/K1hyrUV2tNwhSWq3AkOBM4sl6grjT7AVDh755gcGHUCn1G3GooJNZ?=
 =?iso-8859-1?Q?f0BHBKp1RXaj3gBPN/G7btrdvpmo4iWJjoXZd50yIQggner1dFmnzQidyL?=
 =?iso-8859-1?Q?L5zOp6cexEKNRCdZRpzEWrkMBuxjwnA/aRcY0v2JTgJ1avF7xqPqsBq4j1?=
 =?iso-8859-1?Q?h+i8xbWSSO8GtWeN2B2jK7Lt+tRrjn48h/TfAhu6Ps4GlEgWoiDvRnfvyF?=
 =?iso-8859-1?Q?2HyWY9RmVQym+NGwDBs6DvsDiJrqG1qK7WZj+09yB2ecdNH9T9M9H3NZMO?=
 =?iso-8859-1?Q?khjoqZF53WTP7RZDexiSdqm/a3cLDBvSjR60AcdzT5aCol/Q/oT28kKQ3V?=
 =?iso-8859-1?Q?8Nd3Id6pS9aAnnqIxIRnH1XWivFKcLSG9RnQt6hyaHfBBCJyBxV02DSgpf?=
 =?iso-8859-1?Q?uo7uEMjwaTHjPlBYQoQWJclpEPp+IBUmDFoiAsC3Qx6CAkxPhoqxw72TCx?=
 =?iso-8859-1?Q?ql+s0bXsi9D3x3O2qlxrxq5aJByONtyq4KJIwIKSQFCSqcpjZQz66jwlEG?=
 =?iso-8859-1?Q?2580HRrveV0fWy+0blfvX129fI3Sr+gyG07TyeGpFzlZFH+LFrr7wUlJxe?=
 =?iso-8859-1?Q?O+0iacqwyJZOQflPJbFyHta56CH0NXwdRDztZ2owCwryXk+JsNlXW+/Pu4?=
 =?iso-8859-1?Q?+MqdIU6RovlOWOWao2r1SLpgG56joYWDul3ZF9gZHrjIB22UEkW7U0My8G?=
 =?iso-8859-1?Q?ZspZk2t+tujZiZTj2APiTtfLmjgzN8qwhh5HV2bG/ICMMJ0BxyegEsJBhS?=
 =?iso-8859-1?Q?ol7CQjT+x6APKAk8aKcuQg8In8JaB+qcJyErMXItqDj6Wz3NHfCuIlOit9?=
 =?iso-8859-1?Q?PddlNUm4jDx0aItCVcHfMF+MycScQ84qSBp9LamBb5cC986LD8ufQZqhsM?=
 =?iso-8859-1?Q?5Sfv1DVqYERYRorwTEH+NDYCrSkIk3W2JV1vh0LNlE09zAgd2qvMEDi898?=
 =?iso-8859-1?Q?rF71hxnJnEz1TMdL9dee4xNA2WeDGJ8lhsDm2gaXW3lXtXaQlBiqLLF46+?=
 =?iso-8859-1?Q?c5sifu5aZ9rcrDei1/n398q01hvKRt+MAHI9oXAmwmBhPGSixYg1Cm4+4P?=
 =?iso-8859-1?Q?YESZN5ooVCgAMr+/eMVs6AftNuFcai4YuDf/xqJ9RJTWW5OjF3GiOdVBFY?=
 =?iso-8859-1?Q?sgLib9wd6ANVf780qWRGxRTw23lW2qlrJKsPEhpua4ODClBsHvlAZhZksZ?=
 =?iso-8859-1?Q?8EkDOWC+rA5LRjRHgBbH6exA06qP11Y2qkZT9B40uUr76g4gDT5oRxUxtN?=
 =?iso-8859-1?Q?DFxw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: konecranes.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9511.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d346d8e4-67db-4802-4979-08dcbc344f57
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 07:40:03.4600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ab0514a-59fa-4283-934f-c1c2c4a1f032
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PwiXEI74mRG9B5U7S7dRY2D7NLAOcFVrPnzf2/QORK/4m+Wto1M5LLP1FM+qxX+LnV1GFJvXA2U0tUqE4WPLOZSoyDS9Gn4JSVvalrgNQH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9365

Hello,

Have been trying to debug this issue for a while and am completely out of i=
dea what to check or google, so I'll ask if anyone here has any idea.

The issue appear like this in /var/log/messages (I don't think it is import=
ant, but timestamp is ~9 minutes behind actual time):

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: pppd options in=
 effect:
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: debug debug=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/wvdial)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: -detach=A0=A0=
=A0=A0=A0=A0=A0=A0 # (from command line)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: idle 0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 # (from command line)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: logfd 12=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from command line)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: dump=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/options)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: noauth=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/wvdial)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: name .......os=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/wvdial)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: user dummy=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from command line)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: usehostname=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from command line)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: 115200=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 # (from command line)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: lock=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/options)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: crtscts=A0=A0=
=A0=A0=A0=A0=A0=A0 # (from command line)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: modem=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 # (from command line)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: novj=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/options)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: novjccomp=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/options)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: ipcp-accept-loc=
al=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/options)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: ipcp-accept-rem=
ote=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/options)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: noipdefault=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from command line)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: defaultroute=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from command line)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: usepeerdns=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from command line)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: noccp=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/options)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.notice pppd[4595]: pppd 2.4.7 st=
arted by root, uid 0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.debug pppd[4595]: using channel =
4
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: Using interface=
 ppp0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.notice pppd[4595]: Connect: ppp0=
 <--> /dev/ttyUSB3
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.debug pppd[4595]: sent [LCP Conf=
Req id=3D0x1 <asyncmap 0x0> <magic 0xf4c49356> <pcomp> <accomp>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.debug pppd[4595]: rcvd [LCP Conf=
Req id=3D0x6 <asyncmap 0x0> <auth chap MD5> <magic 0xd0ea135c> <pcomp> <acc=
omp>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.debug pppd[4595]: sent [LCP Conf=
Ack id=3D0x6 <asyncmap 0x0> <auth chap MD5> <magic 0xd0ea135c> <pcomp> <acc=
omp>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.debug pppd[4595]: rcvd [LCP Conf=
Ack id=3D0x1 <asyncmap 0x0> <magic 0xf4c49356> <pcomp> <accomp>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.debug pppd[4595]: rcvd [LCP Disc=
Req id=3D0x7 magic=3D0xd0ea135c]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.debug pppd[4595]: rcvd [CHAP Cha=
llenge id=3D0x1 <................................>, name =3D "UMTS_CHAP_SRV=
R"]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.debug pppd[4595]: sent [CHAP Res=
ponse id=3D0x1 <................................>, name =3D "dummy"]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.debug pppd[4595]: rcvd [CHAP Suc=
cess id=3D0x1 ""]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.info pppd[4595]: CHAP authentica=
tion succeeded
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.notice pppd[4595]: CHAP authenti=
cation succeeded
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:06 .......os daemon.debug pppd[4595]: sent [IPCP Con=
fReq id=3D0x1 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns2 0.0.0.0>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:07 .......os daemon.notice pppd[4595]: Modem hangup
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 05:02:07 .......os daemon.notice pppd[4595]: Connection te=
rminated.

For this device pppd is being started by wvdial, and I've confirmed APN is =
set correctly. Came across some forums posts saying to check the PDP contex=
t, but I haven't been able to figure out what about it I should check other=
 than APN.
I've seen the issue occur very intermittently after moving the device (betw=
een different buildings which are couple hundred meters apart).
Recently it has occurred much more often on devices which are first powered=
 and set up over ethernet without ppp being started, and then a few months =
later when devices are powered on again this issue occurs and LTE doesn't c=
ome up sometimes for hours. Sometimes I have been able to get LTE to connec=
t by resetting the modem and rebooting, but sometimes that doesn't work. Us=
ually this issue seems to go away after a few days, or shortly after a boot=
 after a few few days.

In journald, the same problem appears like this:

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:48 .......os lte-starter.sh[37607]: --> Initializing=
 modem.
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:48 .......os lte-starter.sh[37607]: --> Sending: ATZ
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:48 .......os lte-starter.sh[37607]: ATZ
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:48 .......os lte-starter.sh[37607]: OK
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:48 .......os lte-starter.sh[37607]: --> Sending: ATQ=
0 V1 E1 S0=3D0 &C1 &D2 +FCLASS=3D0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:48 .......os lte-starter.sh[37607]: ATQ0 V1 E1 S0=3D=
0 &C1 &D2 +FCLASS=3D0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:48 .......os lte-starter.sh[37607]: OK
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:48 .......os lte-starter.sh[37607]: --> Sending: AT+=
CGDCONT=3D1,"IP","konecranes.com"
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:48 .......os lte-starter.sh[37607]: AT+CGDCONT=3D1,"=
IP","konecranes.com"
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:48 .......os lte-starter.sh[37607]: OK
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:48 .......os lte-starter.sh[37607]: --> Modem initia=
lized.
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: --> Initializing=
 modem.
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: --> Sending: ATZ
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: ATZ
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: OK
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: --> Sending: ATQ=
0 V1 E1 S0=3D0 &C1 &D2 +FCLASS=3D0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: ATQ0 V1 E1 S0=3D=
0 &C1 &D2 +FCLASS=3D0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: OK
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: --> Sending: AT+=
CGDCONT=3D1,"IP","konecranes.com"
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: AT+CGDCONT=3D1,"=
IP","konecranes.com"
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: OK
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: --> Modem initia=
lized.
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: --> Sending: ATD=
T*99#
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: --> Waiting for =
carrier.
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: ATDT*99#
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: CONNECT 115200
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: --> Carrier dete=
cted.=A0 Starting PPP immediately.
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: --> Starting ppp=
d at Wed Aug 14 06:18:58 2024
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: --> Pid of pppd:=
 38303
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: --> Using interf=
ace ppp0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: --> Authenticati=
on (CHAP) started
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:58 .......os lte-starter.sh[37607]: --> Authenticati=
on (CHAP) successful
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:59 .......os lte-starter.sh[37607]: --> Disconnectin=
g at Wed Aug 14 06:18:59 2024
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:59 .......os lte-starter.sh[37607]: --> The PPP daem=
on has died: A modem hung up the phone (exit code =3D 16)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:59 .......os lte-starter.sh[37607]: --> man pppd exp=
lains pppd error codes in more detail.
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:59 .......os lte-starter.sh[37607]: --> Try again an=
d look into /var/log/messages and the wvdial and pppd man pages for more in=
formation.
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 14 06:18:59 .......os lte-starter.sh[37607]: --> Auto Reconne=
ct will be attempted in 20 seconds

On another of the same device where LTE is functioning, output in /var/log/=
messages looks like:

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.notice pppd[3440]: pppd 2.4.7 st=
arted by root, uid 0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: using channel =
1
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.info pppd[3440]: Using interface=
 ppp0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.notice pppd[3440]: Connect: ppp0=
 <--> /dev/ttyUSB3
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: sent [LCP Conf=
Req id=3D0x1 <asyncmap 0x0> <magic 0x665384a3> <pcomp> <accomp>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: rcvd [LCP Conf=
Req id=3D0x0 <asyncmap 0x0> <auth chap MD5> <magic 0x8dfc8a02> <pcomp> <acc=
omp>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: sent [LCP Conf=
Ack id=3D0x0 <asyncmap 0x0> <auth chap MD5> <magic 0x8dfc8a02> <pcomp> <acc=
omp>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: rcvd [LCP Conf=
Ack id=3D0x1 <asyncmap 0x0> <magic 0x665384a3> <pcomp> <accomp>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: rcvd [LCP Disc=
Req id=3D0x1 magic=3D0x8dfc8a02]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: rcvd [CHAP Cha=
llenge id=3D0x1 <................................>, name =3D "UMTS_CHAP_SRV=
R"]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: sent [CHAP Res=
ponse id=3D0x1 <................................>, name =3D "dummy"]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: rcvd [CHAP Suc=
cess id=3D0x1 ""]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.info pppd[3440]: CHAP authentica=
tion succeeded
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.notice pppd[3440]: CHAP authenti=
cation succeeded
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: sent [CCP Conf=
Req id=3D0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: sent [IPCP Con=
fReq id=3D0x1 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns2=
 0.0.0.0>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: rcvd [LCP Prot=
Rej id=3D0x2 80 fd 01 01 00 0f 1a 04 78 00 18 04 78 00 15 03 2f]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: Protocol-Rejec=
t for 'Compression Control Protocol' (0x80fd) received
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: rcvd [IPCP Con=
fReq id=3D0x0]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: sent [IPCP Con=
fNak id=3D0x0 <addr 0.0.0.0>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: rcvd [IPCP Con=
fRej id=3D0x1 <compress VJ 0f 01>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: sent [IPCP Con=
fReq id=3D0x2 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns2 0.0.0.0>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: rcvd [IPCP Con=
fReq id=3D0x1]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: sent [IPCP Con=
fAck id=3D0x1]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: rcvd [IPCP Con=
fNak id=3D0x2 <addr ..............> <ms-dns1 ..............> <ms-dns2 .....=
.........>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: sent [IPCP Con=
fReq id=3D0x3 <addr ..............> <ms-dns1 ..............> <ms-dns2 .....=
.........>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: rcvd [IPCP Con=
fAck id=3D0x3 <addr ..............> <ms-dns1 ..............> <ms-dns2 .....=
.........>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.warn pppd[3440]: Could not deter=
mine remote IP address: defaulting to ...........
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.notice pppd[3440]: local=A0 IP a=
ddress ..............
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.notice pppd[3440]: remote IP add=
ress ...........
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.notice pppd[3440]: primary=A0=A0=
 DNS address ..............
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.notice pppd[3440]: secondary DNS=
 address ..............
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: Script /etc/pp=
p/ip-up started (pid 3448)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 23:21:23 .......os daemon.debug pppd[3440]: Script /etc/pp=
p/ip-up finished (pid 3448), status =3D 0x0

Though here there are different options in /etc/ppp/options (the only optio=
ns there are debug and lock for this device which is working), including la=
ck of dump option. With the device where LTE isn't starting I tried copying=
 some settings from another device because I thought it might have some rel=
ation to the failure to negotiate the compression.
Comparable /var/log/messages contents of the other device, which is also us=
ing quectel-ppp (becaues of using a different modem) to start pppd intead o=
f wvdial:

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: pppd options in=
 effect:
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: debug debug=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: nodetach=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: dump=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: noauth=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: user $LTE_USERN=
AME=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-p=
pp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: password ??????=
=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: remotename 3gpp=
p=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quect=
el-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: /dev/ttyUSB3=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: 115200=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: lock=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: connect /usr/sb=
in/chat -E -s -v -f /etc/ppp/peers/quectel-chat-connect=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: disconnect /usr=
/sbin/chat -E -s -v -f /etc/ppp/peers/quectel-chat-disconnect=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: crtscts=A0=A0=
=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: local=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: hide-password=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: novj=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: novjccomp=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: ipcp-accept-loc=
al=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel=
-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: ipcp-accept-rem=
ote=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-p=
pp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: ipparam 3gppp=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: noipdefault=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: defaultroute=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: replacedefaultr=
oute=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp=
)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: usepeerdns=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.info pppd[1507]: noccp=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 # (from /etc/ppp/peers/quectel-ppp)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os daemon.notice pppd[1507]: pppd 2.4.7 st=
arted by root, uid 0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: abort on (BUSY)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: abort on (NO CA=
RRIER)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: abort on (NO DI=
ALTONE)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: abort on (ERROR=
)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: abort on (NO AN=
SWER)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: timeout set to =
180 seconds
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: send (AT^M)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: expect (OK)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: AT^M^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: OK
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]:=A0 -- got it
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: send (ATE0^M)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: expect (OK)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: ATE0^M^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: OK
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]:=A0 -- got it
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: send (ATI^M)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: expect (OK)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: Quectel^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: .....^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: Revision: .....=
.......^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: OK
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]:=A0 -- got it
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: send (AT+CSQ^M)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: expect (OK)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: +CSQ: 23,99^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: OK
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]:=A0 -- got it
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:10 .......os local2.info chat[1512]: send (AT+CPIN?^=
M)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: expect (OK)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: +CPIN: READY^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: OK
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]:=A0 -- got it
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: send (AT+COPS?^=
M)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: expect (OK)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: +COPS: 0,2,"244=
05",7^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: OK
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]:=A0 -- got it
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: send (AT+CGREG?=
^M)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: expect (OK)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: +CGREG: 0,5^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: OK
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]:=A0 -- got it
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: send (ATZ^M)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: expect (OK)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: OK
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]:=A0 -- got it
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: send (AT+CGDCON=
T=3D1,"IP","konecranes.com",,0,0^M)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: expect (OK)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: AT+CGDCONT=3D1,=
"IP","konecranes.com",,0,0^M^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: OK
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]:=A0 -- got it
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: send (ATDT*99#^=
M)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: expect (CONNECT=
)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: ^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: ATDT*99#^M^M
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]: CONNECT
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os local2.info chat[1512]:=A0 -- got it
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os daemon.debug pppd[1507]: Script /usr/sb=
in/chat -E -s -v -f /etc/ppp/peers/quectel-chat-connect finished (pid 1512)=
, status =3D 0x0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os daemon.info pppd[1507]: Serial connecti=
on established.
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os daemon.debug pppd[1507]: using channel =
1
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os daemon.info pppd[1507]: Using interface=
 ppp0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:11 .......os daemon.notice pppd[1507]: Connect: ppp0=
 <--> /dev/ttyUSB3
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.debug pppd[1507]: sent [LCP Conf=
Req id=3D0x1 <asyncmap 0x0> <magic 0xb5ac4cf6> <pcomp> <accomp>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.debug pppd[1507]: rcvd [LCP Conf=
Req id=3D0x4 <asyncmap 0x0> <auth chap MD5> <magic 0x8dde940b> <pcomp> <acc=
omp>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.debug pppd[1507]: sent [LCP Conf=
Ack id=3D0x4 <asyncmap 0x0> <auth chap MD5> <magic 0x8dde940b> <pcomp> <acc=
omp>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.debug pppd[1507]: rcvd [LCP Conf=
Ack id=3D0x1 <asyncmap 0x0> <magic 0xb5ac4cf6> <pcomp> <accomp>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.debug pppd[1507]: rcvd [LCP Disc=
Req id=3D0x5 magic=3D0x8dde940b]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.debug pppd[1507]: rcvd [CHAP Cha=
llenge id=3D0x1 <................................>, name =3D "UMTS_CHAP_SRV=
R"]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.debug pppd[1507]: sent [CHAP Res=
ponse id=3D0x1 <................................>, name =3D "$LTE_USERNAME"=
]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.debug pppd[1507]: rcvd [CHAP Suc=
cess id=3D0x1 ""]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.info pppd[1507]: CHAP authentica=
tion succeeded
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.notice pppd[1507]: CHAP authenti=
cation succeeded
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.debug pppd[1507]: sent [IPCP Con=
fReq id=3D0x1 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns2 0.0.0.0>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.debug pppd[1507]: rcvd [IPCP Con=
fReq id=3D0x4]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.debug pppd[1507]: sent [IPCP Con=
fNak id=3D0x4 <addr 0.0.0.0>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.debug pppd[1507]: rcvd [IPCP Con=
fNak id=3D0x1 <addr ..............> <ms-dns1 ..............> <ms-dns2 .....=
.........>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.debug pppd[1507]: sent [IPCP Con=
fReq id=3D0x2 <addr ..............> <ms-dns1 ..............> <ms-dns2 .....=
.........>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.debug pppd[1507]: rcvd [IPCP Con=
fReq id=3D0x5]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.debug pppd[1507]: sent [IPCP Con=
fAck id=3D0x5]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.debug pppd[1507]: rcvd [IPCP Con=
fAck id=3D0x2 <addr ..............> <ms-dns1 ..............> <ms-dns2 .....=
.........>]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.warn pppd[1507]: Could not deter=
mine remote IP address: defaulting to ...........
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.notice pppd[1507]: local=A0 IP a=
ddress ..............
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.notice pppd[1507]: remote IP add=
ress ...........
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.notice pppd[1507]: primary=A0=A0=
 DNS address ..............
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.notice pppd[1507]: secondary DNS=
 address ..............
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:12 .......os daemon.debug pppd[1507]: Script /etc/pp=
p/ip-up started (pid 1542)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Aug 13 22:02:13 .......os daemon.debug pppd[1507]: Script /etc/pp=
p/ip-up finished (pid 1542), status =3D 0x0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=20
Also, all three device are currently in the same area, and should be connec=
ting to the same operator, but I wasn't able to check which operator the pr=
oblematic device was connecting too, they are set to automatically select a=
n operator and AT+COPS? just returns "+COPS: 0".

Thanks for any help or suggestions,

Scott Threet



