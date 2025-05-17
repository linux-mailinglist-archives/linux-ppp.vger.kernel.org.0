Return-Path: <linux-ppp+bounces-293-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22193ABAC27
	for <lists+linux-ppp@lfdr.de>; Sat, 17 May 2025 21:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C59C189CEBC
	for <lists+linux-ppp@lfdr.de>; Sat, 17 May 2025 19:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA3C1ADFE4;
	Sat, 17 May 2025 19:48:53 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EA94B1E77;
	Sat, 17 May 2025 19:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747511333; cv=none; b=oTV2G+aAbAF6KTa4S1qriCTfkGHICQVt1gYt0/cu2hINJSFNPgAmH91RF27WbpBFTQWqyo3pZ9zvzG3IUwQzehtVJVQkdsqzyf1/xM4ln29jtyev2d44L4Ty6rb3jcAs0Zf6WdK7cMhzTjBGOK+oeMUlshEvhWKTg6fA7hcBZjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747511333; c=relaxed/simple;
	bh=Z6YzL1H0GBfu9PDaQyBtiwbNQT74oezkvmWLO1FNaPI=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=IHIlPmydioKkEaRnYMEW3ylAx/36MSMYG29B7WUANVwshyJCc/HUGY2XNQSMMr+if4Os7DI97DmfPzeGU7yupNH59oraNu+tnBGAYUPCwj/GorbvsBxXmM33DytP0B4n13cctIRXdjJUdgPZg8WK3PktSn0Fj65AG0tIoRb9IZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.2.107] (p57bd9f10.dip0.t-ipconnect.de [87.189.159.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 5E3C7601D7139;
	Sat, 17 May 2025 21:48:40 +0200 (CEST)
Message-ID: <536c7c6e-a802-48f7-8b31-002b1aa14ac4@molgen.mpg.de>
Date: Sat, 17 May 2025 21:48:39 +0200
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: ppp0: recursion detected
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Linux folks,


In my logs September 23rd, 2024 up to now, I detected that with 
6.15-rc1, Linux logs the error:

     ppp0: recursion detected

and pppd logs:

     Couldn't set PPP MRU: Transport endpoint is not connected

Unfortunately, I do not know how to reproduce it. Starting the VPN and 
stopping it, didn’t tricker it.


Kind regards,

Paul


$ journalctl -o short-precise
[…]
Apr 13 13:08:06.524838 abreu kernel: Linux version 
6.15.0-rc1-00325-g7cdabafc0012 (build@bohemianrhapsody.molgen.mpg.de) 
(gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44) 
#24 SMP PREEMPT_DYNAMIC Sun Apr 13 07:33:10 CEST 2025
Apr 13 13:08:06.524877 abreu kernel: Command line: 
BOOT_IMAGE=/vmlinuz-6.15.0-rc1-00325-g7cdabafc0012 
root=UUID=32e29882-d94d-4a92-9ee4-4d03002bfa29 ro quiet pci=noaer 
mem_sleep_default=deep log_buf_len=16M cryptomgr.notests
[…]
Apr 14 16:11:08.585722 abreu systemd[1]: Started 
NetworkManager-dispatcher.service - Network Manager Script Dispatcher 
Service.
Apr 14 16:11:08.587011 abreu NetworkManager[750]: <info> 
[1744639868.5869] policy: set 'Kabelgebundene Verbindung 1' 
(enx00e04cf4ead4) as default for IPv4 routing and DNS
Apr 14 16:11:08.599155 abreu NetworkManager[493654]: xl2tpd[493654]: 
death_handler: Fatal signal 15 received
Apr 14 16:11:08.599155 abreu NetworkManager[493654]: xl2tpd[493654]: 
Terminating pppd: sending TERM signal to pid 493659
Apr 14 16:11:08.599155 abreu NetworkManager[493654]: xl2tpd[493654]: 
Connection 1 closed to 141.14.220.175, port 1701 (Server closing)
Apr 14 16:11:08.599616 abreu pppd[493659]: Terminating on signal 15
Apr 14 16:11:08.600343 abreu pppd[493659]: Connect time 6.7 minutes.
Apr 14 16:11:08.600370 abreu pppd[493659]: Sent 1735197 bytes, received 
56173839 bytes.
Apr 14 16:11:08.601538 abreu charon[493547]: 15[KNL] 141.14.14.90 
disappeared from ppp0
Apr 14 16:11:08.601673 abreu charon[493547]: 16[KNL] interface ppp0 
deactivated
Apr 14 16:11:08.605867 abreu kernel: ppp0: recursion detected
Apr 14 16:11:08.606180 abreu NetworkManager[494070]: Stopping strongSwan 
IPsec...
Apr 14 16:11:08.603094 abreu pppd[493659]: Overriding mtu 1500 to 1400
Apr 14 16:11:08.602792 abreu NetworkManager[750]: <info> 
[1744639868.6027] device (ppp0): state change: disconnected -> unmanaged 
(reason 'unmanaged-external-down', managed-type: 'external')
Apr 14 16:11:08.603111 abreu pppd[493659]: Overriding mru 1500 to mtu 
value 1400
Apr 14 16:11:08.603121 abreu pppd[493659]: Couldn't set PPP MRU: 
Transport endpoint is not connected
Apr 14 16:11:08.606938 abreu charon[493547]: 00[DMN] SIGINT received, 
shutting down
[…]
Mai 16 08:30:51.562764 abreu kernel: Linux version 
6.15.0-rc6-00085-gc94d59a126cb (build@bohemianrhapsody.molgen.mpg.de) 
(gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44) 
#47 SMP PREEMPT_DYNAMIC Thu May 15 00:09:00 CEST 2025
Mai 16 08:30:51.562904 abreu kernel: Command line: 
BOOT_IMAGE=/vmlinuz-6.15.0-rc6-00085-gc94d59a126cb 
root=UUID=32e29882-d94d-4a92-9ee4-4d03002bfa29 ro quiet pci=noaer 
mem_sleep_default=deep log_buf_len=16M cryptomgr.notests
[…]
Mai 16 08:53:51.280468 abreu charon[10205]: 11[NET] sending packet: from 
192.168.0.192[4500] to 141.14.220.175[4500] (108 bytes)
Mai 16 08:53:53.108772 abreu systemd[1537]: Started 
ptyxis-spawn-be64c1b8-8110-413d-acfe-e88f0f09ec17.scope - [systemd-run] 
/usr/bin/bash.
Mai 16 08:53:56.871412 abreu NetworkManager[826]: <info> 
[1747378436.8713] audit: op="connection-deactivate" 
uuid="837a96df-4fbc-4487-a2f5-152ff4e1ebd7" name="Molgen L2TP" pid=10744 
uid=5272 result="success"
Mai 16 08:53:56.872817 abreu dbus-daemon[789]: [system] Activating via 
systemd: service name='org.freedesktop.nm_dispatcher' 
unit='dbus-org.freedesktop.nm-dispatcher.service' requested by ':1.8' 
(uid=0 pid=826 comm="/usr/sbin/NetworkManager --no-daemon")
Mai 16 08:53:56.878345 abreu systemd[1]: Starting 
NetworkManager-dispatcher.service - Network Manager Script Dispatcher 
Service...
Mai 16 08:53:56.914278 abreu dbus-daemon[789]: [system] Successfully 
activated service 'org.freedesktop.nm_dispatcher'
Mai 16 08:53:56.914544 abreu systemd[1]: Started 
NetworkManager-dispatcher.service - Network Manager Script Dispatcher 
Service.
Mai 16 08:53:56.916548 abreu NetworkManager[826]: <info> 
[1747378436.9165] policy: set 'Kabelgebundene Verbindung 1' 
(enx00e04ceb9e75) as default for IPv4 routing and DNS
Mai 16 08:53:56.936629 abreu kernel: ppp0: recursion detected
Mai 16 08:53:56.936891 abreu NetworkManager[10309]: xl2tpd[10309]: 
death_handler: Fatal signal 15 received
Mai 16 08:53:56.936891 abreu NetworkManager[10309]: xl2tpd[10309]: 
Terminating pppd: sending TERM signal to pid 10313
Mai 16 08:53:56.936891 abreu NetworkManager[10309]: xl2tpd[10309]: 
Connection 1 closed to 141.14.220.175, port 1701 (Server closing)
Mai 16 08:53:56.937310 abreu pppd[10313]: Terminating on signal 15
Mai 16 08:53:56.937853 abreu pppd[10313]: Connect time 5.1 minutes.
Mai 16 08:53:56.937869 abreu pppd[10313]: Sent 1054040 bytes, received 
15208988 bytes.
Mai 16 08:53:56.938258 abreu charon[10205]: 06[KNL] interface ppp0 
deactivated
Mai 16 08:53:56.943844 abreu pppd[10313]: Overriding mtu 1500 to 1400
Mai 16 08:53:56.943881 abreu pppd[10313]: Overriding mru 1500 to mtu 
value 1400
Mai 16 08:53:56.943902 abreu pppd[10313]: Couldn't set PPP MRU: 
Transport endpoint is not connected
Mai 16 08:53:56.943993 abreu charon[10205]: 13[KNL] 141.14.14.125 
disappeared from ppp0
[…]

