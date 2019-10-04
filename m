Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7C9CCB4CF
	for <lists+linux-ppp@lfdr.de>; Fri,  4 Oct 2019 09:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbfJDHGQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ppp@lfdr.de>); Fri, 4 Oct 2019 03:06:16 -0400
Received: from relay-b02.edpnet.be ([212.71.1.222]:49802 "EHLO
        relay-b02.edpnet.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbfJDHGP (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 4 Oct 2019 03:06:15 -0400
X-ASG-Debug-ID: 1570172771-0a7b8d53bf1090c30001-vz1ewb
Received: from zotac.vandijck-laurijssen.be (77.109.119.18.adsl.dyn.edpnet.net [77.109.119.18]) by relay-b02.edpnet.be with ESMTP id Q9lEbgWEvgBkLPds; Fri, 04 Oct 2019 09:06:11 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.119.18.adsl.dyn.edpnet.net[77.109.119.18]
X-Barracuda-Apparent-Source-IP: 77.109.119.18
Received: from x1.vandijck-laurijssen.be (unknown [188.189.81.55])
        by zotac.vandijck-laurijssen.be (Postfix) with ESMTPSA id 774E0A2E5BA;
        Fri,  4 Oct 2019 09:06:10 +0200 (CEST)
Date:   Fri, 4 Oct 2019 09:06:05 +0200
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To:     Paul Mackerras <paulus@ozlabs.org>
Cc:     linux-ppp@vger.kernel.org
Subject: Re: [PATCH 4/9] pppd: include time.h before using time_t
Message-ID: <20191004070344.GB881@x1.vandijck-laurijssen.be>
X-ASG-Orig-Subj: Re: [PATCH 4/9] pppd: include time.h before using time_t
Mail-Followup-To: Paul Mackerras <paulus@ozlabs.org>,
        linux-ppp@vger.kernel.org
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20191003224054.GA26158@blackberry>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20191003224054.GA26158@blackberry>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Barracuda-Connect: 77.109.119.18.adsl.dyn.edpnet.net[77.109.119.18]
X-Barracuda-Start-Time: 1570172771
X-Barracuda-URL: https://212.71.1.222:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 2037
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: SPAM GLOBAL 0.9758 1.0000 4.0633
X-Barracuda-Spam-Score: 4.06
X-Barracuda-Spam-Status: No, SCORE=4.06 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.77089
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On vr, 04 okt 2019 08:40:54 +1000, Paul Mackerras wrote:
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

I have no Solaris around, hence I didn't see that problem :-)

My output:

cd pppd; make  all
make[1]: Entering directory `/srv/src/net/ppp/pppd'
musl-gcc -O2 -pipe -Wall -g -DHAVE_PATHS_H -DIPX_CHANGE -DHAVE_MMAP -I../include '-DDESTDIR="/usr/local"' -DCHAPMS=1 -DMPPE=1 -DHAS_SHADOW -DHAVE_CRYPT_H=1 -I/usr/include/openssl -DHAVE_MULTILINK -DUSE_TDB=1 -DPLUGIN -DINET6=1 -DMAXOCTETS   -c -o sha1.o sha1.c
In file included from sha1.c:21:0:
../include/net/ppp_defs.h:182:5: error: unknown type name ‘time_t’
     time_t xmit_idle;  /* time since last NP packet sent */
     ^
../include/net/ppp_defs.h:183:5: error: unknown type name ‘time_t’
     time_t recv_idle;  /* time since last NP packet received */
     ^
make[1]: *** [sha1.o] Error 1
make[1]: Leaving directory `/srv/src/net/ppp/pppd'

the time_t type isn't defined while being used.
AFAIK, time_t is defined in time.h

Wrapping the include inside a #ifdef SOLARIS seems the most correct solution.
including sys/time.h works, but that is rather by accident at this moment.

Kind regards,
Kurt
