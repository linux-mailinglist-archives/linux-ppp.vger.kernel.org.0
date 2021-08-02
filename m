Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9653DD5C7
	for <lists+linux-ppp@lfdr.de>; Mon,  2 Aug 2021 14:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbhHBMh4 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 2 Aug 2021 08:37:56 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12198 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232815AbhHBMh4 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 2 Aug 2021 08:37:56 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 172CaFdF026939;
        Mon, 2 Aug 2021 12:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=be7+GPv6zKvuFUfIJG4tz7wnnWPLrI7Vui/QB2CLSS8=;
 b=MLJk5/PYN81Azy2UdK4r0wqfbKsg/0o9DvJC1sAWEwLep0j31uqQa+T3XtKdQPn/7AQK
 XPHKtWT9xG95bRKxSnyP0wkkdy77zli3ZqW+zHMpBUJqSfj2RFVanbJv01ML89jHMqBT
 m93Av3bY8jXX8YnmCSGqmAFRn0YonukSPlfHgVNRln2L8zdlo/el/IQ6S8kTWJzA27x6
 gU/mOCtVID2nkGzxQkqd8fdehp7hKAFUJUbYhqN0Dh/vVzeoVCeQl+I9i3JGa09JkwG4
 cNAdugtQPGFYgkL+5gt+x/B2wYBwxu78j3lHrve4M7fVI0k4vgjCKWKQBHAd3dCwfz66 rw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=be7+GPv6zKvuFUfIJG4tz7wnnWPLrI7Vui/QB2CLSS8=;
 b=NHYuTAy/Eqwkqbw5qsktRW7jl5IvLP8kON7uZmWLJBGyCmw4KINlrz05RnA5eCq4knoy
 sQ0Ts4GIJuMneOnBwXiSOFAVj2USLcLOdJlRa0rvhW6AauzDZU03R2OZu2+5b29rHizJ
 G07qHPjYYrcV1Lrwn+6VTGlo/CjxKuns57z3BrQ5Gh7wqI6Jn/QoDk2m7LeVNhf+GSZu
 6emDVUUVOBHVXFINLEFphlfg9D78dMIm440OgiHXQt6qyCA3x/BeWNwNjS22j2Xcqkk8
 s0gKSJ8WOjCDEM7gG/bvtdaadGhbIxNTRTJSBL2Qm3j/FHdlB5lEpbz6mJPOO6Nf9rGm xA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a6fxh83us-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Aug 2021 12:37:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 172Ca2Lh010392;
        Mon, 2 Aug 2021 12:37:43 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
        by aserp3030.oracle.com with ESMTP id 3a4vjbxpbq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Aug 2021 12:37:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRjNu8d7E0u9MMmzfGCDXvRUVB2xUorKWQSOfGcZRkgAhXiUGOYswzJiCmDoD1Qc3QEzJHe97ifSyqagvUB62KnO0zQLBPjj3q6j54iUZbHPd88fXjNe+NWF/gaHDPDxIcZQblYYLCIZxesPzZUCedaOb75OiPWES7fwsBaEGtGW4Bn+JcpFwWPLy+O4jWCJAIbUvg9dBfvngUrACgJdkj0e4HGMajUBoPf2blWC2L14SUKW56PPrxdfMv768+YGIrsydCbrFgp+rGlnJK5CqrVJnRj+MCVjs2mQYjlImpCwKKVfewFKgCOdjNMP3DJzqjGIC8D/yg69O44QDE+lHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=be7+GPv6zKvuFUfIJG4tz7wnnWPLrI7Vui/QB2CLSS8=;
 b=Cq4XVgg6I3i5kmmOS5cyvPZC+YYhJ2ULTc4OGzGm3xNQiVaxlrCOqAvEgSI5DadYaefmLseBy+S3ttSIMffX7r0HVD9pIUFKzM74/z7ObHjyfPGwmTxI1Q/XFFiliYp1wY5Orb0pBzLfwb8avqltLovOErJnKSczKaMImk3FJzrmk7OGVYn63CxRSS8rt3xRMx1LloJcs14DH1G+ENjEeuJj/pDtr2Zuo25rv2nuDzAIjgaVqd/B496ro4K6QM16IGESk6FYT96q1miwXV5IQz8Q7HoboVky7uepNk+8Ur+QEzgcpOPEccxCCgnnQFUW/whopX0vwm6PGU1mEintfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=be7+GPv6zKvuFUfIJG4tz7wnnWPLrI7Vui/QB2CLSS8=;
 b=k3GiDvjMye4t/cx/uk9ilbdH3pOEVn0Ubyb/ZkQPOI007e66QcAoK6rGxhJOxMyjq15mfPz6EI0KcLE4IthCVpG3GjM+v6eTWcMK+spzwPwnK1AzoX3W+IIMowVZ4x7JsG5tVTk513iTiDcjXoKbPBDd7gXshnTITqTpZW7IB/Q=
