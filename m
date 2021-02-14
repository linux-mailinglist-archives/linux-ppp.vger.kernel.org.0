Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2ED31B1AA
	for <lists+linux-ppp@lfdr.de>; Sun, 14 Feb 2021 18:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbhBNRva (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 14 Feb 2021 12:51:30 -0500
Received: from carlson.workingcode.com ([50.78.21.49]:57618 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbhBNRv3 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 14 Feb 2021 12:51:29 -0500
Received: from [50.78.21.49] (carlson [50.78.21.49])
        (authenticated bits=0)
        by carlson.workingcode.com (8.16.1/8.16.1/SUSE Linux 0.8) with ESMTPSA id 11EHoTRD026510
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Sun, 14 Feb 2021 12:50:30 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 carlson.workingcode.com 11EHoTRD026510
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1613325034;
        bh=6Sj4gPOeRARBNFnwL3VetQPzYuOhHbkvAjVbNOVDIGs=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=fryk9EUjQ9/m4/P4N9b4okk2H97ohYN4WFYP/oihJn4tY0H3uiMI+0U2ZVN3vwVxr
         yOatu9jqWUbxh0rU2CLTcQL1V/xzetY013INgNACm8AxasuuSg2G3+0Y0mdycBJ14+
         5iTOxTGva4N3/3Df0a+InkWs2o1NsI63lbStyTSk=
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from
 remote peer
To:     Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>,
        Nicholas Humfrey <njh@aelius.com>, linux-ppp@vger.kernel.org
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
 <AA84019B-59D5-4A14-A113-EA4A3D0B7FED@vandijck-laurijssen.be>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <5fa48c13-0a5d-49e4-681e-0df6a2ae2ea1@workingcode.com>
Date:   Sun, 14 Feb 2021 12:50:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <AA84019B-59D5-4A14-A113-EA4A3D0B7FED@vandijck-laurijssen.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-DCC-MGTINTERNET-Metrics: carlson 1170; Body=3 Fuz1=3 Fuz2=3
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 2021-02-14 12:07, Kurt Van Dijck wrote:
> 
> 
> On 14 February 2021 02:03:28 GMT+01:00, Nicholas Humfrey <njh@aelius.com> wrote:
>> Hi,
>> pppd. I am trying to use static addresses so I know the link-local IP 
>> address of the remote peer.
>>
>> On the 'server' I am running:
>>   pppd file ./ppp-options ipv6 ::1,::2 /dev/ttyAMA0 115200
> 
> ::1 is not a link-local ip.
> ::1 is 'localhost', i would advise not to use it elsewhere
> Sent from a small mobile device
> 

That's not quite true.  The "ipv6" option takes IPV6CP "interface
identifiers," which are (essentially) the lower 64 bits of an IPv6 address.

The user interface uses IPv6 address parsing, so they look like actual
addresses, but the upper 64 bits must all be zero, and they're not
actually used as addresses anywhere.

So, "::1" means "IPV6CP Interface-Identifier 0000000000000001".

Unlike IPCP (IPv4), there is absolutely no way to negotiate IPv6
addresses with PPP.  That's just not how IPv6 works.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
