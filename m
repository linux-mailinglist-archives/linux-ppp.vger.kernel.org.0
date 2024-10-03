Return-Path: <linux-ppp+bounces-98-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9921398F048
	for <lists+linux-ppp@lfdr.de>; Thu,  3 Oct 2024 15:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C63F1F21FA5
	for <lists+linux-ppp@lfdr.de>; Thu,  3 Oct 2024 13:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F59770F1;
	Thu,  3 Oct 2024 13:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=workingcode.com header.i=@workingcode.com header.b="NExO7RMs"
X-Original-To: linux-ppp@vger.kernel.org
Received: from carlson.workingcode.com (carlson.workingcode.com [50.78.21.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4811E495
	for <linux-ppp@vger.kernel.org>; Thu,  3 Oct 2024 13:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.78.21.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727961889; cv=none; b=XIdFNVe9roMN4OhphXT3pUR/TC1//844seN6GaPHll0Cujrcnt4P+ImVYQnVi6pqpFHBIaKuayri4VRosLfjjjiBap56O/PVEIUeUba1ceb+80HCtV2GO3tKu3aDkUTll8HHYDE+KIpmYKFLD6BzHXS8K5P+KoOHRR8vPTFlNOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727961889; c=relaxed/simple;
	bh=2Tu0MEoQ9NhgtKoqlCnktRZbHvlmTHO+LYEvU4goeUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OhogEEgCRaTTMRug/L83juYrfGRs2h7AQs408fT2f8VWlnQVMaR4f0vsVIHKEKo6E+ACpWT30fWD9mbYwXeTN0EkEhrZw7k8K08+CC8SJ4sWfUd7XdOLSkSDXw5hr2wK+XKt8vrS4s4jKrxc6HBNd3HC40yf3stFw1zGsqPwFfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=workingcode.com; spf=pass smtp.mailfrom=workingcode.com; dkim=pass (2048-bit key) header.d=workingcode.com header.i=@workingcode.com header.b=NExO7RMs; arc=none smtp.client-ip=50.78.21.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=workingcode.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=workingcode.com
Received: from localhost (localhost [127.0.0.1])
	by carlson.workingcode.com (Postfix) with ESMTP id 2C9551E200F0;
	Thu,  3 Oct 2024 09:17:28 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=workingcode.com;
	 h=content-transfer-encoding:content-type:content-type
	:in-reply-to:from:from:content-language:references:subject
	:subject:user-agent:mime-version:date:date:message-id:received
	:received; s=default; t=1727961447; x=1728825448; bh=2Tu0MEoQ9Nh
	gtKoqlCnktRZbHvlmTHO+LYEvU4goeUU=; b=NExO7RMso7vPaAXTKPqRqnxfT9s
	LCeXqV1P9fcaHCZ1YsOBJ13JC1QzGguPF1COpFsum5si9tm3H7gAvIS7RoiOX3am
	cY4NFaK+TvSTwPAQLF/vsVtHwmjHdryRq2NVfmYJrrv8Fx8KKaz/2LlhuvTfikuH
	jRMOuHaYjRdxpkFidoYXLnVJmnJN+m2R2J7PWhkDgmOR8Ig9EFIo3nSIPWI7N26I
	wpITRSFCiTjlBJEi25vcGz+N9v+egWxOfjcp7ig72f2roNspGHjzh+Nwn0jE6fQ6
	kvY8TQf1mWZMQ+MU273YcyuTbkP+DvRycacbnzo8OHQSbUsirCtGepo+JZg==
X-Virus-Scanned: amavisd-new at workingcode.com
Received: from carlson.workingcode.com ([127.0.0.1])
	by localhost (carlson.workingcode.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id pRofHRFEFpH8; Thu,  3 Oct 2024 09:17:27 -0400 (EDT)
Received: from [50.78.21.49] (carlson [50.78.21.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by carlson.workingcode.com (Postfix) with ESMTPSA id AE9D11E20035;
	Thu,  3 Oct 2024 09:17:27 -0400 (EDT)
Message-ID: <08168610-387b-420f-a75f-db1ec7393f64@workingcode.com>
Date: Thu, 3 Oct 2024 09:17:27 -0400
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: patch to bring Solaris back up to date
To: Paul Mackerras <paulus@ozlabs.org>
Cc: ppp Linux <linux-ppp@vger.kernel.org>
References: <c9ad04a2-e9ee-4953-afd6-9412711c4f35@workingcode.com>
 <Zvoxg9_Yoyk4-2kP@cleo.paulus.ozlabs.org>
Content-Language: en-US
From: James Carlson <carlsonj@workingcode.com>
In-Reply-To: <Zvoxg9_Yoyk4-2kP@cleo.paulus.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/30/24 01:05, Paul Mackerras wrote:
> Basically the patch looks good to me.  I do need a Signed-off-by line
> from you, or at least your permission to add one like the one below
> for you.  Let me know if you want me to add that for you and edit the
> description, or if you would prefer to resubmit it.  In the former
> case I would edit the description to look like this:
> 
> ------------------------------------------------------
> Bring Solaris port back up to date
> 
> - Updated READMEs
> - Disabled MPPE support for Solaris
> - Fixed compilation error in ccp.c with MPPE disabled
> - Use OS-provided drivers and associated include files
> - Tested on OpenIndiana Hipster (Illumos)
> 
> Signed-off-by: James Carlson <carlsonj@workingcode.com>
> ------------------------------------------------------

That looks fine to me.

-- 
James Carlson     42.703N 71.076W FN42lq08    <carlsonj@workingcode.com>


