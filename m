Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2D768D308
	for <lists+linux-ppp@lfdr.de>; Tue,  7 Feb 2023 10:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjBGJk6 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 7 Feb 2023 04:40:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbjBGJk6 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Tue, 7 Feb 2023 04:40:58 -0500
X-Greylist: delayed 884 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 07 Feb 2023 01:40:57 PST
Received: from mail.crawnon.pl (mail.crawnon.pl [51.68.198.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B8376A8
        for <linux-ppp@vger.kernel.org>; Tue,  7 Feb 2023 01:40:57 -0800 (PST)
Received: by mail.crawnon.pl (Postfix, from userid 1002)
        id 782BEA2E5A; Tue,  7 Feb 2023 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crawnon.pl; s=mail;
        t=1675761343; bh=C5hX24svv/9/TME4wPCHfYjl17BCtmuxEd1i9B4zdYs=;
        h=Date:From:To:Subject:From;
        b=jHzloz8tnQSNybuEgYSQNq+qvzYohAGlv6fjlnz9Xz1Mym+vrHg9UkvhwoVCEy6Aj
         afGG08Y89CMagzKzhuD+ghnpiJnyiE+TC59sl1u4glfxoJZtlA8y5uQRfiq8/ahFwx
         B+t/YCTTog+xGEr5rClUiplfVMS7H1jY+8+F+5f0MGQo4jnKs3bzNlGue3xEQawOVB
         gcUS5QJOo01SomVxdVJW8TCAAln7E688tzUt5jDELOV47e+qwGkvPwrlvNkoRnuEF6
         AYQOsXt7xyS443biSrZSmADWiSKh/vIdC7sudAa1SLQE5jfPTHSXreT76ip5AKk7q3
         TrDrlP8D8eDhg==
Received: by mail.crawnon.pl for <linux-ppp@vger.kernel.org>; Tue,  7 Feb 2023 09:15:23 GMT
Message-ID: <20230207074500-0.1.90.hvr5.0.iwhekdbj1p@crawnon.pl>
Date:   Tue,  7 Feb 2023 09:15:23 GMT
From:   =?UTF-8?Q? "Miko=C5=82aj_Fiodorczyk" ?= 
        <mikolaj.fiodorczyk@crawnon.pl>
To:     <linux-ppp@vger.kernel.org>
Subject: Fotowoltaika - nowe warunki
X-Mailer: mail.crawnon.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.0 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,
        RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,SPF_PASS,URIBL_CSS_A,
        URIBL_DBL_SPAM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: crawnon.pl]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [51.68.198.42 listed in zen.spamhaus.org]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: crawnon.pl]
        *  1.3 RCVD_IN_VALIDITY_RPBL RBL: Relay in Validity RPBL,
        *      https://senderscore.org/blocklistlookup/
        *      [51.68.198.42 listed in bl.score.senderscore.com]
        * -0.0 BAYES_20 BODY: Bayes spam probability is 5 to 20%
        *      [score: 0.1108]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Dzie=C5=84 dobry,

chcia=C5=82bym poinformowa=C4=87, i=C5=BC mog=C4=85 Pa=C5=84stwo uzyska=C4=
=87 dofinansowanie na systemy fotowoltaiczne w ramach nowej edycji progra=
mu M=C3=B3j Pr=C4=85d.

Program zapewnia 6000 z=C5=82 dofinansowania na instalacj=C4=99 paneli i =
16 000 z=C5=82 na magazyn energii, ni=C5=BCsze cen pr=C4=85du i mo=C5=BCl=
iwo=C5=9B=C4=87 odliczenia koszt=C3=B3w zwi=C4=85zanych z instalacj=C4=85=
 fotowoltaiki w ramach rozliczenia PIT (tzw. ulga termomodernizacyjna).

Czy s=C4=85 Pa=C5=84stwo otwarci na wst=C4=99pn=C4=85 rozmow=C4=99 w tym =
temacie?


Pozdrawiam,
Miko=C5=82aj Fiodorczyk
