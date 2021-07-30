Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE98A3DB52D
	for <lists+linux-ppp@lfdr.de>; Fri, 30 Jul 2021 10:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhG3ItL (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 30 Jul 2021 04:49:11 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:9994 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230456AbhG3ItD (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 30 Jul 2021 04:49:03 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16U8ePIP017600;
        Fri, 30 Jul 2021 08:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=1lEudEpuBvzUxoy97yDVEKOo1irsJ/z/fG5IKwXNm7E=;
 b=SZ1soxhfPv/265deACVIT4Yx1MKWrTb6fZ+W4gp3q2fic+UuWlOGYdjeIVySDhSIZcO5
 3Aq4ZBsElJHd8dJC1eg0LbxpHv4w6JP6yijVb96MvFeJS7tK8Gg5f2ShFn+uRO2Mq48L
 CTVhnJ//nn7eceEDu3fzD1TSe1bp48Efi4Dw3KvC0UEplEA1MigvySJ3iNEW9kpvcNtH
 8RwBLxy36FWSiC7z1nvfy97KT3JnBHAETcMuIwn9jdepWWvo6ybyAuG5et2LoZzoE2st
 6BONztpmiJgqZiwBBbgMZ++qhdlbg5nwJ7dHe6uwfYs9plyUTByzQy/SMH6pmEmd3Po/ Vw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=1lEudEpuBvzUxoy97yDVEKOo1irsJ/z/fG5IKwXNm7E=;
 b=AHbqjSdvuZ98wMDlAKiWa0PD5201ffwYllAec9vQ2nltCvmTCZ8wx8fOR/fpb1NNwHKV
 RDRvps/28yOU42sAcnVfY2F1mQmLTUF/D6yGRnJ2KxUfeSNS3w5bhSHW0GlkQ780PJIq
 JizVG8gisWotpCVAhS0MvAx2YbIplA4XhglIO/OL1cgyISet2gdvtLlnZshllPBzXQOp
 VFfo4W3rRorBQWMb2DjjDxvaa7CWb6QtYROtgNtXo4JZiPrXgwpCQq4sBj+HfHpboFpm
 E09SjY1ZCUgliVtjbSXs9TsfXYovvdo5Xlt0rGp5xNByOmCmxuNBAGZVWPIXM5WR2RZi Dw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a3jpd356e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Jul 2021 08:48:55 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16U8faCl119896;
        Fri, 30 Jul 2021 08:48:54 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
        by userp3030.oracle.com with ESMTP id 3a23595dvu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Jul 2021 08:48:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJhXRxBpJ2fWoCsnEoTX52+P8mYVreYgeuKarxo1oiwqVZpWXtrQVjWHzanseNU5mkn60XpByn1rLO0rgxsJ3mBFNaSMt3y9hrs1Zs2xtn8Io69zSWRCHQKszBB5j20EHV6GYAxcFEM4UokpSemGFaxGIV5DX/hpID/UX66o2oHbHzmBJjGLO+FkGLiGA9jpIPI8nwfAUblT5IGSy2dEwojn74NNV3cfGHiBqsbZeSrWMUqtvuMcFavl/3cYXzfkcqle9F2AYxQXtaMyljpAPFO1a/E1A3vIWPNxPgzdLzFFHcWlsih64C0ceqX4Rv2geJV7fDpN2T6wv0+UER8Prg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lEudEpuBvzUxoy97yDVEKOo1irsJ/z/fG5IKwXNm7E=;
 b=MgZIQ/u/U27wg39RdOa7LHmO9A1xPhQzpTZosH9O1oYnmmEEXMMxrwGn51P4t8AuZkm2xJtREvHsQNal/51qn9Q6qlktqjfLdXc0YLxz98OGihfKZ+O67qTKzfaP4n3Et8pL9X7WunEDNrbXuYKEMa9on6WB4qGYMwR3PJ778OX1bYGcyRYjPLGTEpJ3iE05yi+7HGbjBw+NL2vr8W22lWiPTvcCK0zO7c2CWGbXYGDgO/SEEw2jTIV88pnoaZlryNiPxiAe3clTwG+qAxk9vkhcb+Z0EMRIZhvBw+mVG/dnBUspbWx2FkbWL7KzD5kTd2xx2LJfZxNINvDKs8Sqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lEudEpuBvzUxoy97yDVEKOo1irsJ/z/fG5IKwXNm7E=;
 b=xju7v1iW4vrA3cwkLCpi53mFTCxoxuRUI0Z6nRjyDcpDVhodciUDV3H5S5coEwYvbLUqhAPC0vC3Uoa63oc4zwrAUZ0dDhvF141AMH/ybMGd0ICzl04BbjH1R+yQg0rDX5AWh8nOHKoy0dCkDOcmMrlY/33HUrC7POQEEiX9arY=
Authentication-Results: workingcode.com; dkim=none (message not signed)
 header.d=none;workingcode.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5572.namprd10.prod.outlook.com
 (2603:10b6:303:147::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Fri, 30 Jul
 2021 08:48:52 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.035; Fri, 30 Jul 2021
 08:48:52 +0000
Date:   Fri, 30 Jul 2021 11:48:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     James Carlson <carlsonj@workingcode.com>
Cc:     linux-ppp@vger.kernel.org, ben@netservers.co.uk
Subject: Re: [bug report] ppp: fix 'ppp_mp_reconstruct bad seq' errors
Message-ID: <20210730084833.GD25548@kadam>
References: <20210729141617.GC1267@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729141617.GC1267@kili>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0015.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::20)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNAP275CA0015.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 08:48:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0218676-a46e-497f-cb87-08d95336db01
X-MS-TrafficTypeDiagnostic: CO6PR10MB5572:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB55727A2BA89E95668C307D568EEC9@CO6PR10MB5572.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t0iWM6j0KZZQBYbfbM05l8HSou7LRN5hT6UCa0uCeQwBZuMgv0ltKsGVD/lXGoKjxtUlmsR8nsL3YrstAHW8JpOWcge1bYdiXqtY/lsAnBQ+RiDP28IVZ17APgl2P5r7mBZqOD6kdme5xsdBuPwPAZuXJ6PdnR9jdwl3UfPRu6eqD9rjnkUIEowMGPRIGxeCXyRuY4NKwfqxhzRGocPfEwC+zkpZs1ir+vkOvwMLHar1CnfRhGd2X/ztkoYgXdCk2KTmYJii4rllzmoaNQM+edu1D9I4HWcSH3pYOVQNE1BiTySRkjYGvwuzBeaCJXvlVMRbxh22tsoI8YKG8GuwYBXixGi8RDbvWpsb6sQVpfTIw0itc1JluAfM0p+b0xnZ3nZQSieSNcMwCLdu1tUM76IhyQazcaGS5DIkSGuogZmP78o9e60RBv9wmKLlcKbsjE3gI7jMc6CXs2TY+2Sv3WH9ys5oycyTa8XEupDwCJLhyjm7LEQPw0I80cXd4fbUfAnIDy41a1qKNMJ1+m176ec4uYD4fSdiHI/ZLtySqvx/D6L5Z2o0Ctz7rcWJYmdKB6wb9M4tjahVhDIYNn/A7YtPzpuLU0vXbxCoLT3OsrTDz4D5tPZ9b8IVLvGev5uYSOBlUdWgJgHUV+KoMjqHEM6T5bv1h+ckh0CgDoVfX2bmU+8VVlGY8LGOW17g8lYCHjW7Ir8rwnFUH4Q5P9VhdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(39860400002)(396003)(376002)(8936002)(6916009)(44832011)(956004)(8676002)(4326008)(9576002)(316002)(6666004)(86362001)(55016002)(52116002)(478600001)(9686003)(6496006)(2906002)(33716001)(33656002)(1076003)(26005)(186003)(66946007)(38100700002)(66476007)(38350700002)(66556008)(83380400001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ppyiYML+2JIPPGZi61O81B25ZWN+DA8kFX2X2HylYEXRO3zKlpH3wuTisreU?=
 =?us-ascii?Q?GThdZ9T2Ny7JDew7qhEIEZrO3uXlGJWIbmtJhLJnp6T1RGAQizYFQVsUJBZp?=
 =?us-ascii?Q?m/vzxYLfTmJ8QPhwIxso620+vEhxLbdytlAiYgRIRdkD0dNk6XRmFaRK45DB?=
 =?us-ascii?Q?mOey7Uq7k8x5qAqL8xgKGKttwerWcPrz61EG/Zs8439LXTbss39CdmF+QUWL?=
 =?us-ascii?Q?F2oImAGSKwHyeZ79IwiYigc8G7yNJsf4kcaL1DITGcen/VPZyqSs7uEuuNV7?=
 =?us-ascii?Q?nCeLhIHpZaE66ILFux2KGbPjxTvjccWogSa15bwqpx2yMhsX5siPxB9I+xNU?=
 =?us-ascii?Q?sYaJTxoqHb2jdDIdKtkqyrBpk7ZvaxuUgUN5LOXG2aIAbQYVcer3Xp//OHkI?=
 =?us-ascii?Q?2a4bM8/0EeGatbJjYCOA+QidVh3vEVPHNZazwxXysxGf5rkzof0JurdaFD3Z?=
 =?us-ascii?Q?OmwRrHSkWQfbFQTRqVoxAdQtV6jKo2NcUBJsmkRE1yHbCyhaxMI2GHzAGvv0?=
 =?us-ascii?Q?lKi05IBZMIp5qEIg3bU+oypropmjUKa1u+gFrr18C3orZTnB96h4rufVR6Fd?=
 =?us-ascii?Q?R6XJtGdtTvusGNY6aAgkdVf8zyZ6Tx3PA6hZzaiRVCC8eycgt8XnnqsGOaPQ?=
 =?us-ascii?Q?2e2Y225uNpuAG4FP80k0H+6LYmHSK+eQfWBGU1wQAf0aWpCEh3ywNNSUxOLb?=
 =?us-ascii?Q?E1P4Of2sy5Xw2h+UsSOmvQPHJICNuxMkjFSvDN+OVO6R4nGF0Aa0jF/5GpKZ?=
 =?us-ascii?Q?vwbjwosRiKIz62qMwGBvveSZBr5q3dJWN1fsjeCPuE+EHB+90ybXjkyoDfSc?=
 =?us-ascii?Q?iwTFAZIYx/nfQU85lnaukPbL9r7GQV9c4UL+37I/bKD7wMvlJMr/WizSi+e0?=
 =?us-ascii?Q?pu3+iG4CFeddZZLFYGmjv56o04vihlTN7xBNTIp2vYKaDHDLpIa8Zt6547Pl?=
 =?us-ascii?Q?NZVNyxuEf+BNNMYJ+86d2NIS5YtggVPBMdhgn2NEFmkmEIBYijlV+29BcJsS?=
 =?us-ascii?Q?Ft6cgs7corJuL9Vrz/G5PKdVH/38ISZ8y+Y2/2KTpFqE7/5Mn5QlfGulIilw?=
 =?us-ascii?Q?BCB9R2QUsB+wtmq1qzCzU0g+Z8YqmLCbJY99wkTfO7ibEkNFHCkdIBokWlIo?=
 =?us-ascii?Q?QF5o4CKhCPMOUSS2EsPZwiLpY5UYtnP2Nama7EHzrtxf4hjtwVzEIfyO4VBj?=
 =?us-ascii?Q?jPUAhmI0bh63pkK8QX05C0yhfQB+IQu/0OpjSrn8VLSuG4lAFyv8yjxmG1/X?=
 =?us-ascii?Q?1+d/GO2gKB2sO88cFvogHwP3vFAVSmlY5HDA5g4Yo90PP4aw+hXSlVFFa4n0?=
 =?us-ascii?Q?KTmiZOcS5xAg7ou0Mz4fDXnB?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0218676-a46e-497f-cb87-08d95336db01
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 08:48:51.9182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYQkSlYe+/6litdNS0WphrRXejxowpjMzUCkqkL6IkztOxfsCylLcm0wvNIGTTjDlGFaIjRGcJnkTpQ2AltHTgSYQRafQTOi38myLhae8dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5572
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10060 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107300052
X-Proofpoint-ORIG-GUID: P8x16le9PRiZkNMaXhSCQ-OM4sbx3PZ2
X-Proofpoint-GUID: P8x16le9PRiZkNMaXhSCQ-OM4sbx3PZ2
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hi James,

Thanks for your response.  This is a new not yet published Smatch check.
I reported the bug wrong, it's complaining about the other kfree_skb().
See below.

Smatch understands about break statements.  :P

On Thu, Jul 29, 2021 at 05:16:17PM +0300, Dan Carpenter wrote:
> [ This is ancient code, but the warning seems somewhat reasonable and
>   hopefully not too complicated to review? - dan ]
> 
> Hello PPP devs,
> 
> The patch 8a49ad6e89fe: "ppp: fix 'ppp_mp_reconstruct bad seq'
> errors" from Feb 24, 2012, leads to the following static checker
> warning:
> 
> 	drivers/net/ppp/ppp_generic.c:2840 ppp_mp_reconstruct()
> 	error: dereferencing freed memory 'tail'
> 
> drivers/net/ppp/ppp_generic.c
>     2692 static struct sk_buff *
>     2693 ppp_mp_reconstruct(struct ppp *ppp)
>     2694 {
>     2695 	u32 seq = ppp->nextseq;
>     2696 	u32 minseq = ppp->minseq;
>     2697 	struct sk_buff_head *list = &ppp->mrq;
>     2698 	struct sk_buff *p, *tmp;
>     2699 	struct sk_buff *head, *tail;
>     2700 	struct sk_buff *skb = NULL;
>     2701 	int lost = 0, len = 0;
>     2702 
>     2703 	if (ppp->mrru == 0)	/* do nothing until mrru is set */
>     2704 		return NULL;
>     2705 	head = __skb_peek(list);
>     2706 	tail = NULL;
>     2707 	skb_queue_walk_safe(list, p, tmp) {
>     2708 	again:
>     2709 		if (seq_before(PPP_MP_CB(p)->sequence, seq)) {
>     2710 			/* this can't happen, anyway ignore the skb */
>     2711 			netdev_err(ppp->dev, "ppp_mp_reconstruct bad "
>     2712 				   "seq %u < %u\n",
>     2713 				   PPP_MP_CB(p)->sequence, seq);
>     2714 			__skb_unlink(p, list);
>     2715 			kfree_skb(p);
>     2716 			continue;
>     2717 		}
>     2718 		if (PPP_MP_CB(p)->sequence != seq) {
>     2719 			u32 oldseq;
>     2720 			/* Fragment `seq' is missing.  If it is after
>     2721 			   minseq, it might arrive later, so stop here. */
>     2722 			if (seq_after(seq, minseq))
>     2723 				break;
>     2724 			/* Fragment `seq' is lost, keep going. */
>     2725 			lost = 1;
>     2726 			oldseq = seq;
>     2727 			seq = seq_before(minseq, PPP_MP_CB(p)->sequence)?
>     2728 				minseq + 1: PPP_MP_CB(p)->sequence;
>     2729 
>     2730 			if (ppp->debug & 1)
>     2731 				netdev_printk(KERN_DEBUG, ppp->dev,
>     2732 					      "lost frag %u..%u\n",
>     2733 					      oldseq, seq-1);
>     2734 
>     2735 			goto again;
>     2736 		}
>     2737 
>     2738 		/*
>     2739 		 * At this point we know that all the fragments from
>     2740 		 * ppp->nextseq to seq are either present or lost.
>     2741 		 * Also, there are no complete packets in the queue
>     2742 		 * that have no missing fragments and end before this
>     2743 		 * fragment.
>     2744 		 */
>     2745 
>     2746 		/* B bit set indicates this fragment starts a packet */
>     2747 		if (PPP_MP_CB(p)->BEbits & B) {
>     2748 			head = p;
>     2749 			lost = 0;
>     2750 			len = 0;
>     2751 		}
>     2752 
>     2753 		len += p->len;
>     2754 
>     2755 		/* Got a complete packet yet? */
>     2756 		if (lost == 0 && (PPP_MP_CB(p)->BEbits & E) &&
>     2757 		    (PPP_MP_CB(head)->BEbits & B)) {
>     2758 			if (len > ppp->mrru + 2) {
>     2759 				++ppp->dev->stats.rx_length_errors;
>     2760 				netdev_printk(KERN_DEBUG, ppp->dev,
>     2761 					      "PPP: reconstructed packet"
>     2762 					      " is too long (%d)\n", len);
>     2763 			} else {
>     2764 				tail = p;
>                                         ^^^^^^^^
> tail is set to p.

At this point Smatch understands that "tail" and "p" are non-NULL.

> 
>     2765 				break;

We hit the break statement.

>     2766 			}
>     2767 			ppp->nextseq = seq + 1;
>     2768 		}
>     2769 
>     2770 		/*
>     2771 		 * If this is the ending fragment of a packet,
>     2772 		 * and we haven't found a complete valid packet yet,
>     2773 		 * we can discard up to and including this fragment.
>     2774 		 */
>     2775 		if (PPP_MP_CB(p)->BEbits & E) {
>                             ^^^^^^^^^^^^^^^^^^^^^^^^
> 
> If "tail" is set, can this condition be true?
> 
>     2776 			struct sk_buff *tmp2;
>     2777 
>     2778 			skb_queue_reverse_walk_from_safe(list, p, tmp2) {
>     2779 				if (ppp->debug & 1)
>     2780 					netdev_printk(KERN_DEBUG, ppp->dev,
>     2781 						      "discarding frag %u\n",
>     2782 						      PPP_MP_CB(p)->sequence);
>     2783 				__skb_unlink(p, list);
>     2784 				kfree_skb(p);
>                                         ^^^^^^^^^^^^
> On the first iteration through the loop then "p" is still set to "tail"
> so this will free "tail", leading to problems down the line.

I was just completely wrong to write this.

> 
>     2785 			}
>     2786 			head = skb_peek(list);
>     2787 			if (!head)
>     2788 				break;
>     2789 		}
>     2790 		++seq;
>     2791 	}

We jump to here.

>     2792 
>     2793 	/* If we have a complete packet, copy it all into one skb. */
>     2794 	if (tail != NULL) {

This condition means "tail == p"

>     2795 		/* If we have discarded any fragments,
>     2796 		   signal a receive error. */
>     2797 		if (PPP_MP_CB(head)->sequence != ppp->nextseq) {

Smatch is supposed to "understand" condtions, but this one is quite
complicated and the only thing that Smatch understands is just the
basic meaning that these two are not equal.

>     2798 			skb_queue_walk_safe(list, p, tmp) {
>     2799 				if (p == head)

One of the weak points of Smatch is how it parses lists...  Also it
doesn't have any implications for this if (p == head) condition.

>     2800 					break;
>     2801 				if (ppp->debug & 1)
>     2802 					netdev_printk(KERN_DEBUG, ppp->dev,
>     2803 						      "discarding frag %u\n",
>     2804 						      PPP_MP_CB(p)->sequence);
>     2805 				__skb_unlink(p, list);
>     2806 				kfree_skb(p);

We know that p == tail going in to the start of this list so this is
going to free tail.  Of course kfree_skb() is refcounted and the free
only happens when the last reference is dropped.

>     2807 			}
>     2808 
>     2809 			if (ppp->debug & 1)
>     2810 				netdev_printk(KERN_DEBUG, ppp->dev,
>     2811 					      "  missed pkts %u..%u\n",
>     2812 					      ppp->nextseq,
>     2813 					      PPP_MP_CB(head)->sequence-1);
>     2814 			++ppp->dev->stats.rx_dropped;
>     2815 			ppp_receive_error(ppp);
>     2816 		}
>     2817 
>     2818 		skb = head;
>     2819 		if (head != tail) {
>     2820 			struct sk_buff **fragpp = &skb_shinfo(skb)->frag_list;
>     2821 			p = skb_queue_next(list, head);
>     2822 			__skb_unlink(skb, list);
>     2823 			skb_queue_walk_from_safe(list, p, tmp) {
>     2824 				__skb_unlink(p, list);
>     2825 				*fragpp = p;
>     2826 				p->next = NULL;
>     2827 				fragpp = &p->next;
>     2828 
>     2829 				skb->len += p->len;
>     2830 				skb->data_len += p->len;
>     2831 				skb->truesize += p->truesize;
>     2832 
>     2833 				if (p == tail)
>     2834 					break;
>     2835 			}
>     2836 		} else {
>     2837 			__skb_unlink(skb, list);
>     2838 		}
>     2839 
> --> 2840 		ppp->nextseq = PPP_MP_CB(tail)->sequence + 1;
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Here is where Smatch complains.

> 
>     2841 	}
>     2842 
>     2843 	return skb;
>     2844 }
> 
> regards,
> dan carpenter
