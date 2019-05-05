Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F627141E1
	for <lists+linux-ppp@lfdr.de>; Sun,  5 May 2019 20:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbfEESki (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 5 May 2019 14:40:38 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:34589 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727367AbfEESki (ORCPT <rfc822;linux-ppp@vger.kernel.org>);
        Sun, 5 May 2019 14:40:38 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id 7EA66202F2;
        Sun,  5 May 2019 20:40:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1557081631; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nbMS+B/j4XzA6vm9HzQTHWTN4FyyMR9FdZMbvavqDLM=;
        b=g8mEYSkrnU9rueecpF+Iwex+sYs77h7uJKgS+aD41sVaifzy/alitZOcYJEm+rUJea9moC
        HzTGhXX+/jVP3FUIF1B/Zm5eeuH2qlAe9EixI/8Z9CMXfdvn4I4CPhwzkuHR/b+YUu1TPN
        ng21XHfnI0MZtUTeqh8ds5TEuCG8WIhrl1PnYZSfyAhGuRWrVibjP8SyS0sjfONmw/qU9O
        GYnmYKP3aYDUgAdplsZStN6n2j7V9jTnqFJtRLpWiLNZKpd5w2cs6wlTrwGgWs3HbPlxwJ
        uJgwrSprcM8StzNuai2thBSivl44dZNEEeY4K4o/enxwmvf34HxvxBKaxNrHgA==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id 60540BEEBD;
        Sun,  5 May 2019 20:40:31 +0200 (CEST)
Message-ID: <5CCF2E1E.1000508@bfs.de>
Date:   Sun, 05 May 2019 20:40:30 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     Marco d'Itri <md@Linux.IT>
CC:     linux-ppp@vger.kernel.org
Subject: Re: PPPOE on Arm
References: <20190504164853.4736-1-mcroce@redhat.com> <5CCF1A2D.30808@bfs.de> <20190505175701.GA27447@bongo.bofh.it>
In-Reply-To: <20190505175701.GA27447@bongo.bofh.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.95
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-2.95 / 7.00];
         ARC_NA(0.00)[];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         BAYES_HAM(-2.85)[99.35%];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         DKIM_SIGNED(0.00)[];
         RCPT_COUNT_TWO(0.00)[2];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_TLS_ALL(0.00)[]
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org



Am 05.05.2019 19:57, schrieb Marco d'Itri:
> On May 05, walter harms <wharms@bfs.de> wrote:
> 
>> I was using PPPOE on a raspi and it terminated with "invalid value",
> Which raspi model and which distribution, exactly?
> 
raspi3 with raspian (it was for testing, only)
I tried also different kernels but no success.

>> while the same setup on x86_64 worked fine.
> Is your pppd configuration unusual in any way?
> 
not really, but i need a VLAN (eth0.7)

this is the line i used for testing, it includes everything.

/usr/bin/setsid /usr/sbin/pppd pty '/usr/sbin/pppoe -p /var/run/pppoe.conf-pppoe.pid.pppoe -I eth0.7 -T 80 -U  -m 1412' noipdefault noauth
default-asyncmap defaultroute hide-password nodetach mtu 1492 mru 1492 noaccomp nodeflate nopcomp novj novjccomp user xxxxx lcp-echo-interval 20
lcp-echo-failure 3


>> is anyone working with PPPOE ?
> I use pppd and the PPPoE plugin from Debian 9 on a 32 bit armv7l system 
> (i.e. armhf) and it works fine.
> 
