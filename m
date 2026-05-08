Return-Path: <linux-ppp+bounces-573-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPGWMh9X/WkYawAAu9opvQ
	(envelope-from <linux-ppp+bounces-573-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 08 May 2026 05:23:11 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 257914F1225
	for <lists+linux-ppp@lfdr.de>; Fri, 08 May 2026 05:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD8203021EA2
	for <lists+linux-ppp@lfdr.de>; Fri,  8 May 2026 03:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612E42F0680;
	Fri,  8 May 2026 03:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="t5zg37wR"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6DE2DECBA
	for <linux-ppp@vger.kernel.org>; Fri,  8 May 2026 03:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778210554; cv=none; b=ueOvkd9Hfo8rTwhtPMPMKfFJrdubtWYsyQQ+jCEq7Y1ZN1cV5s5FI5aj+K4Bf9a+aWDZgJnaE01viQ93RF/rJVQ8R1yB35ZoabI/sL93u0qe8CfTdjwp9IY8xcPI8BF8hHRaiOGiaT7SNgvPyTW+d5OBAmxytW/oW1GkdZvJM1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778210554; c=relaxed/simple;
	bh=cN2NZsPCZ+NPj8HeApyRS2bD0oPy84AtT4tkry2rUeQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=eBd8sqAfbG3NCQeGdE56Fs6/3qiD9+Ezk7qn8xplNHw8HciQMIM0/97MOcM/EPp31K77Uxc6uYoqclKNG3G1yVNqsZl8r+F5sUHH/zF+/+mrKt2ekAT64FvJCcWTnAZRi2EKmYaW5LrPNpGKe82FIsWKtc+aCnE7iKomaLfMzb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=t5zg37wR; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778210537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wqUUL+VHHoIu9SyW+orjOwBUwI3UsHllP1V3Z2CU+IA=;
	b=t5zg37wRIuKTrW/5lg0BSEqNo8L3v4xPjbhoV6bHvRNz13QWylSn8qauXE6+zKHcJSQANp
	jp9luISk18+wxOZRamsdJL0qIOxN4APvOlWAhn1g7RSxImujb3UBWwwUkTiEh17p2EdHFo
	VZuhgjVWaiaFj1sMAxKLx/fSdmwjk+I=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Felix Maurer <fmaurer@redhat.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Petr Machata <petrm@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next] selftests: net: add tests for PPPoL2TP
Date: Fri,  8 May 2026 11:21:49 +0800
Message-ID: <20260508032158.67887-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 257914F1225
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-573-lists,linux-ppp=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email,linux.dev:mid,linux.dev:dkim,ppp_common.sh:url,pppol2tp.sh:url]
X-Rspamd-Action: no action

Add ping, iperf3, and recursion tests for PPPoL2TP.

Assisted-by: Gemini:gemini-3-flash
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 tools/testing/selftests/net/ppp/Makefile    |  1 +
 tools/testing/selftests/net/ppp/config      |  3 +
 tools/testing/selftests/net/ppp/pppol2tp.sh | 93 +++++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100755 tools/testing/selftests/net/ppp/pppol2tp.sh

diff --git a/tools/testing/selftests/net/ppp/Makefile b/tools/testing/selftests/net/ppp/Makefile
index b39b0abadde6..6036fa134351 100644
--- a/tools/testing/selftests/net/ppp/Makefile
+++ b/tools/testing/selftests/net/ppp/Makefile
@@ -5,6 +5,7 @@ top_srcdir = ../../../../..
 TEST_PROGS := \
 	ppp_async.sh \
 	pppoe.sh \
+	pppol2tp.sh \
 # end of TEST_PROGS
 
 TEST_FILES := \
diff --git a/tools/testing/selftests/net/ppp/config b/tools/testing/selftests/net/ppp/config
index b45d25c5b970..8bc3b7c33d5c 100644
--- a/tools/testing/selftests/net/ppp/config
+++ b/tools/testing/selftests/net/ppp/config
@@ -1,4 +1,6 @@
 CONFIG_IPV6=y
+CONFIG_L2TP=m
+CONFIG_NETKIT=y
 CONFIG_PACKET=y
 CONFIG_PPP=m
 CONFIG_PPP_ASYNC=m
