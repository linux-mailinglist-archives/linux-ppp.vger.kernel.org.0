Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68E3C31C880
	for <lists+linux-ppp@lfdr.de>; Tue, 16 Feb 2021 11:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhBPKFy (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 16 Feb 2021 05:05:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbhBPKFu (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Tue, 16 Feb 2021 05:05:50 -0500
Received: from taslin.fdn.fr (taslin.fdn.fr [IPv6:2001:910:800::77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3DE1C06174A
        for <linux-ppp@vger.kernel.org>; Tue, 16 Feb 2021 02:04:53 -0800 (PST)
Received: from apu-mx.dolka.fr (apu.dolka.fr [IPv6:2001:910:103a:6::5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by taslin.fdn.fr (Postfix) with ESMTPS id A8468600A3;
        Tue, 16 Feb 2021 11:04:48 +0100 (CET)
Received: from nsk.dolka.fr ([2001:910:103a:0:76d4:35ff:fe8d:c659])
        by apu-mx.dolka.fr with esmtp (Exim 4.89)
        (envelope-from <benoar@dolka.fr>)
        id 1lBxDs-0004xV-1Q; Tue, 16 Feb 2021 11:04:48 +0100
Message-ID: <072169f215e68427ba9b65caac3c3effef3b971c.camel@dolka.fr>
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from
 remote peer
From:   Benjamin Cama <benoar@dolka.fr>
To:     Nicholas Humfrey <njh@aelius.com>
Cc:     linux-ppp <linux-ppp@vger.kernel.org>
Date:   Tue, 16 Feb 2021 11:04:47 +0100
In-Reply-To: <dbd27511-117f-6cf7-0d38-eb715faed9c5@aelius.com>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
         <907df17c-450a-8db6-1dc1-dd3731019279@workingcode.com>
         <e04667f8e2ff35927fca7e6280c0817a0caccebb.camel@dolka.fr>
         <dbd27511-117f-6cf7-0d38-eb715faed9c5@aelius.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A8468600A3
X-Spamd-Result: default: False [-2.09 / 50.00];
         RCVD_TLS_LAST(0.00)[];
         ARC_NA(0.00)[];
         BAYES_HAM(-2.99)[99.97%];
         FROM_HAS_DN(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         DMARC_NA(0.00)[dolka.fr];
         AUTH_NA(1.00)[];
         TO_DN_ALL(0.00)[];
         RCPT_COUNT_TWO(0.00)[2];
         R_SPF_NA(0.00)[no SPF record];
         FROM_EQ_ENVFROM(0.00)[];
         R_DKIM_NA(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:20766, ipnet:2001:910::/32, country:FR];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[]
X-Rspamd-Server: taslin.fdn.fr
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hi Nicholas,

[Cc'ing the list if I may, as it may be useful]

Le mardi 16 février 2021 à 00:56 +0000, Nicholas Humfrey a écrit :
>  > It is a very small change that is basically activated on the “client”-
>  > side with:
>  >
>  >   ipv6 ::,
>  >
>  > thus sending a zero identifier for our side.
> 
> 
> I just tried applying your patch to Git master (5191399) and 
> successfully compiled it.

Thanks for testing!

> However when running this on my 'client':
> ./pppd/pppd file ~/ppp-options ipv6 ::, ipv6cp-accept-local /dev/ttyAMA0 
> 115200
> 
> Then it seemed to fail to negotiate the link-local address. Here is the 
> output:
> https://gist.github.com/njh/437713988b108880a8fe23ed10168c0c

It seems it keeps sending ConfReq for the zero identifier… strange.
Here is the output with the patched version from last june when I wrote
it, latest git at the time (some time after 2.4.8), which works:

   using channel 19
   Using interface ppp0
   Connect: ppp0 <--> /dev/pts/18
   rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xfc846b9d> <pcomp> <accomp>]
   sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x29314916> <pcomp> <accomp>]
   sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xfc846b9d> <pcomp> <accomp>]
   rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x29314916> <pcomp> <accomp>]
   sent [LCP EchoReq id=0x0 magic=0x29314916]
   sent [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
   sent [IPV6CP ConfReq id=0x1 <addr fe80::0000:0000:0000:0000>]
   rcvd [LCP EchoReq id=0x0 magic=0xfc846b9d]
   sent [LCP EchoRep id=0x0 magic=0x29314916]
   rcvd [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
   sent [CCP ConfAck id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
   rcvd [IPV6CP ConfReq id=0x1 <addr fe80::0000:0000:0000:0001>]
   sent [IPV6CP ConfAck id=0x1 <addr fe80::0000:0000:0000:0001>]
   rcvd [LCP EchoRep id=0x0 magic=0xfc846b9d]
   rcvd [CCP ConfAck id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
   Deflate (15) compression enabled
   rcvd [IPV6CP ConfNak id=0x1 <addr fe80::0000:0000:0000:0002>]
   sent [IPV6CP ConfReq id=0x2 <addr fe80::0000:0000:0000:0002>]
   rcvd [IPV6CP ConfAck id=0x2 <addr fe80::0000:0000:0000:0002>]
   local  LL address fe80::0000:0000:0000:0002
   remote LL address fe80::0000:0000:0000:0001
   Script /etc/ppp/ipv6-up started (pid 11628)
   Script /etc/ppp/ipv6-up finished (pid 11628), status = 0x0
   ^CTerminating on signal 2
   Script /etc/ppp/ipv6-down started (pid 11655)
   sent [LCP TermReq id=0x2 "User request"]
   Script /etc/ppp/ipv6-down finished (pid 11655), status = 0x0
   Child process sudo /home/benoar/Dev/ppp/pppd/pppd notty noauth noip +ipv6 ipv6 ::1,::2 (pid 11617) terminated with signal 2
   Modem hangup
   Connection terminated.
   Connect time 0.1 minutes.
   Sent 120 bytes, received 120 bytes.

   It correctly gets nacked when sending zero iid, and then acks the given
   identifier. BTW, I use a quick “self-test” for development testing:

   sudo ./pppd/pppd pty "sudo $(pwd)/pppd/pppd notty noauth noip +ipv6 ipv6 ::1,::2" noauth nodetach noip +ipv6 ipv6 ::, debug

   But with latest git and my patch, I indeed get the same trace as you.

   > In my hack, rather than changing the definition of what a valid 
> Interface Identifier is, I instead looked for the calls to eui64_magic() 
> and commented them out.

The VALIDID macro was sparsely used and fitted my use-case well, so I
went with that.

> Looking at the git master branch, it looks like Pali Rohár is actively 
> working in this space:
> 
> https://github.com/paulusmack/ppp/commits/master

Well, I'll give a look to find what's wrong.

Thanks for your feedback!
Regards,
--
benjamin

