Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 308D031B33E
	for <lists+linux-ppp@lfdr.de>; Mon, 15 Feb 2021 00:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbhBNXQg (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 14 Feb 2021 18:16:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbhBNXQf (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 14 Feb 2021 18:16:35 -0500
Received: from solo.fdn.fr (solo.fdn.fr [IPv6:2001:910:800::19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2AE5C061574
        for <linux-ppp@vger.kernel.org>; Sun, 14 Feb 2021 15:15:55 -0800 (PST)
Received: from apu-mx.dolka.fr (apu-mx.dolka.fr [IPv6:2001:910:103a:6::5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by smtp-old.fdn.fr (Postfix) with ESMTPS id 3A48ED0F5C;
        Mon, 15 Feb 2021 00:15:54 +0100 (CET)
Received: from nsk.dolka.fr ([2001:910:103a:0:76d4:35ff:fe8d:c659])
        by apu-mx.dolka.fr with esmtp (Exim 4.89)
        (envelope-from <benoar@dolka.fr>)
        id 1lBQcL-0002pJ-Bn; Mon, 15 Feb 2021 00:15:53 +0100
Message-ID: <0dd1a7673eb530e20ff0f680a2c181511b8d2f94.camel@dolka.fr>
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from
 remote peer
From:   Benjamin Cama <benoar@dolka.fr>
To:     James Carlson <carlsonj@workingcode.com>
Cc:     linux-ppp@vger.kernel.org, Nicholas Humfrey <njh@aelius.com>
Date:   Mon, 15 Feb 2021 00:15:53 +0100
In-Reply-To: <8979942a-92bb-dc1f-6349-6afd26305848@workingcode.com>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
         <907df17c-450a-8db6-1dc1-dd3731019279@workingcode.com>
         <e04667f8e2ff35927fca7e6280c0817a0caccebb.camel@dolka.fr>
         <8979942a-92bb-dc1f-6349-6afd26305848@workingcode.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Le dimanche 14 février 2021 à 17:46 -0500, James Carlson a écrit :
> On 2021-02-14 16:24, Benjamin Cama wrote:
> > Well, I actually sent last year a patch (attached again to this
> > message) to Paul and Cc'ed here about sending a zero identifier to do
> > exactly (to my understanding) what Nicholas is intending to do: let the
> > “server”-side choose the interface identifier.
> > 
> > It is a very small change that is basically activated on the “client”-
> > side with:
> > 
> >   ipv6 ::,
> > 
> > thus sending a zero identifier for our side. It worked quite well for
> > my work case (virtual serial links), where having short addresses when
> > autoconfiguring helps a lot, too. I couldn't resist also citing the
> > “stability to global scope addresses” argument from the RFC, which is
> > indeed relevant to me, at least.
> 
> I assume that's a reference to autoconf behavior.  It's actually not
> required that autoconf uses the same lower 64 bits to form those
> addresses, though it it often does.

Well, it was the default for a very long time, and is still used for
“permanent addresses” that are still always configured anyway.

> And even where it does, it's
> certainly possible to use other mechanisms to do the "right thing."  In
> Linux I believe you can set the client portion for stateless autoconf
> with something like:
> 
>   ip token set ::123/64 dev ppp0
> 
> I'd do that in an ipv6-up script.

Well, I was not aware of the tokenized interface identifier support in
iproute2, even if this was kind of envisioned in the RFC (although the
manual here only cites a draft as formal reference…). Thanks for
letting me know!

> But, yeah, that's the only possible reason I can see to care about it,
> and it seems like a pretty weak one to me.  (Usually you'll want more
> than just a static address, and DHCPv6 gives you DNS and other really
> handy bits as well.)

I agree this is not the most useful feature I witnessed. To be more
precise on my use-case, this is about knowing in advance, from the
server-side, what will the client address be *when they are not
provisionned* for a particular id, but just use autoconf for the prefix
*and the iid part*, if one could call this mechanism “iid
autoconfiguration”. In this case, I also get resolvers through RA, and
even client registration in the DNS —if this was what you thought
about— can be then done on the server-side, as iid and thus global
address is deterministic (*if acknowledged* at IPv6CP level, which is a
small caveat I did not take into account, I admit; thus my suggestion
above about failing, then: maybe this would need a patch for that,
too?).

> > What do you think about it?
> 
> That's a much more elegant configuration option than my suggestion.  I
> like it.

To be fair, I did not check *all the cases* where the state machine
could stumble on zero iid. I *think* this is ok as zero is check here
and there, but I would prefer someone most knowledgeable double-check
it.

> (I don't like the idea that people seem to care about IPv6 link-local
> addresses.  Not at all.  But I like the change, especially if it means
> the question doesn't need to be answered again.)

Well, people are afraid of it when they see beginners misuse it (which
is very often the case). But stable global addressing and non-globally
addressed link with stable link-local addresses (e.g. inter-router
links, etc) can be very useful too for advanced use.

Thanks for your comments.
--
Benjamin

