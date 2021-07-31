Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 736843DC7B2
	for <lists+linux-ppp@lfdr.de>; Sat, 31 Jul 2021 20:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhGaSgU (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sat, 31 Jul 2021 14:36:20 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:50848 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbhGaSgU (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sat, 31 Jul 2021 14:36:20 -0400
Received: from [192.168.254.3] (laptop.workingcode.com [192.168.254.3])
        (authenticated bits=0)
        by carlson.workingcode.com (8.16.1/8.16.1/SUSE Linux 0.8) with ESMTPSA id 16VIa36t016725
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Sat, 31 Jul 2021 14:36:05 -0400
DKIM-Filter: OpenDKIM Filter v2.11.0 carlson.workingcode.com 16VIa36t016725
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1627756565;
        bh=7uiHSjRhclTwo7SL+azqcq0dG9SAsPWpjWP2of1pgjY=;
        h=From:Subject:To:Cc:References:Date:In-Reply-To;
        b=Ii5g/hgGqSnBWMGW2fnEZycudnkqK7BOQ7NMxS+Vnoi7Yw60LAUh4kxFYRdDDTPBH
         UPcTNtqZQmEOk9JMdRkBxfzpZ4JLGxLy5ASurr2GXYtSRu4/jRTnD5LnmLDTcma39R
         WExKviFi4GR/JGrZXtKHWoxn4CMRBsUGf2enfaeQ=
From:   James Carlson <carlsonj@workingcode.com>
Subject: Re: [bug report] ppp: fix 'ppp_mp_reconstruct bad seq' errors
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-ppp@vger.kernel.org, ben@netservers.co.uk
References: <20210729141617.GC1267@kili> <20210730084833.GD25548@kadam>
 <6c6f81af-db62-6644-117a-3bf0a1d62087@workingcode.com>
Message-ID: <f2558693-c7e4-8a70-94f0-09119b146e1c@workingcode.com>
Date:   Sat, 31 Jul 2021 14:36:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6c6f81af-db62-6644-117a-3bf0a1d62087@workingcode.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-DCC--Metrics: carlson 1102; Body=3 Fuz1=3 Fuz2=3
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 7/30/21 1:15 PM, James Carlson wrote:
> On 7/30/21 4:48 AM, Dan Carpenter wrote:
>>> --> 2840 		ppp->nextseq = PPP_MP_CB(tail)->sequence + 1;
>>>                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>> Here is where Smatch complains.
> 
> If that's Smatch's analysis of the situation, then Smatch is wrong.
> It's a bogus warning.

For what it's worth, it's not my code, and I agree that it's at least a 
bit hard to follow, and may well harbor bugs.  If you're suggesting 
either some kind of suppression directive (I tried looking for some 
Smatch documentation but couldn't find much to suggest that's possible, 
though I guess now that you'd be the one who knows for sure), or adding 
something like "u32 nextseq = PPP_CB(tail)->sequence + 1;" around line 
2795, and then using "ppp->nextseq = nextseq;" on 2840, then I'd be in 
favor of that, at least to make the tool happy.

Is there an equivalent of "/* LINTED: tail pointer still ok */" here?

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
