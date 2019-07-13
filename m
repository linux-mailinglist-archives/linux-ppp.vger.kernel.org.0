Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E368679A8
	for <lists+linux-ppp@lfdr.de>; Sat, 13 Jul 2019 12:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbfGMKZS (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sat, 13 Jul 2019 06:25:18 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:29748 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726460AbfGMKZS (ORCPT <rfc822;linux-ppp@vger.kernel.org>);
        Sat, 13 Jul 2019 06:25:18 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id 2BBAF202DE
        for <linux-ppp@vger.kernel.org>; Sat, 13 Jul 2019 12:25:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1563013512; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:in-reply-to:
         references; bh=UFoR56ouzYHA5Zcg1rA13pja6hoCWH7/WDu2pwju9O8=;
        b=xYw1BqI4czpsFlaaAzCySKgfwTq71Rw/Nk0N+7nVKGycbj77OWgKcPuwinZtL06oWa2O37
        izc+JGf3ShdHiOl+F43MVv4Tcgp9Nu2KCi03IUYvmbcIKFUe6NxDxS7ok7cTOJk+NovGPw
        gKJlaAFSejOSxiQbJj35Iridixb0RbDYh/KIhm97tzErju4VROuCRmituut8WUy9vKjApW
        +oto5ygByNuEcjB+QX/5ZLwEZHrrUgLF6YqOrgYE5wltf2uYcDJfuQu82YoGaz9FSSYdiS
        V3AmyWBGel3H60mxLMMc/wF4aQ9wYP2kZK+beoT994SdqZlXTR00KSKCBx57OQ==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id 108EABEEBD
        for <linux-ppp@vger.kernel.org>; Sat, 13 Jul 2019 12:25:12 +0200 (CEST)
Message-ID: <5D29B187.6040400@bfs.de>
Date:   Sat, 13 Jul 2019 12:25:11 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     linux-ppp@vger.kernel.org
Subject: monitoring raw data
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.09
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.09 / 7.00];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         TO_DN_NONE(0.00)[];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-2.99)[99.95%];
         ARC_NA(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         PREVIOUSLY_DELIVERED(0.00)[linux-ppp@vger.kernel.org];
         RCPT_COUNT_ONE(0.00)[1];
         DKIM_SIGNED(0.00)[];
         NEURAL_HAM(-0.00)[-0.999,0];
         RCVD_COUNT_TWO(0.00)[2];
         RCVD_TLS_ALL(0.00)[]
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hello list,
this is a bit off-topic.

I am looking for a tools to monitor the connection quality
when i send data via a LTE-Modem.

Background:
I collect data on remote place and send them to a server.
At some places i have strange problems, so i would like to
monitor the connection quality and perhaps other informations
the modem can offer.

Is there a programm or a hook i can use inside pppd ? i am pretty
sure i am not the first one with such kind of problems.

short:
I want a simple way to send 1 or 2 AT cmds store the results and
continue with ppp.

re,
 wh
