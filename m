Return-Path: <linux-ppp+bounces-411-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDj/EpaqsWmzEQAAu9opvQ
	(envelope-from <linux-ppp+bounces-411-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Mar 2026 18:47:02 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B347268341
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Mar 2026 18:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C693306C462
	for <lists+linux-ppp@lfdr.de>; Wed, 11 Mar 2026 17:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C16E2F49F1;
	Wed, 11 Mar 2026 17:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b="WRIxjpK+"
X-Original-To: linux-ppp@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010004.outbound.protection.outlook.com [52.103.32.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C9629D291;
	Wed, 11 Mar 2026 17:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773251173; cv=fail; b=RS+9va5ZjM24o+eYHr3NiHqS2mg3mLxZZQmBdLfarKhyEBRv6+q5v59JHP44zK09lk58OYoIOffEEYmlsNJZreJKfmfRx3Nff7WfqUeDcJuWD1Fz5FGv6Sj3WTVruyhEt/zY0qhANxr0basVHHoqO9tHkH7ICgSwmfqTWCSAhlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773251173; c=relaxed/simple;
	bh=U30qFP+QZllEHh1ByuKj85dT4Qf/YA4GWZ+RuIgpS2k=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rswUByOFYDnIkkqI1Ygk0R0LDPR6fzgNhjTeGYuEfubxYxw+++V/p4PYa7IcOSZzCXZ76zisCpowg4QxdqdMeNPwFAmxG5UlVdyttg/y/x+V2/RULz1XehfH4aVUU4QupyoOouZbAi05gmBLpkev9J6Ac73+oEdE2Z3L9gEpFVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr; spf=pass smtp.mailfrom=live.fr; dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b=WRIxjpK+; arc=fail smtp.client-ip=52.103.32.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.fr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+nSQjLWT+XLcPKF11ZOsqtATu53T6iZLJsBQWlgJ1zLKdwRo16uOH6EWTprPD+UWMoSaCMfit0za+9yD32VzypJ9n4S8a++bw4MBCi6YCwi3UNMl78LbDJyRNy6YInOMyDxInTh/95x53XS7qMBdjBSpBl6uYUP7ff24z81+htcbdGT1C5un4UWt0yX2ZeEgpwYtfcy4bpFkDEN9MdW6pBLM3N/R80phghgnQ7T3HcwHbieF+IN00ROhWYZVm46vyrzozyszjQE9S7iU856fcCHsGQGNBYZlVx4PzgQvC1BUXyE20dXD4FsBK1Tmhh+pl37mV8G/EN/Oq8xTT+7Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkrN6ALiciSxAE7OoHmt68zMvNFbSLKGPJPthMbSYjA=;
 b=lcqIRMTH94RKw1uvBECU6j9igfN1dlmirzUNRRkpVe83JqIOPenm7AGh28XKEZYWloheT/ABCIjo1NCtiCs9dzj4lxp9RLr7i/dvQUi4GhKVANdak62sWrhShGNglviCktZZpdOx3d6DK/tAKjeBRb/TBqbzqzNzJQjmgAd3XJbD1YYeJzi35jCDPmAiATu9O+a/CXVRi05c31sMAKx7pTWBk/nYg0mB5u0dIL1rdGj+C/LYytyANcVtV75m7Td5Ag4zOhAKFsKhWX0AQlPSb76SBg65vuWLqAEfvtEvnTBw/76SSYDn9WYzqjQxMksOqZ/s8xi7UFgqsKXgRXmTPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkrN6ALiciSxAE7OoHmt68zMvNFbSLKGPJPthMbSYjA=;
 b=WRIxjpK+dndyNpZXyvfYEOc8J1weQ/Dvv2VRCZ+tanqtR6agWKJKjF/+4ucd2aSXalhElQigxRYOCXrrENnoDkdYaJPq9C065lhPzStkNfkF1b6cttilkvgd6zEhsdGKj9PI5uiDiQi/TVt+2i4g+GF86oiw6oeAb3wKpuqnn7QN0huYIU+PT/qHbFKCRs35e469P7HRsc4B1eX4mLL8PHw/uLtS2VwEuyyE8SWvqE1vYQNJqOq2fNtat8rLYkGKFBoEU1mLYv0A+s7VkL+wfT5DSbvmfUE8gqNzRk/OIDZ3nq4fNrmSCKbzrdAHkhl8RDHMgYvFhtb/ckiVVNsaog==
Received: from PAWP192MB2411.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:46e::17)
 by AS8P192MB1725.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:525::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 17:46:09 +0000
Received: from PAWP192MB2411.EURP192.PROD.OUTLOOK.COM
 ([fe80::9c57:1e4e:325e:d2e7]) by PAWP192MB2411.EURP192.PROD.OUTLOOK.COM
 ([fe80::9c57:1e4e:325e:d2e7%5]) with mapi id 15.20.9654.015; Wed, 11 Mar 2026
 17:46:09 +0000
From: Martin Olivier <martin.olivier@live.fr>
To: netdev@vger.kernel.org,
	linux-ppp@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	Martin Olivier <martin.olivier@live.fr>
Subject: [PATCH] ppp: add IFLA_PPP_UNIT netlink attribute
Date: Wed, 11 Mar 2026 08:35:26 +0100
Message-ID:
 <PAWP192MB2411A5E7D3BE1B55E155A92F9747A@PAWP192MB2411.EURP192.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P193CA0040.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::15) To PAWP192MB2411.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:46e::17)
