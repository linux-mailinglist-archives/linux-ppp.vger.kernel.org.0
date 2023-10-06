Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7764F7BBE47
	for <lists+linux-ppp@lfdr.de>; Fri,  6 Oct 2023 20:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233093AbjJFSEE (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 6 Oct 2023 14:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232983AbjJFSEE (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 6 Oct 2023 14:04:04 -0400
X-Greylist: delayed 525 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 06 Oct 2023 11:03:59 PDT
Received: from relay.sandelman.ca (relay.cooperix.net [176.58.120.209])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611C5CE
        for <linux-ppp@vger.kernel.org>; Fri,  6 Oct 2023 11:03:59 -0700 (PDT)
Received: from dyas.sandelman.ca (bras-base-otwaon0819w-grc-20-70-51-88-254.dsl.bell.ca [70.51.88.254])
        by relay.sandelman.ca (Postfix) with ESMTPS id 35E61209C2;
        Fri,  6 Oct 2023 17:55:11 +0000 (UTC)
Received: by dyas.sandelman.ca (Postfix, from userid 1000)
        id 665E9A130B; Fri,  6 Oct 2023 13:55:07 -0400 (EDT)
Received: from dyas (localhost [127.0.0.1])
        by dyas.sandelman.ca (Postfix) with ESMTP id 632B3A05E6;
        Fri,  6 Oct 2023 13:55:07 -0400 (EDT)
From:   Michael Richardson <mcr@sandelman.ca>
To:     Sagar Acharya <sagaracharya@tutanota.com>
cc:     Narasimhan S <simha@multitech.co.in>,
        Linux Ppp <linux-ppp@vger.kernel.org>
Subject: Re: Support for udp
In-reply-to: <Ng2dOzz--3-9@tutanota.com>
References: <Ng-zxyt--3-9@tutanota.com> <b750b194-59cf-4a7b-a7c2-2995e5b0d8dc@multitech.co.in> <Ng2dOzz--3-9@tutanota.com>
Comments: In-reply-to Sagar Acharya <sagaracharya@tutanota.com>
   message dated "Fri, 06 Oct 2023 08:21:08 +0200."
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.3
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Date:   Fri, 06 Oct 2023 13:55:07 -0400
Message-ID: <2673951.1696614907@dyas>
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_40,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

--=-=-=
Content-Type: text/plain


Sagar Acharya <sagaracharya@tutanota.com> wrote:
    > So are you saying pppd does not support udp or does it?  Thanking you
    > Sagar Acharya https://humaaraartha.in/selfdost/selfdost.html

You didn't understand the answer because you didn't actually ask a sensible question.

PPP is a "layer-2"
UDP is a "layer-4"

https://en.wikipedia.org/wiki/OSI_model
https://www.oreilly.com/library/view/internet-core-protocols/1565925726/ch01s02s02.html

There are situations where one might encapsulate PPP packets into UDP
packets.  This usually happens in back-hauls of ISP/DSL networks using L2TP.
But, that's not a typical situation for an end-user.

Myself and many others have built commercial BRAS using pppd, and there is
even support in the Linux kernel for efficient encap/decap of L2TP/PPP packets.
https://en.wikipedia.org/wiki/Broadband_remote_access_server

    >> pppd works at IP layer. All IP protocols not dependent on broadcast
    >> capabilities should work.
    >>
    >> On 05-10-2023 23:30, Sagar Acharya wrote:
    >>
    >>> Does pppd support udp? I am able to access tcp but not udp with pppd.
    >>> Thanking you Sagar Acharya
    >>> https://humaaraartha.in/selfdost/selfdost.html
    >>>
    >>> Kindly cc me as I am not subscribed.
    >>>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEow/1qDVgAbWL2zxYcAKuwszYgEMFAmUgSfsACgkQcAKuwszY
gEMjDAwAvkNxzB7zyhPtXY6tDLDBwmspKOQo71sZraf01vmApFjNeVuu32uRmM21
swud3UX4/OYq0CcWdzdV9bDGSqyYhlqM0EYxQ7zDvV6IYAORErRzdNsQT2VeG8sC
w6jG1WRtxRsTdr0LmS/hjtSnc44xVeJBKsXldqHs7ByyOOeIQjQPmh0pPFgArVIg
6wTY0KWbYdyWIuUoUU6UCnL9sU08CFdlCA94j0y09gcl+mTHJy7btPtD5P3zt9T/
Wn7H2KdTBAVXn+yxtvDP98S16aPxfStyOnsQE8BnO93/hRSMPCKTLV7zqU3gs5E0
gzlBY0nYpcqjaCzklkKRAtz6GzpPKxJ5rtsRgefDvptH+0zkopY82vyR9eK/BxwC
mWdlMKK3/sx9oVY+ehXwFXp6ni3PaZPka/W1DEFXXcjFx8ZEOBkrUYrKc/sKljEW
1uPwI/i20+h4/Qi09ae1+F9Z/r1qAYlJspZlqnDXsW5pbXdtbgoryWlYRE28YzMX
IUMzeYCF
=dgyk
-----END PGP SIGNATURE-----
--=-=-=--
