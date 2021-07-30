Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F903DBD88
	for <lists+linux-ppp@lfdr.de>; Fri, 30 Jul 2021 19:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbhG3RP5 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 30 Jul 2021 13:15:57 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:43714 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbhG3RP5 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 30 Jul 2021 13:15:57 -0400
Received: from [50.78.21.49] (carlson [50.78.21.49])
        (authenticated bits=0)
        by carlson.workingcode.com (8.16.1/8.16.1/SUSE Linux 0.8) with ESMTPSA id 16UHFdjR015598
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Fri, 30 Jul 2021 13:15:40 -0400
DKIM-Filter: OpenDKIM Filter v2.11.0 carlson.workingcode.com 16UHFdjR015598
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1627665344;
        bh=PXgfEL2N03Lq0QuDor4ZKpWVfp97M35cnjW9y8iDqPs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=uweiAlKff4odsi0ArEngmoHHkyYEjF9yvfi0WmI2lzGSQX7sHCC3FAfj2QCu4gPDT
         KGCy/e0U9gJMk9oMibfx6NOXYoqEiJuxNSSSHmmQS/mGme+9bujbec57e/3IW714hv
         Mpdl387K29MK+KanGPL6r/FerujRJzI5fqxVvjIM=
Subject: Re: [bug report] ppp: fix 'ppp_mp_reconstruct bad seq' errors
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-ppp@vger.kernel.org, ben@netservers.co.uk
References: <20210729141617.GC1267@kili> <20210730084833.GD25548@kadam>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <6c6f81af-db62-6644-117a-3bf0a1d62087@workingcode.com>
Date:   Fri, 30 Jul 2021 13:15:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210730084833.GD25548@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-DCC-MGTINTERNET-Metrics: carlson 1170; Body=3 Fuz1=3 Fuz2=3
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 7/30/21 4:48 AM, Dan Carpenter wrote:
>>     2755 		/* Got a complete packet yet? */
>>     2756 		if (lost == 0 && (PPP_MP_CB(p)->BEbits & E) &&
>>     2757 		    (PPP_MP_CB(head)->BEbits & B)) {
>>     2758 			if (len > ppp->mrru + 2) {
>>     2759 				++ppp->dev->stats.rx_length_errors;
>>     2760 				netdev_printk(KERN_DEBUG, ppp->dev,
>>     2761 					      "PPP: reconstructed packet"
>>     2762 					      " is too long (%d)\n", len);
>>     2763 			} else {
>>     2764 				tail = p;
>>                                         ^^^^^^^^
>> tail is set to p.
> 
> At this point Smatch understands that "tail" and "p" are non-NULL.

Yep.  And 'head' is non-NULL and points to the first buf of the
reassembled packet, 'tail' is non-NULL and points to the last buf of the
reassembled packet.  And head may be equal to tail if it's packet
consisting of a single MP fragment.  And because 'lost' is zero, we know
that we have all of the intermediate fragments chained as well.  It's a
complete message.

>>     2793 	/* If we have a complete packet, copy it all into one skb. */
>>     2794 	if (tail != NULL) {
> 
> This condition means "tail == p"

True at this point.  (Not real meaningful, as we'll see in a bit, but
true nonetheless.)

>>     2795 		/* If we have discarded any fragments,
>>     2796 		   signal a receive error. */
>>     2797 		if (PPP_MP_CB(head)->sequence != ppp->nextseq) {
> 
> Smatch is supposed to "understand" condtions, but this one is quite
> complicated and the only thing that Smatch understands is just the
> basic meaning that these two are not equal.

That's ok; it's a worthwhile branch to explore, so we can assume it's true.

>>     2798 			skb_queue_walk_safe(list, p, tmp) {
>>     2799 				if (p == head)
> 
> One of the weak points of Smatch is how it parses lists...  Also it
> doesn't have any implications for this if (p == head) condition.

This is where things break down.  That queue walker macro on line 2798
re-assigns 'p'.  The code marches over the list and says "anything that
still exists up to (but not including) the head for this completed
packet is trash."  Note that *NOTHING* here is harming 'head' or
anything in the list that follows that buffer -- which includes 'tail.'

>>     2800 					break;

That break protects us from hurting 'tail'.

>>     2801 				if (ppp->debug & 1)
>>     2802 					netdev_printk(KERN_DEBUG, ppp->dev,
>>     2803 						      "discarding frag %u\n",
>>     2804 						      PPP_MP_CB(p)->sequence);
>>     2805 				__skb_unlink(p, list);
>>     2806 				kfree_skb(p);
> 
> We know that p == tail going in to the start of this list so this is
> going to free tail.  Of course kfree_skb() is refcounted and the free
> only happens when the last reference is dropped.

Not so.  p != tail here.  It cannot possibly be tail, because we (A)
reassigned 'p' at the top of the loop and (B) broke out of the loop on
hitting 'head'.

>>     2836 		} else {
>>     2837 			__skb_unlink(skb, list);
>>     2838 		}
>>     2839 
>> --> 2840 		ppp->nextseq = PPP_MP_CB(tail)->sequence + 1;
>>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Here is where Smatch complains.

If that's Smatch's analysis of the situation, then Smatch is wrong.
It's a bogus warning.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
