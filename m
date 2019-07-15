Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0E1269AC2
	for <lists+linux-ppp@lfdr.de>; Mon, 15 Jul 2019 20:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729441AbfGOSY0 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 15 Jul 2019 14:24:26 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:41060 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729277AbfGOSY0 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 15 Jul 2019 14:24:26 -0400
Received: from [10.49.74.218] (fw-lex.abinitio.com [65.170.40.234])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id x6FIOHts010340
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 15 Jul 2019 14:24:17 -0400
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com x6FIOHts010340
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1563215062;
        bh=pv+4Nmky3vTtrH/Za1vp6qo33qmDR6bgPAnLYqFD+5Y=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Es3d/xtMerWpyrh6lUGR7tTEyZP27Q7jSS6ASXUPY46N79Xf6ubcHqIFbtF2tJDTH
         /vdTv+i0IlSy3OXGnK2gF4+bVQoKH05aejvKBQGIKdPoWlkoTKT28HrKMy4GMdaJIK
         ysftESgz/+s4Kowp1pxSbTzCCwkgW2LuFvlsSzXY=
Subject: Re: monitoring raw data
To:     wharms@bfs.de
Cc:     linux-ppp@vger.kernel.org
References: <5D29B187.6040400@bfs.de> <20190713131005.7f9b0fe3@jive>
 <5D29C87C.9070400@bfs.de>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <a5cba29c-1943-92db-0b6e-a61dae007ccc@workingcode.com>
Date:   Mon, 15 Jul 2019 14:24:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <5D29C87C.9070400@bfs.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-DCC-MGTINTERNET-Metrics: carlson 1170; Body=2 Fuz1=2 Fuz2=2
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 07/13/19 08:03, walter harms wrote:
> while searching i found this:
>  https://github.com/ya-jeks/gsmmux
> 
> ever heard about it ?

I've never heard of it, but it does indeed look like the solution you're
looking for.  You would just run pppd over one of the ptys allocated by
that tool, and then use your AT commands on another pty.

More generally, neither pppd nor its associated kernel drivers have any
sort of multiplexing scheme for carriage of non-PPP data.

On a commercial system I once worked on, we had specially-designed
modems that had a separate management-only serial port so that we could
issue commands without disrupting the data port.  Life with
consumer-grade modems is different.  I've heard of people trying to do
the Hayes-patented TIES "<delay>+++<delay>ATH1<nl>AT...<nl>ATO<nl>"
stuff with modified drivers in the past, but none of that (if it ever
was successful) ended up merging into the main code.  A virtual-port
based scheme (as you're citing) sounds a lot more promising.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
