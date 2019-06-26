Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B17F756C72
	for <lists+linux-ppp@lfdr.de>; Wed, 26 Jun 2019 16:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbfFZOoJ (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 26 Jun 2019 10:44:09 -0400
Received: from mail-qk1-f178.google.com ([209.85.222.178]:45207 "EHLO
        mail-qk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfFZOoJ (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 26 Jun 2019 10:44:09 -0400
Received: by mail-qk1-f178.google.com with SMTP id s22so1819164qkj.12
        for <linux-ppp@vger.kernel.org>; Wed, 26 Jun 2019 07:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x8I+aBOESF/YH8dNKS9E//8J9Tlt16HGCCyfZuFfvd0=;
        b=rSXxX3F5Wu/8y7QETlu8kqJyldG5b3ik8H3qYA9znJQPYsXrF14y7Y1vk/42MPSNdZ
         nO9ZpyoSlQFZQJ/kLTCRRP5XXTGmGPziakegy7pwc7kN3E4CuQECP7iExYCOrqTofwYP
         jTH41h/I2Avd79rJH/sdlqJey16t1Y0FNK0BZ478reeIwlzhgE0TP9EVZ88TO8q7d4AQ
         dWS/UJMW15Lsq91tUa85K4YyzmySgDsql2WU4+h+SXBqnOeT0NwC/tG+okfWoegQdVuy
         FHL888wrVov6xYlfpJJWxw7TFfgAqrtAVXIALa1gd4AwcTjN0N3p0nD8eRtYRhBbf4T5
         iLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x8I+aBOESF/YH8dNKS9E//8J9Tlt16HGCCyfZuFfvd0=;
        b=SRwTn+VKBdLrY8GJroXDat7OTOO9MmZbox7F+tO+cJTMmFTfpe+/ty1eETul1xMZq2
         WClzpMDQRT/S6rVuIdYlyTxwubJt6ZGJ8LvvZM05NBjclezucHlTlPYmWlft64UYDgY0
         23+GLkj4DgT53M9SInzOLzRgOPuewZBsoYb7xmjhdyOwwnur2cxqjF8oHDr6SqZzv6aF
         5xI65Xc3HyriVw4Z4BB6IT9+LQ3XZ4MZfWkS7AbxwdnVSFr1mvvliiMnmsFBqWJayzND
         Y2AcwPk+ZBssp92Gs60VO3QzsvedM1+i9uRVdQFthRYO5C9KuE8CX5NfNgYFDD34W1F4
         rjJA==
X-Gm-Message-State: APjAAAXpWi0ha7Ld64/B3pKBM3dgEpYJNSt/ZXOLD+5yVJWxIZrqOznt
        9MdIRyg43jWADj4AR7pJx5DD7jN2WOs4TJ7y8kU60g==
X-Google-Smtp-Source: APXvYqw7Je4uRNo0BHa3tN3+XPHBqYQZ7WgOdzdfNXlS4xAA1/0HGwcc6TM95myNcXb2t9i+DkA8WBWAtjyGwJW8j9Y=
X-Received: by 2002:a37:c81:: with SMTP id 123mr4381216qkm.474.1561560248616;
 Wed, 26 Jun 2019 07:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <CACwWb3B6v7ayhoDpE-GAA8qKgbh=EM95eq9hHxHcZtusAaQqcw@mail.gmail.com>
 <bf1cf4dc-513b-7158-9b13-38ca5c112025@workingcode.com>
In-Reply-To: <bf1cf4dc-513b-7158-9b13-38ca5c112025@workingcode.com>
From:   Levente <leventelist@gmail.com>
Date:   Wed, 26 Jun 2019 16:43:57 +0200
Message-ID: <CACwWb3As+qgy8+Fk2OanSwPi3HDr=g9jzbEncv3i+hE1E28txQ@mail.gmail.com>
Subject: Re: IPv6 with pppd
To:     James Carlson <carlsonj@workingcode.com>
Cc:     linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Yes, you are right. This issue has nothing to do with pppd, it is/was
an OpenWRT misconfiguration. BTW, it works now. Thank you for your
suggestion!

Best regards,
Levente

On Wed, Jun 26, 2019 at 2:45 PM James Carlson <carlsonj@workingcode.com> wrote:
>
> On 06/26/19 07:30, Levente wrote:
> > Dear maintainer,
> >
> >
> > I am struggling with IPv6 over PPP on Linux. The situation is that I
> > have a 3G modem, when I plug it in to the USB on my Debian box,
> > everything works as expected, I have IPv6 address from the provider,
> > and I am happy. But how?
>
> There may be problems with this trace, possibly indicating 3G-specific
> authentication issues, but if your only question is about IPv6, the
> answer is very simple.  PPP doesn't negotiate global scope addresses in
> IPv6.  It does link-local only.  Global scope addresses come from either
> ICMPv6 Router Advertisements, DHCPV6 address assignments, or static
> configuration.
>
> > Please note that in the logs, I can't see that global scope address,
> > and I don't know how the IPv6CP assigns this address to the interface.
> > How is this done?
>
> Some other protocol.  IPV6CP is not involved.
>
> > And when I plug the same modem to an OpenWRT box, I don't get the
> > global scope address, only the link-local address. Is this some PPP
> > specific problem, or there might be some IPv6 autoconfiguration magic
> > happening in the background? I don't think so, because that address
> > corresponds to a statically allocated address of the provider.
> >
> > lev@mercury:~$ host 2a00:1110:135:4594:303e:582f:ea95:aa10
> > 0.1.a.a.5.9.a.e.f.2.8.5.e.3.0.3.4.9.5.4.5.3.1.0.0.1.1.1.0.0.a.2.ip6.arpa
> > domain name pointer
> > 2A00111001354594303E582FEA95AA10.mobile.pool.telekom.hu.
> >
> > Could you help me out what is going on here, and why can't I get a
> > global scope address on the OpenWRT? I'm sure it is an OpenWRT issue,
> > but need help tracing it.
>
> My guess would be that the OpenWRT box doesn't have IPv6 routing enabled
> and isn't doing RAs.  That's just a guess.  I don't believe the issues
> you're having here have anything to do with PPP.
>
> --
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
