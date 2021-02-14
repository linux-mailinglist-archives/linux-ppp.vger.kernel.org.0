Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 687B431B2C6
	for <lists+linux-ppp@lfdr.de>; Sun, 14 Feb 2021 22:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhBNVc2 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 14 Feb 2021 16:32:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbhBNVc1 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 14 Feb 2021 16:32:27 -0500
X-Greylist: delayed 434 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 14 Feb 2021 13:31:31 PST
Received: from solo.fdn.fr (solo.fdn.fr [IPv6:2001:910:800::19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059DEC061574
        for <linux-ppp@vger.kernel.org>; Sun, 14 Feb 2021 13:31:31 -0800 (PST)
Received: from apu-mx.dolka.fr (apu.dolka.fr [IPv6:2001:910:103a:6::5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by smtp-old.fdn.fr (Postfix) with ESMTPS id EC25DD1119;
        Sun, 14 Feb 2021 22:24:13 +0100 (CET)
Received: from nsk.dolka.fr ([2001:910:103a:0:76d4:35ff:fe8d:c659])
        by apu-mx.dolka.fr with esmtp (Exim 4.89)
        (envelope-from <benoar@dolka.fr>)
        id 1lBOsH-0007sw-3H; Sun, 14 Feb 2021 22:24:13 +0100
Message-ID: <e04667f8e2ff35927fca7e6280c0817a0caccebb.camel@dolka.fr>
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from
 remote peer
From:   Benjamin Cama <benoar@dolka.fr>
To:     James Carlson <carlsonj@workingcode.com>,
        Nicholas Humfrey <njh@aelius.com>
Cc:     linux-ppp@vger.kernel.org
Date:   Sun, 14 Feb 2021 22:24:12 +0100
In-Reply-To: <907df17c-450a-8db6-1dc1-dd3731019279@workingcode.com>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
         <907df17c-450a-8db6-1dc1-dd3731019279@workingcode.com>
Content-Type: multipart/mixed; boundary="=-mMfC2+ltYu2Bsveuc5Rv"
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org


--=-mMfC2+ltYu2Bsveuc5Rv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hello James, Nicholas & others,

Please allow me to join the conversation:

Le dimanche 14 février 2021 à 11:23 -0500, James Carlson a écrit :
> RFC 2472 is a little weird with respect to the Interface-Identifier
> option.  It's possible to send an all-zero identifier, but we're really
> in uncharted waters if the peer can't give us an address or rejects the
> option.

Could I suggest that then IPv6CP just fails?

> This sort of makes sense given that IPv6 itself just doesn't
> work at all (no ICMPv6 ND means no work gets done) without a local
> address, so it's not something anyone has really explored.

Well, I actually sent last year a patch (attached again to this
message) to Paul and Cc'ed here about sending a zero identifier to do
exactly (to my understanding) what Nicholas is intending to do: let the
“server”-side choose the interface identifier.

It is a very small change that is basically activated on the “client”-
side with:

  ipv6 ::,

thus sending a zero identifier for our side. It worked quite well for
my work case (virtual serial links), where having short addresses when
autoconfiguring helps a lot, too. I couldn't resist also citing the
“stability to global scope addresses” argument from the RFC, which is
indeed relevant to me, at least.

What do you think about it?
Regards,
--
Benjamin

--=-mMfC2+ltYu2Bsveuc5Rv
Content-Disposition: attachment;
	filename*0=0001-pppd-Allow-for-a-zero-interface-identifier-in-ConfRe.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-pppd-Allow-for-a-zero-interface-identifier-in-ConfRe.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA1OWVlNzJiZTliNmRiYTU2YjU0MjJjMGJlYzg4ODQyZDYxYzljNTZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCZW5qYW1pbiBDYW1hIDxiZW5vYXJAZG9sa2EuZnI+CkRhdGU6
IFdlZCwgMTcgSnVuIDIwMjAgMTQ6MzA6MDEgKzAyMDAKU3ViamVjdDogW1BBVENIXSBwcHBkOiBB
bGxvdyBmb3IgYSB6ZXJvIGludGVyZmFjZSBpZGVudGlmaWVyIGluIENvbmZSZXEKClJGQyA1MDcy
IGFsbG93cyBhIHBlZXIgdG8gc2VuZCBhIHplcm8gaW50ZXJmYWNlIGlkZW50aWZpZXIgaW4gYW4g
SVB2NkNQCkNvbmZpZ3VyZS1SZXF1ZXN0LCBzaWduaWZ5aW5nIGl0IHdhbnRzIHRoZSBvdGhlciBz
aWRlIHRvIGNob29zZSBvbmUgZm9yCml0LiBBbGxvdyB0aGlzIGJ5IHBhc3NpbmcgIjo6IiB0byB0
aGUgY2xhc3NpYyAiaXB2NiIgb3B0aW9uLgotLS0KUXVvdGluZyBzZWN0aW9uIDQuMSBvZiBSRkMg
NTA3MiA8aHR0cHM6Ly90b29scy5pZXRmLm9yZy9odG1sL3JmYzUwNzIjc2VjdGlvbi00LjE+OgoK
ICBJZiBuZWl0aGVyIGEgdW5pcXVlIG51bWJlciBub3IgYSByYW5kb20gbnVtYmVyIGNhbiBiZSBn
ZW5lcmF0ZWQsIGl0IGlzCiAgcmVjb21tZW5kZWQgdGhhdCBhIHplcm8gdmFsdWUgYmUgdXNlZCBm
b3IgdGhlIGludGVyZmFjZSBpZGVudGlmaWVyCiAgdHJhbnNtaXR0ZWQgaW4gdGhlIENvbmZpZ3Vy
ZS1SZXF1ZXN0LiBJbiB0aGlzIGNhc2UsIHRoZSBQUFAgcGVlciBtYXkKICBwcm92aWRlIGEgdmFs
aWQgbm9uLXplcm8gaW50ZXJmYWNlIGlkZW50aWZpZXIgaW4gaXRzIHJlc3BvbnNlIGFzCiAgZGVz
Y3JpYmVkIGJlbG93LgoKSXQgY2FuIGJlIHVzZWZ1bCB0byBoYXZlIG5vbi1yYW5kb20gaWRlbnRp
ZmllcnMsIHRvIGhlbHAgaGF2aW5nIHNob3J0CmFuZCBzdGFibGUgaWRzLCBmdXJ0aGVybW90ZSBh
c3NpZ25lZCBmcm9tIG9uZSBwbGFjZSBvbmx5LiBJdCBoZWxwcwpwcm92aWRpbmcg4oCcc3RhYmls
aXR5IHRvIGdsb2JhbCBzY29wZSBhZGRyZXNzZXPigJ0sIGFzIHB1dCBieSB0aGUgUkZDCmF1dGhv
cnMuCgogcHBwZC9pcHY2Y3AuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcHBwZC9pcHY2Y3AuYyBiL3BwcGQvaXB2
NmNwLmMKaW5kZXggYmRhOTFlOS4uMWU0ZmQyYiAxMDA2NDQKLS0tIGEvcHBwZC9pcHY2Y3AuYwor
KysgYi9wcHBkL2lwdjZjcC5jCkBAIC0zNDYsOCArMzQ2LDcgQEAgc2V0aWZhY2VpZChhcmd2KQog
ICAgIHN0cnVjdCBpbjZfYWRkciBhZGRyOwogICAgIHN0YXRpYyBpbnQgcHJpb19sb2NhbCwgcHJp
b19yZW1vdGU7CiAKLSNkZWZpbmUgVkFMSURJRChhKSAoICgoKGEpLnM2X2FkZHIzMlswXSA9PSAw
KSAmJiAoKGEpLnM2X2FkZHIzMlsxXSA9PSAwKSkgJiYgXAotCQkJKCgoYSkuczZfYWRkcjMyWzJd
ICE9IDApIHx8ICgoYSkuczZfYWRkcjMyWzNdICE9IDApKSApCisjZGVmaW5lIFZBTElESUQoYSkg
KCAoKGEpLnM2X2FkZHIzMlswXSA9PSAwKSAmJiAoKGEpLnM2X2FkZHIzMlsxXSA9PSAwKSApCiAg
ICAgCiAgICAgYXJnID0gKmFyZ3Y7CiAgICAgaWYgKChjb21tYSA9IHN0cmNocihhcmcsICcsJykp
ID09IE5VTEwpCi0tIAoyLjI2LjAKCg==


--=-mMfC2+ltYu2Bsveuc5Rv--

