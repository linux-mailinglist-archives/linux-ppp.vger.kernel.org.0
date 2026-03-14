Return-Path: <linux-ppp+bounces-417-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKAcKUS3tGkLsQAAu9opvQ
	(envelope-from <linux-ppp+bounces-417-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Sat, 14 Mar 2026 02:17:56 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F8F28B345
	for <lists+linux-ppp@lfdr.de>; Sat, 14 Mar 2026 02:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52E28300D766
	for <lists+linux-ppp@lfdr.de>; Sat, 14 Mar 2026 01:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDAEA262808;
	Sat, 14 Mar 2026 01:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b="pJWXWCD1"
X-Original-To: linux-ppp@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011032.outbound.protection.outlook.com [52.103.33.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E27227456;
	Sat, 14 Mar 2026 01:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773451071; cv=fail; b=t6YOV+HVdkPTHMyKbPPrugdTha9tHuN9ouBJiShnIVtygdxDZ8MifU9UsDWfWLuIzOk1bW64bccj2suW3NlbQYppgENn0/m9tb7DnwZzEb3+6uy0repKwQGlkiRRk2Q663l7i+rqrc0LJ1kftACi4GPvKgDEF7MSqsDhOT1jOyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773451071; c=relaxed/simple;
	bh=K7seYPGFGU/Pj3vAp3u+VtchUj5bYQvVfTjwgltR4gg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DVjdm3GWCg+A7GMi2OQesBoB7n1I44Lu+IcubacQ9ogXgVed7Za3cIqmsC3V91tMH7R8Q7kBzjn6kEMRegjlmVBMtoRIMHq/oNr4Yyr2/XMgaOerG/FdmJDOy6RHvbcq12Cyu7L6XGFBrckr4ayMLf7r7nUKpXGwuKNp0XdTZ9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr; spf=pass smtp.mailfrom=live.fr; dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b=pJWXWCD1; arc=fail smtp.client-ip=52.103.33.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.fr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqs9lTA8iMOBtm9QZWnzueny1X+ktZRiFwONlnM08mUXkn+HeZbpIBKy4inlibifW+goCGcfUaTJHwCaphDRIXL7GgcvGK46z7ob2rWXVzP7WLug0D1bEMKcfn5H5TjRUZ/CFVBWZnGsr88DVrysLa4p9zgIwmeVrl09zdF/rPUDH8BXYkiV3mzDXiagHXp9gOhsSy2lZebf4pXa9zr/7lYaYybKXgk/aZxemIPtkjL2/ReDqqQnR4Q6A/8Wla+k0d6lSXfYUa3NV+Gzz58cWwZgNp+k2NlEZstervP2XiIQN+8wB/YVtNobEc/4Ezarnxuc5Cnpphcey4dT83TgQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UE8kfAQ+yd71w51euHBXnslcx8xcYnXRIfXHwqFBQzE=;
 b=cwmzn/D494iiOdSn1831U/N6VDvtXMd/DBm9uvh170PX+iN4Bhs6/e+SQ/6mxjDa26DPuihdMQg1hMmgGP9WQYdFmMpw2UCQGUiBs8eKvWKgsZleJeyvjLCOZSzQh0iGP9EptCm02AwkHQvXkAPWxHgppx2azXyLaOIHbJ8Vl7QscHu/tT/ANHB7RCkasZNLFV47rlfudKwXu7IxYNKpyJfJWMAkDHbLojzvVdMBTUoa7M/NjrAL1PPsms5g19dX/IjStycppwHTq3U+KU2dHs34KjCD3pNc6ym4yGEodxSCwAsrvG8czR6TOPhVkiJBoctOsCzcXHsuE7J0/nbOkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UE8kfAQ+yd71w51euHBXnslcx8xcYnXRIfXHwqFBQzE=;
 b=pJWXWCD1PUnMeMYQIPxwC6N1NOJlKQ6P7xLNu2fLo6ly0rjRzsYBjbvNeRC7w40uKSY7aOuTPemgWal0S4r+dmT2RllCNIxZfQFIvoALkPdO/e5GLXesKIjkRWOqxDr2N9F/RFSRMhBVDX61ImdjYwfYCPApaKfGGuG/N5K2hTaY/+f5H3yzjfQp1DfiYRAoJM1sfag7BZTZYV7XfEXKYKXl9wMdlIfW10JQs7c3B/2JMB6qQaOL8A/NUtlERkg1dMKFQNHfm9G4py8y7Cc4bVQdirzQXUGYmarORrX0b0EKd6O4q+Ao0uIkuxWlHbWzj9adcqPe1ixM+9RGa5cAsw==
Received: from PAWP192MB2411.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:46e::17)
 by GV1P192MB2395.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:1ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Sat, 14 Mar
 2026 01:17:45 +0000
Received: from PAWP192MB2411.EURP192.PROD.OUTLOOK.COM
 ([fe80::9c57:1e4e:325e:d2e7]) by PAWP192MB2411.EURP192.PROD.OUTLOOK.COM
 ([fe80::9c57:1e4e:325e:d2e7%5]) with mapi id 15.20.9654.015; Sat, 14 Mar 2026
 01:17:45 +0000
From: Martin Olivier <martin.olivier@live.fr>
To: netdev@vger.kernel.org,
	linux-ppp@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	dqfext@gmail.com,
	Martin Olivier <martin.olivier@live.fr>
Subject: [PATCH net-next v2] ppp: add IFLA_PPP_UNIT netlink attribute
Date: Sat, 14 Mar 2026 02:14:29 +0100
Message-ID:
 <PAWP192MB2411A808BB36F0086A9B00B99742A@PAWP192MB2411.EURP192.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0440.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37d::7) To PAWP192MB2411.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:46e::17)
