Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEB0156A18
	for <lists+linux-ppp@lfdr.de>; Wed, 26 Jun 2019 15:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbfFZNNi (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 26 Jun 2019 09:13:38 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:59380 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727276AbfFZNNi (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 26 Jun 2019 09:13:38 -0400
X-Greylist: delayed 1671 seconds by postgrey-1.27 at vger.kernel.org; Wed, 26 Jun 2019 09:13:37 EDT
Received: from [10.49.74.218] (fw-lex.abinitio.com [65.170.40.234])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id x5QCjhuN025933
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 26 Jun 2019 08:45:43 -0400
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com x5QCjhuN025933
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1561553143;
        bh=VnhVjSzLoNvyF5ZJPcX+XJVNC4CcyQvPUxn6io78c5s=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=koJDS4j1VoYy5LYg+rpyrA0Y1lKuyWKfaaCsiu4bcStSQEnXbjHD85xD8ujw9ka/O
         +j/R0qeOaBKg+sQUS/DxMFWzAV3uodr5EBDbGS1e6myEe7Bs85/uc/wz5Uv8Bwf0ZI
         jhyX0I/u8ipqHnNVU9kCdTahcgKTNrdHbt1Nchnk=
Subject: Re: IPv6 with pppd
To:     Levente <leventelist@gmail.com>, linux-ppp@vger.kernel.org
References: <CACwWb3B6v7ayhoDpE-GAA8qKgbh=EM95eq9hHxHcZtusAaQqcw@mail.gmail.com>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <bf1cf4dc-513b-7158-9b13-38ca5c112025@workingcode.com>
Date:   Wed, 26 Jun 2019 08:45:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CACwWb3B6v7ayhoDpE-GAA8qKgbh=EM95eq9hHxHcZtusAaQqcw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-DCC--Metrics: carlson 1102; Body=2 Fuz1=2 Fuz2=2
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 06/26/19 07:30, Levente wrote:
> Dear maintainer,
> 
> 
> I am struggling with IPv6 over PPP on Linux. The situation is that I
> have a 3G modem, when I plug it in to the USB on my Debian box,
> everything works as expected, I have IPv6 address from the provider,
> and I am happy. But how?

There may be problems with this trace, possibly indicating 3G-specific
authentication issues, but if your only question is about IPv6, the
answer is very simple.  PPP doesn't negotiate global scope addresses in
IPv6.  It does link-local only.  Global scope addresses come from either
ICMPv6 Router Advertisements, DHCPV6 address assignments, or static
configuration.

> Please note that in the logs, I can't see that global scope address,
> and I don't know how the IPv6CP assigns this address to the interface.
> How is this done?

Some other protocol.  IPV6CP is not involved.

> And when I plug the same modem to an OpenWRT box, I don't get the
> global scope address, only the link-local address. Is this some PPP
> specific problem, or there might be some IPv6 autoconfiguration magic
> happening in the background? I don't think so, because that address
> corresponds to a statically allocated address of the provider.
> 
> lev@mercury:~$ host 2a00:1110:135:4594:303e:582f:ea95:aa10
> 0.1.a.a.5.9.a.e.f.2.8.5.e.3.0.3.4.9.5.4.5.3.1.0.0.1.1.1.0.0.a.2.ip6.arpa
> domain name pointer
> 2A00111001354594303E582FEA95AA10.mobile.pool.telekom.hu.
> 
> Could you help me out what is going on here, and why can't I get a
> global scope address on the OpenWRT? I'm sure it is an OpenWRT issue,
> but need help tracing it.

My guess would be that the OpenWRT box doesn't have IPv6 routing enabled
and isn't doing RAs.  That's just a guess.  I don't believe the issues
you're having here have anything to do with PPP.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
