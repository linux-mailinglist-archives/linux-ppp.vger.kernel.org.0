Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A991F445E
	for <lists+linux-ppp@lfdr.de>; Tue,  9 Jun 2020 20:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731293AbgFISD5 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 9 Jun 2020 14:03:57 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:45646 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732973AbgFISDv (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Tue, 9 Jun 2020 14:03:51 -0400
Received: from Madelines-MacBook-Pro.local (dhcp-230.workingcode.com [192.168.254.230])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id 059I3k9L021605
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Tue, 9 Jun 2020 14:03:46 -0400
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com 059I3k9L021605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1591725828;
        bh=iGt2mblZ8hXLoxJhmxeMUciXKac6COdp/05Zquijzl8=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=lzNfwaTkV3sP9Me4j/tEtEG6Z4p0EP4JfzfhjY1LVcBEjmn4ylrEp5VAMMVvEspu0
         ls0q3jqO98MmwZsCDyuTfiN6gk8eP4m3xnVApbmqn18QuuewEB9ysZMOTvN2EC5zb2
         +sY8A5uJhGDVvleVTvNxfLwm2v5ufvNBoDbVBRhA=
Subject: Re: PPP cycling between UP and DOWN
To:     Patrick Mahan <mahan@mahan.org>, linux-ppp@vger.kernel.org
References: <f44e7e14-1621-7141-66a3-3a2218e8db86@mahan.org>
 <84d4375a-a446-6a15-9388-db312b77e50a@workingcode.com>
 <8d6fcc7e-c727-7979-13ca-a3e80d9eb514@mahan.org>
 <c3e9fab3-116c-ee26-cfa7-7fb7c76c7c4c@workingcode.com>
 <ed577071-6aad-6cc0-02b8-be0b3feb1222@mahan.org>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <53c19667-8ddd-e192-0d3c-db63bced8255@workingcode.com>
Date:   Tue, 9 Jun 2020 14:03:46 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <ed577071-6aad-6cc0-02b8-be0b3feb1222@mahan.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-DCC-sonic-Metrics: carlson 1254; Body=2 Fuz1=2 Fuz2=2
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 6/8/20 6:51 PM, Patrick Mahan wrote:
> On 6/8/20 10:15 AM, James Carlson wrote:
>> On 2020-06-08 13:04, Patrick Mahan wrote:
>>> Connect time 0.1 minutes.
>>> Sent 0 bytes, received 10 bytes.
>>>
>>> NOTE: This is where I think the ip-down callout was triggered.
>>
>> This looks like it could be a normal tear-down of some sort.  Without
>> debug information, we're not going to be able to say a whole lot more
>> about this.  (Crucially, a debug log would likely show which side
>> initiated the tear-down.)
>>
> 
> Understood.  And if we ever get this problem to occur again, I should 
> have those logs.

If this were due to IPCP Terminate-Request from the peer, there should 
have been an "IPCP terminated by peer" message emitted.  (That's done at 
'info' severity level, just like "Connect time," so if you see one, 
you'll see the other.)

If LCP terminated, you should have seen "Connection terminated."

If it were a local signal, then you would have seen "Terminating on signal."

And, of course, lower layer shutdown can be indicated by "Hangup 
(SIGHUP)" or "Modem hangup," depending on whether we find out about the 
issue via a UNIX signal or through EOF on the file descriptor.

The fact that none of these appear is a bit puzzling.  It *could* be 
something the plug-in is doing, but I'm not at all sure at this point. 
(If we do find out what it is, and if it's something in pppd that's 
doing this, we should definitely add a log message for this case.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
