Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C15E51E4E0E
	for <lists+linux-ppp@lfdr.de>; Wed, 27 May 2020 21:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgE0TVk (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 27 May 2020 15:21:40 -0400
Received: from 23-24-207-145-static.hfc.comcastbusiness.net ([23.24.207.145]:44157
        "EHLO ns.mahan.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbgE0TVk (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 27 May 2020 15:21:40 -0400
X-Greylist: delayed 327 seconds by postgrey-1.27 at vger.kernel.org; Wed, 27 May 2020 15:21:39 EDT
Received: from Cone-of-Silence.local (crowTrobot [23.24.207.146])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ns.mahan.org (Postfix) with ESMTPSA id 661B6A2DF9D
        for <linux-ppp@vger.kernel.org>; Wed, 27 May 2020 12:16:07 -0700 (PDT)
To:     linux-ppp@vger.kernel.org
From:   Patrick Mahan <mahan@mahan.org>
Subject: PPP cycling between UP and DOWN
Message-ID: <f44e7e14-1621-7141-66a3-3a2218e8db86@mahan.org>
Date:   Wed, 27 May 2020 12:16:07 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

PPP v2.3.11
RP-PPPOE v3.12
Linux 2.6.35

I am seeing some issues with respect to how PPP is handling a PPPoE connection.

My PPPoE connection gets established and pppd reports UP via the ip-up script. 
Then at some point (sometimes within a second, sometimes hours) pppd reports down 
via the ip-down script, but does not exit then re-establishes the UP state and 
reports it via ip-up.

I have a script that monitors by this by having a modified ip-up and ip-down 
script write a value to a specific file under /var/run/pppd/ and if it is 
ip-down, then I schedule a restart of pppd to occur once the pppd image exits.  I 
have assumed that ip-down being triggered is and indication that PPPoE connection 
is down and over.

But I am now seeing that this assumption could be incorrect.  I don't claim to 
understand the entire protocol layers involved.  But is it supported that a PPPoE 
connection can shift back from the IPCP layer to the LCP layer?  Then back?

Or is this a ppp protocol issue.  I see in the pppd code that we can moved to a 
down state if we get a request to restart negotiations, so I can see that my 
assumption may be incorrect.

Any help is appreciated.

Thanks,

Patrick
