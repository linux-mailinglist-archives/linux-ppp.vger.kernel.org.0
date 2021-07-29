Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD8A3DA62A
	for <lists+linux-ppp@lfdr.de>; Thu, 29 Jul 2021 16:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234176AbhG2OQi (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 29 Jul 2021 10:16:38 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:64234 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234135AbhG2OQh (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 29 Jul 2021 10:16:37 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16TECWSh001047;
        Thu, 29 Jul 2021 14:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=8T9EbVH6bKF4KqUI5uz7jG6Jn1K1t3BywYCjZIG1bSA=;
 b=j3ebGFG6Z3R3whQ6JrhTAO1l7jXA1NKSg7GblIznc/wbLabq8JGIsYPzwVw5mPNoBmVv
 ZCxga7+4GS12hVpLUHWyeaX6rmrFTg2dWzZB2puvBWHZxt393NJW9+d0H2Pd8Tqs6WeM
 wfPhEj5Q3+8NgSe2i5bo920xlwk+Jbe1BrcOpGKOAAabq8huFRDzIgX77r5/RozMOP9s
 +FBZHuO5eb0X25F2cIvXg1q/Fj0A+qA3c422nmdaMBNrABQ71kfk2gJ8ce4G7jBma7G/
 DivLqP3kBKUAz9T9rkxz2v6bW1RCjBf1c6nsRQOFWtRqMsRFSkTjzDkq0/XRC/OUI3iY 6Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=8T9EbVH6bKF4KqUI5uz7jG6Jn1K1t3BywYCjZIG1bSA=;
 b=ZfHh3Z1pbErxOxm4MYrnOXEf4X+UMaq1xNtrjaKOZofNvQoRrjw5PLoxutcndIb9PX8s
 oCc5lgIxDUIGnsfPc05otUnX9AVCpB1zp0mUbuRPaIonz+mz5mqTZAOHZmvXVMqwOOze
 Viz3Y4+82aGDFZuWtvK/e/rCfHizrOiH6XMUMtafwnQ8sHAtBinEr9/TdDOmlGHldNLQ
 j1XsTOGCvdAuOHEKPuGooLCek2q5JFMEbLiddi9LHk71irGunzE9IZNGZVQuBAIrTeyy
 DAtwHM817qewj3rHoGQ+iNZGIaOxLYvSXSSRYcjFaFi32Id5jIgu5zTw3RRwqTNwwTQa dQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a3rukgsev-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Jul 2021 14:16:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16TEFb1J187001;
        Thu, 29 Jul 2021 14:16:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        by aserp3020.oracle.com with ESMTP id 3a234cbqct-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Jul 2021 14:16:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdGATzu+BiYSTwIE1ywPsw9UHja7VvPuD2o23DUJPttV+9YPVOuPAJoXDMi0e0aKFNwGQE6qjzZmiODUJSeWnK5Z4GdDgqY91Cng0kL7w6CskHir8fNG4+jkusujkHhImOPWqb/5XQsu24haWRXSdz/1qFiVIJHQ24ZEBZ72kSPMta9/Y6PvvvC6AP2qhQUPCFOjQ2Pcx9upxRHqqCJ1p2fd1SiYHUwCW5yNfkV9qvlOwAcNe9A61xZ1RdBziyZWFRMNoQPJYQ4Zjh8IE3YZEyOrjK8GKdxSmOFd2pG2BjdoOohT0IauZzqH59FH0Ul7B4NcgmaYlynnoUX3JJkD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8T9EbVH6bKF4KqUI5uz7jG6Jn1K1t3BywYCjZIG1bSA=;
 b=gu++kZPl+MQMIT1Ax9tF2hzgp2Mk6+hMhmh57PeeufyKgMheH00Q3lvJjlMu1uza9Vko+XVAbKkWTiFc+bUZOIqhxHV4s2C5d2rgR7MrZJPub8g/7/lHjWL2o5xqwbm8YffUZRDGN6OrmgvFvRqEDH/s382Vxqg0VK3ET/EWcrVvMHmKAiXr+PRgFgWsKmdMDNDvg7vY2YzZYw70xzxXU2NPowGPn7tbt7bfHwAU572B4h9ye0YhiUB2KXlM6sofKXKxQlMj7RcO+ZrDVCxmvH+qOExKkkF85Fqo4btQGBnPyuiLg5QECmjiMmlEpTHk8PzFi/CdURQ7luGvjtOniQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8T9EbVH6bKF4KqUI5uz7jG6Jn1K1t3BywYCjZIG1bSA=;
 b=hEOXFDidieGU12OBn7BBVr32QkRd9FQk6U18W2MuASuilpfAdvTA4/v5OmDpxh19l6slIsLz1hTy6qULeF62GxH5TFwbSGImYdDVPMvJRHydjHGze68HXdNskW118S+vrbg/AUNNKCA4TJRvHk3qplyywt7qpphPdgBui6tRwzM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1293.namprd10.prod.outlook.com
 (2603:10b6:300:21::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Thu, 29 Jul
 2021 14:16:27 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.032; Thu, 29 Jul 2021
 14:16:27 +0000
Date:   Thu, 29 Jul 2021 17:16:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     linux-ppp@vger.kernel.org, ben@netservers.co.uk
Subject: [bug report] ppp: fix 'ppp_mp_reconstruct bad seq' errors
Message-ID: <20210729141617.GC1267@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZRAP278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (102.222.70.252) by ZRAP278CA0002.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Thu, 29 Jul 2021 14:16:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d10f6d0e-f9ef-4cc1-0622-08d9529b7443
X-MS-TrafficTypeDiagnostic: MWHPR10MB1293:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB12933B170EFAE1C26676E54C8EEB9@MWHPR10MB1293.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vgB74zXsLth6XhI8+JXvnfp2FS7NMgaiUnlKPuPB0SV15ETpl++TeM4tZtbtzVL8WWJRTrVOoEjGK7RBhMhaBYswM3QMYBmQ5agX2SPXHV5eezl7NVr5vx8fD2hLafWUfwpkjee8l3Z+tLKpYcVqCO5qk6hSgxx20bPWWJo41nFxl/XVV4aQV/7xY95KGnIzbxB43jFWq9kU5mjv1WUX4J+QuAWFdymGamj+T3t7KuBZme7Dv2magsFiMSn8dMADqlx0K5GZQWKyD7RCLs4TptPHm46rWgruJ0g5SuTfjJGOzGLnZv8zJXcagV/kmqp+Ojn+3C2d93UdHxmALZmPDg/CFp6qWdTvvxuYle/8NzQ2oUfPlo4yXOGtCvUdyxmK/oyJXkK/U3FYHW48jqOdr1gQlA+7z+UAqAjoozTZ6kPdc6IC3Tna65dITPDRDeJ3KPR3rURlruglSBlIKwOgW3HA8+BfPkiZdKcB+Wl1pbgXFNeHm1r9t96SjSPT2zFb/iBxkoRpUhPKFx9GHDKMUXp0IgE+sFJvNQ5RvX9reNJvkquPHT56mtLQk7pinRwsUx9H3Sfo97cZ/j4Vuh0OxMdq4l7O8+obvnB06t/5LjJ84Zt0urBSNY3ayQXcgYeYwxuJXXbEmlkHwUQq+T5ssyBejfsbH4z+4MhNLi94OZKfI8GEWmjbLMTkrAcRkJd0UqB0Tw39Umgf+fHisFk5Hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(39860400002)(376002)(136003)(396003)(9576002)(6666004)(6496006)(86362001)(478600001)(33716001)(44832011)(8676002)(186003)(2906002)(26005)(66946007)(9686003)(66476007)(5660300002)(1076003)(316002)(66556008)(55016002)(33656002)(83380400001)(956004)(38100700002)(52116002)(38350700002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QteQmGRZK4edgatYMVs4RomrEkhcePx3ircr3DqEbU5wGOrNJ5da6Fs48uPJ?=
 =?us-ascii?Q?SN4kKiFFD2wp9BKltF7rX8KTpSl6MJJ45A6AGKBG8INZSG0brkrFsKtanxeZ?=
 =?us-ascii?Q?J30DU8cDVmOLNI1vLKid6M4zRPuYIE+rYtIPKgRAlnm94ZNFOFt2t5T2+WRl?=
 =?us-ascii?Q?d0hEx5OQLBo40s1q8HvteDb7umbLUC0xQ6xkZAA56LlGFBjZYDpXyajmlmoB?=
 =?us-ascii?Q?rCITy+e4//5z78u5F7obzbzquoSszCCqFsz0UcBW/yUPb9JMpiFuRBkULWJR?=
 =?us-ascii?Q?H6Ai7QEiajkD01ilff29fhPpcfDKmVajKYQhh7x7hds667Kq5wcGhx/NVp6r?=
 =?us-ascii?Q?E1Mu97583e3NTNb8HwBSoyeLBpndJb+mBH62d4uET3BSh1yAi1qlmF673dGv?=
 =?us-ascii?Q?nvKU/l+p06zWwwJUEqanrWjJn984FS5KB7wRO9YKs5mGuv3PBrEkWFy7nV2Y?=
 =?us-ascii?Q?oQtBvuGIK1FCtxFYvgxOaI3ifVLlZ38CaTVUNh0TnqJR9cCi6U+ORoZcyM7k?=
 =?us-ascii?Q?WSc2LfWYKQ40UEu8dbBTLhDJ9u7g4mkvGmBwBp++RzxkaZk3RMP5c+93uM8K?=
 =?us-ascii?Q?LcR4ZyaRJbJFfxhTWjgtAEvSp68QCN6M7KyuQ/m4eWQhAQbzHmx9cuUc//kY?=
 =?us-ascii?Q?/o+RZm6FDNHu2pX6/+gMd2/seuwds3d23YVsIihqWso0o5Ojq9HTp6Q2E7Ku?=
 =?us-ascii?Q?SKJa2v8yeYp1f9zUVz98CpXiDEUmS9EDCgPme6NYRsHACMz+7XKcvt/ZdGRl?=
 =?us-ascii?Q?U513PRp/NS00CjeNO7A1aDb99uh2TKa22+Y8vZDr8eqOTp2aAwom5xlQOma7?=
 =?us-ascii?Q?xgPpqocsGe24GFX8/6Z7cMlWQwbHwSG4AQlAlpKG/RuJGpaDHtPUcbyABDbN?=
 =?us-ascii?Q?4xsDYbNaozFCX95uuysgoG8qGivbAWw6z5Gkls6SDn43I7Qk47Y9iYt44U5l?=
 =?us-ascii?Q?5jgCxLTGMDwh2/UVyp3cAbrzIhuaMS0XSJZD5x2IIsVvt5/W7HPS6Hm9JOk0?=
 =?us-ascii?Q?xIgQQ796qmTKDcwIuRIn2IGYppg7zvymatz4eBQK/W1tq7BFXRPLjBdYgz5W?=
 =?us-ascii?Q?Zxwn+nO6GquN8udbODj1HeYKighn1xpSofuIMpK3unUlWv5BaU/rIZryWsyC?=
 =?us-ascii?Q?SaU+r9tUjtmICzvDd8xE1AShQdeOgXA8bAH5UGzInk2yP4DH1tHnIj/SffiM?=
 =?us-ascii?Q?rpxAihrQT4WEybp//qvdSzPqmeLcAcgCzwyU1xJPvkzB3fqFXB3WQCeizwUA?=
 =?us-ascii?Q?1clHJOTk9PJjRggEdny2NCLWRXfZS/B5Js7CEN2JOK3zJrnec8NTmk95GgZr?=
 =?us-ascii?Q?zd8iL93WET35o1uL4rYx9IA+?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d10f6d0e-f9ef-4cc1-0622-08d9529b7443
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 14:16:27.6512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYEjpQ6ldIVXVChGRHQRazWUbayy50CUaR8cVUgJqrTPRg6WOriFe8poyYN7Kbv7BFUTQlQ31cGqIctgrItJNv9zEnzA+ihV5rtb/D8j1W0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1293
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10060 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107290090
X-Proofpoint-GUID: 1S1HLo8sSlgk3mEaEWp95FAVClzkSDlH
X-Proofpoint-ORIG-GUID: 1S1HLo8sSlgk3mEaEWp95FAVClzkSDlH
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

[ This is ancient code, but the warning seems somewhat reasonable and
  hopefully not too complicated to review? - dan ]

Hello PPP devs,

The patch 8a49ad6e89fe: "ppp: fix 'ppp_mp_reconstruct bad seq'
errors" from Feb 24, 2012, leads to the following static checker
warning:

	drivers/net/ppp/ppp_generic.c:2840 ppp_mp_reconstruct()
	error: dereferencing freed memory 'tail'

drivers/net/ppp/ppp_generic.c
    2692 static struct sk_buff *
    2693 ppp_mp_reconstruct(struct ppp *ppp)
    2694 {
    2695 	u32 seq = ppp->nextseq;
    2696 	u32 minseq = ppp->minseq;
    2697 	struct sk_buff_head *list = &ppp->mrq;
    2698 	struct sk_buff *p, *tmp;
    2699 	struct sk_buff *head, *tail;
    2700 	struct sk_buff *skb = NULL;
    2701 	int lost = 0, len = 0;
    2702 
    2703 	if (ppp->mrru == 0)	/* do nothing until mrru is set */
    2704 		return NULL;
    2705 	head = __skb_peek(list);
    2706 	tail = NULL;
    2707 	skb_queue_walk_safe(list, p, tmp) {
    2708 	again:
    2709 		if (seq_before(PPP_MP_CB(p)->sequence, seq)) {
    2710 			/* this can't happen, anyway ignore the skb */
    2711 			netdev_err(ppp->dev, "ppp_mp_reconstruct bad "
    2712 				   "seq %u < %u\n",
    2713 				   PPP_MP_CB(p)->sequence, seq);
    2714 			__skb_unlink(p, list);
    2715 			kfree_skb(p);
    2716 			continue;
    2717 		}
    2718 		if (PPP_MP_CB(p)->sequence != seq) {
    2719 			u32 oldseq;
    2720 			/* Fragment `seq' is missing.  If it is after
    2721 			   minseq, it might arrive later, so stop here. */
    2722 			if (seq_after(seq, minseq))
    2723 				break;
    2724 			/* Fragment `seq' is lost, keep going. */
    2725 			lost = 1;
    2726 			oldseq = seq;
    2727 			seq = seq_before(minseq, PPP_MP_CB(p)->sequence)?
    2728 				minseq + 1: PPP_MP_CB(p)->sequence;
    2729 
    2730 			if (ppp->debug & 1)
    2731 				netdev_printk(KERN_DEBUG, ppp->dev,
    2732 					      "lost frag %u..%u\n",
    2733 					      oldseq, seq-1);
    2734 
    2735 			goto again;
    2736 		}
    2737 
    2738 		/*
    2739 		 * At this point we know that all the fragments from
    2740 		 * ppp->nextseq to seq are either present or lost.
    2741 		 * Also, there are no complete packets in the queue
    2742 		 * that have no missing fragments and end before this
    2743 		 * fragment.
    2744 		 */
    2745 
    2746 		/* B bit set indicates this fragment starts a packet */
    2747 		if (PPP_MP_CB(p)->BEbits & B) {
    2748 			head = p;
    2749 			lost = 0;
    2750 			len = 0;
    2751 		}
    2752 
    2753 		len += p->len;
    2754 
    2755 		/* Got a complete packet yet? */
    2756 		if (lost == 0 && (PPP_MP_CB(p)->BEbits & E) &&
    2757 		    (PPP_MP_CB(head)->BEbits & B)) {
    2758 			if (len > ppp->mrru + 2) {
    2759 				++ppp->dev->stats.rx_length_errors;
    2760 				netdev_printk(KERN_DEBUG, ppp->dev,
    2761 					      "PPP: reconstructed packet"
    2762 					      " is too long (%d)\n", len);
    2763 			} else {
    2764 				tail = p;
                                        ^^^^^^^^
tail is set to p.

    2765 				break;
    2766 			}
    2767 			ppp->nextseq = seq + 1;
    2768 		}
    2769 
    2770 		/*
    2771 		 * If this is the ending fragment of a packet,
    2772 		 * and we haven't found a complete valid packet yet,
    2773 		 * we can discard up to and including this fragment.
    2774 		 */
    2775 		if (PPP_MP_CB(p)->BEbits & E) {
                            ^^^^^^^^^^^^^^^^^^^^^^^^

If "tail" is set, can this condition be true?

    2776 			struct sk_buff *tmp2;
    2777 
    2778 			skb_queue_reverse_walk_from_safe(list, p, tmp2) {
    2779 				if (ppp->debug & 1)
    2780 					netdev_printk(KERN_DEBUG, ppp->dev,
    2781 						      "discarding frag %u\n",
    2782 						      PPP_MP_CB(p)->sequence);
    2783 				__skb_unlink(p, list);
    2784 				kfree_skb(p);
                                        ^^^^^^^^^^^^
On the first iteration through the loop then "p" is still set to "tail"
so this will free "tail", leading to problems down the line.

    2785 			}
    2786 			head = skb_peek(list);
    2787 			if (!head)
    2788 				break;
    2789 		}
    2790 		++seq;
    2791 	}
    2792 
    2793 	/* If we have a complete packet, copy it all into one skb. */
    2794 	if (tail != NULL) {
    2795 		/* If we have discarded any fragments,
    2796 		   signal a receive error. */
    2797 		if (PPP_MP_CB(head)->sequence != ppp->nextseq) {
    2798 			skb_queue_walk_safe(list, p, tmp) {
    2799 				if (p == head)
    2800 					break;
    2801 				if (ppp->debug & 1)
    2802 					netdev_printk(KERN_DEBUG, ppp->dev,
    2803 						      "discarding frag %u\n",
    2804 						      PPP_MP_CB(p)->sequence);
    2805 				__skb_unlink(p, list);
    2806 				kfree_skb(p);
    2807 			}
    2808 
    2809 			if (ppp->debug & 1)
    2810 				netdev_printk(KERN_DEBUG, ppp->dev,
    2811 					      "  missed pkts %u..%u\n",
    2812 					      ppp->nextseq,
    2813 					      PPP_MP_CB(head)->sequence-1);
    2814 			++ppp->dev->stats.rx_dropped;
    2815 			ppp_receive_error(ppp);
    2816 		}
    2817 
    2818 		skb = head;
    2819 		if (head != tail) {
    2820 			struct sk_buff **fragpp = &skb_shinfo(skb)->frag_list;
    2821 			p = skb_queue_next(list, head);
    2822 			__skb_unlink(skb, list);
    2823 			skb_queue_walk_from_safe(list, p, tmp) {
    2824 				__skb_unlink(p, list);
    2825 				*fragpp = p;
    2826 				p->next = NULL;
    2827 				fragpp = &p->next;
    2828 
    2829 				skb->len += p->len;
    2830 				skb->data_len += p->len;
    2831 				skb->truesize += p->truesize;
    2832 
    2833 				if (p == tail)
    2834 					break;
    2835 			}
    2836 		} else {
    2837 			__skb_unlink(skb, list);
    2838 		}
    2839 
--> 2840 		ppp->nextseq = PPP_MP_CB(tail)->sequence + 1;
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    2841 	}
    2842 
    2843 	return skb;
    2844 }

regards,
dan carpenter
