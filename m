Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E8E31B31D
	for <lists+linux-ppp@lfdr.de>; Sun, 14 Feb 2021 23:48:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhBNWrT (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 14 Feb 2021 17:47:19 -0500
Received: from carlson.workingcode.com ([50.78.21.49]:45770 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbhBNWrR (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 14 Feb 2021 17:47:17 -0500
Received: from [50.78.21.49] (carlson [50.78.21.49])
        (authenticated bits=0)
        by carlson.workingcode.com (8.16.1/8.16.1/SUSE Linux 0.8) with ESMTPSA id 11EMkTK4006440
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Sun, 14 Feb 2021 17:46:29 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 carlson.workingcode.com 11EMkTK4006440
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1613342789;
        bh=XkujzM6C3RSPnO8mJBEQA8aJ5UA/D/Tzjrt4N1kfgSU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=lTtAHDSxb77ZX2aSSKdI5cujOC42yESAmzpjRvx2kfh/+d4C1hd6TtQpbof2inkWj
         AaEFvSEpLt3PR5kaQRMdIEA7AJMOvpv24QHzsqsk8ZBPF+8N0BSPsyNKXNrch16dOF
         476CYrdK9VieW3EkSj5DmCdl/JJ/zuegpS6u7KJQ=
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from
 remote peer
To:     Benjamin Cama <benoar@dolka.fr>, Nicholas Humfrey <njh@aelius.com>
Cc:     linux-ppp@vger.kernel.org
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
 <907df17c-450a-8db6-1dc1-dd3731019279@workingcode.com>
 <e04667f8e2ff35927fca7e6280c0817a0caccebb.camel@dolka.fr>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <8979942a-92bb-dc1f-6349-6afd26305848@workingcode.com>
Date:   Sun, 14 Feb 2021 17:46:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e04667f8e2ff35927fca7e6280c0817a0caccebb.camel@dolka.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-DCC--Metrics: carlson 1102; Body=3 Fuz1=3 Fuz2=3
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 2021-02-14 16:24, Benjamin Cama wrote:
> Le dimanche 14 février 2021 à 11:23 -0500, James Carlson a écrit :
>> RFC 2472 is a little weird with respect to the Interface-Identifier
>> option.  It's possible to send an all-zero identifier, but we're really
>> in uncharted waters if the peer can't give us an address or rejects the
>> option.
> 
> Could I suggest that then IPv6CP just fails?

The RFC says that it's out of scope.  Sure; I think failure would be fine.

> Well, I actually sent last year a patch (attached again to this
> message) to Paul and Cc'ed here about sending a zero identifier to do
> exactly (to my understanding) what Nicholas is intending to do: let the
> “server”-side choose the interface identifier.
> 
> It is a very small change that is basically activated on the “client”-
> side with:
> 
>   ipv6 ::,
> 
> thus sending a zero identifier for our side. It worked quite well for
> my work case (virtual serial links), where having short addresses when
> autoconfiguring helps a lot, too. I couldn't resist also citing the
> “stability to global scope addresses” argument from the RFC, which is
> indeed relevant to me, at least.

I assume that's a reference to autoconf behavior.  It's actually not
required that autoconf uses the same lower 64 bits to form those
addresses, though it it often does.  And even where it does, it's
certainly possible to use other mechanisms to do the "right thing."  In
Linux I believe you can set the client portion for stateless autoconf
with something like:

  ip token set ::123/64 dev ppp0

I'd do that in an ipv6-up script.

But, yeah, that's the only possible reason I can see to care about it,
and it seems like a pretty weak one to me.  (Usually you'll want more
than just a static address, and DHCPv6 gives you DNS and other really
handy bits as well.)

> What do you think about it?

That's a much more elegant configuration option than my suggestion.  I
like it.

(I don't like the idea that people seem to care about IPv6 link-local
addresses.  Not at all.  But I like the change, especially if it means
the question doesn't need to be answered again.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
