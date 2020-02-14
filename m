Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 309D515D9CE
	for <lists+linux-ppp@lfdr.de>; Fri, 14 Feb 2020 15:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729415AbgBNOvw (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 14 Feb 2020 09:51:52 -0500
Received: from mail-wm1-f52.google.com ([209.85.128.52]:56009 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbgBNOvw (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 14 Feb 2020 09:51:52 -0500
Received: by mail-wm1-f52.google.com with SMTP id q9so10218206wmj.5
        for <linux-ppp@vger.kernel.org>; Fri, 14 Feb 2020 06:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:date:subject:message-id
         :to;
        bh=wnWxyUhyjW9ysw/612tlNht2E2ihlBty2NnU1mTy1no=;
        b=vO3saEZvZ5FsaXJY8WhYIdpX314vUWCwfWpfVNln7Pd/Hepe/07Sw2DF5PClCdr2jw
         dqjh9JwnfPV4NfGXY7BIHptHzJxgpQ0MxhR+1EQgIRLMy5K6fO3RDfJansqKZyImdWql
         vuh9HdKiaE218gxtswnZiI/opAIUDa9vzVyote7gG+Rf0vFrW0+jiSrfks5bdUiDXd1f
         WQZzwnvUZWbq8zqQH38K0aoxEzrhiuuhEAbu4mpl2o7kMDuza51+BHwUJdl5qZr6NPdO
         qSmPHt0fH3sR+Czo+d1bxJd/VgTuPQFs75ixoOl+u3+mZqRQ2uxmHv2n8UT/XqSGdiM9
         hJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
         :subject:message-id:to;
        bh=wnWxyUhyjW9ysw/612tlNht2E2ihlBty2NnU1mTy1no=;
        b=Hr3xWHKnrXzPgG615+eVjDk/aelImd2VqrNAHTAsgbJpQxFU457+TSHQ6omM4Gh5/B
         S3RqwS0eCxgTHkmozSZC2J65wmqo1gNPcu/Lp5vAWE4dD5Na2msL7F9sUJ6TtwcQWZUU
         i+H26yKuBsu6bbiR60anrlXqs84FFsszzwfXA2joNQSK2Uzq43rYPPxLANMQLOtoOvKy
         OzzwbxGZb8sUcRXuZcGo/A9K+lGuH7zOIjGNxlmx6YmDJ98BeXV8BAtLJlXrbYsEt0An
         +gt99LnILiN3wlFWkJTycGq217RwSaH0+zcu1kYZLz3iWIj8qQYhqdcpPNukG2DCVJFF
         NdBg==
X-Gm-Message-State: APjAAAXzsJh4JmmvffX+stGog3jJ23UukyKn3+AhlEP80R+a+3hdVXdK
        aa/3lbRlnDMkCCLxMd4KsYxrmSbgQzc=
X-Google-Smtp-Source: APXvYqyPo3tJiPdaLIp2msQ9doiPoqUUMGSmZaFgqJiqjAgdomQp2ULeZDbqMZW8BFVeJyy4KIEV1w==
X-Received: by 2002:a05:600c:22c8:: with SMTP id 8mr5120100wmg.178.1581691910707;
        Fri, 14 Feb 2020 06:51:50 -0800 (PST)
Received: from [192.168.1.106] (IGLD-84-229-153-129.inter.net.il. [84.229.153.129])
        by smtp.gmail.com with ESMTPSA id z4sm180250wml.42.2020.02.14.06.51.49
        for <linux-ppp@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2020 06:51:49 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From:   igal avraham <igal38@gmail.com>
Mime-Version: 1.0 (1.0)
Date:   Fri, 14 Feb 2020 16:51:47 +0200
Subject: Porting source to OSX 
Message-Id: <808CF219-67B9-45A0-B1FA-A53E682B0B06@gmail.com>
To:     linux-ppp@vger.kernel.org
X-Mailer: iPhone Mail (17C54)
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hi,

Is there a port available for OS X ?

Thanks,
Igal

