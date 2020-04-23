Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC041B5125
	for <lists+linux-ppp@lfdr.de>; Thu, 23 Apr 2020 02:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgDWAI0 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 22 Apr 2020 20:08:26 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40850 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725854AbgDWAIZ (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 22 Apr 2020 20:08:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587600504;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AaNVJoHAX3NNo2+efUec5KuzV4Ig4DY3rjsitX5gLfE=;
        b=YZxNIudKKdWqow9ZdCU7Az1qHUJWIsS2tkh5hm2lTgQ+IOJUv2p7U9s3d/vvlk4+Aq7hac
        oZlZpbWN/pIKpZvs8SVhbEJPgQZhseicZu9qKtKZSs2EbJMdgbud/7t2I5uKJUZIMCka63
        KQm8335YINplu5cov+yIM5dyujgf6go=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-w_fC5mAGOlaXcfwHaNMj6g-1; Wed, 22 Apr 2020 20:08:22 -0400
X-MC-Unique: w_fC5mAGOlaXcfwHaNMj6g-1
Received: by mail-wm1-f70.google.com with SMTP id d134so3249355wmd.0
        for <linux-ppp@vger.kernel.org>; Wed, 22 Apr 2020 17:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=AaNVJoHAX3NNo2+efUec5KuzV4Ig4DY3rjsitX5gLfE=;
        b=mKA0pbXotLxAh6dPXiz4F84BE+KHk5L2KyyyAaIJmkA6PToKwcXrBBukmFc3RGGyPg
         xxJjBjhGZmInZ1wFESvL6N+FgYffxHVKTmnxkgS06HCaMMw3qZ7EIBPCUf/2eB2BPVou
         1xpjsyhTx/Ua9RHV8qZMpdKoYCp684sKSDBooC1P1NxT0mbgvG14EOkrEpjz2jHVOaXx
         KorRFjEmFuGVdUX+RYDCkSoUPyQTJzQH9/kkMTIfhljceKrDEejvZ9ACCzHhuXEqZi7w
         nSplhtawXO7QwaaAFjUIzi8lHPzSsIimgjUTdgLFtCvvIX84rCRXBLfC4vZV7pF7wDQw
         o2Hg==
X-Gm-Message-State: AGi0Pua0wzKgNR6TzrJL+OYfQiLytTkSU4WbKCP5G8lesAGSxSua4/Mv
        N4dsJbzyn5HCdt3oS6LLOjeMNSlfFQLAeW6NqVrV02s+ils92qfhBwFY3lmsdEo+8o3VOoDFbBO
        qaiPwP4g8ktxhGxOe/KMW
X-Received: by 2002:a05:600c:214b:: with SMTP id v11mr1058292wml.151.1587600501033;
        Wed, 22 Apr 2020 17:08:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypKOkEa0pc+7ShqpUku2eyc4a8ujPMRcODj8RcMHuexTfBK5AnMJW5tc2JpI0ODvh7b4jR336w==
X-Received: by 2002:a05:600c:214b:: with SMTP id v11mr1058274wml.151.1587600500746;
        Wed, 22 Apr 2020 17:08:20 -0700 (PDT)
Received: from pc-3.home (2a01cb0585138800b113760e11343d15.ipv6.abo.wanadoo.fr. [2a01:cb05:8513:8800:b113:760e:1134:3d15])
        by smtp.gmail.com with ESMTPSA id w10sm1192411wrg.52.2020.04.22.17.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 17:08:20 -0700 (PDT)
Date:   Thu, 23 Apr 2020 02:08:17 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     James Carlson <carlsonj@workingcode.com>
Cc:     David =?utf-8?Q?Bala=C5=BEic?= <xerces9@gmail.com>,
        linux-ppp@vger.kernel.org
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-ID: <20200423000817.GA25404@pc-3.home>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
 <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com>
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Wed, Apr 22, 2020 at 06:00:52PM -0400, James Carlson wrote:
> On 2020-04-22 13:45, David Balažic wrote:
> > Hi!
> > 
> > I have a router running openwrt connected to a GPON ONT, running a
> > PPPoE connection (hw details below).
> 
> This looks to be (possibly) a PPPoE failure, though there's nothing
> interesting in the log messages provided.  If there were an interesting
> log message, it would almost certainly come somewhere (perhaps even
> *minutes*) before that initial "Modem hangup" message.
> 
> The definitive test would be to run a packet capture on the Ethernet
> interface itself (*not* on the PPP interface) with something like
> Wireshark and determine what happens in the lead-up to the failure.  I'd
> expect the system is just getting a stray PADT from the peer, if it's
> some kind of PPPoE problem.
> 
I'd also suspect that the peer just sent a PADT. That can be
intentional. Some providers proactively force reconnections
every x days. Though 20 hours looks like a really low timeout.
You can capture PPPoE discovery packets with
"tcpdump -i nic-eth1.3902 pppoed".

Another possibility is that the network interface is modified
(interface passed down, MTU or the MAC address changed) while the
PPPoE session is established.

> If it isn't, then possibly it's something else.  I think that the last
> time I looked at the PPPoE implementation on Linux it was a bit hokey --
> it ran PPP over a pty pair and then decoded the framing in user space
> and wrote it back out over Ethernet using PPPoE.  I hope it's not still
> like that, as I haven't looked at it in years, but it may well be.  An
> internal error in that logic could also cause a "hangup" message,
> although hopefully along with some kind of system log about a core file
> as well.
> 
I didn't know about that implementation. PPPoE has been implemented
using PPPOX sockets since at least the beginning of the git history.

> (The implementation on other platforms, such as Solaris, was a bit more
> solid.)
> 
> -- 
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
> 