Authentication-Results: workingcode.com; dkim=none (message not signed)
 header.d=none;workingcode.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5460.namprd10.prod.outlook.com
 (2603:10b6:5:35e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Mon, 2 Aug
 2021 12:37:41 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 12:37:41 +0000
Date:   Mon, 2 Aug 2021 15:37:22 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     James Carlson <carlsonj@workingcode.com>
Cc:     linux-ppp@vger.kernel.org, ben@netservers.co.uk
Subject: Re: [bug report] ppp: fix 'ppp_mp_reconstruct bad seq' errors
Message-ID: <20210802123722.GI25548@kadam>
References: <20210729141617.GC1267@kili>
 <20210730084833.GD25548@kadam>
 <6c6f81af-db62-6644-117a-3bf0a1d62087@workingcode.com>
 <f2558693-c7e4-8a70-94f0-09119b146e1c@workingcode.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2558693-c7e4-8a70-94f0-09119b146e1c@workingcode.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0002.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::7)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNAP275CA0002.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19 via Frontend Transport; Mon, 2 Aug 2021 12:37:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16dd264b-0841-4eb4-b773-08d955b25167
X-MS-TrafficTypeDiagnostic: CO6PR10MB5460:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB54601D7A67E092F538E7D45A8EEF9@CO6PR10MB5460.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ChrcCteNxFP5LcQ9jFpx2F4BzEr0/fHNU8kFcUCFNPObWrOUhxz2nd7mDHQf7f9FYQ3ixI7U6B4M8blTKoySArpoISW9dBts8y/8cRcNiN5479UNE0DJRpxoeQwgV4aqv/S+EzOVvDmRDoMr7UTltp25TLvkMlHKwduEpMfnFzyCorBR8F6VYoBKoEdI3E+qCDCdJPg2AmeeUsSQk+TOOG3lZctpnDs5JeaH3BU6zEohKWN6BAUZQf+6M1E9oFkqcH01bgY9TXhWmHKDF6dMvlOirAqxYC2q3V54g48GN9rpnyC1M5RXFDAzTtkOsWReUTy2k5vsfLGm/3yE2fp0nLijBULs1hlSzMUKZz7zSht2C3IFduV/6d9A3kb8bTAb4VQLNrcbKDxUxUdEe48P9v818Guqx1BLGSxHtpbK8LLVAzRfSXK63oGAGHr9zg8zQPf0Smbus0lf5dZ6d02SzFuY9236LYh8z/xOaWUio5QH3UZbHxPvUGlF4XUYOa5Ew03jYKfJzJHoFdhrAicW9EyGIRmjwy2NjrEtEpwyIJnHrOmM+gLjdEJEiiOiNapior5GbEuQEo3qc4LuYThbCTRTynzlCLAHhXSI50R5vSfg/bLRv5C4eq9My3k1B6xUOjdOoAbNl1dUDV0vRC/k49YpKs1ZenWhUXt5umb7d9UXbA3P21qLZ1yDXa3NBTCjPxI+JoBjzHjyiTkBXmc0xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(396003)(39860400002)(136003)(376002)(55016002)(8936002)(44832011)(9576002)(86362001)(66556008)(9686003)(66476007)(38100700002)(38350700002)(4326008)(8676002)(33656002)(5660300002)(6666004)(33716001)(2906002)(316002)(26005)(956004)(53546011)(66946007)(6496006)(186003)(52116002)(1076003)(6916009)(478600001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yNNGzKjmfjp4MG0CE1tmlAG7/xoUEGo+cWJDO5/5l0Ra+M5JfkIFH3/X75Y6?=
 =?us-ascii?Q?OmQY7EjBZ3lwd2UTKwK27r8ZKTIq6u1YafDP56iqq+AM/D006Fp9TfMl6y8m?=
 =?us-ascii?Q?CfGt72swl7aQkeJXzgsbSB9YtVeVebJLP3kAe3FoxZ2kQqNUk+N2bJ4aCj5m?=
 =?us-ascii?Q?m1actPqJ5nJ8opp6SdC8Il6k3EfkzvBdH4Wl5rTe1DjrsuJtqxFVWKQmQEAY?=
 =?us-ascii?Q?CUC3fdSd4lxeqSNQ8+UInvvJ21l/S2CgSj4cyzZrzbHPyuEhxCApqtJZWu5M?=
 =?us-ascii?Q?hOCZO5yoE1iub3jSeOYOk1TkS0x3DHv5q8BklaMupJIIwKO4cTGs91qCUT5l?=
 =?us-ascii?Q?F7p4KcKfnYgVEA+4hYhqsMGPGaPdL6awNb6NNBJuK6tsVMCVTYs4BlqQvegk?=
 =?us-ascii?Q?DF7Q0RT6a7+R/Wym1I7veMSsIVoL0KRoIsz3z/b5At6jD6HJfGV33tSO0vl9?=
 =?us-ascii?Q?/GjUU5hiCMA1y1BifXXm1MUOU6/cYx63fNJL1G5qqHHoJixl1P7z9lBzxH5x?=
 =?us-ascii?Q?lGqmwthXZ0mOgiTwBHGXRlsnp80yxSFksFhDjqAS+Aq8v3qxbuDgIqq+N20a?=
 =?us-ascii?Q?SV/LJFhMzDG4qA7tGZbzhqnxZBFN2vc8Be7o+U9EOX97syev9wpSZhU6kSnp?=
 =?us-ascii?Q?kpaffGz4voHTiCmxGvMdiPbeSl2L4sjtHqtwkmwXOeYgKBdbbdtbbaeaC4cw?=
 =?us-ascii?Q?hOqa0R1SZKjeW8orKjW1S5CWChXATpffTPvRESO8SHpAsm5DtamSPqrjxtNf?=
 =?us-ascii?Q?N1f7SbIlFEMsHNWprL07lF92p/vme9edo5XKs6c5ce7uwBKk9CotS1eyuApj?=
 =?us-ascii?Q?UypDOeQj56HEgq5kemH2U5IvoAZsYUYcURSaj/zr5pv8G0wPn4GYfos5laSA?=
 =?us-ascii?Q?KmDZ9nq7pjtU6vyWnR1dywoW7omogqfFFPGO0SlDxEyB3H9qvSpuQW0RVPFa?=
 =?us-ascii?Q?cYKRnNnt/RDNo2A2mgU1lGkf9GPYw/7UJNU3ckN09fb/Zf3Mt3g5DoL3qFX3?=
 =?us-ascii?Q?b8W0YsxrlWg6k9ueOiZC+6O3tWjktOa9IvtEOWcIZAHXx2DfpE5P6Wh5j/XA?=
 =?us-ascii?Q?twvSaVUQFRrAqol9om8hFCZnstx52gI8/SCxhcS9iR0zLhtRiWmyNMxh9E4Z?=
 =?us-ascii?Q?xCnvpDAiJM0H0ErqLxXD8ytQ7G/zUO3FzuQaGP8Pdxe270Muhk9TeegnThzk?=
 =?us-ascii?Q?0cDXzXbnlPC0QIpzr/ZMc+57PrIfMqTEX6UM/RdKDV2ngKZcvoSCTd026Ban?=
 =?us-ascii?Q?tMIqY4XAW0kRvxhGN02dJWp0CElbgUWzzgs6t8+LyfmP56gqCri3ItveiDju?=
 =?us-ascii?Q?IwPthxmVz6voFaBNKiPDpfD4?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16dd264b-0841-4eb4-b773-08d955b25167
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 12:37:41.2494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXJ9DBTUVErvJria/i3HTmZMGmqOZNIddFv8G+Ti4OVijSwtDdKCLtTd39f7/ew39O15b7WGSd5X65Q/17QQAdM/5WuNOpsL8wLf1FaL1Dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5460
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10063 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=938 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108020084
X-Proofpoint-GUID: 89x2NZQ0flT8nYH-qS4A4byBxyMXQkH1
X-Proofpoint-ORIG-GUID: 89x2NZQ0flT8nYH-qS4A4byBxyMXQkH1
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Sat, Jul 31, 2021 at 02:36:03PM -0400, James Carlson wrote:
> On 7/30/21 1:15 PM, James Carlson wrote:
> > On 7/30/21 4:48 AM, Dan Carpenter wrote:
> > > > --> 2840 		ppp->nextseq = PPP_MP_CB(tail)->sequence + 1;
> > > >                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > 
> > > Here is where Smatch complains.
> > 
> > If that's Smatch's analysis of the situation, then Smatch is wrong.
> > It's a bogus warning.
> 
> For what it's worth, it's not my code, and I agree that it's at least a bit
> hard to follow, and may well harbor bugs.  If you're suggesting either some
> kind of suppression directive (I tried looking for some Smatch documentation
> but couldn't find much to suggest that's possible, though I guess now that
> you'd be the one who knows for sure), or adding something like "u32 nextseq
> = PPP_CB(tail)->sequence + 1;" around line 2795, and then using
> "ppp->nextseq = nextseq;" on 2840, then I'd be in favor of that, at least to
> make the tool happy.

No. No.  Never change the code just to make the tool happy.  Of course,
I misread this in two different ways because the first time I didn't
spot the break statement and the second time I got skb_queue_walk_safe()
and skb_queue_walk_from_safe().  But it's not really hard to read if
you're more familiar with those macros.

I've investigated this and it turns out the problem is a kind of known
issue with how Smatch parses lists.  I've avoided fixing this for years
because parsing lists correctly will be a big slow down and it's a
quite a big project but probably I should just fix it.  Maybe later this
year.

regards,
dan carpenter



