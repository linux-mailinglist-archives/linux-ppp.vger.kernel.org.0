Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3AB13DAE77
	for <lists+linux-ppp@lfdr.de>; Thu, 29 Jul 2021 23:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233372AbhG2VnO (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 29 Jul 2021 17:43:14 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:35870 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbhG2VnO (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 29 Jul 2021 17:43:14 -0400
X-Greylist: delayed 2042 seconds by postgrey-1.27 at vger.kernel.org; Thu, 29 Jul 2021 17:43:13 EDT
Received: from [50.78.21.49] (carlson [50.78.21.49])
        (authenticated bits=0)
        by carlson.workingcode.com (8.16.1/8.16.1/SUSE Linux 0.8) with ESMTPSA id 16TL8t4W027140
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Thu, 29 Jul 2021 17:08:56 -0400
DKIM-Filter: OpenDKIM Filter v2.11.0 carlson.workingcode.com 16TL8t4W027140
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1627592937;
        bh=zqiMx/mGJURkn+ywwW/fMgraIz9+DOe0wpmXznmjevE=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=gneSAGGksG1rFEOIQC3FdFvQk0T2wBqXqQclEKZIbMWzK+CbGl5qjjQgt6NloIvzZ
         ax/xAfEgmcFOeZMBH4zrtrWPwnRgw5XPI+PAnz30gkIWGTph1eIgIfUkXjs1r47sO6
         rmhmp7Ord609ehMRApoyURSEP90wjGaee2It8bsc=
Subject: Re: [bug report] ppp: fix 'ppp_mp_reconstruct bad seq' errors
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-ppp@vger.kernel.org, ben@netservers.co.uk
References: <20210729141617.GC1267@kili>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <4cf9ad78-538a-3043-6651-eb5d0f0b6800@workingcode.com>
Date:   Thu, 29 Jul 2021 17:08:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210729141617.GC1267@kili>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-DCC-MGTINTERNET-Metrics: carlson 1170; Body=3 Fuz1=3 Fuz2=3
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 7/29/21 10:16 AM, Dan Carpenter wrote:
> The patch 8a49ad6e89fe: "ppp: fix 'ppp_mp_reconstruct bad seq'
> errors" from Feb 24, 2012, leads to the following static checker
> warning:
>
> 	drivers/net/ppp/ppp_generic.c:2840 ppp_mp_reconstruct()
> 	error: dereferencing freed memory 'tail'

What's the static checker, and does it provide any deeper analysis of
the code path and branch assumptions involved?

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
> 
>     2765 				break;
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

No.  You can't get here at all if tail is set.  Note the break at line
2765, which takes us out of the "skb_queue_walk_safe" iteration.  That
takes us all the way down to line 2793.

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

tail must be NULL here.  Otherwise, we would have broken out of the loop
at line 2765.

Other than that the code is a bit hard to read, I don't see a problem here.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
