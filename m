Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C04AB31B135
	for <lists+linux-ppp@lfdr.de>; Sun, 14 Feb 2021 17:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbhBNQYi (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 14 Feb 2021 11:24:38 -0500
Received: from carlson.workingcode.com ([50.78.21.49]:35408 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbhBNQYh (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 14 Feb 2021 11:24:37 -0500
Received: from [50.78.21.49] (carlson [50.78.21.49])
        (authenticated bits=0)
        by carlson.workingcode.com (8.16.1/8.16.1/SUSE Linux 0.8) with ESMTPSA id 11EGNlTF010748
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Sun, 14 Feb 2021 11:23:47 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 carlson.workingcode.com 11EGNlTF010748
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1613319828;
        bh=Kzy/AQmRP84ViRDHomwXZn3rdT2gni9jJk6OE5qrXHw=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=jP6QCQQVs3aifwfz/nTW3Z3nTdPXKl/TgquvWRHhDYAamz8EmFrHCwKE+RqEhfZmb
         KBU8ykMQCxqMTpmeRUKTgsh9eQEdzj4yXOKG+JkwSZTZkzFLH5E0bpe9OMgl3nJmGw
         Fb85Bp4ooCInvNymkwMfeIP9qh3LKSxLVoLkaPJ4=
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from
 remote peer
To:     Nicholas Humfrey <njh@aelius.com>, linux-ppp@vger.kernel.org
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <907df17c-450a-8db6-1dc1-dd3731019279@workingcode.com>
Date:   Sun, 14 Feb 2021 11:23:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-DCC-MGTINTERNET-Metrics: carlson 1170; Body=2 Fuz1=2 Fuz2=2
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 2021-02-13 20:03, Nicholas Humfrey wrote:
> Hi,
> 
> I originally asked this question on the "Unix and Linux" StackExchange:
> https://unix.stackexchange.com/questions/634033/configuring-pppd-to-accept-link-local-ipv6-address-from-remote-peer

Do you have a debug trace?  I don't see one in that posting or here, so
it's hard to know exactly what we're commenting on.

> I have two pppd (v2.4.7) instances running, talking to each over over a
> serial port link. But I can't work out how to get the 'client' pppd to
> accept the link-local IPv6 interface identifier provided by the 'server'
> pppd. I am trying to use static addresses so I know the link-local IP
> address of the remote peer.

Perhaps a silly question, but why?  Link locals are used only for the
IPv6 router discovery, neighbor discovery, and routing protocol
communication.  Why would anyone care what numbers are assigned as long
as the two ends are distinct?

Applications aren't normally supposed to use link-locals at all.
They're quite hard to use correctly.  They're *LINK LOCAL*, so all uses
-- connect, bind, sendto -- is required to use interface identifier
binding (sin6_scope_id) as well.  The whole area is quite a mess and
best avoided unless you really, really need to do it.

The normal thing to do is to wait for ICMPv6 RA to assign local prefixes
(and thus autoconf global addresses) or use DHCPv6 if you need
finer-grained control or even an /etc/ppp/ipv6-up script to assign IPv6
global addresses as needed.

IPv6 is different from IPv4.  It's not quite the same thing at all.  In
particular, the idea of "static IP address assignment" changes quite a bit.

The sole reason I could see to do this would be to assert some control
over autoconf addresses, which sometimes use the identifier as the
default "interface token."  But there are probably better ways to do that.

> The pppd man page says:
>   ipv6cp-accept-local
>     With this option, pppd will accept the peer's idea of our local IPv6
> interface
>     identifier, even if the local IPv6 interface identifier was
> specified in an option.

This means that we'll accept the peer's IPV6CP Configure-Nak message
suggesting a different address rather than sticking to our guns.  It
doesn't mean we won't start out with a legitimate identifier.

RFC 2472 is a little weird with respect to the Interface-Identifier
option.  It's possible to send an all-zero identifier, but we're really
in uncharted waters if the peer can't give us an address or rejects the
option.  This sort of makes sense given that IPv6 itself just doesn't
work at all (no ICMPv6 ND means no work gets done) without a local
address, so it's not something anyone has really explored.

> The client always just uses a locally chosen interface identifier
> instead. It was suggested to me to try setting the 'client' local
> interface identifier to all-zero but I have not found a way of doing
> this through configuration. Or alternatively get the 'server' to Nack
> the clients choice of interface identifier - but I'm not sure how to
> achieve that with pppd.

Note: RFC 2472 *REQUIRES* an implementation to accept whatever the peer
proposes as long as it doesn't conflict with the locally-chosen identifier.

     If the two Interface-Identifiers are different and the received
     Interface-Identifier is not zero, the Interface-Identifier MUST be
     acknowledged, i.e.  a Configure-Ack is sent with the requested
     Interface-Identifier, meaning that the responding peer agrees with
     the Interface-Identifier requested.

That's part of the weirdness.  We're not really allowed (by the
specification) to say "your identifier is legal [non-zero and
non-duplicate] but I don't like it so let me give you a different one."

> I have now managed to get it working by hacking ipv6cp.c to keep the
> local identifier as all-zero, by disabling a couple of calls to
> eui64_magic_nz. But I am not sure what the proper solution is.
> 
> Does there need to be an IPv6 equivalent to 'noipdefault' to use in
> conjunction with 'ipv6cp-accept-local'?

Yes, I agree there could probably be an option ("noipv6default",
perhaps) to do this, if only for testing reasons.  But given the lack of
a compelling application for it, it's hard to see why.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
