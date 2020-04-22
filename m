Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A9F1B4FB8
	for <lists+linux-ppp@lfdr.de>; Thu, 23 Apr 2020 00:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbgDVWAz (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 22 Apr 2020 18:00:55 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:40282 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgDVWAz (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 22 Apr 2020 18:00:55 -0400
Received: from [50.78.21.49] (carlson [50.78.21.49])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id 03MM0qIa030862
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Wed, 22 Apr 2020 18:00:52 -0400
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com 03MM0qIa030862
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1587592853;
        bh=POJmzhiOf8pCraTpFTFmTnTnZMQSaON067K5TzHruF4=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=wXB/vuBNNR8xetwrQq3cpEMQPMrFEG0dmGSp2Tyn9eKnY910Y0ur7OmPl8RsYesCx
         NvsJQyLP9xhw62Qw9UFCM9tQfnFB2N5zMp8+k4VhZuhdzAsaAqY62zl8rKLUSslvZ8
         BrK1MoNDDySHLUqH67kpEC9odGIExBOvj8TXsiCQ=
Subject: Re: PPPoE Modem hangup after random time - how to debug?
To:     =?UTF-8?Q?David_Bala=c5=beic?= <xerces9@gmail.com>,
        linux-ppp@vger.kernel.org
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com>
Date:   Wed, 22 Apr 2020 18:00:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-DCC-x.dcc-servers-Metrics: carlson 104; Body=2 Fuz1=2 Fuz2=2
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 2020-04-22 13:45, David Balažic wrote:
> Hi!
> 
> I have a router running openwrt connected to a GPON ONT, running a
> PPPoE connection (hw details below).

This looks to be (possibly) a PPPoE failure, though there's nothing
interesting in the log messages provided.  If there were an interesting
log message, it would almost certainly come somewhere (perhaps even
*minutes*) before that initial "Modem hangup" message.

The definitive test would be to run a packet capture on the Ethernet
interface itself (*not* on the PPP interface) with something like
Wireshark and determine what happens in the lead-up to the failure.  I'd
expect the system is just getting a stray PADT from the peer, if it's
some kind of PPPoE problem.

If it isn't, then possibly it's something else.  I think that the last
time I looked at the PPPoE implementation on Linux it was a bit hokey --
it ran PPP over a pty pair and then decoded the framing in user space
and wrote it back out over Ethernet using PPPoE.  I hope it's not still
like that, as I haven't looked at it in years, but it may well be.  An
internal error in that logic could also cause a "hangup" message,
although hopefully along with some kind of system log about a core file
as well.

(The implementation on other platforms, such as Solaris, was a bit more
solid.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
