Return-Path: <linux-ppp+bounces-436-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL7/EVm9vml4ZgMAu9opvQ
	(envelope-from <linux-ppp+bounces-436-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Sat, 21 Mar 2026 16:46:33 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E31CD2E62EE
	for <lists+linux-ppp@lfdr.de>; Sat, 21 Mar 2026 16:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7818300D468
	for <lists+linux-ppp@lfdr.de>; Sat, 21 Mar 2026 15:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23338394469;
	Sat, 21 Mar 2026 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCiAtjGc"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D172638B14F
	for <linux-ppp@vger.kernel.org>; Sat, 21 Mar 2026 15:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774107985; cv=none; b=cqzLRZ/b4zpMt4EBUYhQfiuro08IJkeyX18yLbQDC5/JSLjORtxaQHXM+RMeeok2t4LfYBOMabmSKFbFThyh7Pf0wUtz4+D+3aM0E/uWe4LmaZuZ5+Bdgik1ba1BwElGFhQULP0FKmDLEPu2wdNlHQAhE8oNMAKa0wmXBbXPPls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774107985; c=relaxed/simple;
	bh=nnxG0eRKYNSthOuI73Ok8N/M8RHRxBwSWGKJ5034GIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=numgudH061NK0QHMkQw/tb6f5DL94qp1D0JVWVCK7zhicx6mEkwlPH6foeS//7g4pzrrWhPgRvbki6B7GiYVwccsElScKwz6Jp5PPaJ6Fb+9AGvH3wsF6rrtxkj3svnPEuL0HvP/QOizHKx1DdTHjFzAZk+OmpP+4nsGhZ445fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCiAtjGc; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so448622766b.2
        for <linux-ppp@vger.kernel.org>; Sat, 21 Mar 2026 08:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774107981; x=1774712781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nu3xcczzSYEf5dCv3Y4BzObcBQU5HeHhrYyNdqsbtPY=;
        b=lCiAtjGc9UbqTNdiQkCNTpmvZkkauayS09yi2Jg3uZirbbJXAFUL+mKDEsi4+RziwN
         f6pWwLF9uxJeHn18Mz/UuyrM5WyPJnmN/FDpBtVyMuQTe+L03fqRH0IdQXBX8M9vxXfw
         gk1MNQlDD9tQ8oqTgJcUkNAE3bbePnnskcnxvxYDDiDsmeqXm8nBTG8nrJ+1UEnpsGok
         fJeyhPcicPyryMUtPGMUuvj6OT/3Rd+TtcVDSuYnPgvywEyt+iKmga/f6RXst/7FUNy/
         S9ohe0YEQ7FB8z/TOsgnKzr5vMlPR52URl7e0LOdRKqCw3Na25VadKxNHFq6pU+/4Y3y
         DjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774107981; x=1774712781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nu3xcczzSYEf5dCv3Y4BzObcBQU5HeHhrYyNdqsbtPY=;
        b=bc3H405IUthPkPvi/RUu1NCHpmI9lpQJ9rkzRcB31t4GijvFBRzK8R4LAN6KS6v5hw
         2rCoiH6/J7ldOC7fDsRYbOzGrFIcCa962ZOti59med9QR5ZiEc4Ty1sgQx0I7+lELExG
         zmw5+2uSqPYgePib8X0PqE3mAQrJgVYn31EcpMpSnYOGnfudlXAP1EWuIQhD++1UZuKA
         Qsiy9tqVxo1Dc73GdpKl2d43sQWxYWD4SGN8JvRRCJ+bVHFPFqvWShOOxXRMe1xqsz+c
         9Q5S7MEAdUD8PbD2M0oDFqL14NFYEdutalxqU4NDR85xEbq1ZVJxaWQsLO/R6+gJQ849
         zabA==
X-Forwarded-Encrypted: i=1; AJvYcCUXwLvtQ09xfBQn16aNALG/K1suXhLC1Gy2hJ6hJJIMXqb3SIzHGxmNSo5z8WUHAYaV6+RLLzDfGh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSKioiJ+XbEJon1CR99VQ/nuqVaKwLSIrF3Aix7eSLDqwaauxB
	zF26N6/aymI1/dvo9xJQRrnx/W8H5N2FDd5BmbvFI1XSj6nfUJyXEyWs
X-Gm-Gg: ATEYQzzYwHmXBuPv6XJ5GuYMKY0NOg+JTeETOLI87hR9/bBZ+HyJSNcu9b6mRCnkel9
	0C2iYKTQXeEOFIb4t/Wp5jZ25LDSA1qaFhwjeY9SYPxxP9XVx6xzUa1ApdBXyHYkPiwFHhrULcR
	gVvHgcywOFJj5ipyddmaifqSik5F4tv2fsm1Ocia4hApcHiKBAA/qAOg3GUNzMPl9NuCjQlW7k4
	cj6V/+m/p5bo+j+W398fs10K9iQ3XbFRlrzZBqXDKKYGpHyI228e67pzoSdkO1R9ah5UJRmkIIG
	4ejRsc+iOS29wox8vT5yJITY1Ef19OHH2p7H1CsBs8ER0P4PofjZqxcULvR/sPWsSS971EyVMfY
	AMo/sN6bTWvXCzmm5KlY6NDJoea6Bsl3DY3ahTNAEabzq4rA8WdOdvDVvyLvvDe1isRHFZRfN
X-Received: by 2002:a17:906:2746:b0:b97:f9c9:af61 with SMTP id a640c23a62f3a-b982f4e922fmr375345266b.45.1774107980894;
        Sat, 21 Mar 2026 08:46:20 -0700 (PDT)
Received: from gmail.com ([2a09:bac1:5500::49b:47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983e4e9b65sm175140266b.31.2026.03.21.08.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 08:46:20 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>
Subject: [PATCH net-next v2] selftests: net: add tests for PPP
Date: Sat, 21 Mar 2026 23:46:15 +0800
Message-ID: <20260321154616.2754-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-436-lists,linux-ppp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-ppp];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E31CD2E62EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add ping and iperf3 tests for ppp_async.c and pppoe.c.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
v2: fix shellcheck and add trailing backslashes.
 - https://lore.kernel.org/netdev/20260320071755.483733-1-dqfext@gmail.com/

 MAINTAINERS                                   |  1 +
 tools/testing/selftests/Makefile              |  1 +
 tools/testing/selftests/net/ppp/Makefile      | 15 +++++++
 tools/testing/selftests/net/ppp/config        |  8 ++++
 tools/testing/selftests/net/ppp/ppp_async.sh  | 37 ++++++++++++++++
 tools/testing/selftests/net/ppp/ppp_common.sh | 42 +++++++++++++++++++
 .../selftests/net/ppp/pppoe-server-options    |  2 +
 tools/testing/selftests/net/ppp/pppoe.sh      | 36 ++++++++++++++++
 8 files changed, 142 insertions(+)
 create mode 100644 tools/testing/selftests/net/ppp/Makefile
 create mode 100644 tools/testing/selftests/net/ppp/config
 create mode 100755 tools/testing/selftests/net/ppp/ppp_async.sh
 create mode 100644 tools/testing/selftests/net/ppp/ppp_common.sh
 create mode 100644 tools/testing/selftests/net/ppp/pppoe-server-options
 create mode 100755 tools/testing/selftests/net/ppp/pppoe.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index a09bf30a057d..d553437d5ac1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21078,6 +21078,7 @@ PPP PROTOCOL DRIVERS AND COMPRESSORS
 L:	linux-ppp@vger.kernel.org
 S:	Orphan
 F:	drivers/net/ppp/ppp_*
+F:	tools/testing/selftests/net/ppp/
 
 PPS SUPPORT
 M:	Rodolfo Giometti <giometti@enneenne.com>
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 450f13ba4cca..65f84e8a0cf0 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -78,6 +78,7 @@ TARGETS += net/netfilter
 TARGETS += net/openvswitch
 TARGETS += net/ovpn
 TARGETS += net/packetdrill
+TARGETS += net/ppp
 TARGETS += net/rds
 TARGETS += net/tcp_ao
 TARGETS += nolibc
diff --git a/tools/testing/selftests/net/ppp/Makefile b/tools/testing/selftests/net/ppp/Makefile
new file mode 100644
index 000000000000..b39b0abadde6
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/Makefile
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+
+top_srcdir = ../../../../..
+
+TEST_PROGS := \
+	ppp_async.sh \
+	pppoe.sh \
+# end of TEST_PROGS
+
+TEST_FILES := \
+	ppp_common.sh \
+	pppoe-server-options \
+# end of TEST_FILES
+
+include ../../lib.mk
diff --git a/tools/testing/selftests/net/ppp/config b/tools/testing/selftests/net/ppp/config
new file mode 100644
index 000000000000..7053aa9d8d74
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/config
@@ -0,0 +1,8 @@
+CONFIG_PACKET=y
+CONFIG_PPP=m
+CONFIG_PPP_ASYNC=m
+CONFIG_PPP_BSDCOMP=m
+CONFIG_PPP_DEFLATE=m
+CONFIG_PPPOE=m
+CONFIG_PPPOE_HASH_BITS_4=y
+CONFIG_TTY=y
diff --git a/tools/testing/selftests/net/ppp/ppp_async.sh b/tools/testing/selftests/net/ppp/ppp_async.sh
new file mode 100755
index 000000000000..5c0eb84945e8
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/ppp_async.sh
@@ -0,0 +1,37 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+source ppp_common.sh
+
+# Temporary files for PTY symlinks
+TTY_SERVER=$(mktemp -u /tmp/ppp_async_server.XXXXXX)
+TTY_CLIENT=$(mktemp -u /tmp/ppp_async_client.XXXXXX)
+
+cleanup() {
+	cleanup_all_ns
+	[ -n "$SOCAT_PID" ] && kill "$SOCAT_PID" 2>/dev/null || true
+}
+
+trap cleanup EXIT
+
+require_command socat
+ppp_common_init
+
+# Create the virtual serial device
+socat -d PTY,link="$TTY_SERVER",rawer PTY,link="$TTY_CLIENT",rawer &
+SOCAT_PID=$!
+
+# Wait for symlinks to be created
+slowwait 5 [ -L "$TTY_SERVER" ]
+
+# Start the PPP Server
+ip netns exec "$NS_SERVER" pppd "$TTY_SERVER" 115200 \
+	"$IP_SERVER":"$IP_CLIENT" \
+	local noauth nodefaultroute debug
+
+# Start the PPP Client
+ip netns exec "$NS_CLIENT" pppd "$TTY_CLIENT" 115200 \
+	local noauth updetach nodefaultroute debug
+
+ppp_test_connectivity
diff --git a/tools/testing/selftests/net/ppp/ppp_common.sh b/tools/testing/selftests/net/ppp/ppp_common.sh
new file mode 100644
index 000000000000..9ddfba0f9a05
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/ppp_common.sh
@@ -0,0 +1,42 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# shellcheck disable=SC2153
+
+source ../lib.sh
+
+IP_SERVER="192.168.200.1"
+IP_CLIENT="192.168.200.2"
+
+ppp_common_init() {
+	# Package requirements
+	require_command pppd
+	require_command iperf3
+
+	# Check for root privileges
+	if [ "$(id -u)" -ne 0 ];then
+		echo "SKIP: Need root privileges"
+		exit $ksft_skip
+	fi
+
+	# Namespaces
+	setup_ns NS_SERVER NS_CLIENT
+}
+
+ppp_check_addr() {
+	dev=$1
+	addr=$2
+	ns=$3
+	ip -netns "$ns" -4 addr show dev "$dev" 2>/dev/null | grep -q "$addr"
+	return $?
+}
+
+ppp_test_connectivity() {
+	slowwait 10 ppp_check_addr "ppp0" "$IP_CLIENT" "$NS_CLIENT"
+
+	ip netns exec "$NS_CLIENT" ping -c 3 "$IP_SERVER"
+
+	ip netns exec "$NS_SERVER" iperf3 -s -1 -D
+	wait_local_port_listen "$NS_SERVER" 5201 tcp
+
+	ip netns exec "$NS_CLIENT" iperf3 -c "$IP_SERVER" -Z -t 2
+}
diff --git a/tools/testing/selftests/net/ppp/pppoe-server-options b/tools/testing/selftests/net/ppp/pppoe-server-options
new file mode 100644
index 000000000000..66c8c9d319e9
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/pppoe-server-options
@@ -0,0 +1,2 @@
+noauth
+noipdefault
diff --git a/tools/testing/selftests/net/ppp/pppoe.sh b/tools/testing/selftests/net/ppp/pppoe.sh
new file mode 100755
index 000000000000..0ebedfe3eabe
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/pppoe.sh
@@ -0,0 +1,36 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+source ppp_common.sh
+
+VETH_SERVER="veth-server"
+VETH_CLIENT="veth-client"
+
+cleanup() {
+	cleanup_all_ns
+}
+
+trap cleanup EXIT
+
+require_command pppoe-server
+ppp_common_init
+
+# Create the veth pair
+ip link add "$VETH_SERVER" type veth peer name "$VETH_CLIENT"
+ip link set "$VETH_SERVER" netns "$NS_SERVER"
+ip link set "$VETH_CLIENT" netns "$NS_CLIENT"
+ip -netns "$NS_SERVER" link set "$VETH_SERVER" up
+ip -netns "$NS_CLIENT" link set "$VETH_CLIENT" up
+
+# Start the PPP Server
+ip netns exec "$NS_SERVER" pppoe-server -I "$VETH_SERVER" \
+	-L "$IP_SERVER" -R "$IP_CLIENT" -N 1 -q "$(command -v pppd)" \
+	-k -O "$(pwd)/pppoe-server-options"
+
+# Start the PPP Client
+ip netns exec "$NS_CLIENT" pppd \
+	local debug updetach noipdefault noauth nodefaultroute \
+	plugin pppoe.so nic-"$VETH_CLIENT"
+
+ppp_test_connectivity
-- 
2.43.0


