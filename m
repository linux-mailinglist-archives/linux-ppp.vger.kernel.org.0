Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0F3115EA23
	for <lists+linux-ppp@lfdr.de>; Fri, 14 Feb 2020 18:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390073AbgBNRL0 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 14 Feb 2020 12:11:26 -0500
Received: from carlson.workingcode.com ([50.78.21.49]:39408 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388799AbgBNRLT (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 14 Feb 2020 12:11:19 -0500
X-Greylist: delayed 1864 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Feb 2020 12:11:18 EST
Received: from [50.78.21.49] (carlson [50.78.21.49])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id 01EGe61F010219
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Fri, 14 Feb 2020 11:40:06 -0500
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com 01EGe61F010219
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1581698411;
        bh=9dRs/lanXB4TChZ9iom0E1dULamaTUb2oBNPR/W1N98=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=JFVTvHlUQqgKNmyqF+1MadEKER6H4evhDV+AlNRSdO3G2Bwxq8STmsiQOkp6KQhhC
         1Sk6ahbLFfh/WKGIsic6QzJ40SuwzoGYFLlOrFlLSinJQ5LlwHUvegyzFtBzY/kZbo
         X15j5T+WL1NQaOXq9QbJSL6AtGJLwWJ5KdYcZSKs=
Subject: Re: Porting source to OSX
To:     igal avraham <igal38@gmail.com>, linux-ppp@vger.kernel.org
References: <808CF219-67B9-45A0-B1FA-A53E682B0B06@gmail.com>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <e49785c8-43cd-7186-2e51-4949ec9a57dc@workingcode.com>
Date:   Fri, 14 Feb 2020 11:40:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <808CF219-67B9-45A0-B1FA-A53E682B0B06@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-DCC-uptempo.net-Metrics: carlson 1093; Body=2 Fuz1=2 Fuz2=2
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 2/14/20 9:51 AM, igal avraham wrote:
> Is there a port available for OS X ?

pppd version 2.4.2 is included as part of Mac OS X, but my understanding
is that this port was done inside Apple and that they haven't released
source code for it.  The existing publicly-available pppd code doesn't
have support for a "Darwin" (Mac OS X) kernel.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
