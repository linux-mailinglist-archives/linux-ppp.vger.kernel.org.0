Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20C8015E826
	for <lists+linux-ppp@lfdr.de>; Fri, 14 Feb 2020 17:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389503AbgBNQ6O (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 14 Feb 2020 11:58:14 -0500
Received: from mail-wm1-f44.google.com ([209.85.128.44]:53194 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392302AbgBNQ6N (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 14 Feb 2020 11:58:13 -0500
Received: by mail-wm1-f44.google.com with SMTP id p9so10660478wmc.2
        for <linux-ppp@vger.kernel.org>; Fri, 14 Feb 2020 08:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=zYtRFnqTRLavgpY0yayqbZmXiLQOxsJ6IZP2JS/aXlk=;
        b=ZuPf7FBunDOIVvxBanBHAB944Ek1NMW1ET6PqFg5GG4WZDobzLcZ0ZlaimkjdZ5Woh
         ddsJuReu7t7G54bdO4Itly1R4OGcc+vjt0x8z6e30F08IHN4qA1P3h4eFqky0e2HAV+2
         F0hQei0w/jLq4QGXycrvzD1ATrJypIyQigYeT5u20PhhM9ZDPlsYnse7gRBNPCw6O0nB
         rtmkNcivGGZlPIExJjuPD6EPUxJDteiU6kVINEQPPOLuZnvdVqrOCLfelYbEXNq9Wqpf
         RPqadb+CF6C/OHBAxI/j6Gk0ERhH81dHTSpJ22vmLzrhbpgj38QwfxkiUXiyH9AANs7D
         TAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=zYtRFnqTRLavgpY0yayqbZmXiLQOxsJ6IZP2JS/aXlk=;
        b=NLm4FVZoaaAzckNa2nBWhKVtmtIKTCnrKQ0gaRfBaK1+A/Upgr5e2dgNq8tESTt4Lf
         2/JnvxJzJaQXggDwrEPQ200SawmMA8LEkkdD2MejBJ+mpmEJhJBCgjSe61wtB20Vvj4n
         sij2MqDoQJdLl5ZXcq6GUuxOHPGxVO3bhWYlC/XwjkjgTwvo7/TJ+jOhrgONYEWJUeJo
         r5rhSNOnOF6AWjLgMhOXBklBUfFt4Hyxf4vYCgMtI2/L+6kZWxTR+OxlycV1NKf2pc08
         pmSQ6wjnUfqNriIQkVKqcWKpGP1kOdN4hYfzmRUn+cs6ut5Ge9b6vP9iBqGuim7OzpBn
         ohZQ==
X-Gm-Message-State: APjAAAW8zBWR4mcRFNcWY2oubU/VFzQvz1HUCpRqUSWNb6lFSYsXusw3
        68uAQGraNG6NkaUdJlXhYOFkJqXl
X-Google-Smtp-Source: APXvYqx0A2/qeQQas8N/KmeBVZxLunw6vY5ZijPvDF1mBtwxnQXBavCq2e+M1mrVPb0AfTMUX/hFaA==
X-Received: by 2002:a05:600c:251:: with SMTP id 17mr5537736wmj.59.1581699491618;
        Fri, 14 Feb 2020 08:58:11 -0800 (PST)
Received: from [192.168.1.8] ([77.126.115.141])
        by smtp.gmail.com with ESMTPSA id r6sm7911317wrq.92.2020.02.14.08.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2020 08:58:10 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   igal avraham <igal38@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Porting source to OSX
Date:   Fri, 14 Feb 2020 18:58:09 +0200
Message-Id: <836660BD-A8FA-4750-87A0-FEF72B8DF5DF@gmail.com>
References: <e49785c8-43cd-7186-2e51-4949ec9a57dc@workingcode.com>
Cc:     linux-ppp@vger.kernel.org
In-Reply-To: <e49785c8-43cd-7186-2e51-4949ec9a57dc@workingcode.com>
To:     James Carlson <carlsonj@workingcode.com>
X-Mailer: iPhone Mail (17C54)
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Thanks for the fast reply.

Are there any guidelines for porting if I want to do it by myself ?

> On 14 Feb 2020, at 18:40, James Carlson <carlsonj@workingcode.com> wrote:
>=20
> =EF=BB=BFOn 2/14/20 9:51 AM, igal avraham wrote:
>> Is there a port available for OS X ?
>=20
> pppd version 2.4.2 is included as part of Mac OS X, but my understanding
> is that this port was done inside Apple and that they haven't released
> source code for it.  The existing publicly-available pppd code doesn't
> have support for a "Darwin" (Mac OS X) kernel.
>=20
> --=20
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
