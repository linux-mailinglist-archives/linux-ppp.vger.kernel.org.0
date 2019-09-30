Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 674D7C1FA1
	for <lists+linux-ppp@lfdr.de>; Mon, 30 Sep 2019 12:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730705AbfI3K4r (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 30 Sep 2019 06:56:47 -0400
Received: from ozlabs.org ([203.11.71.1]:57349 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730668AbfI3K4r (ORCPT <rfc822;linux-ppp@vger.kernel.org>);
        Mon, 30 Sep 2019 06:56:47 -0400
Received: by ozlabs.org (Postfix, from userid 1003)
        id 46hfV51cHJz9sPG; Mon, 30 Sep 2019 20:56:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
        t=1569841005; bh=JZtDzgcq40KG4ocmiIJlAcqg8qFxBMRXtmVF+s09qBs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bht/VFLWTtQKw4d53B6P1rIfdD+pntdVfDpqy18+lFVFemBxTGaNoA1t+20kppU6d
         KQ/KnlyJ9Jr2Ir92VGrkjjrM8La0dAe1hWSCFExz2aHfsA+C3vv2CILUUpzE9KLbcO
         Nm4fslOpkSQ6vhoTrzfXWiwx4IcIJe+Wsg+rOPDHHiatQedBJC5VRu8TuJOnH8TOa2
         kgoPDYWCeBM+SPnBYhYJDc5hXk0FphnhcRF9MhXlLOfLikWb9IAP6ZIoKDyYhDU1UB
         V5TroOpGbn8/JWpCYBPNNKwBvPfcdamheSiPI2j1pzeo/ltLkmhtAe7ytLz6edjruK
         fF3kn7I1EOEtw==
Date:   Mon, 30 Sep 2019 20:56:39 +1000
From:   Paul Mackerras <paulus@ozlabs.org>
To:     Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Cc:     linux-ppp@vger.kernel.org
Subject: Re: [RFC] patch series to compile pppd with musl toolchain
Message-ID: <20190930105639.GA9567@blackberry>
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Thu, Sep 26, 2019 at 09:20:57AM +0200, Kurt Van Dijck wrote:
> Hello,
> 
> I'd like to add this series of 9 patches to pppd.
> The goal is to use pppd on an embedded system with musl instead of glibc.
> 
> Kind regards,
> Kurt

The series looks pretty good to me.  I would like a little more
explanation in the commit messages for patches 3 and 7, though, as to
why we want to make the change being made.  If you can give me a
couple of sentences for each of those two patches I will put them in
and apply the series.

Paul.
