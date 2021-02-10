Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F34773161FE
	for <lists+linux-ppp@lfdr.de>; Wed, 10 Feb 2021 10:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhBJJUi (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Wed, 10 Feb 2021 04:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbhBJJSf (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 10 Feb 2021 04:18:35 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D860C0613D6
        for <linux-ppp@vger.kernel.org>; Wed, 10 Feb 2021 01:17:55 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id j11so1174638wmi.3
        for <linux-ppp@vger.kernel.org>; Wed, 10 Feb 2021 01:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=fAmFaeJdYddN8+IxQq10tjVnaEo20jL+JdTm3AgDqRA=;
        b=kmAhJARNNymnN6yD+z3q6HXCHHZhlAsYXHO8PicUOURwt7v30sI4GzKZle/178aatL
         DAKCOVsceao+tIEuSniR+qkOb6FYbPFT7p2aHvAOkuC1BSFtdIZ4zuGxV6fMJLwbyTQ7
         OT6DTjbUrJmXS017ZArZtoHLc6vL2XIFBevDxd5pLjKP6Xq42jz+whw7/XMgCRFcTYQP
         L1fao7fco2MXSE9/6UYzOdUjyubeLBPYONBWWNfgK1jQhQrHa633j9u9VQeNZRwEANRz
         ej5/+boomIAz3ek88an5hBwTykxmGAL6QKxHZZlZVeIhA41zaqE7mrSZH119snqiYhqC
         QfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=fAmFaeJdYddN8+IxQq10tjVnaEo20jL+JdTm3AgDqRA=;
        b=Ej2EncRhg7IMkOMpbPxVLlYr2ENbxE08iQy+OUze/K2C4L3X+bXDtI+sPCI8A57gOt
         tjVO/NiWghswdjVW8wVXmzuEM+9p963eroqXflaHl8QbattHhAqbPFzm6UY2/iBivYsz
         jsli1tDcKTQAR6jKUKFsekFx0ME+Bnq7bW1zmoyExP/yW2Qi2Q58dFqZisgo7IeknwnM
         nozR1L6wZ+e2BFIaL0Tne9COjVLGjbHVr5ZGc5uVtSE+QFK2wUIQ5yH3//rqP2R/GBNV
         CZmQXNwIZ/4S2gff4HdEqu7ubJ72Q/HE6UfeeETDvCRzXghXdqIK2WUF8aVJT8XLgfO5
         anFg==
X-Gm-Message-State: AOAM531ZGSBswn4poS5k4Q2+dOwqs6+64VZq/5rbDZYtFXfrF6hE1O/+
        TyGPYb3V6dRNTm3Ns/PERW21nKrPebo=
X-Google-Smtp-Source: ABdhPJyxQbUufNtQsFtjTU/jz1UTSODsCJQbT6snz/+3NciH8eNCXIC1hoRQRY/8b8aMl0MiY0qUPg==
X-Received: by 2002:a05:600c:4788:: with SMTP id k8mr2018959wmo.138.1612948673679;
        Wed, 10 Feb 2021 01:17:53 -0800 (PST)
Received: from w530 (p57a68e42.dip0.t-ipconnect.de. [87.166.142.66])
        by smtp.gmail.com with ESMTPSA id z1sm2005883wru.70.2021.02.10.01.17.53
        for <linux-ppp@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 01:17:53 -0800 (PST)
Date:   Wed, 10 Feb 2021 10:17:40 +0100
From:   =?UTF-8?B?QmrDtnJu?= Kirchner <bjkit89@gmail.com>
To:     linux-ppp@vger.kernel.org
Subject: Problem with M2M PPP connection
Message-ID: <20210210101740.1bae8b93@w530>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Dear list readers,

I am stuck with the following problem and I hope you can give me some
hints or advice. It looks to me like a configuration or routing error.

I have an Olimex NB-IoT-DevKit with a Quectel BC66 LTE-NB1 chip which
is connected to a RaspberryPI 3B+ via UART connection. I try to make a
connection via PPP protocol to the ISP, but that is only =E2=80=9Chalf=E2=
=80=9D
working. The LTE modem can dial to the ISP and gets a connection. Both
sides exchange LCP configuration messages and IPCP configuration
messages. I receive the private static IP address assigned to the SIM
card and I also retrieve an IP address for the remote side. The ppp0
interface comes up and is configured with the private static IP address
and the P-t-P=E2=80=99s address. My problem is, that I cannot reach anything
via that connection. I cannot ping the P-t-P, I cannot ping other
addresses. The ISP=E2=80=99s support confirmed that PPP was a viable option=
 to
connect and they told me to try the SIM card in a smartphone and to
ping 8.8.8.8, so I put the SIM card in an old Android tablet with a SIM
card slot and it connected to the remote and I could ping 8.8.8.8
successfully. The only surprising thing I noticed was the fact that the
ifconfig command for the dial-up interface on the Android tablet didn=E2=80=
=99t
have a P-t-P remote peer.

Apparently the LTE modem is working and the SIM seems to work, too. So
I am afraid that I did something wrong with the PPPD configuration.

I used pppd version 2.4.7 and the latest version from git=E2=80=99s master
branch (5191399f5266bb595f03f5c4fee13153092e2baf). The problem is the
same with both versions.

Output from pppd (git version):
/root/sandbox/pppd/sbin/pppd call quectel-ppp
root@raspberrypi:/etc/ppp/peers# /root/sandbox/pppd/sbin/pppd call quectel-=
ppp
pppd options in effect:
debug           # (from /etc/ppp/peers/quectel-ppp)
nodetach                # (from /etc/ppp/peers/quectel-ppp)
ktune           # (from /etc/ppp/peers/quectel-ppp)
dump            # (from /etc/ppp/peers/quectel-ppp)
noauth          # (from /etc/ppp/peers/quectel-ppp)
refuse-chap             # (from /etc/ppp/peers/quectel-ppp)
refuse-mschap           # (from /etc/ppp/peers/quectel-ppp)
refuse-mschap-v2                # (from /etc/ppp/peers/quectel-ppp)
refuse-eap              # (from /etc/ppp/peers/quectel-ppp)
user *          # (from /etc/ppp/peers/quectel-ppp)
password ??????         # (from /etc/ppp/peers/quectel-ppp)
remotename 3gppp                # (from /etc/ppp/peers/quectel-ppp)
/dev/ttyS0              # (from /etc/ppp/peers/quectel-ppp)
115200          # (from /etc/ppp/peers/quectel-ppp)
lock            # (from /etc/ppp/peers/quectel-ppp)
connect /root/sandbox/pppd/sbin/chat -E -s -v -f /etc/chatscripts/quectel-c=
hat-connect          # (from /etc/ppp/peers/quectel-ppp)
disconnect /root/sandbox/pppd/sbin/chat -E -s -v -f /etc/chatscripts/quecte=
l-chat-disconnect            # (from /etc/ppp/peers/quectel-ppp)
record /tmp/quectel.record              # (from /etc/ppp/peers/quectel-ppp)
nocdtrcts               # (from /etc/ppp/peers/quectel-ppp)
local           # (from /etc/ppp/peers/quectel-ppp)
noaccomp                # (from /etc/ppp/peers/quectel-ppp)
nopcomp         # (from /etc/ppp/peers/quectel-ppp)
passive         # (from /etc/ppp/peers/quectel-ppp)
hide-password           # (from /etc/ppp/peers/quectel-ppp)
novj            # (from /etc/ppp/peers/quectel-ppp)
novjccomp               # (from /etc/ppp/peers/quectel-ppp)
ipcp-accept-local               # (from /etc/ppp/peers/quectel-ppp)
ipcp-accept-remote              # (from /etc/ppp/peers/quectel-ppp)
ipparam 3gppp           # (from /etc/ppp/peers/quectel-ppp)
noipdefault             # (from /etc/ppp/peers/quectel-ppp)
nodefaultroute          # (from /etc/ppp/peers/quectel-ppp)
noremoteip              # (from /etc/ppp/peers/quectel-ppp)
noipv6          # (from /etc/ppp/peers/quectel-ppp)
noccp           # (from /etc/ppp/peers/quectel-ppp)
nobsdcomp               # (from /etc/ppp/peers/quectel-ppp)
nopredictor1            # (from /etc/ppp/peers/quectel-ppp)
abort on (BUSY)
abort on (NO CARRIER)
abort on (NO DIALTONE)
abort on (ERROR)
abort on (NO ANSWER)
timeout set to 120 seconds
send (AT^M)
expect (OK)
AT^M^M
OK
 -- got it

send (ATE0^M)
expect (OK)
^M
ATE0^M^M
OK
 -- got it

send (ATI^M)
expect (OK)
^M
^M
Quectel_Ltd^M
Quectel_BC66^M
Revision: BC66NBR01A10^M
^M
OK
 -- got it

send (AT+CSQ^M)
expect (OK)
^M
^M
+CSQ: 8,0^M
^M
OK
 -- got it

send (AT+CPIN?^M)
expect (OK)
^M
^M
+CPIN: READY^M
^M
OK
 -- got it

send (AT+COPS?^M)
expect (OK)
^M
^M
+COPS: 0,2,"26201",9^M
^M
OK
 -- got it

send (AT+CGREG?^M)
expect (OK)
^M
^M
+CGREG: 0,5^M
^M
OK
 -- got it

send (ATZ^M)
expect (OK)
^M
^M
OK
 -- got it

send (AT+CGDCONT=3D1,"IP","iot.1nce.net",,0,0^M)
expect (OK)
^M
AT+CGDCONT=3D1,"IP","iot.1nce.net",,0,0^M^M
OK
 -- got it

send (ATDT*99#^M)
expect (CONNECT)
^M
ATDT*99#^M^M
CONNECT
 -- got it

Script /root/sandbox/pppd/sbin/chat -E -s -v -f /etc/chatscripts/quectel-ch=
at-connect finished (pid 671), status =3D 0x0
Serial connection established.
using channel 2
Using interface ppp0
Connect: ppp0 <--> /dev/pts/3
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xd514deb5>]
rcvd [LCP ConfReq id=3D0x1 <mru 1600> <magic 0x85704a90> <asyncmap 0x0> <pc=
omp> <accomp>]
sent [LCP ConfRej id=3D0x1 <pcomp> <accomp>]
rcvd [LCP ConfAck id=3D0x1 <asyncmap 0x0> <magic 0xd514deb5>]
rcvd [LCP ConfReq id=3D0x2 <mru 1600> <magic 0x85704a90> <asyncmap 0x0>]
sent [LCP ConfAck id=3D0x2 <mru 1600> <magic 0x85704a90> <asyncmap 0x0>]
sent [IPCP ConfReq id=3D0x1 <addr 0.0.0.0>]
rcvd [IPCP ConfNak id=3D0x1 <addr 10.43.124.1>]
sent [IPCP ConfReq id=3D0x2 <addr 10.43.124.1>]
rcvd [IPCP ConfReq id=3D0x1 <addr 10.0.0.1>]
sent [IPCP ConfAck id=3D0x1 <addr 10.0.0.1>]
rcvd [IPCP ConfAck id=3D0x2 <addr 10.43.124.1>]
local  IP address 10.43.124.1
remote IP address 10.0.0.1
Script /etc/ppp/ip-up started (pid 677)
Script /etc/ppp/ip-up finished (pid 677), status =3D 0x0
Terminating on signal 2
Connect time 14.3 minutes.
Sent 3152 bytes, received 0 bytes.
Script /etc/ppp/ip-down started (pid 710)
sent [LCP TermReq id=3D0x2 "User request"]
Script /etc/ppp/ip-down finished (pid 710), status =3D 0x0
sent [LCP TermReq id=3D0x3 "User request"]
Connection terminated.
abort on (ERROR)
abort on (NO DIALTONE)
\send (+++ATH^M)

Good bye
Script /root/sandbox/pppd/sbin/chat -E -s -v -f /etc/chatscripts/quectel-ch=
at-disconnect finished (pid 731), status =3D 0x0
Serial link disconnected.
Modem hangup
Waiting for 1 child processes...
  script pppd (charshunt), pid 670
Child process pppd (charshunt) (pid 670) terminated with signal 15

Peer file /etc/ppp/peers/quectel-ppp:
#/etc/ppp/peers/quectel-ppp=20
# Usage:root>pppd call quectel-ppp=20
# Hide password in debug messages=20
hide-password=20
# The phone is not required to authenticate=20
noauth=20
# The chat script=20
connect '/root/sandbox/pppd/sbin/chat -E -s -v
-f /etc/chatscripts/quectel-chat- connect'=20
# The close script=20
disconnect '/root/sandbox/pppd/sbin/chat -E -s -v
-f /etc/chatscripts/quectel-ch at-disconnect'=20
# Debug info from pppd=20
debug=20
# Serial Device to which the HSPDA phone is connected=20
# Modem path, like /dev/ttyUSB3,/dev/ttyACM0, it depends on your
module. # Exmaple given is with the modem mounted at /dev/ttyUSB3=20
/dev/ttyS0=20
# Serial port line speed=20
115200=20
# If you want to use the HSDPA link as your gateway=20
nodefaultroute=20
# pppd must not propose any IP address to the peer=20
noipdefault=20
# No ppp compression=20
novj=20
novjccomp=20
noccp=20
nobsdcomp=20
noaccomp=20
ktune=20
#nomppe=20
#nomppe-40=20
#nomppe-128=20
#nompshortseq=20
#nomultilink=20
nopcomp=20
nopredictor1=20
noremoteip=20
ipcp-accept-local=20
ipcp-accept-remote=20
refuse-chap=20
refuse-mschap=20
refuse-mschap-v2=20
refuse-eap=20
local=20
nocrtscts=20
nocdtrcts=20
# For sanity, keep a lock on the serial line=20
lock=20
dump=20
# Keep pppd attached to the terminal=20
# Comment this to get daemon mode pppd=20
nodetach=20
# Network access credenatials. =C2=A0
# Set LTE_USERNAME and LTE_PASSWORD before executing pppd -C call=20
# Check with service provider for required details=20
user *=20
password *=20
remotename 3gppp=20
ipparam 3gppp=20
record /tmp/quectel.record=20
passive=20
noipv6

File /etc/chatscripts/quectel-chat-connect
ABORT "BUSY"=20
ABORT "NO CARRIER"=20
ABORT "NO DIALTONE"=20
ABORT "ERROR"=20
ABORT "NO ANSWER"=20
TIMEOUT 120=20
"" AT=20
OK ATE0=20
OK ATI=20
OK AT+CSQ=20
OK AT+CPIN?=20
OK AT+COPS?=20
OK AT+CGREG?=20
OK ATZ=20
# Connection to the network=20
# Set LTE_APN variable before executing chat -E ...=20
# Check with service provider for required details=20
OK AT+CGDCONT=3D1,"IP","iot.1nce.net",,0,0=20
# Dial the number=20
OK ATDT*99#=20
CONNECT


File /etc/chatscripts/quectel-chat-disconnect:
ABORT "ERROR"=20
ABORT "NO DIALTONE"=20
SAY "\NSending break to the modem\n"=20
"" +++ATH=20
SAY "\nGood bye\n"


Some information about the linux system:
cat /proc/version=20
Linux version 5.10.11-v7+ (dom@buildbot) (arm-linux-gnueabihf-gcc-8
(Ubuntu/Linaro 8.4.0-3ubuntu1) 8.4.0, GNU ld (GNU Binutils for Ubuntu)
2.34) #1399 SMP Thu Jan 28 12:06:05 GMT 2021


cat /etc/os-release=20
PRETTY_NAME=3D"Raspbian GNU/Linux 10 (buster)"
NAME=3D"Raspbian GNU/Linux"
VERSION_ID=3D"10"
VERSION=3D"10 (buster)"
VERSION_CODENAME=3Dbuster
ID=3Draspbian
ID_LIKE=3Ddebian
HOME_URL=3D"http://www.raspbian.org/"
SUPPORT_URL=3D"http://www.raspbian.org/RaspbianForums"
BUG_REPORT_URL=3D"http://www.raspbian.org/RaspbianBugs"


I manually removed the ethernet default route and added a new default
route to the ppp0 device: root@raspberrypi:~# route del default
root@raspberrypi:~# route add default ppp0      =20
root@raspberrypi:~# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface 0.0.0.0         0.0.0.0         0.0.0.0         U     0
0        0 ppp0 10.0.0.1        0.0.0.0         255.255.255.255 UH
0      0        0 ppp0 192.168.2.0     0.0.0.0         255.255.255.0
U     202    0        0 eth0

Output from ifconfig ppp0:
root@raspberrypi:~# ifconfig ppp0
ppp0: flags=3D4305<UP,POINTOPOINT,RUNNING,NOARP,MULTICAST>  mtu 1500
        inet 10.43.124.1  netmask 255.255.255.255  destination 10.0.0.1
        ppp  txqueuelen 3  (Point-to-Point Protocol)
        RX packets 3  bytes 30 (30.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 3  bytes 30 (30.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0


If you need more information I am eager to provide those. Do you have any
suggestions how to be able to receive the hosts on the "other" side?


Best regards,

Bj=C3=B6rn
