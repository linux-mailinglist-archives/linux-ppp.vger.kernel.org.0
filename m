Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 807817783DB
	for <lists+linux-ppp@lfdr.de>; Fri, 11 Aug 2023 00:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbjHJW4A (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 10 Aug 2023 18:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbjHJWz7 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 10 Aug 2023 18:55:59 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1F1E2D4B
        for <linux-ppp@vger.kernel.org>; Thu, 10 Aug 2023 15:55:57 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-63cf9eddbc6so12650796d6.0
        for <linux-ppp@vger.kernel.org>; Thu, 10 Aug 2023 15:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691708157; x=1692312957;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4oc/RdIcA/fLOUy2vgLacm6as8FBZA6nCTMxz/Wm0g=;
        b=nWULKRBJozRRJWZocekkEnBkflzI8ZmEc7SKeLiST1IAJ4B+Bt0SyDKPJXTOF62XpP
         dwOFwOCiBzhu+HkW6cTak+uFFC8XwOoixpIHFcnIWrKcacaWwYCNobbFDP0TU166Gu1o
         acTIqAnRuIscymb/nsgPRs+T4EbmWCMY4e+1zJp5qd/wn3k26rWoiZLaa5HfCI4ClAYe
         d2sXOxUH3/YkCUvheyDqEFKNyLLH3XAZo6j+5i9RiSGBIH2zLDcDNBOE0vsLlAjrAHTY
         aD/txoDjkK4WtGxg0rWpcAU0F2mNxbnRolgbvA+4dAMuIQybql6qegAr4lMmnrUAJVWF
         Xxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691708157; x=1692312957;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4oc/RdIcA/fLOUy2vgLacm6as8FBZA6nCTMxz/Wm0g=;
        b=LS0bccUMQYDpFCK8NvGdHjbHoEfN7JU4C2cBAHVJ/JXB6H2fOmVvlwc0ljE3iOE8Xu
         QV3PiN/bRFVSbSzUsPpUgLcj8sDpZzoWY/eNp3+c2rJbKhMNA0NmdEsKNewlhrETVbO6
         WTq4ue3eDX5ITj22uJ+RtTxGWYV9l51uwkhTqHiF67EsOv+nrbQdw0wXNzR4IYtiYYOd
         B3BYccPmxm8k6pXNeuWwJ6lTvLcoijAebeKsEtI+1utAJxNPisxYGlZjMxc4zCzjw6gk
         EUQa1ShQu4A1HhZpYKOrbqW2SGBhoD+x4w8KDm99LiqEoFPXd9PZA3xWbGHBwQbcWcTl
         DUqQ==
X-Gm-Message-State: AOJu0Yyl2FN8bR9uGWl9Z45FE5NnMyEW08zbKlHJvb11AH7haJUcyBQe
        KYsHlYJl3qmZXJnaA7WOY1HWTrixRZ9Jap1wuC/sV6yshwQ=
X-Google-Smtp-Source: AGHT+IH+ucjync3HqHvTaIWnIEdmmUsda7bDracqbVnKyOP4BLpdycWI+gR4xo2NSHqMlpclGh2L+kMTWSVgwCQVtlM=
X-Received: by 2002:a05:6214:5188:b0:631:eca9:1964 with SMTP id
 kl8-20020a056214518800b00631eca91964mr3725285qvb.24.1691708156590; Thu, 10
 Aug 2023 15:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAO+buQMqbKsFHiSA4yXwyfcU4nLGhO7p7J87ZZKMVQAWDE_5tw@mail.gmail.com>
 <5665.1691685607@localhost>
In-Reply-To: <5665.1691685607@localhost>
From:   David Gyimesi <david6670@gmail.com>
Date:   Fri, 11 Aug 2023 08:55:45 +1000
Message-ID: <CAO+buQPUATAeBu_+8metJd84WNUsJrGEM-a8oFdMYjb=TuYotg@mail.gmail.com>
Subject: Re: "Timeout waiting for PADO packets" until reboot
To:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Thanks Michael
Correct it is GPON. I also think the PPP server forgets the PPP client
after a while and doesn't send PADO packets anymore. But interestingly
a FreeBSD is able to re-establish the connection in the same
situation.

Previously I had the same issue with FreeBSD's MPD PPP client, after a
long outage I had to restart the system. After many failed attempts to
reproduce an outage and troubleshoot the issue, I contacted
developers. First they gave a workaround then later implemented a fix
in the MPD PPP client.
https://sourceforge.net/p/mpd/discussion/44693/thread/7a19aeb247/
Since then I had multiple long outages, but the MPD has been always
able to re-establish the connection, no system restart required
anymore. Just checked the uptime which is almost 400 days on the BSD
router.

My BSD router is having the same GPON and ISP as the Linux router,
therefore the recent multi hour outage affected both boxes at the same
time. While the Linux kept printing the "Timeout waiting for PADO
packets" messages the BSD router was able to recover after 943
recovery attempts, please find logs below.

I believe that if the FreeBSD MPD PPP client is able to solve the
situation and re-establish the connection without reboot, the Linux
pppd could definitely do the same.
Would you please help me with what logs I can collect or test I can do
which help developers to identify the gap in the pppd and fix it?

Thank you!
David

FreeBSD PPP client recovery log after multi hour outage:
Aug 6 02:03:47 ppp 31322 [wan_link0] Link: reconnection attempt 941
Aug 6 02:03:47 ppp 31322 [wan_link0] PPPoE: Connecting to ''
Aug 6 02:03:56 ppp 31322 [wan_link0] PPPoE connection timeout after 9 secon=
ds
Aug 6 02:03:56 ppp 31322 [wan_link0] Link: DOWN event
Aug 6 02:03:56 ppp 31322 [wan_link0] LCP: Down event
Aug 6 02:03:56 ppp 31322 [wan_link0] Link: reconnection attempt 942 in 4 se=
conds
Aug 6 02:04:00 ppp 31322 [wan_link0] Link: reconnection attempt 942
Aug 6 02:04:00 ppp 31322 [wan_link0] PPPoE: Connecting to ''
Aug 6 02:04:09 ppp 31322 [wan_link0] PPPoE connection timeout after 9 secon=
ds
Aug 6 02:04:09 ppp 31322 [wan_link0] Link: DOWN event
Aug 6 02:04:09 ppp 31322 [wan_link0] LCP: Down event
Aug 6 02:04:09 ppp 31322 [wan_link0] Link: reconnection attempt 943 in 4 se=
conds
Aug 6 02:04:13 ppp 31322 [wan_link0] Link: reconnection attempt 943
Aug 6 02:04:13 ppp 31322 [wan_link0] PPPoE: Connecting to ''
Aug 6 02:04:19 ppp 31322 PPPoE: rec'd ACNAME "bng2.eqxsy4.fl"
Aug 6 02:04:19 ppp 31322 [wan_link0] PPPoE: connection successful
Aug 6 02:04:19 ppp 31322 [wan_link0] Link: UP event
Aug 6 02:04:19 ppp 31322 [wan_link0] LCP: Up event
Aug 6 02:04:19 ppp 31322 [wan_link0] LCP: state change Starting --> Req-Sen=
t
Aug 6 02:04:19 ppp 31322 [wan_link0] LCP: SendConfigReq #115
Aug 6 02:04:19 ppp 31322 [wan_link0] PROTOCOMP
Aug 6 02:04:19 ppp 31322 [wan_link0] MRU 1492
Aug 6 02:04:19 ppp 31322 [wan_link0] MAGICNUM 0x01f16262
Aug 6 02:04:20 ppp 31322 [wan_link0] LCP: rec'd Configure Request #43 (Req-=
Sent)
Aug 6 02:04:20 ppp 31322 [wan_link0] MRU 1492
Aug 6 02:04:20 ppp 31322 [wan_link0] AUTHPROTO PAP
Aug 6 02:04:20 ppp 31322 [wan_link0] MAGICNUM 0x52b45814
Aug 6 02:04:20 ppp 31322 [wan_link0] LCP: SendConfigAck #43
Aug 6 02:04:20 ppp 31322 [wan_link0] MRU 1492
Aug 6 02:04:20 ppp 31322 [wan_link0] AUTHPROTO PAP
Aug 6 02:04:20 ppp 31322 [wan_link0] MAGICNUM 0x52b45814
Aug 6 02:04:20 ppp 31322 [wan_link0] LCP: state change Req-Sent --> Ack-Sen=
t
Aug 6 02:04:20 ppp 31322 [wan_link0] LCP: rec'd Configure Ack #115 (Ack-Sen=
t)
Aug 6 02:04:20 ppp 31322 [wan_link0] PROTOCOMP
Aug 6 02:04:20 ppp 31322 [wan_link0] MRU 1492
Aug 6 02:04:20 ppp 31322 [wan_link0] MAGICNUM 0x01f16262
Aug 6 02:04:20 ppp 31322 [wan_link0] LCP: state change Ack-Sent --> Opened
Aug 6 02:04:20 ppp 31322 [wan_link0] LCP: auth: peer wants PAP, I want noth=
ing
Aug 6 02:04:20 ppp 31322 [wan_link0] PAP: using authname "fgjo844gfh9@ox.co=
m"
Aug 6 02:04:20 ppp 31322 [wan_link0] PAP: sending REQUEST #1 len: 46
Aug 6 02:04:20 ppp 31322 [wan_link0] LCP: LayerUp
Aug 6 02:04:21 ppp 31322 [wan_link0] PAP: rec'd ACK #1 len: 5
Aug 6 02:04:21 ppp 31322 [wan_link0] LCP: authorization successful
Aug 6 02:04:21 ppp 31322 [wan_link0] Link: Matched action 'bundle "wan" ""'
Aug 6 02:04:21 ppp 31322 [wan_link0] Link: Join bundle "wan"
Aug 6 02:04:21 ppp 31322 [wan] Bundle: Status update: up 1 link, total
bandwidth 64000 bps
Aug 6 02:04:21 ppp 31322 [wan] IPCP: Open event
Aug 6 02:04:21 ppp 31322 [wan] IPCP: state change Initial --> Starting
Aug 6 02:04:21 ppp 31322 [wan] IPCP: LayerStart
Aug 6 02:04:21 ppp 31322 [wan] IPV6CP: Open event
Aug 6 02:04:21 ppp 31322 [wan] IPV6CP: state change Initial --> Starting
Aug 6 02:04:21 ppp 31322 [wan] IPV6CP: LayerStart
Aug 6 02:04:21 ppp 31322 [wan] IPCP: Up event
Aug 6 02:04:21 ppp 31322 [wan] IPCP: state change Starting --> Req-Sent
Aug 6 02:04:21 ppp 31322 [wan] IPCP: SendConfigReq #146
Aug 6 02:04:21 ppp 31322 [wan] IPADDR 0.0.0.0
Aug 6 02:04:21 ppp 31322 [wan] COMPPROTO VJCOMP, 16 comp. channels, no comp=
-cid
Aug 6 02:04:21 ppp 31322 [wan] PRIDNS 0.0.0.0
Aug 6 02:04:21 ppp 31322 [wan] SECDNS 0.0.0.0
Aug 6 02:04:21 ppp 31322 [wan] IPV6CP: Up event
Aug 6 02:04:21 ppp 31322 [wan] IPV6CP: state change Starting --> Req-Sent
Aug 6 02:04:21 ppp 31322 [wan] IPV6CP: SendConfigReq #215
Aug 6 02:04:21 ppp 31322 [wan] IPCP: rec'd Configure Request #166 (Req-Sent=
)
Aug 6 02:04:21 ppp 31322 [wan] IPADDR 220.158.188.4
Aug 6 02:04:21 ppp 31322 [wan] 220.158.188.4 is OK
Aug 6 02:04:21 ppp 31322 [wan] IPCP: SendConfigAck #166
Aug 6 02:04:21 ppp 31322 [wan] IPADDR 220.158.188.4
Aug 6 02:04:21 ppp 31322 [wan] IPCP: state change Req-Sent --> Ack-Sent
Aug 6 02:04:21 ppp 31322 [wan] IPCP: rec'd Configure Reject #146 (Ack-Sent)
Aug 6 02:04:21 ppp 31322 [wan] COMPPROTO VJCOMP, 16 comp. channels, no comp=
-cid
Aug 6 02:04:21 ppp 31322 [wan] IPCP: SendConfigReq #147
Aug 6 02:04:21 ppp 31322 [wan] IPADDR 0.0.0.0
Aug 6 02:04:21 ppp 31322 [wan] PRIDNS 0.0.0.0
Aug 6 02:04:21 ppp 31322 [wan] SECDNS 0.0.0.0
Aug 6 02:04:21 ppp 31322 [wan_link0] LCP: rec'd Protocol Reject #44 (Opened=
)
Aug 6 02:04:21 ppp 31322 [wan_link0] LCP: protocol IPV6CP was rejected
Aug 6 02:04:21 ppp 31322 [wan] IPV6CP: protocol was rejected by peer
Aug 6 02:04:21 ppp 31322 [wan] IPV6CP: state change Req-Sent --> Stopped
Aug 6 02:04:21 ppp 31322 [wan] IPV6CP: LayerFinish
Aug 6 02:04:21 ppp 31322 [wan] IPCP: rec'd Configure Nak #147 (Ack-Sent)
Aug 6 02:04:21 ppp 31322 [wan] IPADDR 160.202.143.224
Aug 6 02:04:21 ppp 31322 [wan] 160.202.143.224 is OK
Aug 6 02:04:21 ppp 31322 [wan] PRIDNS 1.1.1.1
Aug 6 02:04:21 ppp 31322 [wan] SECDNS 8.8.8.8
Aug 6 02:04:21 ppp 31322 [wan] IPCP: SendConfigReq #148
Aug 6 02:04:21 ppp 31322 [wan] IPADDR 160.202.143.224
Aug 6 02:04:21 ppp 31322 [wan] PRIDNS 1.1.1.1
Aug 6 02:04:21 ppp 31322 [wan] SECDNS 8.8.8.8
Aug 6 02:04:22 ppp 31322 [wan] IPCP: rec'd Configure Ack #148 (Ack-Sent)
Aug 6 02:04:22 ppp 31322 [wan] IPADDR 160.202.143.224
Aug 6 02:04:22 ppp 31322 [wan] PRIDNS 1.1.1.1
Aug 6 02:04:22 ppp 31322 [wan] SECDNS 8.8.8.8
Aug 6 02:04:22 ppp 31322 [wan] IPCP: state change Ack-Sent --> Opened
Aug 6 02:04:22 ppp 31322 [wan] IPCP: LayerUp
Aug 6 02:04:22 ppp 31322 [wan] 160.202.143.224 -> 220.158.188.4
Aug 6 02:04:23 ppp 31322 [wan] IFACE: Up event
Aug 6 02:04:23 ppp 31322 [wan] IFACE: Rename interface ng0 to pppoe0
Aug 6 02:04:23 ppp 31322 [wan] IFACE: Add description "WAN"

