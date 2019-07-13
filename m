Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0F89679E0
	for <lists+linux-ppp@lfdr.de>; Sat, 13 Jul 2019 13:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727418AbfGMLKL (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Sat, 13 Jul 2019 07:10:11 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:33722 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbfGMLKK (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sat, 13 Jul 2019 07:10:10 -0400
Received: by mail-wm1-f52.google.com with SMTP id h19so10888251wme.0
        for <linux-ppp@vger.kernel.org>; Sat, 13 Jul 2019 04:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cuSGJDSR+1rC5FCFlpsnFw5Srmc6eaIffHAQj4rYkLo=;
        b=MW7YU0LY1omD4sWxnzEh5xv37ydE4CBXZ0u0XA/9IJUmTh6y8GGYOCh6bCFdZtcNZt
         QSDXnapxMvBXBxYDWUDFdgH8wPmhIQmO4BwlnaL6vOkhNns4nbtrDgn/u/YrOpheRYaY
         ZDsxH8yzmiB49SOWOUShYGfwh8pIAgIaQ7kjIIN4Cp6Jh9lFDbS2oSZqBRWpCjTrLAzj
         vH3Bw+JfXh72MYnxu3lxTd94qn752yv9khNpo9zFYqz46SO6vnLe8nSfwf8GGv3nrvRx
         TDjsD4MFvivMM0IdM528v23B0ByXb8UaWnrqMry9ONhPcS72D6bV4MbtJpddA04buan+
         2pTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cuSGJDSR+1rC5FCFlpsnFw5Srmc6eaIffHAQj4rYkLo=;
        b=p8yjigOGbSGVhh6DAT0Tvpzpfye4zoyZGGD8GeWlCqrd3w+AzkYVd1EtWifUJFMKLK
         OFvkMf8KfRtdelzONE+O3UnBdqyKlCXcpW7pqWBnJCC55E97ZKuvE0pv4sOidpNkSiOT
         B2Oo/s5EFzqmzu2heqQ/f0x230j8W0F3C4UAWemFfO4t+usVeAp1v2aZgaIOrSby4YJe
         MvIU8uH6PGv1i00rximuIGjcSNwHQA4oqwW5Ewyrv04z9GzA25evokQsioRt7krt/SRF
         /jPTzJDhSWljNm7Q4A8SkWuLCvSuBTcksyEccIANsl3skw2/yyaHav/VLKMImRwXpmf3
         Qm1Q==
X-Gm-Message-State: APjAAAUQb0OUwrxaiqhQQmOvxuB37uK6EDuIEauqQ1SRqaXQgH+RKxC0
        Mt2GwviPvVkrAlzAkUcp7M4=
X-Google-Smtp-Source: APXvYqwh+drxxd1YsV9NxJx2geLSOUS79dWzV2Fq9HhbYtg4imcIVQNXwFh8w1wRfTUCF5Plx5jVHQ==
X-Received: by 2002:a1c:544d:: with SMTP id p13mr15140854wmi.78.1563016207673;
        Sat, 13 Jul 2019 04:10:07 -0700 (PDT)
Received: from jive (5E1BC7AE.mobile.pool.telekom.hu. [94.27.199.174])
        by smtp.gmail.com with ESMTPSA id p14sm10716082wrx.17.2019.07.13.04.10.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 13 Jul 2019 04:10:07 -0700 (PDT)
Date:   Sat, 13 Jul 2019 13:10:05 +0200
From:   Lev <leventelist@gmail.com>
To:     walter harms <wharms@bfs.de>
Cc:     linux-ppp@vger.kernel.org
Subject: Re: monitoring raw data
Message-ID: <20190713131005.7f9b0fe3@jive>
In-Reply-To: <5D29B187.6040400@bfs.de>
References: <5D29B187.6040400@bfs.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

T24gU2F0LCAxMyBKdWwgMjAxOSAxMjoyNToxMSArMDIwMA0Kd2FsdGVyIGhhcm1zIDx3aGFybXNA
YmZzLmRlPiB3cm90ZToNCg0KPiBIZWxsbyBsaXN0LA0KPiB0aGlzIGlzIGEgYml0IG9mZi10b3Bp
Yy4NCj4gDQo+IEkgYW0gbG9va2luZyBmb3IgYSB0b29scyB0byBtb25pdG9yIHRoZSBjb25uZWN0
aW9uIHF1YWxpdHkNCj4gd2hlbiBpIHNlbmQgZGF0YSB2aWEgYSBMVEUtTW9kZW0uDQo+IA0KPiBC
YWNrZ3JvdW5kOg0KPiBJIGNvbGxlY3QgZGF0YSBvbiByZW1vdGUgcGxhY2UgYW5kIHNlbmQgdGhl
bSB0byBhIHNlcnZlci4NCj4gQXQgc29tZSBwbGFjZXMgaSBoYXZlIHN0cmFuZ2UgcHJvYmxlbXMs
IHNvIGkgd291bGQgbGlrZSB0bw0KPiBtb25pdG9yIHRoZSBjb25uZWN0aW9uIHF1YWxpdHkgYW5k
IHBlcmhhcHMgb3RoZXIgaW5mb3JtYXRpb25zDQo+IHRoZSBtb2RlbSBjYW4gb2ZmZXIuDQo+IA0K
PiBJcyB0aGVyZSBhIHByb2dyYW1tIG9yIGEgaG9vayBpIGNhbiB1c2UgaW5zaWRlIHBwcGQgPyBp
IGFtIHByZXR0eQ0KPiBzdXJlIGkgYW0gbm90IHRoZSBmaXJzdCBvbmUgd2l0aCBzdWNoIGtpbmQg
b2YgcHJvYmxlbXMuDQo+IA0KPiBzaG9ydDoNCj4gSSB3YW50IGEgc2ltcGxlIHdheSB0byBzZW5k
IDEgb3IgMiBBVCBjbWRzIHN0b3JlIHRoZSByZXN1bHRzIGFuZA0KPiBjb250aW51ZSB3aXRoIHBw
cC4NCj4gDQo+IHJlLA0KPiAgd2gNCg0KSGkgV2FsdGVyLA0KDQoNClNlZSB0aGUgcmVjb3JkIG9w
dGlvbiBvZiBQUFBkLiBXaGljaCBMVEUgbW9kZW0gYXJlIHlvdSB1c2luZz8NCg0KDQpCZXN0LA0K
TGV2ZW50ZQ0KDQotLSANCkxldmVudGUgS292YWNzDQpTZW5pb3IgRWxlY3Ryb25pYyBFbmdpbmVl
cg0KDQpXOiBodHRwOi8vbGV2ZW50ZS5sb2dvbmV4LmV1DQo=
