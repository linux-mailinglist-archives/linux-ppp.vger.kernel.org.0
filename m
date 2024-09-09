Return-Path: <linux-ppp+bounces-80-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E91C97257D
	for <lists+linux-ppp@lfdr.de>; Tue, 10 Sep 2024 00:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DB6D1C23247
	for <lists+linux-ppp@lfdr.de>; Mon,  9 Sep 2024 22:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E846818C91E;
	Mon,  9 Sep 2024 22:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=in-unison.com header.i=@in-unison.com header.b="awSFKvCk"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B8512E4A
	for <linux-ppp@vger.kernel.org>; Mon,  9 Sep 2024 22:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725922535; cv=none; b=ckD4mu23YM9OHLwk9647AyzEO/gT22+rxhN0EXaI1pdv2vY75/RfPxnI30gzI+N/PcIUag/wvzm4zt8WY0MVRw2wCk2vCqWpPxae64HHnMiJXSMMiHgGVYcGn2u1N7TMQkPNHbfSKf2vrVpappOzojBSAUiFDtcpb6F7cuAt44o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725922535; c=relaxed/simple;
	bh=ZBqJNx2lQ4rUPniQZwSKOl6kUoQrAOHLgJmg9XFwbYw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=IeYcA8pfz17abdZ4LGSvLc5Ru4Wt92PQ7WTz1VuNCKxRw0FRVl3JwckY6CRahiMHM1X3RCp5PSL+Tio+G8H55XeAGZ/v/T7qbTyicBXNQbm8EUq9mzYE81pD1j/kz1qHQqouR/w46kO6KEVp6Y82enysMTvRaqBd9W9b/Yw+MeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-unison.com; spf=pass smtp.mailfrom=in-unison.com; dkim=pass (2048-bit key) header.d=in-unison.com header.i=@in-unison.com header.b=awSFKvCk; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-unison.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-unison.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5356a0a56f4so760499e87.3
        for <linux-ppp@vger.kernel.org>; Mon, 09 Sep 2024 15:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=in-unison.com; s=google; t=1725922532; x=1726527332; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TElAUzoJVQDkcnOU9c6pDUAdopXoroLRS/RIY6qIICQ=;
        b=awSFKvCkQIATYDcN4eo1yoM615hx73RZgud36/2t6wdt2YM1Pls7/vLRYg2oBkeieo
         Gkgof6YoggCg/knbw1B2U5jEYHuTRtPWenE9+elVxYPw0a+NCtxVwE19SN7iJWLCF68A
         FtIION4qHFRbOyonNK0KEzZE2rzZUKS19f19QBBLTS2ZlsIO+d1jiJG+YK0JvEt9sm3m
         oVAbUgDZHNoJ7BbTm95KzuDCj+82zVZ5p9IxqJF5Tsa3cqhnTZq16nmuiAPQzjEaglm6
         WRDLoEAV3GHuJblUvJsZtjOLD/ECz7SlNolpX+C2anAqZJYjIlLakqTt6V0aoc0EU0oQ
         YL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725922532; x=1726527332;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TElAUzoJVQDkcnOU9c6pDUAdopXoroLRS/RIY6qIICQ=;
        b=jkA1c2Ak120i1VO7MoaM5Y68lOPZy8ELZCDz0tcIDlp42zLYgt7qSKp7+DRjewVzrm
         9zDuozlpYyfpHQjTvK6ughE5S3NLb9IK9Iyz9W7Tc8eUgCXWb7gc5Kek6iVQEHaHrgOe
         s6visX6R+3EULObtxGoK1up6E9joM6R6D1/FLupi2YPsi2/kgSc6CeAjXeD0F8eRrJz0
         TpcQ6/ZhsVMQP/7ZEPRkoK2EFSC1hzLLpP/uFU7pePQP9bnciL9aaATivdODmayaK75G
         fIpIsrH2UxV9ansiMt+fx9shSakXf6o4KHkwYB0Wp9T0GTo2XftV6DTxFwf56BLajS1L
         2rBg==
X-Gm-Message-State: AOJu0Yw7HoI3ppkudXkaUY0tsU+pkdXqC9NMyd/FB3rWSWA3SY6w1bfx
	dZHvKCs+e8DYsOoeswUyg2uFf7DgSQtXIkaZIDWhyuA+zXECnGXEPXMWnMC9llIai6KuJ7RmY76
	x7QOLNlCfoLhkn3t8dL0ag64nSD/R39gZFAqIw6UnHv7ArpPI0mmneA==
X-Google-Smtp-Source: AGHT+IHCkEwdrrJGqRbmvk7wRqX+YndHSCV6F09zc6WkF55gcaFgHJ4+hKBNaHneD+8TLB1OQAbzoY4K2sVjV1EfOA4=
X-Received: by 2002:a05:6512:10d4:b0:52f:cfba:403c with SMTP id
 2adb3069b0e04-536587b0179mr3514949e87.3.1725922531506; Mon, 09 Sep 2024
 15:55:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Devesh Chipade <devesh@in-unison.com>
