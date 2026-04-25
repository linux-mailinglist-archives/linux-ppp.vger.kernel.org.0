Return-Path: <linux-ppp+bounces-541-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAe5BJMC7WnmeAAAu9opvQ
	(envelope-from <linux-ppp+bounces-541-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Sat, 25 Apr 2026 20:06:11 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2708F46733E
	for <lists+linux-ppp@lfdr.de>; Sat, 25 Apr 2026 20:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3026130014BA
	for <lists+linux-ppp@lfdr.de>; Sat, 25 Apr 2026 18:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED66A35C19B;
	Sat, 25 Apr 2026 18:00:48 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from taslin.fdn.fr (taslin.fdn.fr [80.67.169.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3724034B43F
	for <linux-ppp@vger.kernel.org>; Sat, 25 Apr 2026 18:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.67.169.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777140048; cv=none; b=IthUxzjUEflO9MlQQx2a3Yu5qDgSLMFporBHzdOqSrpDQjb0gT1O7Y+WsSKS80i3KuDLLiRff3dXAzeVRju2KHbeBxYKopKfvU9vdjE2hOm23gY+waTzpV0SjdVvqqO0utjC8C/9mr7kE1bW/RpQ9O6eKmoyx78n74PUysDHWKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777140048; c=relaxed/simple;
	bh=XIjhYaeoXvjtkhrbwlK4vhDzgh/OI7RiLyBWMXek0IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXw9nOXmYLk+xl26Hn6C0hRgJ9f2A5+NkQP0msxE3b2mT7w6bg9tDQmnSU4/wKsWzrPinxP3iKQTlSjtsa32QU8hIp1iF/IKz4rGjWMNjMYhxHQqyYoIJUO+tz720XbZBh8NcKixAUJJLlvxAQdYfCY17l/R4QX5CodBE8WNAfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dolka.fr; spf=none smtp.mailfrom=dolka.fr; arc=none smtp.client-ip=80.67.169.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dolka.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dolka.fr
Received: from apu.dolka.fr (apu.dolka.fr [IPv6:2001:910:103a:6::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by taslin.fdn.fr (Postfix) with ESMTPS id E1B8C60249;
	Sat, 25 Apr 2026 19:53:47 +0200 (CEST)
Received: from ftth-0-196.aquilenet.fr ([46.231.240.196] helo=localhost)
	by apu.dolka.fr with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <benoar@dolka.fr>)
	id 1wGhCM-0000N9-Q2; Sat, 25 Apr 2026 19:53:46 +0200
Received: from benoar by localhost with local (Exim 4.96)
	(envelope-from <benoar@dolka.fr>)
	id 1wGQsI-001y8K-3B;
	Sat, 25 Apr 2026 02:27:58 +0200
Date: Sat, 25 Apr 2026 02:27:58 +0200
From: Benjamin Cama <benoar@dolka.fr>
To: Mikulas Patocka <mikulas@twibright.com>
Cc: linux-ppp@vger.kernel.org
Subject: Re: pppd and IPv6 routes
Message-ID: <aewKjirAi258nEDX@dolka.fr>
References: <9ce2170f-f0bb-2d48-c64a-4d5027290e92@twibright.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ce2170f-f0bb-2d48-c64a-4d5027290e92@twibright.com>
X-Rspamd-Queue-Id: 2708F46733E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-541-lists,linux-ppp=lfdr.de];
	DMARC_NA(0.00)[dolka.fr];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoar@dolka.fr,linux-ppp@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,dolka.fr:mid]

Hi Mikulas,

Le lundi 13 avril 2026 à 14:37, Mikulas Patocka a écrit :
>I have a problem with pppd and IPv6. I use pppd 2.4.9 from Debian 12.

For reference, on my side I’m also using Debian 12, pppd 2.4.9 and 
kernel version 6.12.22+bpo-amd64.

Also, I’m doing my tests just on a looped back dummy connection, like 
so:

   pppd noauth pty "pppd noauth notty" debug nodetach

I just get link-local addresses, but it’s enough to test.

>I get this ppp0 device from my ISP (using ppp-over-ethernet):
>23: ppp0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1492 state UNKNOWN qlen 3
>    inet6 2a00:1028:8391:4349:4839:8541:daa4:adcf/64 scope global dynamic mngtmpaddr
>       valid_lft 86287sec preferred_lft 3487sec
>    inet6 fe80::4839:8541:daa4:adcf peer fe80::e681:84ff:fec2:4b34/128 scope link
>       valid_lft forever preferred_lft forever

Same thing here (but no GUA).

>I run wide-dhcpv6-client, it sends "dhcp6 solicit" to "ff02::1:2":

BTW, WIDE is really an ancient implementation, you may run in some 
strange interaction with recent code.

>fe80::4839:8541:daa4:adcf.dhcpv6-client > ff02::1:2.dhcpv6-server: dhcp6 solicit
>I receive dhcp6 advertise from the ISP:
>e681:84ff:fec2:4b34.dhcpv6-server > fe80::4839:8541:daa4:adcf.dhcpv6-client: dhcp6 advertise

(I did not test DHCPv6)

>The problem is that the kernel doesn't pass the packet to the dhcp6c
>daemon, it rejects the packet with a redirect to itself:
>fe80::4839:8541:daa4:adcf > fe80::e681:84ff:fec2:4b34: ICMP6, redirect, fe80::4839:8541:daa4:adcf to fe80::4839:8541:daa4:adcf, length 176

Quite strange.

>According to RFC, redirect to itself means that the sender should send the
>packet to the same interface to a different host.

I’m not sure where you interpret that from. A redirect is a hint that 
the address is present on the same *link* (not interface), but may be a 
different host or itself, maybe. But in this case, as you clearly see 
the address *is* in fact from this very interface, something very wrong 
is going on.

>"ping fe80::e681:84ff:fec2:4b34%ppp0" also doesn't work - tcpdump shows
>that the reply arrives, but the kernel rejects it with a redirect to
>itself.

By default, in my case, I get ping correctly answered.

>There are the following routes set up on the ppp0 interface:
>
>anycast 2a00:1028:8391:4349:: dev ppp0 proto kernel metric 0 pref medium
>2a00:1028:8391:4349::/64 dev ppp0 proto kernel metric 256 expires 85949sec pref medium
>fe80::fe80::4839:8541:daa4:adcf dev ppp0 proto kernel metric 256 pref medium
>fe80::e681:84ff:fec2:4b34 dev ppp0 proto kernel metric 256 pref medium
>multicast ff00::/8 dev ppp0 proto kernel metric 256 pref medium
>default via fe80::e681:84ff:fec2:4b34 dev ppp0 proto ra metric 1024
>expires 4049sec hoplimit 64 pref medium

Here, an excerpt from my setup, showing routes from all the table as you 
do:

   $ ip -6 r show table all|grep ppp0
   fe80::117e:f5e4:95b7:b93d dev ppp0 proto kernel metric 256 pref medium
   fe80::14af:cf07:dc47:6de5 dev ppp0 proto kernel metric 256 pref medium
   local fe80::117e:f5e4:95b7:b93d dev ppp0 table local proto kernel metric 0 pref medium
   multicast ff00::/8 dev ppp0 table local proto kernel metric 256 pref medium

>If I delete the route to "fe80::fe80::4839:8541:daa4:adcf" and add the
>same route with the "local' specifier, the problem is fixed, ping works
>and dhcp6c correctly receives the responses and sets up IPv6 addresses in
>the inner network:
>
># ip -6 route del fe80::4839:8541:daa4:adcf dev ppp0
># ip -6 route add local fe80::4839:8541:daa4:adcf dev ppp0

And indeed, when I do the opposite (removing the local route), I get a 
redirect like you on ppp0, then the ping response being repeated on ppp0 
many times before hop limit is reached and I get an ICMPv6 time exceeded 
on lo. The kernel does not recognize this address as belonging to 
itself.

So you are on the right track with the missing local route. Note that my 
table output show *two* routes for the host’s link-local address, on 
from the main table *and* one from the local table. I note that your 
table output does not specify table: did you somehow pasted everything 
together in your message, or is this really your output only from the 
main table? In the latter case, something is very wrong if e.g. an 
anycast route shows up here. To show e.g. only the local routing table, 
use "ip route show table local".

>So, the question is - why doesn't pppd set the local route as "local"? Is
>it a bug in pppd? Or a bug in the kernel?

I think the local route is *not* set by pppd, but indeed by the kernel 
itself, for its special local table. But also maybe WIDE dhcp is 
mangling this, I’ve already seen strange behavior with it in a distant 
past.

>I tried to set up the local route in
>/etc/ppp/ipv6-up.d/wide-dhcpv6-client, but it is not reliable, sometimes
>it works and sometimes it doesn't, the script is probably racing with pppd
>setting the routes:
>
>#!/bin/sh
>sleep 3
>ip -6 route del "$PPP_LOCAL" dev ppp0
>ip -6 route add local "$PPP_LOCAL" dev ppp0

In general, you should *not* have to play with local route. I think 
something is wrong either on the kernel side, or with the WIDE dhcp 
client interaction.

Regards.
-- Benjamin

