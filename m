Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 072C619DA7A
	for <lists+linux-ppp@lfdr.de>; Fri,  3 Apr 2020 17:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbgDCPpq (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 3 Apr 2020 11:45:46 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:43860 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbgDCPpp (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 3 Apr 2020 11:45:45 -0400
X-Greylist: delayed 1087 seconds by postgrey-1.27 at vger.kernel.org; Fri, 03 Apr 2020 11:45:45 EDT
Received: from [50.78.21.49] (carlson [50.78.21.49])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id 033FRMRB020766
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Fri, 3 Apr 2020 11:27:23 -0400
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com 033FRMRB020766
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1585927643;
        bh=h836Mw15Xg25Jy7QISVynSHYbEXiILuXJVj9bAKxcUU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=sUaVMIVYUqK0P5we2EAITFsqMaUf8MUV6W3slrd+gfvSjsnv5k0bd8xIYhWxIo2YD
         HYB/Oue//qD4vUTR3XCPW68kyP6q73b0Mw3BneU3ZFnHrqU139/OiqiNsXPzFYNGjo
         hjMkF4DNo6R3aDF7ksgdORZdaEsV1EkIn9AmPjxM=
Subject: Re: [PATCH] Adding EAP-MSCHAPv2 support
To:     Eivind Naess <enaess@gmail.com>, linux-ppp@vger.kernel.org
Cc:     thomas@omerzu.de
References: <CAKuzOkiM0Z9DV9LofTtgAi3bEfxzqk0BLm-QpQq0CLHVdT5aAw@mail.gmail.com>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <f8639224-8bc6-dc08-f6f9-fff5caa3e148@workingcode.com>
Date:   Fri, 3 Apr 2020 11:27:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAKuzOkiM0Z9DV9LofTtgAi3bEfxzqk0BLm-QpQq0CLHVdT5aAw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-DCC-x.dcc-servers-Metrics: carlson 104; Body=3 Fuz1=3 Fuz2=3
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 2020-04-03 11:09, Eivind Naess wrote:
> Implementation based on the RFC: draft-kamath-pppext-eap-mschapv2-02.
> Adding support for MSCHAPv2 inside the extensible authentication protocol (EAP).
> 
> Author: Thomas Omerzu <thomas@omerzu.de>
> Origin: https://w3logistics.com/blog/archives/438-EAP-MSCHAPv2-for-pppd-2-4-7.html
> Bug: https://github.com/paulusmack/ppp/issues/138
> Bug-Ubuntu: https://bugs.launchpad.net/ubuntu/+source/ppp/+bug/1858349
> Pull Request: https://github.com/paulusmack/ppp/pull/139
> Last-Update: 2020-02-24
> Signed-off-by: Thomas Omerzu <thomas@omerzu.de>.

This all seems ok to me, but I do have one nit: that document referenced
is a long-expired Internet Draft, not an RFC.  As far as I know, there
are no RFCs that cover Microsoft's foray into this area.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