@@ -6,4 +8,5 @@ CONFIG_PPP_BSDCOMP=m
 CONFIG_PPP_DEFLATE=m
 CONFIG_PPPOE=m
 CONFIG_PPPOE_HASH_BITS_4=y
+CONFIG_PPPOL2TP=m
 CONFIG_VETH=y
diff --git a/tools/testing/selftests/net/ppp/pppol2tp.sh b/tools/testing/selftests/net/ppp/pppol2tp.sh
new file mode 100755
index 000000000000..5ddcc6c41c33
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/pppol2tp.sh
@@ -0,0 +1,93 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+source ppp_common.sh
+
+NK_SERVER="nk0"
+NK_CLIENT="nk1"
+OUTER_IP_SERVER="172.16.1.1"
+OUTER_IP_CLIENT="172.16.1.2"
+
+PPPOL2TP_DIR=$(mktemp -d /tmp/pppol2tp.XXXXXX)
+
+# shellcheck disable=SC2329
+cleanup() {
+	cleanup_all_ns
+	rm -rf "$PPPOL2TP_DIR"
+}
+
+trap cleanup EXIT
+
+require_command xl2tpd
+ppp_common_init
+modprobe -q l2tp_ppp
+
+# Create the netkit pair
+ip -netns "$NS_CLIENT" link add "$NK_CLIENT" type netkit
+ip -netns "$NS_CLIENT" link set "$NK_SERVER" netns "$NS_SERVER"
+ip -netns "$NS_SERVER" link set "$NK_SERVER" up
+ip -netns "$NS_CLIENT" link set "$NK_CLIENT" up
+ip -netns "$NS_SERVER" address add dev "$NK_SERVER" "$OUTER_IP_SERVER" peer "$OUTER_IP_CLIENT"
+ip -netns "$NS_CLIENT" address add dev "$NK_CLIENT" "$OUTER_IP_CLIENT" peer "$OUTER_IP_SERVER"
+
+# Generate configuration files
+cat > "$PPPOL2TP_DIR/l2tp-server.conf" <<EOF
+[global]
+listen-addr = $OUTER_IP_SERVER
+access control = no
+
+[lns default]
+ip range = $IP_CLIENT
+local ip = $IP_SERVER
+require authentication = no
+require chap = no
+require pap = no
+ppp debug = yes
+pppoptfile = $(pwd)/pppoe-server-options
+EOF
+
+cat > "$PPPOL2TP_DIR/l2tp-client.conf" <<EOF
+[global]
+listen-addr = $OUTER_IP_CLIENT
+access control = no
+
+[lac server]
+lns = $OUTER_IP_SERVER
+require authentication = no
+require chap = no
+require pap = no
+ppp debug = yes
+pppoptfile = $(pwd)/pppoe-server-options
+EOF
+
+# Start the L2TP Server
+ip netns exec "$NS_SERVER" xl2tpd -D -c "$PPPOL2TP_DIR/l2tp-server.conf" \
+	-p "$PPPOL2TP_DIR/l2tp-server.pid" -C "$PPPOL2TP_DIR/l2tp-server.control" &
+
+# Start the L2TP Client
+ip netns exec "$NS_CLIENT" xl2tpd -D -c "$PPPOL2TP_DIR/l2tp-client.conf" \
+	-p "$PPPOL2TP_DIR/l2tp-client.pid" -C "$PPPOL2TP_DIR/l2tp-client.control" &
+
+# Wait for xl2tpd to start and open their control pipes
+slowwait 2 [ -p "$PPPOL2TP_DIR/l2tp-server.control" ]
+slowwait 2 [ -p "$PPPOL2TP_DIR/l2tp-client.control" ]
+
+# Connect LAC to LNS
+echo "c server" > "$PPPOL2TP_DIR/l2tp-client.control"
+
+ppp_test_connectivity
+
+log_test "PPPoL2TP"
+
+# Recursion test
+# Delete route to LNS IP
+ip -netns "$NS_CLIENT" route del "$OUTER_IP_SERVER"
+# Add default route through ppp0
+ip -netns "$NS_CLIENT" route add default dev ppp0
+# ping (we expect the ping to fail but not deadlock the system)
+ip netns exec "$NS_CLIENT" ping -c 1 "$IP_SERVER" -w 1
+check_fail $?
+
+log_test "PPPoL2TP Recursion"
+
+exit "$EXIT_STATUS"
-- 
2.43.0


