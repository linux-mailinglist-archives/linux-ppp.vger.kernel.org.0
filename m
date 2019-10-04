Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7261BCB8A3
	for <lists+linux-ppp@lfdr.de>; Fri,  4 Oct 2019 12:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729977AbfJDKuF (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 4 Oct 2019 06:50:05 -0400
Received: from relay-b03.edpnet.be ([212.71.1.220]:37906 "EHLO
        relay-b03.edpnet.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbfJDKuF (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 4 Oct 2019 06:50:05 -0400
X-ASG-Debug-ID: 1570186200-0a88186e20461a120001-vz1ewb
Received: from zotac.vandijck-laurijssen.be (77.109.104.71.adsl.dyn.edpnet.net [77.109.104.71]) by relay-b03.edpnet.be with ESMTP id oLabBpyWRGgmq6SC; Fri, 04 Oct 2019 12:50:00 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.104.71.adsl.dyn.edpnet.net[77.109.104.71]
X-Barracuda-Apparent-Source-IP: 77.109.104.71
Received: from x1.vandijck-laurijssen.be (x1.vandijck-laurijssen.be [IPv6:fd01::1a1d:eaff:fe02:d339])
        by zotac.vandijck-laurijssen.be (Postfix) with ESMTPSA id 96F04A2F8B0;
        Fri,  4 Oct 2019 12:49:59 +0200 (CEST)
Date:   Fri, 4 Oct 2019 12:49:58 +0200
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To:     Levente <leventelist@gmail.com>
Cc:     Paul Mackerras <paulus@ozlabs.org>, linux-ppp@vger.kernel.org
Subject: Re: [PATCH 4/9] pppd: include time.h before using time_t
Message-ID: <20191004104958.GD881@x1.vandijck-laurijssen.be>
X-ASG-Orig-Subj: Re: [PATCH 4/9] pppd: include time.h before using time_t
Mail-Followup-To: Levente <leventelist@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>, linux-ppp@vger.kernel.org
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20191003224054.GA26158@blackberry>
 <CACwWb3BoHF0WQ3ve3PQ_7L3LfJsvqC3Z9ZF5zOwd-r-GWv8CuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACwWb3BoHF0WQ3ve3PQ_7L3LfJsvqC3Z9ZF5zOwd-r-GWv8CuA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Barracuda-Connect: 77.109.104.71.adsl.dyn.edpnet.net[77.109.104.71]
X-Barracuda-Start-Time: 1570186200
X-Barracuda-URL: https://212.71.1.220:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 120
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: SPAM GLOBAL 0.9894 1.0000 4.2201
X-Barracuda-Spam-Score: 4.22
X-Barracuda-Spam-Status: No, SCORE=4.22 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=BSF_SC0_SA717
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.77094
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
        0.00 BSF_SC0_SA717          Custom Rule BSF_SC0_SA717
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

> IMHO time_t is defined in sys/types.h

http://www.open-std.org/JTC1/SC22/WG14/www/docs/n1256.pdf
chapter 7.23.1.3
