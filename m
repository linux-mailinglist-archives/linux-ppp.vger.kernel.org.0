Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A447BBECA6
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Sep 2019 09:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730733AbfIZHkW (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 26 Sep 2019 03:40:22 -0400
Received: from relay-b01.edpnet.be ([212.71.1.221]:39833 "EHLO
        relay-b01.edpnet.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730706AbfIZHkW (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 26 Sep 2019 03:40:22 -0400
X-ASG-Debug-ID: 1569482482-0a7ff54e982113c0001-vz1ewb
Received: from zotac.vandijck-laurijssen.be (77.109.114.181.adsl.dyn.edpnet.net [77.109.114.181]) by relay-b01.edpnet.be with ESMTP id 0RmyxTerWWB3QcrC for <linux-ppp@vger.kernel.org>; Thu, 26 Sep 2019 09:21:22 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.114.181.adsl.dyn.edpnet.net[77.109.114.181]
X-Barracuda-Apparent-Source-IP: 77.109.114.181
Received: from x1.vandijck-laurijssen.be (74.250-240-81.adsl-static.isp.belgacom.be [81.240.250.74])
        by zotac.vandijck-laurijssen.be (Postfix) with ESMTPSA id 597E4A02923
        for <linux-ppp@vger.kernel.org>; Thu, 26 Sep 2019 09:21:22 +0200 (CEST)
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To:     linux-ppp@vger.kernel.org
Subject: [RFC] patch series to compile pppd with musl toolchain
Date:   Thu, 26 Sep 2019 09:20:57 +0200
X-ASG-Orig-Subj: [RFC] patch series to compile pppd with musl toolchain
Message-Id: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
X-Mailer: git-send-email 1.8.5.rc3
X-Barracuda-Connect: 77.109.114.181.adsl.dyn.edpnet.net[77.109.114.181]
X-Barracuda-Start-Time: 1569482482
X-Barracuda-URL: https://212.71.1.221:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 161
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.5179 1.0000 0.7500
X-Barracuda-Spam-Score: 0.75
X-Barracuda-Spam-Status: No, SCORE=0.75 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.76836
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hello,

I'd like to add this series of 9 patches to pppd.
The goal is to use pppd on an embedded system with musl instead of glibc.

Kind regards,
Kurt

