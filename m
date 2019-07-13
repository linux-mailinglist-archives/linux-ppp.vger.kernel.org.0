Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3418767A0B
	for <lists+linux-ppp@lfdr.de>; Sat, 13 Jul 2019 14:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbfGMMDP (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sat, 13 Jul 2019 08:03:15 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:26157 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727489AbfGMMDP (ORCPT <rfc822;linux-ppp@vger.kernel.org>);
        Sat, 13 Jul 2019 08:03:15 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id 27DC220302
        for <linux-ppp@vger.kernel.org>; Sat, 13 Jul 2019 14:03:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1563019389; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RhYzRjO/q4Ho8bbmSURlp7oc7wF6xtdfqhyOVt7KvzM=;
        b=tIg12rjcEEd/yXmNlbmu+UrjuE+lC3/yS6cYQMu67nf3b1rS1QRLnUKaLuXebGGEj0Bn/2
        yPXu6u6lDWuJN0TFMOLoAwXjZ0AZTjCwr9mt2b/wwc1DyZTcHwYBZaBVDvV/MiF/Z/5X8A
        xL+BVi1hY7cNUdpVQCh5bYdnszxjyZHvUpx3+wKOaFpGjEBxZp9F5BsKoInt3BFiGducNZ
        nbvfiW5zHRNxfEo42P3m8tj/GU4O/V2cJ4GE79k4l6e8PQyID7S0ilXyB3DQs4Jw3nYTYE
        m/Yw6HBAN9HplUkGbsqKZj4BfzXaMzz83hexfjLoBx68CnBmQwX6eQCk0PmmtQ==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id 12CCABEEBD
        for <linux-ppp@vger.kernel.org>; Sat, 13 Jul 2019 14:03:09 +0200 (CEST)
Message-ID: <5D29C87C.9070400@bfs.de>
Date:   Sat, 13 Jul 2019 14:03:08 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
CC:     linux-ppp@vger.kernel.org
Subject: Re: monitoring raw data
References: <5D29B187.6040400@bfs.de> <20190713131005.7f9b0fe3@jive>
In-Reply-To: <20190713131005.7f9b0fe3@jive>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.09
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-1.09 / 7.00];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         TO_DN_NONE(0.00)[];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         MISSING_TO(2.00)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-2.99)[99.98%];
         ARC_NA(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         PREVIOUSLY_DELIVERED(0.00)[linux-ppp@vger.kernel.org];
         RCPT_COUNT_ONE(0.00)[1];
         DKIM_SIGNED(0.00)[];
         NEURAL_HAM(-0.00)[-0.998,0];
         RCVD_COUNT_TWO(0.00)[2];
         RCVD_TLS_ALL(0.00)[]
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org



Am 13.07.2019 13:10, schrieb Lev:
> On Sat, 13 Jul 2019 12:25:11 +0200
> walter harms <wharms@bfs.de> wrote:
> 
>> Hello list,
>> this is a bit off-topic.
>>
>> I am looking for a tools to monitor the connection quality
>> when i send data via a LTE-Modem.
>>
>> Background:
>> I collect data on remote place and send them to a server.
>> At some places i have strange problems, so i would like to
>> monitor the connection quality and perhaps other informations
>> the modem can offer.
>>
>> Is there a programm or a hook i can use inside pppd ? i am pretty
>> sure i am not the first one with such kind of problems.
>>
>> short:
>> I want a simple way to send 1 or 2 AT cmds store the results and
>> continue with ppp.
>>
>> re,
>>  wh
> 
> Hi Walter,
> 
> 
> See the record option of PPPd. Which LTE modem are you using?
> 

modem: Coniugo

the record option seems to be over the top. So far i understand
i can record all trafic. I would prefer a side channel like /dev/ptsX
where i can connect directly to the modem and get data, or something
like a signal that send a given AT line to the modem and returns into
a file. Only ideas no code for now :)

while searching i found this:
 https://github.com/ya-jeks/gsmmux

ever heard about it ?

re,
 wh
