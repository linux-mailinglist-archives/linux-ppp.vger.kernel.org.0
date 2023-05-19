Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC8327091B5
	for <lists+linux-ppp@lfdr.de>; Fri, 19 May 2023 10:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbjESIaY (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 19 May 2023 04:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjESIaY (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 19 May 2023 04:30:24 -0400
X-Greylist: delayed 548 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 19 May 2023 01:30:19 PDT
Received: from mail.mojafirma24biz.pl (mail.mojafirma24biz.pl [94.177.230.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B7410C9
        for <linux-ppp@vger.kernel.org>; Fri, 19 May 2023 01:30:19 -0700 (PDT)
Received: by mail.mojafirma24biz.pl (Postfix, from userid 1002)
        id 36CE683D91; Fri, 19 May 2023 10:21:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mojafirma24biz.pl;
        s=mail; t=1684484469;
        bh=QbP1U00PseMsQKCCzubvpt4P1svntDdd/QYVIBIcXDg=;
        h=Date:From:To:Subject:From;
        b=SFI4eVlxhDCIGxoiA1Q3ik24//pm3HBWg7d+Oazx5r/DpvsrAySmq1EbQoDXzr/3Z
         hfGgWUDDXeLAbsjYOZajJ47P/htyHv6PsVCFolmOEgf4X9umTy6HNKM8lCdydSRCy/
         1CWdZMkY74l3x/lbNm0lCVs0ltkskDmfH4T5FKo+1FVZZKk72XKjeia3B5XV3CzY6g
         GzdidwSXbVERUQ4OB2LW2XYQVSkj3BwsAmVGbKZEakUm/kFKVQk5RdlzPDhl2BRPYV
         A0yYYmJoDqw6mOUP/4sdtSs60ktEtilWo29c6CBVqYoe0+53b2+3yL48FxIn66hJX1
         Jjla49tC79pdQ==
Received: by mail.mojafirma24biz.pl for <linux-ppp@vger.kernel.org>; Fri, 19 May 2023 08:21:00 GMT
Message-ID: <20230519093257-0.1.d.18np.0.accyn8m55d@mojafirma24biz.pl>
Date:   Fri, 19 May 2023 08:21:00 GMT
From:   "Adam Wyrwisz" <adam.wyrwisz@mojafirma24biz.pl>
To:     <linux-ppp@vger.kernel.org>
Subject: Fotowoltaika dla biznesu
X-Mailer: mail.mojafirma24biz.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_BL_SPAMCOP_NET,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED,URIBL_CSS_A,URIBL_DBL_SPAM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: mojafirma24biz.pl]
        *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: mojafirma24biz.pl]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [94.177.230.123 listed in zen.spamhaus.org]
        *  1.3 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in
        *      bl.spamcop.net
        *      [Blocked - see <https://www.spamcop.net/bl.shtml?94.177.230.123>]
        * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: mojafirma24biz.pl]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Dzie=C5=84 dobry,

w zwi=C4=85zku z nieustannie rosn=C4=85cymi cenami produkt=C3=B3w i us=C5=
=82ug - wiele firmy stawia na rozwi=C4=85zania, kt=C3=B3re pomog=C4=85 zm=
niejszy=C4=87 wydatki zwi=C4=85zane z prowadzeniem dzia=C5=82alno=C5=9Bci=
, a jednym z nich jest wyb=C3=B3r instalacji fotowoltaicznych.=20

Wszystkim odbiorcom szukaj=C4=85cym mo=C5=BCliwo=C5=9Bci obni=C5=BCenia k=
oszt=C3=B3w energii elektrycznej, wychodzimy naprzeciw =C5=9Bwiadcz=C4=85=
c kompleksow=C4=85 obs=C5=82ug=C4=99 inwestycji w fotowoltaik=C4=99.=20

Jako jedyna na rynku firma zapewniamy 12 lat gwarancji, audyt po monta=C5=
=BCowy, a tak=C5=BCe kalkulacj=C4=99 oszcz=C4=99dno=C5=9Bci po monta=C5=BC=
u fotowoltaiki.

Umo=C5=BCliwiamy leasing z odroczon=C4=85 sp=C5=82at=C4=85 i bez wk=C5=82=
adu w=C5=82asnego, gwarantujemy wsparcie w pozyskaniu odpowiedniego =C5=BA=
r=C3=B3d=C5=82a finansowania i pomoc w przypadku wnioskowania o dotacj=C4=
=99.

Czy chcieliby Pa=C5=84stwo zapozna=C4=87 si=C4=99 z mo=C5=BCliwo=C5=9Bcia=
mi inwestycji w PV dopasowanymi do Pa=C5=84stwa obiektu?


Pozdrawiam
Adam Wyrwisz
