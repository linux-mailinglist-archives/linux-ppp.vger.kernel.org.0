Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A316CB609
	for <lists+linux-ppp@lfdr.de>; Fri,  4 Oct 2019 10:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbfJDIWo (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 4 Oct 2019 04:22:44 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:42554 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbfJDIWo (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 4 Oct 2019 04:22:44 -0400
Received: by mail-qk1-f194.google.com with SMTP id f16so5019509qkl.9
        for <linux-ppp@vger.kernel.org>; Fri, 04 Oct 2019 01:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8bufJZuEB1Wh/3v4ZRFoFC1mDIcJXksCn/ilGEaq5Q8=;
        b=kzKxjM0cdbyiBY0OOV1c6ochqxv4PHWdazdyvl+IUiBQNzhVLSDSk2Jg8EibZUFT66
         /LCKljSwO+vxobMF0y5R/u4GdFFGT5kM+a8f4zP9oK1FhRQtlaIAiimXYSqjDGE9XGgo
         8akA7HRWSQp8LTLLhvs5Za66s2t9ClVytfYiPYQjEXM5xQXYLG1egqP+KC5tK8MGBOVu
         HgUzn4yB8KWAIccvTmwyvHSdhb/YDld+AAqPfVuy5d7CdIYwKnkXzyNKZEMiamiNnNHN
         ySdwieDf1hxmlBagRILDS9awLdJGaiuR0U5WIc/VIfVhHwTjMB59XXfsT0kPKWQlJUmw
         Ii9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8bufJZuEB1Wh/3v4ZRFoFC1mDIcJXksCn/ilGEaq5Q8=;
        b=HD608InEB76X/NRoH3bvHHqQOpYHdv1EpsSkBY4HQ8YKBMX8smU4TJzuvpUppdAQRo
         Pd0zfCj67g0VyH9LI+fjJl/lw5Ls3AhzCqY3tQNBKJbqa+m/bvJElngV1jU2EJF6ytLw
         bJ/0iZX5ipcR3wbZVirQX4Ite/jS+HNGcWGIFpbAsJP/qk49R06gSE+rgf/PP/CV+xdh
         9fiItrlECw28MUv3VEcEPqtGf+o3PkfpaTQJtO6zsv7ikpKC+va4R5sRpOzdnqBnWA+7
         qhDWTCgt7MdI2gm7y7I/pmvFjcfpMvr7daCqNRfT9JlIRoa0wfmrVZCnOb1pwgWEO9IL
         faqg==
X-Gm-Message-State: APjAAAVNZD15MIinjwYWYsKLFy8t7ZAbpCnV+ZkKteinfAdS0Rt2kAfi
        C2IqV93eUIRIgNfaltTT7rSLb1TsB+wXYvfmkteVuMxPMiI=
X-Google-Smtp-Source: APXvYqzr6N7lK5QIoGssLYafepPANoavz2O3gFBZqhw+MHuiT1QfIn4m5VM09aO1gEy0Cby/iWdIWLVwJ/nlPuuqw4g=
X-Received: by 2002:ae9:c110:: with SMTP id z16mr8979494qki.352.1570177361849;
 Fri, 04 Oct 2019 01:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be> <20191003224054.GA26158@blackberry>
In-Reply-To: <20191003224054.GA26158@blackberry>
From:   Levente <leventelist@gmail.com>
Date:   Fri, 4 Oct 2019 10:22:30 +0200
Message-ID: <CACwWb3BoHF0WQ3ve3PQ_7L3LfJsvqC3Z9ZF5zOwd-r-GWv8CuA@mail.gmail.com>
Subject: Re: [PATCH 4/9] pppd: include time.h before using time_t
To:     Paul Mackerras <paulus@ozlabs.org>
Cc:     Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>,
        linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

IMHO time_t is defined in sys/types.h


Lev

On Fri, Oct 4, 2019 at 9:28 AM Paul Mackerras <paulus@ozlabs.org> wrote:
>
> On Thu, Sep 26, 2019 at 09:21:01AM +0200, Kurt Van Dijck wrote:
> > Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> > ---
> >  include/net/ppp_defs.h | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/include/net/ppp_defs.h b/include/net/ppp_defs.h
> > index b06eda5..ed04486 100644
> > --- a/include/net/ppp_defs.h
> > +++ b/include/net/ppp_defs.h
> > @@ -35,6 +35,8 @@
> >   * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
> >   */
> >
> > +#include <time.h>
> > +
> >  #ifndef _PPP_DEFS_H_
> >  #define _PPP_DEFS_H_
>
> I applied this series, but then reverted this one because it breaks
> compilation of the kernel device driver on Solaris.  What exactly is
> the error that you are seeing without this #include?  Would your error
> be fixed by including <sys/time.h> (which would be OK on Solaris)?
>
> Paul.
