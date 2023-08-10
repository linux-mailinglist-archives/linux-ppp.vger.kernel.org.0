Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88546777E8C
	for <lists+linux-ppp@lfdr.de>; Thu, 10 Aug 2023 18:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234512AbjHJQp6 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 10 Aug 2023 12:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231643AbjHJQpv (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 10 Aug 2023 12:45:51 -0400
X-Greylist: delayed 341 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Aug 2023 09:45:50 PDT
Received: from tuna.sandelman.ca (tuna.sandelman.ca [209.87.249.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 770E610C7
        for <linux-ppp@vger.kernel.org>; Thu, 10 Aug 2023 09:45:50 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by tuna.sandelman.ca (Postfix) with ESMTP id B32D03898C;
        Thu, 10 Aug 2023 12:40:08 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id Ah1SdNp6H4Tt; Thu, 10 Aug 2023 12:40:08 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [209.87.249.21])
        by tuna.sandelman.ca (Postfix) with ESMTP id C86E83898B;
        Thu, 10 Aug 2023 12:40:07 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sandelman.ca;
        s=mail; t=1691685607;
        bh=moX/WpE+y4cArhkYKVHDlIBXYskUhbqmcb0TCBkidU0=;
        h=From:To:cc:Subject:In-Reply-To:References:Date:From;
        b=nmRY/e4HlE8RBG9wSDMQqhD42NovpbS3vey60uwzNd8EgBN0tqIq0mxe+AkZI+l8H
         PbDhYjpEDUfF4MrOfNNXrn4E46zL0+LGJYQJCmA8Jqdgru+Pexw0OnwOBI55QYy8UG
         22jSIJGmc3ILmTXQS6/6Mj7QOkkcG6t/SS79rB1rd80trjSS59gIfmu3WEla092Ut9
         X01jIm1EXRmnWjJcxrRBscQj8TBEowmiOLNJRA714+Tc3a/kH6bpkj05tnOJrDKBAd
         caees7zpjKt3hq5r+uWYjd+5ahq/zJ+SyoLl7Qk9nSJt7oobNcsQtvygjqM96RJh/M
         5jzKRoQy845mg==
Received: from localhost (localhost [IPv6:::1])
        by sandelman.ca (Postfix) with ESMTP id C0DF7238;
        Thu, 10 Aug 2023 12:40:07 -0400 (EDT)
From:   Michael Richardson <mcr@sandelman.ca>
To:     David Gyimesi <david6670@gmail.com>
cc:     linux-ppp@vger.kernel.org
Subject: Re: "Timeout waiting for PADO packets" until reboot
In-Reply-To: <CAO+buQMqbKsFHiSA4yXwyfcU4nLGhO7p7J87ZZKMVQAWDE_5tw@mail.gmail.com>
References: <CAO+buQMqbKsFHiSA4yXwyfcU4nLGhO7p7J87ZZKMVQAWDE_5tw@mail.gmail.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 27.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;<'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Date:   Thu, 10 Aug 2023 12:40:07 -0400
Message-ID: <5665.1691685607@localhost>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


David Gyimesi <david6670@gmail.com> wrote:
    > If there is a short, let's say only 10 minutes, outage between the ho=
me
    > and the ISP, the router prints "pppd[17084]: Timeout waiting for PADO
    > packets" messages but it is able to re-establish the connection
    > automatically when the outage is resolved.

    > However if the outage is relatively longer the router just keeps
    > printing "pppd[17084]: Timeout waiting for PADO packets" messages and
    > even if the outage has been resolved the router is not able to
    > re-establish the PPPoE connection. However after a reboot the router =
is
    > able to establish the PPPoE connection without problem.

I experience the same thing.

What I think is that the DSL/PPPoE network simply forgets what your router's
MAC address is, and the router reboot sends something else that makes it all
work again.  Maybe because the virtual (L2) circuit is reastablished. That's
for the VDSL situation that I have.

FTTH has many implementations, some have overlays on top of the GPON.
The fact that you have PPPoE at all suggests that is the case.
Not everyone has GPON, even.

I don't have a solution, but I've looked for some clear indication.
My friendly third-party ISP has looked at their end as well, and when the
connection is in the bad state, they see nothing.  In between are the
completely incompetent incumbent telco.
(I live in Ottawa, Canada)

=2D-
Michael Richardson <mcr+IETF@sandelman.ca>   . o O ( IPv6 I=C3=B8T consulti=
ng )
           Sandelman Software Works Inc, Ottawa and Worldwide





--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCgAvFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAmTVEucRHG1jckBzYW5k
ZWxtYW4uY2EACgkQgItw+93Q3WV3SggAlO9Q8wGQ6RCm+WVPX1/Mlrilxc52YdXQ
P+R9EG1hCODLG7d49XzdZHjvYwd019z0f4buZTOHwcdFVGDhELY7MV6fhYvM5iTQ
26fWlTg3/syKwTLZy0CzjQvTHO/7rrgfVUP2Jpx8oMSuS4CC8PHHMq8AUq6Q7rLV
WV7P0l2l5F4lBmEUaQy5EU0Ux5tph8iAX9Xh2XJGgl9/w0AedVlOmUozckXjM7QE
jZW3eCFwUyMKKwljhovpsBHmtJkdrmWMXHB9te8fdvH4l6aEVpIjNLcB1AnQ80ON
JSVU+phft/QPHfrj546H2bi+ZvqOEdbW2aEYkEsAnHMe4pLpbKuGzQ==
=ZVe/
-----END PGP SIGNATURE-----
--=-=-=--
