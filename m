Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A94A14163
	for <lists+linux-ppp@lfdr.de>; Sun,  5 May 2019 19:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbfEERVi (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sun, 5 May 2019 13:21:38 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:55649 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726965AbfEERVi (ORCPT <rfc822;linux-ppp@vger.kernel.org>);
        Sun, 5 May 2019 13:21:38 -0400
X-Greylist: delayed 370 seconds by postgrey-1.27 at vger.kernel.org; Sun, 05 May 2019 13:21:37 EDT
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id C95AA2032C
        for <linux-ppp@vger.kernel.org>; Sun,  5 May 2019 19:15:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1557076525; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xo/93Pgm3pFnDDDkfU+Mvkibu9PQDu/CuVwDElDTsWg=;
        b=PjJtlJpBoUYerhZQ5M9sLL0tOuPrgctQ0KJfxzPxSS7+9VFaFzY6/tmA4CuZWl9ROWZGON
        B2g+TQ1qabXSSepIeLvdxMqhm5x/U4mMNqysIks0Zy/7DaqTniHf1t1hdGyGWIV0sxrE+9
        V07IwIgYjpgZ7d1WmrVq22IzXnyYMt62MBuL0RcZh2SnbrIoSpU7MoECC4e2KAGWk8BUkO
        vhZ4OtXsA/zVrT2fTb0USPCev8HBTn0zwoeWuvldYvMfXuApsuUhPsShoixyGVVeu33R1s
        wfM+ZF8GGnGPHg0h4W66UNpIz0kTSaWTTs96M73YtUQRmlpHPlAiGui6uam6XQ==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id A9B20BEEBD
        for <linux-ppp@vger.kernel.org>; Sun,  5 May 2019 19:15:25 +0200 (CEST)
Message-ID: <5CCF1A2D.30808@bfs.de>
Date:   Sun, 05 May 2019 19:15:25 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     linux-ppp@vger.kernel.org
Subject: PPPOE on Arm
References: <20190504164853.4736-1-mcroce@redhat.com>
In-Reply-To: <20190504164853.4736-1-mcroce@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.10
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.10 / 7.00];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         TO_DN_NONE(0.00)[];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-3.00)[100.00%];
         ARC_NA(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         PREVIOUSLY_DELIVERED(0.00)[linux-ppp@vger.kernel.org];
         RCPT_COUNT_ONE(0.00)[1];
         DKIM_SIGNED(0.00)[];
         RCVD_COUNT_TWO(0.00)[2];
         RCVD_TLS_ALL(0.00)[]
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hi,
I was using PPPOE on a raspi and it terminated with "invalid value",
while the same setup on x86_64 worked fine.

is anyone working with PPPOE ?

re,
 wh
