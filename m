Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69200BFD70
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Sep 2019 05:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbfI0DDN (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 26 Sep 2019 23:03:13 -0400
Received: from ozlabs.org ([203.11.71.1]:58165 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727794AbfI0DDN (ORCPT <rfc822;linux-ppp@vger.kernel.org>);
        Thu, 26 Sep 2019 23:03:13 -0400
Received: by ozlabs.org (Postfix, from userid 1003)
        id 46fc733l2tz9sPS; Fri, 27 Sep 2019 13:03:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
        t=1569553391; bh=2heGYqyBKxJYsWTr2V2aPfUIpWfvG3E9Gr/UJUX+Se4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kl8IZXxZgoIeExqWsjMtmT2zqpn+Npn6pPptiif8fJdJZeIfJk17e4eWWfccu+IKq
         LMqFDIIwC3nvuOCpXCd/XgZZWS5is8z6WSSr9bR4+zM1bBjWUxewDvAYfPplqWO4Cp
         q60C7qn36oHNctlTHEiJs+ssOQ4XLnF/OA88w8IECIx7+h7riSnQaL+BjwZ2xWMhQ/
         nEs0LBE+/VS3WWv2Q7vGh76azZNSt/xJ6vQm054TFlXcLkybH5SDpUzCix1nT1EPSN
         gHc4+D8MAFahwphY5zVhGgG64Y8IvfC+Vfwmep7CZCoyMZTHavZCM9Wo0KzM1YNTRh
         a0eLL/Ttd6tPQ==
Date:   Fri, 27 Sep 2019 11:36:11 +1000
From:   Paul Mackerras <paulus@ozlabs.org>
To:     Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Cc:     linux-ppp@vger.kernel.org
Subject: Re: [PATCH 1/9] magic: remove K&R style of arguments
Message-ID: <20190927013611.GA28486@blackberry>
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <1569482466-9551-2-git-send-email-dev.kurt@vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569482466-9551-2-git-send-email-dev.kurt@vandijck-laurijssen.be>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Thu, Sep 26, 2019 at 09:20:58AM +0200, Kurt Van Dijck wrote:
> The __P() macro does not exist in libmusl e.g.
> I swicthed magic.{c,h} to using the std-c argument style, which had
> already been used in some functions.

Right.  I was thinking of doing this across the whole tree in fact.

Paul.