Date: Mon, 9 Sep 2024 15:55:20 -0700
Message-ID: <CAPKvdWd3rGxir3MEKrcfdjD4NfOQpCttv3yFPXY=Q35-8cs2Tw@mail.gmail.com>
Subject: PPP Modem Hangup
To: linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I am working on establishing a ppp connection over serial (UART)
between two devices (Ubuntu/Linux machine and AOSP Target Device.

From the logs I see that the connection negotiation happens smoothly.
The request/ack is correctly exchanged between the two devices and a
ppp connection is established (ppp0 interface is created.

After about 6secs, there is Modem Hangup on the AOSP target device.
There are exchanges of data where data is sent from the Ubuntu/Linux
device and received on AOSP target device but no data is sent from the
AOSP target device.

I have played around with my options file; adjusting the baud rate,
MTU/MRU, compression is disabled, flow control and behavior settings
etc. But, it did not help with resolving the issue.

The options file for Ubuntu/Linux below:
# UART interface and baud rate
/dev/ttyUSB0 115200

#silent
nolock
kdebug 7

# Do not support ipv6
noipv6

# Flow control and behavior settings
xonxoff                   # Enable software flow control (XON/XOFF)
nodetach                  # Prevents ppd from running in the
backgroud. O/Ps logs to the terminal
debug                     # Enable detailed logging for debugging purposes
nocrtscts                 # Disable hardware flow control (no RTS/CTS
handshaking)
noauth                    # No authentication (open connection)
dump                      # prints out all the option values

# Serial communication settings
local                     # Do not use modem control lines; assume a
direct serial connection

# Compression settings (disable all forms of compression)
noccp                     # Disable CCP (Compression Control Protocol)
nobsdcomp                 # Disable BSD compression
nodeflate                 # Disable Deflate compression
novj                      # Disable Van Jacobson style TCP/IP header compression

# Connection persistence
persist                   # Automatically attempt to keep the
connection alive if it drops

# Transmission Settings
mtu 128                  # Set the Maximum Transmission Unit
mru 128                  # Set the Maximum Receive Unit

# IP addressing and routing settings
nodefaultroute             # Do not add a default route through the
PPP connection
noipdefault              # Do not request a specific IP address from the peer
10.0.0.1:10.0.0.2         # Local IP:Remote IP

# IPCP settings
ipcp-accept-remote        # Accept the IP address provided by the peer
#ipcp-accept-local
maxfail 0

# Link Control Protocol (LCP) settings
lcp-echo-interval 0       # Disable LCP echo requests (used to detect
dead connections)
lcp-echo-failure 0        # Disable LCP echo failure detection

the options file on AOSP Target device
# UART interface and baud rate
/dev/ttyMSM0 115200

kdebug 7

# Do not support ipv6
noipv6

# Flow control and behavior settings
xonxoff                  # Enable software flow control (XON/XOFF)
nodetach          # Prevents ppd from running in the backgroud. O/Ps
logs to the terminal
debug             # Enable detailed logging for debugging purposes
nocrtscts                 # Disable hardware flow control (no RTS/CTS
handshaking)
noauth                    # No authentication (open connection)
dump                      # prints all the option value

# Serial communication settings
local                     # Do not use modem control lines; assume a
direct serial connection
nolock

# Compression settings (disable all forms of compression)
noccp                     # Disable CCP (Compression Control Protocol)
nobsdcomp                 # Disable BSD compression
nodeflate                 # Disable Deflate compression
novj                      # Disable Van Jacobson style TCP/IP header compression

# Connection persistence
persist                   # Automatically attempt to keep the
connection alive if it drops

# Transmission Settings
mtu 128                  # Set the Maximum Transmission Unit
mru 128                  # Set the Maximum Receive Unit

# IP addressing and routing settings
nodefaultroute            # Do not add a default route through the PPP
connection
noipdefault               # Do not request a specific IP address from the peer
10.0.0.2:10.0.0.1   # Local IP : Remote IP

# IPCP settings
ipcp-accept-remote        # Accept the IP address provided by the peer

# Link Control Protocol (LCP) settings
lcp-echo-interval 0       # Disable LCP echo requests (used to detect
dead connections)
lcp-echo-failure 0        # Disable LCP echo failure detectioin

Error Logs on AOSP Target:
using channel 932
Using interface ppp0
Connect: ppp0 <--> /dev/ttyMSM0
sent [LCP ConfReq id=0x3 <mru 128> <asyncmap 0xa0000> <magic
0xc875a15e> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x3 <mru 128> <asyncmap 0xa0000> <magic
0x184ddd9> <pcomp> <accomp>]
sent [LCP ConfAck id=0x3 <mru 128> <asyncmap 0xa0000> <magic
0x184ddd9> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x3 <mru 128> <asyncmap 0xa0000> <magic
0xc875a15e> <pcomp> <accomp>]
sent [IPCP ConfReq id=0x3 <addr 10.0.0.2>]
rcvd [IPCP ConfReq id=0x3 <addr 10.0.0.1>]
sent [IPCP ConfAck id=0x3 <addr 10.0.0.1>]
rcvd [IPCP ConfAck id=0x3 <addr 10.0.0.2>]
local  IP address 10.0.0.2
remote IP address 10.0.0.1
Modem hangup
Connect time 0.1 minutes.
Sent 0 bytes, received 1276 bytes.
Connection terminated.

Any inputs to resolve the issue would be helpful.

Thanks,
Devesh

