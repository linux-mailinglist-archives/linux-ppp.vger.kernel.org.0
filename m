Return-Path: <linux-ppp+bounces-523-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKFWGjbq3GmUYAkAu9opvQ
	(envelope-from <linux-ppp+bounces-523-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Mon, 13 Apr 2026 15:05:58 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD333EC582
	for <lists+linux-ppp@lfdr.de>; Mon, 13 Apr 2026 15:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A3EC300F2AB
	for <lists+linux-ppp@lfdr.de>; Mon, 13 Apr 2026 13:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800AB3CAE81;
	Mon, 13 Apr 2026 13:05:29 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from leontynka.twibright.com (leontynka.twibright.com [109.81.181.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C643B3BFE33
	for <linux-ppp@vger.kernel.org>; Mon, 13 Apr 2026 13:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.81.181.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776085529; cv=none; b=Z4VexucWWDW8smL4D8cbf8Hblt4ZXxK5Ev0sOUF+vhGDm2+hI4HLPmSfq95XFh0xYtW3oYKqLNr9ceZ7H3Tf8yj3h7vjRbWM8LOmVtJd2eJMPAqwOYPLRlmn/xV7neZoNaLbk1WiF/u0b/OZIYzfWKqR7L6l2jZ8QW+BcTgTOxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776085529; c=relaxed/simple;
	bh=lU96/eWiSwo35db3SxlORzvO4/XtWkGOBcqNqiRilYI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=XmNIt+Knfj1GWhDQK2qPKlWcyV+an9qWEkCInTYA+jUnSinCznPR67Ki+yp/a9Lz8Al1odzMGR+LXnQJgjDw1/Uo4/zuMrRygPk80nqauBzqR+iZMeIIOLAuMpxJTHn/U3RmRtaoqQTt3+uoRQ7GCpxeiYBkPMLaHcu3n2Nc36I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=twibright.com; spf=pass smtp.mailfrom=twibright.com; arc=none smtp.client-ip=109.81.181.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=twibright.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=twibright.com
Received: from mikulas (helo=localhost)
	by leontynka.twibright.com with local-esmtp (Exim 4.96)
	(envelope-from <mikulas@twibright.com>)
	id 1wCGY3-000Rj9-29
	for linux-ppp@vger.kernel.org;
	Mon, 13 Apr 2026 14:37:51 +0200
Date: Mon, 13 Apr 2026 14:37:51 +0200 (CEST)
From: Mikulas Patocka <mikulas@twibright.com>
To: linux-ppp@vger.kernel.org
Subject: pppd and IPv6 routes
Message-ID: <9ce2170f-f0bb-2d48-c64a-4d5027290e92@twibright.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-523-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[twibright.com];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikulas@twibright.com,linux-ppp@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.911];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,twibright.com:mid]
X-Rspamd-Queue-Id: 5FD333EC582
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi

I have a problem with pppd and IPv6. I use pppd 2.4.9 from Debian 12.

I get this ppp0 device from my ISP (using ppp-over-ethernet):
23: ppp0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1492 state UNKNOWN qlen 3
    inet6 2a00:1028:8391:4349:4839:8541:daa4:adcf/64 scope global dynamic mngtmpaddr
       valid_lft 86287sec preferred_lft 3487sec
    inet6 fe80::4839:8541:daa4:adcf peer fe80::e681:84ff:fec2:4b34/128 scope link
       valid_lft forever preferred_lft forever

I run wide-dhcpv6-client, it sends "dhcp6 solicit" to "ff02::1:2":
fe80::4839:8541:daa4:adcf.dhcpv6-client > ff02::1:2.dhcpv6-server: dhcp6 solicit
I receive dhcp6 advertise from the ISP:
e681:84ff:fec2:4b34.dhcpv6-server > fe80::4839:8541:daa4:adcf.dhcpv6-client: dhcp6 advertise

The problem is that the kernel doesn't pass the packet to the dhcp6c 
daemon, it rejects the packet with a redirect to itself:
fe80::4839:8541:daa4:adcf > fe80::e681:84ff:fec2:4b34: ICMP6, redirect, fe80::4839:8541:daa4:adcf to fe80::4839:8541:daa4:adcf, length 176

According to RFC, redirect to itself means that the sender should send the 
packet to the same interface to a different host.

"ping fe80::e681:84ff:fec2:4b34%ppp0" also doesn't work - tcpdump shows 
that the reply arrives, but the kernel rejects it with a redirect to 
itself.

There are the following routes set up on the ppp0 interface:

anycast 2a00:1028:8391:4349:: dev ppp0 proto kernel metric 0 pref medium
2a00:1028:8391:4349::/64 dev ppp0 proto kernel metric 256 expires 85949sec pref medium
fe80::fe80::4839:8541:daa4:adcf dev ppp0 proto kernel metric 256 pref medium
fe80::e681:84ff:fec2:4b34 dev ppp0 proto kernel metric 256 pref medium
multicast ff00::/8 dev ppp0 proto kernel metric 256 pref medium
default via fe80::e681:84ff:fec2:4b34 dev ppp0 proto ra metric 1024 
expires 4049sec hoplimit 64 pref medium

If I delete the route to "fe80::fe80::4839:8541:daa4:adcf" and add the 
same route with the "local' specifier, the problem is fixed, ping works 
and dhcp6c correctly receives the responses and sets up IPv6 addresses in 
the inner network:

# ip -6 route del fe80::4839:8541:daa4:adcf dev ppp0
# ip -6 route add local fe80::4839:8541:daa4:adcf dev ppp0

So, the question is - why doesn't pppd set the local route as "local"? Is 
it a bug in pppd? Or a bug in the kernel?

I tried to set up the local route in 
/etc/ppp/ipv6-up.d/wide-dhcpv6-client, but it is not reliable, sometimes 
it works and sometimes it doesn't, the script is probably racing with pppd 
setting the routes:

#!/bin/sh
sleep 3
ip -6 route del "$PPP_LOCAL" dev ppp0
ip -6 route add local "$PPP_LOCAL" dev ppp0
systemctl restart wide-dhcpv6-client.service

Mikulas

