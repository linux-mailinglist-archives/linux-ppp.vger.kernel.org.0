Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC5C3DD4DD
	for <lists+linux-ppp@lfdr.de>; Mon,  2 Aug 2021 13:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbhHBLn6 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 2 Aug 2021 07:43:58 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:57260 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233382AbhHBLn5 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 2 Aug 2021 07:43:57 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 172Bflih019401;
        Mon, 2 Aug 2021 11:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=EKDoR5Ryw2qkFglTNBAjKp4qZOMsLWeNsl8y1yMq+QU=;
 b=VwIK0qI+P/mc1klH+5AVjqkeNR07592AS3UH1qfY7xH08Q30NOWu43IaRrXKs0c8GCPi
 sgHrm43Yg8RqM519gKi++Duz+67otLM0UXY7G8N+z4ltSLqb7EFhdtkL/oOfpghLaUW8
 wo4uK9tSUW4wXDTldfPXka5NwyQ40NBBEHqdwsii1BJjVGy7Z6T2Nk3SLCkHSifBPZEZ
 AqkCjMUj0ifXuGkri1m/LQVHORdre9358w4NybD9CSrGqd3Dkjvg3rWH35bFP9AEZtWH
 wsXUhHZOVxsyGo1vvdNvDV3Ty8XdjafaD+M98Y0cmyOCsR/euC0No8UQrLtH6DVMc8kb Dw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=EKDoR5Ryw2qkFglTNBAjKp4qZOMsLWeNsl8y1yMq+QU=;
 b=gCZCZI4tpDUDsrs1zJ4MKIEVcKSZggrYKTgDnh/igia8D6xtv4y+cmNd6EpVz1xQgRZA
 TRy1H1qZ208k0ABxz0f5nlmRksxkByz6Xn/km+dDZy3juTN1uVPpYD4Xp9EJeTXv7vem
 rdrcc2MVaZOZN9P6BoS9GwQnvEQUxgvhMS8FcPbjaGy1tnBMkUv20E1WmdZBkQ8gt2SG
 +e7Csb5XNn0m/HhudhyZYMyHY3KahTjyuVMlyp8F6I6+bWEvmzSAsn9BSP4qrtgqXNoB
 8eXFfxfb6kBEBuY0SQYPRPsooGn4mGimo//ilrNXBbMjYSXUrFOLvQAR2WfwpM6fEZrw pQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a5wy1hamp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Aug 2021 11:43:44 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 172BfDxS042627;
        Mon, 2 Aug 2021 11:43:43 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
        by userp3020.oracle.com with ESMTP id 3a5g9sxm0s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Aug 2021 11:43:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3C7KsXnTqyNY2VmjU64NO7ZI5B3FanBK1hZ6WIbbi+kDmGSHzEIWO/PADWBC8kJ3InaVzj/W+GYhIhCsYVnTEMKup3VLWhv5/qXLcVKsSORnwzuTUU3ids4zN3NYEXSsY5OGHhGvbjcJVlgmP6My8v1COKbd7e8D82BTExvI7fToG+c9TJm4W5VGR0QnN4oU9QPCbfxzLdDKyQqU18O3z31YbTJTSZAEXLq0nMW6jHCWev7gXiBJcb/39F8Vtg8nZ6myLLqai1PoylQKrL36InM/BgbuPo3x1EWNu/Ag5pcBvg/BGNoKKCcW/nLmUj1eKJIFd+NIPHuQVMIGzz2kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKDoR5Ryw2qkFglTNBAjKp4qZOMsLWeNsl8y1yMq+QU=;
 b=ULGGjyHIMjtSxU1QrR6+/ek6t+ItaGAN/QK33yGEcunmSGztjtbe5UPdKjQQnu97zEH1DFfFk00PeOgGJgjg8EAaqEiCth/Y2ab2Rc2VXK3Lxm68V0+qg1qByTk7ZcHcLTnUn8UH75jMpHXJIHu5gaa5PUfm6d2KoJlgM22JnFsSDL+xN5YAnAvYyTwP7kgOGhk65INSKCB7bxHGJLJhZYIfJZxSMe4A3o3b5Hik1COrQ4q7DTElIEBdJpUHi3PwH2VYnnD31NwLw7BTkJ4wb5i9yMjD+PfdISaJYBKE2AlXXYxwS96hdVw/a/hKyqkek8BiF7b/+XKMM84Pt1cjrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKDoR5Ryw2qkFglTNBAjKp4qZOMsLWeNsl8y1yMq+QU=;
 b=h9LYenkGcNkBicj2vBu3x6Um6VNGFSjv6IIu/gxgtQI9b52HmxkeQdOsiTB1FyiVhJ+wiePDFSflpltvpyBSmsTz777UzjUtOPmAQ6MQHuYKLIxbDWzRnyOcjy84EpRL/i40E7F5U/U68XD6jDrB/9bjh/MPE0B5zwlpaYrQADU=