X-Microsoft-Original-Message-ID:
 <20260314011619.11603-1-martin.olivier@live.fr>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWP192MB2411:EE_|GV1P192MB2395:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f53536d-49e5-48ab-e361-08de81677d93
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|25031999004|51005399006|23021999003|12121999013|19110799012|5072599009|5062599005|15080799012|8060799015|1602099012|40105399003|3412199025|4302099013|440099028|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xqhtjVnAajt7dwVbjJCC+bNMusBQFrUEGQ3cF/HZ9pi8ZHNOVxUnectQ4MKr?=
 =?us-ascii?Q?f3j6BQElcm37A+RuAllZO4MHgjuNh7beAm5F5fB6KT/woHSDr1LIwjOX2RCF?=
 =?us-ascii?Q?pVDTlvqA6YIGQt/nMgFGWAfMwl+miKybXS3ZHPV8EYqgGE+9gdhi+YpxmmYJ?=
 =?us-ascii?Q?D2ZreqHLKBeIVK9CjXgfvqdN8thLyWMdKwEelA23o2McgMbRjIExDLuYOcr6?=
 =?us-ascii?Q?WpuY4lQQfsgnyTacetqE1bZ4iXCz2ScpHSxRFkTBM3mg1Z1FtVw/b0cX8d41?=
 =?us-ascii?Q?+xOyLfDf9zIw9qPI2SkPNWD/yTKA6ViOnPXxJWSgcuDWfVF7HXjFKHCGA7D1?=
 =?us-ascii?Q?E6x3uB/u6At6a4D7xNSAovVGFj53pojMr8XP5tDaKUysXtpt6I2jUeKnEOMM?=
 =?us-ascii?Q?naa6WoG3i6o/iwuzg54NcdlwCOdK+zbcWy0L2bcUO/9dfj3+KOkm1SCGJiGU?=
 =?us-ascii?Q?S1kPQ0lDgiF3pVkROkybdyfKih/lANYypQNhu7l/PP/QS/C3aq6GMk/Qkx36?=
 =?us-ascii?Q?/PzdDA3hkn7eGrQo1Ovqvi+I4fYAfVsXcOmxc0k726dytJLerBK7pB1UQQvD?=
 =?us-ascii?Q?gBAMNpauNwbOaCOWJjPPzTxO+qFscZFE9MbdDrNSxrJzBpXWM7oO4nyyPf3J?=
 =?us-ascii?Q?1GYeMIPUwLe49b8sc2y0qQ6ADVMCi2M0ys8C9w5R9wuAWiCpAa1rYgkkhhjh?=
 =?us-ascii?Q?OEgXRD4w+2hsel37KHyaablZ0guEM048DvBsOOYRFRTSzfZA1L8NOrG/pF46?=
 =?us-ascii?Q?8osKLLHe+UzeKSUlZteMU4oCNHzLDUL+dlHWfysPbtxfAzMzfiRT1BGQvaA6?=
 =?us-ascii?Q?UlK0iEgn0nDVV3FknN+7ddxdRvWxbW3kwxhPFRop3Hh0laZjHjx1NBJyFyxd?=
 =?us-ascii?Q?RvSYDlHGeBnnitZKYvYxpGShnZA2JYje4FDPTqPAvC1/EionPvNUBCrEnt8C?=
 =?us-ascii?Q?2L3cp2XMoFOwYG9zURYQehnF2AzwbZaiZk2HHxiM6hyydDI4Yfdp9zR5m47O?=
 =?us-ascii?Q?P1/f6djJdowVymrjKU7rOgg38bgM9FcdWxiOnkeji8tcl6HdO3hiaEfcXQgk?=
 =?us-ascii?Q?1Oyb/z1x26/qPXD8xpwWIlt0eUxyhyK+f0j4KGR1g66TaTtHUInLsn+ZoEOZ?=
 =?us-ascii?Q?7LiII7GdawEb6YbXuYcwDymdPPo+zPeMoStcsKBPpAswmY0NgeD2pZs=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gaLhWwYnWeby6yKEuHcvIgzHjP5M1G35AmC408zcxF5n3GMz4LP7ZlreSleQ?=
 =?us-ascii?Q?YnMSmCbS0eTW4dExJAJrjUXkonGJOXcIq52PSSY5mwbG1aUgHV5PfV7D+w73?=
 =?us-ascii?Q?0PuCcZnnTkkRoU9Aa9volg2kFdR3d5nNIpM1of2tEzam1Q9kDyi9AiRNdxAr?=
 =?us-ascii?Q?3V0ZKsp4BtaqlmjtCELq7mzfJbTS0puK/Ryc86m6gxsQjyZ9PaBMnWUegrEb?=
 =?us-ascii?Q?t40q0Q+xtTyZ+TRV1cWsIAuCcHmpRVPHp08CYwk4F+5NsXmI4s2Tv4CL+25z?=
 =?us-ascii?Q?zGFcg64ONNN8f9qL5noDf1O/wJKfB+rES9VZnJ1Tn6nTdxysfS5xtjcXZZYW?=
 =?us-ascii?Q?UiJtHxIQw7qah2pn+PG8eC0WfLMo3l5d+Xh9FtU5aWoF9BPF+6pyM8y9nUvz?=
 =?us-ascii?Q?yPZ4q5TGJgI5bCpZtnSk5nELlMovexHApR9Xa/UZhVvE0o59rngn0G5uNva8?=
 =?us-ascii?Q?/wlwAQBooERXaGWDmDbjotL3rrU28PMDnX3UbKjvPzlUcoEwetCSWhLDFk3t?=
 =?us-ascii?Q?DkYv3M9cnoT3w7bIo19b4FIt9D4dgiqzrKQptFJiXwWdxhsMLZZ8JDJdGgor?=
 =?us-ascii?Q?wmLetIO5WV66/sCyAjU61R8uMhwi5vlMiP+NpVQlqpZYYuMdNPuy9rX9MRnD?=
 =?us-ascii?Q?K86fmQ90ZFQpdeGnTSt0H+ho/IfhYuDWmJumto3w/ICUNkU1ye0EvJQyaavh?=
 =?us-ascii?Q?LTJc47WSMer/wOaPiXNM9aWkWhyyWREafQKjmE2MN+8b6KjzB7rOPCNwM39/?=
 =?us-ascii?Q?gBpnZKpXVYfuWXoRjWQEGXA3wC7Qj+hCq3/eB7g+wIsly/pLLnXZYiFky6fK?=
 =?us-ascii?Q?XAkg9o8cf94tnprPFAkBpZBnjcLDy6kDHEPlb+IvVnTD76wRjS37t3g8zIgL?=
 =?us-ascii?Q?wV+F0MDz01VTL33gjhNJfAdVRsOVSLszcoF81w9o36cEuflOn/bxbxWA7hvZ?=
 =?us-ascii?Q?f3kh6b3NZKvMX6WzrmDGrlMiFTvLIXjbH4BfThZleYRgs9o9KSpfJpr0r2HH?=
 =?us-ascii?Q?2Ih7W87QG5P4gA8Oic+N3sXHAOsLQ+QzB41mDgjAsOjhXcoUUixC3FYqOJ+Y?=
 =?us-ascii?Q?WS+m0fHvXUsUWlz9bWmjEJ9iPLu621CVZ6rob3SDa2P2a3Q2QeYO8wEgUn/3?=
 =?us-ascii?Q?4DTNG6Ovgl0xZu9mIH8hJAp3b55rPedy+wbBgZkSvaquMUznlR9buXIXKwaA?=
 =?us-ascii?Q?wQUqw8c77guGMz1fRj+LX1bS/fVhsDgJePkHxfxdQM6Yz02+pM62Z0RXuMWl?=
 =?us-ascii?Q?Ad/IpM0dui393Y5j/nQyMez80dVCzIyWo6PivCY7IpGyaihC6RePaviNF9jb?=
 =?us-ascii?Q?6DB0aRIOHm71ZgyNJTfz6v7qq5r47l07I64RaM693qggUWrIPWQYaI1MnK4d?=
 =?us-ascii?Q?1H1JzRFv9rVUnxITVMQQt4JkLpR1?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-4fb8a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f53536d-49e5-48ab-e361-08de81677d93
