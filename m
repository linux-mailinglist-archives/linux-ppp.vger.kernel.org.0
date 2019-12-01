Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2D4610E301
	for <lists+linux-ppp@lfdr.de>; Sun,  1 Dec 2019 19:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727169AbfLASU4 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 1 Dec 2019 13:20:56 -0500
Received: from mtax.cdmx.gob.mx ([187.141.35.197]:9691 "EHLO mtax.cdmx.gob.mx"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727072AbfLASU4 (ORCPT <rfc822;linux-ppp@vger.kernel.org>);
        Sun, 1 Dec 2019 13:20:56 -0500
X-Greylist: delayed 6603 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Dec 2019 13:20:55 EST
X-NAI-Header: Modified by McAfee Email Gateway (4500)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cdmx.gob.mx; s=72359050-3965-11E6-920A-0192F7A2F08E;
        t=1575217624; h=DKIM-Filter:X-Virus-Scanned:
         Content-Type:MIME-Version:Content-Transfer-Encoding:
         Content-Description:Subject:To:From:Date:Message-Id:
         X-AnalysisOut:X-AnalysisOut:X-AnalysisOut:
         X-AnalysisOut:X-AnalysisOut:X-SAAS-TrackingID:
         X-NAI-Spam-Flag:X-NAI-Spam-Threshold:X-NAI-Spam-Score:
         X-NAI-Spam-Rules:X-NAI-Spam-Version; bh=M
        8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs4
        8=; b=bBzwQXoHijpn1TS5flbRXa/ysoZQ7ROEHkxCmvbGgQZx
        GMmBxxQWpbhm3pkb+8t3pioUAAl63jZwSsJ064mZDJ+ge0EKIT
        MnDcfGu4E+PYMXyxLejjaa0hmEi5h/vm1CYNNtmf91i4HxDVH3
        UWtzAPc4kNO2/ziDo8c2tszOQ1M=
Received: from cdmx.gob.mx (correo.cdmx.gob.mx [10.250.108.150]) by mtax.cdmx.gob.mx with smtp
        (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
         id 28cd_470c_0d8c9366_091c_437f_84b3_a26a3ffeb04c;
        Sun, 01 Dec 2019 10:27:03 -0600
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id E8B1B1E24A4;
        Sun,  1 Dec 2019 10:18:30 -0600 (CST)
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 8Hyg3m84vrW6; Sun,  1 Dec 2019 10:18:30 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 5FF331E2A77;
        Sun,  1 Dec 2019 10:13:21 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.9.2 cdmx.gob.mx 5FF331E2A77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cdmx.gob.mx;
        s=72359050-3965-11E6-920A-0192F7A2F08E; t=1575216801;
        bh=M8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs48=;
        h=Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:
         From:Date:Message-Id;
        b=kpD7EJAoG7f5ifC9sABCn5968n26uS12NTUelf7l13kBVTWOy/bFNVH2Oh4wPO/82
         +V2dzMbhGfYwurp2imhe5mZriwrZAq8/Boxk5R4SMouHxr4wYIlPMHO6V39IRc9c+M
         SKXkwjNSNPEvRUnyRkHPatdyS0tomBm+URDQ4jiw=
X-Virus-Scanned: amavisd-new at cdmx.gob.mx
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id xX7GAw50yZNp; Sun,  1 Dec 2019 10:13:21 -0600 (CST)
Received: from [192.168.0.104] (unknown [188.125.168.160])
        by cdmx.gob.mx (Postfix) with ESMTPSA id DE6FE1E3111;
        Sun,  1 Dec 2019 10:04:55 -0600 (CST)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Congratulations
To:     Recipients <aac-styfe@cdmx.gob.mx>
From:   "Bishop Johnr" <aac-styfe@cdmx.gob.mx>
Date:   Sun, 01 Dec 2019 17:04:47 +0100
Message-Id: <20191201160455.DE6FE1E3111@cdmx.gob.mx>
X-AnalysisOut: [v=2.2 cv=U7TiNaju c=1 sm=1 tr=0 p=6K-Ig8iNAUou4E5wYCEA:9 p]
X-AnalysisOut: [=zRI05YRXt28A:10 a=T6zFoIZ12MK39YzkfxrL7A==:117 a=9152RP8M]
X-AnalysisOut: [6GQqDhC/mI/QXQ==:17 a=8nJEP1OIZ-IA:10 a=pxVhFHJ0LMsA:10 a=]
X-AnalysisOut: [pGLkceISAAAA:8 a=wPNLvfGTeEIA:10 a=M8O0W8wq6qAA:10 a=Ygvjr]
X-AnalysisOut: [iKHvHXA2FhpO6d-:22]
X-SAAS-TrackingID: 5d9e3ed5.0.105000569.00-2381.176569450.s12p02m005.mxlogic.net
X-NAI-Spam-Flag: NO
X-NAI-Spam-Threshold: 3
X-NAI-Spam-Score: -5000
X-NAI-Spam-Rules: 1 Rules triggered
        WHITELISTED=-5000
X-NAI-Spam-Version: 2.3.0.9418 : core <6686> : inlines <7165> : streams
 <1840193> : uri <2949750>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Money was donated to you by Mr and Mrs Allen and Violet Large, just contact=
 them with this email for more information =


EMail: allenandvioletlargeaward@gmail.com