Authentication-Results: workingcode.com; dkim=none (message not signed)
 header.d=none;workingcode.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1902.namprd10.prod.outlook.com
 (2603:10b6:300:10d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Mon, 2 Aug
 2021 11:43:40 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 11:43:40 +0000
Date:   Mon, 2 Aug 2021 14:43:21 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     James Carlson <carlsonj@workingcode.com>
Cc:     linux-ppp@vger.kernel.org, ben@netservers.co.uk
Subject: Re: [bug report] ppp: fix 'ppp_mp_reconstruct bad seq' errors
Message-ID: <20210802114321.GH25548@kadam>
References: <20210729141617.GC1267@kili>
 <20210730084833.GD25548@kadam>
 <6c6f81af-db62-6644-117a-3bf0a1d62087@workingcode.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c6f81af-db62-6644-117a-3bf0a1d62087@workingcode.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0009.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::14)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNAP275CA0009.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 11:43:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88dc877f-1e94-4ca5-08bf-08d955aac5be
X-MS-TrafficTypeDiagnostic: MWHPR10MB1902:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB19029A85869DC07591AAB3618EEF9@MWHPR10MB1902.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SMdJTFlpkXwmNvgcP+9QZub7GEuVsuBlfUI4V5CB/Bd6Ijnf+3BizyekWYgnocOgUU3wlksWcqNtYbyKYs5cPX7aIiwkg3EmbwYTK7RWwSrhw7Ph8qJegspcH25beJwv5YWl6AA/kepJi/iWgxByQ+04hJV1EgBxC4LZ9iVk8gnTWX5jMDkdi6lnJ+IMY2LW42rskF5nWSLI1KtO+kp5ID4XkGCWoM1Zlqty+JqaeO4m2Z8CId1xK823Jrje+gMl2pqu7o+Das6V4zPu6uNrqVPOgcxFGlKLXQk8MVccw5MLavhbNfmHQPqhdGDb6hxbirH/o3XMqVtYk/bFohL1tAdR1/QFDwGfx1EEtglcHnsCqK+h73VCTf1GiWIN7utkjg+66BcN5hmIx+KrGwuQHwpA6WxazWZOqCn8Fup19lwCKboyHNKaQzAj16wH5OIQK11v4Llqe8YCi90CjmIsRFp/ez20guIfdswLiBTzySt4gjGcf+h42vTJrC3+CJdZ8aFyqt5OHgukl2NzH0Cjh48s7Q/PZdt29TjGrE6DtSO5HleVTXkhrwTJcmkXFOOkFKICFTMZ/nBal/tX+WuuPZpco/eUPtzbuv4YC7zoE8bajLxIl6mXc9iv6BM/SskDAtF9KrIV7SUmtEoxt8rizmxpnJTnplrgIQd/16lyS6tgM294hhRHP8V24cBnPn/g
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(66946007)(66476007)(6666004)(33716001)(9576002)(316002)(8936002)(52116002)(66556008)(4744005)(86362001)(2906002)(6496006)(44832011)(8676002)(38100700002)(33656002)(9686003)(1076003)(55016002)(186003)(6916009)(4326008)(5660300002)(38350700002)(508600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?na8PQVwuroe8dAQ8Ckyj8mve7w2MHJsdZ6bk6tnwBCYarqf68CdQSj6BvbvE?=
 =?us-ascii?Q?2Kk+dQJdGHxwnN3Sf4Dlpnl8wokEx8VsGxBW2oaAQKebWNWJKCp+0h9Mr78c?=
 =?us-ascii?Q?2FjzoMmoe6Ub8B2WI1lRByXtYuRMDfyXeLFd0gQPB+98vR9ZKstuhyoToZ6B?=
 =?us-ascii?Q?5qurNh/PUhgsQpcRqhIw5i2FeFnE/UJdJw4eUyib/NRlFaQn5973TU1CpFA1?=
 =?us-ascii?Q?y8fnWF6S5HrBXqKmIAsQYM3+Z6QuhEB2EchMioATf7Jy8YT65qUfS9NckxZ4?=
 =?us-ascii?Q?7+MsoxWRf5WiTZLnUQCmyQ0KZ4rcM1NY/34z+pdVYqAb+Ue5moozfwMJrQwq?=
 =?us-ascii?Q?ER/3oJ96Ulj2+yyzKF7SonUvJOlPMWe4Yu8p4DXfFWjAAhCTgQ/VDYQOxiYu?=
 =?us-ascii?Q?kC5oRTxEvJlzZnBWA1tvSwLNuU2pL9dJHkFPKxLRYOc1Slq2pbsl4JUnMUAx?=
 =?us-ascii?Q?GWrqiQzmobjqOp3y0ncvUb8/LIDrYJY0rFyPPpb/wSJHOmKmji4BXu38D40D?=
 =?us-ascii?Q?axsDr+xDXrN1fN6s4wJQgGwlB7MKRGu2sFlVzVJHDboepkmteRT/1bwLZzOT?=
 =?us-ascii?Q?xUBOK+ZdNJ+/ZDNO1qThgDy4OG/cpG3Zl7/t1Nxaw6ylb+5RW3iFuVhiJ1m9?=
 =?us-ascii?Q?wzLdH2mIX1iptGyZJc4bvMwFejtOa2smEaxOjElpGPq6X0uoHzKvu1q2spLZ?=
 =?us-ascii?Q?MaOWnE0e09S0Phr8lRx0i7VQSsi5RMxbcEutjIK6GlG6IscuUlRel8eYqRKz?=
 =?us-ascii?Q?KmfaUQen6uhTIMktA2ylZhTXLYXYO740PECprhFw65nanLUA9d7joCGl0dJS?=
 =?us-ascii?Q?+noS6eWpSB1TYzBX9DNt5u/+jNJx+wX3VVXJFhjxUtCxcBLEKQhEfRkXnhr3?=
 =?us-ascii?Q?z/cvMDreZTOUXTG6wo0eSkWppj50dA2C1pvCgi75y9oyV3W2matsIZoEewOG?=
 =?us-ascii?Q?cFvVEIgE5BHvwJX14MIBWNlM5+8XFw7x02rl+HuzVPf7VmS5SL+Zv9/aWlQE?=
 =?us-ascii?Q?4u8ykYAjY79zNbgDrookIoW5YQs28mMqxDEk7Jpx1WXVuoP/edNBo4PoIw5W?=
 =?us-ascii?Q?cvd5qGs+ydBs/MPgMayy8e8nsxSgz0H9a0C21h/T5L6zujjl3sRCa85LCWg+?=
 =?us-ascii?Q?IqU5Ojucw6taOlmrL/8/WEXSSTRHf1cpHTDiz1qgA9LfysTp41nsWjzDnyuJ?=
 =?us-ascii?Q?N4dX4Q9zKrA3iNR6Tz+MTqRUb7oPGTDGqZ0AVxdaDpVq/wrCMIJ7y3BEfyQT?=
 =?us-ascii?Q?8d58DSCAO358GPGdy//5nt+dPn5AZYq3GiQOZwSuc5uxsYNBqaYC13r1Mw/y?=
 =?us-ascii?Q?f7lRWU2Lff/LBE0xlGOsJ6g1?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88dc877f-1e94-4ca5-08bf-08d955aac5be
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 11:43:40.5429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yp8eK4OG6yVXKcm0ZR5+WeB/40RhMWOohFlXqsoP9sws5ezo21DTrTSNzNeTldTvI4/wyD+hc1Th4DnY/WAsbWKynLUiKr8GTWTR2wkAy0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1902
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10063 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108020078
X-Proofpoint-GUID: Hb4iwQz6YtSmOpch_NyLQX1X3hviu8LV
X-Proofpoint-ORIG-GUID: Hb4iwQz6YtSmOpch_NyLQX1X3hviu8LV
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Fri, Jul 30, 2021 at 01:15:39PM -0400, James Carlson wrote:
> >>     2798 			skb_queue_walk_safe(list, p, tmp) {
> >>     2799 				if (p == head)
> > 
> > One of the weak points of Smatch is how it parses lists...  Also it
> > doesn't have any implications for this if (p == head) condition.
> 
> This is where things break down.  That queue walker macro on line 2798
> re-assigns 'p'.  The code marches over the list and says "anything that
> still exists up to (but not including) the head for this completed
> packet is trash."  Note that *NOTHING* here is harming 'head' or
> anything in the list that follows that buffer -- which includes 'tail.'

Crud...  I can't believe I misread this code twice.

I'm not actually sure why Smatch doesn't get this correct.  I wanted to
blame it on the new unpublished bits but even the published code is
buggy.  :/  I will investigate and fix this.

Thanks for taking the time on this.

regards,
dan carpenter

