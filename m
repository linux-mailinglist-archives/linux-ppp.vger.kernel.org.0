Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C04A86EADCF
	for <lists+linux-ppp@lfdr.de>; Fri, 21 Apr 2023 17:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbjDUPM1 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 21 Apr 2023 11:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232508AbjDUPM1 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 21 Apr 2023 11:12:27 -0400
Received: from hosting.isp.bg (hosting.isp.bg [78.108.251.2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 204DA12CB0
        for <linux-ppp@vger.kernel.org>; Fri, 21 Apr 2023 08:12:23 -0700 (PDT)
Received: from [192.168.0.102] (crazy-user.25.100.countrybg.net [87.246.25.100])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by hosting.isp.bg (Postfix) with ESMTPSA id 0D0A86401866
        for <linux-ppp@vger.kernel.org>; Fri, 21 Apr 2023 18:12:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=isp.bg; s=default;
        t=1682089942; bh=eKwPFaBHrIn2nEwn0ncn9Bf7RmXkPbAhnGFTPEj2JH4=;
        h=Date:To:From:Subject;
        b=24CYLpk8mC2Ab+XMkYwOeUTiQ9w2L1DuEooXnY4QQpjEUHaRrrbFRZcvZ/CeBGhbM
         jsFCygapI35E5iKKOFQpDJVfQ63gY2G25zBao2/8fs8PLaKcRfDMCk4QNkJMlG05I+
         FvWt54c2a/kXq10Vb5b3SvnJouJ1fkA0nEHfsDFA=
Message-ID: <bc6a5031-f533-d8ca-cb2d-3d5329091a07@isp.bg>
Date:   Fri, 21 Apr 2023 18:12:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To:     linux-ppp@vger.kernel.org
From:   Peter Developer <developer@isp.bg>
Subject: pppd-2.5_plugins_radius_bug.plaintext
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hi,

Sorry for My English, it's not My native language.

I use pppd with FreeRADIUS server for pppoe server.

In DEBIAN 11 Linux with, I noticed these messages in /var/daemon.log:

RADIUS: Can't read config file /etc/radiusclient/radiusclient.conf

The problem is in: pppd/plugins/radius/config.c file.

In function:
int rc_read_config(char *filename)
between rows 236 to 260 we have:
|switch (option->type) {|
|    case OT_STR:|
|    if (set_option_str(filename, line, option, p) < 0)|
|            fclose(configfd);|
|            return (-1);|
|        break;|
|    case OT_INT:|
|        if (set_option_int(filename, line, option, p) < 0)|
|            fclose(configfd);|
|            return (-1);|
|        break;|
|    case OT_SRV:|
|        if (set_option_srv(filename, line, option, p) < 0)|
|            fclose(configfd);|
|            return (-1);|
|        break;|
|    case OT_AUO:|
|        if (set_option_auo(filename, line, option, p) < 0)|
|            fclose(configfd);|
|            return (-1);|
|    break;|
|        default:|
|        fatal("rc_read_config: impossible case branch!");|
|        abort();|
|}|

Operators after if is python like syntax, but this is C/C++

It must be:
|switch (option->type) {|
|    case OT_STR:|
|        if (set_option_str(filename, line, option, p) < 0) {|
|            fclose(configfd);|
|            return (-1);|
|    }|
|break;|
|    case OT_INT:|
|        if (set_option_int(filename, line, option, p) < 0) {|
|            fclose(configfd);|
|            return (-1);|
|        }|
|        break;|
|    case OT_SRV:|
|        if (set_option_srv(filename, line, option, p) < 0) {|
|            fclose(configfd);|
|            return (-1);|
|        }|
|        break;|
|    case OT_AUO:|
|        if (set_option_auo(filename, line, option, p) < 0) {|
|            fclose(configfd);|
|            return (-1);|
|        }|
|        break;|
|    default:|
|        fatal("rc_read_config: impossible case branch!");|
|        abort();|
|}|

with out curly braces operator: return(-1) is executed immediately in 
first iteration,

independent of if result(true or false).

and config file is not reading never.

After fix this problem all work fine!

I hope this post will save someone time.