X-MS-Exchange-CrossTenant-AuthSource: PAWP192MB2411.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 01:17:42.5243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P192MB2395
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[live.fr,none];
	R_DKIM_ALLOW(-0.20)[LIVE.FR:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,gmail.com,live.fr];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-417-lists,linux-ppp=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[live.fr];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.olivier@live.fr,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[LIVE.FR:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[live.fr:email,LIVE.FR:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 41F8F28B345
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, the PPP rtnetlink API allows creating a new network interface
with a custom ifname, but it lacks the ability to specify a custom PPP
unit id.

Setting a specific unit id is currently only possible with the
PPPIOCNEWUNIT ioctl. If a user-space program also requires a custom
interface name, it must create the interface first with PPPIOCNEWUNIT
and then rename it.

Resolve this by introducing the IFLA_PPP_UNIT netlink attribute. This
allows user-space programs to atomically request both a custom ifname
and a specific PPP unit id during the RTM_NEWLINK creation process,
eliminating the post-creation renaming for this use case.

Signed-off-by: Martin Olivier <martin.olivier@live.fr>
---
Changes in v2:
- use nl policy to set IFLA_PPP_UNIT min allowed value instead of a manual check in ppp_nl_validate()
- use of nla_get_s32_default() to collect IFLA_PPP_UNIT value
Link to v1: https://lore.kernel.org/netdev/PAWP192MB2411A5E7D3BE1B55E155A92F9747A@PAWP192MB2411.EURP192.PROD.OUTLOOK.COM/
---
 drivers/net/ppp/ppp_generic.c      | 3 ++-
 include/uapi/linux/if_link.h       | 1 +
 tools/include/uapi/linux/if_link.h | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index e9b41777be80..3d5d5fe8bad3 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1292,6 +1292,7 @@ static int ppp_dev_configure(struct net *src_net, struct net_device *dev,
 
 static const struct nla_policy ppp_nl_policy[IFLA_PPP_MAX + 1] = {
 	[IFLA_PPP_DEV_FD]	= { .type = NLA_S32 },
+	[IFLA_PPP_UNIT]		= NLA_POLICY_MIN(NLA_S32, 0),
 };
 
 static int ppp_nl_validate(struct nlattr *tb[], struct nlattr *data[],
@@ -1316,7 +1317,6 @@ static int ppp_nl_newlink(struct net_device *dev,
 	struct nlattr **data = params->data;
 	struct nlattr **tb = params->tb;
 	struct ppp_config conf = {
-		.unit = -1,
 		.ifname_is_set = true,
 	};
 	struct file *file;
@@ -1342,6 +1342,7 @@ static int ppp_nl_newlink(struct net_device *dev,
 	}
 
 	conf.file = file;
+	conf.unit = nla_get_s32_default(data[IFLA_PPP_UNIT], -1);
 
 	/* Don't use device name generated by the rtnetlink layer when ifname
 	 * isn't specified. Let ppp_dev_configure() set the device name using
diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
index e9b5f79e1ee1..40523cd01a8b 100644
--- a/include/uapi/linux/if_link.h
+++ b/include/uapi/linux/if_link.h
@@ -1477,6 +1477,7 @@ enum {
 enum {
 	IFLA_PPP_UNSPEC,
 	IFLA_PPP_DEV_FD,
+	IFLA_PPP_UNIT,
 	__IFLA_PPP_MAX
 };
 #define IFLA_PPP_MAX (__IFLA_PPP_MAX - 1)
diff --git a/tools/include/uapi/linux/if_link.h b/tools/include/uapi/linux/if_link.h
index 7e46ca4cd31b..150a582ae498 100644
--- a/tools/include/uapi/linux/if_link.h
+++ b/tools/include/uapi/linux/if_link.h
@@ -1465,6 +1465,7 @@ enum {
 enum {
 	IFLA_PPP_UNSPEC,
 	IFLA_PPP_DEV_FD,
+	IFLA_PPP_UNIT,
 	__IFLA_PPP_MAX
 };
 #define IFLA_PPP_MAX (__IFLA_PPP_MAX - 1)
-- 
2.51.0


