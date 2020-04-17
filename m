Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34AAC1AE716
	for <lists+linux-ppp@lfdr.de>; Fri, 17 Apr 2020 23:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgDQVDO (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 17 Apr 2020 17:03:14 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:39186 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726093AbgDQVDO (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 17 Apr 2020 17:03:14 -0400
Received: from [50.78.21.49] (carlson [50.78.21.49])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id 03HL32mv008226
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Fri, 17 Apr 2020 17:03:02 -0400
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com 03HL32mv008226
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1587157383;
        bh=nba0qRatIpqG5X6jyKPS6fQjmvFG/7PUHPIujKwBncQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=mIhI4SI9ncp3RnkUOhnXo0SJWd4PWzLrE57Tj1afOZ4lm8HTjbYDHLGsNePl1nBRc
         X7RjrbhgKwD8jR7MYkcQb/33137GtfMClPDarv+CzMAcrD/nCPZFV3dlf8EpkxgsXw
         ltz5k8MPpBzwSsxedRchMKidGvXDnpFG6nvTB4uA=
Subject: Re: [PATCH] Adding EAP-MSCHAPv2 support
To:     Eivind Naess <enaess@gmail.com>
Cc:     linux-ppp@vger.kernel.org, thomas@omerzu.de
References: <CAKuzOkiM0Z9DV9LofTtgAi3bEfxzqk0BLm-QpQq0CLHVdT5aAw@mail.gmail.com>
 <f8639224-8bc6-dc08-f6f9-fff5caa3e148@workingcode.com>
 <CAKuzOkgM7Zrx35bOrKzDCefxXY3M4EdOuCYhx1Ot-wciJAjYWA@mail.gmail.com>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <19d4db3e-d996-280d-96cf-851615ac8398@workingcode.com>
Date:   Fri, 17 Apr 2020 17:03:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAKuzOkgM7Zrx35bOrKzDCefxXY3M4EdOuCYhx1Ot-wciJAjYWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-DCC-x.dcc-servers-Metrics: carlson 104; Body=3 Fuz1=3 Fuz2=3
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 2020-04-17 16:50, Eivind Naess wrote:
> The RFC draft maybe long expired, but Microsoft still has EAP-MSCHAPv2
> enabled by default settings. The problem is that if EAP gets
> negotiated (because the client supports it), EAP-MSCHAPv2 will
> typically be selected. A workaround would be to disable EAP
> negotiation on the client side to allow MSCHAPv2 to be selected and
> that be only if the Microsoft server is configured to allow that. It's
> mostly a compatibility problem for end-users, especially when using
> SSTP.

Oh, I have no doubt that they're using it, and that users will want a
feature like this.  I was only pointing out that the submission comment
was slightly inaccurate.  There is, as far as I know, no published RFC
describing this protocol.

The document you're citing is an Internet-Draft, not an RFC.  There's no
such thing as an "RFC draft."

The difference is important to folks in the IETF (at least).  An RFC
goes through a documented review and acceptance process and never
expires.  An I-D is a temporary document that has no necessary review
whatsoever and expires after a few months.  It's not correct to refer to
an I-D as any sort of RFC.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