On Fri, Aug 11, 2023 at 2:40=E2=80=AFAM Michael Richardson <mcr@sandelman.c=
a> wrote:
>
>
> David Gyimesi <david6670@gmail.com> wrote:
>     > If there is a short, let's say only 10 minutes, outage between the =
home
>     > and the ISP, the router prints "pppd[17084]: Timeout waiting for PA=
DO
>     > packets" messages but it is able to re-establish the connection
>     > automatically when the outage is resolved.
>
>     > However if the outage is relatively longer the router just keeps
>     > printing "pppd[17084]: Timeout waiting for PADO packets" messages a=
nd
>     > even if the outage has been resolved the router is not able to
>     > re-establish the PPPoE connection. However after a reboot the route=
r is
>     > able to establish the PPPoE connection without problem.
>
> I experience the same thing.
>
> What I think is that the DSL/PPPoE network simply forgets what your route=
r's
> MAC address is, and the router reboot sends something else that makes it =
all
> work again.  Maybe because the virtual (L2) circuit is reastablished. Tha=
t's
> for the VDSL situation that I have.
>
> FTTH has many implementations, some have overlays on top of the GPON.
> The fact that you have PPPoE at all suggests that is the case.
> Not everyone has GPON, even.
>
> I don't have a solution, but I've looked for some clear indication.
> My friendly third-party ISP has looked at their end as well, and when the
> connection is in the bad state, they see nothing.  In between are the
> completely incompetent incumbent telco.
> (I live in Ottawa, Canada)
>
> --
> Michael Richardson <mcr+IETF@sandelman.ca>   . o O ( IPv6 I=C3=B8T consul=
ting )
>            Sandelman Software Works Inc, Ottawa and Worldwide
>
>
>
>
