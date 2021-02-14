Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDE131B184
	for <lists+linux-ppp@lfdr.de>; Sun, 14 Feb 2021 18:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhBNRV0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ppp@lfdr.de>); Sun, 14 Feb 2021 12:21:26 -0500
Received: from relay-b03.edpnet.be ([212.71.1.220]:44777 "EHLO
        relay-b03.edpnet.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbhBNRV0 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sun, 14 Feb 2021 12:21:26 -0500
X-Greylist: delayed 793 seconds by postgrey-1.27 at vger.kernel.org; Sun, 14 Feb 2021 12:21:25 EST
X-ASG-Debug-ID: 1613322450-0a881838a3144940001-vz1ewb
Received: from zotac.vandijck-laurijssen.be (94.105.105.240.dyn.edpnet.net [94.105.105.240]) by relay-b03.edpnet.be with ESMTP id 3o6OL5ZXVGvDEWo9; Sun, 14 Feb 2021 18:07:30 +0100 (CET)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 94.105.105.240.dyn.edpnet.net[94.105.105.240]
X-Barracuda-Apparent-Source-IP: 94.105.105.240
Received: from moto5gs.vandijck-laurijssen.be (moto5gs.vandijck-laurijssen.be [192.168.0.35])
        by zotac.vandijck-laurijssen.be (Postfix) with ESMTPSA id 1FD871264DDE;
        Sun, 14 Feb 2021 18:07:30 +0100 (CET)
Date:   Sun, 14 Feb 2021 18:07:28 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from remote peer
To:     Nicholas Humfrey <njh@aelius.com>, linux-ppp@vger.kernel.org
X-ASG-Orig-Subj: Re: Configuring pppd to accept link-local IPv6 interface id from remote peer
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Message-ID: <AA84019B-59D5-4A14-A113-EA4A3D0B7FED@vandijck-laurijssen.be>
X-Barracuda-Connect: 94.105.105.240.dyn.edpnet.net[94.105.105.240]
X-Barracuda-Start-Time: 1613322450
X-Barracuda-URL: https://212.71.1.220:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 417
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.87225
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org



On 14 February 2021 02:03:28 GMT+01:00, Nicholas Humfrey <njh@aelius.com> wrote:
>Hi,
>pppd. I am trying to use static addresses so I know the link-local IP 
>address of the remote peer.
>
>On the 'server' I am running:
>   pppd file ./ppp-options ipv6 ::1,::2 /dev/ttyAMA0 115200

::1 is not a link-local ip.
::1 is 'localhost', i would advise not to use it elsewhere
Sent from a small mobile device