X-Microsoft-Original-Message-ID:
 <20260311073526.45490-1-martin.olivier@live.fr>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWP192MB2411:EE_|AS8P192MB1725:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f81697-4b7f-4e46-09bc-08de7f9613c5
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|461199028|5062599005|19110799012|39105399006|15080799012|41001999006|25031999004|8060799015|23021999003|440099028|3412199025|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c6qDOlSlOy75Opm9+G82+dREhDsRB58xvcy9ZRlUCQVacecKHH2dqqI6/HnP?=
 =?us-ascii?Q?7oyb5tm9cr1sot3l6USAE2sAQPWv07uRzEmnB3OosR+BsQ4R+4nYcHYPtUJR?=
 =?us-ascii?Q?OjKEKxI+r75FOLfcIM5+kBRusAvNfCrOf1ozcfpiSKVWlYCpi6xq5HP4Yll7?=
 =?us-ascii?Q?L5UFuO/LtDy7EeRfdcK0YjdpkfDJl2W0fPTdyZtUxLpSoWVTR2TjgEZ3rP66?=
 =?us-ascii?Q?Tnk9wX9SDcx1WRJ3fvVq/UzwxSBJg9SL7XGc52x397Aa0rB8eg0QTQ1h/lHt?=
 =?us-ascii?Q?5JiOWOqGWmizVQlEPuyae0LBHkPLG3IL75E04MOX7/xPg0H7UCAVwTdVTD14?=
 =?us-ascii?Q?1s4pvzw78JlhxOVBnsqp0S/OpUBjaURxWaV0j4DcDb4hWxGAmLjI9aG7L7Ia?=
 =?us-ascii?Q?7DPlrEBBBFf49Mu3pQEHj9Cw6GfnPvwSpBIF6MCKhhfcm+fd4epP6+fapHGg?=
 =?us-ascii?Q?CeSL8afj65F2dCaup72hXIizJjKal0qW1VLiEAJIS6gJBBp1mIN/vB99Nmhm?=
 =?us-ascii?Q?wQMjG5kvIFIV0MpU+5kYtuCSvIUtn8OcVxz7Fz3NiPRM5qEugN6GyQXNO1K1?=
 =?us-ascii?Q?Xn+aLtTJBkQwatoBR8othFiXJYcM50Qwdz9mtqKKuTuD/haxiv/q5gxd4h9L?=
 =?us-ascii?Q?56WsTEj2lpFqbvHoAIIFtJvQCmFNZTbUDA4D/9mitpAyOOxOKXyVnROmlPfa?=
 =?us-ascii?Q?77ZBoBkIx/1XuKg1y5RgSRFYfpxIN77NSvFZoaFA/tSC6ykI7f+4OfzBaXgW?=
 =?us-ascii?Q?oz6bNd3Xi803ZY8FQf0IVE6tXTFXYYqO67F81MnGBRBUNOvoyOSu4Y9oJ8Mg?=
 =?us-ascii?Q?hE5eIUfRved3P1P2x6wUMRavL3d1Cgl7OdhfsrQrxUL+c3kxsdvfsUO0kDvC?=
 =?us-ascii?Q?7PZZKDYFh80yOqgCpQX8cimGGxNBcCFesB49M/gdxrq3N9+tk3Be9HavfYb9?=
 =?us-ascii?Q?Uhq26VCzsCCqNHK/LOpdK8p/4x+6PAIyIZTt7MP8cRieMx7Yd/e2YAAYeOBK?=
 =?us-ascii?Q?1+iNtWVEiyMaeEZdS3EuylvTNw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3z7/oziWRAP7dC+hKC3ADu4T8+Ntq0ckkIX0GR04KxBIsshymNjcr0YgLlO3?=
 =?us-ascii?Q?ZIumGbGcH/rT9EbgUUmnvot07pm4vk0AtALgvUBsXmpC8jt4O6PgBIQlGayy?=
 =?us-ascii?Q?Gf8H1jhzg0QZdKt6imI4weDds81mzbjoRrHW1NfxcbltbgJ7vEJEcYiPCTr2?=
 =?us-ascii?Q?ya3yeKlND9phxz6XSUlz6taqxlPo49JqkFcibh7gC+1GnwVJBLmg23Djwi5W?=
 =?us-ascii?Q?8jnFR9pa782FgdQbKOB+n17KnFCqAzK/n6Qq4QZJwyUD0+Vds1EGeL8J+2iH?=
 =?us-ascii?Q?MkNvhtpxBnf4SFVyaUlQlHE0C+ZWTbUggc9nwn4guEGligD8vSqYddLz1zAa?=
 =?us-ascii?Q?vXp2ViT2g96SYjRNFlybr/4vye2fcaaM7unPPwXkgTn/3/r5m4fYE3EWNPqH?=
 =?us-ascii?Q?kKcGaHqlHwLP/2lCPb13waJg8OGwbjZmPHRFVJoXEmZqgPQ+vQJVn0juoTYG?=
 =?us-ascii?Q?CtpTRWoEtdxIP2qsoavNP7X7KYs0y+DtYFMtseyUDwltk2AqZuc+DNuYRt0P?=
 =?us-ascii?Q?Jvw+2N/p79SjyPCcN9MwxOYsLgc5Muv81Ci/s/7dVb/ErwR3PoHrqaD63lOg?=
 =?us-ascii?Q?E/+VlySQjixjh7m3ShpSNdD8hZv5X32STUNNOZw0TjcITanA0GhfqIsUimwK?=
 =?us-ascii?Q?uEoTAAqhqDGwgnP8e7WOAwiVr/r+LOTc5hKx+6BqFlN2xpjHrMGSxQG8Xa/I?=
 =?us-ascii?Q?LStoHH1bVM89cOrrSF7xWAwrD3OB4y8EqkCUeYSn0fccJjvXEspRqr1sDYLP?=
 =?us-ascii?Q?Wb+fDbFqLOtDEMi2cfw2a6XFEBzFarlV8gB6Uof1yZ3OQyzhkv4e4zkcWKvk?=
 =?us-ascii?Q?OqXWZroXLfZYl7E7SLLtUrf4yzJQ5ktZpT+cpU+vdC22kwdG6C8GcHzK5eFO?=
 =?us-ascii?Q?+L99nBIyAPj1XhGfpo49UUFrOzjt2szg1RcSQtUCI5nC85GAcidPETsiYXTE?=
 =?us-ascii?Q?JkB3bKXLfTd/HfxKOcnU+CiInA+/x3IGo75ljiWO2QWZa+bJLGEwwzR2Ssr8?=
 =?us-ascii?Q?0vBMvtUSqjhBRa3p5IbyCznVDKK3RfFe1pFfVKqdEjCjYRPWQ7L1oGb1UaVK?=
 =?us-ascii?Q?yFFEubLv8HQHnTCRyCtORWF5s3O/ZrH2BF1OCNwIxues4L3RVE0Q2nD1C3WR?=
 =?us-ascii?Q?1hhsy0s7syRVTegKzGsb99odTLR1EW8a7OHP4RVyVlezreWKVYqBn5PW0Vd+?=
 =?us-ascii?Q?B41Y1ykX4jCO3R/G5D8nPi5Q9cAOpUiwpCNTi8nqKGxZRkfhGCGJTXPsiZJg?=
 =?us-ascii?Q?p4ZM6mPSSqctpVm4ljErnFvjySzlZAaI9RXWR2KnH5w3kyVpYfAFlYdnGgC7?=
 =?us-ascii?Q?cEnlMMWzbTDufzcIV/o3HcbQCrCnqK3VET92muyuh9iNypW0EFIuzRWFTFum?=
 =?us-ascii?Q?2XY96KH5ynAHI23R/YTjdU6iC7Ez?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-4fb8a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f81697-4b7f-4e46-09bc-08de7f9613c5
