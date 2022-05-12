Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7603E5255B5
	for <lists+linux-ppp@lfdr.de>; Thu, 12 May 2022 21:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352586AbiELT21 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 12 May 2022 15:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348764AbiELT2Z (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 12 May 2022 15:28:25 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD72855498
        for <linux-ppp@vger.kernel.org>; Thu, 12 May 2022 12:28:24 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id qe3-20020a17090b4f8300b001dc24e4da73so6396432pjb.1
        for <linux-ppp@vger.kernel.org>; Thu, 12 May 2022 12:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=nKxpnVl899oy/IAu6ozQa8OO5A9+iaoFiGQ+KlFa3pg=;
        b=RN/2RvCPfSVh0Ss3FKdr/sXPSL2YgBmG2DqZVftlw5XDPW+4Yb5/ec7lTIpAh50mhX
         t/GDRTIyvTlopXm4F5ZU7wP5gh8ndahBOxCTu1Niw4gAngDOJoblAW/1bKKV8C211Lvl
         D2GLxya5eDlseqMacSL5LcKjzStrXQQoAVHn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=nKxpnVl899oy/IAu6ozQa8OO5A9+iaoFiGQ+KlFa3pg=;
        b=3wRE3oMkGBpki5Y2Mwuk53R4DY3I/9nTArmbwqGJ+Z8GjI8X3NLApzsnzl7BPQg/pL
         eUW9N/tykl959WTyPax3Nn6xJvPUCyWd+fv5CelClx/AnvhpwynG8Jwhj4M6t5iRyQEY
         eCgHzOKoSa+x+uMeKimq34xiidZwzfBxtQuiw/fLVYS9NZj56nDNuSfjuaddcEW8d+/+
         IBATEylhb69R9/JzZ0ia7zaY3+7H7kwSiZ2N+QMCV+wIEGPMf03Fa2BOTYk8Z+0UC8lF
         sZ8qfVGbbV/RyLozRJFZ3ZoVo6i5NN+y2uiJWZoaPpMudHos6xjbntKFYy7BTQrzix8u
         NMzA==
X-Gm-Message-State: AOAM532ueMp5fNF3qo7ljuh8UIIf+2BNYJehMyyK3wsPiXBM+cPRFJQa
        FTEC9c+3QJkTxm49ePmHQKGHPA==
X-Google-Smtp-Source: ABdhPJxVA4yLHYiqPT41XDD2HjRvEp2U/uSwQgn4R7Xk6v/oLSpRSAAfQRPi2s6lRdXNqE1gWUs5WA==
X-Received: by 2002:a17:903:290:b0:15c:1c87:e66c with SMTP id j16-20020a170903029000b0015c1c87e66cmr1176000plr.61.1652383703956;
        Thu, 12 May 2022 12:28:23 -0700 (PDT)
Received: from [192.168.1.33] ([50.45.132.243])
        by smtp.googlemail.com with ESMTPSA id t4-20020a170902e84400b0015eb690bee9sm257876plg.196.2022.05.12.12.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 12:28:23 -0700 (PDT)
Message-ID: <dc47ac41-c9d8-7952-1ad3-bd651db0c254@schmorgal.com>
Date:   Thu, 12 May 2022 12:28:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>,
        James Carlson <carlsonj@workingcode.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org
References: <20220509150130.1047016-1-kuba@kernel.org>
 <CAK8P3a0FVM8g0LG3_mHJ1xX3Bs9cxae8ez7b9qvGOD+aJdc8Dw@mail.gmail.com>
 <20220509103216.180be080@kernel.org>
 <9cac4fbd-9557-b0b8-54fa-93f0290a6fb8@schmorgal.com>
 <CAK8P3a1AA181LqQSxnToSVx0e5wmneUsOKfmnxVMsUNh465C_Q@mail.gmail.com>
 <d7076f95-b25b-3694-1ec2-9b9ff93633b7@schmorgal.com>
 <CAK8P3a3Tj=aJM_-x17uw1yJ-5+DgKX6APgEaO0sa=aRBKya1XQ@mail.gmail.com>
 <0078ff43-f9fa-1deb-b64d-170d3d93ee6f@workingcode.com>
 <CAK8P3a0xmXYU5iNki3BX25J73jcy+xJ=bf67G6PqAHjRwckFRA@mail.gmail.com>
From:   Doug Brown <doug@schmorgal.com>
Subject: Re: [PATCH net-next] net: appletalk: remove Apple/Farallon LocalTalk
 PC support
In-Reply-To: <CAK8P3a0xmXYU5iNki3BX25J73jcy+xJ=bf67G6PqAHjRwckFRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 5/12/2022 12:21 PM, Arnd Bergmann wrote:
> On Thu, May 12, 2022 at 8:11 PM James Carlson <carlsonj@workingcode.com> wrote:
>>
>> I would've thought AppleTalk was completely gone by now, and I certainly
>> would not be sad to see the dregs removed from pppd, but there was a
>> patch release on the netatalk package just last month, so what do I know?
> 
> I think netatalk 3.0 dropped all appletalk protocol stuff a long time ago and
> only supports AFP over IP.
That's right. The older netatalk 2.x branch has a few different branches 
on GitHub that are being maintained to allow AppleTalk connectivity with 
older Macs through Ethernet (or LocalTalk-to-Ethernet bridges), so 
people are still actively using AppleTalk with Ethernet.

BTW, I messed up my quoting in my previous message so it was hard to see 
part of my reply -- but I agree that everything in drivers/net/appletalk 
could go away except for the Kconfig entry for CONFIG_ATALK. And dev.c 
and the other LocalTalk-specific bits in net/appletalk could go away.
