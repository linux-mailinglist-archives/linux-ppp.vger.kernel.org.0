Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC96316D27
	for <lists+linux-ppp@lfdr.de>; Wed, 10 Feb 2021 18:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233028AbhBJRqp (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 10 Feb 2021 12:46:45 -0500
Received: from carlson.workingcode.com ([50.78.21.49]:58554 "EHLO
        carlson.workingcode.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233118AbhBJRqm (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 10 Feb 2021 12:46:42 -0500
X-Greylist: delayed 1372 seconds by postgrey-1.27 at vger.kernel.org; Wed, 10 Feb 2021 12:46:41 EST
Received: from [50.78.21.49] (carlson [50.78.21.49])
        (authenticated bits=0)
        by carlson.workingcode.com (8.16.1/8.16.1/SUSE Linux 0.8) with ESMTPSA id 11AHMvm3005415
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Wed, 10 Feb 2021 12:22:57 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 carlson.workingcode.com 11AHMvm3005415
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=workingcode.com;
        s=carlson; t=1612977778;
        bh=2pj4eIGe7WE53OllUiF9brya1J1e9ANMWoEaCf/duTg=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=tBMr/xlPggVMekQGfpk+QOyFXzwQN/vM+G3RVJZGZ036LAzVkBQZehI2EcwMsMoEO
         6dVuhtSW0kHS49AJ9TloMV1F60JNAYBGR7XST4vJlKpF4vGRu8PAJWh5va85yJ4Go7
         oaMFHdDepcXW/RfyJm4yZgD3JVgHah8lBPaLZ21w=
Subject: Re: Problem with M2M PPP connection
To:     =?UTF-8?Q?Bj=c3=b6rn_Kirchner?= <bjkit89@gmail.com>,
        linux-ppp@vger.kernel.org
References: <20210210101740.1bae8b93@w530>
From:   James Carlson <carlsonj@workingcode.com>
Message-ID: <1a006a06-5155-74a9-21be-fb6fcfc891e1@workingcode.com>
Date:   Wed, 10 Feb 2021 12:22:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210210101740.1bae8b93@w530>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-DCC-MGTINTERNET-Metrics: carlson 1170; Body=2 Fuz1=2 Fuz2=2
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

On 2021-02-10 04:17, Björn Kirchner wrote:
> Dear list readers,
> 
> I am stuck with the following problem and I hope you can give me some
> hints or advice. It looks to me like a configuration or routing error.

A broad hint first: less configuration is always better.  Not only have
the developers chosen the defaults very carefully to make them work in
the widest range of cases, but the protocol itself is designed to
negotiate the available options in order to settle on the correct link
parameters.  A giant configuration file either says "this set-up is
really brittle" or possibly "wow, the peer I'm forced to talk to is
flaming garbage."

I'm not saying you're necessarily doing anything wrong here, but that
laundry list is at least suspicious, and I'd certainly wonder why it is
set up that way.

A summary analysis: other than three questionable options
("nodefaultroute", "noaccomp", "nopcomp") and what appears to be a
broken serial interface ("nocdtrcts", "local"), I don't see anything in
particular going wrong at the PPP level.  The problems, whatever they
may be, are elsewhere.

> I have an Olimex NB-IoT-DevKit with a Quectel BC66 LTE-NB1 chip which

Ah, the legacy of GPRS.  Fortunately, I haven't kept up with this
"NB-IoS" stuff, but if it's from the same folks who designed that
earlier gear, then there are some things to be aware of here:

- The actual authentication and IP address assignment is done through
  some other protocol, not PPP, and is typically done during the LCP
  negotiation, and completely behind your back.

- Any failures that occur during that hidden work are almost always
  completely invisible.  If it's a bad user name or password, the peer
  usually assigns a bogus IP address and just fails to provide any
  service.  There are no error messages.  No way to know, at least via
  PPP messages.

> and the P-t-P’s address. My problem is, that I cannot reach anything
> via that connection. I cannot ping the P-t-P, I cannot ping other
> addresses. The ISP’s support confirmed that PPP was a viable option to

That's typically what's expected when the authentication phase fails or
when the client is otherwise "unauthorized."

I strongly suspect that the problem is with the "AT" commands in the
chat script.  I have no way of verifying those.

On to some (overly detailed) notes about your PPP configuration:

> refuse-chap             # (from /etc/ppp/peers/quectel-ppp)
> refuse-mschap           # (from /etc/ppp/peers/quectel-ppp)
> refuse-mschap-v2                # (from /etc/ppp/peers/quectel-ppp)
> refuse-eap              # (from /etc/ppp/peers/quectel-ppp)

These really aren't necessary.  If you don't have username/passphrase
pairs configured into the /etc/ppp/*-secrets files for this peer, then
pppd will automatically refuse those protocols.  And the peer isn't even
asking for authentication from us ... so these do nothing.

> user *          # (from /etc/ppp/peers/quectel-ppp)
> password ??????         # (from /etc/ppp/peers/quectel-ppp)

These are apparently useless.  The peer isn't asking for authentication
at all via PPP.  (Though, to be fair, this could be because the chat
script is setting things up incorrectly.  Maybe it would ask if the
"modem" were set up correctly ... ?)

> remotename 3gppp                # (from /etc/ppp/peers/quectel-ppp)

If you're not doing authentication, then this may be useless.

> record /tmp/quectel.record              # (from /etc/ppp/peers/quectel-ppp)

Not sure why you'd want that.  It's really an internal debug option
intended for PPP developers.  I suggest leaving it out as it can
certainly complicate things.  It forces the pppd daemon to run on top of
a pty pair and write the "raw" AHDLC data to a file for later analysis.

> nocdtrcts               # (from /etc/ppp/peers/quectel-ppp)
> local           # (from /etc/ppp/peers/quectel-ppp)

Those two are a real shame.  This serial device really has no modem
control lines at all?  Even if you get this working, it's possible that
it won't work very well at all.

"nocdtrcts" means "no hardware flow control exists."  This means that
CTS/RTS aren't used.  And if one side or the other encounters an
overflow, then it'll just drop bytes silently, causing packets to be
dropped.  With enough of that, the link will be utterly unusable.

If the device you're using really is that horrible, then I'd check to
see if it can do at least XON/XOFF ("xonxoff") software flow control.
Something is better than nothing at all.

"local" means "no modem on/off hook signaling."  This means that DTR/DCD
aren't used.  That means that if the other end hangs up for some reason,
then you'll get no notice at all.  Bytes will just stop flowing
mysteriously.

If that's really the case, then I *strongly* recommend using the
"lcp-echo-failure" and "lcp-echo-interval" options.  This allows PPP's
LCP layer to detect link failure.  Otherwise, you're shooting packets
into the dark.

> noaccomp                # (from /etc/ppp/peers/quectel-ppp)
> nopcomp         # (from /etc/ppp/peers/quectel-ppp)

These two appear to be incorrect.  The peer is asking for these two
common options, and you've configured it intentionally to refuse them.
I don't see why anyone would do that.  Note that these are *NOT* related
to data compression in any way.  The "compression" they're referring to
here is just omitting some constant bytes from the PPP header.

ACFC gets rid of the static HDLC "FF 03" at the start of every PPP
frame.  PFC gets rid of the extra "00" byte for network protocols less
than 0100 -- this means that IP shows up as "21" instead of "00 21".
Having both options on (the default) means saving 3 bytes per packet.

Unless you know for sure that you're operating over an HDLC link using
multi-point addressing, or that the peer has horrible bugs in its basic
PPP implementation, turning ACFC off likely makes little sense.

See RFC 1661 sections 6.5 and 6.6 for details.

> novj            # (from /etc/ppp/peers/quectel-ppp)
> novjccomp               # (from /etc/ppp/peers/quectel-ppp)

The peer isn't offering VJ header compression, so these likely don't do
much.  Note that "vjccomp" is dependent on "vj", so saying "novj" alone
is sufficient to turn off both.

> nodefaultroute          # (from /etc/ppp/peers/quectel-ppp)

This is a little weird.  Are you sure?  I thought this was supposed to
be your connection to the Internet.  If so, then you certainly want to
have pppd establish a default route for you.  (Doing so manually is at
best error-prone.)

Just make sure you remove the system's default route (if any) before
starting pppd.

> noremoteip              # (from /etc/ppp/peers/quectel-ppp)

This appears to be unnecessary, but may be harmless.  The peer is
offering an IP address for itself, so the option doesn't come into play.

> noccp           # (from /etc/ppp/peers/quectel-ppp)
> nobsdcomp               # (from /etc/ppp/peers/quectel-ppp)
> nopredictor1            # (from /etc/ppp/peers/quectel-ppp)

"noccp" is sufficient.  The rest of those protocols are dependent on CCP
negotiation.  You can't get there if CCP is turned off.

> Output from ifconfig ppp0:
> root@raspberrypi:~# ifconfig ppp0
> ppp0: flags=4305<UP,POINTOPOINT,RUNNING,NOARP,MULTICAST>  mtu 1500
>         inet 10.43.124.1  netmask 255.255.255.255  destination 10.0.0.1
>         ppp  txqueuelen 3  (Point-to-Point Protocol)
>         RX packets 3  bytes 30 (30.0 B)
>         RX errors 0  dropped 0  overruns 0  frame 0
>         TX packets 3  bytes 30 (30.0 B)
>         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

Nothing looks wrong there.

> If you need more information I am eager to provide those. Do you have any
> suggestions how to be able to receive the hosts on the "other" side?

I don't know what that means.

However, wireshark is an excellent tool to use if you think that there's
a problem at the network level, rather than just the basic connection
itself.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
