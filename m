Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA171AE88C
	for <lists+linux-ppp@lfdr.de>; Sat, 18 Apr 2020 01:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgDQXRZ (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 17 Apr 2020 19:17:25 -0400
Received: from carlson.workingcode.com ([50.78.21.49]:39930 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbgDQXRZ (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 17 Apr 2020 19:17:25 -0400
Received: from [192.168.254.246] (dhcp-246.workingcode.com [192.168.254.246])
        (authenticated bits=0)
        by carlson.workingcode.com (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id 03HNHJa9015353
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 17 Apr 2020 19:17:19 -0400
DKIM-Filter: OpenDKIM Filter v2.10.3 carlson.workingcode.com 03HNHJa9015353
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1587165439;
        bh=XcQxSAgBRpzWXIxkK/76hO4jwsWX7RINzHsc/u1/nbY=;
        h=Subject:From:In-Reply-To:Date:Cc:References:To;
        b=GaChnTWYwodj0/TtATwRNuD0FO07vcRh8AAe8RQYbyW0eUDk66pBsh1R0AggC9WUc
         YoRiaq6civPh+4a+PeR3iig742rnBF25C9McYgcRPDQcbtEf2yz2KBbN+tBualN/g4
         RHBZnwVlun1waxwFNetne3BEldr5mtHOYG80uNhI=
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] Adding EAP-MSCHAPv2 support
From:   James Carlson <carlsonj@workingcode.com>
X-Mailer: iPhone Mail (16G183)
In-Reply-To: <CAKuzOki9kgpmdohOhDSUSV+R_Hr96ETSo1AE5DY-dugsviT9MQ@mail.gmail.com>
Date:   Fri, 17 Apr 2020 19:17:18 -0400
Cc:     linux-ppp@vger.kernel.org, thomas@omerzu.de
Content-Transfer-Encoding: quoted-printable
Message-Id: <4DC221FC-B63E-4E38-A69B-B5A307428E83@workingcode.com>
References: <CAKuzOkiM0Z9DV9LofTtgAi3bEfxzqk0BLm-QpQq0CLHVdT5aAw@mail.gmail.com> <f8639224-8bc6-dc08-f6f9-fff5caa3e148@workingcode.com> <CAKuzOkgM7Zrx35bOrKzDCefxXY3M4EdOuCYhx1Ot-wciJAjYWA@mail.gmail.com> <19d4db3e-d996-280d-96cf-851615ac8398@workingcode.com> <CAKuzOki9kgpmdohOhDSUSV+R_Hr96ETSo1AE5DY-dugsviT9MQ@mail.gmail.com>
To:     Eivind Naess <enaess@gmail.com>
X-DCC-Etherboy-Metrics: carlson 1002; Body=3 Fuz1=3 Fuz2=3
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

I looked over the code, and it looked fine to me.

<carlsonj@workingcode.com>

> On Apr 17, 2020, at 5:13 PM, Eivind Naess <enaess@gmail.com> wrote:
>=20
> Ok, thanks for the clarification. Is there anything that needs to be
> done then? Can this be applied?
>=20
>> On Fri, Apr 17, 2020 at 2:03 PM James Carlson <carlsonj@workingcode.com> w=
rote:
>>=20
>>> On 2020-04-17 16:50, Eivind Naess wrote:
>>> The RFC draft maybe long expired, but Microsoft still has EAP-MSCHAPv2
>>> enabled by default settings. The problem is that if EAP gets
>>> negotiated (because the client supports it), EAP-MSCHAPv2 will
>>> typically be selected. A workaround would be to disable EAP
>>> negotiation on the client side to allow MSCHAPv2 to be selected and
>>> that be only if the Microsoft server is configured to allow that. It's
>>> mostly a compatibility problem for end-users, especially when using
>>> SSTP.
>>=20
>> Oh, I have no doubt that they're using it, and that users will want a
>> feature like this.  I was only pointing out that the submission comment
>> was slightly inaccurate.  There is, as far as I know, no published RFC
>> describing this protocol.
>>=20
>> The document you're citing is an Internet-Draft, not an RFC.  There's no
>> such thing as an "RFC draft."
>>=20
>> The difference is important to folks in the IETF (at least).  An RFC
>> goes through a documented review and acceptance process and never
>> expires.  An I-D is a temporary document that has no necessary review
>> whatsoever and expires after a few months.  It's not correct to refer to
>> an I-D as any sort of RFC.
>>=20
>> --
>> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
>=20
>=20
>=20
> --=20
> Cheers,
> - Eivind

