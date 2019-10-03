Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA909CB1F8
	for <lists+linux-ppp@lfdr.de>; Fri,  4 Oct 2019 00:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730531AbfJCWlD (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Thu, 3 Oct 2019 18:41:03 -0400
Received: from ozlabs.org ([203.11.71.1]:37545 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730537AbfJCWlA (ORCPT <rfc822;linux-ppp@vger.kernel.org>);
        Thu, 3 Oct 2019 18:41:00 -0400
Received: by ozlabs.org (Postfix, from userid 1003)
        id 46knzG4qdNz9sPd; Fri,  4 Oct 2019 08:40:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
        t=1570142458; bh=VaH0GnfHkoS7a1sHOvLmsEv8nMkzStkvf7HfxlLMbYU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qth6ikNPNnXHna1ZNoFn8MnnDHL3gSoTmmeTXDW9UhAEoECYsiel0aTIrfP2Ae7Gp
         QhQk6mjXfEbZYwvRrnGfW56uuYjQB+Tgqwzr4s9YMO1tYzBgJBAnb4Poh2RfdL/c3l
         VFHjoA7mtX0NvpbfhBit8LzG4oya5GH6uF22YSoRW0y+UsALmH2U0PefsJK1F2LwxK
         +rx4ELedUIuqoMrgaFOhVTNAQKY3/Kj6FJXlukZpOSY3tqi4+3XetjuhA1UAn0UJME
         8b47RM2k+pREE311GnHk/jisZVhcJprBCZcRqOPvSWyMEzyKGuHLpsMDn8YD6tFJUD
         nvd3Mq225tXJA==
Date:   Fri, 4 Oct 2019 08:40:54 +1000
From:   Paul Mackerras <paulus@ozlabs.org>
To:     Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Cc:     linux-ppp@vger.kernel.org
Subject: Re: [PATCH 4/9] pppd: include time.h before using time_t
Message-ID: <20191003224054.GA26158@blackberry>
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On Thu, Sep 26, 2019 at 09:21:01AM +0200, Kurt Van Dijck wrote:
> Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> ---
>  include/net/ppp_defs.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/net/ppp_defs.h b/include/net/ppp_defs.h
> index b06eda5..ed04486 100644
> --- a/include/net/ppp_defs.h
> +++ b/include/net/ppp_defs.h
> @@ -35,6 +35,8 @@
>   * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
>   */
>  
> +#include <time.h>
> +
>  #ifndef _PPP_DEFS_H_
>  #define _PPP_DEFS_H_

I applied this series, but then reverted this one because it breaks
compilation of the kernel device driver on Solaris.  What exactly is
the error that you are seeing without this #include?  Would your error
be fixed by including <sys/time.h> (which would be OK on Solaris)?

Paul.