X-MS-Exchange-CrossTenant-AuthSource: PAWP192MB2411.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 17:46:08.9424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P192MB1725
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[live.fr,none];
	R_DKIM_ALLOW(-0.20)[LIVE.FR:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,live.fr];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-411-lists,linux-ppp=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[live.fr];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.olivier@live.fr,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[LIVE.FR:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0B347268341
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
 drivers/net/ppp/ppp_generic.c      | 7 +++++++
 include/uapi/linux/if_link.h       | 1 +
 tools/include/uapi/linux/if_link.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index e9b41777be80..57d0124b9f37 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1292,6 +1292,7 @@ static int ppp_dev_configure(struct net *src_net, struct net_device *dev,
 
 static const struct nla_policy ppp_nl_policy[IFLA_PPP_MAX + 1] = {
 	[IFLA_PPP_DEV_FD]	= { .type = NLA_S32 },
+	[IFLA_PPP_UNIT]		= { .type = NLA_S32 },
 };
 
 static int ppp_nl_validate(struct nlattr *tb[], struct nlattr *data[],
@@ -1305,6 +1306,9 @@ static int ppp_nl_validate(struct nlattr *tb[], struct nlattr *data[],
 	if (nla_get_s32(data[IFLA_PPP_DEV_FD]) < 0)
 		return -EBADF;
 
+	if (data[IFLA_PPP_UNIT] && nla_get_s32(data[IFLA_PPP_UNIT]) < 0)
+		return -EINVAL;
+
 	return 0;
 }
 
@@ -1326,6 +1330,9 @@ static int ppp_nl_newlink(struct net_device *dev,
 	if (!file)
 		return -EBADF;
 
+	if (data[IFLA_PPP_UNIT])
+		conf.unit = nla_get_s32(data[IFLA_PPP_UNIT]);
+
 	/* rtnl_lock is already held here, but ppp_create_interface() locks
 	 * ppp_mutex before holding rtnl_lock. Using mutex_trylock() avoids
 	 * possible deadlock due to lock order inversion, at the cost of
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


