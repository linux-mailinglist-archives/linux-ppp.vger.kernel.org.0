Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBE97E170C
	for <lists+linux-ppp@lfdr.de>; Sun,  5 Nov 2023 22:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjKEV7r (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 5 Nov 2023 16:59:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbjKEV7r (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 5 Nov 2023 16:59:47 -0500
X-Greylist: delayed 5143 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 05 Nov 2023 13:59:43 PST
Received: from SMTP-HCRC-200.brggroup.vn (mail.hcrc.vn [42.112.212.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E29E1;
        Sun,  5 Nov 2023 13:59:43 -0800 (PST)
Received: from SMTP-HCRC-200.brggroup.vn (localhost [127.0.0.1])
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTP id D028119A15;
        Mon,  6 Nov 2023 01:58:18 +0700 (+07)
Received: from zimbra.hcrc.vn (unknown [192.168.200.66])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTPS id C9119196E9;
        Mon,  6 Nov 2023 01:58:18 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id 665C31B8250F;
        Mon,  6 Nov 2023 01:58:20 +0700 (+07)
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id T6SKa8_v6e-j; Mon,  6 Nov 2023 01:58:20 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id 350891B8250D;
        Mon,  6 Nov 2023 01:58:20 +0700 (+07)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.hcrc.vn 350891B8250D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hcrc.vn;
        s=64D43D38-C7D6-11ED-8EFE-0027945F1BFA; t=1699210700;
        bh=WOZURJ77pkiMUL2pPLC14ifVPRvyTQIBEQmxuN1ezAA=;
        h=MIME-Version:To:From:Date:Message-Id;
        b=tAPxul3uNX7uWCszVvWRMovWxWhS1tba7lcZr3cSx3n6SLXb7xMorT57UZuwhYGdG
         W8JcDu8egVB9iIMp+ylSzFDc2PrGFiwDVvhDME/3F51tgnw77Ym3RdCPFVjNxwgIQu
         qiXvHzmVxJPQYqmt73kugNyOyai3ID8NxKcIaGM/BgbNJ1Irfadu3O5fr7qEmdcVKp
         X+86Px1Ha02KeKB5JTakyCFI7lu6LKuuDOhrNd0BSNJN3oD9RUsZ+lhrKwgdqPvhyD
         M8rOWY8My3W6ie9vRtgu5DwtcPH8ylnYl1a0hTB4j8yvYQ6vFc7MEodhDbRW/l9glZ
         9UPMaNVfOLSUw==
X-Virus-Scanned: amavisd-new at hcrc.vn
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id EUDImOdagJWB; Mon,  6 Nov 2023 01:58:20 +0700 (+07)
Received: from [192.168.1.152] (unknown [51.179.100.52])
        by zimbra.hcrc.vn (Postfix) with ESMTPSA id CFE931B8250F;
        Mon,  6 Nov 2023 01:58:13 +0700 (+07)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?b?4oKsIDEwMC4wMDAuMDAwPw==?=
To:     Recipients <ch.31hamnghi@hcrc.vn>
From:   ch.31hamnghi@hcrc.vn
Date:   Sun, 05 Nov 2023 19:58:03 +0100
Reply-To: joliushk@gmail.com
Message-Id: <20231105185813.CFE931B8250F@zimbra.hcrc.vn>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Goededag,
Ik ben mevrouw Joanna Liu en een medewerker van Citi Bank Hong Kong.
Kan ik =E2=82=AC 100.000.000 aan u overmaken? Kan ik je vertrouwen


Ik wacht op jullie reacties
Met vriendelijke groeten
mevrouw Joanna Liu

